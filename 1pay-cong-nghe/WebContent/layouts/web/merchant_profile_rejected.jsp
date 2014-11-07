<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui-1.9.2.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
</head>
<%Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED); %>
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
						<!-- Left Menu -->
						<%request.setAttribute("merchantProfileNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">Quản lý Merchant's Profile</h1>
								<div>
									<div id="dash_tab">
										<a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="tab"><span>Tất cả</span></a>
										<a href="<%=request.getContextPath() %>/protected/merchant_profile_approved.html" class="tab"><span>Đã kích hoạt</span></a>
										<a href="<%=request.getContextPath() %>/protected/merchant_profile_rejected.html" class="tab_slc"><span>Chưa kích hoạt</span></a>
										
										<a href="<%=request.getContextPath() %>/protected/create_merchant_profile.html" class="addcomparison_link"><span>Gán Merchant Profile</span></a>
										<div class="clear"></div>
									</div>
									<form id="list-sms-scenario" action="merchant_profile_rejected.html" method="post">
										<jsp:include page="include_box_filter_merchant_profile.jsp"></jsp:include>
									</form>
				                 	<c:if test="${model.total>0 }">
				                 		<div style="padding-left:5px; padding-top:10px;font-size: 14px;">Có <b>${model.total}</b> kết quả được tìm thấy</div>
				                 	</c:if>
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.isPreliminary}" id="isPreliminary"/>
										<input type="hidden" value="${model.isMerchant}" id="isMerchant"/>
										<input type="hidden" value="${model.isOffical}" id="isOffical"/>
										<input type="hidden" value="${model.isBilling}" id="isBilling"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<display:table name="model.list" id="list" 
														requestURI="merchant_profile_rejected.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
										    <display:column title="Loại HĐ" headerClass="transhead" class="transdata width70" property="contractType" style="border: 1px solid #CCC;;text-align:center;" />
										    <display:column title="Chu kỳ TT" headerClass="transhead " class="transdata width70" property="paymentPolicy" style="border: 1px solid #CCC;;text-align:center;" />
										    <display:column title="Charging" headerClass="transhead" class="transdata width50" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:forEach items="${list.chargingRates}" var="chargingRate">
										    		<c:if test="${chargingRate.key=='CARD'}">
										    				<c:set var="has_card" value="1" />
													</c:if>
										    		<c:if test="${chargingRate.key=='SMS'}">
										    				<c:set var="has_sms" value="1" />
										    		</c:if>
										    		<c:if test="${chargingRate.key=='WAP'}">
										    				<c:set var="has_wap" value="1" />
										    		</c:if>
										    	</c:forEach>
										    	
										    	<c:if test="${has_card==1}">
										    		<a title="Đã sử dụng dịch vụ CARD"><img src="../images/card_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_card==0}">
										    		<img src="../images/card_invi.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_sms==1}">
										    		<a title="Đã sử dụng dịch vụ SMS"><img src="../images/sms_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_sms==0}">
										    		<img src="../images/sms_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap==1}">
										    		<a title="Đã sử dụng dịch vụ WAP"><img src="../images/wap_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_wap==0}">
										    		<img src="../images/wap_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    </display:column>
										    <display:column title="Status" headerClass="transhead width50" class="transdata" style="border: 1px solid #CCC;;text-align:center;">
										    	<c:if test="${list.status==0}">
										    		<a title="Chưa kích hoạt hoặc đang tạm khóa"><img src="../images/merchant_profile_disable.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${list.status!=0}">
										    		<a title="Đang sử dụng"><img src="../images/merchant_profile_actived.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    </display:column>
										    <display:column title="Actions" headerClass="transhead width130" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="merchant_profile_detail.html?id=${list.merchant}" class="act_detail" title="Xem Merchant Profile" target="blank"></a>
										    	<c:if test="${list.status==1}">
										    		<a href="edit_merchant_profile.html?id=${list.merchant}" class="link_denghi" title="Sửa Merchant Profile"></a>
										    	</c:if>
										    	<div class="onoffswitch">
													<c:set value="${list.approved}" var="status" />
															<input type="checkbox" name="onoffswitch" value="${list.approved}" class="onoffswitch-checkbox" id="svr_${list.id}" ${status?'checked':'' } />
															<label class="onoffswitch-label" for="svr_${list.id}">
																<div class="onoffswitch-inner"></div>
																<div class="onoffswitch-switch"></div>
															</label>
												</div>
										    </display:column>	
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										<c:choose>
													<c:when test="${model.isStaff}">
														<script type="text/javascript">
															$(document).ready(function() {
																$('.onoffswitch-checkbox').live('click', function() {
																	var alertMess = 'Bạn muốn thay đổi trạng thái?';
																	var active = $(this).attr('value')+'';
																	if(active == 'false') {
																		alertMess = 'Bạn muốn kích hoạt Merchant Profile?';
																	} else if(active == 'true') {
																		alertMess = 'Bạn muốn hủy kích hoạt Merchant Profile?';
																	}
																	
																	if(confirm(alertMess)) {
																		var chkId = $(this).attr('id')+'';
																		//alert(chkId);
																		var pid = chkId.replace(/svr_/gi, '');
																		var url = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html?a=approve_merchant_profile&pid='+pid+'&active='+active;
																		//alert(pid);
																		//alert(url);
																		$('#product_active_change').load(url, function(responseTxt,statusTxt,xhr){
																			if(responseTxt == "1") {
																				$('#' + chkId).val(responseTxt);
																				if(active == 'false')$('#' + chkId).val(true);
																				if(active == 'true')$('#' + chkId).val(false);
																			}
																		});
																	} else {
																		return false;
																	}
																});
															});
														</script>
													</c:when>
												</c:choose>
									</div>
									<!-- /Danh sach gan tt -->
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
