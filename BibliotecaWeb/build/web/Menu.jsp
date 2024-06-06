<%-- 
    Document   : Menu
    Created on : Jun 5, 2024, 2:52:13 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Bienvenido</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
</head>
<body>
    <div class="container">
        <div class="text-center pb-5">
            <h1>Bienvenido</h1>
        </div>
        <div class="d-flex flex-column align-items-center gap-2">
            <a href="Consulta.jsp" class="btn btn-primary" style="width: 200px;">
                Consultar Items
            </a>
            <a href="Agregar.jsp" class="btn btn-primary" style="width: 200px;">
                Agregar Items
            </a>
            <a href="Prestamos.jsp" class="btn btn-primary" style="width: 200px;">
                Préstamos
            </a>
            <a href="Usuarios.jsp" class="btn btn-primary" style="width: 200px;">
                Gestionar Usuarios
            </a>
            <br>
            <a href="LogoutProcess.jsp" class="btn btn-outline-danger" style="width: 200px;">
                Cerrar Sesión
            </a>
        </div>
    </div>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</body>
</html>
