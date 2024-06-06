<%-- 
    Document   : Configuracion
    Created on : Jun 5, 2024, 2:29:04 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <title>Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <h1>
            <button type="button" class="btn btn-lg" onclick="location.href='Menu.jsp'">
                <i class="bi bi-arrow-left-square"></i>
            </button>
            Gestionar Usuarios
        </h1>
        <div class="row">
            <div class="col-md-12">
                <div class="accordion" id="accordionExample">
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingOne">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                Agregar usuario
                            </button>
                        </h2>
                        <div id="collapseOne" class="accordion-collapse collapse ${param.tab == "1" ? "show" : ""}" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <form action="NuevoUsuarioProcess.jsp" method="post" class="d-flex flex-column gap-3">
                                    <div class="form-group">
                                        <label for="username">Nombre de usuario</label>
                                        <input type="text" class="form-control" id="username" name="usuario" placeholder="Nombre de usuario" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="password">Contraseña</label>
                                        <input type="password" class="form-control" id="password" name="pass" placeholder="Contraseña" required="">
                                    </div>
                                    <div class="form-group">
                                        <label for="role">Rol</label>
                                        <select class="form-control" id="role" name="rol" required>
                                            <option value="">Seleccione un rol</option>
                                            <option value="1">Administrador</option>
                                            <option value="2">Profesor</option>
                                            <option value="3">Alumno</option>
                                        </select>
                                    </div>
                                    <p class="text-success">${param.usrHelp}</p>
                                    <p class="text-danger">${param.usrErr}</p>
                                    <button type="submit" class="btn btn-primary">Agregar usuario</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingTwo">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
                                Restablecer contraseña de usuario
                            </button>
                        </h2>
                        <div id="collapseTwo" class="accordion-collapse collapse ${param.tab == "2" ? "show" : ""}" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <form action="CambiarPassProcess.jsp" method="post" class="d-flex flex-column gap-3">
                                    <div class="form-group">
                                        <label for="username">Nombre de usuario</label>
                                        <input type="text" class="form-control" id="username" name="usuario" placeholder="Nombre de usuario" required>
                                    </div>
                                    <div class="form-group">
                                        <label for="newpassword">Nueva contraseña</label>
                                        <input type="password" class="form-control" id="newpassword" name="pass" placeholder="Nueva contraseña" required>
                                    </div>
                                    <p class="text-success">${param.passHelp}</p>
                                    <p class="text-danger">${param.passErr}</p>
                                    <button type="submit" class="btn btn-primary">Restablecer contraseña</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingThree">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
                                Eliminar usuario
                            </button>
                        </h2>
                        <div id="collapseThree" class="accordion-collapse collapse ${param.tab == "3" ? "show" : ""}" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <form action="EliminarUsuarioProcess.jsp" method="post" class="d-flex flex-column gap-3">
                                    <div class="form-group">
                                        <label for="username">Nombre de usuario</label>
                                        <input type="text" class="form-control" id="username" name="usuario" placeholder="Nombre de usuario" required>
                                    </div>
                                    <p class="text-success">${param.delHelp}</p>
                                    <p class="text-danger">${param.delErr}</p>
                                    <button type="submit" class="btn btn-danger">Eliminar usuario</button>
                                </form>
                            </div>
                        </div>
                    </div>
                    <div class="accordion-item">
                        <h2 class="accordion-header" id="headingFour">
                            <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseFour" aria-expanded="false" aria-controls="collapseFour">
                                Configurar roles
                            </button>
                        </h2>
                        <div id="collapseFour" class="accordion-collapse collapse ${param.tab == "4" ? "show" : ""}" aria-labelledby="headingFour" data-bs-parent="#accordionExample">
                            <div class="accordion-body">
                                <form action="Rol.jsp" method="post" class="d-flex flex-column gap-3">
                                    <div class="form-group">
                                        <label for="role">Rol</label>
                                        <select class="form-control" id="role" name="id" required>
                                            <option value="">Seleccione un rol</option>
                                            <option value="1">Administrador</option>
                                            <option value="2">Profesor</option>
                                            <option value="3">Alumno</option>
                                        </select>
                                    </div>
                                    <p class="text-success">${param.rolHelp}</p>
                                    <p class="text-danger">${param.rolErr}</p>
                                    <button type="submit" class="btn btn-primary">Configurar rol</button>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>