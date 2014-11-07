<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Merchant Profile</h1>
							<div class="srv_row">
							<table cellpadding="10" cellspacing="0" width="100%"
								class="api_access_tbl">
								<tr>
									<td>
										<table cellpadding="4" cellspacing="0" width="100%"
											border="0">
											<tr>
												<td colspan="2">
													<a href="#">
														<div class="ava_box">
															<img src="<%= request.getContextPath()%>/images/avatar.png" border="0" />
														</div>
														<div>
															<strong>${account_logined.username}</strong><br/>
															<span style="color:#2C8F39;"><strong>Level:</strong><span class="lbl_gray">${account_logined_level}</span>,&nbsp; <strong>Exp:</strong> <span class="lbl_gray">${account_logined_exp}</span></span>
														</div>
													</a>
												</td>
											</tr>
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Fullname:</td>
												<td><div id="secret_key" style="font-size: 14px;font-weight: bold;"><c:out value="${model.accInfo.fullName }"/></div></td>
											</tr>
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Email:</td>
												<td>
													<div id="secret_key" style="font-size: 14px;">
														<a href="mailto:${model.accInfo.email }" style="font-size: 14px;color: #2c8f39;"><c:out value="${model.accInfo.email }"/></a>
														<c:choose>
															<c:when test="${model.account.verify_email}">
																<img src="<%= request.getContextPath()%>/images/tick.png"/>
															</c:when>
															<c:otherwise>
																<img src="<%= request.getContextPath()%>/images/invalid.png"/>
																[<a href="<%=request.getContextPath()%>/protected/verify_email.html" class="link_feature" title="Validate email" style="color: #0066cc">Authorized</a>]
															</c:otherwise>	
														</c:choose>
													</div>
												</td>
											</tr>
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Phone number:</td>
												<td>
													<div id="secret_key" style="font-size: 14px;">
														<c:choose>
															<c:when test="${model.account.phone !=null && model.account.phone !='' && model.account.verify_phone}">
																${model.account.phone}
																<img src="<%= request.getContextPath()%>/images/tick.png"/>
															</c:when>
															<c:when test="${model.account.phone !=null && model.account.phone !='' && !model.account.verify_phone}">
																${model.account.phone}
																<img src="<%= request.getContextPath()%>/images/invalid.png"/>
																[<a href="<%=request.getContextPath()%>/protected/verify_phone.html" class="link_feature" title="Validate phone number" style="color: #0066cc">Authorized</a>]
															</c:when>
															<c:otherwise>
																<i>Unavailable</i>
																<a href="<%=request.getContextPath()%>/protected/profile/edit.html" id="actived_mobi" title="Activate phone number"><img src="<%= request.getContextPath()%>/images/invalid.png"/></a>
															</c:otherwise>	
														</c:choose>
													</div>
												</td>
											</tr>
											<!-- 
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Phone number:</td>
												<td>
													<div id="phone" style="font-size: 14px;">
														<c:out value="${model.accInfo.phone }"/>
														<c:choose>
															<c:when test="${onepay:validatePhoneNumber(account_logined.phone)}">
																<img src="<%= request.getContextPath()%>/images/tick.png"/>
															</c:when>
															<c:otherwise>
																<a href="#" id="actived_mobi" title="Activate phone number"><img src="<%= request.getContextPath()%>/images/invalid.png"/></a>
															</c:otherwise>	
														</c:choose>
													</div>
													<script type="text/javascript">
														$(document).ready(function() {
														     $('#actived_mobi').click(function(e) {
														          e.preventDefault();
														          $('#actived_phone_modal').reveal({
												                    	dismissmodalclass: 'modal_close'
												                        });
														     });
														});
													</script>
												</td>
											</tr>
											 -->
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Identification card:</td>
												<td>
													<div id="cmnd" style="font-size: 14px;">
														<c:choose>
															<c:when test="${model.accInfo.cmnd !=null && model.accInfo.cmnd !=''}">
																<c:out value="${model.accInfo.cmnd }"/>
															</c:when>
															<c:otherwise>
																<i>Unavailable</i>
															</c:otherwise>	
														</c:choose>
													</div>
												</td>
											</tr>
											<tr>
												<td style="width: 120px; padding-right: 10px; text-align: right; line-height: 20px;">Address:</td>
												<td>
													<div id="address" style="font-size: 14px;">
														<c:choose>
															<c:when test="${model.accInfo.address !=null && model.accInfo.address !=''}">
																<c:out value="${model.accInfo.address }"/>
															</c:when>
															<c:otherwise>
																<i>Unavailable</i>
															</c:otherwise>	
														</c:choose>
													</div>
												</td>
											</tr>
										</table></td>
									 <td width="200" class="feature_box">
									 	<a href="<%=request.getContextPath()%>/protected/profile/edit.html" class="link_feature">Edit profile</a>
									 	<a href="<%=request.getContextPath()%>/protected/billing_info.html" class="link_feature">Configure payment</a>
										<a href="<%=request.getContextPath()%>/protected/prepare-changing-password.html" class="link_feature">Change password</a>
										
										<a href="<%=request.getContextPath()%>/protected/merchant_profile_manager.html" class="link_feature">Profile infomation</a>
										<a href="<%=request.getContextPath()%>/protected/merchant_contract_detail.html?id=${model.merchantContract.id}" class="link_feature">Contract infomation</a>
			                        </td>
								</tr>
							</table>
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
