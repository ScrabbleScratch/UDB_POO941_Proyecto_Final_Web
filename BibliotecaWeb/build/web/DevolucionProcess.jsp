<%-- 
    Document   : DevolucionProcess
    Created on : Jun 5, 2024, 10:39:00 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="dao.DevolucionDao"%>
<jsp:useBean id="obj" class="bean.DevolucionBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    boolean result = DevolucionDao.validate(obj);
    if (result) {
        out.println("Prestamo devuelto");
    } else {
        out.println("No se pudo devolver el prestamo");   
    }
%>

<jsp:forward page="Prestamos.jsp"/>
