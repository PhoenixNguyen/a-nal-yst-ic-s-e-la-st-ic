
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
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
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">
								Quản lý Provider's Profile
							</h1>
								<div>
									
				                 	<c:if test="${model.total>0 }">
				                 		<div style="padding-left:5px; padding-top:10px;font-size: 14px;">Có <b>${model.total}</b> kết quả được tìm thấy</div>
				                 	</c:if>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.isSupportProfile}" id="isSupportProfile"/>
										<input type="hidden" value="${model.isReviewProfileInfo}" id="isReviewProfileInfo"/>
										<input type="hidden" value="${model.isPromoteRate}" id="isPromoteRate"/>
										<input type="hidden" value="${model.isReviewProfileRate}" id="isReviewProfileRate"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<display:table name="model.list" id="list" 
														requestURI="merchant_profile_manager.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="#" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    
										    <display:column title="Provider" headerClass="transhead" class="transdata" property="providerCode" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Provider Name" headerClass="transhead" class="transdata" property="providerName" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Contract Type" headerClass="transhead" class="transdata" property="contractType" style="border: 1px solid #CCC;" />
										    
										    
										    <display:column title="Payment Policy" headerClass="transhead" class="transdata" property="paymentPolicy" style="border: 1px solid #CCC;" />
										
											<display:column title="Charging" headerClass="transhead" class="transdata width90" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:set var="has_iac" value="0" />
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
										    		<c:if test="${chargingRate.key=='IAC'}">
										    				<c:set var="has_iac" value="1" />
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
										    	
										    	<c:if test="${has_iac==1}">
										    		<a title="Đã sử dụng dịch vụ IAC"><img src="../images/iac_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_iac==0}">
										    		<img src="../images/iac_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    </display:column>
										
											<display:column title="Actions" headerClass="transhead width40" class="svr_data1" style="border: 1px solid #CCC;">
												<a href="<%=request.getContextPath() %>/protected/provider_profile_detail.html?code=${list.providerCode}" class="act_detail" title="see Merchant Profile" target="blank"></a>
										    </display:column>
											
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										
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
