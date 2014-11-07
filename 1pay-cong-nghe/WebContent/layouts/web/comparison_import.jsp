<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, vn.onepay.comparison.model.ComparisonInfo" %>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
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
<script type="text/javascript">
$(function(){
	$("#filter_merchant").multiselect({
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
						<!-- Left Menu -->
						<%request.setAttribute("comparisonNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">Import đối soát</h1>
								<div>
									<form id="import_comparison" action="import_comparison.html" method="post">
										<input type="hidden" name="action" value="import"/>
										<!-- .widget-header -->
											<div class="box_locketqua">
												<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
													<c:set var="allMcs" value="," />
													<c:forEach var="mc" items="${paramValues.merchant}">
														<c:set var="allMcs" value="${allMcs}${mc}," />
													</c:forEach>
												<div class="filter_row">
													<span style="padding-left:40px; display:inline-block; width:100px;">Merchant:</span>
													<select id="filter_merchant" name="merchant" multiple="multiple" class="dashboard_filter">
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
																<c:out value="${merchant}"/>
															</option>
														</c:forEach>
													</select>
												</div>
												</c:if>
												<div class="filter_row">
								                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Tháng:</span>
								                 	<select id="month" name="month" class="dashboard_filter">
								                 		<option value="" ${(param.month == null || param.month == '')?'selected="selected"':''}>Tất cả</option>
								                 		<option value="1" ${(param.month == '1')?'selected="selected"':''}>Tháng 1</option>
								                 		<option value="2" ${(param.month == '2')?'selected="selected"':''}>Tháng 2</option>
								                 		<option value="3" ${(param.month == '3')?'selected="selected"':''}>Tháng 3</option>
								                 		<option value="4" ${(param.month == '4')?'selected="selected"':''}>Tháng 4</option>
								                 		<option value="5" ${(param.month == '5')?'selected="selected"':''}>Tháng 5</option>
								                 		<option value="6" ${(param.month == '6')?'selected="selected"':''}>Tháng 6</option>
								                 		<option value="7" ${(param.month == '7')?'selected="selected"':''}>Tháng 7</option>
								                 		<option value="8" ${(param.month == '8')?'selected="selected"':''}>Tháng 8</option>
								                 		<option value="9" ${(param.month == '9')?'selected="selected"':''}>Tháng 9</option>
								                 		<option value="10" ${(param.month == '10')?'selected="selected"':''}>Tháng 10</option>
								                 		<option value="11" ${(param.month == '11')?'selected="selected"':''}>Tháng 11</option>
								                 		<option value="12" ${(param.month == '12')?'selected="selected"':''}>Tháng 12</option>
								                 	</select>
								                 	Năm:
								                 	<select id="year" name="year" class="dashboard_filter">
								                 		<option value="" ${(param.year == null || param.year == '')?'selected="selected"':''}>Tất cả</option>
								                 		<option value="2012" ${(param.year == '2012')?'selected="selected"':''}>2012</option>
								                 		<option value="2013" ${(param.year == '2013')?'selected="selected"':''}>2013</option>
								                 		<option value="2014" ${(param.year == '2014')?'selected="selected"':''}>2014</option>
								                 		<option value="2015" ${(param.year == '2015')?'selected="selected"':''}>2015</option>
								                 		<option value="2016" ${(param.year == '2016')?'selected="selected"':''}>2016</option>
								                 		<option value="2017" ${(param.year == '2017')?'selected="selected"':''}>2017</option>
								                 		<option value="2018" ${(param.year == '2018')?'selected="selected"':''}>2018</option>
								                 	</select>
								                </div>
								                <div class="filter_row">
								                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Chu kỳ đối soát:</span>
								                 	<select id="paymentPolicy" name="paymentPolicy" class="dashboard_filter">
								                 		<option value="15_1_1" ${(param.paymentPolicy == '15_1_1')?'selected="selected"':''}>15+1(Kỳ 1)</option>
								                 		<option value="15_1_2" ${(param.paymentPolicy == '15_1_2')?'selected="selected"':''}>15+1(Kỳ 2)</option>
								                 		<option value="30_1" ${(param.paymentPolicy == '30_1')?'selected="selected"':''}>30+1</option>
								                 		<option value="30_15" ${(param.paymentPolicy == '30_15')?'selected="selected"':''}>30+15</option>
								                 	</select>
								                 </div>
												<div class="filter_row">
													<span class="add-on" style="padding-left:40px; display:block; width:100px;">
														<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Tạo đối soát" />
													</span>
												</div>
												<!-- .actions -->
												<c:if test="${param.month==null}">
													<script type="text/javascript">
													$(function(){
														var currentMonth = (new Date).getMonth() + 1;
														var currentDate = (new Date).getDate();
														if(currentDate<15){
															currentMonth=currentMonth-1;
														}
														$("#month").val(currentMonth);
													});
													</script>
												</c:if>
												<c:if test="${param.year==null}">
													<script type="text/javascript">
													$(function(){
														var currentYear = (new Date).getYear() + 1900;
														$("#year").val(currentYear);
													});
													</script>
												</c:if>	
											<!-- .widget-content -->
											</div>
											<span style="color: red"><strong><c:out value="${model.exception }"/></strong></span>
									</form>
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
</body>
</html>
