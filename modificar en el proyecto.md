Cambiar en ReportController:

static fn() => array_combine(        $years = range((int) date('Y'), 1900, -1),        $years    )



Modificar en los archivos que utilizan $this->organisations y le envio 'Library o 'Institution' , modificar en el trait: RequestsByIntervalTableTrait

```
if ($this instanceof InstitutionReportInterface) {
        $qb->setParameter(
            'organisations',
            array_map(static fn($lib) => (int) $lib->getId(), $this->getLibraries()),
            ArrayParameterType::INTEGER
        );
    } elseif ($this instanceof LibraryReportInterface) {
        $qb->setParameter(
            'organisations',
            [(int) $this->getLibrary()->getId()],
            ArrayParameterType::INTEGER
        );
    } else {
        throw new \LogicException(
            sprintf('"%s" must implement LibraryReportInterface or InstitutionReportInterface', static::class)
        );
    }
```

Modificar los archivos:

EN el controlador ReportController.php

```php
#[Route('/c17/reports/report/{type}/{prefix}/{id}/download', name: 'app_c17_reports_report_download', requirements: ['type' => 'csi|institution|library'])]
public function download(
    string $type,
    string $prefix,
    string $id,
    Request $request,
    LibraryInterface $library,
): Response {
    $reportKey = $this->getReportKey($type, $prefix, $id);
    if (!$this->tableReportsLocator->has($reportKey)) {
        throw $this->createNotFoundException();
    }

    /** @var TableReportInterface $report */
    $report = $this->tableReportsLocator->get($reportKey);

    if ($report instanceof LibraryReportInterface) {
        $report->setLibrary($library);
    } elseif ($report instanceof InstitutionReportInterface) {
        $report->setLibraries($library->getInstitution()->getLibraries()->getValues());
    }

    // Reutiliza el mismo método privado
    $form = $this->createReportFormIfAvailable($report);
    if ($form) {
        $form->handleRequest($request);
        if ($form->isSubmitted() && !$form->isValid()) {
            throw new BadRequestHttpException();
        }
    }

    $headers = $report->getHeaders();

    return new StreamedResponse(
        static function () use ($report, $headers): void {
            $outputStream = fopen('php://output', 'w');

            $csvWriter = Writer::from($outputStream);
            $csvWriter->setDelimiter(';');
            $csvWriter->addFormatter(
                (new CharsetConverter())->inputEncoding('utf-8')->outputEncoding('iso-8859-15')
            );
            $csvWriter->setEscape('');

            $csvWriter->insertOne(array_values($headers));

            $batchSize = 500;
            $offset = 0;

            do {
                $pageReference = new PageReference((string) $offset, $batchSize);
                $page = $report->getData($pageReference);

                $count = 0;
                foreach ($page->getItems() as $row) {
                    $csvWriter->insertOne(
                        array_map(fn(string $field) => $row[$field] ?? '', array_keys($headers))
                    );
                    ++$count;
                }

                $offset += $count;
            } while ($count === $batchSize);
        },
        200,
        [
            'Content-Type' => 'text/csv',
            'Content-Disposition' => sprintf(
                'attachment; filename="%s.csv"',
                $report->getFileBasename()
            ),
        ]
    );
}
```

Lo más importante aquí es que **el formulario no se duplica**: `createReportFormIfAvailable` ya está en el mismo controlador y ambas acciones lo llaman. No hay que extraerlo ni refactorizarlo.

El flujo desde el template sería simplemente apuntar el botón de descarga a la nueva ruta con los mismos parámetros GET que ya tiene la URL del listado:

```twig
<a href="{{ path('app_c17_reports_report_download', {
    type: type,
    prefix: prefix,
    id: id
}) }}?{{ app.request.queryString }}">
    Descargar
</a>
```

Así los filtros del formulario (fechas, biblioteca, etc.) viajan en el query string y el método `handleRequest` los recoge igual que en el listado, sin necesidad de sesión ni de pasar nada extra.