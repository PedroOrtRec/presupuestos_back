"# presupuestos_back" 

Recuerda que tienes que instalar el node_modules y crear un archivo .env con tus variables de entorno para conectar con la base de datos. Voy a adjutar el modelo de la base de datos para que la generes en tu ordenador.


-- SISTEMA DE ARCHIVOS Y CARPETAS --

-INDEX.JS : ENTRADA A NUESTRA APLICACIÓN
-LOGIN.JS : ESTE ARCHIVO SE ENCARGARÁ DE REGISTRAR Y LOGUEAR USUARIOS Y SUMINISTRAR TOKENS
-USER.JS : ESTE ARCHIVO ES LA ENTRADA AL AREA DEL CLIENTE, PEDIRÁ EL TOKEN
-CARPETA USER: EN ESTA CARPETA ENCONTRAMOS EL HOME.JS, DONDE SE VE O MODIFICA EL USUARIO, EL GROUPS.JS DONDE SE ADMINISTRAN LOS GRUPOS, TAMBIÉN DEBERÍA PEDIR TOKEN PARA VER EL ROL, Y EL SOCIAL, DONDE SE ADMINISTRARÁ EL TEMA DEL CHAT. 
-?? DENTRO DE LA CARPETA GRUPOS APARECE EL ARCHIVO SLICE.JS (SE SUPONE QUE DEBE SERVIR PARA ADMINISTRAR LOS SLICES DE CADA GRUPO)
-?? DENTRO DE LA CARPETA SOCIAL, EL ARCHIVO CHAT.JS DEBERÍA ADMINISTRAR EL CHAT. (DEBERÍA HABER UNA BASE DE DATOS MONGODB)


-- REGISTRAR UN USUARIO --

Se registra un usuario haciendo un POST sobre la ruta /login/register y pásandole el siguiente objeto:
{
    "userName": "name",
    "userSurname": "surname",
    "userEmail": "email",
    "userPhone": "phone",
    "password": "password"
}

te genera un token

-- LOGUEAR UN USUARIO --

Puedes ver la información de un usuario a través de su id y pasándo la contraseña correcta haciendo un POST sobre la ruta /login y pasándole el siguiente objeto:

{
    "userEmail": "email",
    "password": "password"
}

te genera un token

-- VER LA INFO DE UN USUARIO --

Pasando una cabecera authorization: con el token actualizado de un usuario, puedes acceder a su información con un GET en /users/home

si descomentas esta función y comentas el middleware de checkToken en el router para home de users.js, puedes ver la información de un usuario a través de su id haciendo un GET en users/home/:userId


-- MODIFICAR UN USUARIO --

-- // BORRAR UN USUARIO --

--VER LOS GRUPOS DE UN USUARIO--

Pasando una cabecera authorization: con el token actualizado de un usuario, puedes acceder a su información de todos sus grupos haciendo un GET sobre users/groups. Además, por cada grupo, te devuelve un array con los participantes y su id.

Si descomentas esta función y comentas el middleware de checkToken en el router para groups de users.js, Con la ruta GET /users/groups/:clientId podemos entrar en la carpeta ./users/groups y desde allí hacemos una petición que nos devuelve la lista de grupos que tiene el usuario que le pasemos por parametro

-- CREAR UN GRUPO --

Se puede crear un grupo en la ruta users/groups/new pasándole un objeto:

{
    "groupTitle": "title",
    "groupDescription": "description"
}

y al crearlo añade como administrado al usuario que indique el token de la cabecera necesaria para entrar en users. La api responde con los datos del grupo y los datos del administrador.

-- MODIFICAR UN GRUPO --

-- BORRAR UN GRUPO --

-- AÑADIR UN SLICE A UN GRUPO --

-- BORRAR UN SLICE --

-- MODIFICAR UN SLICE --

// TODO //

- MODIFICAR USUARIOS
- CREAR, BORRAR Y MODIFICAR GRUPOS
- CREAR, BORRAR Y MODIFICAR PAGOS
- MODIFICAR GRUPOS TIENEN USUARIOS PARA AÑADIR LA DEUDA
- OBTENER Y MODIFICA LA DEUDA
- CODIFICAR LA PASSWORD
- COMPROBAR QUE LOS DATOS EXISTEN AL LOGEARSE
- COMPROBAR QUE LOS DATOS NO EXISTEN Y SON CORRECTOS AL REGISTRARSE
- RESTRINGIR EL PASO A USUARIOS NO LOGEADOS
- PERSONALIZAR EL PASO A USUARIOS SÍ LOGEADOS
