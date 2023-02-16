"# presupuestos_back" 

Recuerda que tienes que instalar el node_modules y crear un archivo .env con tus variables de entorno para conectar con la base de datos. Voy a adjutar el modelo de la base de datos para que la generes en tu ordenador.


REGISTRAR UN USUARIO
Se registra un usuario haciendo un POST sobre la ruta /login y pásandole el siguiente objeto:
{
    "userName": "name",
    "userEmail": "email",
    "password": "password"
}

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
