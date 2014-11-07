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
				<%request.setAttribute("menuHoTro", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="include_hotro_menu.jsp" />
						
						<div class="right_content">
							<div class="subpage_content">
								<h1>Dành cho nhà phát triển</h1>
								<p>The Core API allows you to build the power of Dropbox
									directly into your app. The Core API provides methods to read and
									write from Dropbox securely, so your users can bring all their
									important files with them to your app. Any changes they make will
									be saved back to all their computers, tablets and mobile phones.
									You'll also have access to unique and powerful features such as
									simple sharing, search, and restoring files to past revisions.</p>
								<h2>Why 1pay?</h2>
								<p>The Core API is the most robust way to read and write files
									across Windows, Mac, Linux, iPhone, iPad, BlackBerry, and Android
									devices. By using the API, not only will you make your app more
									powerful and easy to use, but you'll be broadening your audience to
									the hundreds of millions of people who are already using Dropbox.
									We've provided native development kits for the most popular mobile
									and web platforms to make integrating simple, and a REST API so you
									can be sure that your app will work with Dropbox no matter what
									you're developing for in the future.</p>
								<h2>1Pay gì khác với các cổng thanh toán khác.</h2>
								<p>
									Keep going to create your first Core API app as well as find
									tutorials for iOS, Android, Python, and Ruby. For questions about
									how Dropbox would work with your app, feel free to <a
										href="https://www.dropbox.com/developers/core#"
										onclick="Apps.developer_support(); return false;">contact us</a>.
								</p>
								<br />
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
