# Las actualizaciones de plataforma de Lifecycle Controller arrojan errores desde los repositorios en línea de Dell

|      | EspañolČeskyDanskDeutschEnglishSuomiFrançaisItaliano日本語한국어NederlandsNorskPolskiPortuguêsРусскийSvenskaTürkçe简体中文 |
| ---- | ------------------------------------------------------------ |
|      |                                                              |

------

En el siguiente artículo, se brinda información en relación con la falla en las interfaces de usuario (UI) de Lifecycle Controller para descargar archivos de los repositorios en línea de Dell EMC


Tabla de contenido

1. [Descripción](https://www.dell.com/support/article/es-es/sln316878/las-actualizaciones-de-plataforma-de-lifecycle-controller-arrojan-errores-desde-los-repositorios-en-línea-de-dell?lang=es#Description)
2. [Solución](https://www.dell.com/support/article/es-es/sln316878/las-actualizaciones-de-plataforma-de-lifecycle-controller-arrojan-errores-desde-los-repositorios-en-línea-de-dell?lang=es#Solution)
3. [Conexión al repositorio en línea de Dell a través de HTTPS](https://www.dell.com/support/article/es-es/sln316878/las-actualizaciones-de-plataforma-de-lifecycle-controller-arrojan-errores-desde-los-repositorios-en-línea-de-dell?lang=es#ConnectingtoDellOnlineRepositorythroughHTTPS)

------

### Descripción


Las interfaces de usuario (UI) de Lifecycle Controller no pueden descargar archivos desde los repositorios en línea de Dell EMC, independientemente del protocolo de red que defina un usuario.

Dell EMC **retiró** [ftp.dell.com](ftp://ftp.dell.com/) y realizó una transición a un único sitio global de descargas con repositorios alojados a nivel regional.

Dell EMC ofrece una sola ubicación de repositorio con soporte para protocolos especificados:

- [downloads.dell.com](https://downloads.dell.com/) (HTTP | HTTPS)

Se detectó un problema relacionado con esta transición que limitaba las descargas a través de la interfaz de usuario de Lifecycle Controller.


#### Indicios:

#### Problemas con el protocolo FTP:

Cuando se intenta aprovechar el catálogo en línea de Dell EMC desde [ftp.dell.com](ftp://ftp.dell.com/), en la UI de Lifecycle Controller se descargará correctamente el archivo de catálogo y se indicarán las actualizaciones correspondientes. Cuando el operador selecciona las actualizaciones que se desea aplicar, la descarga del archivo arroja un error.

Lifecycle Controller informa el error crítico “No se pueden instalar los paquetes de actualización. (SUP0531)” después de intentar aplicar una actualización a través de la interfaz de Lifecycle Controller.


<img src="https://kbimg.dell.com/library/KB/DELL_ORGANIZATIONAL_GROUPS/DELL_GLOBAL/image(9871).png" alt="No se pueden instalar los paquetes de actualización (SUP0531)" style="zoom:50%;" />

**Figura 1:** No se pueden instalar los paquetes de actualización (SUP0531)

Cuando se intenta utilizar el catálogo en línea de Dell EMC desde [downloads.dell.com](https://downloads.dell.com/), la interfaz de usuario de Lifecycle Controller no descargará el archivo de catálogo. **No se admite el protocolo FTP** en esa fuente de repositorio.


#### Problemas con el protocolo HTTP/HTTPS:

Cuando se intenta acceder a cualquier repositorio en línea de Dell EMC, Lifecycle Controller informa el error crítico “No se puede conectar al recurso compartido de red. (SWC006)” después de que se intentó la descarga del catálogo a través de la interfaz de Lifecycle Controller.

<img src="https://kbimg.dell.com/library/KB/DELL_ORGANIZATIONAL_GROUPS/DELL_GLOBAL/image(9872).png" alt="Fig. 2: No se puede conectar al recurso compartido de red (SWC0066)." style="zoom:50%;" />

**Figura 2:** No se puede conectar al recurso compartido de red (SWC0066)


El departamento de ingeniería de Lifecycle Controller de Dell EMC está al tanto de este problema y está trabajando en una solución para este comportamiento. Cuando haya disponible un código actualizado de iDRAC/Lifecycle Controller, **deberá aplicar una actualización a iDRAC para resolver el problema.**

La solución que se detalla a continuación tiene dos opciones para obtener una solución alternativa.

------

### Solución

#### Opción 1:

Aproveche una de las siguientes soluciones alternativas para aplicar las últimas actualizaciones de la plataforma.

- Descargue la imagen ISO más reciente de la utilidad de actualización del servidor Dell EMC. Desde el Asistente de actualización de firmware de Lifecycle Controller F10, seleccione la unidad local y dirija al asistente a los contenidos de la imagen ISO.
- Descargue e inicie el [ISO de arranque de plataforma específica](https://www.dell.com/support/article/SLN296511/es) más reciente 

#### Opción 2:

Todo el software de administración de sistemas migrará para consumir archivos de catálogo y Dell Update Packages desde [downloads.dell.com](https://downloads.dell.com/) explícitamente a través del protocolo HTTPS. El sitio del repositorio [Downloads.dell.com](https://downloads.dell.com/) estará restringido a protocolos HTTPS y no será compatible con protocolos **FTP/HTTP** para el acceso. El equipo de ingeniería de Dell EMC recomienda que los usuarios comiencen a aprovechar el protocolo **HTTPS** desde el repositorio en línea en [downloads.dell.com](https://downloads.dell.com/) una vez que se apliquen las versiones destacadas de iDRAC a sus servidores.

**Servidores PowerEdge 14G (iDRAC9):** se agregó soporte de descarga HTTPS a las interfaces de actualización de iDRAC/Lifecycle Controller en la **[versión de firmware 3.30.30.30 de iDRAC9](https://www.dell.com/support/article/sln308699/idrac9-versions-and-release-notes).**
**[La versión de firmware 3.34.34.34 de iDRAC9](https://www.dell.com/support/article/sln308699/idrac9-versions-and-release-notes)** corregirá los problemas de conexión a los repositorios en línea de Dell.
El equipo de ingeniería de Dell EMC aconseja que los usuarios aprovechen el protocolo https y se dirijan a downloads.dell.com para acceder al catálogo en línea

**Servidores PowerEdge 13G (iDRAC8):** se agregará soporte de descarga HTTPS a las interfaces de actualización de iDRAC/Lifecycle Controller en la **[versión de firmware 2.63.60.61 de iDRAC8](https://www.dell.com/support/home/drivers/driversdetails?driverid=40t1c).**
El equipo de ingeniería de Dell EMC aconseja que los usuarios aprovechen el protocolo https y se dirijan a downloads.dell.com para acceder al catálogo en línea.

**Servidores PowerEdge 12G (iDRAC7):** se agregará soporte de descarga HTTPS a las interfaces de actualización de iDRAC/Lifecycle Controller en la **[versión de firmware 2.63.60.62 de iDRAC7](https://www.dell.com/support/driver/DriversDetails?productCode=poweredge-r420&driverId=T35W2).**
El equipo de ingeniería de Dell EMC aconseja que los usuarios aprovechen el protocolo https y se dirijan a downloads.dell.com para acceder al catálogo en línea.

**Servidores PowerEdge 11G (iDRAC6):** no se agregará soporte de descarga HTTPS a las interfaces de actualización de iDRAC/Lifecycle Controller. Este producto ha llegado al final del desarrollo de ingeniería.

Nota: Los servidores PowerEdge 11G con iDRAC6 no serán compatibles con las últimas actualizaciones de la plataforma mediante interfaces fuera de banda. Para aplicar las actualizaciones más recientes en servidores 11G heredados, se deberán aprovechar métodos de actualización en banda.

------

### Conexión al repositorio en línea de Dell a través de HTTPS

Una vez que los servidores PowerEdge afectados se actualicen a una versión de iDRAC que sea compatible con el protocolo HTTPS en el Asistente de actualización de Lifecycle Controller, se pueden aprovechar los siguientes pasos para conectarse al repositorio en línea de Dell a través de conexiones HTTPS seguras.

**Paso 1: seleccione Update Repository: Network Share (CIFS, NFS, HTTP o servidor HTTPS)**

<img src="https://kbimg.dell.com/library/KB/DELL_ORGANIZATIONAL_GROUPS/DELL_GLOBAL/image(15070).png" alt="img" style="zoom:50%;" />
**Figura 3:** Página de actualización de firmware, selección del repositorio de actualización 

**Paso 2: ingrese a Access Details: HTTPS: Share Name: downloads.dell.com**

<img src="https://kbimg.dell.com/library/KB/DELL_ORGANIZATIONAL_GROUPS/DELL_GLOBAL/image(15071).png" alt="img" style="zoom:50%;" />

**Paso 3: seleccione Updates y Apply**

#### 1. Diríjase al [sitio de soporte de Dell](https://support.dell.com/).

\2. Ingrese la etiqueta de servicio o seleccione el modelo de forma manual.

\3. Acceda al menú "Drivers and Downloads" (Controladores y descargas)

\4. Seleccione iDRAC en el menú desplegable Category (Categoría).

\5. Ubique y descargue la última actualización del iDRAC con controlador del ciclo de vida útil.

\6. Cargue este archivo en la sección de actualización y reversión del iDRAC para actualizar el firmware del iDRAC (se requerirá reiniciar el iDRAC).

Para obtener más información acerca de cómo actualizar el iDRAC, consulte [¿Cómo puedo realizar una actualización remota de firmware con el iDRAC?](https://www.dell.com/support/article/SLN292363/es) 



Para descargar drivers:

https://www.dell.com/support/home/es-es/product-support/product/poweredge-r640/drivers







ERROR: red



dmesd | tail -f