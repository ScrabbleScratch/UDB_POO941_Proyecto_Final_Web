<%-- 
    Document   : RolProcess
    Created on : Jun 6, 2024, 02:27:00 PM
    Author     : Mario O.
--%>

<%@page import="bean.RolDao"%>
<jsp:useBean id="obj" class="bean.RolBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    boolean result = RolDao.validate(obj);
    if (result) {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="rolHelp" value="Parámetros guardados correctamente" />
            <jsp:param name="tab" value="4" />
        </jsp:forward>
    <%
    } else {
    %>
        <jsp:forward page="Usuarios.jsp">
            <jsp:param name="rolErr" value="Los parámetros no pudieron ser guardados. Inténte nuevamente" />
            <jsp:param name="tab" value="4" />
        </jsp:forward>
    <%  
    }
%>
