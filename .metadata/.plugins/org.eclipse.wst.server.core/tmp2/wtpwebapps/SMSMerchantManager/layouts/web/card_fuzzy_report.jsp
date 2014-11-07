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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<jsp:include page="merchant-refund.css.jsp" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('content_info'); });
</script>

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
						<!-- Left Menu -->
						<%request.setAttribute("mcRefundNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Tra cứu thẻ lỗi giao dịch hoặc nghi vấn</h1>
							<div>
								<form id="fuzzyCardReport" action="card-fuzzy-report.html" method="get">
									<div id="filter_locketqua">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Lọc kết quả</a></h3>
										<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<div class="other_filter">
													<label class="lbl_dash_filter">Trạng thái:</label> 
													<select name="status" class="dashboard_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected':''}>
															Tất cả
														</option>
														<c:forEach var="st" items="${model.status}">
															<option value="${st}" ${param.status == st?'selected':''}>
																<c:choose>
																	<c:when test="${st == 'success' }">
																		Xử lý thành công
																	</c:when>
																	<c:when test="${st == 'error' }">
																		Lỗi giao dịch
																	</c:when>
																	<c:otherwise>
																	</c:otherwise>
																</c:choose>
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
							                 	<span class="add-on">Serial thẻ:</span>
							               		<input type="text" name="serial" value="${param.serial}" class="txt_filter" />
							                </div>
							                
							                <!-- .field-group -->
											<c:if test="${model.cardProviders != null && fn:length(model.cardProviders)>1 }">
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
															<c:forEach var="provider" items="${model.cardProviders}">
																<c:set var="provider2" value=",${provider}," />
																<option value="${provider }" ${fn:contains(allPrs, provider2)?'selected':'' }>
																	<c:out value="${provider}"/>
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
															Card Type:
														</label>
													</div>
													<div class="clear"></div>
													<div>
														<c:set var="allCts" value="," />
														<c:forEach var="ct" items="${paramValues.type}">
															<c:set var="allCts" value="${allCts}${ct}," />
														</c:forEach>
														<select id="filter_card_type" name="type" multiple="multiple" style="width:300px">
														<c:forEach var="type" items="${model.cardTypes}">
															<c:set var="type2" value=",${type}," />
															<option value="${type}" ${fn:contains(allCts, type2)?'selected':'' }>
																<c:out value="${type}"/>
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
							</div>
							<div class="srv_row">
               					<strong>Sản lượng:</strong> <fmt:formatNumber var="money" value="${model.sumary[1]}" currencyCode="vnd" /><c:out value="${money}"/> đ &nbsp;<img id="myTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: bottom; margin-right: 5px;" width="16px"/>|
               					<strong>Giao dịch:</strong> <fmt:formatNumber var="totalItems" value="${model.sumary[0]}" currencyCode="vnd" /><c:out value="${totalItems}" />
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
               				</div>
               				
							<div class="srv_row">
								<script>var rownum = 1;</script>
								<display:table name="model.list" id="list" 
												requestURI="card-fuzzy-report.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
												sort="list">
									<%@ include file="display_table.jsp" %>
									<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
										<span id="row${list.id}" class="rowid">
											<!-- <script>document.write(rownum++);</script> -->
											<c:out value="${model.offset + list_rowNum }" />
										</span>
								    </display:column>
								    <% if(account.checkRoles(new String[]{Account.ACCOUNT_ADMIN_ROLE, Account.ACCOUNT_OPERATION_MANAGER_ROLE, Account.ACCOUNT_REPORTER_ROLE, Account.ACCOUNT_SHARE_HOLDER_ROLE, Account.ACCOUNT_CUSTOMER_CARE_ROLE})){%>
								    <display:column title="Provider" headerClass="transhead" property="provider" class="transdata" style="border: 1px solid #CCC;" />
								    <%} %>
								    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
								    <display:column title="Card Type" headerClass="transhead" class="transdata" property="type" style="border: 1px solid #CCC;" />
								    <display:column title="Serial" headerClass="transhead" class="transdata" property="serial" style="border: 1px solid #CCC;" />
								    <display:column title="Pin" headerClass="transhead" class="transdata" property="pin" style="border: 1px solid #CCC;" />
								    <display:column title="Amount" headerClass="transhead" class="transdata" property="amount" style="border: 1px solid #CCC;text-align:right;" format="{0,number,0,000} đ" />
								    <display:column title="Created Time" headerClass="transhead" class="transdata" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
								    <display:column title="Updated Time" headerClass="transhead" class="transdata" property="modified_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
								    <display:column title="Seq" headerClass="transhead" class="transdata" property="sequence" style="border: 1px solid #CCC;text-align:right;"/>
								    <display:column title="Status" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
										<c:choose>
											<c:when test="${list.status == '00' }">
												<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Thành công" />
											</c:when>
											<c:when test="${list.status == '02' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ không hợp lệ hoặc đã được sử dụng" />
											</c:when>
											<c:when test="${list.status == '07' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ đã được sử dụng, hoặc thẻ sai" />
											</c:when>
											<c:when test="${list.status == '08' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ bị khóa" />
											</c:when>
											<c:when test="${list.status == '09' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ hết hạn sử dụng." />
											</c:when>
											<c:when test="${list.status == '10' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ chưa được kích hoạt hoặc không tồn tại." />
											</c:when>
											<c:when test="${list.status == '11' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Mã thẻ sai định dạng." />
											</c:when>
											<c:when test="${list.status == '12' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Sai số serial của thẻ." />
											</c:when>
											<c:when test="${list.status == '13' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Mã thẻ và số serial không khớp" />
											</c:when>
											<c:when test="${list.status == '14' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ không tồn tại" />
											</c:when>
											<c:when test="${list.status == '15' }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Thẻ không sử dụng được." />
											</c:when>
											<c:otherwise>
												<c:choose>
													<c:when test="${account_logined.isStaff()}">
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title='${list.status}'/>
													</c:when>
													<c:otherwise>
														<img border="0" src="<%=request.getContextPath()%>/images/error.png" title='Không thành công' />
													</c:otherwise>
												</c:choose>
											</c:otherwise>
										</c:choose>
								    </display:column>
								    <%-- <display:column title="Message" headerClass="transhead" class="transdata" property="message" maxLength="20" style="border: 1px solid #CCC;" /> --%>
								    <%-- <display:column title="Pin" property="pin" /> --%>
								    
								    <display:column title="Action" headerClass="transhead" class="transdata"  style="border: 1px solid #CCC;text-align:center;">
									    <fmt:formatNumber type="number" groupingUsed="false" value="${list.amount}" var="amount2"/>
									    <fmt:formatDate value="${list.created_time}" pattern="dd/MM/yyyy HH:mm:ss" var="created_time" />
									    <fmt:formatDate value="${list.modified_time}" pattern="dd/MM/yyyy HH:mm:ss" var="updated_time" />
									    
									    <c:choose>
									    	<c:when test="${list.resolved_status == true}">
									    		<a href="javascript:void(0);" onclick="alert('Đã lập phiếu chăm sóc khách hàng')">
									    			<img border="0" src="<%=request.getContextPath()%>/images/com_actived.png" title='Đã lập phiếu chăm sóc khách hàng' />
									    		</a>
									    	</c:when>
									    	
									    	<c:otherwise>
									    		<a href="#add_record_popup" rel="leanmodal" class="transform_record_popup"
									    				cardFuzzyID="${list.id}" merchant="${list.merchant}" service="CARD" 
									    				telco="${list.type}" amount="${amount2}" message="${list.message }" 
									    				type="1" title="" provider= "${list.provider}" 
										    			serial="${list.serial}" created_time="${created_time}"
										    			sequence="${list.sequence}" pin="${list.pin}"
										    			app_code="${list.app_code}" updated_time="${updated_time}"
										    			
										    	>
										    		<img border="0" src="<%=request.getContextPath()%>/images/doc_hopdong.png" title='Lập phiếu chăm sóc khách hàng' />
										    	</a>
									    	</c:otherwise>
									    </c:choose>
								    	
								    </display:column>
								</display:table>
								
								<!-- Add popup -->
								<jsp:include page="merchant-refund-add-edit-popup.jsp" />
								
								<!-- / Add popup -->
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
