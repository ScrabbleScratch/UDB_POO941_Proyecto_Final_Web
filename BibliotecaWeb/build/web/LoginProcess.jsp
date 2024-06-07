<%-- 
    Document   : LoginProcess
    Created on : Jun 5, 2024, 4:43:11 PM
    Author     : Mario O.
--%>

<%@page import="dao.LoginDao"%>
<jsp:useBean id="obj" class="bean.LoginBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    String role = LoginDao.validate(obj);
    if (role != null) {
        session.setAttribute("session", "TRUE");
        session.setAttribute("user_role", role);
%>
        <jsp:forward page="Menu.jsp"/>
<%
    } else {
%>
        <jsp:forward page="Login.jsp">
            <jsp:param name="logErr" value="Credenciales inválidas" />
        </jsp:forward>
<%        
    }
%>
