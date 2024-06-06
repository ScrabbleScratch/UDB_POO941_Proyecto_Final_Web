<%-- 
    Document   : MoraProcess
    Created on : Jun 6, 2024, 01:53:00 AM
    Author     : Mario O.
--%>

<%@page import="usuario.StatusUsuario"%>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(request.getParameter("usuario"));
%>

<jsp:forward page="Mora.jsp">
    <jsp:param name="activos" value='<%= status != null ? status.prestamosActivos : "" %>' />
    <jsp:param name="mora" value='<%= status != null ? status.moraAcumulada.get("total")[1] : "" %>' />
</jsp:forward>
