<%-- 
    Document   : AgregarProcess
    Created on : Jun 6, 2024, 02:42:00 PM
    Author     : Mario O.
--%>

<%@page import="bean.AgregarDao"%>
<jsp:useBean id="obj" class="bean.AgregarBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    if (AgregarDao.validate(obj)) {
    %>
        <jsp:forward page="Agregar.jsp">
            <jsp:param name="addHelp" value="Ítem guardado correctamente" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Agregar.jsp">
            <jsp:param name="addErr" value="El ítem no pudo ser guardado" />
        </jsp:forward>
    <%
    }
%>
