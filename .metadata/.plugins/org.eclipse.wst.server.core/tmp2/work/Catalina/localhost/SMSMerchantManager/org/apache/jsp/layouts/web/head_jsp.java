/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.56
 * Generated at: 2014-11-04 09:04:58 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layouts.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class head_jsp extends org.apache.jasper.runtime.HttpJspBase
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

      out.write("<meta http-equiv=\"Content-Type\" content=\"text/html; charset=utf-8\" />\n");
      out.write("<meta name=\"apple-mobile-web-app-capable\" content=\"yes\" />\n");
      out.write("<meta name=\"apple-mobile-web-app-status-bar-style\" content=\"black\" />\n");
      out.write("<meta name=\"format-detection\" content=\"telephone=no\" />\n");
      out.write("<meta name=\"viewport\" content=\"width=device-width; initial-scale=1.0; maximum-scale=1.0; user-scalable=no;\" />\n");
      out.write("\n");
      out.write("<title>1Pay.vn - Kết nối nhanh, thanh toán linh hoạt | Ket noi nhanh, thanh toan linh hoat</title>\n");
      out.write("\n");
      out.write("<link rel=\"icon\" href=\"");
      out.print(request.getContextPath());
      out.write("/favicon.ico\" type=\"image/x-icon\">\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/daterangepicker.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/home_slider.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/1pay_style.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("<link href=\"");
      out.print(request.getContextPath());
      out.write("/css/reveal.css\" rel=\"stylesheet\" type=\"text/css\" />\n");
      out.write("\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/date.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/daterangepicker.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.slides.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/core_menu.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.leanModal.min.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.reveal.js\" type=\"text/javascript\"></script>\n");
      out.write("<script src=\"");
      out.print(request.getContextPath());
      out.write("/js/jquery.blockUI.js\" type=\"text/javascript\"></script>\n");
      out.write("\n");
      out.write("<!-- Add-On Core Code (Remove when not using any add-on's) -->\n");
      out.write("\n");
      out.write("<style type=\"text/css\">.qmfv{visibility:visible !important;}.qmfh{visibility:hidden !important;}</style>\n");
      out.write("\n");
      out.write("<script type=\"text/JavaScript\">var qmad = new Object();qmad.bvis=\"\";qmad.bhide=\"\";</script>\n");
      out.write("\n");
      out.write("<!-- Add-On Settings -->\n");
      out.write("<script type=\"text/JavaScript\">\n");
      out.write("\n");
      out.write("\t/*******  Menu 0 Add-On Settings *******/\n");
      out.write("\tvar a = qmad.qm0 = new Object();\n");
      out.write("\n");
      out.write("\t// IE Over Select Fix Add On\n");
      out.write("\ta.overselects_active = true;\n");
      out.write("\n");
      out.write("</script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\tvar Constants = { DO_NOT_ADD_A_TRAILING_COMMA: true};\n");
      out.write("    function global_report_exception (e, f, l, tb, force) {\n");
      out.write("        if (!window.reported_exception || force) {\n");
      out.write("            var stack_str = \"\";\n");
      out.write("            try {\n");
      out.write("                if (!tb) {\n");
      out.write("                    var stack = get_stack_rep();\n");
      out.write("                    stack.pop(); // remove global_report_exception\n");
      out.write("                    stack.pop(); // remove onerror handler\n");
      out.write("                    stack_str = stack.join(\"\\n\");\n");
      out.write("                }\n");
      out.write("            } catch (e) { }\n");
      out.write("            var log = function() {\n");
      out.write("                var parameters = {\n");
      out.write("                    'e': e,\n");
      out.write("                    'f': f || window.location.href,\n");
      out.write("                    'l': l,\n");
      out.write("                    'loc': window.location.href,\n");
      out.write("                    'ref': Constants.referrer,\n");
      out.write("                    'tb': tb || stack_str,\n");
      out.write("                    'trace': Trace && Trace.get()\n");
      out.write("                };\n");
      out.write("                new Ajax.DBRequest(\"/jse\", {\n");
      out.write("                    parameters: parameters,\n");
      out.write("                    noAutonotify: true,\n");
      out.write("                    no_watch: true\n");
      out.write("                });\n");
      out.write("            };\n");
      out.write("            if (typeof(Ajax) == 'undefined') {\n");
      out.write("                document.observe('script:loaded', log);\n");
      out.write("            } else {\n");
      out.write("                log();\n");
      out.write("            }\n");
      out.write("            window.reported_exception = e;\n");
      out.write("       }\n");
      out.write("    }\n");
      out.write("\n");
      out.write("    // this constant gets set to true at the bottom of dropbox.js\n");
      out.write("    window.LoadedJsSuccessfully = false;\n");
      out.write("    window.onerror = function (e, f, l) {\n");
      out.write("        global_report_exception(e, f, l);\n");
      out.write("    };\n");
      out.write("\n");
      out.write("    var old_onload = window.onload;\n");
      out.write("    window.onload = function() {\n");
      out.write("        if (!window.LoadedJsSuccessfully) {\n");
      out.write("            var url = encodeURIComponent(window.location.href);\n");
      out.write("            new Image().src = '/jse?e=failed+to+load+script&loc=' + url + '&f=' + url;\n");
      out.write("        }\n");
      out.write("        old_onload && old_onload();\n");
      out.write("    };\n");
      out.write("</script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\t$(document).ready(function() {\n");
      out.write("\t\t$('.filter_label').live('click', function() {\n");
      out.write("\t\t\tvar lbClass = $(this).attr('class') + '';\n");
      out.write("\t\t\tif(lbClass.indexOf('box_locketqua_hide')>0) {\n");
      out.write("\t\t\t\tlbClass = lbClass.replace(/ close/gi,' open');\n");
      out.write("\t\t\t\t$(this).attr('class', lbClass.replace(/ box_locketqua_hide/gi,''));\n");
      out.write("\t\t\t\t$('.box_locketqua').fadeIn(300);\n");
      out.write("\t\t\t} else {\n");
      out.write("\t\t\t\tlbClass = lbClass.replace(/ open/gi,' close');\n");
      out.write("\t\t\t\t$(this).attr('class', lbClass + ' box_locketqua_hide');\n");
      out.write("\t\t\t\t$('.box_locketqua').fadeOut(300);\n");
      out.write("\t\t\t}\n");
      out.write("\t\t});\n");
      out.write("\t});\n");
      out.write("</script>\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("\t$(function() {\n");
      out.write("  \t\t\t$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: \".modal_close\" });\t\t\n");
      out.write("\t});\n");
      out.write("</script>\n");
      out.write("\n");
      out.write("<!--Start of Zopim Live Chat Script-->\n");
      out.write("<script type=\"text/javascript\">\n");
      out.write("window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=\n");
      out.write("d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.\n");
      out.write("_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');\n");
      out.write("$.src='//v2.zopim.com/?1Px2VMF7I6b2Sl4YNzp1R0AuCPcTQ54r';z.t=+new Date;$.\n");
      out.write("type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');\n");
      out.write("</script>\n");
      out.write("<!--End of Zopim Live Chat Script-->\n");
      out.write("\n");
      out.write("<script type=\"text/javascript\"\n");
      out.write("\tsrc=\"");
      out.print(request.getContextPath() );
      out.write("/js/jquery.qtip-1.0.0-rc3.js\"\n");
      out.write("\tlanguage=\"javascript\"></script>");
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