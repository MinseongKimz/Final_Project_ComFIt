/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2022-06-18 09:26:55 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.user.mypage;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class user_005fmypage_005finfo_jsp extends org.apache.jasper.runtime.HttpJspBase
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

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody;

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
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.release();
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

   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>내 정보 확인/수정</title>\r\n");
      out.write("<link rel=\"stylesheet\" type=\"text/css\" href=\"");
      out.print(cp);
      out.write("/css/main.css\">\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("\r\n");
      out.write("\t$(document).ready(function()\r\n");
      out.write("\t{\r\n");
      out.write("\t\t$(\"#btn-pw-modify\").click(function()\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tlocation.href=\"pawsswordmodifyform.action\";\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#btn-tel-modify\").click(function()\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tlocation.href=\"telmodifyform.action\";\r\n");
      out.write("\t\t})\r\n");
      out.write("\t\t\r\n");
      out.write("\t\t$(\"#btn-address-modify\").click(function()\r\n");
      out.write("\t\t{\r\n");
      out.write("\t\t\tlocation.href=\"addressmodifyform.action\";\r\n");
      out.write("\t\t})\r\n");
      out.write("\t})\r\n");
      out.write("\r\n");
      out.write("</script>\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("\r\n");
      out.write("   .subheader\r\n");
      out.write("   {\r\n");
      out.write("      font-size: 25pt;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("      margin-left: 15%;\r\n");
      out.write("      margin-top:5%;\r\n");
      out.write("   }\r\n");
      out.write("   .subheader_header\r\n");
      out.write("   {\r\n");
      out.write("      font-size: 20pt;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("      margin-left: 25%;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .tablebts\r\n");
      out.write("   {\r\n");
      out.write("      width:50%;\r\n");
      out.write("      margin-left: 25%;\r\n");
      out.write("      border-radius:5px;\r\n");
      out.write("      table-layout:fixed;\r\n");
      out.write("       font-weight: bold;\r\n");
      out.write("       background-color: #FFFFFF;\r\n");
      out.write("       outline: 1px solid #E0E6F8;\r\n");
      out.write("       \r\n");
      out.write("     }\r\n");
      out.write("     \r\n");
      out.write("     .hi\r\n");
      out.write("     {\r\n");
      out.write("        margin-left: 38%;\r\n");
      out.write("     }\r\n");
      out.write("     \r\n");
      out.write("     .title\r\n");
      out.write("   {\r\n");
      out.write("      font-family: 맑은 고딕;\r\n");
      out.write("      font-size: 30pt;\r\n");
      out.write("   }\r\n");
      out.write("   .list-group \r\n");
      out.write("   {\r\n");
      out.write("      width: 120px;\r\n");
      out.write("      text-align: center;\r\n");
      out.write("   }\r\n");
      out.write("   .list-group-item \r\n");
      out.write("   {\r\n");
      out.write("      text-align: center;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("   }\r\n");
      out.write("</style>\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("\r\n");
      out.write("<!--Sidebar-->\r\n");
      out.write("<div style=\"float:left; margin-left: 10px; margin-top: 20%; position: fixed;\">\r\n");
      out.write("\t");
      if (_jspx_meth_c_005fimport_005f0(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("\r\n");

	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != null)
	{	

      out.write("\r\n");
      out.write("\t\t<div class=\"header\">\r\n");
      out.write("\t\t\t");
      if (_jspx_meth_c_005fimport_005f1(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t\t</div>\r\n");
	}
	else
	{

      out.write("\r\n");
      out.write("\t<div>\r\n");
      out.write("   \t\t");
      if (_jspx_meth_c_005fimport_005f2(_jspx_page_context))
        return;
      out.write("\r\n");
      out.write("\t</div>\r\n");
	} 
      out.write("\t\r\n");
      out.write("\r\n");
      out.write("<div class=\"container\">\r\n");
      out.write("    <div class=\"title\" style=\"text-align: center; font-size: 28pt; font-weight: bold;\">\r\n");
      out.write("\t\t내 정보 확인/수정\r\n");
      out.write("\t<br>\r\n");
      out.write("\t</div>\r\n");
      out.write("      \r\n");
      out.write("\r\n");
      out.write("\t<table class=\"tablebts\"  style=\"colspan:2; margin-top:2%;\">\r\n");
      out.write("\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<th>\r\n");
      out.write("\t\t\t\t<a href=\"changeprofileform.action?u_id=");
      out.print(u_id);
      out.write("\">\r\n");
      out.write("\t\t\t\t<img alt=\"\" src=\"images/");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_profile }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("\"\r\n");
      out.write("\t\t\t\tstyle=\"object-fit:cover; height: 70%; width: 70%; margin-left:120%;\"></a>\r\n");
      out.write("\t\t\t</th>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>이메일</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_email }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>이름</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_name }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("\t\t\t<td>닉네임</td>\r\n");
      out.write("\t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_nickname }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>레벨</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${level }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>비밀번호</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_password }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-sm\"id=\"btn-pw-modify\" style=\"margin-left:45%;\">변경하기</button>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>휴대폰번호</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_tel }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-sm\"id=\"btn-tel-modify\" style=\"margin-left:45%;\">변경하기</button>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("\t\t</tr>\r\n");
      out.write("\t\t<tr>\r\n");
      out.write("  \t\t\t<td>주소</td>\r\n");
      out.write("  \t\t\t<td>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${userInfo.u_address }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("</td>\r\n");
      out.write("\t\t\t<td>\r\n");
      out.write("\t\t\t\t<button type=\"button\" class=\"btn btn-primary btn-sm\"id=\"btn-address-modify\" style=\"margin-left:45%;\">변경하기</button>\r\n");
      out.write("\t\t\t</td>\r\n");
      out.write("       </tr>\r\n");
      out.write("\t</table>\r\n");
      out.write("</div>\r\n");
      out.write("     \r\n");
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

  private boolean _jspx_meth_c_005fimport_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f0 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    boolean _jspx_th_c_005fimport_005f0_reused = false;
    try {
      _jspx_th_c_005fimport_005f0.setPageContext(_jspx_page_context);
      _jspx_th_c_005fimport_005f0.setParent(null);
      // /WEB-INF/view/user/mypage/user_mypage_info.jsp(92,1) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fimport_005f0.setUrl("/WEB-INF/view/user/main/user_sidebar.jsp");
      int[] _jspx_push_body_count_c_005fimport_005f0 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fimport_005f0 = _jspx_th_c_005fimport_005f0.doStartTag();
        if (_jspx_th_c_005fimport_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fimport_005f0[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fimport_005f0.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fimport_005f0.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f0);
      _jspx_th_c_005fimport_005f0_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fimport_005f0, _jsp_getInstanceManager(), _jspx_th_c_005fimport_005f0_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fimport_005f1(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f1 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    boolean _jspx_th_c_005fimport_005f1_reused = false;
    try {
      _jspx_th_c_005fimport_005f1.setPageContext(_jspx_page_context);
      _jspx_th_c_005fimport_005f1.setParent(null);
      // /WEB-INF/view/user/mypage/user_mypage_info.jsp(103,3) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fimport_005f1.setUrl("/WEB-INF/view/user/main/comfit_header_user.jsp");
      int[] _jspx_push_body_count_c_005fimport_005f1 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fimport_005f1 = _jspx_th_c_005fimport_005f1.doStartTag();
        if (_jspx_th_c_005fimport_005f1.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fimport_005f1[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fimport_005f1.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fimport_005f1.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f1);
      _jspx_th_c_005fimport_005f1_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fimport_005f1, _jsp_getInstanceManager(), _jspx_th_c_005fimport_005f1_reused);
    }
    return false;
  }

  private boolean _jspx_meth_c_005fimport_005f2(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    //  c:import
    org.apache.taglibs.standard.tag.rt.core.ImportTag _jspx_th_c_005fimport_005f2 = (org.apache.taglibs.standard.tag.rt.core.ImportTag) _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.get(org.apache.taglibs.standard.tag.rt.core.ImportTag.class);
    boolean _jspx_th_c_005fimport_005f2_reused = false;
    try {
      _jspx_th_c_005fimport_005f2.setPageContext(_jspx_page_context);
      _jspx_th_c_005fimport_005f2.setParent(null);
      // /WEB-INF/view/user/mypage/user_mypage_info.jsp(110,5) name = url type = null reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
      _jspx_th_c_005fimport_005f2.setUrl("/WEB-INF/view/user/main/comfit_header_nolog.jsp");
      int[] _jspx_push_body_count_c_005fimport_005f2 = new int[] { 0 };
      try {
        int _jspx_eval_c_005fimport_005f2 = _jspx_th_c_005fimport_005f2.doStartTag();
        if (_jspx_th_c_005fimport_005f2.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
          return true;
        }
      } catch (java.lang.Throwable _jspx_exception) {
        while (_jspx_push_body_count_c_005fimport_005f2[0]-- > 0)
          out = _jspx_page_context.popBody();
        _jspx_th_c_005fimport_005f2.doCatch(_jspx_exception);
      } finally {
        _jspx_th_c_005fimport_005f2.doFinally();
      }
      _005fjspx_005ftagPool_005fc_005fimport_0026_005furl_005fnobody.reuse(_jspx_th_c_005fimport_005f2);
      _jspx_th_c_005fimport_005f2_reused = true;
    } finally {
      org.apache.jasper.runtime.JspRuntimeLibrary.releaseTag(_jspx_th_c_005fimport_005f2, _jsp_getInstanceManager(), _jspx_th_c_005fimport_005f2_reused);
    }
    return false;
  }
}