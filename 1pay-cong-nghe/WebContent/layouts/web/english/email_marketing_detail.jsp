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
	<script type="text/javascript">
		bkLib.onDomLoaded(function() { nicEditors.allTextAreas() });
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Chi tiết mail</h1>
							<form name="view_email_marketing" action="view-email-marketing.html">
								<input type="hidden" name ="id" value="${param.id }"/>
							<div class="srv_row">
								<table cellpadding="10" cellspacing="10" width="100%" border="0">
									<tr>
										<td width="100" valign="top">Người tạo:</td>
										<td><div id="secret_key" style="font-size: 14px;"><c:out escapeXml="false" value="${model.emailMarketing.owner }"/></div></td>
									</tr>
									<tr>
										<td width="100" valign="top">To:</td>
										<td>
											<c:forEach var="email" items="${model.emailMarketing.to}">
												<c:out value="${email}"/>, 
											</c:forEach>
										</td>
									</tr>
									<tr>
										<td width="100" valign="top">Tiêu đề:</td>
										<td>
											<input type="text" id="subject" name="subject" value="${model.emailMarketing.subject }" class="txt_filter" title="Tiêu đề" placeholder="Tiêu đề" onfocus="clear(this)" style="width:600px"/>
										</td>
									</tr>
									<tr>
										<td valign="top">Nội dung:</td>
										<td>
											<textarea name="body" id ="body" cols="10" rows="8" name="txtContent" style="width: 600px; height: 400px;" class="txtarea_contact" title="Nội dung" placeholder="Nội dung" onfocus="clear(this)" >
												<c:out escapeXml="false" value="${model.emailMarketing.body }"/>
											</textarea>
										</td>
									</tr>
									<tr>
										<td valign="top">Trạng thái:</td>
										<td>
											<div id="address" style="font-size: 14px;">
												<c:choose>
													<c:when test="${model.emailMarketing.status == 0}">
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ gửi" /> Chưa duyệt
													</c:when>
													<c:when test="${model.emailMarketing.status == 2}">
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã gửi" /> Đã duyệt
													</c:when>
													<c:when test="${model.emailMarketing.status == 1}">
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Từ chối" /> Reject
													</c:when>
													<c:otherwise></c:otherwise>
												</c:choose>
											</div>
										</td>
									</tr>
								</table>
							</div>
							<div class="srv_row">
								<c:if test="${model.emailMarketing.status == 0}">
									<input type="hidden" name="action" value="approve" />
									<input type="submit" name="approve" value="Duyệt" class="btn_greensmall" />
									<input type="submit" name="reject" value="Từ chối" class="btn_greensmall" />
									<script type="text/javascript">
									$(document).ready(function() {
										$('form[name=view_email_marketing] input[type=submit]').live('click', function() {
											$('form[name=view_email_marketing] input[name=action]').val($(this).attr('name'));
										});
									});
									</script>
								</c:if>
								<a href="<%=request.getContextPath() %>/protected/manage-email-marketing.html" class="btn_graysmall">Quay lại</a>
							</div>
							</form>
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
	<jsp:include page="include_actived_phone_popup.jsp" ></jsp:include>
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
