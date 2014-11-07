<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<style type="text/css">
	#owner_pop { display: none; width: 600px; height: auto; padding: 20px; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); font-size: 14px; }
	.width20 {width: 20px;}
	.width15 {width: 15px;}
	.alignBottom {vertical-align: bottom;}
	.backgroundf3 {background: none repeat scroll 0 0 #F3F3F3;}
	#permission_popup { display: none; background: #fff; width: 600px; height: auto; padding: 20px; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); font-size: 14px; }
	#password_pop { display: none; width: 600px; height: auto; padding: 20px; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); font-size: 14px; }
	#list thead {border-top: 1px solid #ccc; background: #f3f3f3;}
	#list th.row-header {width: auto;}
	#list th.manager { border-top: none; border-left:none; padding-left: 50px; padding-top: 45px; width: 42px; }
	#list th.merchant {border-right: none;}
	#list th.rotate-45 { height: 100px; width: 36px; min-width: 36px; max-width: 40px; position: relative; vertical-align: bottom; padding: 0; font-size: 12px; line-height: 0.8; }
	#list th.rotate-45 > div { position: relative; top: 0px; left: 50px; /* 80 * tan(45) / 2 = 40 where 80 is the height on the cell and 45 is the transform angle */ height: 100%; -ms-transform: skew(-45deg,0deg); -moz-transform: skew(-45deg,0deg); -webkit-transform: skew(-45deg,0deg); -o-transform: skew(-45deg,0deg); transform: skew(-45deg,0deg); overflow: hidden; border-right: 1px solid #ccc; /* border-left: 1px solid #ccc; */ border-top: 1px solid #ccc; background: #f3f3f3; }
	#list th.rotate-45 span { -ms-transform: skew(45deg,0deg) rotate(315deg); -moz-transform: skew(45deg,0deg) rotate(315deg); -webkit-transform: skew(45deg,0deg) rotate(315deg); -o-transform: skew(45deg,0deg) rotate(315deg); transform: skew(45deg,0deg) rotate(315deg); position: absolute; bottom: 36px; /* 40 cos(45) = 28 with an additional 2px margin */ left: -25px; /* Because it looked good, but there is probably a mathematical link here as well */ display: inline-block; width: 85px; /* // width: 100%; */ /* 80 / cos(45) - 40 cos (45) = 85 where 80 is the height of the cell, 40 the width of the cell and 45 the transform angle */ text-align: left; white-space: nowrap; /* // white-space: nowrap; whether to display in one line or not */ }
	.user_name {font-weight: bold;} 
	.email {color: #2c8f39; text-decoration: underline;}
	#account_info tr {height: 28px;}
</style>
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
	
	boolean isOperator = account.isOperator();
	request.setAttribute("isOperator",isOperator);
	//thay doi email & phone
%>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("productNavMenu",true); %>
				<%request.setAttribute("menuTrangChu", true); %>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<!-- / Header -->
				<script >
					
				</script>
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("merchantNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Quản lý Merchant</h1>
							<%
								if(account.checkRole(Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE)){
							%>
			                <div class="dash_row">
								<div class="dash_no_box">
									<fmt:formatNumber value="${model.totalMerchantSummary }" var="totalMerchantSummaryFmt" currencyCode="vnd" />
									<fmt:formatNumber value="${model.totalBillableMerchantSummary }" var="totalBillableMerchantSummaryFmt" currencyCode="vnd" />
									<fmt:formatNumber value="${model.totalGrowthRateSummary }" var="totalGrowthRateSummaryFmt" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber value="${model.totalAverageRevenueSummary }" var="totalAverageRevenueSummaryFmt" currencyCode="vnd" />
									
									<fmt:formatNumber var="totalMerchantPercent" value="${model.totalMerchantPercent}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="totalBillableMerchantPercent" value="${model.totalBillableMerchantPercent}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="totalGrowthRatePercent" value="${model.totalGrowthRatePercent}" maxFractionDigits="2" minFractionDigits="2" />
									<fmt:formatNumber var="totalAverageRevenuePercent" value="${model.totalAverageRevenuePercent}" maxFractionDigits="2" minFractionDigits="2" />
										
									<table cellpadding="0" cellspacing="0" width="100%" border="0">
										<tr>
											<td width="25%" class="dash_no_head">Total Merchants(<span style="color:${fn:contains(totalMerchantPercent,'-')?'#F30':'#0C0' }"><c:out value="${totalMerchantPercent}"/>%</span>)</td>
											<td width="25%" class="dash_no_head">Billable Merchants(<span style="color:${fn:contains(totalBillableMerchantPercent,'-')?'#F30':'#0C0' }"><c:out value="${totalBillableMerchantPercent}"/>%</span>)</td>
											<td width="25%" class="dash_no_head">Billable Rate(<span style="color:${fn:contains(totalGrowthRatePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalGrowthRatePercent}"/>%</span>)</td>
											<td align="right">Average Revenue(đ)(<span style="color:${fn:contains(totalAverageRevenuePercent,'-')?'#F30':'#0C0' }"><c:out value="${totalAverageRevenuePercent}"/>%</span>)</td>
										</tr>
										<tr>
											<td class="dash_no"><span id="totalMerchantPercent"> <c:out value="${totalMerchantSummaryFmt}" /></span></td>
											<td class="dash_no"><span id="totalBillableMerchantSummary"> <c:out value="${totalBillableMerchantSummaryFmt}" /></span></td>
											<td class="dash_no"><span id="totalGrowthRateSummary"> <c:out value="${totalGrowthRateSummaryFmt}" />%</span></td>
											<c:choose>
												<c:when test="${model.totalAverageRevenueSummary > model.totalAverageRevenueSummary1}">
													<td class="dash_no_money"><span id="totalAverageRevenueSummary"> <c:out value="${totalAverageRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:when test="${model.totalAverageRevenueSummary < model.totalAverageRevenueSummary1}">
													<td class="dash_no"><span id="totalAverageRevenueSummary" style="color: red"> <c:out value="${totalAverageRevenueSummaryFmt}" /></span></td>
												</c:when>
												<c:otherwise>
													<td class="dash_no"><span id="totalAverageRevenueSummary"> <c:out value="${totalAverageRevenueSummaryFmt}" /></span></td>
												</c:otherwise>
											</c:choose>
										</tr>
									</table>
								</div>
							</div>
							<%} %>
							<div id="account_search" style="display: block; ">
								<form id="list-sms-scenario" method="get">
          							<jsp:include page="include_merchant_manager_filter_box.jsp"></jsp:include>
         						</form>
							</div>
							<div class="srv_row">
								<c:if test="${model.size > 0}">
									<span class="pagebanner"> ${model.size} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pageSize) > model.size ? model.size : (model.offset + model.pageSize) }. </span>
								</c:if>
								<display:table name="model.listAccount" id="list" 
												requestURI="${model.requestURL}" 
												pagesize="${model.pageSize}" partialList="true" size="model.size"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;"
												sort="list">
									<%@ include file="display_table.jsp" %>
									
									<fmt:formatDate var="init" value="${list.created_time}" pattern="HH:mm:ss dd-MM-yyyy" />
								    <fmt:formatDate var="edit" value="${list.updated_time}" pattern="HH:mm:ss dd-MM-yyyy" />
								    
								    <display:column title="Tên tài khoản" paramProperty="id" headerClass="transhead merchant" class="svr_data_name" style="border: 1px solid #CCC;overflow:hidden;" >
							    		<div style="display: block">
								    		<a href="#permission_popup" rel="leanmodal" class="permission_popup" userName="${list.username}" email="${list.email}" phone="${list.phone}" fullName="${list.full_name}" 
								    			createTime="${init}" updateTime="${edit}" emailVerify="${list.verify_email}" phoneVerify="${list.verify_phone}" style="color:#2C8F39;font-size: 14px;"> ${list.username}</a>
								    		<%-- 
								    		<c:set var="su" value="${onepay:getDepartmentOfMerchant(list.username) }" />
								    		<c:if test="${(su == null || fn:length(su) == 0) && model.mapDeptAccountManager[list.username] != null && fn:length(model.mapDeptAccountManager[list.username]) > 0}">
								    			<c:set var="su" value="${model.mapDeptAccountManager[list.username][0]}" />
								    		</c:if>
								    		<c:if test="${su != null && fn:length(su) > 0 }">
									    		<div>
									    			&raquo; ${su}
									    		</div>
								    		</c:if>
								    		 --%>
								    		<div>
								    			<c:if test="${!empty(list.phone)}">${list.phone} . </c:if>
								    			<c:if test="${!empty(list.email)}"><a href="mailto:${list.email}">${list.email}</a></c:if>
								    		</div>
							    		</div>
								    </display:column>
								    
								    <c:forEach items="${model.roleMap}" var="roleOrigin" varStatus="status">
								    	<c:set var="title"><div ${status.first?'style="border-left:1px solid #ccc"':''}><span>${roleOrigin.value}</span></div></c:set>
									    <display:column  title="${title}" 
									    headerClass="rotate-45" class="svr_data1" style="border: 1px solid #CCC; ">
									    	<c:set var="check" value="false"/>
									    	<c:forEach items="${list.roles}" var="role">
									    		<c:if test="${role == roleOrigin.key && !check}">
									    			<c:set var="check" value="true"/>
									    			<input type="checkbox" checked="checked" disabled="true" title="${roleOrigin.value }"/>
									    		</c:if>
									    	</c:forEach>
									    	<c:if test="${!check}">
									    	<input type="checkbox" disabled="true" title="${roleOrigin.value }"/>
									    	</c:if>
									    </display:column>
								    </c:forEach>
								    
								    <display:column title="Người quản lý" headerClass="transhead manager" class="svr_data1" style="border: 1px solid #CCC; vertical-align: middle;">
								    	<a href="#owner_pop" style="color: #2C8F39; font-size: 14px;" rel="leanmodal" class="owner_pop" ownerList = "${list.owner}" ownerName="${list.owner}" userName="${list.username}">
								    		<c:out value="${list.owner}" />
							    		</a>
							    		<c:set var="su" value="${onepay:getDepartmentOfMerchant(list.owner) }" />
							    		<c:if test="${(su == null || fn:length(su) == 0) && model.mapDeptAccountManager[list.owner] != null && fn:length(model.mapDeptAccountManager[list.owner]) > 0}">
							    			<c:set var="su" value="${model.mapDeptAccountManager[list.owner][0]}" />
							    		</c:if>
							    		<c:if test="${su != null && fn:length(su) > 0 }">
								    		<div align="right">
								    			(${su})
								    		</div>
							    		</c:if>
								    </display:column>
								    
								    <display:column title="Hành động" headerClass="transhead width90" class="svr_data1" style="border: 1px solid #CCC; text-align : center;">
								    	<a href="#permission_popup" rel="leanmodal" class="permission_popup" userName="${list.username}" email="${list.email}" phone="${list.phone}" fullName="${list.full_name}" createTime="${init}" updateTime="${edit}" emailVerify="${list.verify_email}" phoneVerify="${list.verify_phone}"><img src="<%=request.getContextPath() %>/images/add.png" border="0" style="" title="Thêm quyền" width="20px" height="20px"/></a>
								    	<a href="#owner_pop" rel="leanmodal" class="owner_pop" ownerList = "${list.owner}" ownerName="${list.owner}" userName="${list.username}"><img src="<%=request.getContextPath() %>/images/denghi.png" border="0" style="" title="Thay đổi quản lý" width="20px" height="20px"/></a>
								    	<c:if test="${account_logined.isOperator() || account_logined.isBizSupportManager()}">
								    		<a href="#password_pop" rel="leanmodal" class="password_pop" userName="${list.username}"><img src="<%=request.getContextPath() %>/images/wrench.png" border="0" style="" title="Thiết lập lại mật khẩu" width="20px" height="20px"/></a>
								    	</c:if>
								    </display:column>
								    
								</display:table>
								
								<script type="text/javascript">
									$(document).ready(function() {
										$('.owner_pop').live('click', function() {
											var ownerName = $(this).attr('ownerName');
											$('form[name=owner_update] input[name=owner_name]').val(ownerName);
											
											var userName = $(this).attr('userName');
											$('form[name=owner_update] input[name=user_name]').val(userName);
											
											var ownerList = $(this).attr('ownerList');
											$('form[name=owner_update] select[name=owner_name_list]').val(ownerList);
											
										});
									});
								</script>
								
								<script type="text/javascript">
									$(document).ready(function() {
										$('form[name=owner_update]').submit(function() {
											if(!confirm('Bạn có chắc chắn muốn phân bổ merchant?'))
												return false;
											var username = $('#user_name').val(); 
											var owner_name = $('#owner_name').val();
											var action = "SET_OWNER";
											$.ajax({
												type : "Get",
									            url : $(this).attr('action'),
									            data : "user_name=" + username + "&owner_name="+owner_name + "&action=" + action,
									            success : function(data) {
									            	if(data == "1"){
									            		alert("Phân bổ merchant thành công.");
										            	$(location).attr('href',location.href);
									            	} else if(data == "-1"){
									            		alert("Bạn không có quyền cập nhật thông tin này.");
									            	} else
									            		alert("Cập nhật lỗi");
									            }
									        });
											
											return false;
										});
									});
								</script>
								<div id="owner_pop">
									<h1 class="srv_title">Phân bổ merchant</h1>
									<form name="owner_update" action="merchant-manager-api.html">
										<table width="100%;" >
											<tr>
												<td align="right" valign="middle">Tài khoản</td>
												<td ><input disabled="true" style="padding: 5px; width: 80%; margin-left: 5%;" id="user_name" name="user_name" /></td>
											</tr>
											<tr>
												<td align="right" valign="middle">Người quản lý</td>
												<td><input disabled="true" style="padding: 5px; width: 80%; margin-left: 5%;" name="owner_name" /></td>
											</tr>
											<tr>
												<td align="right" valign="middle">Thay đổi</td>
												<td>
												<select id="owner_name" style="padding: 5px; width: 50%; margin-left: 5%;" name="owner_name_list">
													<c:forEach items="${model.ownerList}" var="item">
														<c:set var="su" value="${onepay:getDepartmentOfMerchant(item.username) }" />
											    		<c:if test="${(su == null || fn:length(su) == 0) && model.mapDeptAccountManager[item.username] != null && fn:length(model.mapDeptAccountManager[item.username]) > 0}">
											    			<c:set var="su" value="${model.mapDeptAccountManager[item.username][0]}" />
											    		</c:if>
											    		<c:if test="${su != null && fn:length(su) > 0 }">
											    			<c:set var="su" value=" (${su})" />
											    		</c:if>
														<option value="${item.username}">${item.username} ${su}</option>
													</c:forEach>
												</select>
												</td>
											</tr>
											<tr>
												<td></td>
												<td>
													<input class="btn_greensmall" style="margin-left: 5%;" type="submit" value="Cập nhật" />
													<input class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
												</td>
											</tr>
										</table>
										
										<div>
											
										</div>
									</form>
								</div>
								
								<script type="text/javascript">
									
									var permissionArray = [];
									<c:forEach var="roleOrigin" items="${model.roleMap}" >
										permissionArray.push('<c:out value="${roleOrigin.key}"/>');
									</c:forEach>
									
									$(document).ready(function() {
										$('.permission_popup').live('click', function() {
											
											var userName = $(this).attr('userName');
											$('form[name=permission_update] .user_name').text(userName);
											
											var fullName = $(this).attr('fullName');
											$('form[name=permission_update] .fullName').text(fullName);
											
											var createTime = $(this).attr('createTime');
											$('form[name=permission_update] .created_time').text(createTime);
											var updateTime = $(this).attr('updateTime');
											$('form[name=permission_update] .updated_time').text(updateTime);
											
											var email = $(this).attr('email');
											var phone = $(this).attr('phone');
										
											var emailVerify = $(this).attr('emailVerify');
											var phoneVerify = $(this).attr('phoneVerify');
											
											var isOperator = '<c:out value = "${isOperator }"/>';
											var email_control = $('form[name=permission_update] .email_control');
											var phone_control = $('form[name=permission_update] .phone_control');
											
											email_control.html('');
											phone_control.html('');
											
											var emailSpan = '<span class="email" style="padding: 5px; width: 80%; margin-left: 5%;" >'+ email +'</span>';
											var phoneSpan = '<span class="email" style="padding: 5px; width: 80%; margin-left: 5%;" >'+ phone +'</span>';
											
											var emailInput = '<input type="text" name="email" class="email" style="padding: 5px; width: 80%; margin-left: 5%;" value="'+email+'">';
											var phoneInput = '<input type="text" name="phone" class="phone" style="padding: 5px; width: 80%; margin-left: 5%;" value="'+phone+'">';
											
											if(isOperator == 'false'){
												email_control.html(emailSpan);
												phone_control.html(phoneSpan);
											} else{
												email_control.html(emailInput);
												phone_control.html(phoneInput);
												/* if(emailVerify == 'true'){
													email_control.html(emailSpan);
												}
												else{
													email_control.html(emailInput);
												}
												if(phoneVerify == 'true'){
													phone_control.html(phoneSpan);
												}
												else{
													phone_control.html(phoneInput);
												} */
											}
											
											//Append Icon
											var verifyIcon = '<img title="Đã xác thực" src="<%=request.getContextPath()%>/images/com_actived.png">';
											var notVerifyIcon = '<a href="#"><img title="Chưa xác thực" src="<%=request.getContextPath()%>/images/invalid.png"><a>';
											
											if(emailVerify == 'true'){
												email_control.append(verifyIcon);
											}
											else{
												email_control.append(notVerifyIcon);
											}
											if(phoneVerify == 'true'){
												phone_control.append(verifyIcon);
											}
											else{
												phone_control.append(notVerifyIcon);
											}
											
											var action = "GET_ROLES";
											$.ajax({
												type : "Get",
									            url : 'merchant-manager-api.html',
									            data : "user_name=" + userName +"&action=" + action,
									            success : function(data) {
									            	var merchantList = data.split(",");
									            	resetPermission();
									                $.each(merchantList, function(k , v){
								                		setPermission(v);
									                });
									            }
									        });
											
										});
									});
									
									function setPermission(value){
										$('form[name=permission_update] input[name='+value+']').attr("checked", true);
										if(value == "admin"){
											/* console.log("admin"); */
											$('form[name=permission_update] input[name='+value+']').val(true);
										}
										return ;
									}
									
									function resetPermission(){
										$.each(permissionArray, function(k , v){
											$('form[name=permission_update] input[name='+v+']').attr("checked", false);
						                });
										
										return ;
									}
									
									$(document).ready(function() {
										$('form[name=permission_update]').submit(function() {
											
											if(!confirm('Bạn có chắc chắn muốn cập nhật quyền cho merchant này?'))
												return false;
											var action = "ADD_PERMISSIONS";																						
											
											var email = '';
											var phone = '';
											<c:if test="${isOperator}">
												email = $('form[name=permission_update] input[name=email]').val(); 
												phone = $('form[name=permission_update] input[name=phone]').val();
												console.log(email);
												if(!isEmail(email)){
													alert("Email sai định dạng");
													return false;
												}
													
												if(phone.length < 10 || phone.length > 15){
													alert("Số điện thoại từ 10-15 số");
													return false;
												}
												
											</c:if>
											var permissionArrayValue = new Object();
											$.each(permissionArray, function(k , v){
												permissionArrayValue[v] = $('#'+v).is(":checked");
											});
											
											var username = $('.user_name').text(); 
											
											console.log(username);
											$.ajax({
												type : "Get",
									            url : $(this).attr('action'),
									            data : setData(action, username, email, phone,  permissionArrayValue),
									            success : function(data) {
									            	if(data == "1"){
									            		alert("Cập nhật quyển merchant thành công.");
										            	$(location).attr('href',location.href);
									            	} else if(data == "-1"){
									            		alert("Bạn không có quyền cập nhật thông tin này.");
									            	} else
									            		alert("Cập nhật lỗi");
									            }
									        });
											
											return false;
										});
									});
									
									function setData(action, username, email, phone, map){
										console.log(map);
										
										var str = "action=" + action+ "&user_name=" + username + "&email=" + email + "&phone=" + phone;
										for(m in map){
											str += "&" + m + "=" + map[m]; 
										}
										
										return str;
									}
									
									function isEmail(email) { 
									    return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))$/i.test(email);
									} 
								</script>
								
								<div id="permission_popup">
									<h1 class="srv_title">Thay đổi quyền Merchant</h1>
									<form name="permission_update" action="merchant-manager-api.html">
										<div style="border: 1px solid #ccc; padding: 10px;font-size: 14px;border-radius: 5px;">
										<table width="100%" id="account_info">
										<col width="30%"/>
										<col width="70%"/>
											<tr>
												<td align="right" valign="middle">Tài khoản: </td>
												<td ><span class="user_name" style="padding: 5px; width: 80%; margin-left: 5%;" ></span></td>
												<!-- <input disabled="true" style="padding: 5px; width: 80%; margin-left: 5%;" id="userName" name="user_name" /> -->
											</tr>
											
											<tr>
												<td align="right" valign="middle">Tên đầy đủ: </td>
												<td><span class="fullName" style="padding: 5px; width: 80%; margin-left: 5%;" ></span></td>
											</tr>
											
											<tr>
												<td align="right" valign="middle">Ngày khởi tạo: </td>
												<td><span class="created_time" style="padding: 5px; width: 80%; margin-left: 5%;" ></span></td>
											</tr>
											
											<tr>
												<td align="right" valign="middle">Ngày cập nhật: </td>
												<td><span class="updated_time" style="padding: 5px; width: 80%; margin-left: 5%;" ></span></td>
											</tr>
											
											<tr>
												<td align="right" valign="middle">Email: </td>
												<td><span class="email_control"></span></td>
											</tr>
											
											<tr>
												<td align="right" valign="middle">Điện thoại: </td>
												<td><span class="phone_control"></span></td>
											</tr>
											
										</table>
										</div>
										<div style="padding-top: 10px;font-size: 14px;">
											<fieldset style="border: solid 1px #ccc;border-radius: 5px;">
												<legend><strong>Quyền merchant</strong></legend>
												<c:forEach items="${model.roleMap}" var="roleOrigin" varStatus="index">
													<div style="display:inline-block;width:150px;float:left;">
													<input type="checkbox" title="Merchant" style="padding: 5px;  margin-left: 5%;" name="${roleOrigin.key }" id="${roleOrigin.key }"/>
													<span>${roleOrigin.value }</span>
													</div>
												</c:forEach>
												
												<input type="hidden" title="admin" style="padding: 5px;  margin-left: 5%;" name="admin" id = "admin" />
											</fieldset>
										</div>
										<table align="center">
											<tr>
												
												<td colspan="3">
													<input class="btn_greensmall" type="submit" value="Cập nhật" />
													<input class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
												</td>
											</tr>
										</table>
									</form>
								</div>
								
								<!-- JS Reset Password -->
								<script type="text/javascript">
									$(document).ready(function() {
										$('.password_pop').live('click', function() {
											
											var userName = $(this).attr('userName');
											$('form[name=password_update] input[name=uname]').val(userName);
											
										});
									});
								
									$(document).ready(function() {
										$('form[name=password_update]').submit(function() {
											if(!confirm('Bạn có chắc chắn muốn thiết lập lại mật khẩu cho người dùng này?'))
												return false;
											var username = $('#uname').val(); 
											var pw = $('#pword').val();
											var vpw = $('#vpword').val();
											var action = "RESET_PASSWORD";
											
											if(pw.trim() == ""){
												alert("Mật khẩu không được trống");
												return false;
											}
											
											if(pw.length < 6){
												alert("Mật khẩu phải nhiều hơn 6 ký tự!");
												return false;
											}
											
											if(pw != vpw){
												alert("Xác nhận mật khẩu không đúng, hãy nhập lại!");
												return false;
											}
											
											console.log("passed");
											$.ajax({
												type : "Get",
									            url : $(this).attr('action'),
									            data : "user_name=" + username + "&pw="+pw + "&action=" + action,
									            success : function(data) {
									            	if(data == "1") {
									            		alert("Thiết lập lại mật khẩu thành công.");
									            	} else if(data == "-1"){
									            		alert("Bạn không có quyền cập nhật thông tin này.");
									            	} else
									            		alert("Cập nhật lỗi");
									                
									            }
									        });
											
											return false;
										});
									});
								</script>
								<!-- Reset Password -->
								<div id="password_pop">
									<h1 class="srv_title">Thiết lập lại mật khẩu</h1>
									<form name="password_update" action="merchant-manager-api.html">
										<table width="80%;" >
											<tr>
												<td align="right" valign="middle">Tài khoản</td>
												<td ><input disabled="true" style="padding: 5px; width: 80%; margin-left: 5%;" id="uname" name="uname" /></td>
											</tr>
											<tr>
												<td align="right" valign="middle">Mật khẩu mới</td>
												<td><input type="password" style="padding: 5px; width: 80%; margin-left: 5%;" name="pword" id="pword" placeholder="Mật khẩu mới"/></td>
											</tr>
											<tr>
												<td align="right" valign="middle">Xác nhận mật khẩu</td>
												<td><input type="password" style="padding: 5px; width: 80%; margin-left: 5%;" name="vpword" id="vpword" placeholder="Xác nhận mật khẩu"/></td>
											</tr>
											<tr>
												<td></td>
												<td>
													<input class="btn_greensmall" style="margin-left: 5%;" type="submit" value="Cập nhật" />
													<input class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
												</td>
											</tr>
										</table>
										
										<div>
											
										</div>
									</form>
								</div>
								<!-- END Reset Password -->
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
</body>
</html>