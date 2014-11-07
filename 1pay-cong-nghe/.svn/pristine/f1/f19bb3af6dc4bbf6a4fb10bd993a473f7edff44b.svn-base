<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
	<jsp:include page="head.jsp"></jsp:include>
	</head>

	<body>
<!-- 1PAY WEB -->
<div id="wrapper"> 
      <!-- Web Top -->
      <div id="w_top">
    <div class="layout_1000"> 
        <!-- Header -->
		<%request.setAttribute("menuDichVu", true); %>
		<jsp:include page="header.jsp"></jsp:include>
		<!-- / Header -->
          
          <!-- Body -->
          <div id="w_body">
      		
      		<jsp:include page="include_sms_contract_info_header.jsp"></jsp:include>
      		
        <div class="hdr_02">
              <table id="steps">
            <tbody>
                  <tr>
                  <td><a class="link_xemhd_invi" title="Xem hợp đồng & điền thông tin"></a>
                      <h2>1. Xem hợp đồng mẫu</h2>
                      <p>Tải file PDF để xem qua mẫu hợp đồng</p></td>
                <td><a class="link_xacnhanhd_invi" title="Xem hợp đồng & điền thông tin"></a>
                      <h2>2. Xác nhận</h2>
                      <p>Hoàn thiện thông tin thực hiện hợp đồng</p></td>
                <td>
                <a class="link_kyhd_invi" title="Ký hợp đồng điện tử"></a>
                      <h2>3. Ký hợp đồng điện tử</h2>
                      <p>Chọn <strong>Ký hợp đồng</strong> để hợp thức hóa hợp đồng điện tử.</p></td>
                <td><a class="link_taihd_focus" href="<%=request.getContextPath() %>/protected/hop-dong.html" title="Tải xuống hợp đồng đã ký"></a>
                      <h2>4. Tải xuống hợp đồng đã ký</h2>
                      <p>Tải xuống, và lưu trữ lại hợp đồng đã ký kết</p></td>
              </tr>
                </tbody>
          </table>
          
            </div>
            
            <div class="hdr_03">
                <div class="hdr_data">
                    <div class="form_row">
                        	<div class="form_linktai_title">
                            	Hợp đồng hoàn thiện, chân thành cảm ơn bạn đã sử dụng dịch vụ của 1Pay!
                            </div>
                            
                        </div>
                        <div class="form_row">Bạn có thể tải bản hợp đồng đã ký về máy tính của bạn</div>
                        <div class="form_row">
                        	<div><a href="<%=request.getContextPath() %>/protected/wap_constract.html" class="link_taihopdong">Link tải đã được ký kết</a></div>
                        </div>
                        
                        <div class="form_row">
                        	<a href="<%=request.getContextPath() %>/dich-vu.html" class="btn_back">Quay lại trang dịch vụ</a>
                        </div>
                        
                </div>
            </div>
      </div>
          
          <!-- / Body --> 
        </div>
  </div>
      <!-- / Web Top --> 
      
      <!-- Web Foot -->
      <jsp:include page="footer.jsp"></jsp:include>
      <!-- / Web Foot --> 
    </div>
<!-- / 1PAY WEB --> 
<script type="text/javascript">
/*<![CDATA[*/
jQuery(function($) {

$(function(){
	$('#hot_productslides').slides({
		preload: true,
		preloadImage: 'images/loading.gif',
		play: 5000,
		pause: 2500,
		hoverPause: true
	});
});

});
/*]]>*/
</script> 
<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) --> 
<script type="text/javascript">qm_create(0,false,0,250,false,false,false,false,false);</script><!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->

</body>
</html>
