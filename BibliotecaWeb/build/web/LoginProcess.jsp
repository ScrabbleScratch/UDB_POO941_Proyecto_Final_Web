<%-- 
    Document   : LoginProcess
    Created on : Jun 5, 2024, 4:43:11 PM
    Author     : Mario O.
--%>

<%@page import="dao.LoginDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    boolean admin = LoginDao.validate(obj);
    if (admin) {
        session.setAttribute("session", "TRUE");
    %>
        <jsp:forward page="Consulta.jsp"/>
    <%
    } else {
    %>
        <jsp:forward page="Login.jsp">
            <jsp:param name="logErr" value="Credenciales inválidas" />
        </jsp:forward>
    <%        
    }
%>
