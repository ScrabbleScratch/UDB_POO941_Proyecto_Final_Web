<%-- 
    Document   : EliminarUsuarioProcess
    Created on : Jun 6, 2024, 02:13:00 AM
    Author     : Mario O.
--%>

<%@page import="usuario.StatusUsuario, bean.EliminarUsuarioDao"%>

<%
    String usuario = request.getParameter("usuario");
    StatusUsuario status = StatusUsuario.usuarioStatus(usuario);
    if (status == null) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="delErr" value="El usuario no existe" />
            <jsp:param name="tab" value="3" />
        </jsp:forward>
    <%
    } else if (status.prestamosActivos > 0) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="delErr" value="El usuario tiene préstamos pendientes" />
            <jsp:param name="tab" value="3" />
        </jsp:forward>
    <%
    } else if (EliminarUsuarioDao.validate(usuario)) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="delHelp" value="El usuario fue eliminado correctamente" />
            <jsp:param name="tab" value="3" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="delErr" value="El usuario no pudo ser eliminado" />
            <jsp:param name="tab" value="3" />
        </jsp:forward>
    <%
    }
%>
