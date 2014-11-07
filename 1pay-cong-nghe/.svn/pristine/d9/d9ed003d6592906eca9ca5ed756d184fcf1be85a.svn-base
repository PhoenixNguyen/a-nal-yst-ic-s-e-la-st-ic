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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.alphanumeric.pack.js"></script>
<script type="text/javascript">
	$(document).ready(function() {
			$('.is_email').alphanumeric({allow:"@."});
	});
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
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Email confirmation</h1>
							
							<c:if test="${model.notification==null && model.verify_email==false}">
								<div class="srv_row">
									<label class="lbl_moi">Step 1:</label> Enter your email.
								</div>
							</c:if>
							<div>
								<c:choose>
									<c:when test="${model.notification!=null  && model.verify_email==false}">
										<!-- Thông báo khi đã gửi mail xác thực -->
										<div class="form_row">
											<span id="actived.errors" style="color:#666666;">
												<c:out value="${model.notification }"></c:out>
											</span>
										</div>
									</c:when>
									<c:when test="${model.verify_email==true}">
										<!-- Đã xác thực email -->
										<div style="width:670px">
					                    	<div class="product_title">
					                        	<label class="label_popup_profile">Email:</label>
					                        	<span class="go_sms_product_name">${model.email}</span>
					                        	<img src="/1pay/images/tick.png" alt="Email verified"/>
					                        </div>
					                    </div>
									</c:when>
									<c:otherwise>
										<form name="activedPhone" action="<%=request.getContextPath() %>/protected/verify_email.html" method="post">
											<input type="hidden" name ="action" value="email"/>
											<div class="form_row">
												<c:choose>
													<c:when test="${model.email!=null }">
														<input type="text"name="phone" class="txt_reglog is_email" title="E-mail address" value="${model.email }" placeholder="E-mail address" onfocus="clear(this)" maxlength="50"/>
													</c:when>
													<c:otherwise>
														<input type="text"name="phone" class="txt_reglog is_email" title="E-mail address" placeholder="E-mail address" onfocus="clear(this)" maxlength="50"/>
													</c:otherwise>
												</c:choose>
												
												<c:if test="${model.error!=null }">
													<span id="actived.errors" style="color:#f00;">
														* <c:out value="${model.error }"></c:out>
													</span>
												</c:if>
											</div>
												<input value="Continue" class="btn_greensmall" type="submit" />
												<input value="Cancel" class="btn_graysmall" type="button" onclick="window.location.href='<%=request.getContextPath()%>/protected/profile.html'"/>
										</form>
									</c:otherwise>
								</c:choose>
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
