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
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<c:choose>
								<c:when test="${param.accept!=null}">
									<div class="srv_row">
										Thông tin xác nhận và hướng dẫn đổi mật khẩu đã được gửi đến hòm thư email của bạn, vui lòng kiểm tra hộp thư.
									</div>
								</c:when>
								<c:otherwise>
									<h1 class="srv_title">Đổi mật khẩu</h1>
									<div class="srv_row">
						            	<div class="form_row">Bạn có thực sự muốn thay đổi mật khẩu?</div>
						                <div class="form_row">	
						                 	<input value="Xác nhận" class="btn_greensmall" type="button" onclick="location.href='<%=request.getContextPath() %>/protected/prepare-changing-password.html?accept=yes'"/>
						                 	<input value="Bỏ qua" class="btn_graysmall" type="button" onclick="location.href='<%=request.getContextPath() %>/protected/profile.html'"/>
						                 </div>
						            </div>						
								</c:otherwise>
							</c:choose>
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