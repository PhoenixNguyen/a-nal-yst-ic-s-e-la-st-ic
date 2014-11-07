<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
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
						<%request.setAttribute("wallet", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<table>
								<tr>
									<td>
										<h3>Số dư:</h3> 
									</td>
									<td>
										<fmt:formatNumber value="${model.walletAccount.balance}" var="totalTransSummaryFmt" currencyCode="vnd" />
										<h1><c:out value="${totalTransSummaryFmt}" /> VND</h1>
									</td>
								</tr>
							</table>
							<div>
								<div>
									<h3>Giao dịch theo giờ gần nhất</h3>
									<div class="srv_row">
										<script>var rownum = 1;</script>
										<display:table name="model.transactions" id="list" 
													requestURI="wallet.html" 
													pagesize="${model.pagesize}" partialList="true" size="model.total"
													style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
													sort="list">				
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead" class="transdata" style="text-align:right">
												<span id="row${list.id}" class="rowid">
													<!-- <script>document.write(rownum++);</script> -->
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <display:column headerClass="transhead" class="transdata" title="Thời gian" property="ctime" format="{0,date,yyyy-MM-dd hh:mm:ss}" />
										    <display:column headerClass="transhead" class="transdata" title="Mô tả" property="transactionContent" />
										    <display:column headerClass="transhead" class="transdata" title="Trạng thái" property="transactionStatus" />
										    <display:column headerClass="transhead" class="transdata" title="Số tiền">  <!-- property="balance" format="{0,number,+}" -->
										    	<c:choose>
										    		<c:when test="${fn:containsIgnoreCase(list.transactionContent, 'SMS')}">
										    			<img src="<%=request.getContextPath()%>/images/icon_sms.gif" />
										    		</c:when>
										    		<c:when test="${fn:containsIgnoreCase(list.transactionContent, 'WAP')}">
										    			<img src="<%=request.getContextPath()%>/images/icon_wap.gif" />
										    		</c:when>
										    		<c:otherwise>
										    			<img src="<%=request.getContextPath()%>/images/icon_card.gif" />
										    		</c:otherwise>
										    	</c:choose>
										    	<fmt:formatNumber var="transactionAmount" value="${list.transactionAmount}" currencyCode="vnd" />
										    	<span style="float:right;">+<c:out value="${transactionAmount}" /> đ</span>
										    </display:column>
										</display:table>
									</div>
								</div>
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
