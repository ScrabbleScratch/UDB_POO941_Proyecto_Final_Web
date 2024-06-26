<%-- 
    Document   : Devolucion
    Created on : Jun 5, 2024, 10:02:14 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Devolver Préstamo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <%@include file="WEB-INF/Navbar.jspf"%>
    <div class="container">
        <div class="title-container d-flex align-items-center justify-content-between">
            <h1>
                <button type="button" class="btn btn-lg" onclick="location.href='Prestamos.jsp'">
                    <i class="bi bi-arrow-left-square"></i>
                </button>
                Devolución
            </h1>
        </div>
        <form action="DevolucionProcess.jsp" method="post" class="d-flex flex-column gap-3">
            <div class="form-group">
                <label for="categoria">Categoría</label>
                <input type="text" class="form-control" id="categoria" name="categoria" value="${param.categoria}" readonly required>
            </div>
            <div class="form-group">
                <label for="nombre_item">Título del ítem</label>
                <input type="text" class="form-control" id="titulo_item" name="titulo" value="${param.titulo}" readonly required>
            </div>
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" value="${param.usuario}" readonly required>
            </div>
            <div class="form-group">
                <label for="mora_pagar">Mora a pagar</label>
                <input type="text" class="form-control" id="mora_pagar" name="mora" value="${param.mora}" readonly>
            </div>
            <input type="hidden" name="id" value="${param.id}" required>
            <button type="submit" class="btn btn-primary">Confirmar devolución</button>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
