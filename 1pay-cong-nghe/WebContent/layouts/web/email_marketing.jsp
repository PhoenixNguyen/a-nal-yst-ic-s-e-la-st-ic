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
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery.datetimepicker.css" />

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.datetimepicker.js"></script>

<script type="text/javascript">
	bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
</script>
<script type="text/javascript">
$(function(){
	$("#merchants").multiselect({
		selectedList: 10,
		noneSelectedText: "Chọn danh sách Merchants",
		classes: "multiSelectBox"
	});
	$("#merchants").multiselect("uncheckAll");
	$( "#send_time" ).datetimepicker({
			format: 'd/m/Y H:i',
			lang: 'vi',
			minDate:0,
	});
});
</script>
<style>
	.close {position:absolute;top:1px;right:1px;padding:3px 6px;display: block;border-radius: 10px;width: 10px;background-color: #2c8f39;color: #fff;}
</style>
</head>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("emailMarketingMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Email Marketing.</h1>
							<div class="dash_row">
								<form:form name="email-marketing" commandName="emailMarketing" method="post" enctype="multipart/form-data" onsubmit="return confirm('Bạn có chắc muốn gửi nội dung này không?');">
									<div><form:errors path="*" cssStyle="color:#f00;" /></div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		Danh sách Merchants / Email:<br/>
										<%-- <form:input path="merchants" id="merchants" class="txt_filter" title="Email" placeholder="Email" onfocus="clear(this)" style="width:600px"/> --%>
										<form:select path="merchants" id="merchants" items="${merchants}" cssStyle="width:776px;" />
										<input type="file" name="bytes" id="bytes" class="txt_filter" style="height: 30px;" />&nbsp;
									</div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		Chọn email template:<br/>
										<form:select path="template" id="template" items="${emailTemplates}" cssStyle="width:634px;height:28px;" />
										<a class="btn_merchant_profile_preview template_preview" rel="leanModal" href="#template_preview" style="float:none;display: inline-block;margin-left: 10px;">Xem trước</a> 
										<div id="template_preview" class="_pop" style="height:540px;width:600px;">
											<a href="javascript:;" title="Đóng" class="modal_close close">X</a>
											<iframe src="" style="border:none; width:100%; height:100%;"></iframe>
										</div>
										<script type="text/javascript">
											$(document).ready(function() {
												$('.template_preview').live('click', function() {
													var template_name = $('select[name=template]').val();
													$('#template_preview iframe').attr('src', '${pageContext.request.contextPath}/download/email-marketing/' + template_name);
												});
											});
										</script>
									</div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		Tiêu đề:<br/>
										<form:input path="subject" id="subject" class="txt_filter" title="Tiêu đề" placeholder="Tiêu đề" onfocus="clear(this)" style="width:98%"/>
									</div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		Nội dung:<br/>
										<form:textarea path ="content" id ="content" cols="10" rows="8" name="txtContent" style="width: 99%; height: 400px;" class="txtarea_contact" title="Nội dung" placeholder="Nội dung" onfocus="clear(this)" />
									</div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		File đính kèm:<br/>
										<input type="file" name="attach_files" id="attach_files" class="txt_filter" title="File đính kèm" multiple />
									</div>
									<div class="input-prepend" style="padding-top: 5px;">
				                		Thời gian gửi:<br/>
										<form:input path="send_time" id="send_time" class="txt_filter" title="Thời gian gửi" />
									</div>
									<div class="input-prepend">
										<br/>
										<a class="btn_merchant_profile_preview mail_preview" rel="leanModal" href="#mail_preview" style="display: inline-block;margin-right: 10px; width: 120px;">
											Xem trước Email
										</a>
										<input value="Gửi Email" class="btn_greensmall" type="submit" style="display: inline-block;" />
										<a href="<%=request.getContextPath() %>/protected/manage-email-marketing.html" class="btn_graysmall">Quay lại</a>
										<div id="mail_preview" class="_pop" style="height:640px;width:600px;">
											<a href="javascript:;" title="Đóng" class="modal_close close">X</a>
											<iframe id="mail_iframe" src="" style="border:none; width:100%; height:100%;"></iframe>
										</div>
										<script type="text/javascript">
											$(document).ready(function() {
												$('.mail_preview').live('click', function() {
													var template_name = $('select[name=template]').val();
													$('#mail_preview iframe').attr('src', '${pageContext.request.contextPath}/download/email-marketing/'+template_name);
													$('#mail_preview iframe').on('load', function() {
														var body = $(this).contents().find('body');
														var html = $(body).html() + '';
														var content = nicEditors.findEditor('content').getContent();
														var merchant = 'bạn';
														$(body).html(html
																		.replace('\$\{content\}', content)
																		.replace('\$\{merchant\}', merchant)
																		.replace('\$\{1pay_skype\}', '<a href="skype:help.1pay?chat">help.1pay</a>')
																		.replace('\$\{1pay_yahoo\}', '<a href="ymsgr:sendim?help.1pay">help.1pay</a>')
																		);
													});
												});
											});
										</script>
									</div>
								</form:form>
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

</body>
</html>
