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
						
						<div class="right_content">
								<h1 class="srv_title">Cấu hình thanh toán</h1>
								<!-- Thông tin thanh toán -->
                                 <div class="product_slc_filter filter_row">
									<fieldset class="billing_info_detail">
										<legend>
											<strong>Thông tin thanh toán &nbsp; 
											<c:if test="${model.billingInformation!=null && model.billingInformation.verify=='true'}">
												<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/tick.png"/>
											</c:if>
											<c:if test="${model.billingInformation==null || model.billingInformation.verify=='false'}">
												<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/>
											</c:if>
											</strong>
										</legend>
										<div style="padding: 2px;">
											<div class="product_title">     
			                                    <label class="label_popup_profile">Hình thức thanh toán:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billing_type!=null && model.billing_type!=null}">
														${model.billing_type}
													</c:if>
													<c:if test="${model.billing_type==null||model.billing_type==null|| model.billing_type==''}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
			                                <div class="product_title">     
			                                    <label class="label_popup_profile">Chủ tài khoản:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billingInformation!=null && model.billingInformation.bank_account_holder!=null}">
														${model.billingInformation.bank_account_holder}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_account_holder==null|| model.billingInformation.bank_account_holder==''}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
			                                <div class="product_title">     
			                                    <label class="label_popup_profile">Số tài khoản:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billingInformation!=null && model.billingInformation.bank_account_number!=null}">
														${model.billingInformation.bank_account_number}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_account_number==null|| model.billingInformation.bank_account_number==''}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
			                                <div class="product_title">     
			                                    <label class="label_popup_profile">Tên ngân hàng:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billingInformation!=null && model.billingInformation.bank_name!=null}">
														${model.billingInformation.bank_name}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_name==null|| model.billingInformation.bank_name==''}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
			                                <div class="product_title">     
			                                    <label class="label_popup_profile">Tại tỉnh/thành phố:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billingInformation!=null && model.billingInformation.bank_city!=null}">
														${model.billingInformation.bank_city}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_city==null|| model.billingInformation.bank_city==''}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
			                                <div class="product_title">     
			                                    <label class="label_popup_profile">Tên chi nhánh:</label>
												<span class="go_sms_product_name">
													<c:if test="${model.billingInformation!=null && model.billingInformation.bank_branch!=null}">
														${model.billingInformation.bank_branch}
													</c:if>
													<c:if test="${model.billingInformation==null || model.billingInformation.bank_branch==null}">
														<i>chưa có</i>
													</c:if>
												</span>
			                                </div> 
										</div>
									</fieldset>
								</div>
                                <!-- /Thông tin thanh toán -->
                                
								<div style="margin-left:220px;">
									<!-- 
									<c:if test="${model.billingInformation==null || model.billingInformation.verify=='false'}">
			                      		<a href="<%=request.getContextPath()%>/protected/billing_info_edit.html" style="color:#2F84EA; text-decoration: underline;" target="_blank">Sửa thông tin thanh toán</a>
			                      	</c:if>
			                      	&nbsp;&nbsp;
			                      	 -->
			                      	<c:if test="${model.billingInformation!=null && model.billingInformation.verify=='false'}">
			                      		<a href="<%=request.getContextPath()%>/protected/billing_info_verify.html" style="color:#2F84EA; text-decoration: underline;" target="_blank">Xác thực thông tin thanh toán</a>
			                      	</c:if>
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
