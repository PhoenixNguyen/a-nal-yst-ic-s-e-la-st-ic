/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.56
 * Generated at: 2014-10-30 02:07:50 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layouts.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class include_005fgift_005fpopup_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<script>\n");
      out.write("    function checkGiftData() {\n");
      out.write("        $.ajax({\n");
      out.write("            type: \"POST\",\n");
      out.write("            url: '");
      out.print(request.getContextPath());
      out.write("/giftcode/ajax.html',\n");
      out.write("            data: 'uid=hahm',\n");
      out.write("            error: function (xhr, ajaxOptions, thrownError) {\n");
      out.write("            },\n");
      out.write("            success: function (data) {\n");
      out.write("            \tif (data != '') {\n");
      out.write("                    $('#gift_code_value').html(data);\n");
      out.write("                    $('#giftModal').reveal({\n");
      out.write("                    \tdismissmodalclass: 'modal_close'\n");
      out.write("                        });\n");
      out.write("                }\n");
      out.write("            }\n");
      out.write("        });\n");
      out.write("    }\n");
      out.write("    \n");
      out.write("    $(function () {\n");
      out.write("        setInterval(function () {\n");
      out.write("            return checkGiftData();\n");
      out.write("        }, 1000);\n");
      out.write("    })\n");
      out.write("</script>\n");
      out.write("<div id=\"giftModal\" class=\"reveal-modal\">\n");
      out.write("\t<div class=\"srv_row\">\n");
      out.write("\t\t<label class=\"lbl_moi\">Thông báo</label> Chúc mừng bạn đã được nhận một mã dự thưởng: <strong><span style=\"font-size: 24px;\" id=\"gift_code_value\"></span></strong>. \n");
      out.write("\t\t<br/>Bạn có cơ hội trúng thưởng trong chương trình quy số may mắn của 1Pay.\n");
      out.write("\t</div>\n");
      out.write("\t<div>\n");
      out.write("\t<img alt=\"\" src=\"");
      out.print(request.getContextPath());
      out.write("/images/samsung_galaxy_s3.jpg\" border=\"0\" width=\"500px\"/>\n");
      out.write("\t</div>\n");
      out.write("\t<div>\n");
      out.write("\t<input type=\"button\" name=\"cancel\" value=\"Đóng\" class=\"btn_greensmall modal_close\" />\n");
      out.write("\t</div>\n");
      out.write("</div>");
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
