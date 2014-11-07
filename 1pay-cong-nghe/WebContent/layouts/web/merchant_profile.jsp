<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>

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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

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
						<!-- Left Menu -->
						<%request.setAttribute("merchantNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<!-- Right Content -->
						<div class="right_content">
							<h1 class="srv_title">Running Profile của <b>${model.merchantProfile.merchant}</b></h1>
							<div class="srv_row">
								<span style="color: red"><form:errors path="*"/></span>
							</div>
                			<div class="srv_row">
       	    					<table cellpadding="5" cellspacing="0">
									<tbody>
									<tr>
										<td class="profile_label" width="200">Mã đối tác:</td>
										<td>
	                                        <b>${model.merchantProfile.merchant}</b>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Tên đối tác:</td>
										<td>
	                                        <b>${model.merchantProfile.merchantName}</b>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Mã hợp đồng:</td>
										<td>
	                                        <b>${model.merchantProfile.contractNo}</b>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Ngày ký hợp đồng:</td>
										<td>
	                                        <b>${model.contract_date}</b>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Chu kỳ thanh toán:</td>
										<td>
	                                        <b>${model.merchantProfile.paymentPolicy}</b>
                                        </td>
									</tr>
						   			</tbody>
						   		</table>
                           </div>
                           
                    	<!-- Telco of CARD service -->
                			<table width="100%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse">
	                       			<tr>
									    <th scope="col">Dịch vụ</th>
									    <th scope="col">#</th>
									    <th scope="col">Nhà mạng</th>
									    <th scope="col">Doanh thu</th>
									    <th scope="col">Tỷ lệ</th>
									  </tr>
	                       			<!-- CARD -->
	                       			<c:forEach items="${model.ls_card_telco}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_card_telco_number}">
													<span  id="td-stt-${i.index+1}">CARD</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /CARD -->
									<!-- SMS -->
									<c:forEach items="${model.ls_sms_telco}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_sms_telco_number}">
													<span  id="td-stt-${i.index+1}">SMS</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /SMS -->
									<!-- WAP -->
									<c:forEach items="${model.ls_wap_telco}" var="card_telco" varStatus="i">
	                       				<c:if test="${i.count=='1'}">
			                       			<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center" rowspan="${model.ls_wap_telco_number}">
													<span  id="td-stt-${i.index+1}">SMS</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
												<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
										<c:if test="${i.count>'1'}">
											<tr id="row-index-${i.index+1}" >
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-stt-${i.index+1}">${i.index+1}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<span  id="td-nhamang-${i.index+1}">${card_telco.telco}</span>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														<fmt:formatNumber value="${card_telco_.amount}" var="card_telco_amount" currencyCode="vnd" />
														<c:out value="${card_telco_amount}"></c:out><br>
													</c:forEach>
												</td>
												<td class="svr_data" style="padding: 8px" align="center">
													<c:forEach items="${card_telco.rates}" var="card_telco_" varStatus="i">
														${card_telco_.rate}<br>
													</c:forEach>
												</td>
											</tr>
										</c:if>
									</c:forEach>
									<!-- /WAP -->
                     		</table>
                    	<!-- /Telco of CARD service -->
						</div>
						<!-- /Right Conent -->
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
