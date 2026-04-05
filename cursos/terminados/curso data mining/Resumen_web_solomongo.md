# Introducción

## CONCEPTOS BÁSICOS, TÉCNICAS Y SISTEMAS 

 **La Minería de Datos (o \*data mining, DM)\* es el proceso de analizar grandes cantidades de datos para encontrar tendencias y patrones englobado en la Business Intelligence.**


![datos](https://solomongo.com/datamining/images/pic01.jpg)

 Permite convertir datos sin procesar y estructurarlos en información comprensible sobre diversas áreas de negocios y del mercado para toma de decisiones estratégicas.



------

# 1. Extracción de Big Data

 Partiendo del DATO, sus diferentes **Tipos**; **Funciones**: representar [personas (LOPD) ](https://www.aepd.es/), hechos, comunicaciones, equipos, procesos, transacciones, etc; **Sensibilidad** del dato; **Procedencia**: sensores, IoT, smart city, [OSINT ](https://osintframework.com/), [OpenData ](https://datos.gob.es/es), industria 4.0, antenas y satelites, móviles, webs y cookies.. es necesario ordenar este Big Data de forma manejable para usar en diversos ámbitos de aplicación como: ***telecomunicaciones, banca, transportes, comercio, industria, defensa, medicina,***etc..

*** Ejemplo de tabla de base de datos con filas y columnas:**



| ID:   | Alumn@:         | Nota: | Fecha Curso: | Calificad@: |
| :---- | :-------------- | :---- | :----------- | :---------- |
| 36-24 | Maria Carey     | 3.4   | 24/03/2024   | NO APTA     |
| 73-24 | Brad Pitt       | 9.8   | 24/03/2024   | APTO        |
| 17-24 | Frida Kahlo     | 8.9   | 24/03/2024   | APTO        |
| 82-24 | Vinicius Junior | 7.5   | 24/03/2024   | APTO        |
| 13-24 | Vladimir Putin  | 4.8   | 24/03/2024   | NO APTO     |



![sql](https://solomongo.com/datamining/images/sql.png) Para acercarnos a esa idea de almacenamiento en bases de datos, por tablas de filas y columnas, con campos llenos de valores y éstos datos a su vez, relacionandose entre tablas.. tenémos servidores donde almacenar estructuradamente esos datos, hacerlos consultas con [SQL ](https://es.wikipedia.org/wiki/SQL) y obtener resultados ordenados y filtrados, en relación a la cuestión solicitada. Estos datos han de estar antes normalizados.

------

# 2. Modelado de DATOS

###  HERRAMIENTAS Y PROGRAMAS

![csv icono](https://solomongo.com/datamining/images/csv.png)

 Las bases de datos o dataframes, que pueden crearse desde hojas de cálculo Excell (guadando como .CSV) se incluyen: o bien en programas que las acepten o sino incrustados en los códigos de programación en lenguaje [Python ](https://www.w3schools.com/python/default.asp). Algunos de esos programas son:



![TOOLS logo](https://solomongo.com/datamining/images/pic06.png)

![python logo](https://solomongo.com/datamining/images/python.png) La mayor parte de los códigos provienen de librerías (open source), las cuales alojan los algoritmos que hacen que funcione el código.. previa importación de las librerías. Ejemplos: [Matplotlib ](https://matplotlib.org/stable/gallery/index.html), [Python-charts ](https://python-charts.com/es/).

 Con enlazar las bases de datos o bien, desde un repositorio del programa donde se han subido o bien, mediante inserción del dataset en el código, se pueden ejecutar sus funciones y obtener visualizaciones y gráficos..

### Ejemplo de código Python:

 ABRE LA VISUALIZACIÓN DEL CÓDIGO 



#### Ejemplos de librerías Python:

-  **matplotlib:** para crear gráficos y visualización de datos.
-  **seaborn:** para crear gráficos y visualización de datos.
-  **pandas:** carga tus datos en un DataFrame.
-  **folium:** crea mapas coropléticos y mapas interactivos..
-  **geopandas:** para trabajar con datos geoespaciales.
-  **numpy:** da soporte para crear vectores y matrices.
-  **scikit-learn:** agrupa; crea y entrena una red neuronal o un modelo de árbol de decisión.



------

# 3. Representación

# de la Información

## Técnicas de Aplicación

 Según los datos y la finalidad de la minería, esta puede tener varias ramificaciones o especializaciones:

![img](https://solomongo.com/datamining/images/pic02.jpg)

###  Técnica Descriptiva

Sirven para evaluar los datos en un momento preciso. [Más info ](https://es.wikipedia.org/wiki/Estadística_descriptiva).

- 1. EJEMPLO DESCRIPTIVAS

![img](https://solomongo.com/datamining/images/pic03.jpg)

###  Técnica Prescriptiva

Utilizadas para comparar estadísticas y procesos.[ Más info ](https://es.wikipedia.org/wiki/Minería_de_datos).

- 2. EJEMPLO PRESCRIPTIVAS

![img](https://solomongo.com/datamining/images/pic04.jpg)

###  Técnica Predictiva

La más compleja sirve para hacer simulaciones a futuro.[ Más info ](https://es.wikipedia.org/wiki/Análisis_predictivo).

- 3. EJEMPLO PREDICTIVAS

------

 La siguiente imágen es un símil comparativo entre dos técnicas DM: podrá servir para cotejar el método y herramientas utilizados mediante uso de datos.. ***biométricos\*** en un caso, y ***geográficos\*** en otro. Situados sobre planos y en las coordenadas configuradas (que pueden ser rostros o mapas 3D) se representan esos datos por capas, dando lugar a este tipo de técnica controvertida y disciplina transversal del Machine Learning para la IA: el Reconocimiento Facial..

![TOOLS logo](https://solomongo.com/datamining/images/bio.png)

Dos de las arquitecturas más usadas en la actualidad son: **[MobileNet ](https://github.com/Zehaos/MobileNet)**, que permite realizar la detección de rostros, y **[FaceNet ](https://github.com/davidsandberg/facenet)**, encargada de la obtención de los *embeddings* de cada rostro, para posteriormente realizar su verificación usando un simple algoritmo de programación Python.. Puedes probar la nueva librería: [*face_recognition* ](https://codigospython.com/reconocimiento-facial-con-face_recognition-en-python/) desde este Lab;)

- 
-  
- 
-  
- 
-  
- 
-  
- 
-  
- 

## Fases de la Minería

La **Exploración y Selección** de datos (provenientes del BigData y previo proceso ETL para almacenarlos) es de las primeras fases para gestionar los datos, mediante arquitectura [OLAP (On Line Analisis Proccesing) ](https://es.wikipedia.org/wiki/OLAP), y que sean de calidad para utilizarlos posteriormente con mayor eficiencia.

Estos datos se pueden cruzar entre ellos y aplicar funciones matemáticas, estadisticas, etc. que, mediante el ojo humano sería imposible de gestionar;) Se implementan algoritmos, mediante programación Python, por su capacidad de automatizar y así sirviendonos de librerías podemos en esta fase de **Transformación**, ir modelando los resultados de los cruces de datos en Información.

La fase de **Análisis** requiere comparar patrones y salidas, corregir errores e intentar mostrar la información obtenida con claridad comunicativa. Para ello las librerías alojan variedad de gráficos y visualizaciones, que junto con su código de ejemplo podemos utilizar para ir obteniendo conocimiento y tomar decisiones estratégicas en función de los resultados.

# 4. Interpretación del Conocimiento

##  Visualizaciones Gráficas

 Mediante el uso del algoritmo y sus funciones de cálculo, aportando los datos e insertando los códigos que lo hacen funcionar en los programas, obtenemos resultados como las siguientes muestras.

 TIPOS DE VISUALIZACIÓN GRÁFICA 



![img](https://solomongo.com/datamining/images/img_00.jpg)

![img](https://solomongo.com/datamining/images/img_11.jpg)

![img](https://solomongo.com/datamining/images/img_22.jpg)

![img](https://solomongo.com/datamining/images/img_33.jpg)

![img](https://solomongo.com/datamining/images/img_44.jpg)

![img](https://solomongo.com/datamining/images/img_55.jpg)

![img](https://solomongo.com/datamining/images/img_66.jpg)

![img](https://solomongo.com/datamining/images/img_77.jpg)

![img](https://solomongo.com/datamining/images/img_88.jpg)

![img](https://solomongo.com/datamining/images/img_99.jpg)

![img](https://solomongo.com/datamining/images/img_13.png)

![img](https://solomongo.com/datamining/images/img_12.jpg)

------

###  Ejemplo de Proyecto DM + BI:

**Gracias al DM se pueden analizar sentimientos de las redes sociales:** extrayendo los datos y comentarios (positivos, negativos o neutros) y cruzando ideas se consigue información nunca antes visualizada. Se aplican técnicas de Inteligencia Artificial, Learning Machine, Aprendizaje Automático, Redes Neuronales.. Recientemente *(marzo 2023)* el parlamento Europeo crea la primera legislación mundial en torno a la Inteligencia Artificial, donde regula justo ésta disciplina: [Análisis de sentimiento ](https://es.euronews.com/my-europe/2024/03/13/el-parlamento-europeo-aprueba-la-ley-de-ia-por-abrumadora-mayoria)



<iframe width="100%" height="315" src="https://www.youtube.com/embed/yoSqojO2-CQ?si=dipYwHAG8p6593Ca" title="YouTube video player" frameborder="0" allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share" allowfullscreen="" style="box-sizing: border-box; margin: 0px; padding: 0px; border: 0px; font: inherit; vertical-align: baseline;"></iframe>

 Todo este BigData, aplicado a una SmartCity y por medio de IoT, da lugar a una 

nueva dimensión

, que se sitúa en el plano ***tiempo\***, con proyección predictiva, y el resultado es una toma de decisiones basada en hechos y con las tendencias de las personas que habitan éstos lugares, que no son físicos. El video muestra las gráficas vistas, que ayudan a manipular la información y sus fases y técnicas aplicadas a la toma de decisiones. (https://youtu.be/yoSqojO2-CQ)

# 5. Conocimiento y Sabiduría

#### En base a toma de decisiones..

![img](https://solomongo.com/datamining/images/charts.png)

 CREAR UN DASHBOARD



 Las aplicaciones de la minería de datos ayudan a un@ ordenamient@ o a un [CISO, CSO, CEO, ](https://www.incibe.es/empresas/blog/roles-en-ciberseguridad-desde-el-ceo-los-usuarios-finales) etc.. a tomar decisiones informadas. En consecuencia, las interacciones generan Business Intelligence (BI) que ayuda a las empresas a utilizar y convertir la información y el conocimiento disponibles en tiempo positivo para el incremento empresarial.

 Además, las técnicas de minería de datos descubren información oculta de clientes y productos para las empresas que pueden proporcionar conocimientos valiosos (SABIDURÍA) para predecir comportamientos, hábitos de consumo, tendencias del mercado, estudio de la competencia, feedbacks, etc. Se aglutinan en Cuadros de Mando Integrales - CMI (balanced scorecard) y pueden representarse en Dashboard interactivos..



 VER EJEMPLOS DASHBOARDS 



#  Infografías temáticas:

Todo esto ayuda a memorizar o asentar conocimientos y prácticas, resumiendo lo más importante de muchos de los contenidos.



![Escala del Aprendizaje](https://solomongo.com/datamining/images/infos/info1.png)

![Sensores de Datos](https://solomongo.com/datamining/images/infos/info3.png)

![Objetivos D.M](https://solomongo.com/datamining/images/infos/info4.png)

![Arquitectura O.L.A.P](https://solomongo.com/datamining/images/infos/info5.png)

![Procesos D.M](https://solomongo.com/datamining/images/infos/info9.png)

![Programas para Minería](https://solomongo.com/datamining/images/infos/info7.png)

![Predicción 2024](https://solomongo.com/datamining/images/infos/info8.png)

![Guía de Ayuda](https://solomongo.com/datamining/images/infos/info10.png)