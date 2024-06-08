<%-- 
    Document   : Agregar
    Created on : Jun 5, 2024, 2:18:37 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.time.*"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Agregar Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <%@include file="WEB-INF/Navbar.jspf"%>
    <div class="container mb-5">
        <div class="title-container d-flex align-items-center justify-content-between">
            <h1>
                <button type="button" class="btn btn-lg" onclick="location.href='Consulta.jsp'">
                    <i class="bi bi-arrow-left-square"></i>
                </button>
                Agregar
            </h1>
            <div>
                <p class="text-success">${param.addHelp}</p>
                <p class="text-danger">${param.addErr}</p>
            </div>
        </div>
        <div class="tab-container">
            <ul class="nav nav-tabs" id="myTab" role="tablist">
                <li class="nav-item" role="presentation">
                    <button class="nav-link active" id="libros-tab" data-bs-toggle="tab" data-bs-target="#libros" type="button" role="tab" aria-controls="libros" aria-selected="true">
                        Libros
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="obras-tab" data-bs-toggle="tab" data-bs-target="#obras" type="button" role="tab" aria-controls="obras" aria-selected="false">
                        Obras
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="revistas-tab" data-bs-toggle="tab" data-bs-target="#revistas" type="button" role="tab" aria-controls="revistas" aria-selected="false">
                        Revistas
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="cd-tab" data-bs-toggle="tab" data-bs-target="#cd" type="button" role="tab" aria-controls="cd" aria-selected="false">
                        CD
                    </button>
                </li>
                <li class="nav-item" role="presentation">
                    <button class="nav-link" id="tesis-tab" data-bs-toggle="tab" data-bs-target="#tesis" type="button" role="tab" aria-controls="tesis" aria-selected="false">
                        Tesis
                    </button>
                </li>
            </ul>
            <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade show active" id="libros" role="tabpanel" aria-labelledby="libros-tab">
                    <form action="AgregarProcess.jsp" method="post" class="d-flex flex-column gap-3">
                        <input type="hidden" name="categoria" value="libros" required>
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título del libro" required>
                        </div>
                        <div class="form-group">
                            <label for="autor">Autor</label>
                            <input type="text" class="form-control" id="autor" name="autor" placeholder="Autor del libro" required>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Género</label>
                            <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Género del libro" required>
                        </div>
                        <div class="form-group">
                            <label for="editorial">Editorial</label>
                            <input type="text" class="form-control" id="editorial" name="editorial" placeholder="Editorial del libro">
                        </div>
                        <div class="form-group">
                            <label for="identificacion">ISBN</label>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="ISBN del libro">
                        </div>
                        <div class="form-group">
                            <label for="publicacion">Año de publicación</label>
                            <input type="number" min="0" max="<%= Year.now() %>" class="form-control" id="publicacion" name="publicacion" placeholder="Año de publicación del libro">
                        </div>
                        <div class="form-group">
                            <label for="edicion">Edición</label>
                            <input type="text" class="form-control" id="edicion" name="edicion" placeholder="Edición del libro">
                        </div>
                        <div class="form-group">
                            <label for="unidades">Unidades</label>
                            <input type="number" min="1" class="form-control" id="unidades" name="unidades" placeholder="Unidades disponibles" required>
                        </div>
                        <div class="form-group">
                            <label for="estante">Estante</label>
                            <input type="text" class="form-control" id="estante" name="estante" placeholder="Estante donde se encuentra" required>
                        </div>
                        <div class="form-group">
                            <label for="tags">Palabras clave</label>
                            <input type="text" class="form-control" id="tags" name="tags" placeholder="Palabras clave">
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar libro</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="obras" role="tabpanel" aria-labelledby="obras-tab">
                    <form action="AgregarProcess.jsp" method="post" class="d-flex flex-column gap-3">
                        <input type="hidden" name="categoria" value="obras" required>
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título de la obra" required>
                        </div>
                        <div class="form-group">
                            <label for="autor">Autor</label>
                            <input type="text" class="form-control" id="autor" name="autor" placeholder="Autor de la obra" required>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Género</label>
                            <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Género de la obra" required>
                        </div>
                        <div class="form-group">
                            <label for="editorial">Editorial</label>
                            <input type="text" class="form-control" id="editorial" name="editorial" placeholder="Editorial de la obra">
                        </div>
                        <div class="form-group">
                            <label for="identificacion">ISBN</label>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="ISBN de la obra">
                        </div>
                        <div class="form-group">
                            <label for="publicacion">Año de publicación</label>
                            <input type="number" min="0" max="<%= Year.now() %>" class="form-control" id="publicacion" name="publicacion" placeholder="Año de publicación de la obra">
                        </div>
                        <div class="form-group">
                            <label for="edicion">Edición</label>
                            <input type="text" class="form-control" id="edicion" name="edicion" placeholder="Edición de la obra">
                        </div>
                        <div class="form-group">
                            <label for="unidades">Unidades</label>
                            <input type="number" min="1" class="form-control" id="unidades" name="unidades" placeholder="Unidades disponibles" required>
                        </div>
                        <div class="form-group">
                            <label for="estante">Estante</label>
                            <input type="text" class="form-control" id="estante" name="estante" placeholder="Estante donde se encuentra" required>
                        </div>
                        <div class="form-group">
                            <label for="tags">Palabras clave</label>
                            <input type="text" class="form-control" id="tags" name="tags" placeholder="Palabras clave">
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar obra</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="revistas" role="tabpanel" aria-labelledby="revistas-tab">
                    <form action="AgregarProcess.jsp" method="post" class="d-flex flex-column gap-3">
                        <input type="hidden" name="categoria" value="revistas" required>
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título de la revista" required>
                        </div>
                        <div class="form-group">
                            <label for="editorial">Editorial</label>
                            <input type="text" class="form-control" id="editorial" name="editorial" placeholder="Editorial de la revista">
                        </div>
                        <div class="form-group">
                            <label for="publicacion">Frecuencia de publicación</label>
                            <input type="text" class="form-control" id="publicacion" name="publicacion" placeholder="Frecuencia con la que se publica la revista">
                        </div>
                        <div class="form-group">
                            <label for="identificacion">ISSN</label>
                            <input type="text" class="form-control" id="identificacion" name="identificacion" placeholder="ISSN de la revista">
                        </div>
                        <div class="form-group">
                            <label for="tipo">Temática</label>
                            <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Temática de la revista" required>
                        </div>
                        <div class="form-group">
                            <label for="edicion">Volúmen</label>
                            <input type="number" min="1" class="form-control" id="edicion" name="edicion" placeholder="Volúmen de la revista">
                        </div>
                        <div class="form-group">
                            <label for="unidades">Unidades</label>
                            <input type="number" min="1" class="form-control" id="unidades" name="unidades" placeholder="Unidades disponibles" required>
                        </div>
                        <div class="form-group">
                            <label for="estante">Estante</label>
                            <input type="text" class="form-control" id="estante" name="estante" placeholder="Estante donde se encuentra" required>
                        </div>
                        <div class="form-group">
                            <label for="tags">Palabras clave</label>
                            <input type="text" class="form-control" id="tags" name="tags" placeholder="Palabras clave">
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar revista</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="cd" role="tabpanel" aria-labelledby="cd-tab">
                    <form action="AgregarProcess.jsp" method="post" class="d-flex flex-column gap-3">
                        <input type="hidden" name="categoria" value="cds" required>
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título del CD" required>
                        </div>
                        <div class="form-group">
                            <label for="autor">Autor</label>
                            <input type="text" class="form-control" id="autor" name="autor" placeholder="Autor del CD" required>
                        </div>
                        <div class="form-group">
                            <label for="tipo">Género</label>
                            <input type="text" class="form-control" id="tipo" name="tipo" placeholder="Género del CD" required>
                        </div>
                        <div class="form-group">
                            <label for="publicacion">Año de publicación</label>
                            <input type="number" min="0" max="<%= Year.now() %>" class="form-control" id="publicacion" name="publicacion" placeholder="Año de publicación del CD">
                        </div>
                        <div class="form-group">
                            <label for="duracion">Duración</label>
                            <input type="number" min="0" class="form-control" id="duracion" name="duracion" placeholder="Duración del CD">
                        </div>
                        <div class="form-group">
                            <label for="unidades">Unidades</label>
                            <input type="number" min="1" class="form-control" id="unidades" name="unidades" placeholder="Unidades disponibles" required>
                        </div>
                        <div class="form-group">
                            <label for="estante">Estante</label>
                            <input type="text" class="form-control" id="estante" name="estante" placeholder="Estante donde se encuentra" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar CD</button>
                    </form>
                </div>
                <div class="tab-pane fade" id="tesis" role="tabpanel" aria-labelledby="tesis-tab">
                    <form action="AgregarProcess.jsp" method="post" class="d-flex flex-column gap-3">
                        <input type="hidden" name="categoria" value="tesis" required>
                        <div class="form-group">
                            <label for="titulo">Título</label>
                            <input type="text" class="form-control" id="titulo" name="titulo" placeholder="Título de la tesis" required>
                        </div>
                        <div class="form-group">
                            <label for="publicacion">Fecha de publicación</label>
                            <input type="date" class="form-control" id="publicacion" name="publicacion" placeholder="Fecha de publicación de la tesis">
                        </div>
                        <div class="form-group">
                            <label for="editorial">Institución</label>
                            <input type="text" class="form-control" id="editorial" name="editorial" placeholder="Institución de la tesis" required>
                        </div>
                        <div class="form-group">
                            <label for="autor">Facultad</label>
                            <input type="text" class="form-control" id="autor" name="autor" placeholder="Facultad de la tesis" required>
                        </div>
                        <div class="form-group">
                            <label for="duracion">Páginas</label>
                            <input type="number" min="0" class="form-control" id="duracion" name="duracion" placeholder="Páginas de la tesis">
                        </div>
                        <div class="form-group">
                            <label for="unidades">Unidades</label>
                            <input type="number" min="1" class="form-control" id="unidades" name="unidades" placeholder="Unidades disponibles" required>
                        </div>
                        <div class="form-group">
                            <label for="estante">Estante</label>
                            <input type="text" class="form-control" id="estante" name="estante" placeholder="Estante donde se encuentra" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Agregar tesis</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>
           
