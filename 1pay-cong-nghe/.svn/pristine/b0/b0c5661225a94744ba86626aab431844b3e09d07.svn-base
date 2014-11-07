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
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
	$('#form_action_save').live('click', function() {
		/*
		if($('#advance_payment').val()==null||$('#advance_payment').val()=='')$('#advance_payment').val('0');
		else
		{
			var advance_payment = $('#advance_payment').val().toString().replace(/\$|\,/g,'');
			if(isNaN(advance_payment))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#advance_payment').val(advance_payment);
			}
		}
		*/
		if($('#fee_open').val()==null||$('#fee_open').val()=='')$('#fee_open').val(0);
		else
		{
			var fee_open = $('#fee_open').val().toString().replace(/\$|\,/g,'');
			if(isNaN(fee_open))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#fee_open').val(fee_open);
			}
		}
		if($('#fee_maintain').val()==null||$('#fee_maintain').val()=='')$('#fee_maintain').val(0);
		else
		{
			var fee_maintain = $('#fee_maintain').val().toString().replace(/\$|\,/g,'');
			if(isNaN(fee_maintain))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#fee_maintain').val(fee_maintain);
			}
		}
		/*
		if($('#income_tax').val()==null||$('#income_tax').val()=='')$('#income_tax').val(0);
		else
		{
			var income_tax = $('#income_tax').val().toString().replace(/\$|\,/g,'');
			if(isNaN(income_tax))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#income_tax').val(income_tax);
			}
		}
		*/
		if($('#fee_chargeback').val()==null||$('#fee_chargeback').val()=='')$('#fee_chargeback').val(0);
		else
		{
			var fee_chargeback = $('#fee_chargeback').val().toString().replace(/\$|\,/g,'');
			if(isNaN(fee_chargeback))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#fee_chargeback').val(fee_chargeback);
			}
		}
		if($('#fee_other').val()==null||$('#fee_other').val()=='')$('#fee_other').val(0);
		else
		{
			var fee_other = $('#fee_other').val().toString().replace(/\$|\,/g,'');
			if(isNaN(fee_other))
			{
				alert('Sai định dạng số');
				return false;
			}
			else
			{
				$('#fee_other').val(fee_other);
			}
		}
	});
});
function FormatNumber(obj)
{
	var strvalue;
	if (eval(obj))
	    strvalue = eval(obj).value;
	else
	    strvalue = obj;	
	var num;
	    num = strvalue.toString().replace(/\$|\,/g,'');

	    if(isNaN(num))
	    num = "";
	    sign = (num == (num = Math.abs(num)));
	    num = Math.floor(num*100+0.50000000001);
	    num = Math.floor(num/100).toString();
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	    num = num.substring(0,num.length-(4*i+3))+','+
	    num.substring(num.length-(4*i+3));
	    //return (((sign)?'':'-') + num);
	    eval(obj).value = (((sign)?'':'-') + num);
}
function formatCurrency(num) 
{
   num = num.toString().replace(/\$|\,/g,'');
   if(isNaN(num))
   num = "0";
   sign = (num == (num = Math.abs(num)));
   num = Math.floor(num*100+0.50000000001);
   num = Math.floor(num/100).toString();
   for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
   num = num.substring(0,num.length-(4*i+3))+','+
   num.substring(num.length-(4*i+3));
   return (((sign)?'':'-') + num);
}
function commifyCurrency(Num) {
	Num = Num.toString();
    var newNum = "";
    var newNum2 = "";
    var count = 0;

    //check for decimal number
    if (Num.indexOf('.') != -1){  //number ends with a decimal point
        if (Num.indexOf('.') == Num.length-1){
            Num += "00";
        }
        if (Num.indexOf('.') == Num.length-2){ //number ends with a single digit
            Num += "0";
        }

        var a = Num.split("."); 
        Num = a[0];   //the part we will commify
        var end = a[1] //the decimal place we will ignore and add back later
    }
    else {var end = "00";}  

    //this loop actually adds the commas
    for (var k = Num.length-1; k >= 0; k--){
      var oneChar = Num.charAt(k);
      if (count == 3){
        newNum += ",";
        newNum += oneChar;
        count = 1;
        continue;
      }
      else {
        newNum += oneChar;
        count ++;
      }
   }  //but now the string is reversed!

  //re-reverse the string
  for (var k = newNum.length-1; k >= 0; k--){
      var oneChar = newNum.charAt(k);
      newNum2 += oneChar;
  }

   // add dollar sign and decimal ending from above
   newNum2 = newNum2 + "." + end;
   return newNum2;
}
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
						<%request.setAttribute("comparisonNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Hỗ trợ đối soát</h1>
								<div>
									<div id="dash_tab">
										<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE) && account.checkRoles(new String[]{Account.ACCOUNT_BOOK_KEEPER_ROLE,Account.ACCOUNT_OPERATION_MANAGER_ROLE,Account.ACCOUNT_BILLING_ROLE})) {%>
											<a href="<%=request.getContextPath() %>/protected/comparison.html" class="tab"><span>Tất cả</span></a>
											<a href="<%=request.getContextPath() %>/protected/comparison_active.html" class="tab"><span>Đối soát</span></a>
										<a href="<%=request.getContextPath() %>/protected/comparison_reject.html" class="tab"><span>Đối soát bị hủy</span></a>
										<%} %>
										<%if(account.isOperator()||account.isBilling() || account.isBookKeeper()) {%>
											<a href="<%=request.getContextPath() %>/protected/comparison_export_billing.html" class="tab"><span>TH thanh toán</span></a>
										<%} %>
										<a href="<%=request.getContextPath() %>/protected/biz_support_comparison.html" class="tab_slc"><span>Hỗ trợ đối soát</span></a>
										<div class="clear"></div>
									</div>
									<form id="list-sms-scenario" action="biz_support_comparison.html" method="post">
										<jsp:include page="include_box_filter_comparison_biz_support.jsp"></jsp:include>
									</form>

				                 	<!-- Danh sach gan tt -->
				                 	<c:if test="${model.total >0 }">
									<div class="srv_row">
										<fmt:formatNumber var="totalItems" value="${model.total}" currencyCode="vnd" />
				                 		<strong>Kết quả tìm kiếm có <c:out value="${totalItems}" /> đối soát</strong> 
				                 	</div>
				                 	</c:if>
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.isPreliminary}" id="isPreliminary"/>
										<input type="hidden" value="${model.isMerchant}" id="isMerchant"/>
										<input type="hidden" value="${model.isOffical}" id="isOffical"/>
										<input type="hidden" value="${model.isBilling}" id="isBilling"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<display:table name="model.list" id="list" 
														requestURI="biz_support_comparison.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <c:if test="${model.isStaff }">
										    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
										    </c:if>
										    <display:column title="Title" headerClass="transhead" class="transdata" property="title" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Charging" headerClass="transhead" class="transdata width90" style="border: 1px solid #CCC;">
										    	<c:set var="has_card" value="0" />
										    	<c:set var="has_sms" value="0" />
										    	<c:set var="has_wap" value="0" />
										    	<c:set var="has_iac" value="0" />
										    	<c:set var="amount_total" value="0"/>
										    	<c:forEach items="${list.chargingComparisonGroups}" var="chargingComparisonGroup">
										    		<c:if test="${chargingComparisonGroup.chargingService=='CARD'}">
										    			<c:if test="${chargingComparisonGroup.amount>0}">
										    				<c:set var="has_card" value="1" />
										    			</c:if>
													</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='SMS'}">
										    			<c:if test="${chargingComparisonGroup.amount>0}">
										    				<c:set var="has_sms" value="1" />
										    			</c:if>
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='WAP'}">
										    			<c:if test="${chargingComparisonGroup.amount>0}">
										    				<c:set var="has_wap" value="1" />
										    			</c:if>
										    		</c:if>
										    		<c:if test="${chargingComparisonGroup.chargingService=='IAC'}">
										    			<c:if test="${chargingComparisonGroup.amount>0}">
										    				<c:set var="has_iac" value="1" />
										    			</c:if>
										    		</c:if>
										    	</c:forEach>
										    	
										    	<c:if test="${has_card==1}">
										    		<a title="CARD"><img src="../images/card_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_card==0}">
										    		<img src="../images/card_invi.png" alt="0" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_sms==1}">
										    		<a title="SMS"><img src="../images/sms_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_sms==0}">
										    		<img src="../images/sms_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_wap==1}">
										    		<a title="WAP"><img src="../images/wap_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_wap==0}">
										    		<img src="../images/wap_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    	
										    	<c:if test="${has_iac==1}">
										    		<a title="SMS Plus"><img src="../images/iac_normal.png" alt="" class="wap_invi"/></a>
										    	</c:if>
										    	<c:if test="${has_iac==0}">
										    		<img src="../images/iac_invi.png" alt="" class="wap_invi"/>
										    	</c:if>
										    </display:column>
											
											<display:column title="Status" headerClass="transhead width150" class="svr_data1" style="border: 1px solid #CCC;">
										    	<div style="display:none">
										    		<!-- Hỗ trợ đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink biz_supporter_approve card_invi" title="Hủy bỏ" href="#biz_supporter_approve" name="biz_supporter_approval"  rel="leanModal123"></a>
										    		<!-- /Hỗ trợ đối soát -->
										    	</div>
										    	
										    	<!-- hỗ trợ thanh toán -->
										    	<c:set var="bisSoupportApproveIconKey" value="com${list.id}" />
												<a class="comparison_${model.bisSupportApproveStatusIcon[bisSoupportApproveIconKey]} hotrodoisoat_approve" id="${list.id}" pname="${list.title}"
												title="${model.statusBisSupportIcon[model.bisSupportApproveStatusIcon[bisSoupportApproveIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.bisSupportApproveStatusIcon[bisSoupportApproveIconKey]=='active' || model.bisSupportApproveStatusIcon[bisSoupportApproveIconKey]=='reject' || model.bisSupportApproveStatusIcon[bisSoupportApproveIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	<!-- /hỗ trợ thanh toán -->
										    	
										    	<!-- yeu cau duyet so bo -->
										    	<c:set var="requirePrimaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.requirePreliminaryStatusIcon[requirePrimaryIconKey]} yeucauduyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusRequirePreliminaryIcon[model.requirePreliminaryStatusIcon[requirePrimaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='active' || model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='reject' || model.requirePreliminaryStatusIcon[requirePrimaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- duyet so bo -->
										    	<c:set var="primaryIconKey" value="com${list.id}" />
												<a class="comparison_${model.primaryStatusIcon[primaryIconKey]} duyetsobo" id="${list.id}" pname="${list.title}"
												title="${model.statusTitlePrimary[model.primaryStatusIcon[primaryIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.primaryStatusIcon[primaryIconKey]=='active' || model.primaryStatusIcon[primaryIconKey]=='reject' || model.primaryStatusIcon[primaryIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- merchant -->
										    	<c:set var="merchantIconKey" value="com${list.id}" />
												<a class="comparison_${model.merchantConfirmStatusIcon[merchantIconKey]} merchantxacnhan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleMerchantConfirm[model.merchantConfirmStatusIcon[merchantIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.merchantConfirmStatusIcon[merchantIconKey]=='active' || model.merchantConfirmStatusIcon[merchantIconKey]=='reject' || model.merchantConfirmStatusIcon[merchantIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- chinh thuc -->
										    	<c:set var="officalIconKey" value="com${list.id}" />
												<a class="comparison_${model.officalStatusIcon[officalIconKey]} duyetchinhthuc" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleOffical[model.officalStatusIcon[officalIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.officalStatusIcon[officalIconKey]=='active' || model.officalStatusIcon[officalIconKey]=='reject' || model.officalStatusIcon[officalIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	<!-- thanh toan -->
										    	<c:set var="billingIconKey" value="com${list.id}" />
												<a class="comparison_${model.billingStatusIcon[billingIconKey]} thanhtoan" id="${list.id}" pname="${list.title}"
												title="${model.statusTitleBilling[model.billingStatusIcon[billingIconKey]]}"
												${!model.isAdmin?'rel="leanModal"':((model.billingStatusIcon[billingIconKey]=='active' || model.billingStatusIcon[billingIconKey]=='reject' || model.billingStatusIcon[billingIconKey]=='normal')?'rel="leanModal"':'')}></a>
										    	
										    	
										    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    	<!-- list hiden for popup -->
												<input type="hidden" id="hd_title-${list.id}" value="${list.title}"/>
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.merchant}"/>
												<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" value="${list.payment_policy}"class="paymentPolicy" id="payment_policy_${list.id}"/>
												<input type="hidden" value="${list.contract_type}" class="contract_type" id="contract_type_${list.id}"/>
												
												<fmt:formatNumber value="${list.fee_open}" var="list_fee_open" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" value="<c:out value="${list_fee_open}"></c:out>" class="fee_open" id="fee_open_${list.id}"/>
												
												<fmt:formatNumber value="${list.fee_maintain}" var="list_fee_maintain" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" value="<c:out value="${list_fee_maintain}"></c:out>" class="fee_maintain" id="fee_maintain_${list.id}"/>
												
												<fmt:formatNumber value="${list.fee_chargeback}" var="list_fee_chargeback" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" value="${list_fee_chargeback}" class="fee_chargeback" id="fee_chargeback_${list.id}"/>
												
												<fmt:formatNumber value="${list.fee_other}" var="list_fee_other" currencyCode="vnd" minFractionDigits="0" maxFractionDigits="0" />
												<input type="hidden" value="${list_fee_other}" class="fee_other" id="fee_other_${list.id}"/>
										    </display:column>
										    <display:column title="Action" headerClass="transhead width50" class="svr_data1" style="border: 1px solid #CCC;">
										    	<div style="display:none">
										    		<!-- Hỗ trợ đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink biz_supporter_approval card_invi" title="Hủy bỏ" href="#biz_supporter_approval" name="biz_supporter_approval"  rel="leanModal123"></a>
										    		<!-- /Hỗ trợ đối soát -->
										    		<!-- Thông tin đối soát -->
										    		<a id="${list.id}" class="sms_avai1 act_copylink info_comparison_common card_invi" title="Hủy bỏ" href="#info_comparison_common" name="info_comparison_common"  rel="leanModal123"></a>
										    		<!-- /Thông tin đối soát -->
										    	</div>
										    	
										    	<!-- Sửa phí đối soát -->
										    	<c:if test="${list.status==-1}">
												<a class="link_denghi hotrodoisoat" id="${list.id}" pname="${list.title}" title="Sửa phí đối soát"></a>
										    	</c:if>
										    	<!-- /Sửa phí đối soát -->
										    	
										    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    	
										    	<!-- list hiden for popup -->
												<input type="hidden" id="hd_title-${list.id}" value="${list.title}"/>
												<input type="hidden" id="hd_merchant-${list.id}" value="${list.merchant}"/>
												<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
												<input type="hidden" value="${list.payment_policy}"class="paymentPolicy" id="payment_policy_${list.id}"/>
												
												<input type="hidden" value="${list.fee_open}"class="fee_open" id="fee_open_${list.id}"/>
												<input type="hidden" value="${list.fee_maintain}"class="fee_maintain" id="fee_maintain_${list.id}"/>
												<input type="hidden" value="${list.fee_chargeback}"class="fee_chargeback" id="fee_chargeback_${list.id}"/>
												<input type="hidden" value="${list.fee_other}"class="fee_other" id="fee_other_${list.id}"/>
										    </display:column>
										    
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										<script type="text/javascript">
											$(document).ready(function() {
												//<!--hotrodoisoat-->
												$('.hotrodoisoat_approve').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													
													//popup info
													//alert(active);
													if(active == '-1') {
														$(".biz_supporter_approve").trigger("click");
														return;
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--hotrodoisoat-->
												$('.hotrodoisoat').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													$(".fee_open_text").val(formatCurrency(fee_open.toString()));
													$(".fee_maintain_text").val(formatCurrency(fee_maintain));
													$(".fee_maintain_text").val(formatCurrency(fee_chargeback));
													$(".fee_other_text").val(formatCurrency(fee_other));
													//popup info
													//alert(active);
													if(active == '-1') {
														$(".biz_supporter_approval").trigger("click");
														return;
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												
												//<!--yeucauduyesobo-->
												$('.yeucauduyetsobo').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '1':
															status_view = 'Hủy đề nghị duyệt sơ bộ';
														  	break;
														case '2':
															status_view = 'Đề nghị duyệt sơ bộ';
														  	break;
														case '3':
															status_view = 'Hủy duyệt sơ bộ';
														  	break;
														case '4':
															status_view = 'Chờ merchant xác nhận';
														  	break;
														case '5':
															status_view = 'Merchant hủy xác nhận';
														  	break;
														case '6':
															status_view = 'Chờ duyệt chính thức';
														  	break;
														case '7':
															status_view = 'Hủy duyệt chính thức';
														  	break;
														case '8':
															status_view = 'Chờ thanh toán';
														  	break;
														case '9':
															status_view = 'Hủy thanh toán';
														  	break;
														case '10':
															status_view = 'Đã thanh toán';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													$(".info_comparison_common").trigger("click");
													//popup info
												});
												
												//<!--duyesobo-->
												$('.duyetsobo').live('click', function() {
													var chkId = $(this).attr('id')+'';
													//alert(chkId);
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '1':
															status_view = 'Hủy đề nghị duyệt sơ bộ';
														  	break;
														case '2':
															status_view = 'Đề nghị duyệt sơ bộ';
														  	break;
														case '3':
															status_view = 'Hủy duyệt sơ bộ';
														  	break;
														case '4':
															status_view = 'Chờ merchant xác nhận';
														  	break;
														case '5':
															status_view = 'Merchant hủy xác nhận';
														  	break;
														case '6':
															status_view = 'Chờ duyệt chính thức';
														  	break;
														case '7':
															status_view = 'Hủy duyệt chính thức';
														  	break;
														case '8':
															status_view = 'Chờ thanh toán';
														  	break;
														case '9':
															status_view = 'Hủy thanh toán';
														  	break;
														case '10':
															status_view = 'Đã thanh toán';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													//popup info
													
													$(".info_comparison_common").trigger("click");
												});
												//<!--/duyesobo-->
												//<!--merchantxacnhan-->
												$('.merchantxacnhan').live('click', function() {
													var chkId = $(this).attr('id')+'';
													//alert(chkId);
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '1':
															status_view = 'Hủy đề nghị duyệt sơ bộ';
														  	break;
														case '2':
															status_view = 'Đề nghị duyệt sơ bộ';
														  	break;
														case '3':
															status_view = 'Hủy duyệt sơ bộ';
														  	break;
														case '4':
															status_view = 'Chờ merchant xác nhận';
														  	break;
														case '5':
															status_view = 'Merchant hủy xác nhận';
														  	break;
														case '6':
															status_view = 'Chờ duyệt chính thức';
														  	break;
														case '7':
															status_view = 'Hủy duyệt chính thức';
														  	break;
														case '8':
															status_view = 'Chờ thanh toán';
														  	break;
														case '9':
															status_view = 'Hủy thanh toán';
														  	break;
														case '10':
															status_view = 'Đã thanh toán';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													$(".info_comparison_common").trigger("click");
													//popup info
													
													$(".info_comparison_common").trigger("click");
												});
												//<!--/merchantxacnhan-->
												//<!--duyetchinhthuc-->
												$('.duyetchinhthuc').live('click', function() {
													var chkId = $(this).attr('id')+'';
													//alert(chkId);
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '1':
															status_view = 'Hủy đề nghị duyệt sơ bộ';
														  	break;
														case '2':
															status_view = 'Đề nghị duyệt sơ bộ';
														  	break;
														case '3':
															status_view = 'Hủy duyệt sơ bộ';
														  	break;
														case '4':
															status_view = 'Chờ merchant xác nhận';
														  	break;
														case '5':
															status_view = 'Merchant hủy xác nhận';
														  	break;
														case '6':
															status_view = 'Chờ duyệt chính thức';
														  	break;
														case '7':
															status_view = 'Hủy duyệt chính thức';
														  	break;
														case '8':
															status_view = 'Chờ thanh toán';
														  	break;
														case '9':
															status_view = 'Hủy thanh toán';
														  	break;
														case '10':
															status_view = 'Đã thanh toán';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													$(".info_comparison_common").trigger("click");
													//popup info
													
													$(".info_comparison_common").trigger("click");
												});
												//<!--/duyetchinhthuc-->
												//<!--thanhtoan-->
												$('.thanhtoan').live('click', function() {
													var chkId = $(this).attr('id')+'';
													//alert(chkId);
													var pid = chkId.replace(/svr_/gi, '');
													//alert('pid: '+pid);
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var status_view = '';
													switch(active)
													{
														case '-1':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '0':
															status_view = 'Đề nghị đối soát';
														  	break;
														case '1':
															status_view = 'Hủy đề nghị duyệt sơ bộ';
														  	break;
														case '2':
															status_view = 'Đề nghị duyệt sơ bộ';
														  	break;
														case '3':
															status_view = 'Hủy duyệt sơ bộ';
														  	break;
														case '4':
															status_view = 'Chờ merchant xác nhận';
														  	break;
														case '5':
															status_view = 'Merchant hủy xác nhận';
														  	break;
														case '6':
															status_view = 'Chờ duyệt chính thức';
														  	break;
														case '7':
															status_view = 'Hủy duyệt chính thức';
														  	break;
														case '8':
															status_view = 'Chờ thanh toán';
														  	break;
														case '9':
															status_view = 'Hủy thanh toán';
														  	break;
														case '10':
															status_view = 'Đã thanh toán';
														  	break;
													}
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var fee_open = $('#fee_open_'+pid).val();
													var fee_maintain = $('#fee_maintain_'+pid).val();
													var fee_chargeback = $('#fee_chargeback_'+pid).val();
													var fee_other = $('#fee_other_'+pid).val();
													$(".popup_fee_open").html(fee_open);
													$(".popup_fee_maintain").html(fee_maintain);
													$(".popup_fee_chargeback").html(fee_chargeback);
													$(".popup_fee_other").html(fee_other);
													$(".info_comparison_common").trigger("click");
													//popup info
													
													$(".info_comparison_common").trigger("click");
												});
												//<!--/thanhtoan-->
											});
										</script>
										<div id="charging_data_temp" style="display: none;"></div>
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
	
	<!-- Hỗ trợ đối soát -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="biz_supporter_approve">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="form_biz_supporter_approve">
		<input type="hidden" name="a" value="biz_supporter_approve" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đề nghị đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			
			<div class="product_title">
				Phí mở mã (80.000 đ/ mã): <span class="go_sms_product_name popup_fee_open" id="popup_fee_open"></span> đ
			</div>
			<div class="product_title">
				Phí duy trì mã (32.000 đ/ mã): <span class="go_sms_product_name popup_fee_maintain" id="popup_fee_maintain"></span> đ
			</div>
			<div class="product_title">
				Phí hoàn trả cước khách hàng khiếu nại (nếu có): <span class="go_sms_product_name popup_fee_chargeback" id="popup_fee_chargeback"></span> đ
			</div>
			<div class="product_title">
				Phí khác (nếu có): <span class="go_sms_product_name popup_fee_other" id="popup_fee_other"></span> đ
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit" name="submit2" value="approve" />
			<input type="submit" id="form_biz_supporter_approve" name="approve" value="Đề nghị" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=form_biz_supporter_approve]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x == 0) {
									//var pid = $('form[name=biz_supporter_approve_post] input[name=pid]').val();
									mess = 'Yêu cầu đối soát thành công';
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Hỗ trợ đối soát -->
	
	<!-- Hỗ trợ đối soát:Sửa phí -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="biz_supporter_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="preliminary_approve_post">
		<input type="hidden" name="a" value="biz_supporter_edit" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Sửa phí đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				<div class="profile_label" style="width:350px;">Phí mở mã (80.000 đ/ mã):</div>
				<input type="text" id="fee_open" class="fee_open_text" name="fee_open" style="" placeholder="Phí mở mã" maxlength="10" onkeyup="FormatNumber(this);"/>
			</div>
			<div class="product_title">
				<div class="profile_label" style="width:350px;">Phí duy trì mã (32.000 đ/ mã):</div>
				<input type="text" id="fee_maintain" class="fee_maintain_text" name="fee_maintain" placeholder="Phí duy trì mã" maxlength="10" onkeyup="FormatNumber(this);"/>
			</div>
			<div class="product_title">
				<div class="profile_label" style="width:350px;">Phí hoàn trả cước khách hàng khiếu nại (nếu có):</div>
				<input type="text" id="fee_chargeback" class="fee_maintain_text" name="fee_chargeback" placeholder="Phí hoàn trả khiếu nại" maxlength="10" onkeyup="FormatNumber(this);"/>
			</div>
			<div class="product_title">
				<div class="profile_label" style="width:350px;">Phí khác (nếu có):</div>
				<input type="text" id="fee_other" class="fee_maintain_text" name="fee_other" placeholder="Phí khác" maxlength="10" onkeyup="FormatNumber(this);"/>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit" name="submit2" value="approve" />
			<input type="submit" id="form_action_save" name="approve" value="Cập nhật" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=preliminary_approve_post] input[type=submit]').live('click', function() {
					$('form[name=preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des').val();
						if(popup_des.length==0) {
	    					alert('Sai định dạng số');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=preliminary_approve_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x == -1) {
									//var pid = $('form[name=preliminary_approve_post] input[name=pid]').val();
									if(x == -1) {
										mess = 'Sửa phí đối soát thành công';
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Hỗ trợ đối soát: Sửa phí -->
	
	<!-- Info Comparison -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="info_comparison_common">
		<input type="hidden" name="a" value="operator_reject" />
		<input type="hidden" id="popup_pid" name="popup_pid" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Phí mở mã (80.000 đ/ mã): <span class="go_sms_product_name popup_fee_open" id="popup_fee_open"></span> đ
			</div>
			<div class="product_title">
				Phí duy trì mã (32.000 đ/ mã): <span class="go_sms_product_name popup_fee_maintain" id="popup_fee_maintain"></span> đ
			</div>
			<div class="product_title">
				Phí hoàn trả cước khách hàng khiếu nại (nếu có): <span class="go_sms_product_name popup_fee_chargeback" id="popup_fee_chargeback"></span> đ
			</div>
			<div class="product_title">
				Phí khác (nếu có): <span class="go_sms_product_name popup_fee_other" id="popup_fee_other"></span> đ
			</div>
		</div>
		<div>
			<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="button"/>
		</div>
	</div>
	<!-- /Info Comparison -->
	
</body>
</html>
