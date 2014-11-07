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
						<%request.setAttribute("helpCenter", true); %>							
						<jsp:include page="include_hotro_menu.jsp" />
						
						<div class="right_content">
							<div class="subpage_content">
								<h1>Help Center</h1>
								<h3>Tìm kiếm trợ giúp</h3>
								<table>
									<tbody>
										<tr>
											<td>
												<div class="sick-input" id="anonymous_element_3">
													<input type="text" id="search-input" name="search_string"
														value="Nhập từ khóa cần tìm" tabindex="5" class="txt_search" />
												</div>
											</td>
											<td><input type="submit" id="submit-button" value="Tìm kiếm"
												class="btn_send" /></td>
										</tr>
									</tbody>
								</table>
				
								<div>
									<div class="help_col">
										<h3>Top câu hỏi</h3>
										<ol id="faq">
											<li><a href="#">How do I link to a file or folder?</a></li>
											<li><a href="#">How do I add or upload files to my
													Dropbox?</a></li>
											<li><a href="#">How do I sync files between computers?</a></li>
											<li><a href="#">How secure is Dropbox?</a></li>
											<li><a href="#">Can I share files with non-Dropbox
													users?</a></li>
											<li><a href="#">How much space does my Dropbox have?</a></li>
											<li><a href="#">How do I share a file or folder with
													others?</a></li>
											<li><a href="#">Is there any way to get more space?</a></li>
											<li><a href="#">How do I recover old versions of files?
											</a></li>
											<li><a href="#">Can I access Dropbox on my mobile
													device?</a></li>
										</ol>
									</div>
									<div class="help_col">
										<h3>Thể loại</h3>
										<ul>
											<li><img src="images/User.png" border="0" align="left" /><a
												href="#">Thông tin tài khoản</a></li>
											<li><img src="images/money.png" border="0" align="left" /><a
												href="#">Thanh toán &amp; hóa đơn</a></li>
											<li><img src="images/video.png" border="0" align="left" /><a
												href="#">Video hướng dẫn</a></li>
											<li><img src="images/security-high.png" border="0"
												align="left" /><a href="#">Bảo mật &amp; chính sách</a></li>
										</ul>
									</div>
									<div class="clear"></div>
									<h3>Nguồn khác</h3>
									<div>
										<div class="help_col">
											<table width="100%">
												<tr>
													<td width="64"><a href="#"><img
															src="images/forum_64.png" border="0" /></a></td>
													<td
														style="padding-left: 20px; vertical-align: top; padding-right: 20px;">
														<a href="#" class="link_othersource">Diễn đàn</a>
														<div class="othersource_des">Converse with the Dropbox
															team and other Dropbox users</div>
													</td>
												</tr>
											</table>
										</div>
										<div class="help_col">
											<table width="100%">
												<tr>
													<td width="64"><a href="#"><img
															src="images/26-Mail.png" border="0" /></a></td>
													<td
														style="padding-left: 20px; vertical-align: top; padding-right: 20px;">
														<a href="#" class="link_othersource">Liên hệ</a>
														<div class="othersource_des">Converse with the Dropbox
															team and other Dropbox users</div>
													</td>
												</tr>
											</table>
										</div>
									</div>
								</div>
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