**Actividad 3. Aplicando Machine Learning en problemas empresariales**

La gran cantidad de información que se procesa informáticamente en medicina la convierte en un campo ideal para el empleo de técnicas como Big Data Analysis (BDA) y Machine Learning (ML), que  pueden permitir en el futuro mejorar la investigación clínica y dirigir de manera más precisa las terapias que se le dan a los pacientes.

Por ejemplo en la medicina intensiva (Hospital Clínico San Carlos, con tres unidades de cuidados intensivos y aproximadamente 2400 ingresos al año), durante un día normal se incorporan a la base de datos informatizada 1400 unidades de información en promedio por cada paciente ingresado.

Con el desarrollo de la informática y un coste asequible de los ordenadores de gran capacidad de almacenamiento hacen posible almacenar toda esa información. Se utiliza técnicas de procesamiento de lenguaje Natural (NLP) a los informes almacenados en Word, PDF u otro formato similar de texto (no estructurado).

Estos datos provienen de la documentación del paciente que añaden los sanitarios sobre la atención directa al paciente, de los tratamiento y fármacos administrados, de los aparatos médicos (resultados de laboratorio, constantes vitales, monitorización, respirador,..), así como imágenes, sonidos, vídeos, etc.

Hoy en día toda esa información se puede procesar de manera automática y extraer de ella conocimiento y orientación para mejorar el cuidado de los pacientes. 

| <img src="/home/soa/.config/Typora/typora-user-images/image-20251030122418865.png" alt="image-20251030122418865" style="zoom: 67%;" /> | <img src="/home/soa/.config/Typora/typora-user-images/image-20251030122516825.png" alt="image-20251030122516825" style="zoom:67%;" /> |
| ------------------------------------------------------------ | ------------------------------------------------------------ |

Al introducir la información del paciente el sistema puede alertarnos del problema que tiene el paciente.

Otro ejemplo, podría ser el empleo de sistemas de control en tiempo real, por ejemplo para ajustar continuamente la dosis de insulina en un paciente dependiendo del estado del paciente en ese momento. El sistema puede ir aprendiendo con el tiempo sobre el propio paciente y optimizando progresivamente el control de la glucemia.

Los datos se pueden almacenar en bases de datos relacionales (SQL) o no relacionales (noSQL). Una vez que tenemos los datos almacenados, se pueden procesar para obtener un informe clínico de los pacientes, los antibióticos que más se utilizan, patologías,.. sin tener que revisar uno a uno los pacientes.

En ML se debe utilizar un formato (dataframe) para trabajar con los datos. Un dataframe es una matriz donde cada fila corresponde a uno de los pacientes o registros y cada columna a una de las variables que registramos.

<img src="/home/soa/.config/Typora/typora-user-images/image-20251030122445488.png" alt="image-20251030122445488" style="zoom: 55%;" />

Se pueden utilizar tres variantes de ML:

- **Aprendizaje supervisado**: cada registro está etiquetado con un valor de la variable objetivo, y se utilizan técnicas capaces de predecir en un registro nuevo el valor de esa variable. En el ejemplo, la variable objetiva es la mortalidad (SÍ/NO). Una vez «entrenado» el sistema, este ha de ser capaz de predecir el valor de esa variable para un nuevo episodio. Por tanto, los datos de entrenamiento y los de prueba deben ser diferentes y estar almacenados por separado. Se utiliza en **tareas de clasificación, predicción y detección de similitud.** 

  Es mucho más fácil hacer investigación clínica cuando los datos están en un formato estructurado, para ello tiene que haber un consenso sobre cada concepto relacionado con la salud, pero no solo  hay que tener en cuenta los datos en sí, si no también el contexto en el que están inmersos. 

- ***Aprendizaje no supervisado***. Detecta patrones o tendencias en los datos sin utilizar una variable objetivo. Se utiliza por ejemplo para **clasificar pacientes** en grupos de manera automática y para reducir el número de variables y la complejidad de los modelos.

- **Aprendizaje por refuerzo**. El sistema debe perseguir un objetivo o recompensa, e irá aprendiendo a medida que se va explorando el entorno con el que interactúa. Un ejemplo sería un sistema que va aprendiendo y ajustando las pautas antibióticas empíricas que realizan los clínicos según van siendo los resultados y las características de los pacientes sépticos que se van presentando.



Los algoritmos de aprendizaje que se pueden utilizar son los de selección de modelo, validación cruzada, métricas de resultados, optimización de hiperparámetros, redes neuronales.



Los inconvenientes que nos podemos encontrar son:

- Privacidad y seguridad de los datos:  al ser personales, se tiene que aplicar la ley de protección de datos o anonimizar dichos datos (es decir, que no se pueda identificar al paciente con los datos registrados)
- Los algoritmos no son fácilmente interpretables por el médico (aunque si el modelo funciona correctamente esto puede ser irrelevante), para ello hay que incorporar personal especializado con conocimientos clínicos, IA y tecnológicos.



Las ventajas de utilizar ML en medicina serían:

- ayuda en la toma de decisiones médicas
- diagnostico y tratamiento de enfermedades
- atención al paciente
- investigación

Los conocimientos que creo que hay que tener sería conocer algunos lenguajes de programación utilizados en estadística para análisis (Python, Java), dominar SQL como herramienta de consulta de bases de datos, saber utilizar bibliotecas de código que se utilizan en este campo.

Colaborar con personal específico del tipo de empresa para obtener el máximo rendimiento de la información almacenada y con personal específico para el tema de seguridad y privacidad de los datos. 



https://www.medintensiva.org/es-big-data-analysis-machine-learning-articulo-S0210569118303139

https://saluddigital.com/big-data/como-funcionan-los-modelos-de-machine-learning-en-medicina/

