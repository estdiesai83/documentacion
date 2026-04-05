**Actividad 5.  Explorando el potencial del Deep Learning en el entorno empresarial**

El deep learning al funcionar mediante redes neuronales artificiales profundas, que imitan la estructura del cerebro humano para procesar datos a través de múltiples capas. 

Un ejemplo real de utilización puede ser **Google Lens**, una herramienta de búsqueda visual inmediata, que brinda información detallada de lo que sea a lo que la cámara de un teléfono apunte o de las fotos,  vídeos, audio o texto que se encuentren en el dispositivo. Entre sus funciones está:

**Asistencia de tareas:** el algoritmo permite mediante el escaneo del problema con el que te has atorado, encontrar explicaciones, vídeos, ejemplos y demás que permiten entender mejor sobre temas como matemáticas, historia, química, etc.

**Compras:** Si de pronto viste una persona con un estilo que te fascina, un libro, mueble, lo que sea, y se quiere saber de qué marca es o dónde conseguirlo, solo hace falta hacer una foto de ello y ponerla en google lens.

**Identificar cosas:** Si por ejemplo estás de viaje y ves un monumento, edificio, flor, animal... y quieres saber de ello.

**Traducción:** basta con escanear texto, papel, libro, letrero, pantalla, etc... o enfocar el texto para copiarla en el traductor o notas para traducirlo más tarde o de forma inmediata.

**Texto inteligente:** Es tanto para selección como para búsqueda, para selección: resaltar la parte del texto que se quiere y copiarla para ponerla en la parte que se necesite.

para la búsqueda: hacer foto del texto del que se quiere saber más, por ejemplo un extracto de un poema, definición de una palabra.



Google Lens utiliza el aprendizaje automático ML y la visión por computadora para identificar objetos en imágenes y proporcionar información relevante. Pasos:

1. **Captura de imágenes:** cuando tomas una imagen o haces una búsqueda con Google Lens, primero captura los datos visuales de la imagen.
2. **Detección de objetos:** utiliza algoritmos de visión por computadora para identificar objetos, texto o escenas en la imágenes. Esto se logra mediante redes neuronales convolucionales (CNN) que son efectivos para el reconocimiento de patrones en imágenes.
3. **Clasificación de objetos:** Una vez que los objetos han sido identificados, utiliza modelos entrenados con grandes cantidades de datos para clasificar los objetos en categorías. Por ejemplo, si la imagen muestra una flor, el modelo podría identificarla como una "rosa" o un "tulipán", dependiendo de su tipo y características visuales.
4. **Extracción de información relevante**: Consulta bases de datos como Google Search para encontrar información relacionada con el objeto. Por ejemplo, si identificó un monumento o una pintura, proporcionará enlaces a artículos o descripciones sobre ese objeto.
5. **Reconocimiento de texto:**  Si hay texto en la imagen (como un letrero, una receta o una tarjeta de presentación), Google Lens puede usar tecnología de reconocimiento óptico de caracteres (OCR) para extraer el texto. Luego, puede traducirlo, buscarlo en línea o incluso agregarlo a una lista de contactos si es una tarjeta de presentación.
6. **Mejoras a través de datos y entrenamiento:** Google Lens se sigue entrenando contínuamente con millones de imágenes y datos, a medida que las personas lo usan. Además, el sistema puede aprender a reconocer nuevos objetos o identificar patrones más sutiles a medida que se actualizan las bases de datos y los modelos.

En resumen, Google Lens utiliza aprendizaje automático y redes neuronales profundas para procesar, clasificar e identificar visualmente en imágenes, lo que le permite ofrecer información útil y relevante, como descripciones, enlaces y sugerencias de productos o lugares. Cuanta más información se le coloque, mayor y mejor serán sus respuestas.



El objetivo de la aplicación Lens es darte información o ayudarte a definir mejor un contexto sobre tu entorno y todos los objetos de ese entorno fotografiado.

Con Google Lens, la forma de buscar está cambiando. No es necesario formular una consulta textual para obtener resultados. Si no sabes cómo expresar lo que ves, si eres analfabeto, ciego o disléxico, Lens puede ayudarte mucho en tu vida diaria.



Al igual que el cerebro humano, la red neuronal reconoce un concepto mostrándole muchos ejemplos variados. Este aprendizaje se consigue mediante la adquisición y la memorización de datos, la extracción y los ajustes de características. ![arquitectura y redes neuronales](https://elplacerdelseo.com/wp-content/uploads/2022/12/arquitectura-y-redes-neuronales.gif)

Aunque las computadoras han aprendido a etiquetar, clasificar y comprender imágenes como los humanos mediante redes neuronales convolucionales, los algoritmos utilizados para hacer funcionar Google Lens van aún más lejos.

Basados en el *embedding*, una forma de codificación y aprendizaje de imágenes, los métodos utilizados son cada vez más avanzados: aprendizaje tanto de la invariancia como por similitud.  El problema no es codificar los algoritmos, sino entrenar las redes neuronales. Al combinar la imagen y el texto, los sistemas de Google son capaces de entender que los temas están relacionados. 



Lens, junto con la búsqueda múltiple, te da la oportunidad de añadir una consulta adicional de texto (o voz) a tu búsqueda de imágenes (actualmente disponible en EEUU). La aplicación también te permite copiar y pegar texto, para actuar sobre las palabras que veas, en todos los idiomas (presentes en Google Translate).

La aplicación Lens puede discernir un texto y copiarlo para una búsqueda o traducirlo a muchos idiomas, sin tener que escribirlo. Para las personas con limitaciones visual, Lens puede leer el texto en voz alta mediante Google Text-to-Speech (TTS). Esto es impresionante:

![las nuevas capacidades de lectura de google lens](https://elplacerdelseo.com/wp-content/uploads/2022/12/las-nuevas-capacidades-de-lectura-de-google-lens.gif)Las nuevas capacidades de lectura de Google Lens.

## OCR: Reconocimiento Óptico de Caracteres

Para que Google Lens aprenda a leer, Alphabet desarrolló un motor de reconocimiento óptico de caracteres (OCR) y lo combinó con nuestra comprensión del lenguaje, ayudados por el Knowledge Graph. Todas estas características son posibles gracias al entrenamiento de los algoritmos en modelos de aprendizaje automático (redes neuronales artificiales, en particular). Éstos aprenden a distinguir las estructuras de los textos del mismo modo que lo haría un humano: análisis de frases y párrafos, bloques y columnas.

Para corregir los errores de lectura y mejorar la comprensión de las palabras, Lens utiliza el contexto de las palabras circundantes. Sin embargo, al igual que ocurre con el ojo humano, sigue siendo difícil para una máquina distinguir entre caracteres similares, como la letra “o” y el cero. Lens emplea sistemas (o modelos de aprendizaje automático) que le permiten discernir los caracteres y la estructura de la imagen. Lens también utiliza el Knowledge Graph. Esto proporciona indicios contextuales e identifica, por ejemplo, los nombres propios.

## Algoritmos de traducción neuronales

Lens utiliza los [algoritmos de traducción automática neuronale (NMT)](https://ai.googleblog.com/2016/09/a-neural-network-for-machine.html) de Google Translate para interpretar frases completas y ofrecer los resultados más relevantes posibles. Los errores en los resultados pueden deberse a distorsiones del texto, a la calidad de la foto y a los ángulos de la cámara. Recuerda que Google Lens sigue siendo el resultado de muchos algoritmos. Las tecnologías utilizadas ya ofrecen mejoras considerables.

. Pero en lugar de comparar dos imágenes entre sí, Lens compara tu foto con millones de objetos en sus bases de datos. Tras analizar tu imagen, Lens suele generar varios resultados posibles. Los clasifica según su grado de relevancia.

Si una imagen no está en su base de datos, Lens tendrá que utilizar otros métodos. Por ejemplo, encontrar una imagen que se parezca a otra, categorizarla y etiquetarla, o encontrar otras imágenes mediante la extracción de características con ayuda de la visión por computadora.

## Avances considerables gracias a la IA

Para que la búsqueda con Google Lens funcione con el menor número de errores posible, las computadoras tienen que aprender un gran número de ejemplos, y numerosas veces. Para hacer cada vez menos cambios y reducir la potencia de cálculo, se utilizan nuevos avances de hardware y software, incluyendo la inteligencia artificial:

- [Label/Entity Detection](https://cloud.google.com/vision/docs/labels) distingue el elemento dominante en una imagen.
- El [OCR](https://cloud.google.com/vision/docs/ocr) asocia el texto a una foto, así como el idioma utilizado.
- La [Safe Search Detection](https://cloud.google.com/vision/docs/detecting-safe-search) identifica el contenido inapropiado.
- [Facial Detection](https://cloud.google.com/vision/docs/detecting-faces) para detectar las caras.
- [Logo Detection](https://cloud.google.com/vision/docs/detecting-logos) analiza los logotipos de marcas y productos en las imágenes.
- [Landmark Detection](https://cloud.google.com/vision/docs/detecting-landmarks) asocia la ubicación (paisajes y espacios en todo el mundo) con estructuras diseñadas por el hombre.

Lens utiliza tu ubicación (con tu consentimiento) para generar resultados más precisos. Esto le permite identificar lugares y puntos de referencia con mayor facilidad. Si estás en Moscú, la aplicación entenderá que es más probable que busques información sobre la Catedral de San Basilio que sobre otra estructura de aspecto similar en otro lugar del mundo.



## Hacer la máquina “insensible”

La complejidad para los algoritmos de Google Lens sigue siendo reconocer pequeños cambios que son insignificantes para ti, pero confusos para una computadora. Por ejemplo, un sombrero de vaquero en un perro puede sesgar los resultados y crear errores de concordancia visual. Como dice la investigadora y Googler Maya Gupta: “Hacer que la máquina sea insensible a los cambios significativos es un equilibrio que todavía estamos intentando alcanzar” (fuente: [Google Machine Learning Q&A](https://www.google.com/intl/ES/about/main/machine-learning-qa/)).

![ejemplo de error de concordancia visual](https://elplacerdelseo.com/wp-content/uploads/2022/12/ejemplo-de-error-de-concordancia-visual.gif)Ejemplo de error de concordancia visual. Fuente Google Blog: [Machine Learning](https://www.google.com/intl/ES/about/main/machine-learning-qa/)

## Google Lens y los errores de concordancia visual

Dependiendo de la calidad de la foto, la iluminación y de la presencia de sombras, la relevancia de los resultados mostrados por Lens puede verse comprometida. Esto se debe a que determinados parámetros pueden afectar a las formas, los colores y los contornos, que a su vez afectan a los datos con los que tiene que trabajar Lens.

Aunque nos gusta pensar que nuestras computadoras “piensan” y “entienden” como nosotros, en realidad no es así como funcionan. Simplemente son excepcionalmente buenos recordando cosas que han aprendido y haciendo cálculos muy, muy rápidamente.

Para comprender estos “errores” de correspondencia visual, parece necesario entender que, para que una computadora, aprenda una imagen, la reconozca al derecho, al revés, de día o de noche en un entorno inusual, sólo es posible mediante un aprendizaje específico.

![aprendizaje de imagenes y aumento de datos](https://elplacerdelseo.com/wp-content/uploads/2022/12/aprendizaje-de-imagenes-y-aumento-de-datos.png)Aprendizaje de imágenes y aumento de datos. Fuente : Medium

Esto se debe a que a las computadoras les cuesta más captar la información que a nosotros. Donde nosotros vemos formas y objetos, la máquina “ve” una secuencia de números. Los algoritmos y las tecnologías permiten ahora a los motores de búsqueda trabajar al mismo tiempo sobre las imágenes, su contenido descriptivo y los textos. Esto se llama modalidad cruzada.

![como una computadora ve una imagen](https://elplacerdelseo.com/wp-content/uploads/2022/12/como-una-computadora-ve-una-imagen.png)Como una computadora ve una imagen. Fuente : [DeeplyLearning](https://deeplylearning.fr/cours-pratiques-deep-learning/segmentation-semantique-dimages/)

## Ganar en relevancia con la integración de imágenes

Las integraciones de imágenes (o *image embeddings*) dan a las computadoras la capacidad de extraer información importante de una imagen y comparar fácilmente los datos que contiene. Integra los datos en un formato comprensible para los algoritmos de aprendizaje automático.

Ocupan poco espacio en memoria, pueden ser redimensionadas y lo hacen sin pérdida de información. Para analizar las imágenes, las computadoras tienen que transformarlas en una representación más adecuada. La inserción de imágenes es una representación vectorial de una imagen, que permite utilizar imágenes similares con un perfil vectorial parecido.

![aprendizaje de imagenes y construccion de red neuronal profunda](https://elplacerdelseo.com/wp-content/uploads/2022/12/aprendizaje-de-imagenes-y-construccion-de-red-neuronal-profunda.png)Aprendizaje de imágenes y construcción de red neuronal profunda. Fuente : [Github](https://github.com/easonyang1996/DML_HistoImgRetrieval)

Esta técnica de extracción se utiliza para muchas tareas, como la clasificación. Al recuperar la información, se hace posible:

- Recupera una imagen a partir de sus características (buscar un gato a partir de fotos de sus orejas, su tamaño o el color de su pelo);

![extraccion de caracteristicas de una imagen](https://elplacerdelseo.com/wp-content/uploads/2022/12/extraccion-de-caracteristicas-de-una-imagen.png)Extracción de características de una imagen. Fuente: [Inside Machine Learning](https://inside-machinelearning.com/cnn-couche-de-convolution/)

- Realizar búsquedas de imágenes por similitud.

- Formar grupos de objetos similares y agrupar información semánticamente similar, en varios idiomas (fuente: [Image search using multilingual text : a cross-modal learning approach between image and text](https://arxiv.org/pdf/1903.11299.pdf)).

Esta tecnología desempeña un papel central en muchas aplicaciones, incluida Google Lens. También se utiliza en la recomendación de productos, la identificación facial o en el ámbito médico.

Ésta es una de las razones por las que las integraciones de imágenes se utilizan en la visión por computadora. Son muy fáciles de reutilizar una vez generadas.

## Reconocimiento de imágenes a gran escala

El objetivo de Alphabet es ir más lejos y más rápido para construir un único modelo universal de integración de imágenes capaz de representar objetos en múltiples ámbitos.

El reconocimiento y el aprendizaje de objetos en entornos realistas presenta una variabilidad considerable para Google Lens.

![transformadores para el reconocimiento de imagenes a gran escala](https://elplacerdelseo.com/wp-content/uploads/2022/12/transformadores-para-el-reconocimiento-de-imagenes-a-gran-escala.gif)Fuente: Google AI Blog [Transformadores para el reconocimiento de imágenes a gran escala](https://ai.googleblog.com/2020/12/transformers-for-image-recognition-at.html)

Para aprender a reconocer las imágenes que le proporcionas, es necesario utilizar conjuntos de entrenamiento mucho más grandes y rápidos, que requieren menos tiempo de entrenamiento. Utilizando estos enfoques, ahora es posible entrenar una red neuronal de forma casi autónoma, permitiéndole deducir las características de una imagen específica sin tener que construir un gran conjunto de datos ni proporcionarle etiquetas asignadas con precisión.

## ¿Y el SEO en todo eso?

¿Cómo afectaría la [búsqueda múltiple de Google](https://elplacerdelseo.com/la-busqueda-multiple-pronto-estara-disponible-en-todo-el-mundo/) Lens en SEO? Los algoritmos de Google evolucionan de forma constante, así que esto no es una revelación. Sin embargo, la aplicación Google Lens y el multisearch modifica la forma en que buscamos información: utilizando texto e imágenes al mismo tiempo. Google Lens aún está en pañales, pero esta aplicación promete muchas mejoras con la búsqueda multimodal y la IA.

Es probable que Google integre cada vez más la búsqueda visual con sus otros productos, como Google Maps y Google Shopping. La única incógnita es el comportamiento de los internautas y en los móviles. ¿Les conquistará la búsqueda visual? ¿O se aferrarán a sus hábitos y a los diez enlaces azules que aparecen en Google Search y fracasará la búsqueda visual, como la búsqueda por voz, por falta de interés de sus usuarios?

Actualmente, parece difícil optimizar un sitio para la IA o para la búsqueda multimodal… Los resultados de Google Lens proceden, de momento, de otros productos de la empresa Alphabet como la búsqueda Google, Google Maps o Google Shopping. Parece legítimo pensar que los resultados mostrados dependen de los algoritmos de clasificación de estos productos. Por eso, seguir indexando y optimizando las imágenes es más que necesario. Insertar imágenes, crear contenidos pertinentes y accesibles para todos, sigue siendo una práctica sensata e incluso vanguardista.

## Conclusión

Todos los SEO lo dicen: prioriza los pilares del SEO, técnico, contenido y popularidad. El SEO de imágenes, la accesibilidad digital, la optimización para móviles, las etiquetas clásicas (Title y Hn), por no hablar de la estrategia de contenidos, son cada vez más importantes en las estrategias SEO. Google sigue diciendo: crea contenido útil, pertinente y de alta calidad. Como lo demuestra la actualización de Google [Helpful Content](https://elplacerdelseo.com/helpful-content-update-una-semana-despues-del-lanzamiento-el-impacto-parece-muy-bajo/) de agosto de 2022, las recomendaciones de Google son claras: privilegia los contenidos centrado en el humano y evita escribir para los motores de búsqueda.

En el futuro, la búsqueda múltiple puede requerir nuevas acciones de SEO. Google Lens formará parte, sin duda, de nuestro uso futuro. Sigue siendo necesario mantener la cautela y volver a poner al ser humano en primer plano, a pesar del uso preponderante de la IA, nos guste o no. Si escribes y optimizas contenido de calidad, que los humanos entiendan la relevancia de tu información, los algoritmos basados en IA y los motores de búsqueda también lo entenderán.

https://bambu-mobile.com/google-lends-aplicacion-deep-learning/

https://es.quora.com/C%C3%B3mo-Google-Lens-utiliza-el-aprendizaje-autom%C3%A1tico-para-identificar-objetos-en-im%C3%A1genes-y-proporcionar-informaci%C3%B3n-relevante

https://www.seoptimer.com/es/blog/que-es-google-lens-y-para-que-sirve/

https://elplacerdelseo.com/google-lens-la-busqueda-textual-pronto-destronada-por-la-imagen/

**Instrucción de desarrollo**

1. **Observación y análisis**

   Busca un caso documentado (artículo, estudio de caso, vídeo educativo) que muestre la aplicación de redes neuronales en una organización. Puede  estar relacionado con reconocimiento de imágenes, predicción de series temporales, análisis de sentimientos, etc. Analiza:

   - ¿Qué tipo de red neuronal se ha utilizado?
   - ¿Qué problema específico resolvió?
   - ¿Qué datos se utilizaron para el entrenamiento?
   - ¿Cuál fue el impacto de esta solución en términos de eficiencia o competitividad?
   - ¿Qué limitaciones o retos técnicos se mencionaron?

2. **Reflexión escrita**

   Escribe un informe de aproximadamente 2 páginas en el que respondas a las siguientes preguntas:

   1. ¿Qué motivó a la organización a utilizar una solución basada en deep learning?
   2. ¿Cómo influyó la calidad y cantidad de los datos en los resultados del modelo?
   3. ¿Qué tipo de arquitectura se usó (CNN, RNN,etc) y por qué fue adecuada?
   4. ¿Cuáles fueron los beneficios concretos obtenidos por la empresa?
   5. ¿En qué procesos de tu organización podría aplicarse el deep learning y que valor podría generar?
