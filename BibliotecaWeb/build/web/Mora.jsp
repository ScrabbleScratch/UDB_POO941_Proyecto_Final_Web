<%-- 
    Document   : Mora
    Created on : Jun 6, 2024, 1:07:48 AM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Consultar Mora</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <div class="title-container d-flex align-items-center justify-content-between">
            <h1>
                <button type="button" class="btn btn-lg" onclick="location.href='Prestamos.jsp'">
                    <i class="bi bi-arrow-left-square"></i>
                </button>
                Mora
            </h1>
        </div>
        <form action="MoraProcess.jsp" method="post" class="d-flex flex-column gap-3">
            <div class="form-group">
                <label for="usuario">Usuario</label>
                <input type="text" class="form-control" id="usuario" name="usuario" value="${param.usuario}" required>
            </div>
            <p class="text-danger">${param.moraErr}</p>
            <button type="submit" class="btn btn-primary">Revisar mora</button>
            <div class="form-group">
                <label for="activos">Préstamos activos</label>
                <input type="text" class="form-control" id="activos" name="activos" value="${param.activos}" readonly>
            </div>
            <div class="form-group">
                <label for="mora_pagar">Mora pendiente</label>
                <input type="text" class="form-control" id="mora_pagar" name="mora" value="${param.mora}" readonly>
            </div>
        </form>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
