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

        <label>Correo:</label><br>
        <input type="email" name="correo" required><br><br>
        
        <input type="submit" value="Registrar">
    </form>

</body>
</html>

