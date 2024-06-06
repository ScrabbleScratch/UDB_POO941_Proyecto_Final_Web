<%-- 
    Document   : LogoutProcess
    Created on : Jun 5, 2024, 5:28:15 PM
    Author     : Mario O.
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("session", "FALSE");
    session.setAttribute("user_role", null);
%>
<jsp:forward page="Login.jsp"/>
