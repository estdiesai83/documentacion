**Actividad 6.  Big Data e Inteligencia Artificial: Datos que impulsan decisiones estratégicas**

Un ejemplo de utilización de Big Data e Inteligencia Artificial es Airbnb, una plataforma donde las personas alquilan sus casas o habitaciones a turistas, conecta huéspedes y anfitriones que buscan alojamiento temporal.

Airbnb al utilizar Big Data, Machine Learning e IA proporciona recomendaciones en tiempo real a los viajeros utilizando a gran escala la interacción entre anfitriones y huéspedes, los eventos actuales y el historial del mercado local. Los datos sobre la interacción de los usuarios con la plataforma, los clics en anuncios, la comunicación con los anunciantes, las reservas realizadas, los precios de alquiler, la información de la propiedad y las valoraciones de los huéspedes.

Los datos que se recopilan:

<img src="/home/soa/.config/Typora/typora-user-images/image-20251212104204485.png" alt="image-20251212104204485" style="zoom: 50%;" />

La recopilación y procesamiento de datos en Big Data implica unas etapas cruciales que transforman datos brutos en información valiosa. 

1. **Captura de datos**: La recopilación de datos se inicia con la extracción de información proveniente de diversas fuentes previamente identificadas y analizadas. 
2. **Ingesta de datos**: Una vez capturados, los datos se ingresan en un sistema de almacenamiento diseñado para manejar grandes cantidades de datos. Los sistemas de gestión de bases de datos NoSQL, como Hadoop, Cassandra y MongoDB, son adecuados para datos no estructurados o semiestructurados. 
3. **Limpieza de datos**: Encuentra y corrige errores en datos brutos como pueden ser la eliminación de duplicados, el manejo de valores perdidos y la corrección de errores tipográficos, para esto, se utiliza Apache Spark y Talend. 
4. **Minería de datos**: El proceso de explorar grandes conjuntos de datos para encontrar patrones ocultos, relaciones y conocimientos valiosos. Se utilizan algoritmos y técnicas de aprendizaje automático, como árboles de decisión, clustering y análisis de regresión. Algunas de las plataformas utilizadas: RapidMiner y KNIME. 
5. **Transformación de datos**: Convierte datos limpios en un formato adecuado para el análisis. Puede incluir normalizar los datos, agregar variables y crear nuevas características a partir de los datos existentes. Los procesos ETL (Extracción, Transformación, Llegada) son cruciales y pueden ser administrados por herramientas como Apache Nifi y Informatica. 
6. **Validación de datos**: Garantiza que los datos procesados y transformados sean precisos y consistentes. Implica pruebas de integridad, consistencia y precisión para verificar la calidad de los datos. Utilizan herramientas como DataCleaner y Talend Data Quality.

La plataforma interactúa con 20TB de información generada a diario y un archivo de 1,4 petabytes de datos, lo que permite la gestión diaria de grandes cantidades de datos. Estas cifras refuerzan la idea de que las preferencias de los usuarios se reflejan en los datos y se utilizan para brindar servicios personalizados.

Los científicos de datos, especializados en estadística, aprendizaje automático y análisis predictivo, extraen información útil de los datos masivos de la empresa. Los ingenieros desarrollan y mantienen la infraestructura tecnológica para almacenar, procesar y analizar estos datos. 

Airbnb ha obtenido beneficios del uso de Big Data en una variedad de aspectos:

- La experiencia del usuario.
- Comprende las preferencias y el comportamiento de los usuarios, por lo que ofrece recomendaciones personalizadas, lo que aumenta la satisfacción del cliente y la lealtad.
- Optimización de precios: recopila y analiza datos en tiempo real sobre la demanda y la oferta de alojamiento, la temporada, los eventos locales. Esto permite la flexibilidad en los precios.

También utiliza técnicas sofisticadas de análisis de sentimientos para comprender las opiniones y reseñas de sus usuarios. La capacidad de adaptarse rápidamente a las necesidades y preferencias del cliente se convierte en un diferenciador clave.

La tecnologías utilizadas para la gestión de Big Data en Airbnb para procesamiento, almacenamiento y análisis de datos son:

- Apache Hadoop y Apache Spark: para el procesamiento y almacenamiento de grandes cantidades de datos.
- Apache Cassandra y Amazon DynamoDB para los sistemas de gestión de base de datos.
- Apache Flink y Apache Kafka para el análisis en tiempo real de datos y eventos, lo que permite la toma de decisiones rápidas y dinámicas.
- Nube de Google y Amazon S3 que son soluciones de almacenamiento para garantizar que los datos sean escalables y accesibles desde cualquier lugar del mundo.

Los desafios con los que se encuentra:

- **Confianza y Seguridad:** Utiliza sistemas para detectar fraudes, verificar la identidad de anfitriones y huéspedes, y evaluar la seguridad de los alojamientos en tiempo real.
- **Calidad y Privacidad de los Datos:** 
  - Etiquetado y escala: usa modelos de generación de texto sin supervisión para abordar problemas de escalabilidad en la categorización de problemas de soporte al cliente.
  - Privacidad: manejar datos confidenciales de usuarios (ubicación, fotos personales, detalles de la propiedad) plantea desafíos éticos y legales significativos. 
- **Sesgo Algorítmico y Equidad:** los modelos de marching learning aprenden de datos históricos, que pueden contener sesgos existentes, lo que puede favorecer ciertos tipos de anuncios o anfitriones sobre otros, lo que podría perpetuar la discriminación.
- **Infraestructura y migración de código:** utiliza asistentes de codificación basados en IA para acelerar tareas para migrar su código a nuevas plataformas.
- **Procesamiento del Languaje Natural Multilingüe:** desarrollan sistemas de IA conversacional y sistemas de voz interactiva (IVR) que comprendan y respondan eficazmente en múltiples idiomas y dialectos para mejorar la experiencia del usuario a escala global.

Las estrategias en mi entorno profesional que propondría seria:

- Generación automática de código y pruebas
- Depuración y detección de errores
- Optimización de algoritmos y estructuras de datos.
