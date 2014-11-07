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
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
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
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Kích hoạt số điện thoại cá nhân.</h1>
							<div class="srv_row">
								<label class="lbl_moi">Bước 2:</label> Nhập số mã xác thực OTP.
							</div>
							<div>
								Để lấy thông tin mã xác thực OTP bạn vui lòng kiểm tra tại địa chỉ mail cá nhân hoặc tin nhắn SMS.
							</div>
							<div class="srv_row">
								<form name="activedOTP" action="<%=request.getContextPath() %>/protected/actived-otp.html" method="post">
									<input type="hidden" name ="action" value="otp"/>
									<div class="form_row">
										<input type="text"name="otp" class="txt_reglog" title="Mã xác thực OTP" placeholder="Mã xác thực OTP" onfocus="clear(this)" />
										<c:if test="${model.error!=null }">
										<span id="actived.errors" style="color:#f00;">
											* <c:out value="${model.error }"></c:out>
										</span>
									</c:if>
									</div>
									<input value="Tiếp tục" class="btn_greensmall" type="submit" />
									<input value="Huỷ" class="btn_graysmall" type="button" onclick="window.location.href='<%=request.getContextPath()%>/protected/profile.html'"/>
								</form>
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
