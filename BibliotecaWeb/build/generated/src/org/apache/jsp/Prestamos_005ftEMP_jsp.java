package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class Prestamos_005ftEMP_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/WEB-INF/AuthCheck.jspf");
  }

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

      out.write('\n');
      out.write('\n');

    if (session.getAttribute("session") != "TRUE") {
        session.setAttribute("session", "FALSE");
    
      out.write("\n");
      out.write("        ");
      if (true) {
        _jspx_page_context.forward("Login.jsp");
        return;
      }
      out.write("\n");
      out.write("    ");

    }

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html lang=\"es\">\n");
      out.write("<head>\n");
      out.write("    <title>Préstamos</title>\n");
      out.write("    <link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH\" crossorigin=\"anonymous\">\n");
      out.write("    <link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css\">\n");
      out.write("</head>\n");
      out.write("<body>\n");
      out.write("    <div class=\"container\">\n");
      out.write("        <h1>\n");
      out.write("            <button type=\"button\" class=\"btn btn-lg\" onclick=\"location.href='Menu.jsp'\">\n");
      out.write("                <i class=\"bi bi-arrow-left-square\"></i>\n");
      out.write("            </button>\n");
      out.write("            Gestionar Préstamos\n");
      out.write("        </h1>\n");
      out.write("        <div class=\"row\">\n");
      out.write("            <div class=\"col-md-12\">\n");
      out.write("                <div class=\"accordion\" id=\"accordionExample\">\n");
      out.write("                    <div class=\"accordion-item\">\n");
      out.write("                        <h2 class=\"accordion-header\" id=\"headingOne\">\n");
      out.write("                            <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseOne\" aria-expanded=\"true\" aria-controls=\"collapseOne\">\n");
      out.write("                                Registrar Préstamo\n");
      out.write("                            </button>\n");
      out.write("                        </h2>\n");
      out.write("                        <div id=\"collapseOne\" class=\"accordion-collapse collapse show\" aria-labelledby=\"headingOne\" data-bs-parent=\"#accordionExample\">\n");
      out.write("                            <div class=\"accordion-body\">\n");
      out.write("                                <form class=\"d-flex flex-column gap-3\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"libro\">Título del libro</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"libro\" placeholder=\"Título del libro\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"usuario\">Nombre de usuario</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"usuario\" placeholder=\"Nombre de usuario\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"fecha_prestamo\">Fecha de préstamo</label>\n");
      out.write("                                        <input type=\"date\" class=\"form-control\" id=\"fecha_prestamo\" placeholder=\"Fecha de préstamo\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\">Registrar préstamo</button>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"accordion-item\">\n");
      out.write("                        <h2 class=\"accordion-header\" id=\"headingTwo\">\n");
      out.write("                            <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseTwo\" aria-expanded=\"false\" aria-controls=\"collapseTwo\">\n");
      out.write("                                Consultar Préstamos\n");
      out.write("                            </button>\n");
      out.write("                        </h2>\n");
      out.write("                        <div id=\"collapseTwo\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingTwo\" data-bs-parent=\"#accordionExample\">\n");
      out.write("                            <div class=\"accordion-body\">\n");
      out.write("                                <form class=\"d-flex flex-column gap-3\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"usuario\">Nombre de usuario</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"usuario\" placeholder=\"Nombre de usuario\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\">Consultar préstamos</button>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"accordion-item\">\n");
      out.write("                        <h2 class=\"accordion-header\" id=\"headingThree\">\n");
      out.write("                            <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseThree\" aria-expanded=\"false\" aria-controls=\"collapseThree\">\n");
      out.write("                                Devolver Préstamo\n");
      out.write("                            </button>\n");
      out.write("                        </h2>\n");
      out.write("                        <div id=\"collapseThree\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingThree\" data-bs-parent=\"#accordionExample\">\n");
      out.write("                            <div class=\"accordion-body\">\n");
      out.write("                                <form class=\"d-flex flex-column gap-3\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"libro\">Título del libro</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"libro\" placeholder=\"Título del libro\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\">Devolver préstamo</button>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"accordion-item\">\n");
      out.write("                        <h2 class=\"accordion-header\" id=\"headingFour\">\n");
      out.write("                            <button class=\"accordion-button\" type=\"button\" data-bs-toggle=\"collapse\" data-bs-target=\"#collapseFour\" aria-expanded=\"false\" aria-controls=\"collapseFour\">\n");
      out.write("                                Consultar Mora\n");
      out.write("                            </button>\n");
      out.write("                        </h2>\n");
      out.write("                        <div id=\"collapseFour\" class=\"accordion-collapse collapse\" aria-labelledby=\"headingFour\" data-bs-parent=\"#accordionExample\">\n");
      out.write("                            <div class=\"accordion-body\">\n");
      out.write("                                <form class=\"d-flex flex-column gap-3\">\n");
      out.write("                                    <div class=\"form-group\">\n");
      out.write("                                        <label for=\"usuario\">Nombre de usuario</label>\n");
      out.write("                                        <input type=\"text\" class=\"form-control\" id=\"usuario\" placeholder=\"Nombre de usuario\">\n");
      out.write("                                    </div>\n");
      out.write("                                    <button type=\"submit\" class=\"btn btn-primary\">Consultar mora</button>\n");
      out.write("                                </form>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </div>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js\" integrity=\"sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r\" crossorigin=\"anonymous\"></script>\n");
      out.write("    <script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js\" integrity=\"sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy\" crossorigin=\"anonymous\"></script>\n");
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
