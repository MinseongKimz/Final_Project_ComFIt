/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/8.5.54
 * Generated at: 2022-06-16 05:21:49 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.WEB_002dINF.view.user.main;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class user_005fsearch_005fproduct_jsp extends org.apache.jasper.runtime.HttpJspBase
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

   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();

      out.write("\r\n");
      out.write("<!DOCTYPE html>\r\n");
      out.write("<html>\r\n");
      out.write("<head>\r\n");
      out.write("<meta charset=\"UTF-8\">\r\n");
      out.write("<title>user_search_product.jsp</title>\r\n");
      out.write("<!-- <link rel=\"stylesheet\" type=\"text/css\" href=\"css/user_search_product.css\"> -->\r\n");
      out.write("<style type=\"text/css\">\r\n");
      out.write("   \r\n");
      out.write("   .image{\r\n");
      out.write("      width: 100px;\r\n");
      out.write("      height: 100px;\r\n");
      out.write("   \r\n");
      out.write("   }\r\n");
      out.write("   .price{\r\n");
      out.write("      color: red;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("   }\r\n");
      out.write("   .caption{\r\n");
      out.write("      color: red;\r\n");
      out.write("      font-size: small;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("   }\r\n");
      out.write("   \r\n");
      out.write("   .title\r\n");
      out.write("   {\r\n");
      out.write("      font-size: 25pt;\r\n");
      out.write("      font-weight: bold;\r\n");
      out.write("      margin-top:10%;\r\n");
      out.write("   }\r\n");
      out.write("   .input_text\r\n");
      out.write("   {\r\n");
      out.write("      \r\n");
      out.write("      width: 200pt;\r\n");
      out.write("      font-size:15pt;\r\n");
      out.write("      height:30pt;\r\n");
      out.write("      border-radius:5px;\r\n");
      out.write("   }\r\n");
      out.write("   .btn1\r\n");
      out.write("   {\r\n");
      out.write("      text-align:center;\r\n");
      out.write("      border-radius:5px;\r\n");
      out.write("      width:100px;\r\n");
      out.write("      height:30pt;\r\n");
      out.write("   \r\n");
      out.write("   }\r\n");
      out.write("   .btn\r\n");
      out.write("   {\r\n");
      out.write("      text-align:center;\r\n");
      out.write("      border-radius:5px;\r\n");
      out.write("      width:120px;\r\n");
      out.write("      height:30pt;\r\n");
      out.write("   }\r\n");
      out.write("   .btn:hover,.btn1:hover\r\n");
      out.write("   {\r\n");
      out.write("      background:black;\r\n");
      out.write("      color:white;\r\n");
      out.write("   }\r\n");
      out.write("   .chucheon\r\n");
      out.write("   {\r\n");
      out.write("      margin-left:25%;\r\n");
      out.write("   }\r\n");
      out.write("   .describe\r\n");
      out.write("   {\r\n");
      out.write("      margin-left:25%;\r\n");
      out.write("      font-weight: bolder;\r\n");
      out.write("   }\r\n");
      out.write("   .imglink \r\n");
      out.write("   {\r\n");
      out.write("      text-decoration: none; \r\n");
      out.write("      color: black;\r\n");
      out.write("      outline: 0;\r\n");
      out.write("      border: 0;\r\n");
      out.write("      background-color: white;\r\n");
      out.write("      font-size: 14pt;\r\n");
      out.write("            \r\n");
      out.write("   }\r\n");
      out.write("</style>\r\n");
      out.write("\r\n");
      out.write("<script type=\"text/javascript\" src=\"http://code.jquery.com/jquery.min.js\"></script>\r\n");
      out.write("<script type=\"text/javascript\">\r\n");
      out.write("   $(function()\r\n");
      out.write("   {\r\n");
      out.write("      var pdname = \"\";\r\n");
      out.write("      \r\n");
      out.write("      $(\"#loadBtn\").click(function()\r\n");
      out.write("      {\r\n");
      out.write("         pdname = $(\"#name\").val();\r\n");
      out.write("         \r\n");
      out.write("         if(pdname == \"\")\r\n");
      out.write("         {\r\n");
      out.write("            alert(\"물품을 입력해주세요.\");\r\n");
      out.write("            \r\n");
      out.write("            return;            \r\n");
      out.write("         }\r\n");
      out.write("         \r\n");
      out.write("         $(\"form\").submit();\r\n");
      out.write("         \r\n");
      out.write("      })\r\n");
      out.write("      \r\n");
      out.write("      var result = '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${result }", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("';\r\n");
      out.write("      \r\n");
      out.write("      if(result != null)\r\n");
      out.write("      {\r\n");
      out.write("         pdname= '");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${pdname}", java.lang.String.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null));
      out.write("';\r\n");
      out.write("         \r\n");
      out.write("         var searchXml = $.parseXML(result);\r\n");
      out.write("         //alert(searchXml);\r\n");
      out.write("         var txt = \"\";\r\n");
      out.write("         var priceArr; \r\n");
      out.write("         var arr = []; \r\n");
      out.write("         var tprice = 0;  // 검색 결과 나온 물품들의 누적 합 \r\n");
      out.write("         \r\n");
      out.write("         $(searchXml).find('item').each(function(index) // 각 상품은 <item> 태그로 묶여있다.\r\n");
      out.write("         {\r\n");
      out.write("            var name = $(this).find('title').text(); // 타이틀 : 물건 이름\r\n");
      out.write("            var price = $(this).find('lprice').text();   // lprice : 각 항목의 최저가 → 최고가는 안나오는듯..?\r\n");
      out.write("            var image = $(this).find('image').text();   // image : 각 항목의 사진 \r\n");
      out.write("            var category3 = $(this).find('category3').text();\r\n");
      out.write("            if(category3==\"\")\r\n");
      out.write("            \tvar category3 = $(this).find('category2').text();\r\n");
      out.write("            \r\n");
      out.write("            var maker = $(this).find('maker').text();\r\n");
      out.write("            \r\n");
      out.write("            if(index!=0&&index%3==0)\r\n");
      out.write("               txt += \"<br>\";\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            if (maker!=\"\")\r\n");
      out.write("            {\r\n");
      out.write("               txt += \"<button class='imglink' value='\" + pdname + \"/\"+ category3 + \"/\"+ maker +\"'>\";\r\n");
      out.write("               txt += \"<img class='image' style='width: 200px; height:auto;' src='\" + image +\"' >\"+\"<p>\" + name + \"<br> 카테고리 : \"\r\n");
      out.write("                 +category3 +\"<br>제조사 : \"+ maker +\"</p></button>\";\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            \r\n");
      out.write("            arr[index] = Number(price);\r\n");
      out.write("            \r\n");
      out.write("         });   \r\n");
      out.write("         \r\n");
      out.write("            \r\n");
      out.write("            for (var i = 0; i < arr.length; i++)\r\n");
      out.write("               tprice += Number(arr[i]); // 누적 실행\r\n");
      out.write("            \r\n");
      out.write("            var avgPrice = (tprice/arr.length);    // 누적합 ÷ 물품갯수\r\n");
      out.write("            \r\n");
      out.write("            for (var i = 0; i < arr.length; i++)\r\n");
      out.write("            {\r\n");
      out.write("               if (arr[i] < (avgPrice * 1.1 ) && arr[i] > (avgPrice * 0.98)) // 물품중에 평균 가격 범위안에 들어왔다면\r\n");
      out.write("               {\r\n");
      out.write("                  arr.splice(i, 1);\r\n");
      out.write("                  i--;\r\n");
      out.write("               }\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("            var tprice2 = 0; // 거른 것들을 누적합 하기위해 만든 변수 \r\n");
      out.write("            \r\n");
      out.write("            //alert(arr.length)\r\n");
      out.write("            \r\n");
      out.write("            for(var i=0; i<arr.length; i++)\r\n");
      out.write("               tprice2 += arr[i]; \r\n");
      out.write("               \r\n");
      out.write("            \r\n");
      out.write("            //console.log(tprice2);\r\n");
      out.write("            var AvgPrice = parseInt((tprice2/arr.length) * 0.65);\r\n");
      out.write("            \r\n");
      out.write("            realAvgPrice = Math.floor(AvgPrice/1000) * 1000;\r\n");
      out.write("            \r\n");
      out.write("            //alert(avgPrice);\r\n");
      out.write("            //alert(realAvgPrice);\r\n");
      out.write("            \r\n");
      out.write("            if (arr.length==0)\r\n");
      out.write("            {\r\n");
      out.write("               $(\"#result\").html(\"<p>검색결과가 없습니다.</p>\");\r\n");
      out.write("            } \r\n");
      out.write("            \r\n");
      out.write("            else\r\n");
      out.write("            {\r\n");
      out.write("               var txt2 = \"<p class='price'>추천중고가격은 : \" + realAvgPrice + \" 입니다</p>\" \r\n");
      out.write("                + \"<p class='caption'>이 가격은 단지 참고용이며 절대적이지 않습니다.<br>제품명을 정확히 입력할수록 정확도가 올라갑니다.</p>\";\r\n");
      out.write("               $(\"#result\").html(txt2 + txt);\r\n");
      out.write("            }\r\n");
      out.write("            \r\n");
      out.write("      }   \r\n");
      out.write("      \r\n");
      out.write("      $(\"#clearBtn\").click(function()\r\n");
      out.write("      {\r\n");
      out.write("         $(\"#result\").empty();\r\n");
      out.write("      });   \r\n");
      out.write("      \r\n");
      out.write("      $(\".imglink\").click(function()\r\n");
      out.write("      {\r\n");
      out.write("         var value = $(this).val();\r\n");
      out.write("               \r\n");
      out.write("         var valArr = value.split('/');      \r\n");
      out.write("         \r\n");
      out.write("         var name = valArr[0];\r\n");
      out.write("         var category = valArr[1];\r\n");
      out.write("         var maker = valArr[2];\r\n");
      out.write("         \r\n");
      out.write("         location.href=\"returnsell.action?name=\" + name + \"&maker=\" + maker + \"&category=\" + category + \"&realAvgPrice=\" + realAvgPrice;\r\n");
      out.write("         \r\n");
      out.write("        /*  $.post(\"retunsell.action\", {\r\n");
      out.write("            name : name\r\n");
      out.write("           , category : category\r\n");
      out.write("           , maker : maker\r\n");
      out.write("           , cfPrice : realAvgPrice\r\n");
      out.write("         }, function(data)\r\n");
      out.write("         {\r\n");
      out.write("            //console.log(data);\r\n");
      out.write("            \r\n");
      out.write("         }) */\r\n");
      out.write("      })\r\n");
      out.write("   })   \r\n");
      out.write("   \r\n");
      out.write("</script>\r\n");
      out.write("\r\n");
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\r\n");
      out.write("<div style=\"text-align: center;\">\r\n");
      out.write("   <p class=\"title\">물품 검색</p>\r\n");
      out.write("</div>\r\n");
      out.write("\r\n");
      out.write("<div class=\"outer\" style=\"text-align: center;\">   \r\n");
      out.write("      <div>\r\n");
      out.write("         <form action=\"search.action\" method=\"post\" id=\"form\">\r\n");
      out.write("         <input type = \"text\" class=\"input_text\" name=\"name\" id=\"name\" placeholder=\"물품을 입력하세요\"/>\r\n");
      out.write("         <button class=\"btn1\" id=\"loadBtn\" style=\"background-color:#B2D7FC;\">검색하기</button>\r\n");
      out.write("         <button class=\"btn1\" type=\"reset\" id=\"clearBtn\">지우기</button>\r\n");
      out.write("         <button class=\"btn\">찾는 물건 없음</button>\r\n");
      out.write("         </form>\r\n");
      out.write("         \r\n");
      out.write("            <div id=\"result\" style=\"text-align: center; font-size: 23pt;\">\r\n");
      out.write("            </div>\r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("         \r\n");
      out.write("      </div>\r\n");
      out.write("      \r\n");
      out.write("   \r\n");
      out.write("</div>\r\n");
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
