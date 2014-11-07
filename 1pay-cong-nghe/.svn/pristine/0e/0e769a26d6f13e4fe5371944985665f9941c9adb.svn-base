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
						<%request.setAttribute("cardSummary", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Thống kê</h1>
							<form action="card-summary.html" method="post">
								<div>
									<div id="dash_tab">
											<a id="cont" href="#" class="tab_slc"><span>Card Charing</span></a> 
											<a id="telco" href="#" class="tab"><span>SMS Charing</span></a> 
											<a id="price" href="#" class="tab"><span>WAP Charing</span></a>
											<div class="clear"></div>
									</div>
									<div id="filter_locketqua">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Lọc kết quả</a></h3>
										<!-- .widget-header -->
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
														});
													});
												</script>
											</div>
											
											<!-- .field-group -->
											<c:if test="${model.providers != null && fn:length(model.providers)>1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="prvChkAll" name="prvChkAll" value="prvChkAll" /> Payment Provider
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#prvChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.provider}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="provider" items="${model.providers}">
															<c:set var="provider2" value=",${provider}," />
															<input type="checkbox" name="provider" class="chck_filter" value="${provider}" 
																				title="${provider}" 
																				${fn:contains(allPrs, provider2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${provider}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="mcChkAll" name="mcChkAll" value="mcChkAll" /> Merchant
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#mcChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.merchant}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<input type="checkbox" name="merchant" class="chck_filter" value="${merchant}" 
																				title="${merchant}" 
																				${fn:contains(allPrs, merchant2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${merchant}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											</c:if>
											<!-- .field-group -->
											<div class="filter_row">
												<div class="field">
													<div style="padding-bottom: 5px; overflow: hidden;">
														<label class="lbl_chckmain">
															<input type="checkbox" id="ctChkAll" name="ctChkAll" value="ctChkAll" /> Card Type
															<script type="text/javascript">
																$(document).ready(function(){
																	$('#ctChkAll').click(function() {
																		$(this).closest('.field').find('input[type=checkbox]').prop('checked', this.checked);
																	});
																});
															</script>
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allPrs" value="," />
														<c:forEach var="pr" items="${paramValues.type}">
															<c:set var="allPrs" value="${allPrs}${pr}," />
														</c:forEach>
														<c:forEach var="type" items="${model.types}">
															<c:set var="type2" value=",${type}," />
															<input type="checkbox" name="type" class="chck_filter" value="${type}" 
																				title="${type}" 
																				${fn:contains(allPrs, type2)?'checked="checked"':'' } />
															<label class="lbl_chcksub"><c:out value="${type}" /></label>
														</c:forEach>
													</div>
												</div>
											</div>
											<!-- .field-group -->
											<div class="filter_row">
												<input class="btn_greensmall" type="submit" name="submit" value="Thống kê" />
											</div>
											<!-- .actions -->
										</div>
										<!-- .widget-content -->
									</div>
								</div>
								<div class="srv_row">
	               					<strong>Total amount:</strong> <fmt:formatNumber var="money" value="${model.sumary[1]}" currencyCode="vnd" /><c:out value="${money}"/> đ | 
	               					<strong>Total items:</strong> <fmt:formatNumber var="count" value="${model.sumary[0]}" currencyCode="vnd" /><c:out value="${count}" />
	               				</div>
								<div class="srv_row">
									<table style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;">
										<thead>
										<tr>
											<th class="transhead">Merchant</th>
											<th class="transhead">CardType</th>
											<th class="transhead">Amount</th>
										</tr>
										</thead>
										<c:forEach var="merchant" items="${model.merchantsSlc}">
											<c:set var="sum" value="0" />
											<tr>
												<td rowspan="${fn:length(model.typesSlc) + 1}" valign="top" style="border-right:1px solid #E3E3E3;" class="transdata">
													<c:out value="${merchant}" />
												</td>
											</tr>
											<c:forEach var="type" items="${model.typesSlc}">
											<tr>
												<td class="transdata">
													<c:out value="${type}" />
												</td>
												<td align="right" class="transdata">
													<c:set var="sum" value="${sum + model.merchantModel[merchant][type]}" />
													<fmt:formatNumber var="money" value="${model.merchantModel[merchant][type]}" currencyCode="vnd" />
													<c:out value="${money}"/>
												</td>
											</tr>
											</c:forEach>
											<tr>
												<td colspan="3" align="right" class="transdata">
													<fmt:formatNumber var="sumFm" value="${sum}" currencyCode="vnd" />
													<strong><c:out value="${sumFm}"/></strong>
												</td>
											</tr>
										</c:forEach>
									</table>
								</div>
							</form>
							<c:choose>
								<c:when test="${param.submit==null || fn:length(param.submit) == 0 }">
								<script type="text/javascript">
									$(document).ready(function() {
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
