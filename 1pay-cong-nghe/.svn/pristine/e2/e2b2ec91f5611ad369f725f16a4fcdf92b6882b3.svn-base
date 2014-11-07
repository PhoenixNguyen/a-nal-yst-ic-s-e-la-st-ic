<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<jsp:include page="merchant-refund.css.jsp" />

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
 -->
 
 <style >
 	/* #acc_log table tr td{
 		border: 1px solid #CCC;
 		font-size: 14px;
		padding: 8px;
		background: #F9F9F9;
 	} */
 	
 	.info tr td{
 		border: 1px solid #CCC;
 		font-size: 14px;
		padding: 8px;
		
 	}
 	
 	.info tr th{
 		border: 1px solid #CCC;
 		font-size: 14px;
		padding: 8px;
		background: #F9F9F9;
 	}
 </style>
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	
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
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<%-- <jsp:include page="include_personal_bar.jsp" /> --%>
						<!-- Left Menu -->
						<%request.setAttribute("merchantRefund", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Hỗ trợ chăm sóc khách hàng</h1>
							
							<div id="acc_log" class="srv_row">
								<a href="javascript:history.back();" class="action_record" style="margin-right: 5px; margin-bottom: 5px;"><span>Quay lại</span></a>
								
								<fmt:formatNumber maxFractionDigits="3" value="${model.merchantRefund.amount }" var="amount"/>
								<fmt:formatNumber maxFractionDigits="3" value="${model.merchantRefund.revenueA }" var="revenueA"/>
								<fmt:formatNumber maxFractionDigits="3" value="${model.merchantRefund.revenue }" var="revenue"/>
								<fmt:formatDate value="${model.merchantRefund.created_time }" var="created_time" pattern="dd/MM/yyyy HH:mm:ss"/>
								<fmt:formatDate value="${model.merchantRefund.updated_time }" var="updated_time" pattern="dd/MM/yyyy HH:mm:ss"/>
								
								<table width="100%" >
									<tr>
										<td width="20%"><span class="">Tiêu đề:</span></td>
										<td ><span class=""><b>${model.merchantRefund.title }</b></td>
									</tr>
									
									<tr>
										<td><span class="">Tên merchant:</span></td>
										<td ><span class="">${model.merchantRefund.merchant }</td>
									</tr>
									<tr>
										<td ><span class="">Nhà cung cấp:</span></td>
										<td ><span class="">${model.merchantRefund.provider }</td>
									</tr>
									
									<tr>
										<td ><span class="">Ngày tạo:</span></td>
										<td>${created_time }</td>
									</tr>
									<tr>
										<c:if test="${model.merchantRefund.status == 1}">
											<td ><span style="color: red;">Lý do từ chối:</span></td>
											<td style="color: red;">${model.merchantRefund.reject_reason}</td>
										</c:if>
									</tr>
								</table>
								
								<br/>
								<table width="100%" class="info">
									<tr>
										<th>Dịch vụ/Nhà mạng</th>
										<th title="Doanh thu khách hàng">DT khách hàng</th>
										<th title="Doanh thu chia sẻ">DT chia sẻ</th>
										<th title="Doanh thu merchant">DT merchant</th>
										<th>Kiểu tiền</th>
										<th>Trạng thái</th>
									</tr>
									<tr>
										<td>${model.merchantRefund.chargingService }/${model.merchantRefund.telco }</td>
										<td style="text-align: right;">${amount }</td>
										<td style="text-align: right;">${revenueA }</td>
										<td style="text-align: right;">${revenue }</td>
										<td style="text-align: center; font-size: 18px;">${model.merchantRefund.type == 0?'<span title="Giảm trừ">-</span>':'<span title="Giảm cộng">+</span>' }</td>
										<td style="text-align: center;">
											
											<c:if test="${model.merchantRefund.status == 0}">
												<img src="<%=request.getContextPath() %>/images/invalid.png" title="Chưa đề nghị" alt="" />
												<img src="<%=request.getContextPath() %>/images/invalid.png" title="Chưa duyệt" alt="" />
											</c:if>
											<c:if test="${model.merchantRefund.status == 2}">
												<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã đề nghị" alt="" />
												<img src="<%=request.getContextPath() %>/images/invalid.png" title="Chưa duyệt" alt="" />
											</c:if>
											<c:if test="${model.merchantRefund.status == 4}">
												<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã đề nghị" alt="" />
												<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã duyệt" alt="" />
											</c:if>
											<c:if test="${model.merchantRefund.status == 1}">
												<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã đề nghị" alt="" />
												<img src="<%=request.getContextPath() %>/images/com_reject.png" title="Đã từ chối" alt="" />
											</c:if>
										</td>
										
									</tr>
								</table>
								
								<br/>
								<table width="100%">
									<tr>
										<td>
											<b>Nội dung:</b>
										</td>
									</tr>
									<tr>
										<td style="background: #F9F9F9;">
										
											<div id="content" style="margin-left: 10px">
												<p style="background: #F9F9F9; padding: 5px;">
													${model.merchantRefund.description }
												</p>
											</div>
										</td>
										
									</tr>
									<tr>
										<td>
											<div id="log">
												<button>Xem log phiếu CSKH</button>
												<p style="background: #F9F9F9; padding: 15px;">
													<c:forEach items="${model.merchantRefund.logs }" var="item">
														<fmt:formatDate value="${item.created_time }" var="time1" pattern="dd/MM/yyyy HH:mm:ss"/>
														${time1 }: <b>${item.account }</b> 
														<c:if test="${item.action == 0}"> Khởi tạo phiếu</c:if>
														<c:if test="${item.action == 1}"> Sửa phiếu</c:if>
														<c:if test="${item.action == 2}"> Đề nghị phiếu</c:if>
														<c:if test="${item.action == 3}"> Duyệt phiếu</c:if>
														<c:if test="${item.action == 4}"> Từ chối phiếu</c:if>
														 
														<br/>
													</c:forEach>
													<%-- <c:set var="logs" value="${fn:split(model.merchantRefund.log, ',')}" />
													<c:set var="length" value="${fn:length(logs)}" />
													
													<c:forEach begin="0" end="${length }" var="item">
														${logs[item] } <br/>
														
													</c:forEach> --%>
													
												</p>
												
											</div>
										</td>
										
									</tr>
								</table>
								
								<script>
								$(document).ready(function(){
									$("#log p").hide();
								  $("#log button").click(function(){
								    $("#log p").toggle();
								  });
								  /* $("#content button").click(function(){
									    $("#content p").toggle();
									  }); */
								});
								</script>
								
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
