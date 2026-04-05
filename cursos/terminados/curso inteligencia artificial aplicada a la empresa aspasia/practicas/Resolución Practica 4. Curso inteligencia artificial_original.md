**Actividad 4. Decisiones inteligentes: explorando el aprendizaje por refuerzo en la empresa**



Aplicación de aprendizaje por refuerzo en marketing



Un agente (como un vendedor) realiza acciones (como enviar correos electrónicos, mostrar anuncios u ofrecer descuentos) en un entorno (como un mercado, un sitio web o una red social) y recibe recompensas (como clics, conversiones o ventas) o sanciones (como cancelaciones de suscripción, rebotes o quejas) en función de los resultados.

El objetivo del agente es maximizar la recompensa total a lo largo del tiempo aprendiendo de su propia experiencia y mejorando su política (la estrategia que determina qué acción tomar en cada situación).



El aprendizaje por refuerzo puede ayudar a personalizar mensajes y ofertas de marketing en función de las preferencias, el comportamiento y los comentarios de cada cliente, así como a adaptarse a las condiciones cambiantes del mercado, las necesidades de los clientes y las acciones de la competencia. De esta manera, puede responder de manera rápida y efectiva a nuevas oportunidades y desafíos.

Se ha utilizado en una variedad de dominios y escenarios de marketing. Por ejemplo, se puede utilizar para optimizar el tiempo, la frecuencia, el contenido y la línea de asunto de las campañas de correo electrónico, las ofertas, la ubicación y la creatividad de los anuncios en línea, el precio de los productos o servicios y las recomendaciones de productos, servicios o contenido que reciben los clientes. 



En un caso en concreto, el sistema de recomendaciones de Netflix es una herramienta de marketing porque está diseñado para mantener a los usuarios comprometidos y aumentar la retención. Al ofrecer sugerencias personalizadas basadas en datos de comportamiento, el algoritmo crea una experiencia de usuario positiva, fomenta el consumo de más contenido e impulsa el éxito del servicio.

Estas listas de recomendaciones óptimas para usuarios teniendo en cuenta un presupuesto de tiempo finito. A menudo se ignora el factor de tiempo finito para tomar una decisión, este tiempo se utiliza para elegir lo que quiere ver: leer trailers, mostrar la vista previa, etc. 

El sistema de recomendación presenta una lista unidimensional de K elementos al usuario (en una configuración simplificada); el usuario tiene un presupuesto de tiempo modelado como un número real positivo. El problema se puede modelar con dos características: relevancia y costo. Cuando el usuario evalúa un ítem de la lista se consume el costo (tiempo) y cuando termina el presupuesto el usuario no puede evaluar otros ítems sugeridos. Cada elemento tiene una probabilidad entre 0 y 1 de ser consumido y la probabilidad de elegir un elemento depende no solo de la relevancia del elemento, sino también de la cantidad de elementos que el usuario puede examinar.

![img](https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/news/2022/09/Netflix-optimal-recommendation/en/resources/5figure-1-1663058558768.jpg)

El concepto clave es el estado actual y la acción tomada por el agente. 

En este ejemplo podemos definir las partes del aprendizaje profundo:

agente: El sistema de recomendación.

entorno: la interacción entre el usuario y el sistema de recomendación. El sistema de recomendación (agente) construye la lista de recomendaciones seleccionando repetidamente los k elementos que considera oportunos en cada slot. El entorno se caracteriza por el presupuesto de tiempo y los elementos examinados en la lista en pasos particulares. En el mundo real. el presupuesto de tiempo del usuario es desconocido y se puede estimar mediante los datos históricos del usuario (por ejemplo, cuánto tiempo se desplazó el usuario antes de abandonar en los registros de datos históricos). El algoritmo de aprendizaje por refuerzo utilizado para este problema se basa en estimar el retorno, Aprendizaje de la diferencia temporal para estimar la función de valor.

La simulación es muy útil para estudiar y comprender mejor el problema. Con la simulación, se entrenan y comparan varios algoritmos de recomendación. Para evaluar las actuaciones, se utiliza una métrica simple como es el número promedio de éxito del estado generado denominado tasa de reproducción. Además de la tasa de reproducción, es importante considerar el tamaño efectivo de la pizarra: una de las formas de mejorar la tasa de reproducción es construir pizarras efectivas más tardías; esta métrica es importante para comprender el mecanismo de los algoritmos de recomendación.

Gracias a la flexibilidad de la simulación y la configuración de los parámetros de simulación, el equipo de Netflix aprendió a construir pizarras óptimas según la política utilizando [el algoritmo SARSA](https://en.wikipedia.org/wiki/State–action–reward–state–action)  Comparando el modelo RL y el [bandido contextual](https://towardsdatascience.com/contextual-bandits-and-reinforcement-learning-6bdfeaece72a) , las actuaciones son mucho mejores para el enfoque de aprendizaje por refuerzo tanto para el tamaño efectivo de la pizarra como para la tasa de reproducción. En particular, para la tasa de reproducción, el resultado es un aumento estadísticamente significativo en la tasa de reproducción para usuarios de presupuesto pequeño a mediano.

El aprendizaje [sobre la política](https://www.baeldung.com/cs/off-policy-vs-on-policy) es fácil de simular, pero es difícil de ejecutar en configuraciones de recomendación realistas porque los datos son generados por una política diferente (política de comportamiento) y el objetivo es aprender una nueva (mejor) política a partir de estos datos. En este caso, el [Q-learning](https://en.wikipedia.org/wiki/Q-learning) es la técnica que permite la función de aprendizaje de valores óptimos en un entorno fuera de política.

Se comparan Q-learning y SARSA de configuración en política y el resultado es que Q-learning parece estar generando tamaños de pizarra efectivos muy grandes sin mucha diferencia en la tasa de reproducción. Este resultado es interesante y aún poco claro; es por eso que necesita más investigación para ser completamente entendido.



# Cómo funciona el sistema de recomendaciones de Netflix

Nuestro negocio es un modelo de servicio de suscripción que ofrece recomendaciones personalizadas para ayudarte a encontrar series, películas y juegos que creemos que te pueden gustar. Para ello, hemos creado un innovador sistema de recomendaciones. En este artículo se ofrece una descripción detallada de nuestro sistema de recomendaciones en términos sencillos.

### Conceptos básicos

Cada vez que accedes al servicio de Netflix, nuestro sistema de recomendaciones trata de ayudarte a encontrar una serie, película o juego para que disfrutes de ellos con facilidad. Calculamos la probabilidad de que disfrutes de un título concreto de nuestro catálogo en función de una serie de factores, entre los que se encuentran:

- Tus interacciones con nuestro servicio (como tu historial de visualización y cómo has clasificado otros títulos)
- Otros miembros con gustos y preferencias similares en nuestro servicio, y
- Información sobre los títulos, como su género, categorías, actores, año de estreno, etc.

Además de saber lo que has visto en Netflix para personalizar mejor las recomendaciones, también tenemos en cuenta factores como los siguientes:

- La hora del día en la que ves Netflix
- Los idiomas que prefieres
- Los dispositivos que usas para ver Netflix, y
- Cuánto tiempo has disfrutado de un título de Netflix.

Todas estas señales se usan como algunas de las informaciones que procesamos en nuestros algoritmos. Un algoritmo es un proceso o conjunto de reglas que se siguen en una operación de resolución de problemas. El sistema de recomendaciones no incluye información demográfica (como edad o género) como parte del proceso de toma de decisiones.

Si no se te ofrece algo que deseas ver, siempre puedes buscar en el catálogo disponible. Intentamos facilitarte y agilizarte al máximo la búsqueda. Cuando introduces una consulta de búsqueda, los principales resultados que te devolvemos se basan en una serie de factores, como las acciones de otros suscriptores que han introducido la misma consulta, consultas similares o nuestra predicción de lo que te gustaría disfrutar en Netflix, entre otros.

A continuación, te incluimos una descripción de cómo funciona el sistema a lo largo del tiempo y cómo esos datos influyen en lo que te presentamos.

### Activar el sistema de recomendaciones

Al crear tu cuenta de Netflix o añadir un [nuevo perfil](https://help.netflix.com/es-ES/node/10421) en tu cuenta, te solicitamos que elijas algunos títulos que te gusten. Usamos esos títulos para iniciar tus recomendaciones. Es opcional elegir algunos títulos que te gusten. Si eliges renunciar a este paso, comenzaremos recomendándote un conjunto diverso y popular de títulos.

Una vez que empieces a ver títulos en el servicio, esto «reemplazará» cualquier preferencia inicial que nos hayas indicado. A medida que continúes disfrutando de Netflix con el tiempo, y a la hora de impulsar nuestro sistema de recomendaciones, los títulos con los que hayas interactuado más recientemente tendrán más peso que aquellos con los que hayas interactuado en el pasado.

### Filas, orden y representación del título

Cuando accedas a la página de inicio de Netflix, nuestros sistemas habrán clasificado los títulos y los habrán colocado de forma que presenten el mejor orden posible para que puedas disfrutar de ellos.

En cada página hay varias capas de personalización. Por ejemplo, en una fila, podemos personalizar lo siguiente:

- La elección de la fila (como Seguir viendo)
- Qué títulos aparecen en la fila, y
- El orden de esos títulos.

Los títulos más recomendados aparecen en la parte superior. Los títulos más recomendados aparecen de izquierda a derecha de cada fila, a menos que hayas seleccionado el idioma árabe o hebreo en tu sistema, en cuyo caso irán de derecha a izquierda.

### Cómo mejoramos nuestro sistema de recomendaciones

Tenemos en cuenta los comentarios de cada visita al servicio de Netflix (por ejemplo, qué títulos empiezas a ver, si los terminas y cómo los valoras, por ejemplo con pulgares hacia arriba) y actualizamos continuamente nuestros algoritmos con esas señales para mejorar la precisión de su predicción sobre lo que es más probable que te guste ver. Nuestros datos, algoritmos y sistemas informáticos siguen alimentándose unos a otros para producir recomendaciones actualizadas, y conseguir de este modo que tu experiencia en Netflix siga siendo relevante y útil.



El algoritmo de Netflix es un sistema de inteligencia artificial que analiza el comportamiento de los usuarios para crear recomendaciones personalizadas. 

Utiliza datos como el historial de visualización, búsquedas, calificaciones, tiempo de reproducción y hasta las imágenes de previsualización que se seleccionan para organizar el contenido en la página de inicio y mostrar a cada persona lo que probablemente le interese más.



Cómo funciona

- **Análisis de datos:** 

  Recopila información de cada perfil, incluyendo qué series y películas se ven, cuánto tiempo se dedican a ellas, las valoraciones que se dan y los contenidos que se buscan.

  

- **Personalización:** 

  La página de inicio de cada usuario se personaliza para que el contenido más relevante aparezca en la parte superior y las filas se ordenan según las preferencias individuales.

  

- **Personalización de imágenes:** 

  Netflix crea hasta cinco imágenes diferentes para cada título y muestra una u otra según el historial de navegación del usuario. 

  Por ejemplo, si un usuario tiende a ver series con un estilo más oscuro, se le mostrará una imagen de ese tipo.

  

- **Consideraciones adicionales:** 

  También toma en cuenta el idioma preferido, el tipo de dispositivo y los horarios de uso.

  

- **Otros usuarios:** 

  El algoritmo no solo se basa en los datos de un solo usuario, sino también en los hábitos de otros usuarios con gustos similares.

  

Objetivo principal

- **Evitar que los usuarios abandonen el servicio:** 

  El objetivo principal es que los usuarios encuentren algo que ver rápidamente para evitar que abandonen la plataforma.

- **Mantener al usuario enganchado:** 

  Al mostrarle contenido que realmente le puede interesar, se fomenta el consumo continuo y se busca que permanezca en el servicio por más tiempo. 



Netflix, HBO o Disney+ nos permiten tener acceso a un catálogo de contenidos audiovisuales (tanto clásicos como estrenos y formatos de producción propia) sin que tengamos que trasladarnos a ningún lado y gracias a su aplicación para tablets o smartphone podemos consumir su contenido desde cualquier lugar. 

Entre tanta oferta, es complicado elegir qué ver, por eso las plataformas cuentan con un sistema de recomendaciones que te sugiere qué podría gustarte. 

En ocasiones esas sugerencias son acertadas, pero en otras no tanto. Fijémonos en el caso de Netflix, que usa para recomendarte contenido el llamado “machine learning”, para que sus algoritmos vayan aprendiendo según el uso que realiza el usuario, pero… ¿Qué se tiene en cuenta para poder crear ese listado? **¿Cómo funciona el algoritmo de Netflix?** 

Algunos de esos aspectos se saben y otros se desconocen. Pongamos un ejemplo. Netflix conoce el número de horas que pasas usando su plataforma y el tipo de contenido que sueles consumir. Eso significa que si usas Netflix para ver series de ficción nacionales, te recomendará que sigas viendo otras series de ficción producidas en España, en vez de películas de estrenos norteamericanas o documentales. 

“Sabemos a qué hora del día se conecta nuestro cliente, cuánto tiempo pasa en la plataforma, sabemos qué vio antes y qué después. Incluso sabemos si lo hizo desde el ordenador, desde una tablet o el móvil.” Explicó Todd Yellin, vicepresidente de producto de la compañía, en “See what´s next”, evento en el que Netflix presentó sus principales novedades para este año. 

“El big data, como me gusta decir, es una gran cantidad de basura que esconde diamantes. Lo que hacen los algoritmos de “machine learning” es revelar y mostrar cuáles son esos diamantes.” 

De este modo, es como llegan a la conclusión de cuáles son los tipos de contenidos que deben seguir creando para satisfacer las necesidades de la mayoría de la audiencia, o por lo menos, de la compañía. 

El algoritmo de Netflix recopila toda la información en su base de datos. Es más, en cada cuenta de Netflix se genera una base de comportamiento distinta para cada uno de los perfiles creados. De este modo, no se mezclan gustos, ni recomendaciones. Es decir, que las recomendaciones que aparezcan en tu perfil, no tienen por qué ser las mismas que aparezcan en el perfil de tu hermano, o de tu mujer o de la persona con la que compartas la cuenta. 

Las recomendaciones que el análisis de datos de Netflix hace para una determinada película o serie, no son iguales para los usuarios. Por ejemplo, Netflix crea cinco imágenes por cada serie o película, y en función de los hábitos de navegación del usuario, y de los carteles en los que pulsó en el pasado, muestra una u otra. Pueden incluso activarte por defecto los subtítulos o traducciones de películas y series cuando ya has visto contenido similar de esa manera. 

Netflix asegura que esa información que recopila no se comparte ni se vende a terceros, y que es exclusivamente para uso interno. Lo que se sabe hoy es que los datos son el nuevo oro y, en esto, los algoritmos de las grandes empresas tecnológicas son insanamente ricos. 







https://cjavaperu.com/2022/09/el-nuevo-algoritmo-de-netflix-ofrece-listas-de-recomendaciones-optimas-para-usuarios-con-un-presupuesto-de-tiempo-finito/

- ¿Quién actúa como agente en el sistema?
- ¿Qué acciones puede tomar y que recompensas recibe?
- ¿Cómo se define el entorno y cómo evoluciona?
- ¿Cuál es el objetivo del sistema?
- ¿Qué beneficios se ha obtenido con su implementación?



1. ¿Qué tipo de decisiones aprende a tomar el agente y en qué contexto?
2. ¿Qué impacto tiene el diseño de la función de recompensa en los resultados?
3. ¿Cuáles son los principales retos técnicos o de implementación identificados?
4. ¿Qué ventajas competitivas ofrece esta técnica frente a otras estrategias de automatización?
5. ¿Podrías imaginar una aplicación de RL en tu área profesional o sector? Justifica tu propuesta

