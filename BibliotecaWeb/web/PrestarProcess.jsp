<%-- 
    Document   : PrestarProcess
    Created on : Jun 5, 2024, 11:25:00 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="bean.PrestamoDao, usuario.StatusUsuario"%>
<jsp:useBean id="obj" class="bean.PrestamoBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(obj.getUsuario());
    if (status == null || status.tieneMora || status.limiteExcedido) {
    %>
        <jsp:forward page="Prestar.jsp">
            <jsp:param name="mora" value='<%= status.tieneMora %>' />
            <jsp:param name="activos" value='<%= status.limiteExcedido %>' />
        </jsp:forward>
    <%
    }
    boolean result = PrestamoDao.validate(obj);
    if (result) {
        out.println("Prestamo registrado");
    } else {
        out.println("No se pudo registrar el prestamo");   
    }
%>

<jsp:forward page="Consulta.jsp"/>
