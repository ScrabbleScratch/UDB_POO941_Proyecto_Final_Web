<%-- 
    Document   : Rol
    Created on : Jun 6, 2024, 01:57:00 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="bean.RolDao"%>
<jsp:useBean id="obj" class="bean.RolBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    obj = RolDao.fetch(obj);
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Configurar Rol</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <div class="title-container d-flex align-items-center justify-content-between">
            <h1>
                <button type="button" class="btn btn-lg" onclick="location.href='Usuarios.jsp?tab=4'">
                    <i class="bi bi-arrow-left-square"></i>
                </button>
                Rol
            </h1>
        </div>
        <form action="RolProcess.jsp" method="post" class="d-flex flex-column gap-3">
            <div class="form-group">
                <label for="rol">Rol</label>
                <input type="text" class="form-control" id="rol" name="rol" value="<%= obj.getNombre() %>" readonly required>
            </div>
            <div class="form-group">
                <label for="desc">Descripción</label>
                <input type="text" class="form-control" id="desc" name="descripcion" value="<%= obj.getDescripcion()%>" readonly required>
            </div>
            <div class="form-group">
                <label for="prestamos">Préstamos máximos</label>
                <input type="number" class="form-control" id="prestamos" name="prestamos" value="<%= obj.getPrestamos()%>" required>
            </div>
            <div class="form-group">
                <label for="dias">Cantidad de días máxima</label>
                <input type="number" class="form-control" id="dias" name="dias" value="<%= obj.getDias()%>" required>
            </div>
            <div class="form-group">
                <label for="mora">Mora diaria</label>
                <input type="number" class="form-control" id="mora" name="mora" value="<%= obj.getMora()%>" required>
            </div>
            <input type="hidden" name="id" value="<%= obj.getId()%>" required>
            <button type="submit" class="btn btn-primary">Guardar parámetros</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
