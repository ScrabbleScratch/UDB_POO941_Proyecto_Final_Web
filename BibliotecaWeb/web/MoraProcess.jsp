<%-- 
    Document   : MoraProcess
    Created on : Jun 6, 2024, 01:53:00 AM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="usuario.StatusUsuario"%>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(request.getParameter("usuario"));
    if (status == null) {
    %>
        <jsp:forward page="Mora.jsp">
            <jsp:param name="moraErr" value="El usuario indicado no existe" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Mora.jsp">
            <jsp:param name="activos" value='<%= status.prestamosActivos %>' />
            <jsp:param name="mora" value='<%= status.moraAcumulada.get("total")[1] %>' />
        </jsp:forward>
    <%
    }
%>
