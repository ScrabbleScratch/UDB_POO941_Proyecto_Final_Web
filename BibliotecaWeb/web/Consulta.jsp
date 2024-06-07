<%-- 
    Document   : Consulta
    Created on : Jun 5, 2024, 2:12:44 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="dao.ConsultaDao, java.util.*"%>

<%
    List<String[]> librosData, obrasData, revistasData, cdsData, tesisData;
    librosData = ConsultaDao.dataCategoria("libros");
    obrasData = ConsultaDao.dataCategoria("obras");
    revistasData = ConsultaDao.dataCategoria("revistas");
    cdsData = ConsultaDao.dataCategoria("cds");
    tesisData = ConsultaDao.dataCategoria("tesis");
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <title>Consultar Items</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
</head>
<body>
    <div class="container">
        <div class="title-container">
            <h1>
                <button type="button" class="btn btn-lg" onclick="location.href='Menu.jsp'">
                    <i class="bi bi-arrow-left-square"></i>
                </button>
                Consultas
            </h1>
        </div>
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
                <table class="table">
                    <thead>
                        <tr>
                            <%
                                for (String col : librosData.get(0)) {
                                %>
                                    <th><%= col %></th>
                                <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String[] row : librosData.subList(1, librosData.size())) {
                            %>
                                <tr>
                                    <%
                                        for (String col : row) {
                                        %>
                                            <td><%= col %></td>
                                        <%
                                        }
                                        boolean disponible = Integer.parseInt(row[row.length - 1]) > 0;
                                        String color = disponible ? "btn-success" : "btn-danger";
                                        String disabled = disponible ? "" : "disabled";
                                    %>
                                    <td>
                                        <form action="Prestar.jsp" method="post">
                                            <input type="hidden" name="categoria" value="libros">
                                            <input type="hidden" name="id" value="<%= row[0] %>">
                                            <input type="hidden" name="titulo" value="<%= row[1] %>">
                                            <button type="submit" class="btn <%= color %> <%= disabled %>">
                                                Prestar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="obras" role="tabpanel" aria-labelledby="obras-tab">
                <table class="table">
                    <thead>
                        <tr>
                            <%
                                for (String col : obrasData.get(0)) {
                                %>
                                    <th><%= col %></th>
                                <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String[] row : obrasData.subList(1, obrasData.size())) {
                            %>
                                <tr>
                                    <%
                                        for (String col : row) {
                                        %>
                                            <td><%= col %></td>
                                        <%
                                        }
                                        boolean disponible = Integer.parseInt(row[row.length - 1]) > 0;
                                        String color = disponible ? "btn-success" : "btn-danger";
                                        String disabled = disponible ? "" : "disabled";
                                    %>
                                    <td>
                                        <form action="Prestar.jsp" method="post">
                                            <input type="hidden" name="categoria" value="libros">
                                            <input type="hidden" name="id" value="<%= row[0] %>">
                                            <input type="hidden" name="titulo" value="<%= row[1] %>">
                                            <button type="submit" class="btn <%= color %> <%= disabled %>">
                                                Prestar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="revistas" role="tabpanel" aria-labelledby="revistas-tab">
                <table class="table">
                    <thead>
                        <tr>
                            <%
                                for (String col : revistasData.get(0)) {
                                %>
                                    <th><%= col %></th>
                                <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String[] row : revistasData.subList(1, revistasData.size())) {
                            %>
                                <tr>
                                    <%
                                        for (String col : row) {
                                        %>
                                            <td><%= col %></td>
                                        <%
                                        }
                                        boolean disponible = Integer.parseInt(row[row.length - 1]) > 0;
                                        String color = disponible ? "btn-success" : "btn-danger";
                                        String disabled = disponible ? "" : "disabled";
                                    %>
                                    <td>
                                        <form action="Prestar.jsp" method="post">
                                            <input type="hidden" name="categoria" value="libros">
                                            <input type="hidden" name="id" value="<%= row[0] %>">
                                            <input type="hidden" name="titulo" value="<%= row[1] %>">
                                            <button type="submit" class="btn <%= color %> <%= disabled %>">
                                                Prestar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="cd" role="tabpanel" aria-labelledby="cd-tab">
                <table class="table">
                    <thead>
                        <tr>
                            <%
                                for (String col : cdsData.get(0)) {
                                %>
                                    <th><%= col %></th>
                                <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String[] row : cdsData.subList(1, cdsData.size())) {
                            %>
                                <tr>
                                    <%
                                        for (String col : row) {
                                        %>
                                            <td><%= col %></td>
                                        <%
                                        }
                                        boolean disponible = Integer.parseInt(row[row.length - 1]) > 0;
                                        String color = disponible ? "btn-success" : "btn-danger";
                                        String disabled = disponible ? "" : "disabled";
                                    %>
                                    <td>
                                        <form action="Prestar.jsp" method="post">
                                            <input type="hidden" name="categoria" value="libros">
                                            <input type="hidden" name="id" value="<%= row[0] %>">
                                            <input type="hidden" name="titulo" value="<%= row[1] %>">
                                            <button type="submit" class="btn <%= color %> <%= disabled %>">
                                                Prestar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
            <div class="tab-pane fade" id="tesis" role="tabpanel" aria-labelledby="tesis-tab">
                <table class="table">
                    <thead>
                        <tr>
                            <%
                                for (String col : tesisData.get(0)) {
                                %>
                                    <th><%= col %></th>
                                <%
                                }
                            %>
                        </tr>
                    </thead>
                    <tbody>
                        <%
                            for (String[] row : tesisData.subList(1, tesisData.size())) {
                            %>
                                <tr>
                                    <%
                                        for (String col : row) {
                                        %>
                                            <td><%= col %></td>
                                        <%
                                        }
                                        boolean disponible = Integer.parseInt(row[row.length - 1]) > 0;
                                        String color = disponible ? "btn-success" : "btn-danger";
                                        String disabled = disponible ? "" : "disabled";
                                    %>
                                    <td>
                                        <form action="Prestar.jsp" method="post">
                                            <input type="hidden" name="categoria" value="libros">
                                            <input type="hidden" name="id" value="<%= row[0] %>">
                                            <input type="hidden" name="titulo" value="<%= row[1] %>">
                                            <button type="submit" class="btn <%= color %> <%= disabled %>">
                                                Prestar
                                            </button>
                                        </form>
                                    </td>
                                </tr>
                            <%
                            }
                        %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
</html>