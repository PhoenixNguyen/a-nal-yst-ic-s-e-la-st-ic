<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<% 
	String info = (String)request.getAttribute("info");
    if (info==null) info="";        			
%>
<script type="text/javascript" charset="utf-8">
	$(document).ready(function() {
		$('.xemkichban').live('click', function() {
			var time = $("#time").val();
			var price = $("#price").val();
			$(".time_update").html(time);
			$(".price_update").html(price);
			$("#xemkichban").html($("#hd_xemkichban").html());
		});
	});
    $(function(){
         $('#btnSubmit').click(function() {
        	 showBlockWaitUI();
        	 $('#fm1').submit();
 		});
     });
 	function showBlockWaitUI() {
		 $.blockUI({ 
	        	message: '<h4> Hệ thống đang UPLOAD file...</h4>',
	        	css: { 
	            border: 'none',
	            left: ($(window).width() - 200) /2 + 'px',width:'200px',				            
	            padding: '15px', 
	            backgroundColor: '#000', 
	            '-webkit-border-radius': '10px', 
	            '-moz-border-radius': '10px', 
	            opacity: .5, 
	            color: '#fff' 
	        } }); 
	}
 	
 	/*<![CDATA[*/
 	jQuery(function($) {
 			$('input[name="upload_type"]').change(function() {
 				if ($(this).val() == 'link') {
 					$('.uploadLink').show();
 					$('.uploadFile').hide();
 				} else {
 					$('.uploadLink').hide();
 					$('.uploadFile').show();
 				}
 			});
 	});
 	/*]]>*/
</script>
</head>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="embedded_charging_header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<%request.setAttribute("embedNavMenu", true); %>
						<jsp:include page="embedded_charging_left_menu.jsp" />
						<!-- Left Menu -->		
						
						<div class="right_content">
							<h1 class="srv_title">Gắn thanh toán</h1>
							<div>
								<!--<form id="cardSandBox" action="card-sand-box.html" method="post">-->
									<div id="dash_tab">
										<a id="apps" href="<%=request.getContextPath() %>/protected/list-embed-app.html" class="tab"><span>Ứng dụng của bạn</span></a>
										<a id="cont" href="<%=request.getContextPath() %>/protected/embed-app.html" class="tab_slc"><span>Gắn thanh toán</span></a> 
										<div class="clear"></div>
									</div>
									<div class="srv_row">Bằng việc sử dụng tool này bạn có thể tự động gắn việc phân phối game thu tiền HOT vào bất kỳ một ứng dụng miễn phí nào.</div>
									<span class="red"><%=info%></span>
                    				<div class="srv_row"><strong>Dung lượng của bạn 0.00 - 500MB(max) </strong></div>
									<div class="srv_row">
									<form:form  enctype="multipart/form-data" method="post" id="fm1" commandName="attachPaymentFile" cssClass="fm-v clearfix" htmlEscape="true">
		       	    					<table cellpadding="5" cellspacing="0">
										<tbody>
										
											<tr>
												<td class="profile_label" width="200">
													Giá sản phẩm</td>
												<td>
			                                        <form:select path="price" items="${prices}" class="slc_gl" style="text-align:right"/>
			                                    </td>
											</tr>
											<tr>
												<td class="profile_label">
													Thời gian dùng thử
												</td>
												<td>
													<form:input path="time"  class="txt_reglog"/>
													/ giây (5 giây là nhỏ nhất)</td>
											</tr>
			                                <tr>
												<td class="profile_label" width="140">
													Số lần thanh toán</td>
												<td>
			                                        <form:select path="pay_number" items="${pay_number}" class="slc_gl"/>
			                                    </td>
											</tr>
											<tr>
												<td class="profile_label">
													Thời gian giữa các lần thanh toán
												</td>
												<td>
													<form:input path="pay_time_day" class="txt_reglog"/> / ngày
												</td>
											</tr>
											<!-- 
			                                <tr>
												<td class="profile_label">
													Dùng thử trong
												</td>
												<td>
													<form:input path="trial_day" class="txt_reglog"/> / ngày
												</td>
											</tr>
											 -->
			                                <!-- 
			                                <tr>
												<td class="profile_label">
													Cho phép tiếp tục dùng thử
												</td>
												<td height="32">
													<form:checkbox path="trial"/> <em>(nếu không kích hoạt thanh toán)</em>
												</td>
											</tr>
			                                 -->
			                                <!-- 
			                                <tr>
												<td class="profile_label">
													Dùng thử trong
												<strong>0</strong> ngày</td>
												<td>
													<input type="checkbox" value="0">
												</td>
											</tr>
			                                 -->
			                                 <tr>
												<td class="profile_label">
													Tên
												</td>
												<td>
													<form:input path="name" class="txt_reglog"/>
												</td>
											</tr>
			                                <tr>
												<td class="profile_label">
													Icon
												</td>
												<td>
			                                    	<input type="file" name="file_icon" class="btn_browse"/>
												</td>
											</tr>
			                                <tr>
												<td class="profile_label" height="32">
													Loại
												</td>
												<td>
													<form:radiobutton path="upload_type" name="upload[type]" value="file" />File
													<form:radiobutton path="upload_type" name="upload[type]" value="link" />Link
												</td>
											</tr>
											
											<tr class="uploadFile">
												<td class="profile_label">
													File Java
												</td>
												<td>
			                                    	<input type="file" name="file_java" class="btn_browse"/>
			                                    	<div style="padding-top: 5px;">
			                                    		<em>Chấp nhận file java (.jar) Kích cỡ nhỏ nhất <b>1KB</b>, lớn nhất <b>50MB</b>.</em>
			                                    	</div>
												</td>
											</tr>
											<tr class="uploadFile">
												<td class="profile_label">
													File Android
												</td>
												<td>
			                                    	<input type="file" name="file_android" class="btn_browse"/>
			                                    	<div style="padding-top: 5px;">
			                                    		<em>Chấp nhận file android (.apk) Kích cỡ nhỏ nhất <b>1KB</b>, lớn nhất <b>50MB</b>.</em>
			                                    	</div>
												</td>
											</tr>
			                                <tr class="uploadLink" style="display: none;">
												<td class="profile_label">
													Link Java trực tiếp:
												</td>
												<td>
													<form:input path="link_java" class="txt_reglog"/>
												</td>
											</tr>
											<tr class="uploadLink" style="display: none;">
												<td class="profile_label">
													Link Android trực tiếp:
												</td>
												<td>
													<form:input path="link_android" class="txt_reglog"/>
												</td>
											</tr>
								   		</tbody>
								   		</table>
								   		<form:errors path="*" cssStyle="color:#f00;" />
								   		<div id="hd_xemkichban" style="display:none;">
									   		<div class="alert-kichban alert-i-kichban">
												Khi mở ứng dụng sau <b><span class="time_update"></span></b> giây, ứng dụng sẽ yêu cầu kích hoạt với giá <b><span class="price_update"></span></b>đ (Nếu tài khoản không đủ tiền, ứng dụng tự động giảm trừ xuống giá trị thấp hơn).
												Nếu khách hàng không đồng ý kích hoạt ứng dụng sẽ hỏi lại sau <b><span class="time_update"></span></b> giây.
											</div>
										</div>
										<div id="xemkichban"></div>
			                            <div class="filter_row">
											<input class="btn_greensmall xemkichban" type="button" value="Xem kịch bản" accesskey="l"/>
											<input class="btn_greensmall" type="submit" id="btnSubmit" name="submit" value="Gắn thanh toán" accesskey="l"/>
										</div>
										</form:form>
	                           		</div>
									<!-- <div id="filter_locketqua"></div> -->
								<!--</form>-->
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
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->

</body>
</html>
