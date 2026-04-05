# Resumen Laravel:



Aquí tienes una guía paso a paso para que comiences desde cero:

------

## 1. Requisitos Previos

Antes de instalar Laravel, asegúrate de tener lo siguiente en tu computadora:

- **PHP:** Versión 8.2 o superior.
- **Composer:** El gestor de dependencias de PHP (esencial para instalar Laravel).
- **Base de datos:** MySQL, PostgreSQL o SQLite.
- **Node.js y NPM:** Para manejar el frontend (opcional pero recomendado).

------

## 2. Instalación de Laravel

La forma más sencilla de crear un nuevo proyecto es a través del instalador de Laravel.

1. Abre tu terminal y ejecuta: `composer global require laravel/installer`
2. Una vez instalado, crea tu primer proyecto: `laravel new mi-proyecto`
3. Sigue las instrucciones (elige tu base de datos y el framework de pruebas preferido).

------

## 3. Estructura del Proyecto

Laravel utiliza el patrón **MVC (Modelo-Vista-Controlador)**. Entender dónde va cada cosa te ahorrará mucho tiempo:

- **`routes/web.php`**: Aquí defines las URLs de tu aplicación.
- **`app/Http/Controllers`**: Aquí reside la lógica que conecta tus datos con las vistas.
- **`resources/views`**: Aquí están tus archivos de HTML (usualmente usando el motor de plantillas **Blade**).
- **`app/Models`**: Aquí defines la estructura de tus datos y las relaciones.
- **`database/migrations`**: Archivos para crear y modificar las tablas de tu base de datos de forma controlada.

------

## 4. Primeros Pasos Prácticos

### Levantar el servidor

Entra a la carpeta de tu proyecto y ejecuta: `php artisan serve` Esto habilitará tu aplicación en `http://localhost:8000`.

### Crear una Ruta y una Vista

1. Ve a `routes/web.php` y añade:

   PHP

   ```
   Route::get('/hola', function () {
       return view('saludo');
   });
   ```

2. Crea el archivo `resources/views/saludo.blade.php` con un código HTML simple:

   HTML

   ```
   <h1>¡Hola desde Laravel!</h1>
   ```

### El comando Artisan

**Artisan** es la interfaz de línea de comandos de Laravel que te permite automatizar tareas. Algunos comandos clave son:

- `php artisan make:controller NombreController` (Crea un controlador).
- `php artisan make:model Nombre -m` (Crea un modelo y su migración al mismo tiempo).
- `php artisan migrate` (Sincroniza tus tablas con la base de datos).

------

## 5. El Ecosistema Laravel

Una de las mayores ventajas de Laravel es su ecosistema. Dependiendo de lo que necesites, puedes usar:

- **Eloquent:** El ORM que hace que trabajar con bases de datos sea como escribir inglés simple.
- **Breeze / Jetstream:** Paquetes para tener sistemas de login y registro listos en segundos.
- **Blade:** Un motor de plantillas potente que te permite reutilizar código HTML.



# Rutas

Las **rutas** en Laravel son la puerta de entrada a tu aplicación. Su función principal es aceptar una **URI** (la dirección web) y dirigirla a un cierre (clousure) o a un **Controlador**.

Se encuentran principalmente en el directorio `routes/`, siendo `web.php` el archivo para interfaces de usuario y `api.php` para servicios externos.

------

### 1. Métodos de Ruta Disponibles

Laravel permite definir rutas que responden a cualquier verbo HTTP:

| **Método**                        | **Propósito**                            |
| --------------------------------- | ---------------------------------------- |
| `Route::get($uri, $callback);`    | Solicitar un recurso (ver una página).   |
| `Route::post($uri, $callback);`   | Enviar datos nuevos (crear un registro). |
| `Route::put($uri, $callback);`    | Reemplazar un recurso existente.         |
| `Route::patch($uri, $callback);`  | Actualizar parcialmente un recurso.      |
| `Route::delete($uri, $callback);` | Eliminar un recurso.                     |

------

### 2. Rutas con Parámetros

A veces necesitas capturar segmentos de la URL, como el ID de un usuario.

- **Parámetro Obligatorio:**

  PHP

  ```
  Route::get('/usuario/{id}', function ($id) {
      return 'Usuario ID: ' . $id;
  });
  ```

- **Parámetro Opcional:**

  PHP

  ```
  Route::get('/post/{slug?}', function ($slug = null) {
      return $slug ?? 'Lista de posts';
  });
  ```

------

### 3. Rutas de Controlador (Recomendado)

Para mantener el código limpio, en lugar de escribir la lógica en el archivo de rutas, enviamos la petición a un controlador:

PHP

```
use App\Http\Controllers\UserController;
use Illuminate\Support\Facades\Route;

Route::get('/perfil/{id}', [UserController::class, 'show']);
```

------

### 4. Grupos y Prefijos

Si tienes varias rutas que comparten características (como un panel de administración), puedes agruparlas para no repetir código:

PHP

```
Route::prefix('admin')->group(function () {
    Route::get('/users', function () {
        // Responde a /admin/users
    });
    Route::get('/settings', function () {
        // Responde a /admin/settings
    });
});
```

------

### 5. Rutas de Recurso (Resource)

Si estás construyendo un CRUD (Crear, Leer, Actualizar, Borrar), Laravel tiene un comando "mágico" que crea todas las rutas necesarias de golpe:

PHP

```
Route::resource('fotos', PhotoController::class);
```

> **Nota:** Esto asignará automáticamente rutas como `fotos.index`, `fotos.create`, `fotos.store`, etc.

------

### Comandos Útiles

Para ver todas las rutas que tienes registradas en tu proyecto, corre este comando en tu terminal:

Bash

```
php artisan route:list
```

Mostrará algo como:

![image-20260128163705755](/home/soa/.config/Typora/typora-user-images/image-20260128163705755.png)



NOTA:

Si solo necesitas devolver una **vista estática** (un archivo `.blade.php`) sin pasar por un controlador o realizar una lógica compleja, Laravel ofrece un método abreviado muy eficiente: `Route::view`.

### 1. Sintaxis Básica

El método `view` acepta tres argumentos: la **URI**, el **nombre de la vista** y, opcionalmente, un **array de datos**.

PHP

```
use Illuminate\Support\Facades\Route;

// Ruta simple que carga resources/views/welcome.blade.php
Route::view('/', 'welcome');

// Ruta con datos estáticos
Route::view('/contacto', 'pages.contact', ['name' => 'Soporte Técnico']);
```

------

### 2. ¿Cuándo usar `Route::view` vs `Route::get`?

Es importante saber elegir para mantener el archivo de rutas limpio:

| **Característica** | **Route::view**                           | **Route::get (con Closure o Controller)**  |
| ------------------ | ----------------------------------------- | ------------------------------------------ |
| **Complejidad**    | Solo contenido estático.                  | Lógica de negocio, consultas a DB.         |
| **Rendimiento**    | Ligeramente más rápido (menos overhead).  | Estándar.                                  |
| **Uso común**      | Páginas de "Acerca de", "FAQ", "Landing". | Dashboards, perfiles, listas de productos. |

------

### 3. Ejemplo práctico: Pasando variables

Si pasas datos a través de `Route::view`, estos estarán disponibles en tu archivo Blade como variables normales.

**En `routes/web.php`:**

PHP

```
Route::view('/bienvenida', 'saludo', ['usuario' => 'Alex']);
```

**En `resources/views/saludo.blade.php`:**

HTML

```
<h1>Hola, {{ $usuario }}</h1>
```

------

### 4. Rutas de Vista con Parámetros Dinámicos

Si necesitas que la vista dependa de un parámetro de la URL (como `/user/1`), **no puedes usar `Route::view`**. En ese caso, debes usar `Route::get`:

PHP

```
Route::get('/user/{id}', function ($id) {
    return view('user.profile', ['id' => $id]);
});
```

------

### Resumen de archivos involucrados

Para que una ruta de vista funcione, asegúrate de tener la estructura correcta:

- **Ruta:** `routes/web.php`
- **Vista:** `resources/views/tu-vista.blade.php`
- **Subcarpetas:** Si usas `Route::view('/ruta', 'admin.login')`, el archivo debe estar en `resources/views/admin/login.blade.php`.



**organización de vistas** y el uso de **Componentes de Blade**, que es la forma moderna y profesional de trabajar en Laravel.

------

### 1. Organización de Vistas en Carpetas

A medida que tu proyecto crece, no puedes tener 50 archivos en `resources/views`. Lo ideal es agruparlos por módulos.

**Estructura sugerida:**

- `resources/views/layouts/`: Plantillas base (cabecera, pie de página).
- `resources/views/auth/`: Login, registro, recuperación de contraseña.
- `resources/views/admin/`: Panel de control, gestión de usuarios.
- `resources/views/components/`: Piezas reutilizables (botones, alertas).

Para llamar a una vista dentro de una carpeta, usa la **nomenclatura de punto**:

PHP

```
// Busca el archivo en resources/views/admin/dashboard.blade.php
Route::view('/admin', 'admin.dashboard');
```

------

### 2. Componentes de Blade (La "Magia" de Laravel)

Los componentes te permiten crear piezas de HTML reutilizables (como un botón o una tarjeta) y usarlos como si fueran etiquetas HTML personalizadas.

#### Paso A: Crear el componente

Puedes crearlo manualmente o con Artisan:

Bash

```
php artisan make:component Alert
```

Esto creará un archivo en `resources/views/components/alert.blade.php`.

#### Paso B: Diseñar el componente

Dentro de `alert.blade.php`, defines el diseño:

HTML

```
<div class="alert alert-{{ $type }}">
    {{ $slot }}
</div>
```

#### Paso C: Usar el componente en tu ruta view

Ahora, en cualquier vista (por ejemplo, `welcome.blade.php`), lo usas así:

HTML

```
<x-alert type="danger">
    ¡Cuidado! Algo salió mal.
</x-alert>
```

------

### 3. Layouts: El sistema de "Plantilla Maestra"

En lugar de repetir el HTML de la estructura (head, body, scripts) en cada archivo, creas un layout.

**Archivo `resources/views/layouts/app.blade.php`:**

HTML

```
<html>
    <head>
        <title>{{ $title ?? 'Mi App' }}</title>
    </head>
    <body>
        <nav> </nav>

        {{ $slot }} </body>
</html>
```

**Uso en tu vista final:**

HTML

```
<x-app-layout>
    <x-slot:title>Página de Inicio</x-slot>
    
    <h1>Bienvenido a mi sitio web</h1>
    <p>Este contenido se inserta en el slot del layout.</p>
</x-app-layout>
```

------

### ¿Por qué esto es mejor?

1. **DRY (Don't Repeat Yourself):** Si cambias el menú, se cambia en toda la web.
2. **Legibilidad:** Tus archivos de vista pasan de tener 200 líneas a tener 20 líneas muy claras.
3. **Mantenimiento:** Es mucho más fácil encontrar un error en un componente pequeño que en una página gigante.



### 1. Pasar datos complejos a la Vista

Cuando los datos no son estáticos (vienen de una base de datos), dejamos de usar `Route::view` y usamos `Route::get` con un controlador o una función.

**Ejemplo: Listar productos** En tu archivo de rutas (`routes/web.php`):

PHP

```
use App\Models\Product;

Route::get('/tienda', function () {
    // Obtenemos todos los productos de la base de datos
    $productos = Product::all(); 

    // Los pasamos a la vista 'shop.index'
    return view('shop.index', [
        'products' => $productos,
        'titulo' => 'Nuestra Colección 2026'
    ]);
});
```

------

### 2. Creando un Layout Maestro desde cero

Para que tu web sea consistente, crea un archivo base.

**Archivo:** `resources/views/components/layout.blade.php`

HTML

```
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>{{ $title ?? 'Mi Sitio' }}</title>
    <script src="https://cdn.tailwindcss.com"></script> </head>
<body class="bg-gray-100">
    <nav class="bg-blue-600 p-4 text-white">
        <a href="/">Inicio</a> | <a href="/tienda">Tienda</a>
    </nav>

    <main class="container mx-auto p-6">
        {{ $slot }} </main>

    <footer class="text-center p-4 text-gray-500">
        © 2026 - Hecho con Laravel
    </footer>
</body>
</html>
```

------

### 3. Usando los datos dentro del Layout

Ahora, combinamos todo en la vista final:

**Archivo:** `resources/views/shop/index.blade.php`

HTML

```
<x-layout>
    <x-slot:title>
        {{ $titulo }}
    </x-slot>

    <h1 class="text-2xl font-bold mb-4">{{ $titulo }}</h1>

    <div class="grid grid-cols-3 gap-4">
        @foreach ($products as $product)
            <div class="bg-white p-4 shadow rounded">
                <h2 class="font-bold">{{ $product->name }}</h2>
                <p class="text-green-600">${{ $product->price }}</p>
                <button class="bg-blue-500 text-white px-2 py-1 mt-2">Comprar</button>
            </div>
        @empty
            <p>No hay productos disponibles por ahora.</p>
        @endforeach
    </div>
</x-layout>
```

------

### ¿Qué acabamos de hacer?

1. **Lógica:** El `Route::get` consulta los datos reales.
2. **Estructura:** El componente `<x-layout>` envuelve todo para que no tengas que repetir el HTML básico en cada página.
3. **Directivas de Blade:** Usamos `@foreach` para iterar sobre la colección de datos y `@empty` por si la base de datos está vacía.



### 1. Filtrado por Categorías (Lógica de Datos)

Para filtrar, aprovecharemos los parámetros de la URL (Query Strings) como `?categoria=electronica`.

**En `routes/web.php`:**

PHP

```
use App\Models\Product;
use Illuminate\Http\Request;

Route::get('/tienda', function (Request $request) {
    $query = Product::query();

    // Si el usuario eligió una categoría, filtramos
    if ($request->has('categoria')) {
        $query->where('category', $request->categoria);
    }

    return view('shop.index', [
        'products' => $query->get(),
        'titulo' => 'Catálogo de Productos'
    ]);
});
```

------

### 2. Formulario para Crear Productos

Para recibir datos, necesitamos una ruta tipo `POST` y protegerla con un **Token CSRF** (una medida de seguridad obligatoria en Laravel para evitar ataques externos).

**La Vista (`resources/views/shop/create.blade.php`):**

HTML

```
<x-layout>
    <h1 class="text-xl font-bold mb-4">Añadir Producto</h1>

    <form action="/tienda" method="POST" class="space-y-4">
        @csrf <div>
            <label>Nombre:</label>
            <input type="text" name="name" class="border p-2 w-full" required>
        </div>

        <div>
            <label>Precio:</label>
            <input type="number" name="price" class="border p-2 w-full" required>
        </div>

        <button type="submit" class="bg-green-600 text-white px-4 py-2">Guardar</button>
    </form>
</x-layout>
```

------

### 3. Procesando el Formulario

Ahora definimos la ruta que recibe esos datos y los guarda en la base de datos.

**En `routes/web.php`:**

PHP

```
Route::post('/tienda', function (Request $request) {
    // 1. Validar que los datos sean correctos
    $data = $request->validate([
        'name' => 'required|min:3',
        'price' => 'required|numeric'
    ]);

    // 2. Crear el registro en la DB
    Product::create($data);

    // 3. Redirigir de vuelta a la tienda
    return redirect('/tienda')->with('success', 'Producto creado!');
});
```

------

### El "Bonus": Mejorando la interfaz

Para que el usuario pueda filtrar fácilmente, añade estos enlaces rápidos en tu vista `index.blade.php`:

HTML

```
<div class="mb-6 space-x-2">
    <a href="/tienda" class="text-blue-500">Todos</a>
    <a href="/tienda?categoria=Ropa" class="text-blue-500">Ropa</a>
    <a href="/tienda?categoria=Hogar" class="text-blue-500">Hogar</a>
</div>
```

### Resumen de lo aprendido:

1. **Request:** Usamos `$request` para leer lo que el usuario envía (filtros o formularios).
2. **CSRF:** Protegimos nuestro formulario con `@csrf`.
3. **Validación:** Laravel revisa automáticamente que el precio sea un número y el nombre no esté vacío.
4. **Redirección:** Después de guardar, enviamos al usuario a otra página para evitar duplicados.

### 1. Subida de Imágenes en el Formulario

Para que un formulario pueda enviar archivos, **debes** añadir el atributo `enctype="multipart/form-data"`. Sin esto, el archivo nunca llegará al servidor.

**El Formulario (`resources/views/shop/create.blade.php`):**

HTML

```
<form action="/tienda" method="POST" enctype="multipart/form-data" class="space-y-4">
    @csrf
    <div>
        <label>Imagen del Producto:</label>
        <input type="file" name="image" class="border p-2 w-full">
    </div>

    <button type="submit" class="bg-green-600 text-white px-4 py-2">Guardar</button>
</form>
```

------

### 2. Procesando la Imagen y la Sesión

En el archivo de rutas, modificamos la lógica para guardar el archivo físicamente y guardar el mensaje de éxito en la "memoria flash" de la sesión.

**En `routes/web.php`:**

PHP

```
use Illuminate\Support\Facades\Storage;

Route::post('/tienda', function (Request $request) {
    $data = $request->validate([
        'name' => 'required|min:3',
        'price' => 'required|numeric',
        'image' => 'required|image|max:2048' // Máximo 2MB
    ]);

    if ($request->hasFile('image')) {
        // Guarda la imagen en storage/app/public/products y devuelve la ruta
        $data['image'] = $request->file('image')->store('products', 'public');
    }

    Product::create($data);

    // Redirigimos con un mensaje de sesión (Flash Message)
    return redirect('/tienda')->with('status', '¡Producto e imagen guardados con éxito!');
});
```

------

### 3. Mostrando Mensajes de Éxito y la Imagen

Ahora necesitamos que el usuario vea la confirmación y la foto en la lista.

**En tu vista principal (`resources/views/shop/index.blade.php`):**

HTML

```html
<x-layout>
    @if (session('status'))
        <div class="bg-green-100 border border-green-400 text-green-700 px-4 py-3 rounded mb-4">
            {{ session('status') }}
        </div>
    @endif

    <div class="grid grid-cols-3 gap-4">
        @foreach ($products as $product)
            <div class="bg-white p-4 shadow rounded">
                <img src="{{ asset('storage/' . $product->image) }}" alt="{{ $product->name }}" class="w-full h-48 object-cover mb-2">
                
                <h2 class="font-bold">{{ $product->name }}</h2>
                <p class="text-green-600">${{ $product->price }}</p>
            </div>
        @endforeach
    </div>
</x-layout>
```

------

### 4. El paso final (Configuración de Storage)

Por seguridad, la carpeta `storage/app/public` no es accesible desde el navegador. Debes crear un "acceso directo" (enlace simbólico) ejecutando este comando en tu terminal una sola vez:

Bash

```
php artisan storage:link
```

### Resumen de lo nuevo:

1. **`enctype`:** Clave para que el navegador "empaquete" archivos.
2. **`store()`:** Laravel se encarga de darle un nombre único a la imagen y moverla a la carpeta correcta.
3. **Flash Messages:** `with('status', '...')` guarda un dato en la sesión que solo dura una carga de página.
4. **`asset()`:** Genera la URL completa para que la imagen se vea en el navegador.



### 1. El Controlador: El "Cerebro" Organizado

Primero, creamos el controlador desde la terminal:

Bash

```
php artisan make:controller ProductController
```

Ahora, movemos la lógica de las rutas al archivo `app/Http/Controllers/ProductController.php`:

PHP

```php
namespace App\Http\Controllers;

use App\Models\Product;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Storage;

class ProductController extends Controller
{
    // Mostrar la lista y filtros
    public function index(Request $request) {
        $query = Product::query();
        if ($request->has('categoria')) {
            $query->where('category', $request->categoria);
        }
        return view('shop.index', ['products' => $query->get()]);
    }

    // Guardar el producto
    public function store(Request $request) {
        $data = $request->validate([
            'name' => 'required|min:3',
            'price' => 'required|numeric',
            'image' => 'required|image|max:2048'
        ]);

        if ($request->hasFile('image')) {
            $data['image'] = $request->file('image')->store('products', 'public');
        }

        Product::create($data);

        return redirect()->route('products.index')->with('status', '¡Producto creado!');
    }
}
```

------

### 2. Rutas Limpias

Ahora tu archivo `routes/web.php` se verá mucho más profesional:

PHP

```php
use App\Http\Controllers\ProductController;

Route::get('/tienda', [ProductController::class, 'index'])->name('products.index');
Route::view('/tienda/crear', 'shop.create');
Route::post('/tienda', [ProductController::class, 'store'])->name('products.store');
```

------

### 3. Validación Visual de Errores

Es frustrante para un usuario enviar un formulario y que no pase nada. Vamos a mostrar los errores justo debajo de cada campo y a mantener los datos que ya escribió usando `old()`.

**En tu vista `resources/views/shop/create.blade.php`:**

HTML

```html
<x-layout>
    <form action="{{ route('products.store') }}" method="POST" enctype="multipart/form-data">
        @csrf
        
        <div class="mb-4">
            <label>Nombre del Producto:</label>
            <input type="text" name="name" value="{{ old('name') }}" 
                   class="border p-2 w-full @error('name') border-red-500 @enderror">
            @error('name')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label>Precio:</label>
            <input type="number" name="price" value="{{ old('price') }}" 
                   class="border p-2 w-full @error('price') border-red-500 @enderror">
            @error('price')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <div class="mb-4">
            <label>Imagen:</label>
            <input type="file" name="image" class="w-full">
            @error('image')
                <p class="text-red-500 text-sm mt-1">{{ $message }}</p>
            @enderror
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2">Guardar</button>
    </form>
</x-layout>
```

------

### ¿Qué ganamos con esto?

1. **Separación de responsabilidades:** Las rutas solo dirigen el tráfico, el controlador ejecuta la lógica.
2. **UX (Experiencia de Usuario):** Con `old('name')`, si el usuario falla en el precio, no tiene que volver a escribir el nombre.
3. **Feedback inmediato:** Los mensajes `@error` le dicen exactamente por qué falló (ej: "El campo precio debe ser un número").

### Un truco extra:

Si quieres ver **todos** los errores juntos al principio del formulario, puedes usar este bloque:

HTML

```html
@if ($errors->any())
    <div class="bg-red-100 p-4 mb-4">
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
@endif
```



Vamos a completar el **CRUD** (Crear, Leer, Actualizar, Borrar) añadiendo la capacidad de **editar** productos y un **motor de búsqueda** para encontrarlos rápidamente.

------

### 1. Sistema de Búsqueda por Texto

Modificaremos la lógica del `index` en el controlador para que filtre si el usuario escribe algo en un buscador.

**En `ProductController.php`:**

PHP

```
public function index(Request $request) {
    $query = Product::query();

    // Búsqueda por nombre
    if ($request->filled('search')) {
        $query->where('name', 'LIKE', '%' . $request->search . '%');
    }

    // Filtro por categoría (que ya teníamos)
    if ($request->has('categoria')) {
        $query->where('category', $request->categoria);
    }

    return view('shop.index', ['products' => $query->get()]);
}
```

**En la vista `index.blade.php` (El buscador):**

HTML

```
<form action="/tienda" method="GET" class="mb-6 flex gap-2">
    <input type="text" name="search" value="{{ request('search') }}" 
           placeholder="Buscar producto..." class="border p-2 flex-grow">
    <button type="submit" class="bg-gray-800 text-white px-4">Buscar</button>
</form>
```

------

### 2. Editar Productos (Update)

Para editar, necesitamos dos cosas: una página con el formulario relleno (Edit) y una ruta que procese el cambio (Update).

#### A. Las Rutas (`web.php`)

PHP

```
// Formulario de edición (GET)
Route::get('/tienda/{product}/editar', [ProductController::class, 'edit'])->name('products.edit');

// Procesar la actualización (PUT/PATCH)
Route::put('/tienda/{product}', [ProductController::class, 'update'])->name('products.update');
```

#### B. El Controlador (`ProductController.php`)

Añadimos estos dos métodos:

PHP

```
public function edit(Product $product) {
    return view('shop.edit', compact('product'));
}

public function update(Request $request, Product $product) {
    $data = $request->validate([
        'name' => 'required|min:3',
        'price' => 'required|numeric',
        'image' => 'nullable|image|max:2048' // Imagen opcional al editar
    ]);

    if ($request->hasFile('image')) {
        // Borramos la imagen vieja si existe
        Storage::disk('public')->delete($product->image);
        // Guardamos la nueva
        $data['image'] = $request->file('image')->store('products', 'public');
    }

    $product->update($data);

    return redirect()->route('products.index')->with('status', 'Producto actualizado correctamente');
}
```

#### C. La Vista de Edición (`resources/views/shop/edit.blade.php`)

Es casi igual a la de creación, pero usamos el método `@method('PUT')`.

HTML

```
<x-layout>
    <form action="{{ route('products.update', $product) }}" method="POST" enctype="multipart/form-data">
        @csrf
        @method('PUT') <div class="mb-4">
            <label>Nombre:</label>
            <input type="text" name="name" value="{{ old('name', $product->name) }}" class="border p-2 w-full">
        </div>

        <div class="mb-4">
            <label>Precio:</label>
            <input type="number" name="price" value="{{ old('price', $product->price) }}" class="border p-2 w-full">
        </div>

        <div class="mb-4">
            <p>Imagen actual:</p>
            <img src="{{ asset('storage/' . $product->image) }}" class="w-20 mb-2">
            <input type="file" name="image" class="w-full">
        </div>

        <button type="submit" class="bg-blue-600 text-white px-4 py-2">Actualizar</button>
    </form>
</x-layout>
```

------

### 3. El botón de "Editar" en la lista

En tu `index.blade.php`, dentro del bucle `@foreach`, añade el enlace:

HTML

```
<a href="{{ route('products.edit', $product) }}" class="text-yellow-600 hover:underline">
    Editar Producto
</a>
```

### ¿Qué hemos logrado?

1. **Interactividad:** El usuario ahora puede filtrar por texto en tiempo real.
2. **Ciclo de Vida:** Ya puedes crear, leer y actualizar datos.
3. **Gestión de Archivos:** Aprendiste a reemplazar imágenes viejas para no llenar el servidor de basura.



Vamos a completar el **CRUD** con la eliminación y luego pondremos el "cerrojo" de seguridad con un **Middleware** para que solo los administradores puedan hacer cambios.

------

### 1. Eliminar Productos (con confirmación)

Para eliminar, usamos el método HTTP `DELETE`. Por seguridad, esto debe hacerse dentro de un pequeño formulario (no un simple enlace) para evitar borrados accidentales por parte de bots.

#### A. La Ruta (`web.php`)

PHP

```
Route::delete('/tienda/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
```

#### B. El Controlador (`ProductController.php`)

PHP

```php
public function destroy(Product $product) {
    // 1. Borrar la imagen del servidor
    if ($product->image) {
        Storage::disk('public')->delete($product->image);
    }

    // 2. Borrar el registro de la base de datos
    $product->delete();

    return redirect()->route('products.index')->with('status', 'Producto eliminado.');
}
```

#### C. El Botón en la Vista (`index.blade.php`)

Añade esto junto al botón de editar. Usaremos un poco de JavaScript simple para la confirmación:

HTML

```html
<form action="{{ route('products.destroy', $product) }}" method="POST" 
      onsubmit="return confirm('¿Estás seguro de que quieres eliminar este producto?')">
    @csrf
    @method('DELETE')
    <button type="submit" class="text-red-600 hover:underline">Eliminar</button>
</form>
```

------

### 2. Protección de Rutas (Middleware de Admin)

No queremos que cualquier visitante pueda borrar productos. Laravel usa **Middlewares** para filtrar quién puede pasar.

#### A. Crear el Middleware

Bash

```
php artisan make:middleware IsAdmin
```

#### B. Definir la Lógica (`app/Http/Middleware/IsAdmin.php`)

Supongamos que tu tabla de usuarios tiene un campo `is_admin` (booleano):

PHP

```php
public function handle(Request $request, Closure $next)
{
    // Si el usuario no está logueado o no es admin, lo mandamos al inicio
    if (!auth()->check() || !auth()->user()->is_admin) {
        return redirect('/')->with('error', 'No tienes permiso para entrar aquí.');
    }

    return $next($request);
}
```

#### C. Aplicar el Middleware a las Rutas

Ahora agrupamos las rutas de "escritura" para que solo el admin las vea, dejando la lista pública:

**En `routes/web.php`:**

PHP

```php
// Ruta pública: Todos pueden ver los productos
Route::get('/tienda', [ProductController::class, 'index'])->name('products.index');

// Rutas protegidas: Solo para administradores
Route::middleware(['auth', 'is_admin'])->group(function () {
    Route::get('/tienda/crear', [ProductController::class, 'create'])->name('products.create');
    Route::post('/tienda', [ProductController::class, 'store'])->name('products.store');
    Route::get('/tienda/{product}/editar', [ProductController::class, 'edit'])->name('products.edit');
    Route::put('/tienda/{product}', [ProductController::class, 'update'])->name('products.update');
    Route::delete('/tienda/{product}', [ProductController::class, 'destroy'])->name('products.destroy');
});
```

------

### 3. Esconder botones en la Vista

Incluso si las rutas están protegidas, es mejor no mostrar botones que el usuario no puede usar.

**En `index.blade.php`:**

HTML

```html
@foreach ($products as $product)
    @auth
        @if(auth()->user()->is_admin)
            <div class="flex gap-4 mt-4">
                <a href="{{ route('products.edit', $product) }}">Editar</a>
                <form> ... botón eliminar ... </form>
            </div>
        @endif
    @endauth
@endforeach
```

### Resumen de Seguridad:

1. **`@method('DELETE')`**: Imprescindible para rutas de borrado.
2. **`Storage::delete()`**: Limpieza de archivos para no desperdiciar espacio.
3. **Middleware**: Tu barrera de seguridad en el servidor.
4. **Blade `@auth`**: Tu barrera visual para mejorar la interfaz.



**Seeders** (y Factories) y a organizar la vista con **Paginación**.

------

### 1. Seeders y Factories (Generar 100 productos)

En Laravel, no creamos datos de prueba a mano. Usamos **Factories** para definir cómo es un producto y **Seeders** para lanzarlos a la base de datos.

#### Paso A: Definir la Factory

Ejecuta: `php artisan make:factory ProductFactory` En `database/factories/ProductFactory.php`:

PHP

```
public function definition()
{
    return [
        'name' => $this->faker->words(3, true),
        'price' => $this->faker->randomFloat(2, 10, 500),
        'category' => $this->faker->randomElement(['Ropa', 'Electrónica', 'Hogar']),
        'image' => 'products/default.jpg', // Una imagen por defecto
    ];
}
```

#### Paso B: El Seeder

En `database/seeders/DatabaseSeeder.php`:

PHP

```
public function run()
{
    // Esto creará 100 productos usando la definición de la Factory
    \App\Models\Product::factory(100)->create();
}
```

#### Paso C: Ejecutar

Corre este comando para limpiar tu base de datos y llenarla:

Bash

```
php artisan migrate:fresh --seed
```

------

### 2. Paginación (10 en 10)

Si tienes 100 productos, no quieres cargarlos todos a la vez (sería muy lento). Vamos a paginarlos.

#### A. En el Controlador

Cambiamos el método `get()` por `paginate(10)`.

**En `ProductController.php`:**

PHP

```
public function index(Request $request) {
    $query = Product::query();

    if ($request->filled('search')) {
        $query->where('name', 'LIKE', '%' . $request->search . '%');
    }

    // Cambiamos ->get() por ->paginate(10)
    // withQueryString() mantiene los filtros de búsqueda al cambiar de página
    $products = $query->latest()->paginate(10)->withQueryString();

    return view('shop.index', compact('products'));
}
```

#### B. En la Vista

Laravel hace todo el trabajo pesado. Solo tienes que decir dónde quieres que aparezcan los números de página.

**En `resources/views/shop/index.blade.php`:**

HTML

```html
<x-layout>
    <div class="grid grid-cols-2 md:grid-cols-5 gap-4">
        @foreach ($products as $product)
            @endforeach
    </div>

    <div class="mt-8">
        {{ $products->links() }}
    </div>
</x-layout>
```

------

### 3. Bonus: Estilo de la Paginación

Por defecto, Laravel usa estilos de Tailwind CSS para la paginación. Si ves que los iconos se ven gigantes o desordenados, asegúrate de que Laravel sepa que usas Tailwind.

**En `app/Providers/AppServiceProvider.php`:**

PHP

```php
use Illuminate\Pagination\Paginator;

public function boot()
{
    Paginator::useTailwind();
}
```

------

### ¿Qué hemos logrado ahora?

1. **Productividad:** En 2 segundos has creado 100 productos con nombres y precios aleatorios realistas gracias a **Faker**.
2. **Rendimiento:** Tu base de datos ahora solo devuelve 10 registros por vez, ahorrando memoria y tiempo de carga.
3. **UX Inteligente:** Gracias a `withQueryString()`, si buscas "Televisor" y pasas a la página 2, la búsqueda no se pierde.



Vamos a dividir el trabajo: primero crearemos un **Carrito de Compras** (usando la sesión del navegador) y luego prepararemos tu aplicación para el mundo exterior convirtiéndola en una **API JSON**.

------

### 1. Carrito de Compras (Basado en Sesiones)

El carrito no suele guardarse en la base de datos de inmediato, sino en la **sesión** del usuario para que sea rápido.

#### A. Ruta para añadir al carrito (`routes/web.php`)

PHP

```
Route::post('/carrito/añadir/{product}', [ProductController::class, 'addToCart'])->name('cart.add');
Route::get('/carrito', [ProductController::class, 'showCart'])->name('cart.show');
```

#### B. Lógica en el Controlador (`ProductController.php`)

PHP

```
public function addToCart(Product $product) {
    // Obtenemos el carrito actual de la sesión o un array vacío
    $cart = session()->get('cart', []);

    // Si el producto ya está, aumentamos la cantidad
    if(isset($cart[$product->id])) {
        $cart[$product->id]['quantity']++;
    } else {
        // Si es nuevo, lo añadimos
        $cart[$product->id] = [
            "name" => $product->name,
            "quantity" => 1,
            "price" => $product->price,
            "image" => $product->image
        ];
    }

    session()->put('cart', $cart);
    return redirect()->back()->with('status', '¡Producto añadido al carrito!');
}

public function showCart() {
    return view('shop.cart'); // Aquí mostrarías el contenido de session('cart')
}
```

------

### 2. Convirtiendo tu Tienda en una API

Una API permite que una App móvil (Android/iOS) o un sitio en React/Vue consuma tus datos. En Laravel, estas rutas van en `routes/api.php`.

#### A. Ruta de la API (`routes/api.php`)

Las rutas aquí tienen automáticamente el prefijo `/api/`.

PHP

```
use App\Http\Controllers\Api\ProductApiController;

Route::get('/products', [ProductApiController::class, 'index']);
Route::get('/products/{product}', [ProductApiController::class, 'show']);
```

#### B. El Controlador de API

Laravel transforma automáticamente los modelos y colecciones a **JSON**.

PHP

```
namespace App\Http\Controllers\Api;

use App\Models\Product;

class ProductApiController extends Controller
{
    public function index() {
        // Retorna los productos paginados en formato JSON
        return Product::paginate(10);
    }

    public function show(Product $product) {
        return response()->json($product);
    }
}
```

#### C. Probando la API

Si entras a `tu-sitio.test/api/products`, verás algo como esto:

JSON

```
{
    "current_page": 1,
    "data": [
        { "id": 1, "name": "Smartphone", "price": 599.99 },
        { "id": 2, "name": "Laptop", "price": 1200.00 }
    ]
}
```

------

### 3. Diferencias Clave: Web vs API

| **Característica** | **Web (routes/web.php)** | **API (routes/api.php)**               |
| ------------------ | ------------------------ | -------------------------------------- |
| **Respuesta**      | Retorna HTML (`view()`). | Retorna JSON (`response()->json()`).   |
| **Estado**         | Usa Sesiones y Cookies.  | Es "Stateless" (usa Tokens/Sanctum).   |
| **Protección**     | CSRF Token activado.     | CSRF desactivado (usa Auth por Token). |

------

### ¿Qué sigue para ser un experto?

Has construido un sistema completo: **CRUD, Imágenes, Seguridad, Paginación, Seeders, Carrito y API**.

Para cerrar con broche de oro, podrías:

1. **Instalar Laravel Sanctum**: Para que tu API sea segura y requiera un token de acceso.
2. **Relaciones**: Hacer que un `Producto` pertenezca a una `Categoría` (Relación 1 a Muchos).



¡Vamos a por el "gran final"! Vamos a conectar **Productos con Categorías** (Relaciones Eloquent) y luego a ponerle llave a tu API usando **Laravel Sanctum**.

------

### 1. Relaciones: Productos y Categorías

En lugar de un texto plano, queremos que cada producto pertenezca a una categoría real en la base de datos.

#### A. Crear el Modelo y Migración de Categoría

Bash

```
php artisan make:model Category -m
```

En la migración de `categories`, añade `$table->string('name');`. En la de `products`, añade: `$table->foreignId('category_id')->constrained()->onDelete('cascade');`

#### B. Definir la relación en los Modelos

**En `Product.php`:**

PHP

```
public function category() {
    return $this->belongsTo(Category::class);
}
```

**En `Category.php`:**

PHP

```
public function products() {
    return $this->hasMany(Product::class);
}
```

#### C. Uso en la Vista

Ahora puedes acceder al nombre de la categoría así:

HTML

```
<p>Categoría: {{ $product->category->name }}</p>
```

------

### 2. Securizar la API con Laravel Sanctum

Sanctum permite que un usuario se identifique y reciba un **Token**. Ese token se envía en cada petición para demostrar quién es.

#### A. Instalación y Configuración

Normalmente Sanctum ya viene instalado. Solo asegúrate de que tu modelo `User` tenga el trait:

PHP

```
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable {
    use HasApiTokens, HasFactory, Notifiable;
}
```

#### B. Ruta de Login para la API (`routes/api.php`)

Necesitamos una ruta para que el usuario intercambie sus credenciales por un token.

PHP

```
use App\Models\User;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\ValidationException;

Route::post('/login', function (Request $request) {
    $request->validate([
        'email' => 'required|email',
        'password' => 'required',
    ]);

    $user = User::where('email', $request->email)->first();

    if (! $user || ! Hash::check($request->password, $user->password)) {
        throw ValidationException::withMessages(['email' => 'Credenciales incorrectas']);
    }

    // Creamos el token
    return ['token' => $user->createToken('api-token')->plainTextToken];
});
```

#### C. Proteger rutas con el Middleware `auth:sanctum`

Ahora, nadie podrá ver los productos vía API si no envía su token.

PHP

```
Route::middleware('auth:sanctum')->get('/products', function () {
    return Product::all();
});
```

------

### 3. ¿Cómo se prueba esto?

Para probar una API protegida no puedes usar solo el navegador. Se usa una herramienta como **Postman** o **Insomnia**:

1. Haces un `POST` a `/api/login` con el email y password.
2. Copias el `token` que te devuelve.
3. Haces un `GET` a `/api/products` añadiendo un **Header**:
   - `Authorization: Bearer TU_TOKEN_AQUI`

------

### ¡Felicidades! 🏆

Has recorrido todo el camino de un desarrollador de Laravel:

- **Web:** Rutas, Vistas, Blade, Layouts.
- **Base de Datos:** Migraciones, Eloquent, Relaciones, Seeders.
- **Lógica:** Controladores, Validación, Subida de archivos.
- **Seguridad:** Middleware, CSRF, Autenticación de API.
- **Funcionalidad:** Carrito de compras, Paginación, Buscador.



¡Has llegado al nivel avanzado! Vamos a cerrar con los dos pilares que separan a un programador de un **Ingeniero de Software**: asegurar que el código funcione siempre (**Testing**) y ponerlo a disposición del mundo (**Deployment**).

------

### 1. Tests Automáticos (Pestañea y comprueba todo)

Imagina que cambias algo en el carrito y, sin querer, rompes el login. Los tests evitan esto. Laravel usa **Pest** o **PHPUnit**.

#### A. Crear un Test de Función (Feature Test)

Bash

```
php artisan make:test ProductTest
```

#### B. Escribir el Test (`tests/Feature/ProductTest.php`)

Vamos a probar que un admin puede crear un producto:

PHP

```
public function test_admin_can_create_product()
{
    $admin = User::factory()->create(['is_admin' => true]);

    $response = $this->actingAs($admin)
        ->post('/tienda', [
            'name' => 'Producto de Prueba',
            'price' => 99.99,
            'category_id' => 1
        ]);

    $response->assertRedirect('/tienda');
    $this->assertDatabaseHas('products', ['name' => 'Producto de Prueba']);
}
```

Para correr todos tus tests: `php artisan test`. Si sale todo en **verde**, puedes dormir tranquilo.

------

### 2. Despliegue (Deployment) a Producción

Llevar Laravel a un servidor real requiere unos pasos específicos para que sea rápido y seguro.

#### A. El archivo `.env` de Producción

Nunca subas tu archivo `.env` local. En el servidor, asegúrate de cambiar:

- `APP_DEBUG=false` (Para que no se vean errores detallados a los hackers).
- `APP_ENV=production`.
- Configura los datos reales de tu base de datos de producción.

#### B. Optimización de Rendimiento

En el servidor, ejecuta estos comandos para que Laravel vuele:

Bash

```
composer install --optimize-autoloader --no-dev
php artisan config:cache   # Une todos los configs en uno solo
php artisan route:cache    # Registra las rutas instantáneamente
php artisan view:cache     # Pre-compila las vistas Blade
```

#### C. Opciones de Hosting

1. **Laravel Forge (Recomendado):** Herramienta oficial que configura servidores en DigitalOcean/AWS por ti.
2. **Hosting Compartido:** Barato, pero difícil de configurar (tienes que mover la carpeta `public` o configurar enlaces simbólicos).
3. **VPS (Ubuntu + Nginx):** Tienes control total. Necesitarás instalar PHP, MySQL y Nginx manualmente.

------

### Resumen del Ecosistema Laravel

Ahora que conoces todo el ciclo, así es como se ve un flujo de trabajo profesional:

1. **Local:** Desarrollas la funcionalidad y escribes el **Test**.
2. **Git:** Subes tu código a un repositorio (GitHub/GitLab).
3. **CI (Integración Continua):** GitHub Actions corre tus **Tests** automáticamente.
4. **CD (Despliegue Continuo):** Si los tests pasan, el código se envía al **Servidor** y se ejecutan los comandos de **Optimización**.



¡Has completado el entrenamiento de nivel experto! Ahora vamos a montar la "fábrica" de software: automatizaremos el control de calidad con **GitHub Actions** y estructuraremos tu **proyecto real**.

------

### 1. GitHub Actions: Tu "Robot" de Control de Calidad

Imagina que trabajas en equipo. No quieres que nadie suba código que rompa la tienda. GitHub Actions ejecutará tus tests cada vez que alguien haga un `push`.

**Archivo:** `.github/workflows/laravel.yml`

YAML

```
name: Laravel CI

on: [push, pull_request]

jobs:
  laravel-tests:
    runs-on: ubuntu-latest
    services:
      mysql:
        image: mysql:8.0
        env:
          MYSQL_ROOT_PASSWORD: password
          MYSQL_DATABASE: testing
        ports:
          - 3306:3306

    steps:
    - uses: actions/checkout@v3
    - name: Setup PHP
      uses: shivammathur/setup-php@v2
      with:
        php-version: '8.2'
    - name: Install Dependencies
      run: composer install --prefer-dist --no-progress
    - name: Run Tests
      run: php artisan test
      env:
        DB_CONNECTION: mysql
        DB_PORT: 3306
```

------

### 2. Estructura de un Proyecto Real

Si vas a lanzar una idea propia (por ejemplo, un SaaS, un Marketplace o una App de Gestión), debes organizar tus pensamientos antes de tocar el código.

#### Hoja de Ruta para tu Idea:

1. **Definición de Entidades:** ¿Qué datos necesito? (Usuarios, Suscripciones, Pedidos).
2. **Relaciones de Base de Datos:** ¿Un usuario tiene muchos pedidos? ¿Un pedido tiene muchos productos?
3. **MVP (Producto Mínimo Viable):** Define lo mínimo que debe hacer tu app para ser útil. No intentes hacer "Amazon" el primer día.

------

### 3. El Gran Resumen: Tu Caja de Herramientas Laravel

| **Fase**       | **Herramienta**        | **Propósito**                                        |
| -------------- | ---------------------- | ---------------------------------------------------- |
| **Desarrollo** | `Valet` / `Sail`       | Entorno local de desarrollo.                         |
| **Lógica**     | `Eloquent`             | Manipular la base de datos como si fueran objetos.   |
| **Seguridad**  | `Sanctum` / `Policies` | Quién puede ver qué y cómo se loguean.               |
| **Calidad**    | `Pest` / `PHPUnit`     | Asegurar que el código no se rompa al cambiar cosas. |
| **Frontend**   | `Blade` / `Inertia.js` | Crear la interfaz visual.                            |
| **Despliegue** | `Forge` / `Envoyer`    | Mandar tu app al servidor con un click.              |



¡Esto es como graduarse con honores! Vamos a cerrar este ciclo con una **Estrategia de Proyecto Real** y la implementación de **Inertia.js**, que es la tecnología que está dominando el desarrollo moderno con Laravel.

------

### 1. Diseño de tu Proyecto Real (Blueprint)

Imagina que vamos a crear un **SaaS de Gestión de Cursos**. Aquí está cómo debes estructurarlo antes de escribir una sola línea de código:

#### A. Entidades y Relaciones (Database Design)

- **Users:** (id, name, email, role).
- **Courses:** (id, title, description, teacher_id). *Un profesor tiene muchos cursos.*
- **Lessons:** (id, course_id, video_url, order). *Un curso tiene muchas lecciones.*
- **Enrollments:** (user_id, course_id). *Relación muchos a muchos entre alumnos y cursos.*

#### B. Flujo de Rutas

- `/dashboard`: Vista general para el alumno.
- `/admin/courses`: CRUD de cursos para el profesor (protegido con Middleware).
- `/api/v1/`: Endpoints para una posible App móvil.

------

### 2. Inertia.js: El "Santo Grial" del Frontend

Inertia te permite crear aplicaciones con la experiencia de usuario de una **SPA** (Single Page Application) usando Vue o React, pero manteniendo la sencillez del enrutamiento y los controladores de **Laravel**. No necesitas una API JSON compleja.

#### ¿Cómo funciona?

#### A. Instalación rápida

Bash

```
composer require inertiajs/inertia-laravel
php artisan inertia:middleware
```

#### B. El Controlador con Inertia

En lugar de `view()`, usamos `Inertia::render()`. Laravel envía los datos y Inertia se encarga de que la página no se recargue al navegar.

PHP

```
use Inertia\Inertia;

public function index()
{
    return Inertia::render('Courses/Index', [
        'courses' => Course::all(),
    ]);
}
```

#### C. El Componente (Frontend en Vue.js)

En tu archivo `resources/js/Pages/Courses/Index.vue`:

Fragmento de código

```
<template>
  <h1>Mis Cursos</h1>
  <div v-for="course in courses" :key="course.id">
    {{ course.title }}
  </div>
</template>

<script setup>
defineProps({ courses: Array })
</script>
```

------

### 3. Automatización Total (CI/CD + Tests)

Para que tu proyecto real sea exitoso, tu flujo debe ser este:

1. **Escribir Código:** Creas la funcionalidad en Laravel + Inertia.
2. **Testear:** Corres `php artisan test` (incluyendo los tests de GitHub Actions que configuramos antes).
3. **Desplegar:** Al hacer `git push`, tu servidor de producción (como Laravel Forge) detecta el cambio, descarga las dependencias y reinicia los servicios automáticamente.

------

### Tu Kit Final de Herramientas 🛠️

Para tu nuevo proyecto, te recomiendo usar **Laravel Breeze** o **Laravel Jetstream**. Son "starters" que ya traen:

- Login y Registro.
- Protección de rutas.
- **Inertia.js** ya configurado.
- Tailwind CSS listo para usar.

**¿Qué te parece si empezamos diseñando la base de datos de tu primera idea de negocio o prefieres que te ayude a instalar Laravel Breeze con Inertia para que veas cómo funciona en vivo?**