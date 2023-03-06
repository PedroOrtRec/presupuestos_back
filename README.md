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


-- // MODIFICAR UN USUARIO --

-- // BORRAR UN USUARIO --


--VER LOS GRUPOS DE UN USUARIO--

Pasando una cabecera authorization: con el token actualizado de un usuario, puedes acceder a su información de todos sus grupos haciendo un GET sobre users/groups. Además, por cada grupo, te devuelve un array con los participantes y su id.

Si descomentas esta función y comentas el middleware de checkToken en el router para groups de users.js, Con la ruta GET /users/groups/:clientId podemos entrar en la carpeta ./users/groups y desde allí hacemos una petición que nos devuelve la lista de grupos que tiene el usuario que le pasemos por parametro

--VER UN GRUPO POR ID--
Con el token, en la ruta users/groups/:groupId, se puede hacer un get para obtener un grupo por id pasada por parámetro.

-- CREAR UN GRUPO --

Se puede crear un grupo en la ruta users/groups/new pasándole un objeto:

{
    "groupTitle": "title",
    "groupDescription": "description"
}

y al crearlo añade como administrado al usuario que indique el token de la cabecera necesaria para entrar en users. La api responde con los datos del grupo y los datos del administrador.

-- METODO ANTIGUO DE AÑADIR UN USUARIO A UN GRUPO --

-hay que descomentar esta lógica para poder usarla. groups.js-

Se puede añadir un nuevo usuario a un grupo en la ruta users/groups/:groupId/addUser. Se necesita token, introducir por parámetro la id del grupo y en elbody la id del usuario en un objeto:

{
    "userId": "id"
}

Devuelve la información del grupo con todos sus usuarios

-- MODIFICAR UN GRUPO --

-- BORRAR UN GRUPO --

-- CREAR UN SLICE --

Se puede crear un slice haciendo una petición post a la ruta users/groups/:groupId/slices/add, teniendo token y pasándole el siguiente objeto:

{
        "description" : "description",
    "amount" : "amount",
    "userId" : "userId",
    "usersDebtors" : [array of usersId]

}

Esto devuelve un array con los usuarios del grupo con su nueva deuda

-- BORRAR UN SLICE --

-- MODIFICAR UN SLICE --

-- MANDAR UNA INVITACIÓN --

Se puede mandar una invitación a un usuario desde la ruta users/groups/:groupId/invitations. Teniendo el token y mandando un objeto con los datos del usuario al que se le quiere mandar una invitación. El objeto puede ser así:

{
    "userEmail": "email"
}

o así

{
    "userPhone": "numberPhone"
}

-- VER LAS INVITACIONES --

Se pueden ver las invitaciones de un usuario con token haciendo un get a la ruta users/home/invitations

-- CHEKEAR UNA INVITACIÓN --

Se puede chekear una invitación en concreto, teniendo token, en la ruta users/home/invitations/:invitationId

-- ACEPTAR UNA INVITACIÓN (AÑADIR USUARIO AL GRUPO) -- 

Se puede aceptar una invitación, y por lo tanto añadir al usuario especificado en el token al grupo especificado en la invitación, en la ruta users/home/invitations/:invitationId/accept


// TODO //

- CREAR, BORRAR Y MODIFICAR GRUPOS
- BORRAR Y MODIFICAR PAGOS

- EN QUÉ MOMENTO PASAMOS EL ROL DEL USUARIO PARA SABER SI ES ADMIN DEL GRUPO Y QUE LE APAREZCAN COMPONENTES EN EL FRONT

- HACER TABLA DE INVITACIONES
- HACER FUNCIÓN DE MANDAR INVITACIÓN
- HACER FUNCIONALIDAD DE COMPROBAR SI HAY INVITACIONES, ACEPTAR INVITACIONES Y A PARTIR DE AHÍ AÑADIR USUARIO

- CHAT


- HAY QUE PREGUNTARLE AL PROFESOR SI EL MIDDLEWARE PARA RECOGER EL PARAMETRO INNACESIBLE EN SLICES SE PUEDE HACER
- REPASAR LA FUNCIONALIDAD DE CREAR UN SLICE Y PREGUNTAR POR QUÉ NO ME RECOGE LOS VALORES ACTUALIZADOS DE LOS DEUDORES

