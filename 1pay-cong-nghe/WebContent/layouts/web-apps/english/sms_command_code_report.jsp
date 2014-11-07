<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	$("#filter_provider").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
});
</script>

</head>

<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("smsCmdNavMenu",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						<div class="right_content">
				            <h1 class="srv_title">Theo dõi mã sms</h1>
				            <form action="sms-command-code-report.wss" method="post">
									<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<div class="box_locketqua">
											<div class="filter_row">
			
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
												<div class="product_slc_filter">
													<label class="product_lbl_filter">Merchant:</label> 
													<input id="searchMerchant" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
												</div>
												<div class="product_slc_filter">
													<label class="product_lbl_filter">CommandCode:</label> 
													<input id="commandCode" name="commandCode" value="${param.commandCode }" class="dashboard_filter" placeholder="Nhập Command Code"/>
												</div>
												<div class="product_slc_filter">
													<label class="product_lbl_filter">Status:</label> 
													<select name="status" class="product_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
														<c:forEach  var="status" items="${model.status }">
															<option value="${status}" ${param.status == status?'selected="selected"':''}>
																<c:out value="${status }"/>
															</option>
														</c:forEach>
													</select>
												</div>
											</div>	
											<div class="filter_row">
												<c:if test="${model.providers != null && fn:length(model.providers)>1 }">
												<div class="product_slc_filter">
													<label class="product_lbl_filter">Provider:</label> 
													<select  name="provider" class="product_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
														<c:forEach var="provider" items="${model.providers}">
															<option value="${provider}" ${param.provider == provider?'selected="selected"':''}>
																<c:out value="${onepay:providerCode2Text(provider)}"/>
															</option>
														</c:forEach>
													</select>
												</div>
												</c:if>
											</div>			
											<div class="filter_row">
												<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submit" />
											</div>
									</div>
					               <div class="srv_row">
					               		<c:if test="${model.total>0 }">
							            	<div id="dash_tab">
											<a href="<%=request.getContextPath() %>/console/export-sms-command.wss?reservation=${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}&amp;searchMerchant=${param.searchMerchant }&amp;commandCode=${param.commandCode }&amp;status=${param.status }&amp;provider=${param.provider }" class="export_link"><span>Export files</span></a>
											</div>
										</c:if>
					               		<script>var rownum = 1;</script>
					                	<display:table name="model.list" id="list" 
															requestURI="sms-command-code-report.wss" 
															pagesize="${model.pagesize}" partialList="true" size="model.total"
															style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
															sort="list">
												<%@ include file="display_table.jsp" %>
												<display:column title="STT" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
														<c:out value="${model.offset + list_rowNum }" />
											    </display:column>
											    <display:column title="Merchant" headerClass="transhead" class="svr_data1" property="merchant" style="border: 1px solid #CCC;" />
												<display:column title="ServiceID" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;" >
													<c:out value="${list.sms_charging.provider}"/>
												</display:column>
												<display:column title="Short Code" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;" >
													<c:forEach var="shortCode" items="${list.sms_charging.shortcodes}">
														<c:out value="${shortCode}"/>, 
													</c:forEach>
												</display:column>
												<display:column title="CMD" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;" >
													<c:out value="${list.sms_charging.command}"/>
												</display:column>
												<display:column title="MT" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;" >
													<c:out value="${list.sms_charging.default_mt}"/>
												</display:column>
												<display:column title="Created Time" headerClass="transhead" class="transdata" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
												<display:column title="Status" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:left;">
												<c:choose>
													<c:when test="${list.sms_charging.status == 'approved' }">
														<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã duyệt" />
													</c:when>
													<c:when test="${list.sms_charging.status == 'pending' }">
														<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ duyệt" />
													</c:when>
													<c:when test="${list.sms_charging.status == 'reject' }">
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Từ chối" />
													</c:when>
													<c:otherwise>
													</c:otherwise>
												</c:choose>
										    </display:column>
										</display:table>
					               </div>
				            </form>
				         </div>
					</div>
				</div>
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
		<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>
</body>

</html>