<%-- 
    Document   : insertarusuario
    Created on : 8 jun. 2025, 00:22:22
    Author     : dani9
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrar Nuevo Usuario</title>
</head>
<body>
    <h1>Registrar Nuevo Usuario</h1>
    
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="accion" value="insertar">
        
        <label>Nombre:</label><br>
        <input type="text" name="nombre" required><br><br>

        <label>Apellido paterno:</label>
        <input type="text" name="apellidoPaterno" required>

        <label>Apellido materno:</label>
        <input type="text" name="apellidoMaterno" required>

        <label>Fecha de nacimiento:</label>
        <input type="text" name="fechaNacimiento" required>

        <label>Correo:</label>
        <input type="text" name="correo" required>

        <label>Nombre de usuario:</label>
        <input type="text" name="nombreUsuario" required>

        <label>Contraseña:</label>
        <input type="text" name="contrasenia" required>

        <input type="submit" value="Registrar">
    </form>

</body>
</html>

