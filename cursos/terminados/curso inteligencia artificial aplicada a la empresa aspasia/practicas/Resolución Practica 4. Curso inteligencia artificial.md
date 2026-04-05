#### **Actividad 4. Decisiones inteligentes: explorando el aprendizaje por refuerzo en la empresa**



En esta actividad he decidido hablar sobre el uso del **aprendizaje por refuerzo** en **marketing**, en este sector el **agente** (como un vendedor) realiza **acciones** (como enviar correos electrónicos, mostrar anuncios u ofrecer descuentos) en un **entorno** (como un mercado, un sitio web o una red social) y recibe **recompensas** (como clics, conversiones o ventas) o sanciones (como cancelaciones de suscripción, rebotes o quejas) en función de los resultados.

El objetivo del agente es maximizar la recompensa total a lo largo del tiempo aprendiendo de su propia experiencia y mejorando su **política** (estrategia que determina qué acción tomar en cada situación).

El aprendizaje por refuerzo puede ayudar a personalizar mensajes y ofertas en función de las preferencias, el comportamiento y los comentarios de cada cliente, así como a adaptarse a las condiciones cambiantes, las necesidades de los clientes y las acciones de la competencia. De esta manera, puede responder de manera rápida y efectiva a nuevas oportunidades y desafíos.

Un ejemplo lo podemos ver en plataformas de streaming como Netflix, HBO o Disney+, que permiten tener acceso a un gran catálogo de contenidos audiovisuales. En el que es complicado elegir qué ver, por eso las plataformas cuentan con un sistema de recomendaciones. 

En el caso de Netflix, en su sistema de recomendaciones, sus algoritmos van aprendiendo según el uso que realiza el usuario, para ello al crear una cuenta de Netflix o añadir un nuevo perfil en tu cuenta, se solicita elegir algunos títulos que nos guste para iniciar las recomendaciones. (Si no se eligen, nos recomienda para iniciar por ejemplo los más populares).

Cada vez que se accede al servicio de Netflix, el sistema de recomendaciones habrán clasificado los títulos y los habrán colocado de forma que presenten el mejor orden posible para que puedas disfrutar de ellos (serie, película o juego), y esto «reemplazará» cualquier preferencia anterior. 

La probabilidad de que disfrutes de un título concreto del catálogo se calcula en función de:

- Interacciones con el servicio (historial de visualización, cómo se han clasificado otros títulos,...)
- Otros miembros con gustos y preferencias similares.
- Información sobre los títulos: género, categorías, actores, año de estreno, etc.
- La hora del día, idioma, tipo de dispositivo en que se utiliza Netflix y tiempo disfrutado de un título.

Los títulos más recomendados aparecen en la parte superior de izquierda a derecha de cada fila (excepto que se haya seleccionado el idioma árabe o hebreo, que irán de derecha a izquierda). 



Para mejorar el sistema de recomendaciones, se tiene en cuenta los comentarios de cada visita a Netflix (títulos que empiezas a ver, si los terminas, cómo los valoras,...), así se actualizan continuamente los datos, y algoritmos para producir recomendaciones actualizadas. Ejemplos:

- Si se ven series de ficción nacionales, recomendará que sigas viendo otras series de ficción producidas en España, en vez de películas de estrenos norteamericanas o documentales. 
- Si un usuario tiende a ver series con un estilo más oscuro, se le mostrará una imagen de ese tipo. (Netflix crea hasta cinco imágenes diferentes para cada título y muestra una u otra según el historial de navegación del usuario, puede incluso activar por defecto los subtítulos o traducciones de películas y series cuando ya has visto contenido similar de esa manera. 

Objetivo principal:

- **Evitar que los usuarios abandonen el servicio** al encontrar algo que ver rápidamente.
- **Mantener al usuario enganchado:** Al mostrarle contenido que le puede interesar, se fomenta el consumo continuo y se busca que permanezca en el servicio por más tiempo. 

El algoritmo de Netflix recopila toda la información en su base de datos. Se genera una base de comportamiento distinta para cada uno de los perfiles creados en una cuenta. De este modo, no se mezclan gustos, ni recomendaciones. Es decir, las recomendaciones que aparezcan en tu perfil, no tienen por qué ser las mismas que aparezcan en el perfil de las personas con las que se comparte la cuenta. 

Netflix asegura que esa información que recopila no se comparte ni se vende a terceros, y que es exclusivamente para uso interno. (Privacidad)



El concepto clave es el estado actual y la acción tomada por el agente. El **agente** sería el sistema de recomendación, el **entorno**: la interacción entre el usuario y el sistema de recomendación. El agente construye la lista de recomendaciones (unidimensional de K elementos) (**acciones**) al usuario. Estas listas de recomendaciones tienen en cuenta, un factor de tiempo finito (a menudo se ignora) para tomar una decisión, este tiempo se utiliza para elegir lo que quiere ver: leer trailers, mostrar la vista previa, etc. 

<img src="https://imgopt.infoq.com/fit-in/1200x2400/filters:quality(80)/filters:no_upscale()/news/2022/09/Netflix-optimal-recommendation/en/resources/5figure-1-1663058558768.jpg" alt="img" style="zoom: 20%;" />

Los beneficios que se obtienen es que los usuarios consuman más contenido, mantengan sus suscripciones y/o se generen nuevas suscripciones, por lo que impulsa el éxito del servicio.



En mi área profesional que es programación, se utiliza en Lenguajes y bibliotecas como:

- **Python:** lenguaje más utilizado en RL por su facilidad de uso y a su extenso ecosistema de bibliotecas.
- **[C++](https://www.google.com/search?q=C%2B%2B&sca_esv=3d3223ebd0a7bab1&sxsrf=AE3TifMTR97JFtzM9k0TwzQwsCUUVnSVNQ%3A1763556811468&ei=y70dacyqHICSxc8PlPV7&ved=2ahUKEwiem6emof6QAxV9AtsEHV6TPT8QgK4QegQIBBAC&uact=5&oq=lenguaje+de+programación+aprendizaje+por+refuerzo&gs_lp=Egxnd3Mtd2l6LXNlcnAiMmxlbmd1YWplIGRlIHByb2dyYW1hY2nDs24gYXByZW5kaXphamUgcG9yIHJlZnVlcnpvMgQQIxgnMgUQABjvBTIIEAAYogQYiQUyBRAAGO8FMggQABiiBBiJBUiNyQFQ6SNY9sUBcAF4ApABAJgB1AGgAYQWqgEHMTUuMTAuMbgBA8gBAPgBAZgCFaAC0g_CAgQQABhHwgIKEAAYsAMY1gQYR8ICBxAAGIAEGA3CAgYQABgNGB7CAggQABiABBiiBMICBBAhGArCAgcQIxiwAhgnmAMA4gMFEgExIECIBgGQBgiSBwQ5LjEyoAfxoAGyBwQ3LjEyuAfAD8IHBzAuMTEuMTDIB0g&sclient=gws-wiz-serp&mstk=AUtExfDxTB9iBcbUcfEkfD9rUqbdNFf-11YxIZrOt_bEHe1b7KNUVoKBnlnC7XR3jhtDk5CbOYB05an4Eh5nA40COpdXsHU9aNU8-JIDLNlYs4tqFITaVliwlO8CCSjfsHtEOaCUSxrhrxVeRlYdlsj2XEyuf0YPGbwCjW4RusiL6yhQbSnpz_ZHe0F0XZR1c7LU93qOVJ4CWa4Ex3meeddj77sFlJNZnDxT4SsOOTNJZWC2Iz1ui4OoLaAsHatKY8byHfcYTPNDZOMYWw8SRIOVcmFeUkjgU9RCXFqpNbz5D-rqnA&csui=3):** Se utiliza a menudo para obtener un alto rendimiento en la implementación de algoritmos de RL.
- **[TensorFlow](https://www.google.com/search?q=TensorFlow&sca_esv=3d3223ebd0a7bab1&sxsrf=AE3TifMTR97JFtzM9k0TwzQwsCUUVnSVNQ%3A1763556811468&ei=y70dacyqHICSxc8PlPV7&ved=2ahUKEwiem6emof6QAxV9AtsEHV6TPT8QgK4QegQIBBAE&uact=5&oq=lenguaje+de+programación+aprendizaje+por+refuerzo&gs_lp=Egxnd3Mtd2l6LXNlcnAiMmxlbmd1YWplIGRlIHByb2dyYW1hY2nDs24gYXByZW5kaXphamUgcG9yIHJlZnVlcnpvMgQQIxgnMgUQABjvBTIIEAAYogQYiQUyBRAAGO8FMggQABiiBBiJBUiNyQFQ6SNY9sUBcAF4ApABAJgB1AGgAYQWqgEHMTUuMTAuMbgBA8gBAPgBAZgCFaAC0g_CAgQQABhHwgIKEAAYsAMY1gQYR8ICBxAAGIAEGA3CAgYQABgNGB7CAggQABiABBiiBMICBBAhGArCAgcQIxiwAhgnmAMA4gMFEgExIECIBgGQBgiSBwQ5LjEyoAfxoAGyBwQ3LjEyuAfAD8IHBzAuMTEuMTDIB0g&sclient=gws-wiz-serp&mstk=AUtExfDxTB9iBcbUcfEkfD9rUqbdNFf-11YxIZrOt_bEHe1b7KNUVoKBnlnC7XR3jhtDk5CbOYB05an4Eh5nA40COpdXsHU9aNU8-JIDLNlYs4tqFITaVliwlO8CCSjfsHtEOaCUSxrhrxVeRlYdlsj2XEyuf0YPGbwCjW4RusiL6yhQbSnpz_ZHe0F0XZR1c7LU93qOVJ4CWa4Ex3meeddj77sFlJNZnDxT4SsOOTNJZWC2Iz1ui4OoLaAsHatKY8byHfcYTPNDZOMYWw8SRIOVcmFeUkjgU9RCXFqpNbz5D-rqnA&csui=3) y [PyTorch](https://www.google.com/search?q=PyTorch&sca_esv=3d3223ebd0a7bab1&sxsrf=AE3TifMTR97JFtzM9k0TwzQwsCUUVnSVNQ%3A1763556811468&ei=y70dacyqHICSxc8PlPV7&ved=2ahUKEwiem6emof6QAxV9AtsEHV6TPT8QgK4QegQIBBAF&uact=5&oq=lenguaje+de+programación+aprendizaje+por+refuerzo&gs_lp=Egxnd3Mtd2l6LXNlcnAiMmxlbmd1YWplIGRlIHByb2dyYW1hY2nDs24gYXByZW5kaXphamUgcG9yIHJlZnVlcnpvMgQQIxgnMgUQABjvBTIIEAAYogQYiQUyBRAAGO8FMggQABiiBBiJBUiNyQFQ6SNY9sUBcAF4ApABAJgB1AGgAYQWqgEHMTUuMTAuMbgBA8gBAPgBAZgCFaAC0g_CAgQQABhHwgIKEAAYsAMY1gQYR8ICBxAAGIAEGA3CAgYQABgNGB7CAggQABiABBiiBMICBBAhGArCAgcQIxiwAhgnmAMA4gMFEgExIECIBgGQBgiSBwQ5LjEyoAfxoAGyBwQ3LjEyuAfAD8IHBzAuMTEuMTDIB0g&sclient=gws-wiz-serp&mstk=AUtExfDxTB9iBcbUcfEkfD9rUqbdNFf-11YxIZrOt_bEHe1b7KNUVoKBnlnC7XR3jhtDk5CbOYB05an4Eh5nA40COpdXsHU9aNU8-JIDLNlYs4tqFITaVliwlO8CCSjfsHtEOaCUSxrhrxVeRlYdlsj2XEyuf0YPGbwCjW4RusiL6yhQbSnpz_ZHe0F0XZR1c7LU93qOVJ4CWa4Ex3meeddj77sFlJNZnDxT4SsOOTNJZWC2Iz1ui4OoLaAsHatKY8byHfcYTPNDZOMYWw8SRIOVcmFeUkjgU9RCXFqpNbz5D-rqnA&csui=3):** Son bibliotecas de aprendizaje automático que se usan para crear redes neuronales, un componente clave en el aprendizaje profundo por refuerzo.
- **[OpenAI Gym](https://www.google.com/search?q=OpenAI+Gym&sca_esv=3d3223ebd0a7bab1&sxsrf=AE3TifMTR97JFtzM9k0TwzQwsCUUVnSVNQ%3A1763556811468&ei=y70dacyqHICSxc8PlPV7&ved=2ahUKEwiem6emof6QAxV9AtsEHV6TPT8QgK4QegQIBBAH&uact=5&oq=lenguaje+de+programación+aprendizaje+por+refuerzo&gs_lp=Egxnd3Mtd2l6LXNlcnAiMmxlbmd1YWplIGRlIHByb2dyYW1hY2nDs24gYXByZW5kaXphamUgcG9yIHJlZnVlcnpvMgQQIxgnMgUQABjvBTIIEAAYogQYiQUyBRAAGO8FMggQABiiBBiJBUiNyQFQ6SNY9sUBcAF4ApABAJgB1AGgAYQWqgEHMTUuMTAuMbgBA8gBAPgBAZgCFaAC0g_CAgQQABhHwgIKEAAYsAMY1gQYR8ICBxAAGIAEGA3CAgYQABgNGB7CAggQABiABBiiBMICBBAhGArCAgcQIxiwAhgnmAMA4gMFEgExIECIBgGQBgiSBwQ5LjEyoAfxoAGyBwQ3LjEyuAfAD8IHBzAuMTEuMTDIB0g&sclient=gws-wiz-serp&mstk=AUtExfDxTB9iBcbUcfEkfD9rUqbdNFf-11YxIZrOt_bEHe1b7KNUVoKBnlnC7XR3jhtDk5CbOYB05an4Eh5nA40COpdXsHU9aNU8-JIDLNlYs4tqFITaVliwlO8CCSjfsHtEOaCUSxrhrxVeRlYdlsj2XEyuf0YPGbwCjW4RusiL6yhQbSnpz_ZHe0F0XZR1c7LU93qOVJ4CWa4Ex3meeddj77sFlJNZnDxT4SsOOTNJZWC2Iz1ui4OoLaAsHatKY8byHfcYTPNDZOMYWw8SRIOVcmFeUkjgU9RCXFqpNbz5D-rqnA&csui=3):** herramienta con entornos para crear y probar agentes de RL. 



https://cjavaperu.com/2022/09/el-nuevo-algoritmo-de-netflix-ofrece-listas-de-recomendaciones-optimas-para-usuarios-con-un-presupuesto-de-tiempo-finito/

https://computerhoy.20minutos.es/noticias/tecnologia/entendiendo-enemigo-como-funciona-sistema-recomendaciones-netflix-1084739
