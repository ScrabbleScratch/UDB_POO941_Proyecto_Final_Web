<%-- 
    Document   : LogoutProcess
    Created on : Jun 5, 2024, 5:28:15 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    session.setAttribute("session", "FALSE");
%>
<jsp:forward page="Login.jsp"/>
