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
					<div class="log_reg_container">
						<div class="log_reg_splash">
							<img src="images/create_acc.jpg" border="0" />
						</div>
						<div class="reg_form">
							<form:form name="registration" commandName="forgot_password" method="post">
								<div class="form_row">
									<div class="form_title">Tạo mật khẩu mới</div>
									<div class="or_label">
										( hoặc <a href="<%= request.getContextPath()%>/protected/profile.html" class="">Đăng nhập </a>)
									</div>
									<div class="clear"></div>
								</div>
								<div class="form_row">
									<form:password path="password" cssClass="txt_reglog" title="Mật khẩu mới" placeholder="Mật khẩu mới" onfocus="clear(this)" />
								</div>
								<div class="form_row">
									<form:password path="rpassword" cssClass="txt_reglog" title="Nhập lại mật khẩu mới" placeholder="Nhập lại mật khẩu mới" onfocus="clear(this)" />
								</div>
								<form:errors path="*" cssStyle="color:#f00;" />
								<div class="form_row">
									<input value="Tiếp tục" class="btn_createacc" type="submit" />
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