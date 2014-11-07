<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){

	$("#filter_charging").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
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
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("merchantNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						<!--  -->
						<div class="right_content">
							<form action="accounts.html" method="post">
			            	<c:if test="${model.isStaff}">   
			                <h1 class="srv_title">Quản lý merchants</h1>
			                <%
								Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
								if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE})){
							%>
							<div class="dash_row">
								<a href="<%=request.getContextPath()%>/protected/assign-merchant.html" class="addproduct_link"><span>Phân bổ merchant</span></a>
								<a href="<%=request.getContextPath()%>/account-permission-manager/change_permission.htm" class="addproduct_link" style="margin-right: 4px;"><span>Phân quyền merchant</span></a>
							</div>
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
							<div class="dash_row">
				            		<div class="other_filter">
					                  		<label class="product_lbl_filter">Trạng thái:</label>
										<select name="status" class="dashboard_filter">
											<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
												<c:forEach var="st" items="${model.status }">
													<option value="${st.key}" ${param.ct == st.key?'selected="selected"':''}>
														<c:out value="${st.value}" />
													</option>
												</c:forEach>
										</select>
				                	</div>
				                	<div class="input-prepend">
										<span class="add-on">Chọn ngày:</span> <input type="text"
											name="reservation" id="reservation" class="txt_calendar"
											value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
									</div>
									<script type="text/javascript">
										$(document).ready(function() {
											/* $('#reservation').daterangepicker({
												format : 'dd/MM/yyyy',
											}); */
											$('#reservation').daterangepicker({
												format : 'dd/MM/yyyy',
												ranges: {
												'Hôm nay': ['today', 'today'],
												'Hôm qua': ['yesterday', 'yesterday'],
												'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
												'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
												'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
												'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
												}
											});
										});
									</script>
				                	<div class="input-prepend" style="padding-top: 5px;"></div>
					                <div class="input-prepend" style="padding-top: 5px;">
					                	<span class="add-on">Tài khoản:</span>
					                  	<input type="text" name="userName" value="${param.userName}" class="txt_filter" />
					                </div>
					                <div class="input-prepend" style="padding-top: 5px;">
					                	<span class="add-on">Họ và Tên:</span>
					                  	<input type="text" name="fullName" value="${param.fullName}" class="txt_filter" />
					                </div>
				                <div class="input-prepend">
				                	<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submit" />
				                </div>
		                </div>
		                </c:if>
		                		
		                <div class="srv_row"/>
		               <div class="srv_row">
		               		<script>var rownum = 1;</script>
		                	<display:table name="model.list" id="list" 
												requestURI="/protected/accounts.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:1;cellpadding:1;border: 1px solid #CCC;table-layout:fixed;" 
												sort="list"  export="true">
									<%@ include file="display_table.jsp" %>
									<display:column title="Danh sách tài khoản" headerClass="transhead " class="svr_data1 fit_to_content" style="border: 1px solid #CCC;">
										<strong><c:out value="${list.username}"/> (<c:out value="${list.full_name}"/>) </strong><br/>
										<span style="color:#EAB700"><c:out value="${list.status}"/></span> . 
										<span><c:out value="${list.email}"/></span> .
										<span><c:out value="${list.phone}"/></span> .
										<span><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${list.created_time}"/></span>
										 <br/>
										<a href="<%=request.getContextPath() %>/protected/merchant_profile.html?merchant=<c:out value="${list.username}"/>" style="color:#2C8F39" target="blank">Profile</a> . <a href="#" style="color:#2C8F39">Mở lại</a> . <a href="#" style="color:#2C8F39">Khoá</a> . <a href="#" style="color:#2C8F39">Edit</a>
									</display:column>
									<display:setProperty name="export.excel.filename" value="account.xls"/>
							</display:table>
		               </div>
		            </form>
						</div>	
					</div>
				</div>
			</div>
		</div>
		<!-- Web Foot -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- / Web Foot -->
	</div>			
</body>

</html>