/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.56
 * Generated at: 2014-11-03 07:29:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layouts.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
  }

  public void _jspService(final javax.servlet.http.HttpServletRequest request, final javax.servlet.http.HttpServletResponse response)
        throws java.io.IOException, javax.servlet.ServletException {

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

      out.write("<!DOCTYPE html PUBLIC \"-//W3C//DTD XHTML 1.0 Transitional//EN\" \"http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd\">\r\n");
      out.write("<html xmlns=\"http://www.w3.org/1999/xhtml\">\r\n");
      out.write("<head>\r\n");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "head.jsp", out, false);
      out.write("</head>\r\n");
      out.write("<body>\r\n");
      out.write("\t<!-- 1PAY WEB -->\r\n");
      out.write("\t<div id=\"wrapper\">\r\n");
      out.write("\t\t<!-- Web Top -->\r\n");
      out.write("\t\t<div id=\"w_top\">\r\n");
      out.write("\t\t\t<div class=\"layout_1000\">\r\n");
      out.write("\t\t\t\t<!-- Header -->\r\n");
      out.write("\t\t\t\t");
request.setAttribute("menuTrangChu", true); 
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "header.jsp", out, false);
      out.write("<!-- / Header -->\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t<!-- Body -->\r\n");
      out.write("\t\t\t\t<div id=\"w_body\">\r\n");
      out.write("\t\t\t\t\t<div class=\"r_01\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col_01\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"mod_vieclammoi\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<div id=\"hot_productslides\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<div class=\"slides_container\">\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<iframe width=\"500\" height=\"375\" src=\"//www.youtube.com/embed/LcZ0zVNsfF4\" frameborder=\"0\" allowfullscreen></iframe>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\"> <img src=\"images/slide_img_01.jpg\" border=\"0\" /></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\"> <img src=\"images/slide_img_02.jpg\" border=\"0\" /></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t<div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t\t<a href=\"#\"> <img src=\"images/slide_img_03.jpg\" border=\"0\" /></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t\t\t<a href=\"#\" class=\"prev\"></a> <a href=\"#\" class=\"next\"></a>\r\n");
      out.write("\t\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col_02\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"mod_dangkysrv\">\r\n");
      out.write("\t\t\t\t\t\t\t\t<h1>Kết nối nhanh, thanh toán linh hoạt</h1>\r\n");
      out.write("\t\t\t\t\t\t\t\t<a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html\" class=\"btn_khamphasrv\">Khám phá ngay</a>  hoặc <a href=\"");
      out.print( request.getContextPath() );
      out.write("/dang-ky.html\">Đăng ký tài khoản</a> | <a href=\"");
      out.print( request.getContextPath() );
      out.write("/password_recovery.html\">Lấy lại mật khẩu</a>\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\r\n");
      out.write("\t\t\t\t\t<div class=\"r_02\">\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col_3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_title\">Đơn kết nối</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_des\">Một kết nối duy nhất, đơn giản nhất cho mọi dịch vụ thanh toán.</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col_3\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_title\">Đa dịch vụ, đủ an toàn</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_des\">\r\n");
      out.write("\t\t\t\t\t\t\t\tHỗ trợ mọi phương thức thanh toán, cho\r\n");
      out.write("\t\t\t\t\t\t\t\tmọi nền tảng thiết bị, ứng dụng, với công nghệ bảo mật và an\r\n");
      out.write("\t\t\t\t\t\t\t\ttoàn nhất.\r\n");
      out.write("\t\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t\t<div class=\"col_4\">\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_title\">Hoàn toàn minh bạch và uy tín</div>\r\n");
      out.write("\t\t\t\t\t\t\t<div class=\"ad_des\">Công cụ thống kê chi tiết minh bạch nhất với uy tín cao nhất.</div>\r\n");
      out.write("\t\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t</div>\r\n");
      out.write("\t\t\t\t<!-- / Body -->\r\n");
      out.write("\t\t\t</div>\r\n");
      out.write("\t\t</div>\r\n");
      out.write("\t\t<!-- / Web Top -->\r\n");
      out.write("\r\n");
      out.write("\t\t<!-- Web Foot -->\r\n");
      out.write("\t\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "footer.jsp", out, false);
      out.write("<!-- / Web Foot -->\r\n");
      out.write("\t</div>\r\n");
      out.write("\t<!-- / 1PAY WEB -->\r\n");
      out.write("\t");
      org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "include_java_script_footer.jsp", out, false);
      out.write("</body>\r\n");
      out.write("</html>\r\n");
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
