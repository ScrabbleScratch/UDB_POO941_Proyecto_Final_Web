<%-- 
    Document   : PrestarProcess
    Created on : Jun 5, 2024, 11:25:00 PM
    Author     : Mario O.
--%>

<%@include file="WEB-INF/AuthCheck.jspf"%>

<%@page import="usuario.StatusUsuario, dao.PrestamoDao"%>
<jsp:useBean id="obj" class="bean.PrestamoBean"/>

<jsp:setProperty property="*" name="obj"/>

<%
    StatusUsuario status = StatusUsuario.usuarioStatus(obj.getUsuario());
    if (status == null) {
    %>
        <jsp:forward page="Prestar.jsp">
            <jsp:param name="prsErr" value="El usuario indicado no existe" />
        </jsp:forward>
    <%
    } else if (status.tieneMora || status.limiteExcedido) {
    %>
        <jsp:forward page="Prestar.jsp">
            <jsp:param name="prsErr" value='<%= status.limiteExcedido ? "El usuario no puede prestar mas ítems" : "" %>' />
            <jsp:param name="moraErr" value='<%= status.tieneMora ? "El usuario tiene mora pendiente" : "" %>' />
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
