**Actividad 5.  Explorando el potencial del Deep Learning en el entorno empresarial**

Un ejemplo puede ser **Google Lens**, una herramienta de búsqueda visual inmediata que brinda información detallada de lo que sea a lo que la cámara de un teléfono apunte o de las fotos, vídeos, audio o texto que se encuentre en el dispositivo. Entre sus funciones está:

**Asistencia de tareas:** el algoritmo permite mediante el escaneo, encontrar explicaciones, vídeos, ejemplos y demás que permiten entender mejor sobre temas como matemáticas, química, etc.

**Compras:** Si de pronto viste una persona con un estilo, un libro, mueble, lo que sea, y se quiere saber dónde conseguirlo, solo hace falta hacer una foto de ello y ponerla en google lens.

**Identificar cosas:** Lens utiliza tu ubicación (con tu consentimiento) para generar resultados más precisos. Ejemplo si estás en Moscú, entenderá que es más probable que busques información sobre la Catedral de San Basilio que sobre otra de aspecto similar en otro lugar del mundo.

**Traducción:** escanear texto, libro, letrero, etc... para traducirlo más tarde o de forma inmediata.

Google Lens utiliza el aprendizaje automático ML y la visión por computadora para identificar objetos en imágenes, vídeos, audio o texto y proporcionar información relevante. Pasos:

1. **Captura de imágenes:** cuando tomas una imagen o haces una búsqueda con Google Lens, primero captura los datos visuales de la imagen.
2. **Detección de objetos:** utiliza algoritmos de visión por computadora para identificar objetos, texto o escenas en la imágenes. Utiliza redes neuronales convolucionales (CNN) para el reconocimiento de patrones en imágenes.
3. **Clasificación de objetos:** Una vez identificados, utiliza modelos entrenados con grandes cantidades de datos para clasificar los objetos en categorías. Por ejemplo, si la imagen muestra una flor, el modelo podría identificarla como una "rosa" o un "tulipán", dependiendo de su tipo y características visuales.
4. **Extracción de información relevante**: Consulta bases de datos como Google Search para encontrar información relacionada con el objeto. Por ejemplo, si identificó un monumento proporcionará enlaces sobre ese objeto.
5. **Reconocimiento de texto:**  Si hay texto en la imagen Google Lens puede usar tecnología de reconocimiento óptico de caracteres (OCR) para extraer el texto. Luego, puede traducirlo, buscarlo en línea o incluso agregarlo a una lista de contactos si es una tarjeta de presentación. Éstos aprenden a distinguir las estructuras de los textos del mismo modo que lo haría un humano: análisis de frases y párrafos, bloques y columnas.
6. **Mejoras a través de datos y entrenamiento:** Google Lens se sigue entrenando contínuamente con millones de imágenes y datos, a medida que las personas lo usan. Así puede aprender a reconocer nuevos objetos o identificar patrones a medida que se actualizan las bases de datos y los modelos.

El objetivo de la aplicación es dar información o ayudar a definir un contexto sobre tu entorno y  los objetos de ese entorno fotografiado. Al igual que el cerebro humano, la red neuronal reconoce un concepto mostrándole muchos ejemplos variados. 

Para las personas con limitaciones visual, Lens puede leer el texto en voz alta mediante Google Text-to-Speech (TTS). 

Lens utiliza los algoritmos de traducción automática neuronale (NMT) de Google Translate para interpretar frases y ofrecer resultados relevantes. Los errores en los resultados pueden deberse a distorsiones del texto, a la calidad de la foto y a los ángulos de la cámara. 

Para que la búsqueda funcione lo mejot posible, las computadoras utilizan:

- [Label/Entity Detection](https://cloud.google.com/vision/docs/labels) distingue el elemento dominante en una imagen.
- El [OCR](https://cloud.google.com/vision/docs/ocr) asocia el texto a una foto, así como el idioma utilizado.
- La [Safe Search Detection](https://cloud.google.com/vision/docs/detecting-safe-search) identifica el contenido inapropiado.
- [Facial Detection](https://cloud.google.com/vision/docs/detecting-faces) para detectar las caras.
- [Logo Detection](https://cloud.google.com/vision/docs/detecting-logos) analiza los logotipos de marcas y productos en las imágenes.
- [Landmark Detection](https://cloud.google.com/vision/docs/detecting-landmarks) asocia la ubicación (paisajes y espacios en todo el mundo) con estructuras diseñadas por el hombre.

**ERRORES DE CONCORDANCIA VISUAL**

Para corregir los errores de lectura y mejorar la comprensión de las palabras, Lens utiliza el contexto de las palabras circundantes. Emplea sistemas (o modelos de aprendizaje automático) que le permiten discernir los caracteres y la estructura de la imagen. También utiliza el Knowledge Graph esto proporciona indicios contextuales e identifica, por ejemplo, los nombres propios.

La complejidad para los algoritmos de reconocer pequeños cambios que son insignificantes para ti, pero confusos para una computadora. Por ejemplo, un sombrero de vaquero en un perro puede sesgar los resultados y crear errores de concordancia visual.

Dependiendo de la calidad de la foto, la iluminación y sombras, los resultados mostrados pueden verse comprometidos. Determinados parámetros pueden afectar a las formas, los colores y los contornos, que a su vez afectan a los datos con los que tiene que trabajar Lens.

Mediante un aprendizaje específico la computadora puede aprender una imagen, reconocerla al derecho, al revés, de día o de noche en un entorno inusual. 

| Aprendizaje de imágenes.                                     | Así ve una computadora.                                      |
| ------------------------------------------------------------ | ------------------------------------------------------------ |
| <img src="https://elplacerdelseo.com/wp-content/uploads/2022/12/aprendizaje-de-imagenes-y-aumento-de-datos.png" alt="aprendizaje de imagenes y aumento de datos" style="zoom: 25%;" /> | <img src="https://elplacerdelseo.com/wp-content/uploads/2022/12/como-una-computadora-ve-una-imagen.png" alt="como una computadora ve una imagen" style="zoom: 20%;" /> |

Donde nosotros vemos formas y objetos, la máquina “ve” una secuencia de números. 

Las integraciones de imágenes (o *image embeddings*) dan a las computadoras la capacidad de extraer información importante de una imagen y comparar fácilmente los datos que contiene. Integra los datos en un formato comprensible para los algoritmos de aprendizaje automático.



En mi sector profesional lenguajes de programación como Python tiene paquetes que se utilizan para el aprendizje automático y el deep learning como Pandas, NumPy, Tensor Flow...

https://bambu-mobile.com/google-lends-aplicacion-deep-learning/

https://es.quora.com/C%C3%B3mo-Google-Lens-utiliza-el-aprendizaje-autom%C3%A1tico-para-identificar-objetos-en-im%C3%A1genes-y-proporcionar-informaci%C3%B3n-relevante

https://www.seoptimer.com/es/blog/que-es-google-lens-y-para-que-sirve/

https://elplacerdelseo.com/google-lens-la-busqueda-textual-pronto-destronada-por-la-imagen/
