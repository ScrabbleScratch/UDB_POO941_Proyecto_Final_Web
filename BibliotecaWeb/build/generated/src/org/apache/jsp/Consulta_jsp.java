package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Consulta_jsp extends org.apache.jasper.runtime.HttpJspBase
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
      out.write("<html>\n");
      out.write("<head>\n");
      out.write("    <title>Consultar Items</title>\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>\n");
      out.write("            <a href=\"#\" class=\"btn btn-default btn-sm\">\n");
      out.write("                <span class=\"glyphicon glyphicon-chevron-left\"></span>\n");
      out.write("            </a>\n");
      out.write("            Consultar Items\n");
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
      out.write("                <h2>Libros</h2>\n");
      out.write("                <table class=\"table table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Título</th>\n");
      out.write("                            <th>Autor</th>\n");
      out.write("                            <th>Editorial</th>\n");
      out.write("                            <th>Año</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!-- data will be displayed here -->\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"obras\">\n");
      out.write("                <h2>Obras</h2>\n");
      out.write("                <table class=\"table table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Título</th>\n");
      out.write("                            <th>Autor</th>\n");
      out.write("                            <th>Género</th>\n");
      out.write("                            <th>Año</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!-- data will be displayed here -->\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"revistas\">\n");
      out.write("                <h2>Revistas</h2>\n");
      out.write("                <table class=\"table table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Título</th>\n");
      out.write("                            <th>Editor</th>\n");
      out.write("                            <th>Volumen</th>\n");
      out.write("                            <th>Año</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!-- data will be displayed here -->\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"cd\">\n");
      out.write("                <h2>CD</h2>\n");
      out.write("                <table class=\"table table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Título</th>\n");
      out.write("                            <th>Artista</th>\n");
      out.write("                            <th>Género</th>\n");
      out.write("                            <th>Año</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!-- data will be displayed here -->\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"tab-pane\" id=\"tesis\">\n");
      out.write("                <h2>Tesis</h2>\n");
      out.write("                <table class=\"table table-striped\">\n");
      out.write("                    <thead>\n");
      out.write("                        <tr>\n");
      out.write("                            <th>Título</th>\n");
      out.write("                            <th>Autor</th>\n");
      out.write("                            <th>Universidad</th>\n");
      out.write("                            <th>Año</th>\n");
      out.write("                        </tr>\n");
      out.write("                    </thead>\n");
      out.write("                    <tbody>\n");
      out.write("                        <!-- data will be displayed here -->\n");
      out.write("                    </tbody>\n");
      out.write("                </table>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js\"></script>\n");
      out.write("    <script src=\"https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js\"></script>\n");
      out.write("</body>\n");
      out.write("</html>");
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
