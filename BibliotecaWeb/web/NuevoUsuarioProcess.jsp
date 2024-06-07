<%-- 
    Document   : NuevousuarioProcess
    Created on : Jun 6, 2024, 02:56:00 AM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="usuario.StatusUsuario, dao.NuevoUsuarioDao"%>
<jsp:useBean id="obj" class="bean.UsuarioBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(obj.getUsuario());
    if (status != null) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="usrErr" value="El usuario ya existe" />
            <jsp:param name="tab" value="1" />
        </jsp:forward>
    <%
    } else if (NuevoUsuarioDao.validate(obj)) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="usrHelp" value="El usuario se creó correctamente" />
            <jsp:param name="tab" value="1" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="usrErr" value="El usuario no pudo ser creado" />
            <jsp:param name="tab" value="1" />
        </jsp:forward>
    <%
    }
%>
