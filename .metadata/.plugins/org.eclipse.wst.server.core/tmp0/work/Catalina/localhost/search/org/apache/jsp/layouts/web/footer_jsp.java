/*
 * Generated by the Jasper component of Apache Tomcat
 * Version: Apache Tomcat/7.0.56
 * Generated at: 2014-10-30 02:07:43 UTC
 * Note: The last modified time of this file was set to
 *       the last modified time of the source file after
 *       generation to assist with modification tracking.
 */
package org.apache.jsp.layouts.web;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;

public final class footer_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final javax.servlet.jsp.JspFactory _jspxFactory =
          javax.servlet.jsp.JspFactory.getDefaultFactory();

  private static java.util.Map<java.lang.String,java.lang.Long> _jspx_dependants;

  private org.apache.jasper.runtime.TagHandlerPool _005fjspx_005ftagPool_005fc_005fif_0026_005ftest;

  private javax.el.ExpressionFactory _el_expressionfactory;
  private org.apache.tomcat.InstanceManager _jsp_instancemanager;

  public java.util.Map<java.lang.String,java.lang.Long> getDependants() {
    return _jspx_dependants;
  }

  public void _jspInit() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest = org.apache.jasper.runtime.TagHandlerPool.getTagHandlerPool(getServletConfig());
    _el_expressionfactory = _jspxFactory.getJspApplicationContext(getServletConfig().getServletContext()).getExpressionFactory();
    _jsp_instancemanager = org.apache.jasper.runtime.InstanceManagerFactory.getInstanceManager(getServletConfig());
  }

  public void _jspDestroy() {
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.release();
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

      out.write("<!-- Web Foot -->\n");
      out.write("<div id=\"w_foot\">\n");
      out.write("\t<!-- Foot Menu -->\n");
      out.write("\t<div id=\"foot_menu\">\n");
      out.write("\t\t<div class=\"layout_1000\">\n");
      out.write("\t\t\t<div class=\"foot_col\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html\" class=\"footmenu_head\">Dịch vụ</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html?n=sms\" class=\"foot_link\">SMS Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html?n=card\" class=\"foot_link\">Card Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html?n=wap\" class=\"foot_link\">Wap Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html?n=iac\" class=\"foot_link\">SMSplus Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html?n=bank\" class=\"foot_link\">Bank Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html\" class=\"foot_link\">Direct Charging</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dich-vu.html\" class=\"foot_link\">Sub Charging</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"foot_col\">\n");
      out.write("\t\t\t\t");
      out.write("<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"http://dev.1pay.vn/\" class=\"footmenu_head\">Nhà phát triển</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"foot_col\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"footmenu_head\">Cộng đồng</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"http://forum.1pay.vn\" class=\"foot_link\">Diễn đàn</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"http://facebook.com/1pay.vn\" class=\"foot_link\">Facebook</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"foot_link\">Twitter</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"foot_link\">Google+</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"foot_col\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"#\" class=\"footmenu_head\">Giới thiệu</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/who-am-i.html\" class=\"foot_link\">1Pay là gì?</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/1pay-team.html\" class=\"foot_link\">Đội ngũ 1Pay </a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/news/category.html\" class=\"foot_link\">Tin tức</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/tuyen-dung.html\" class=\"foot_link\">Tuyển dụng</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"foot_col\">\n");
      out.write("\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t<li><a href=\"http://help.1pay.vn\" class=\"footmenu_head\">Hỗ trợ</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"http://help.1pay.vn\" class=\"foot_link\">Help Center</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/dieu-khoan.html\" class=\"foot_link\">Điều khoản sử dụng</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/chinh-sach-thanh-toan.html\" class=\"foot_link\">Chính sách thanh toán</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/ban-quyen.html\" class=\"foot_link\">Bản quyền</a></li>\n");
      out.write("\t\t\t\t\t<li><a href=\"");
      out.print(request.getContextPath() );
      out.write("/lien-he.html\" class=\"foot_link\">Liên hệ</a></li>\n");
      out.write("\t\t\t\t</ul>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"foot_mod\">\n");
      out.write("\t\t\t\t<div id=\"page-full-footer\">\n");
      out.write("\t\t\t\t\t<div id=\"locale-container\" class=\"ui-button\">\n");
      out.write("\t\t\t\t\t\t<span id=\"locale-link\" class=\"locale_link\"><a>Việt Nam</a></span>\n");
      out.write("\t\t\t\t\t\t<div id=\"locale-menu\"\n");
      out.write("\t\t\t\t\t\t\tclass=\"sub-nav chat-bubble-bottom locale-list\">\n");
      out.write("\t\t\t\t\t\t\t<ul>\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href =\"");
      out.print(request.getContextPath() );
      out.write("?ver=vi\" data-locale=\"vi\" class=\"locale-option\">Việt Nam</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t<li><a href =\"");
      out.print(request.getContextPath() );
      out.write("?ver=en\" data-locale=\"en\" class=\"locale-option\">English</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t<!-- \n");
      out.write("\t\t\t\t\t\t\t\t<li><a data-locale=\"ja\" class=\"locale-option\">日本語</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t<li><a data-locale=\"ko\" class=\"locale-option\">한국어</a></li>\n");
      out.write("\t\t\t\t\t\t\t\t -->\n");
      out.write("\t\t\t\t\t\t\t</ul>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"chat-bubble-arrow-border\"></div>\n");
      out.write("\t\t\t\t\t\t\t<div class=\"chat-bubble-arrow\"></div>\n");
      out.write("\t\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t</div>\n");
      out.write("\t\t\t\t\t<div class=\"clear\"></div>\n");
      out.write("\t\t\t\t</div>\n");
      out.write("\t\t\t\t<div class=\"clear\"></div>\n");
      out.write("\t\t\t\t<a class=\"secure_geotrust\">Bảo mật bởi</a>\n");
      out.write("\t\t\t</div>\n");
      out.write("\t\t\t<div class=\"clear\"></div>\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("\t<!-- / Foot Menu -->\n");
      out.write("\t<div id=\"foot_info\">\n");
      out.write("\t\t<div class=\"info_holder\">\n");
      out.write("\t\t\tCopyright © 2013 1Pay Co., Ltd. All rights reserved. Giấy phép MXH số 57/GXN-TTĐT.\n");
      out.write("\t\t</div>\n");
      out.write("\t</div>\n");
      out.write("</div>\n");
      out.write("<div class=\"fix-bar\">\n");
      out.write("\t<a href=\"mailto:info@1pay.vn\" style=\"color: #FFF\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/email.png\" style=\"vertical-align: bottom; margin-right: 5px;\" width=\"16px\"/><strong>Email:</strong> info@1pay.vn</a>  \n");
      out.write("\t<img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/phone.png\" style=\"vertical-align: bottom; margin-right: 5px;\" width=\"16px\"/><strong>Hotline:</strong> <a href=\"tel:84964222628\" style=\"color: #FFF\">(+84) 964222628</a> \n");
      out.write("\t<a href=\"skype:help.1pay?chat\" style=\"color: #FFF\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/skype.png\" style=\"vertical-align: bottom; margin-right: 5px;\" width=\"16px\"/><strong>Skype:</strong> Hỗ trợ 1</a>\n");
      out.write("\t<a href=\"ymsgr:sendim?help.1pay26&m=Chào+bạn\" style=\"color: #FFF\"><img src=\"");
      out.print(request.getContextPath() );
      out.write("/images/yahoo.png\" style=\"vertical-align: bottom; margin-right: 5px;\" width=\"16px\"/><strong>Yahoo:</strong> hỗ trợ 2</a>\n");
      out.write("</div>\n");
      out.write("<!-- / Web Foot -->\n");
      out.write("<!-- \n");
      if (_jspx_meth_c_005fif_005f0(_jspx_page_context))
        return;
      out.write("\n");
      out.write(" -->\n");
      out.write("<script>\n");
      out.write("  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){\n");
      out.write("  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),\n");
      out.write("  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)\n");
      out.write("  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');\n");
      out.write("\n");
      out.write("  ga('create', 'UA-42819651-1', '1pay.vn');\n");
      out.write("  ga('send', 'pageview');\n");
      out.write("\n");
      out.write("</script>");
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

  private boolean _jspx_meth_c_005fif_005f0(javax.servlet.jsp.PageContext _jspx_page_context)
          throws java.lang.Throwable {
    javax.servlet.jsp.PageContext pageContext = _jspx_page_context;
    javax.servlet.jsp.JspWriter out = _jspx_page_context.getOut();
    javax.servlet.http.HttpServletRequest request = (javax.servlet.http.HttpServletRequest)_jspx_page_context.getRequest();
    javax.servlet.http.HttpServletResponse response = (javax.servlet.http.HttpServletResponse)_jspx_page_context.getResponse();
    //  c:if
    org.apache.taglibs.standard.tag.rt.core.IfTag _jspx_th_c_005fif_005f0 = (org.apache.taglibs.standard.tag.rt.core.IfTag) _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.get(org.apache.taglibs.standard.tag.rt.core.IfTag.class);
    _jspx_th_c_005fif_005f0.setPageContext(_jspx_page_context);
    _jspx_th_c_005fif_005f0.setParent(null);
    // /layouts/web/footer.jsp(101,0) name = test type = boolean reqTime = true required = true fragment = false deferredValue = false expectedTypeName = null deferredMethod = false methodSignature = null
    _jspx_th_c_005fif_005f0.setTest(((java.lang.Boolean) org.apache.jasper.runtime.PageContextImpl.proprietaryEvaluate("${account_logined!=null || _const_cas_assertion_ != null }", java.lang.Boolean.class, (javax.servlet.jsp.PageContext)_jspx_page_context, null, false)).booleanValue());
    int _jspx_eval_c_005fif_005f0 = _jspx_th_c_005fif_005f0.doStartTag();
    if (_jspx_eval_c_005fif_005f0 != javax.servlet.jsp.tagext.Tag.SKIP_BODY) {
      do {
        org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "include_exp_popup.jsp", out, false);
        org.apache.jasper.runtime.JspRuntimeLibrary.include(request, response, "include_gift_popup.jsp", out, false);
        int evalDoAfterBody = _jspx_th_c_005fif_005f0.doAfterBody();
        if (evalDoAfterBody != javax.servlet.jsp.tagext.BodyTag.EVAL_BODY_AGAIN)
          break;
      } while (true);
    }
    if (_jspx_th_c_005fif_005f0.doEndTag() == javax.servlet.jsp.tagext.Tag.SKIP_PAGE) {
      _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
      return true;
    }
    _005fjspx_005ftagPool_005fc_005fif_0026_005ftest.reuse(_jspx_th_c_005fif_005f0);
    return false;
  }
}
