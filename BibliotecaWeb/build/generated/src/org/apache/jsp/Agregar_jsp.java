package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Agregar_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("    <title>Agregar Items</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>\n");
      out.write("            <a href=\"#\" class=\"btn btn-default btn-sm\">\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-left\"></span>\n");
      out.write("            </a>\n");
      out.write("            Agregar Items\n");
      out.write("        </h1>\n");
      out.write("        <ul class=\"nav nav-tabs\" id=\"myTab\">\n");
      out.write("            <li class=\"active\"><a href=\"#libros\" data-toggle=\"tab\">Libros</a></li>\n");
      out.write("            <li><a href=\"#obras\" data-toggle=\"tab\">Obras</a></li>\n");
      out.write("            <li><a href=\"#revistas\" data-toggle=\"tab\">Revistas</a></li>\n");
      out.write("            <li><a href=\"#cd\" data-toggle=\"tab\">CD</a></li>\n");
      out.write("            <li><a href=\"#tesis\" data-toggle=\"tab\">Tesis</a></li>\n");
      out.write("        </ul>\n");
      out.write("        <div class=\"tab-content\">\n");
      out.write("            <div class=\"tab-pane active\" id=\"libros\">\n");
      out.write("                <form>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"titulo\">Título:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"titulo\" name=\"titulo\" placeholder=\"Enter título\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"autor\">Autor:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"autor\" name=\"autor\" placeholder=\"Enter autor\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"editorial\">Editorial:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"editorial\" name=\"editorial\" placeholder=\"Enter editorial\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"anio\">Año:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"anio\" name=\"anio\" placeholder=\"Enter año\">\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Agregar Libro</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"obras\">\n");
      out.write("                <form>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"titulo\">Título:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"titulo\" name=\"titulo\" placeholder=\"Enter título\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"autor\">Autor:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"autor\" name=\"autor\" placeholder=\"Enter autor\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"genero\">Género:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"genero\" name=\"genero\" placeholder=\"Enter género\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"anio\">Año:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"anio\" name=\"anio\" placeholder=\"Enter año\">\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Agregar Obra</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"revistas\">\n");
      out.write("                <form>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"titulo\">Título:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"titulo\" name=\"titulo\" placeholder=\"Enter título\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"editor\">Editor:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"editor\" name=\"editor\" placeholder=\"Enter editor\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"volumen\">Volumen:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"volumen\" name=\"volumen\" placeholder=\"Enter volumen\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"anio\">Año:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"anio\" name=\"anio\" placeholder=\"Enter año\">\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Agregar Revista</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"cd\">\n");
      out.write("                <form>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"titulo\">Título:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"titulo\" name=\"titulo\" placeholder=\"Enter título\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"artista\">Artista:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"artista\" name=\"artista\" placeholder=\"Enter artista\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"anio\">Año:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"anio\" name=\"anio\" placeholder=\"Enter año\">\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Agregar CD</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"tesis\">\n");
      out.write("                <form>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"titulo\">Título:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"titulo\" name=\"titulo\" placeholder=\"Enter título\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"autor\">Autor:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"autor\" name=\"autor\" placeholder=\"Enter autor\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"universidad\">Universidad:</label>\n");
      out.write("                        <input type=\"text\" class=\"form-control\" id=\"universidad\" name=\"universidad\" placeholder=\"Enter universidad\">\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"form-group\">\n");
      out.write("                        <label for=\"anio\">Año:</label>\n");
      out.write("                        <input type=\"number\" class=\"form-control\" id=\"anio\" name=\"anio\" placeholder=\"Enter año\">\n");
      out.write("                    </div>\n");
      out.write("                    <button type=\"submit\" class=\"btn btn-primary\">Agregar Tesis</button>\n");
      out.write("                </form>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>\n");
      out.write("           \n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
