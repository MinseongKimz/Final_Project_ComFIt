/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2022-06-06 06:21:14 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class user_005flogin_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent,
                 org.apache.jasper.runtime.JspSourceImports {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.HashMap<java.lang.String,java.lang.Long>(3);
    _jspx_dependants.put("jar:file:/C:/Final_Project_ComFIt/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/comfit/WEB-INF/lib/standard.jar!/META-INF/fmt.tld", Long.valueOf(1098678690000L));
    _jspx_dependants.put("/WEB-INF/lib/standard.jar", Long.valueOf(1654491837648L));
    _jspx_dependants.put("jar:file:/C:/Final_Project_ComFIt/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/comfit/WEB-INF/lib/standard.jar!/META-INF/c.tld", Long.valueOf(1098678690000L));
  }

  private static final java.util.Set<java.lang.String> _jspx_imports_packages;

  private static final java.util.Set<java.lang.String> _jspx_imports_classes;

  static {
    _jspx_imports_packages = new java.util.HashSet<>();
    _jspx_imports_packages.add("javax.servlet");
    _jspx_imports_packages.add("javax.servlet.http");
    _jspx_imports_packages.add("javax.servlet.jsp");
    _jspx_imports_classes = null;
  }

  private volatile javax.el.ExpressionFactory _el_expressionfactory;
  private volatile org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public java.util.Set<java.lang.String> getPackageImports() {
    return _jspx_imports_packages;
  }

  public java.util.Set<java.lang.String> getClassImports() {
    return _jspx_imports_classes;
  }

  public javax.el.ExpressionFactory _jsp_getExpressionFactory() {
    if (_el_expressionfactory == null) {
      synchronized (this) {
        if (_el_expressionfactory == null) {
          _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
        }
      }
    }
    return _el_expressionfactory;
  }

  public org.apache.tomcat.InstanceManager _jsp_getInstanceManager() {
    if (_jsp_instancemanager == null) {
      synchronized (this) {
        if (_jsp_instancemanager == null) {
          _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
        }
      }
    }
    return _jsp_instancemanager;
  }

  public void _jspInit() {
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
      throws java.io.IOException, javax.servlet.ServletException {

    final java.lang.String _jspx_method = request.getMethod();
    if (!"GET".equals(_jspx_method) && !"POST".equals(_jspx_method) && !"HEAD".equals(_jspx_method) && !javax.servlet.DispatcherType.ERROR.equals(request.getDispatcherType())) {
      response.sendError(HttpServletResponse.SC_METHOD_NOT_ALLOWED, "JSPs only permit GET, POST or HEAD. Jasper also permits OPTIONS");
      return;
    }

    final javax.servlet.jsp.PageContext pageContext;
    javax.servlet.http.HttpSession session = null;
    final javax.servlet.ServletContext application;
    final javax.servlet.ServletConfig config;
    javax.servlet.jsp.JspWriter out = null;
    final java.lang.Object page = this;
    javax.servlet.jsp.JspWriter _jspx_out = null;
    javax.servlet.jsp.PageContext _jspx_page_context = null;


    try {
      response.setContentType("text/html; charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;

      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>user_login.jsp</title>\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("<link href=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css\" rel=\"stylesheet\" integrity=\"sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3\" crossorigin=\"anonymous\">\r\n");
      out.write("<script src=\"https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js\" integrity=\"sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p\" crossorigin=\"anonymous\"></script>\r\n");
      out.write("<link rel=\"stylesheet\" href=\"https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css\">\r\n");
      out.write("\r\n");
      out.write("<style>\r\n");
      out.write("      .bd-placeholder-img {\r\n");
      out.write("        font-size: 1.125rem;\r\n");
      out.write("        text-anchor: middle;\r\n");
      out.write("        -webkit-user-select: none;\r\n");
      out.write("        -moz-user-select: none;\r\n");
      out.write("        user-select: none;\r\n");
      out.write("      }\r\n");
      out.write("      @media (min-width: 768px) {\r\n");
      out.write("        .bd-placeholder-img-lg {\r\n");
      out.write("          font-size: 3.5rem;\r\n");
      out.write("        }\r\n");
      out.write("      }\r\n");
      out.write("      .input-group\r\n");
      out.write("      {\r\n");
      out.write("      \twidth: 50%;\r\n");
      out.write("      \tmargin-left: 14px;\r\n");
      out.write("      \t\r\n");
      out.write("      }\r\n");
      out.write("      #sellBtn\r\n");
      out.write("      {\r\n");
      out.write("      \twidth: 200px;\r\n");
      out.write("      }\r\n");
      out.write("      #dropdown-item\r\n");
      out.write("      {\r\n");
      out.write("      \twidth: 200px;\r\n");
      out.write("      }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<link href=\"headers.css\" rel=\"stylesheet\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"/js/bootstrap.js\"></script>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\t*\r\n");
      out.write("\t{\r\n");
      out.write("\t\tfont-family: 맑은 고딕;\r\n");
      out.write("\t}\r\n");
      out.write("\t.content\r\n");
      out.write("\t{\r\n");
      out.write("\t\tmargin-top: 3%;\r\n");
      out.write("\t\tmargin-left: 40%;\r\n");
      out.write("\t\tmargin-right: 30%;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.txtbox\r\n");
      out.write("\t{\r\n");
      out.write("\t\twidth: 350px;\r\n");
      out.write("\t}\r\n");
      out.write("\t.category\r\n");
      out.write("\t{\r\n");
      out.write("\t\tpadding-top: 3%;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.pd_list\r\n");
      out.write("\t{\r\n");
      out.write("\t\tpadding-top: 3%;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.title\r\n");
      out.write("\t{\r\n");
      out.write("\t\tmargin-left: 42%;\r\n");
      out.write("\t\tmargin-top: 10%;\r\n");
      out.write("\t\tfont-size: 30pt;\r\n");
      out.write("\t}\r\n");
      out.write("\t\r\n");
      out.write("\t.main\r\n");
      out.write("\t{\r\n");
      out.write("\t\tmargin-top: 3%; \r\n");
      out.write("\t}\r\n");
      out.write("\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\t<!-- Header 영역 -->\r\n");
      out.write("\t");
      out.write("\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- title -->\r\n");
      out.write("<div class=\"title\">\r\n");
      out.write("\t<img src=\"images/logo.png\" alt=\"\" style=\"width: 300px; height: auto;\"/>\r\n");
      out.write("\t\t\t<!-- Content 영역 -->\r\n");
      out.write("</div>\r\n");
      out.write("\t\r\n");
      out.write("<div class=\"content\">\r\n");
      out.write("\t<input type=\"text\" class=\"txtbox\" placeholder=\"이메일을 입력하세요\"/>\r\n");
      out.write("\t \r\n");
      out.write("\t<br /><br />\r\n");
      out.write("\t<input type=\"text\" class=\"txtbox\" placeholder=\"비밀번호를 입력하세요\"/>\r\n");
      out.write("\t<br /><br />\r\n");
      out.write("\t<input type=\"text\" class=\"errMsg\" placeholder=\"아이디 혹은 비밀번호가 틀렸습니다. 다시 로그인해주세요.\" style=\"color:red; display: none;\"/>\r\n");
      out.write("\t\r\n");
      out.write("\t\t<!-- reCAPCHA -->\r\n");
      out.write("\t\t<div style=\"display: none;\">\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t\r\n");
      out.write("\t<button type=\"button\" class=\"btn btn-primary\" style=\"width: 350px;\" >로그인</button>\r\n");
      out.write("\t<br /><br />\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<button type=\"button\" class=\"btn btn-primary\" style=\"width: 150px;\" >회원가입</button>\r\n");
      out.write("\t&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\r\n");
      out.write("\t<button type=\"button\" class=\"btn btn-primary\" style=\"width: 150px;\">ID/PW 찾기</button>\r\n");
      out.write("</div>\t\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t<!-- content  -->\r\n");
      out.write("\t\r\n");
      out.write("\t\r\n");
      out.write("\t<!-- Footer 영역 -->\r\n");
      out.write("<!-- \t<div class=\"footer\">\r\n");
      out.write("\t</div> -->\r\n");
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("</body>\r\n");
      out.write("</html>");
    } catch (java.lang.Throwable t) {
      if (!(t instanceof javax.servlet.jsp.SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          try {
            if (response.isCommitted()) {
              out.flush();
            } else {
              out.clearBuffer();
            }
          } catch (java.io.IOException e) {}
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}