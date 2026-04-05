# LARAVEL

## Livewire

Cuando queremos ejecutar una nueva accion, siempre llamamos una nueva ruta, es decir refrescamos la informacion, para ello se inventaron soluciones, para no tener que refrescar la información, por ejemplo estamos en un sistema para una entidad bancaria y hemos ubicado una calculadora de precios de hipoteca, que no puede utilizarse solo en frontal, si no que va a tener que utilizar el backend para acceder a los datos del historial que tenga el usuario en el banco. la solucion inicial podría ser hacer la calculadora sea en frontal, pero si la usamos utilizando backend (hariamos un formulario que hiciese una peticion a una nueva ruta que calculase el resultado y la devolviese a una nueva vista ), en este estaríamos refrescando la información. 

Para poder no refrescar y mantenernos en la misma página, acudimos a livewire o Inertia. (renderizado o injección parcial de contenido).

Con el esquema de renderizado parcial, vamos a modificar cual es el paradigma dentro de la arquitectura parcial de los frontales.

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 13-40-13.png) 

Lo primero que surgió fueron librerias de petición en segundo plano como AJAX, que nos permitia solicitar información, como si fuese una información secundaria como una api, para obtener los resultados y modificar el DOM de la página y cambiar parcialmente el dato.

Posteriormente se utilizo JQuery, y poco a poco se fueron buscando mas utilizades para la renderización parcial para la utilización como en las redes sociales, (donde etiquetamos personas, damo me gusta y no queremos que la página vuelva a cargar), donde empezó a hacerse  imprescindible la renderizacion.

Se creo el modelo MVM (modelo vista modelo) mediante el cual nos permitía hacer construcciones de frontales que podian hacer el renderizado parcial del contenido, este tipo de librerias se basan en la modificacion de como conocemos los frontales.



Antes los html era contenido que terminabamos lanzando o renderizando en nuestro navegador de usuario, sin embargo ahora nuestro interes no va a ser tanto el de renderizar el html de forma estática (server side rendering), 

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 13-50-57.png)

si no lo que vamos es generar una serie de componentes, pensando en como podemos desglosar nuestra página en una unidad mínima que vamos a llamar componente, añadiendo una composición con diferentes componentes, llegamos a la formación de la vista (Por ejemplo los componentes blade que hicimos con las tarjetas), Por ejemplo, podemos tener el componente menu, componente pie, ...

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 13-50-46.png)

Hay que pensar que las vistas no es una única entidad, si no que va a estar formada por diferentes componentes, por ejemplo pensar esta vista va a tener el componente menu, el componente mensaje flash, componente tarjeta, el componente footer. Aqui es donde se utilizar el MVM (modelo vista modelo) , para entender esto en profundidad es interesante conocer vue, puesto que se vasa en este modelo. 

Aqui cada componente va a tener un funcionamiento propio, que es utilizable en numerosas vistas, por ejemplo el componente calculadora,  se puede utilizar en numerosas vistas, por tanto tiene la ventaja de no tener que refrescar toda la vista, si no que tambien poder conseguir una mejor utilibilidad de los componentes.

Conseguimos no refrescar, por que cada componente no solo va a contener la vista, si no que tambien va a contener la lógica que necesita para funcionar, es decir si yo genero el componente de la calculadora, éste va a contener la vista de la calculadora (template de la calculadora) y tambien los datos y funciones necesarias para hacer funcionar esa calculadora.

![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-18 14-04-42.png)

Asi lo que queremos es que la vista no sea estática, si no que lo que queremos son vistas dinámicas en las que va a poder refrescar el contenido sin la necesidad de llamar a otra url diferente, ademas buscamos el beneficio de tener intefaces mas utilizables ya que vamos a encapsular su componente.

Asi cuando instalamos breeze o jetstream vimos que las vistas utilizaban componentes, que empezaban con las etiquetas <x-nombre componente> y que eran las que conformaban las vistas, y estos se almacenaban en la carpeta components. 

Por defecto no viene laravel con esta configuración , por que igual que tiene ventajas, tambien tiene desventajas:

- El fomato de renderizacion parcializada, es que nos arrastra fallos en seo (posicionamiento) para la busqueda por que la información no ha sido injectada, por eso hay que hacer una distinción de la funcionalidad que va a tener cada parte de la aplicación. Por ejemplo facebook o instagram, el muro no es interesante para el seo de la página, sera importante para el seo la presentación de la aplicacion de facebook que estará fuera de la propia aplicacion.



Librerias y frameworks reactivos:

- react: desarrollada por facebook
- vue: desarrollada por la comunidad
- angular
- svelte

Estan desarrolladas para trabajar principalmente en javascript, o su superconjunto typescript. olvidando realizar peticiones a AJAX o de JQuery que se necesitaban para hacer ese renderizado parcial.



Si utilizamos laravel para un backend puro que va a estar arrojando una api, este tipo de tecnologias son fantásticas, porque los desarrolladores de backend al no preocuparse de las vistas, este tipo de tecnologías vienen a sumar, seguimos desarrollando el backend como siempre, y con estas tecnologias conseguimos que puedan ser consumidos, otorgando nuevos beneficios al usuario. 

Para consolidar el backend con este tipo de tecnologias, surgen tambien las capas por grafos.



Si utilizamos laravel en estructura monolítica o parcialmente monolítica (api y monolito), aqui nos encontramos un problema, por que blade no es reactivo y habría que utilizar AJAX y no es lo que queremos. Para ello se utiliza livewire e inertia, que son las soluciones reactivas para los frontales. 



Inertia permite utilizar vue en las vistas de blade (añadir componentes de vue, para ello hay que saber vue) y livewire, permite obtener las mismas funcionalidades reactivas, pero con la sintaxis de blade.

Inertia al utilizar vue hay que saber javascript y en livewire se sigue utilizando php.



### Instalar livewire

Nos generamos un nuevo proyecto

Creamos un proyecto nuevo "livewireexample" para hacer los ejemplos de esta sección, hay que tener en cuenta que si vamos a utilizar utilidades propias de autenticación hay que tenerlo en cuenta a la hora de crear el proyecto para no tener problemas al instalar el paquete con posterioridad

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new livewireexample
cd livewireexample
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: livewireexample
2. Configuramos archivo .env



Instalar livewire

```bash
composer require livewire/livewire
```

Antes de empezar a trabajar hay que añadir a todas las vistas que utilicen los estilos y scripts de livewire, para ello creamos un layouts/app.blade.php donde los vamos a incluir

```html
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>@yield('title')</title>
    @livewireStyles
</head>
<body>
    @yield('content')
    @livewireScripts
</body>
</html>
```

@livewireStyles: incluye los estilos de livewire

@yield('content'): para incluir el contenido que le llegue

@livewireScripts: incluye los scripts de livewire

@yield('title'): para incluir el titulo que le llegue



Para probar, borramos el contenido de welcome.blade.php y realizamos el siguiente código

La documentación oficial está en : https://laravel-livewire.com/

Livewire utiliza AJAX internamente para hacer el renderizado de los componentes con un nuevo html, mutando al DOM (modelo de objeto de documento , es una interfaz de programación para los documentos HTML y XML) con los nuevos cambios.

1. Creamos un componente de livewire para hacer un contador

   ```
   php artisan make:livewire counter
   ```

   Esto nos crea una carpeta livewire en app con counter.php (Aqui va la lógica de los componentes de livewere) y en resources/views tambien ha creado una carpeta livewire con el archivo counter.blade.php (donde ubicaremos la vista del componente).

2. Vamos a utilizar el contador en la vista de welcome.blade.php los componentes siempre tienen que tener una etiqueta raiz donde incluye todo su contenido

3. En views/livewire/counter.blade.php 

   ```html
   <div>
       {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
       <h1>Hello from counter</h1>
   </div>
   ```

4. En welcome.blade.php, en lugar de pintar el hello world vamos a incluir el componente, hay dos maneras

   1. indicando el livewire

      ```html
      @extends('layouts.app')
      @section('title', 'Livewire example')
      
      @section('content')
          {{-- opcion 1 --}}
          @livewire('counter')
      @endsection
      ```

   2. Hacerlo parecido a vue, marcando una etiqueta

      ```html
      <livewire:counter />
      ```

      Se pueden añadir varios componentes a la vista, cuando la aplicación tiene un solo componente se denomina SPA (Single Page Application)

   3. Creamos un contador en counter.blade.php

      ```html
      <div>
          {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
          <h1>{{ $count }}</h1>
      </div>
      ```

      $count es una variable con el valor que va a pintar la vista

      La diferencia es que ahora a esta vista vamos a poder incluir vinculaciones a funciones que vamos a tener en la lógica, por ejemplo nos creamos un boton que va a ir incrementando el valor del contador, antes en blade lo habríamos hecho con una url con un enlace al que le pasaríamos los valores, ahora ya no, será la lógica la que haga la funcionalidad

      ```html
      <div>
          {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
          <h1>{{ $count }}</h1>
          <button wire:click="increment">Increment</button>
      </div>
      ```

      Para llamar a la función que va a hacer la funcionalidad, podríamos utilizar el evento onclick, pero lo vamos a hacer con la directiva `wire:click="increment"` 

   4. En Counter.php siempre tiene una función **render** que es la encargada de retornar la vista (renderización del componente), a diferencia de lo que ocurre con el método return view de la vista de blade,  nuestro componente está envolviendo este return view dentro de su función render, que es la que se va a encargar de hacer el migrate (actualización) del contenido en la vista, para que no tengamos que hacer el refresco en pantalla.

      ```php
      public function render()
      {
          return view('livewire.counter');
      }
      ```

      NOTA: cada componente va a tener una función render que es la que retornará la vista (renderización)

   5. ,Crear la lógica del componente, en Counter.php declaramos una variable publica (para poderla utilizar en todo el proyecto) que es la misma que se va a mostrar en la vista

      ```php
      public $count = 0;
      
      public function increment()
      {
          $this->count++;
      }
      ```

      Cuando se ejecuta en el navegador, observamos como se ejecuta el componente, sin recargar otra url, recarga el componente.



Pilares fundamentales:

1. wire:click: para vincular funciones (como en el ejemplo anterior)
2. hooks al ciclo de vida
3. data binding bidireccional: que nos permite vincular información entre la parte lógica (modelo) y la parte de la vista.



### Hook del ciclo de vida

Cuando cargamos el componente dentro de una vista, este componente va a tener un ciclo de vida dentro de nuestra aplicación, de tal forma que cuando es pintado por primera vez, es decir que esta componente ha sido montado, éste está a la escucha de posibles modificaciones, y cuando el contenido de éste se modifica, decimos que ocurre un evento dentro del ciclo de vida de actualización (este componente ha sido actualizado), por último podemos indicar que éste componente desaparezca de la vista, que en función de las condiciones que tenemos en nuestro contenido, decidamos que se oculte o eliminarlo de nuestra vista, sin haber abandonado nuestra vista. en este momento decimos que el componente ha sido destruido o desmontado. Además de estos momentos existen más, para ello existen funciones a utilizar cuando ocurre un evento (antes o después de la actualización). 

Por ejemplo, podríamos querer que cada vez que ocurra un evento de actualización, guardemos un log o hacer acciones paralelas.

mount: cuando el valor es creado

```php
public function mount()
{
	// this->count = 20;
    $this->fill(['count' => 20]);
}
```

Esta función se ejecuta cuando el componente es montado.

Da error `this->count por que como no esta montado no existe el count, por tanto lo hacemos asi: $this->fill(['count' => 20]);`

Ahora si ejecutamos el proyecto, cuando inicia, el valor por defecto es 20



updating: cuando se esta ejecutando (se ejecuta antes de actualizar)

updated: cuando es actualizado (se ejecuta después de actualizar)



### Data binding bidireccional

Se utilizará sobre todo en componentes para formularios 

Por ejemplo, para probar creamos un input en la vista counter.blade.php y declaramos una variable en el controlador

En el componente counter.php, declaramos una variable, para que según vayamos escribiendo el texto en el input se vaya guardando automáticamente en dicha variable.

```php
public $username = ""
```

Asi por ejemplo en la función click podemos hacer guardar username y podemos acceder a ésta y saber su contenido.

En la vista counter.blade.php

```html
<input type="text" wire:model.live="username"/>
<br />
<h3>{{ $username }}</h3>
```

La sintaxis es parecida a vue, cambiaría que en lugar de wire:model sería vue:model. Con wire:model vinculamos el valor del input con la variable username. Dibujamos el valor de la variable para ver como se va actualizando el valor de la variable según lo que escribamos en el input.

NOTA: en laravel 11 hay que poner wire:model.live="variable" en lugar de wire:model="variable" como en las versiones anteriores.



Ahora hacemos un ejemplo completo de livewire con crud.

1. Creamos un modelo Note con sus migraciones

   ```bash
   php artisan make:model Note --migration
   ```

2. Añadimos el guard al modelo Note

   ```php
   protected $guard="";
   ```

3. Contruimos la estructura de la migracion create_notes_table

   ```php
   public function up(): void
   {
       Schema::create('notes', function (Blueprint $table) {
           $table->id();
           $table->string("content")->nullable();
           $table->timestamps();
       });
   }
   ```

4. Ejecutamos las migraciones

   ```bash
   php artisan migrate
   ```

5. Aprovechamos los archivos de vista y logica de counter de livewire para el ejemplo

   1. En counte.blade.php

      ```html
      <div>
          {{-- A good traveler has no fixed plans and is not intent upon arriving. --}}
          <input type="text" wire:model.live="note" />
          <button wire:click="store">Save Note</button>
      </div>
      ```

   2. En Counter.php declaramos la variable note y creamos la función store que es la que va a guardar el valor de la nota en la bd

      ```php
      use App\Models\Note;
      
      public $note = "";
      
      public function store()
      {
          Note::create([
              "content" => $this->note
          ]);
      }
      ```

       Nos creamos además la variable feedback para indicarle al usuario que esta sucediendo, por ejemplo indique después de crear la nota, que la nota se ha creado

      ```php
      public $feedback ="";
      
      public function store()
      {
          Note::create([
              "content" => $this->note
          ]);
      
          $this->feedback = "Note created";
      }
      ```

      Y en la vista añadimos que dibuje el valor de feedback

      ```html
      <p style="color: red">{{ $feedback }}</p>
      ```

      

6. Podríamos modificar en la función render, que muestre las notas

   ```php
   public function render()
   {
       $notes = Note::all();
       return view('livewire.counter', compact('notes'));
   }
   ```

   Si nos diese error compact podríamos forzarlo `return view('livewire.counter', ['notes' => $notes]);`

   Y en la vista añadimos que las muestre

   ```html
   @foreach ($notes as $note)
       <p>{{ $note->content }}</p>
   @endforeach
   ```

7. Podríamos añadir a cada nota creada un botón para eliminar dicha nota

   1. En la vista modificamos

      ```html
      @foreach ($notes as $note)
              <p>{{ $note->content }} <button wire:click="destroy({{ note->id }})">Destroy</button></p>
          @endforeach
      ```

      

   2. En counter.php creamos la función delete

      ```php
      public function destroy($id){
          Note::destroy($id);
          $this->feedback = "Note deleted";
      }
      ```

8. Podríamos modificar la nota

   1. Modificamos en la vista, para añadir un boton para update (utilizamos el mismo input de crear)

      ```html
      <button wire:click="update({{ $note->id }})">Update</button>
      ```

   2. Creamos en counter.php la funcion update

      ```php
      public function update($id){
          $noteToUpdate = Note::find($id);
          $noteToUpdate->content = $this->note;
          $noteToUpdate->save();
          $this->feedback = "Note updated";
      }
      ```



## Inertia

Inertia se basa en la reactividad a traves de vue. Va a permitir a laravel utilizar vue en frontales, como un monolito moderno. De esta forma si no se conoce vue, puede ser mas complicado entenderlo.

Si sabemos javascript y vue es mejor utilizar Inertia, si no utilizar livewire (ambos son buenas opciones).

Nos generamos un nuevo proyecto

Creamos un proyecto nuevo "inertiaexample" para hacer los ejemplos de esta sección, hay que tener en cuenta que si vamos a utilizar utilidades propias de autenticación para no tener problemas al instalar el paquete con posterioridad

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new inertiaexample
cd inertiaexample
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: inertiaexample
2. Configuramos archivo .env



Vamos a utilizar también jetstream con inertia

```bash
composer require laravel/jetstream
php artisan jetstream:install inertia
```

NOTA: si quisiéramos instalar solo inertia sin jetstream ni breeze `composer require laravel/inertia`



Cargamos las migraciones

```bash
php artisan migrate
```



Si nos vamos a routes/web.php vemos que en lugar de retornar la vista con `return view` lo hace de la siguiente manera: `return Inertia:render`

```php
Route::get('/', function () {
    return Inertia::render('Welcome', [
        'canLogin' => Route::has('login'),
        'canRegister' => Route::has('register'),
        'laravelVersion' => Application::VERSION,
        'phpVersion' => PHP_VERSION,
    ]);
});
```

Retorna la vista con Inertia y el método render, enviando la vista y las variables que va a necesitar para funcionar.



Los **componentes de jetstream** están en `Resources/js/Components` y en dicho directorio contenemos por ejemplo el componente web.vue con el codígo escrito en vue.

1. Creamos un controlador

   ```bash
   php artisan make:controller ExampleController
   ```

2. Creamos una ruta en web.php

   ```php
   use App\Http\Controllers\ExampleController;
   
   Route::get('/example', [ExampleController::class, 'index'])->name('example');
   ```

3. Creamos un componente en vue en Resources/js/components , para ello creamos un archivo ExampleInertia.vue

   Los componentes de vue, van a tener mínimo 3 etiquetas: 

   - template: donde ubicamos la vista, el contenido html que va a ser renderizado.
   - script: donde está toda la lógica, los datos, las funciones que vamos a querer utilizar. Vue ofrece varias formatos de trabajo
     - Composition API: Se introdujo para abordar algunas de las limitaciones de la API de opciones. Permite a los desarrolladores utilizar un estilo de programación reactivo y funcional para crear componentes y ofrece una forma más flexible y expresiva de definir el comportamiento de los componentes.
     - Option API:  Implica el uso de un conjunto de opciones, como datos, métodos y propiedades calculadas, para definir el comportamiento y el estado de un componente.
     - Composition API en su versión reducida, que es la de script setup que es la que vamos a utilizar 
   - style: donde se encuentra el css que queremos aplicar, si le aplicamos `scoped`a los estilos css, quiere decir que estos son utilizados para sólo este componente. Asi evitamos colisión entre diferentes estilados. 

   ```vue
   <template>
     <!-- Código HTML -->
   </template>
   
   <script setup>
     // Código Javascript información sobre lógica y datos
   </script>
   
   <style scoped>
     /* Código CSS */
   </style>
   ```

   Nota: para los que no conocen vue, el nombre de los archivos se hace con (camelCase) , se suelen utilizar dos palabras, mas la extensión .vue. 

   Para nuestro ejemplo creamos:

   ```vue
   
   ```

   Si al ejecutarlo, muestra el error: `Unable to locate file in Vite manifest: resources/js/Pages/ExampleInertia.vue.`es porque hemos ubicado la página dentro del componente en lugar de en el directorio (pages) páginas. Esto pasa porque a veces vue no diferencia entre lo que es un componente y lo que es una pagina (ambos son lo mismo). Pero Jetstream si hace dicha distinción, por tanto si usamos Inertia con Jetstream (nuestro caso), va ha hacer una distinción entre un componente que es renderizado como una vista general, que va a ser llamado a través del controlador, y un componente que es renderizado dentro del contenido de nuestro proyecto. Para ello, lo que hay que hacer es mover el archivo de resources/js/components a resources/js/pages.

   

   Una vez movido el archivo ejecutar npm run para que se de cuenta del cambio.

   Esto es debido porque cuando generamos nuestro contenido con Inertia, lo que hace es que nuestro proyecto utiliza el app.js, que lo que le dice a la configuración de vue (main.ts o main.js) que tiene resolver el contenido del directorio pages 

   ```javascript
   resolve: (name) => resolvePageComponent(`./Pages/${name}.vue`, import.meta.glob('./Pages/**/*.vue')),
   ```

   Asi con `npm run dev` se recargan las páginas.

4. Creamos la función index en ExampleController.php para mostrar la vista, pero en lugar de retornarla con `return view();`lo hacemos a través de un componente vue `return inertia:render('NombreComponente')`

   ```php
   use Inertia\Inertia;
   
   public function index()
   {
   	return inertia::render('ExampleInertia');
   }
   ```

   Dentro de un componente vue, puede recibir prods (información necesaria para funcionar), en el caso de que estemos utilizando esté formato, cuando le pasamos los datos, nuestro componente lo utilizará como prods.

   



NOTA: 

El funcionamiento es el siguiente.

- La ruta llama a el controlador (como siempre)
- El controlador funciona como siempre, pero en lugar de retornar una vista (return view()) retorna un inertia::render. para que el sistema entienda que lo que va a estar renderizando es un componente vue, es decir que es estamos cargando es un .vue y no .blade.php
- En resources en lugar de en views trabaja con javascripts (directorio js)
  - layouts:
  - components:
  - pages: los componentes que vamos a utililzar para vincular directamente a una ruta. Estos componentes pueden ser cargados por que tenemos el app.js (que es el punto de entrada (se encarga de cargar la aplicación de vue)). 

Carga todo lo que se encuentre en el directorio de pages y por ello hay que cargarlo, ya que esta en javascript. 

Necesitamos el comando `npm run dev` si estamos en entorno de desarrollo o `npm run build` cuando ya vayamos a pasar a producción. 

Vue va a estar generando archivos estáticos que son los que dan soporte a todo el funcionamiento.

En este caso como estamos en un entorno dinámico a través de laravel, necesitamos indicar cuando levantamos el servicio, a la parte javascript que tiene que generar sus archivos para que todo funcione



Vamos a hacer un ejemplo de vue (vue puro)

Tenemos que tener en cuenta dos cosas:

1. El paso de información, cuando recepcionamos información dentro de un componente, éste va a ser tratado dentro del componente como una **PROP** ( atributos personalizados que podemos pasar a los componentes en Vue. Actúan como parámetros de un componente, permitiendo que datos específicos fluyan desde el componente padre hacia el componente hijo) 
2. Como navegamos, no vamos a estar utilizando el enrutador de vue, si no el de laravel, para ello vamos a tener un componente ya preconstruido que es **navlink** 



Ejemplo de reactividad

En resources/js/Pages/ExampleInertia.vue, tenemos la referencia que es un dato reactivo que vamos a poder estar utilizando, importamos las referencias de vue

```vue
<script setup>
    import{ref} from 'vue'

    const counter = ref(0);
    const increment = () => {
        counter.value++
    }
</script>
```

Declaramos una variable contador (counter) y una función de javascript (increment) que sume 1 al contador.

Las variables de <script> se pueden utilizar en el <template>, por ejemplo podriamos mostrar el valor del contador.

```vue
<template>
    <h1>{{ counter }}</h1>
	<button @click="increment">Increment</button>
</template>
```



Al ejecutar el ejemplo en el navegador, vemos que la reactividad funciona correctamente, es decir cada vex que pulsamos en el botón incremente el valor de counter sin recargar la pagina (recargar la url). 

A partir de aquí podríamos tratar los datos que recepcionamos, como una PROP y aprovecharnos de todo los que vue nos ofrece (layouts, la utilizacion de componentes dentro de la vista,...). 

Al estar en laravel las rutas no van a estar utilizando el enrutador de vue, si no el de laravel, para ello utilizamos el componente nav-link para vincularlo a la ruta que vayamos a utilizar. Y con este componente ya le podemos enviar los valores.

Por si acaso diese error, importamos el componente NavLink

```vue
<template>
    <h1>{{ counter }}</h1>
	<button @click="increment">Increment</button>
    <NavLink :href="route('login')">Login</NavLink>
</template>

<script setup>
    import{ref} from 'vue'
    import NavLink from '../Components/NavLink.vue'

    const counter = ref(0);
    const increment = () => {
        counter.value++
    }
</script>
```

 ![](/home/soa/Imágenes/Capturas de pantalla/Captura desde 2024-04-23 10-56-33.png)

Al pulsar en Login nos redirecciona a la página de Login.



## File Storage

Los proyectos van a necesitar almacenar fotos, pdf, archivos y poder servirlas cuando se necesite a los usuarios, del modo en que se necesite.

Suponemos que tenemos una aplicación que va a recepcionar diferentes archivos que vamos a tener que almacenar por parte del usuario, supongamos por ejemplo necesitamos guardar fotos de perfil de usuarios, o tenemos una plataforma de gestión y vamos a estar recibiendo facturas, tickets o otra información en pdf o zip, que nos va a enviar el usuario. Para ello vamos a tener que crear una estrategia que nos permita almacenar dichos archivos, para ello, sabemos que inicialmente, las bases de datos nos permiten almacenar por ejemplo archivos en blob (no es una solución interesante por que se puede acabar teniendo bases de datos muy pesadas), por lo tanto tenemos que recurrir a dos tipos de estrategias, para ello hay que modificar la configuración del sistema en laravel, pero ambas se van a utilizar de la misma manera en código:

### **Tipo de almacenamiento:**

1. **Almacenamiento en disco**, que sea el servidor el que albergue los archivos entregados por los usuarios, esta es la forma por defecto y nos va a permitir gestionar aplicaciones de una forma razonablemente interesante, para escalados de aplicación que no superen cierto volumen. Esto permite que nuestro propio hosting (servicio de alojamiento web que permite publicar un sitio web o aplicación en Internet) sea el que almacene y guarde nuestros archivos que los usuarios nos entregan.
2. Para aplicaciones altamente escalables, es decir cuando hacemos la construcción de un backend para una aplicación que va a sostener millones de usuarios con múltiples archivos por usuario o archivos pesados por cada uno de los usuarios, en este caso la estrategia es la de derivar el almacenado de estos ficheros en un **CDN** (Content Delivery Network) externo que nos permita almacenar y manejar toda esa información , alguno de los conocidos son **S3 de amazon web service**. Dentro del código el tratamiento va a ser el mismo, lo que hay que hacer es cambiar la configuración de la plataforma, para indicarle a laravel si debe buscar estos ficheros en disco o debe acudir con unas credenciales hacia un CDN

Por tanto descartamos el almacenamiento directamente en bases de datos, lo que si podemos almacenar es la url de donde se van a encontrar los archivos.



### **Rol de visualización. (privacidad del contenido)**

Como vamos a querer mostrar estos ficheros:

- si por ejemplo vamos a recepcionar archivos que vamos a mostrar de **forma pública** dentro de nuestro contenido, vamos a tener que almacenar el contenido en directorios de acceso público,  que luego nos permitan mostrar esos ficheros en nuestro sistema, un ejemplo es mostrar la foto de perfil de un usuario, esta foto nos va a interesar guardarla en un directorio publico, por que posteriormente vamos a querer mostrar esa foto dentro del perfil del usuario y que todos puedan ver esa foto de perfil.
- Por otro lado tenemos los **directorios privados**, aquello a los que no se va a poder acceder de una forma pública a través de la raíz de nuestro sitio. Un ejemplo un usuario va a tener que enviar un dni o pasaporte, para una aplicación bancaria, y dentro de ésta aplicación, se va a estar obteniendo información privada del usuario, que nos debe entregar por ejemplo un pdf con el dni, que no queremos servir de forma pública, es decir que ningún otro usuario pueda tener permisos de acceso a dicha información. 



Nos generamos un nuevo proyecto

Creamos un proyecto nuevo "storageexample" para hacer los ejemplos de esta sección.

```bash
alias laravel='/var/www/html/curso-laravel/vendor/bin/laravel'

laravel new storageexample
cd storageexample
composer update --ignore-platform-reqs
php artisan key:generate
php artisan config:clear
```

1. Creamos la bd: storageexample
2. Configuramos archivo .env



Vamos a tener dos estructuras de trabajo:

Si se almacena en disco o en CDN.

Por defecto el almacenado en disco, vamos a ver que tenemos un directorio de **storage**

- directorio **logs**: donde se van a almacenar los logs de acceso, de registro.
- directorio **framework**: donde laravel se apoya para guardar archivos de cache, ficheros de sesiones, para las vistas, es decir para su funcionamiento interno
- directorio **app**: donde se van a almacenar los archivos que vamos a guardar en disco, los ficheros que los usuarios nos entreguen.
  - directorio **public**: donde se van a guardar los ficheros que luego vamos a querer que sean accedidos por el sistema, para ser mostrados en el mismo, es decir vamos a guardar los archivos publicos, como la foto de perfil. Eso es porque dentro del directorio public vamos a poder vincular el contenido con el contenido que tenemos en storage/public de tal forma que va a funcionar como un acceso directo para ser accedidos desde la sección de public, y de esta forma vamos a poder mostrar los archivos.

En cuanto a la configuración hay que tener en cuenta:

En el directorio **config**, podemos hacer alguna modificación del sistema

- archivo **filesystems**: este contiene la configuración sobre como la aplicación de laravel va a estar haciendo el almacenado de los archivos en el sistema.

  Por defecto, el guardado lo va a hacer en local. Los archivos se van a guardar en nuestro hosting.

  ```php
  'default' => env('FILESYSTEM_DISK', 'local'),
  ```

  Si necesitamos guardar a través de un servicio CDN (Ej: S3 en nube) deberiamos modificar el formato por defecto y en lugar de utilizar el guardado local, podríamos acudir a los drivers que laravel nos ofrece por defecto: `Supported Drivers: "local", "ftp", "sftp", "s3"` 

  Podríamos utilizar otro que no se ninguno de los anteriores, para ello necesitaríamos acudir a un third package (paquete de terceros) e instalar los drivers necesarios, para realizar la comunicación de laravel con ese servicio. Por defecto tenemos las configuraciones para nuestro disco, public o s3

  ```php
  'disks' => [
  
      'local' => [
          'driver' => 'local',
          'root' => storage_path('app'),
          'throw' => false,
      ],
  
      'public' => [
          'driver' => 'local',
          'root' => storage_path('app/public'),
          'url' => env('APP_URL').'/storage',
          'visibility' => 'public',
          'throw' => false,
      ],
  
      's3' => [
          'driver' => 's3',
          'key' => env('AWS_ACCESS_KEY_ID'),
          'secret' => env('AWS_SECRET_ACCESS_KEY'),
          'region' => env('AWS_DEFAULT_REGION'),
          'bucket' => env('AWS_BUCKET'),
          'url' => env('AWS_URL'),
          'endpoint' => env('AWS_ENDPOINT'),
          'use_path_style_endpoint' => env('AWS_USE_PATH_STYLE_ENDPOINT', false),
          'throw' => false,
      ],
  
  ],
  ```

  Si queremos modificar algo, no se hace directamente en el archivo de configuración sino que lo sacamos al archivo .env en variables de entorno.

  Si queremos modificar el almacenado:

  si en el archivo de configuracion filesystems, tenemos:

  ```php
  'default' => env('FILESYSTEM_DISK', 'local'),
  
  'disks' => [
      ...
      's3' => [
          'driver' => 's3',
          'key' => env('AWS_ACCESS_KEY_ID'),
          'secret' => env('AWS_SECRET_ACCESS_KEY'),
          'region' => env('AWS_DEFAULT_REGION'),
          'bucket' => env('AWS_BUCKET'),
          'url' => env('AWS_URL'),
          'endpoint' => env('AWS_ENDPOINT'),
          'use_path_style_endpoint' => env('AWS_USE_PATH_STYLE_ENDPOINT', false),
          'throw' => false,
      ],
  ],
  ```

  en el archivo .env ponemos por ejemplo si queremos utilizar s3, hay que configurar también los valores que vienen en disk, como la clave de acceso, la clave de acceso secreta, la region y el bucket donde se va a almacenar,... Esta información nos la va a proporcionar amazon, si nos damos de alta en un servicio de s3.

  El funcionamiento de laravel es el mismo, lo único que hay que cambiar es la configuración.

  ```php
  FILESYSTEM_DISK="s3"
  AWS_ACCESS_KEY_ID="XXXXXX"
  AWS_SECRET_ACCESS_KEY="YYYYYY"
  AWS_DEFAULT_REGION="ZZZZZZ"
  AWS_BUCKET=""
  AWS_URL=""
  AWS_ENDPOINT=""
  AWS_USE_PATH_STYLE_ENDPOINT=""
  ```

  

  También contiene el link simbólico, que es muy importante, que es lo que nos va a permitir un link o acceso directo para que desde la carpeta public de nuestro sistema, acuda a la carpeta public del storage, asi cuando busquemos un asset (ej css) dentro del sistema.

  ```php
  'links' => [
      public_path('storage') => storage_path('app/public'),
  ],
  ```



Vamos a crear un ejemplo de subida y mostrar archivos

1. Creamos un modelo y sus migraciones

   ```bash
   php artisan make:model Info --migration
   ```

2. Creamos la estructura de infos en la migracion create_infos_table

   ```php
   public function up(): void
   {
       Schema::create('infos', function (Blueprint $table) {
           $table->id();
           $table->string("name")->nullable();
           $table->string("file_uri")->nullable();
           $table->timestamps();
       });
   }
   ```

   Creamos un campo para almacenar la url de donde vamos a almacenar los ficheros, para cuando necesitemos usarlo.

3. En el modelo App/Models/Info.php vamos a declarar la protección, como siempre, por que no va haber ningún campo que queramos que sea privado.

   ```php
   protected $guarded = [];
   ```

4. Cargamos las migraciones

   ```bash
   php artisan migrate
   ```

5. Creamos dos rutas en Routes/web.php: una para subir archivos y otra para crear un archivo

   ```php
   use App\Http\Controllers\InfoController;
   
   Route::get('/', [InfoController::class, 'index'])->name('index');
   Route::get('/create', [InfoController::class, 'create'])->name('create');
   Route::post('/store', [InfoController::class, 'store'])->name('store');
   ```

   index: para subir archivos (listar los archivos).

   create: para crear archivos.

   store: para guardar los archivos que vamos a recepcionar.

6. Creamos el controlador App/Http/Controllers InfoController.php

   ```bash
   php artisan make:controller InfoController
   ```

7. Creamos la validación InfoRequest

   ```bash
   php artisan make:request InfoRequest
   ```

   Esto nos crea el directorio Request en App/Http con el archivo InfoRequest para crear las reglas de validación.

   En el archivo InfoRequest.php autorizamos para que todos los usuarios puedan usar la validación

   ```php
   public function authorize(): bool
   {
       return true;
   }
   ```

    Configuramos las reglas de validación:

   ```php
   public function rules(): array
       {
           return [
               "name" => "nullable|max:100",
               "file_uri" => "nullable|"
           ];
       }
   }
   ```

   nullable porque puede ser null.

   Para ver como se validan los archivos, nos vamos a la documentación oficial de laravel a la parte de validacion, validación para archivos https://laravel.com/docs/11.x/validation#validating-files

   Se puede validar por tipo de archivo, por ejemplo archivos mp3, wav, jpg pdf,... hay algunas opciones que vienen predefinidas por ejemplo para una imagen (dimensiones de la imagen).

   Se puede indicar el peso mínimo o máximo del archivo, asi también evitamos ataques de envios de archivos. 

   En lugar de hacerlo como siempre, para seguir el formato que nos pone en la documentación vamos a retornarlo con array . Hay que importar las reglas de validación para el tipo File

   ```php
   use Illuminate\Validation\Rules\File;
   
   public function rules(): array
   {
       return [
           "name" => ['nullable', 'max:100'],
           "file_uri" => ['nullable', File::image()->max(10 * 1024)]
       ];
   }
   ```

8. Creamos las vistas (eliminamos el welcome.blade.php), vamos a necesitar una vista para el index y otra para el create, para el store no hace falta por que va redireccionar a una vista existente.

   En la vista index vamos a crear un enlace para ir a crear los elementos

   ```html
   
   ```

   En la vista create, vamos a crear un formulario para crear los elementos y un enlace que llame a la ruta index para volver a atrás

   ```html
   <body>
       <a href="{{ route('index') }}">Back to index</a>
       <br />
       <form method="POST" action="{{ route('store') }}" enctype="multipart/form-data">
           @csrf
           <input type="text" name="name" placeholder="Name" />
           <input type="file" name="file" placeholder="File" />
           <input type="submit" value="send" />
       </form>
   </body>
   ```

   Utilizamos: 

   @csrf para que sea seguro ya que es un método post, y genera un token aleatorio.

    enctype="multipart/form-data" para enviar datos multiples (imagenes, pdf,..) que no sean solo strings

   en action indicamos que queremos que vaya a la ruta store y le enviamos los datos

9. Creamos las funciones en el controlador

   ```php
   use App\Http\Request\InfoRequest;
   use App\Models\Info;
   ```

   En la función **index**, vamos a retornar la vista de index con info

   ```php
   public function index()
   {
       $infos = Info::get();
       return view('index',compact('infos'));
   }
   ```

   En la función **create** vamos a retornar la vista para la creación del formulario.

   ```php
   public function create()
   {
       return view('create');
   }
   ```

   En la función **store** vamos a almacenar el contenido

   ```php
   public function store(InfoRequest $request)
   {
       $file = time().'.'.$request->file->extension();
   }
   ```

   Como hemos tomado la estrategia de guardar la url en la bd, lo que vamos a necesitar es un nombre único por cada uno de los ficheros, para que no haya colisiones con los nombres. Para ello nos podemos apoyar de un timestamp, con el nombre del fichero con su extensión.

   Una vez hayamos obtenido el archivo queremos guardarlo en el storage, para ello tenemos el método `move` de file, donde hay que ubicar donde lo queremos guardar. por ejemplo en la carpeta publica, y dentro de este, podemos indicar si va en el raiz o en una subcarpeta, si queremos una subcarpeta, ponemos el nombre de ésta y si no existe lo crea.





Documentación sacada de: 

https://desarrolloweb.com/articulos/crear-proyecto-laravel-composer.html

https://campus-ademass.com/curso/3

https://styde.net/middleware-en-laravel-11/
