<%-- 
    Document   : CambiarPassProcess
    Created on : Jun 6, 2024, 02:50:00 AM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="usuario.StatusUsuario, dao.CambiarPassDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(obj.getUsuario());
    if (status == null) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="passErr" value="El usuario no existe" />
            <jsp:param name="tab" value="2" />
        </jsp:forward>
    <%
    } else if (CambiarPassDao.validate(obj)) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="passHelp" value="La contrase�a del usuario se cambi� correctamente" />
            <jsp:param name="tab" value="2" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="passErr" value=":a contrase�a del usuario no pudo ser cambiada" />
            <jsp:param name="tab" value="2" />
        </jsp:forward>
    <%
    }
%>
