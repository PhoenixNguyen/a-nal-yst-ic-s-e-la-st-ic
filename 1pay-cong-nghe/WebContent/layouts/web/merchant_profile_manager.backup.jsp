
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui-1.9.2.css" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/top_up-min.js"></script>
<script type="text/javascript">
	TopUp.host = "<%=request.getContextPath()%>/";
  	TopUp.images_path = "images/";
</script>

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
						<!-- 
						<jsp:include page="include_operation_left_menu.jsp" />
						 -->
						<div class="right_content">
							<h1 class="srv_title">
								<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
									Quản lý Merchant's Profile
								<%}else{%>
									Thông tin profile
								<%}%>
							</h1>
								<div>
									<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
										<div id="dash_tab">
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_manager.html" class="tab_slc"><span>Tất cả(${model.total_all})</span></a>
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_approved.html" class="tab"><span>Hiệu lực(${model.total_approved})</span></a>
											
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_active.html" class="tab"><span>Đang xử lý(${model.total_active})</span></a>
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_reject.html" class="tab"><span>Bị hủy(${model.total_reject})</span></a>
											<!-- 
											<a href="<%=request.getContextPath() %>/protected/merchant_contract_manager.html" class="tab"><span>TT.Hợp đồng</span></a>
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_ready.html" class="tab"><span>Sẵn sàng(${model.total_ready})</span></a>
											<a href="<%=request.getContextPath() %>/protected/merchant_profile_pending.html" class="tab"><span>Chờ kích hoạt(${model.total_pendding})</span></a>
											 -->
											<c:if test="${model.isProposeProfile}">
												<a href="<%=request.getContextPath() %>/protected/merchant_profile_upgrate_user.html" class="addcomparison_link"><span>Đề xuất profile</span></a>
											</c:if>
											<div class="clear"></div>
										</div>
									<%}%>
									
									<c:if test="${model.isStaff}">
									<form id="list-sms-scenario" action="merchant_profile_manager.html" method="post">
										<jsp:include page="include_box_filter_merchant_profile_all.jsp"></jsp:include>
									</form>
				                 	</c:if>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.account.username}" id="account"/>
										<input type="hidden" value="${model.isSupportProfile}" id="isSupportProfile"/>
										<input type="hidden" value="${model.isReviewProfileInfo}" id="isReviewProfileInfo"/>
										<input type="hidden" value="${model.isPromoteRate}" id="isPromoteRate"/>
										<input type="hidden" value="${model.isMerchantConfirm}" id="isMerchantConfirm"/>
										<input type="hidden" value="${model.isReviewProfileRate}" id="isReviewProfileRate"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<input type="hidden" value="${model.isVerifyIdentity}" id="isVerifyIdentity"/>
										<input type="hidden" value="<%=request.getContextPath() %>${model.path_identity_image}" id="path_identity_image"/>

					                 	<c:if test="${model.total>0 }">
					                 		<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
					                 	</c:if>
										<display:table name="model.list" id="list" 
														requestURI="merchant_profile_manager.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid" state="${list.status}-${list.activate}">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <display:column title="Merchant" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;">
										    	${list.contractInfo.merchant}
										    	<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
										    		(<c:out value="${onepay:getDepartmentOfMerchant(list.contractInfo.merchant)}-${onepay:profileVerson2Text(list.version)}"/>)
										    	<%}%>
										    	<br />
										    	
										    	<c:set var="emailVerify" value="${onepay:getStatusVerifyEmail(list.contractInfo.merchant, pageContext.request)}" />
										    	<c:set var="phoneVerify" value="${onepay:getStatusVerifyPhone(list.contractInfo.merchant, pageContext.request)}" />
										    	<c:set var="billingVerify" value="${onepay:getStatusVerifyBillingInfo(list.contractInfo.merchant, pageContext.request)}" />
										    	
										    	<a class="${emailVerify?'verify':'not_verify'}" title="${emailVerify?'Đã xác thực':'Chưa xác thực'}">Email</a> .
										    	<a class="${phoneVerify?'verify':'not_verify'}" title="${phoneVerify?'Đã xác thực':'Chưa xác thực'}">Phone</a> .
										    	<a class="${billingVerify?'verify':'not_verify'}" title="${billingVerify?'Đã xác thực':'Chưa xác thực'}">Billing Info</a>
										    </display:column>
										    
										    <display:column title="Loại HĐ" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;text-align:center;">
										    	${list.contractInfo.contractType}
										    </display:column>
										    <display:column title="Chu kỳ TT" headerClass="transhead " class="transdata width50" style="border: 1px solid #CCC;text-align:center;">
										    	${list.contractInfo.paymentPolicy}
										    </display:column>
										    
										    <display:column title="Tỷ lệ" headerClass="transhead " class="transdata width50" style="border: 1px solid #CCC;text-align:center;">
										    	<c:if test="${list.merchantChargingRate.is_default==true}">
										    		<a title="Sử dụng tỷ lệ mặc định">
										    			<img src="../images/rate_default.png" alt="0" class="wap_invi" width="17" height="17"/>
										    		</a>
												</c:if>
												<c:if test="${list.merchantChargingRate.is_default==false}">
										    		<a title="Sử dụng tỷ lệ riêng">
										    			<img src="../images/rate_merchant.png" alt="0" class="wap_invi" width="20" height="18"/>
										    		</a>
												</c:if>
										    </display:column>
										    
										    <display:column title="Charging" headerClass="transhead" class="transdata width90" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:set var="has_iac" value="0" />
										    	<c:forEach items="${list.merchantChargingRate.chargingRates}" var="chargingRate">
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
										    	
										    	<!-- Contract -->
										    	<c:set var="has_card_contract" value="0" />
										    	<c:set var="has_sms_contract" value="0" />
										    	<c:set var="has_wap_contract" value="0" />
										    	<c:set var="has_iac_contract" value="0" />
										    	<c:forEach items="${list.contractInfo.chargingServices}" var="chargingService">
										    		<c:if test="${chargingService.key=='CARD'}">
										    				<c:set var="has_card_contract" value="1" />
													</c:if>
										    		<c:if test="${chargingService.key=='SMS'}">
										    				<c:set var="has_sms_contract" value="1" />
										    		</c:if>
										    		<c:if test="${chargingService.key=='WAP'}">
										    				<c:set var="has_wap_contract" value="1" />
										    		</c:if>
										    		<c:if test="${chargingService.key=='IAC'}">
										    				<c:set var="has_iac_contract" value="1" />
										    		</c:if>
										    	</c:forEach>
										    	<!-- 
										    	<c:if test="${!list.merchantChargingRate.is_default}">
										    		<c:if test="${has_card==0 && has_card_contract==1}">
											    		<c:set var="has_card" value="2" />
											    	</c:if>
											    	<c:if test="${has_sms==0 && has_sms_contract==1}">
											    		<c:set var="has_sms" value="2" />
											    	</c:if>
											    	<c:if test="${has_wap==0 && has_wap_contract==1}">
											    		<c:set var="has_wap" value="2" />
											    	</c:if>
											    	<c:if test="${has_iac==0 && has_iac_contract==1}">
											    		<c:set var="has_iac" value="2" />
											    	</c:if>
										    	</c:if>
										    	 -->
										    	<c:if test="${has_card==1}">
										    		<a title="Đã sử dụng dịch vụ CARD"><img src="../images/card_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_card==0}">
										    		<img src="../images/card_invi.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	<!-- 
										    	<c:if test="${has_card==2}">
										    		<img src="../images/card_normal_active.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	 -->
										    	
										    	<c:if test="${has_sms==1}">
										    		<a title="Đã sử dụng dịch vụ SMS"><img src="../images/sms_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_sms==0}">
										    		<img src="../images/sms_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_sms==2}">
										    		<img src="../images/sms_normal_active.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap==1}">
										    		<a title="Đã sử dụng dịch vụ WAP"><img src="../images/wap_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_wap==0}">
										    		<img src="../images/wap_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_wap==2}">
										    		<img src="../images/wap_normal_active.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_iac==1}">
										    		<a title="Đã sử dụng dịch vụ IAC"><img src="../images/iac_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_iac==0}">
										    		<img src="../images/iac_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_iac==2}">
										    		<img src="../images/iac_normal_active.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	</br>
										    	<c:if test="${has_card_contract==0}">
										    		<img src="../images/contract_no.png"/>
										    	</c:if>
										    	<c:if test="${has_card_contract==1}">
										    		<img src="../images/contract_yes.png"/>
										    	</c:if>
										    	
										    	<c:if test="${has_sms_contract==0}">
										    		<img src="../images/contract_no.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_sms_contract==1}">
										    		<img src="../images/contract_yes.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap_contract==0}">
										    		<img src="../images/contract_no.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_wap_contract==1}">
										    		<img src="../images/contract_yes.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_iac_contract==0}">
										    		<img src="../images/contract_no.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	<c:if test="${has_iac_contract==1}">
										    		<img src="../images/contract_yes.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    </display:column>
										    
										    <display:column title="Status" headerClass="transhead width110" class="svr_data1" style="border: 1px solid #CCC;">
										    	<div style="display:none">
										    		<!-- 2.Hỗ trợ -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink preliminary_approval card_invi" title="Hủy bỏ" href="#comparison_provider_accept" name="preliminary_approval"  rel="leanModal123"></a>
										    		<!-- /2.Hỗ trợ -->
										    		
										    		<!-- 3.Duyệt Profile -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_approval card_invi" title="Hủy bỏ" href="#confirm_comparison_provider" name="merchant_approval"  rel="leanModal123"></a>
										    		<!-- /3.Duyệt Profile -->
										    		
										    		<!-- 4.Đề xuất tỷ lệ -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink offical_approval card_invi" title="Hủy bỏ" href="#confirm_payment_provider" name="offical_approval"  rel="leanModal123"></a>
										    		<!-- /4.Đề xuất tỷ lệ -->
										    		
										    		<!-- Merchant xác nhận -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_confirm-contract card_invi" title="Hủy bỏ" href="#merchant_confirm_contract_rates" name="offical_approval"  rel="leanModal123"></a>
										    		<a id="${list.id}" class="sms_avai1 act_copylink merchant_confirm_contract_verify card_invi" title="Hủy bỏ" href="#merchant_confirm_contract_rates_verify" name="offical_approval"  rel="leanModal123"></a>
										    		<!-- /Merchant xác nhận -->
										    		
										    		<!-- 5.Duyệt tỷ lệ -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink billing_approval card_invi" title="Hủy bỏ" href="#confirm_payment_1pay" name="billing_approval"  rel="leanModal123"></a>
										    		<!-- /5.Duyệt tỷ lệ -->
										    		
										    		<!-- 6.Kích hoạt -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink effective_date card_invi" title="Hủy bỏ" href="#effective_date" name="effective_date"  rel="leanModal123"></a>
										    		<!-- /6.Kích hoạt -->
										    		
										    		<!-- 7.Hủy kích hoạt -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink activate_reject_form card_invi" title="Hủy bỏ" href="#activate_reject_form" name="activate_reject"  rel="leanModal123"></a>
										    		<!-- /7.Hủy kích hoạt -->
										    		
										    		<!-- Thông tin đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink info_comparison_common card_invi" title="Hủy bỏ" href="#info_provider_comparison_common" name="info_comparison_common"  rel="leanModal123"></a>
										    		<!-- /Thông tin đối soát -->
										    		
										    		<!-- Ngày hiệu lực -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink effective_date card_invi" title="Hủy bỏ" href="#effective_date" name="info_comparison_common"  rel="leanModal123"></a>
										    		<!-- /Ngày hiệu lực -->
										    		
										    		<!-- 8.Clone profile -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink clone_profile_popup card_invi" title="Hủy bỏ" href="#clone_profile_form_popup" name="offical_approval"  rel="leanModal123"></a>
										    		<!-- /8.Clone profile -->
										    	</div>
										    	 
										    	<!-- 2.Hỗ trợ -->
										    	<c:set var="primaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.primaryStatusIcon[primaryIconKey]} duyetsobo" id="${list.id}"
												title="${model.statusTitlePrimary[model.primaryStatusIcon[primaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.primaryStatusIcon[primaryIconKey]=='active' || model.primaryStatusIcon[primaryIconKey]=='reject' || model.primaryStatusIcon[primaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /2.Hỗ trợ -->
										    	
										    	<!-- 3.Duyệt thông tin đối tác -->
										    	<c:set var="merchantIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmStatusIcon[merchantIconKey]} merchantxacnhan" id="${list.id}"
												title="${model.statusTitleMerchantConfirm[model.merchantConfirmStatusIcon[merchantIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmStatusIcon[merchantIconKey]=='active' || model.merchantConfirmStatusIcon[merchantIconKey]=='reject' || model.merchantConfirmStatusIcon[merchantIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /3.Duyệt thông tin đối tác -->
										    	
										    	<!-- 4.Đề xuất tỷ lệ -->
										    	<c:set var="officalIconKey" value="com${list.id}" />
												<a class="comparison_${model.officalStatusIcon[officalIconKey]} duyetchinhthuc" id="${list.id}"
												title="${model.statusTitleOffical[model.officalStatusIcon[officalIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.officalStatusIcon[officalIconKey]=='active' || model.officalStatusIcon[officalIconKey]=='reject' || model.officalStatusIcon[officalIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /4.Đề xuất tỷ lệ -->
										    	
										    	<!-- 5.Merchant xác nhận -->
										    	<c:set var="merchantConfirmIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmContractStatusIcon[merchantConfirmIconKey]} merchant_xacnhan_hd" id="${list.id}"
												title="${model.statusTitleMerchantConfirmContract[model.merchantConfirmContractStatusIcon[merchantConfirmIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmContractStatusIcon[merchantConfirmIconKey]=='active' || model.merchantConfirmContractStatusIcon[merchantConfirmIconKey]=='reject' || model.merchantConfirmContractStatusIcon[merchantConfirmIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /5.Merchant xác nhận -->
										    	
										    	<!-- 6.Duyệt tỷ lệ -->
										    	<c:set var="billingIconKey" value="com${list.id}" />
												<a class="comparison_${model.billingStatusIcon[billingIconKey]} thanhtoan" id="${list.id}"
												title="${model.statusTitleBilling[model.billingStatusIcon[billingIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.billingStatusIcon[billingIconKey]=='active' || model.billingStatusIcon[billingIconKey]=='reject' || model.billingStatusIcon[billingIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /6.Duyệt tỷ lệ -->
										    	
										    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    </display:column>
										    
										    <display:column title="Actions" headerClass="transhead width80" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="merchant_profile_detail.html?id=${list.id}&call_back_url=${model.url_callback_full}" rel="leanmodal" class="act_detail" title="Xem Merchant Profile"></a>
										    	
										    	<!-- Sửa Profile -->
										    	<c:if test="${onepay:viewEditMerchantProfile(list.status) =='true'}">
										    		<a href="edit_merchant_profile.html?id=${list.id}&call_back_url=${model.url_callback_full}" class="link_denghi" title="Sửa Merchant Profile"></a>
										    	</c:if>
										    	<!-- /Sửa Profile -->
										    	
										    	<!-- Clone profile -->
										    	<c:if test="${onepay:viewCloneMerchantProfile(list.status) =='true'}">
										    		<a class="act_copylink clone_profile" id="${list.id}" title="Clone profile"></a>
										    	</c:if>
										    	<!-- /Clone profile -->
												
												<!-- Activate
												<c:if test="${list.status==8}">
											    	<c:set var="activateIconKey" value="com${list.id}" />
											    	<c:if test="${list.activate=='pending'||list.activate=='ready'}">
													<a class="merchantprofile_${model.activateStatusIcon[activateIconKey]} activate_approve" id="${list.id}"
													title="${model.statusTitleActivate[model.activateStatusIcon[activateIconKey]]}"
													${!model.isAdmin?'rel="leanModal"':((model.activateStatusIcon[activateIconKey]=='active' || model.activateStatusIcon[activateIconKey]=='reject' || model.activateStatusIcon[activateIconKey]=='normal')?'rel="leanModal"':'')}></a>
											    	</c:if>
											    	
											    	<c:if test="${list.activate=='approved'}">
													<a class="merchantprofile_${model.activateStatusIcon[activateIconKey]} activate_reject" id="${list.id}"
													title="${model.statusTitleActivate[model.activateStatusIcon[activateIconKey]]}"
													${!model.isAdmin?'rel="leanModal"':((model.activateStatusIcon[activateIconKey]=='active' || model.activateStatusIcon[activateIconKey]=='reject' || model.activateStatusIcon[activateIconKey]=='normal')?'rel="leanModal"':'')}></a>
											    	</c:if>
										    	</c:if>
										    	 -->
										    	<!-- /Activate -->
										    	
										    	<!-- Activate -->
										    	<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)||account.checkRole(Account.ACCOUNT_MERCHANT_ROLE)){ %>
													<c:if test="${list.status==10}">
												    	<c:set var="activateIconKey" value="com${list.id}" />
														<a id="${list.id}" style="display: inline-block;" class="demo-wrapper html5-progress-bar ${list.activate=='ready'? 'activate_profile_approve_' : 'activate_reject'}" title="${model.statusTitleActivate[model.activateStatusIcon[activateIconKey]]}">
															<div class="circle color_${list.activate=='pending'?'approved':list.activate}">
																<c:if test="${list.activate=='pending'}">
																	<div class="halfCircleRight color_${list.activate}"></div>
																</c:if>
															</div>
														</a>
													</c:if>
												<%}%>
										    	<!-- /Activate -->
										    	
												<!-- list hiden for popup -->
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.merchant}"/>
												<input type="hidden" id="hd_merchant_name-${list.id}" value="${list.contractInfo.merchantName}"/>
												<input type="hidden" id="hd_merchant_desc-${list.id}" value="${list.contractInfo.merchantDesc}"/>
												
												<input type="hidden" id="hd_effective_date_fmt-${list.id}" value="${list.effectiveDateFmt}"/>
												<input type="hidden" value="${list.contractInfo.contractNo}" class="contract_no" id="contract_no_${list.id}"/>
												<input type="hidden" value="${list.contractInfo.contractType}" class="contract_type" id="contract_type_${list.id}"/>
												<input type="hidden" value="${list.contractInfo.contract_date_fmt}" class="contract_date" id="contract_date_${list.id}"/>
												<input type="hidden" value="${list.contractInfo.paymentPolicy}" class="paymentPolicy" id="payment_policy_${list.id}"/>
												
												<input type="hidden" value="${list.status}" class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" class="amount_total" id="amount_total_${list.id}" value="<c:out value="${amount_3}"></c:out> đ"/>
												<input type="hidden" id="hd_using_default-${list.id}" value="${list.merchantChargingRate.is_default}"/>
												<!-- 
												<input type="hidden" id="hd_identityImage-${list.id}" value="${list.contractInfo.identityImage}"/>
												<input type="hidden" id="hd_identity-${list.id}" value="${list.contractInfo.identity}"/>
												 -->
												<input type="hidden" value="${list.contractInfo.expired_date_fmt}" class="contract_expired_date" id="contract_expired_date_${list.id}"/>
												<input type="hidden" id="hd_autoExtendedContract-${list.id}" value="${list.contractInfo.autoExtendedContract}"/>
												<input type="hidden" id="hd_hasHardCopy-${list.id}" value="${list.contractInfo.hasHardCopy}"/>
												<input type="hidden" id="hd_linkHardCopy-${list.id}" value="${list.contractInfo.hardContractFile}"/>
												<input type="hidden" id="hd_reference-${list.id}" value="${list.reference}"/>
												<input type="hidden" id="hd_paymentInfo-${list.id}" value="${list.contractInfo.paymentInfo}"/>
												<input type="hidden" id="hd_rejectLog-${list.id}" value="${list.rejectLog}"/>
												<input type="hidden" id="hd_version-${list.id}" value="${list.version}"/>
												
												<!-- email, phone -->
												<input type="hidden" id="hd_merchant_email-${list.id}" value="${onepay:getEmail(list.merchant, pageContext.request)}"/>
												<input type="hidden" id="hd_merchant_phone-${list.id}" value="${onepay:getPhone(list.merchant, list.contractInfo.phone, pageContext.request)}"/>
												<input type="hidden" id="hd_merchant_phone_account-${list.id}" value="${onepay:getPhoneAccount(list.merchant, pageContext.request)}"/>
												<input type="hidden" id="hd_status_verify_email-${list.id}" value="${onepay:getStatusVerifyEmail(list.merchant, pageContext.request)}"/>
												<input type="hidden" id="hd_status_verify_phone-${list.id}" value="${onepay:getStatusVerifyPhone(list.merchant, pageContext.request)}"/>
												<input type="hidden" id="hd_status_verify_billing_info-${list.id}" value="${onepay:getStatusVerifyBillingInfo(list.merchant, pageContext.request)}"/>
												<!-- /email, phone -->
												
												<!-- Billing Info -->
												<input type="hidden" id="hd_account_number-${list.id}" value="${list.billingInformation.bank_account_number}"/>
												<input type="hidden" id="hd_account_holder-${list.id}" value="${list.billingInformation.bank_account_holder}"/>
												<input type="hidden" id="hd_bank_name-${list.id}" value="${list.billingInformation.bank_name}"/>
												<input type="hidden" id="hd_bank_city-${list.id}" value="${list.billingInformation.bank_city}"/>
												<input type="hidden" id="hd_bank_name_code-${list.id}" value="${list.billingInformation.bank_name_code}"/>
												<input type="hidden" id="hd_bank_city_code-${list.id}" value="${list.billingInformation.bank_city_code}"/>
												<input type="hidden" id="hd_bank_branch-${list.id}" value="${list.billingInformation.bank_branch}"/>
												<input type="hidden" id="hd_bank_status-${list.id}" value="${list.billingInformation.status}"/>
												<!-- Billing Info -->
												
												<!-- CMND -->
												<input type="hidden" id="hd_identity-${list.id}" value="${list.identity.identity}"/>
												<input type="hidden" id="hd_identityImage-${list.id}" value="${list.identity.identityImage}"/>
												<input type="hidden" id="hd_placeOfIssue-${list.id}" value="${list.identity.placeOfIssue}"/>
												<input type="hidden" id="hd_dateOfIssue-${list.id}" value="${list.identity.dateOfIssueFmt}"/>
												<input type="hidden" id="hd_identity_status-${list.id}" value="${list.identity.status}"/>
												<!-- CMND -->
												
												<fmt:formatNumber value="${amount_group_card}" var="amount_group_card" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_sms}" var="amount_group_sms" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<fmt:formatNumber value="${amount_group_wap}" var="amount_group_wap" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" class="amount_services" id="amount_services_${list.id}" value="<br> - CARD:&nbsp;<c:out value="${amount_group_card}"></c:out> đ <br>  - SMS&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_sms}"></c:out> đ <br>  - WAP&nbsp;&nbsp;:&nbsp;<c:out value="${amount_group_wap}"></c:out>  đ"/>
												<!-- list hiden for popup -->
												
												<!-- reference -->
										    	<input type="hidden" value="${list.rejectLog}" class="rejectLog" id="rejectLog_${list.id}"/>
										    	<!-- /reference -->
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
	
	<jsp:include page="include_merchant_profile_popup.jsp"></jsp:include>
	
</body>
</html>
