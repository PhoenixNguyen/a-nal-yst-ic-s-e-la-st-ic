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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){

	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	$("#filter_provider").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	$("#filter_card_type").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	$("#filter_card_amount").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
});
</script>

</head>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
%>
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
						<%request.setAttribute("cardReport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Tra cứu</h1>
							<div>
								<form id="iacReport" action="iac-report.html" method="get">
									<div id="dash_tab">
											<a id="cont" href="<%=request.getContextPath() %>/protected/card-report.html" class="tab"><span>Card Charging</span></a>
											<a id="price" href="<%=request.getContextPath() %>/protected/sms-report.html" class="tab"><span>SMS Charging</span></a> 
											<a id="price" href="<%=request.getContextPath() %>/protected/wap-report.html" class="tab"><span>WAP Charging</span></a>
											<a id="telco" href="<%=request.getContextPath() %>/protected/iac-report.html" class="tab_slc"><span>SMS Plus Charging</span></a>
											
											<div class="clear"></div>
									</div>
									<div id="filter_locketqua">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Lọc kết quả</a></h3>
										<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<div class="other_filter">
													<label class="lbl_dash_filter">Trạng thái GD:</label> 
													<select name="status" class="dashboard_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
														<option value="1" ${param.status == '1'?'selected="selected"':''}>Thành công</option>
														<option value="0" ${param.status == '0'?'selected="selected"':''}>Không thành công</option>
													</select>
												</div>
												<div class="other_filter">
													<label class="lbl_dash_filter">Tính cước:</label> 
													<select name="billingStatus" class="dashboard_filter">
														<option value="" ${(param.billingStatus == null || param.billingStatus == '')?'selected="selected"':''}>Tất cả</option>
														<option value="1" ${param.billingStatus == '1'?'selected="selected"':''}>Tính cước</option>
														<option value="0" ${param.billingStatus == '0'?'selected="selected"':''}>Không tính cước</option>
													</select>
												</div>
												<div class="input-prepend">
													<span class="add-on">Chọn ngày:</span> <input type="text"
														name="reservation" id="reservation" class="txt_calendar"
														value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
												</div>
												
												<script type="text/javascript">
													$(document).ready(function() {
														$('#reservation').daterangepicker({
															format : 'dd/MM/yyyy',
															ranges: {
															'Hôm nay': ['today', 'today'],
															'Hôm qua': ['yesterday', 'yesterday'],
															'15 Ngày đầu tháng': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToFirstDayOfMonth().add({ days: +14 })],
															'15 Ngày cuối tháng': [Date.today().moveToFirstDayOfMonth().add({ days: +15 }), Date.today().moveToLastDayOfMonth()],
															'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
															'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
															'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
															'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
															}
														}
														);
													});
												</script>
											</div>
											<div class="filter_row">
							                 	<span class="add-on">Thuê bao:</span>
							               		<input type="text" name="msisdn" value="${param.msisdn}" class="txt_filter" />
							                </div>
											<%if(account.checkRoles(new String[]{Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_BIZ_SUPPORTER_ROLE, Account.ACCOUNT_CUSTOMER_CARE_ROLE})) {%>
							                <div class="filter_row">
							                 	<span class="add-on">Mã game:</span>
							               		<input type="text" name="gameCode" value="${param.commandCode}" class="txt_filter" />
							                </div>
							                <%} %>
											<div class="filter_row">
							                 	<span class="add-on">Nội dung tin nhắn:</span>
							               		<input type="text" name="moMessage" value="${param.moMessage}" class="txt_filter" />
							                </div>
							                <%if(account.checkRoles(new String[]{Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_BIZ_SUPPORTER_ROLE, Account.ACCOUNT_CUSTOMER_CARE_ROLE})) {%>
							                <div class="filter_row">
							                 	<span class="add-on">Nội dung trả về:</span>
							               		<input type="text" name="mtMessage" value="${param.mtMessage}" class="txt_filter" />
							                </div>
							                <%} %>
							                
											<!-- .field-group -->
											<c:if test="${model.providers != null && fn:length(model.providers)>1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															Providers:
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.provider}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<select id="filter_provider" name="provider" multiple="multiple" style="width:300px">
															<c:forEach var="provider" items="${model.providers}">
																<c:set var="provider2" value=",${provider}," />
																<option value="${provider }" ${fn:contains(allPrs, provider2)?'selected':'' }>
																	<c:out value="${onepay:providerCode2Text(provider)}"/>
																</option>
															</c:forEach>
														</select>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
												<c:set var="allMcs" value="," />
												<c:forEach var="mc" items="${paramValues.merchant}">
													<c:set var="allMcs" value="${allMcs}${mc}," />
												</c:forEach>
												<div class="filter_row">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">Merchant:</label>
													</div>
													<div class="clear"></div>
													<div>
													<select id="filter_merchant" name="merchant" multiple="multiple" style="width:300px">
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
																<c:out value="${merchant}"/>
															</option>
														</c:forEach>
													</select>
													<input id="searchMerchant" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
													</div>
												</div>
											</c:if>
											<!-- .field-group -->
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															Nhà mạng:
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allCts" value="," />
														<c:forEach var="ct" items="${paramValues.type}">
															<c:set var="allCts" value="${allCts}${ct}," />
														</c:forEach>
														<select id="filter_card_type" name="type" multiple="multiple" style="width:300px">
														<c:forEach var="type" items="${model.types}">
															<c:set var="type2" value=",${type.key}," />
															<option value="${type.key}" ${fn:contains(allCts, type2)?'selected':'' }>
																<c:out value="${type.value}"/>
															</option>
														</c:forEach>
														</select>
													</div>
												</div>
											</div>
											<c:if test="${model.amounts != null && fn:length(model.amounts) >1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															Mệnh giá:
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allAmounts" value="," />
														<c:forEach var="amount" items="${paramValues.amount}">
															<c:set var="allAmounts" value="${allAmounts}${amount}," />
														</c:forEach>
														<select id="filter_card_amount" name="amount" multiple="multiple" style="width:300px">
														<c:forEach var="amount" items="${model.amounts}">
															<c:set var="amount2" value=",${amount}," />
															<option value="${amount}" ${fn:contains(allAmounts, amount2)?'selected':'' }>
																<c:out value="${amount}"/>
															</option>
														</c:forEach>
														</select>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<div class="filter_row">
												<input class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
											</div>
											<!-- .actions -->
										</div>
										<!-- .widget-content -->
									</div>
								</form>
								<c:choose>
									<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
									<script type="text/javascript">
										$(document).ready(function() {
											/* $('#prvChkAll').click();
											$('#mcChkAll').click();
											$('#ctChkAll').click(); */
											$('#filter_locketqua').find('.field').each(function() {
												$(this).find('input[type=checkbox]').prop('checked', true);
											});
										});
									</script>
									</c:when>
									<c:otherwise>
										<c:if test="${param.prvChkAll == 'prvChkAll' }">
										<script type="text/javascript">
										$(document).ready(function() {
											$('#prvChkAll').attr('checked', 'checked');
										});
										</script>									
										</c:if>
										<c:if test="${param.mcChkAll == 'mcChkAll' }">
										<script type="text/javascript">
										$(document).ready(function() {
											$('#mcChkAll').attr('checked', 'checked');
										});
										</script>									
										</c:if>
										<c:if test="${param.ctChkAll == 'ctChkAll' }">
										<script type="text/javascript">
										$(document).ready(function() {
											$('#ctChkAll').attr('checked', 'checked');
										});
										</script>									
										</c:if>
									</c:otherwise>
								</c:choose>
							</div>
               				
               				<div class="srv_row">
               					<%
								if(!account.checkRole(Account.ACCOUNT_CUSTOMER_CARE_ROLE)){
								%>
								<c:if test="${!MBIZ}">
               					<strong>Sản lượng:</strong> <fmt:formatNumber var="money" value="${model.sumary[1]}" currencyCode="vnd" /><c:out value="${money}"/> đ &nbsp;<img id="myTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: bottom; margin-right: 5px;" width="16px"/>| 
               					<strong>Giao dịch:</strong> <fmt:formatNumber var="totalItems" value="${model.sumary[0]}" currencyCode="vnd" /><c:out value="${totalItems}" />
               					</c:if>
               					<%} %>
               					<script type="text/javascript" language="javascript">
									$(document).ready(function() {
							
										$("#myTip").qtip({
											content: 'Sản lượng: Tổng số tiền mệnh giá nhà mạng thu khách hàng đầu cuối.',
											position : {
												corner : {
													target : 'topRight',
													tooltip : 'bottomLeft'
												}
											},
											style : {
												name : 'cream',
												tip : 'bottomLeft',
												border : {
													width : 1,
													radius : 12,
													color : '#F49105'
												},
												color : '#fff',
												background : '#F49105'
											}
										});
									});
								</script>
								
								<c:if test="${model.total > 0}">
									<a href="" class="export_link"><span>Export files</span></a>
									<script type="text/javascript">
										$(document).ready(function() {
											var href = document.URL + '';
											if(href.indexOf('?') > 0)
												href += '&export=true';
											else 
												href += '?export=true';
											$('.export_link').attr('href', href);
											
											$('.export_link').live('click', function() {
												if(!confirm('Chức năng này chỉ cho phép xuất tối đa 10 trang kết quả tra cứu!\nBạn có đồng ý xuất file excel?'))
													return false;
												
												return true;
											});
										});
									</script>
								</c:if>
               				</div>
               				<div class="srv_row">
								<display:table name="model.list" id="list" 
												requestURI="iac-report.html" 
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
								    <display:column title="Nhà mạng" headerClass="transhead" class="transdata" property="telco" style="border: 1px solid #CCC;" />
								    <display:column title="Thuê bao" headerClass="transhead" class="transdata" property="msisdn" style="border: 1px solid #CCC;" />
								    <display:column title="Mã Game" headerClass="transhead" class="transdata" property="command" style="border: 1px solid #CCC;" />
								    <display:column title="Amount" headerClass="transhead" class="transdata" property="amount" style="border: 1px solid #CCC;" />
								    <display:column title="MO" headerClass="transhead" class="transdata" property="moMessage" style="border: 1px solid #CCC;" />
								    <display:column title="MT" headerClass="transhead" class="transdata" property="mtMessage" style="border: 1px solid #CCC;" />
								    <display:column title="Thời gian" headerClass="transhead" class="transdata" property="requestTime" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
								    <display:column title="CDR" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
										<c:choose>
											<c:when test="${list.billingStatus == '1' }">
												<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Tính cước" />
											</c:when>
											<c:otherwise>
												<img border="0" src="<%=request.getContextPath()%>/images/error.png" class="error_icon" title='${empty list.merchantRespMessage ? 'Không tính cước': list.merchantRespMessage }' />
											</c:otherwise>
										</c:choose>
								    </display:column>
								    <display:column title="Status" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
										<c:choose>
											<c:when test="${list.status == '1' }">
												<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Thành công" />
											</c:when>
											<c:otherwise>
												<img border="0" src="<%=request.getContextPath()%>/images/error.png" class="error_icon" title="Không thành công" />
											</c:otherwise>
										</c:choose>
								    </display:column>
								</display:table>
								<!-- 
								<script type="text/javascript">
									$(document).ready(function() {
										$('.error_icon').each(function() {
											if($(this).attr('title').indexOf('{') >= 0) {
												var err = eval ("(" + $(this).attr('title') + ")");
												var mess = err.sms + '. Trạng thái: ' + (err.status == 0?'Không tính cước':'Tính cước');
												$(this).attr('title', mess);
											}
										});
									});
								</script>
								 -->
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
