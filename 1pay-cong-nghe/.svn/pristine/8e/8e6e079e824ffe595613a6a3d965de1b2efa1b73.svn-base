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
						<%request.setAttribute("billingInfo", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<form:form name="/protected/profile/edit" commandName="billing_info_edit" method="post">
						<div class="right_content">
							<h1 class="srv_title">Xác thực thông tin thanh toán</h1>
								<c:if test="${account!=null && account.verify_email=='true'}">
			                      		 <!-- Thông tin thanh toán -->
		                                 <div class="product_slc_filter filter_row">
											<fieldset class="billing_info_detail">
												<form:errors path="*" cssStyle="color:#f00; margin-left:210px;"/>
												<div style="padding: 2px;">
													<div class="product_title">     
					                                    <label class="label_popup_profile">Hình thức thanh toán:</label>
					                                    <form:select path="billing_type" cssClass="slc_gl" style="width: 356px">  
															<form:option value='wire_transfer' label='Thanh toán qua TK ngân hàng'/> 
															<form:option value='money_order' label='Thanh toán bằng tiền mặt'/>
														</form:select>
					                                </div> 
					                                <div class="product_title">     
					                                    <label class="label_popup_profile">Chủ tài khoản:</label>
														<form:input path="bank_account_holder" class="txt_reglog is_content" maxlength="50"/>
					                                </div> 
					                                <div class="product_title">     
					                                    <label class="label_popup_profile">Số tài khoản:</label>
														<form:input path="bank_account_number" class="txt_reglog is_content" maxlength="50"/>
					                                </div> 
					                                <div class="product_title">     
					                                    <label class="label_popup_profile">Tên ngân hàng:</label>
					                                    <form:input path="bank_name" cssClass="txt_reglog drop_menu_text_box" list="banks" placeholder="--- Chọn ngân hàng ---" maxlength="100" />
													</div> 
					                                <div class="product_title">     
					                                    <label class="label_popup_profile">Tại tỉnh/thành phố:</label>
					                                    <form:input path="bank_city" cssClass="txt_reglog drop_menu_text_box" list="provinces" placeholder="--- Chọn tỉnh/thành phố ---" maxlength="50" />
					                                </div> 
					                                <div class="product_title">     
					                                    <label class="label_popup_profile">Tên chi nhánh:</label>
														<form:input path="bank_branch" class="txt_reglog is_content" maxlength="50"/>
													</div> 
													<div class="product_title">
														<label class="label_popup_profile">&nbsp;</label>
					                                    <input value="Xác thực" class="btn_greensmall" type="submit"/>
														<a href="<%=request.getContextPath()%>/protected/billing_info.html" class="btn_graysmall">Huỷ</a>
													</div> 
												</div>
											</fieldset>
										</div>
										<datalist id="provinces">
								   		<c:forEach items='${provinces}' var='province'>  
						                    <option value='${province.name}' label='${province.name}' />  
						                </c:forEach>
						                </datalist>
						                <datalist id="banks">
								   		<c:forEach items='${banks}' var='bank'>  
						                    <option value='${bank.name}' label='${bank.name}' />  
						                </c:forEach>
						                </datalist>
		                                <!-- /Thông tin thanh toán -->
			                    </c:if>
								<c:if test="${account!=null && account.verify_email=='false'}">
									Bạn hãy 
									<a href="<%=request.getContextPath()%>/protected/verify_email.html" style="color:#2F84EA; text-decoration: underline;" target="_blank">xác thực email</a>
									trước khi thực hiện xác thực thông tin thanh toán. Xin cảm ơn!
								</c:if>
						</div>
						</form:form>
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
