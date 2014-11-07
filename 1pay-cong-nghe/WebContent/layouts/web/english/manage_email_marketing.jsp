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
						<%request.setAttribute("cardReport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Quản lý Email Marketing</h1>
							<div>
								<form id="manageEmailMarketing" action="manage-email-marketing.html" method="post">
									<div class="dash_row">
										<c:choose>
											<c:when test="${param.tab=='active'}">
												<input type="hidden" name="tab" value="active" />
											</c:when>
											<c:when test="${param.tab=='inactive'}">
												<input type="hidden" name="tab" value="inactive" />
											</c:when>
											<c:otherwise></c:otherwise>
										</c:choose>
										<div id="dash_tab">
											<a href="<%=request.getContextPath()%>/protected/manage-email-marketing.html" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>Tất cả</span></a> 
											<a href="<%=request.getContextPath()%>/protected/manage-email-marketing.html?tab=inactive" class="tab${param.tab=='inactive'?'_slc':''}"><span>Chưa duyệt</span></a> 
											<a href="<%=request.getContextPath()%>/protected/manage-email-marketing.html?tab=active" class="tab${param.tab=='active'?'_slc':''}"><span>Đã được duyệt</span></a>
											<a href="<%=request.getContextPath()%>/protected/manage-email-marketing.html?tab=reject" class="tab${param.tab=='reject'?'_slc':''}"><span>Từ chối</span></a>
											<a href="<%=request.getContextPath()%>/protected/email-marketing.html" class="addproduct_link"><span>Tạo Email</span></a>
											<div class="clear"></div>
										</div>
									</div>
									<div id="filter_locketqua">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Lọc kết quả</a></h3>
										<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<c:if test="${param.tab == null || param.tab == ''}">
												<div class="other_filter">
													<label class="lbl_dash_filter">Trạng thái:</label> 
													<select name="status" class="dashboard_filter">
														<option value="" ${(param.status == null || param.status == '')?'selected':''}>
															Tất cả
														</option>
														<option value="0" ${ param.status == '0'?'selected':''}>
															Đề nghị
														</option>
														<option value="2" ${ param.status == '2'?'selected':''}>
															Đã duyệt và gửi
														</option>
														<option value="1" ${ param.status == '1'?'selected':''}>
															Từ chối
														</option>
													</select>
												</div>
												</c:if>
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
							                 	<span class="add-on">Chủ đề:</span>
							               		<input type="text" name="subject" value="${param.subject}" class="txt_filter" />
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">Nội dung:</span>
							               		<input type="text" name="body" value="${param.body}" class="txt_filter" />
							                </div>
							                
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
								<script>var rownum = 1;</script>
								<display:table name="model.list" id="list" 
												requestURI="manage-email-marketing.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
												sort="list">
									<%@ include file="display_table.jsp" %>
									<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
										<span id="row${list.id}" class="rowid">
											<!-- <script>document.write(rownum++);</script> -->
											<c:out value="${model.offset + list_rowNum }" />
										</span>
								    </display:column>
								    <display:column title="Người tạo" headerClass="transhead" class="transdata" property="owner" style="border: 1px solid #CCC;" />
								    <display:column title="Subject" headerClass="transhead" class="transdata" property="subject" style="border: 1px solid #CCC;" />
								    <display:column title="Thời gian" headerClass="transhead" class="transdata" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
								    <display:column title="Xử lý" headerClass="transhead" class="transdata" property="sender" style="border: 1px solid #CCC;" />
								    <display:column title="Trạng thái" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
										<c:choose>
											<c:when test="${list.status == 2 }">
												<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="Đã gửi" />
											</c:when>
											<c:when test="${list.status == 0 }">
												<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="Chờ gửi" />
											</c:when>
											<c:otherwise>
												<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="Từ chối" />
											</c:otherwise>
										</c:choose>
								    </display:column>
								    <display:column title="Chi tiết" headerClass="transhead" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
								    	<a href="<%=request.getContextPath()%>/protected/view-email-marketing.html?id=${list.id }" class="act_edit" title="Xem chi tiết"></a>
								    </display:column>
								    <%-- <display:column title="Message" headerClass="transhead" class="transdata" property="message" maxLength="20" style="border: 1px solid #CCC;" /> --%>
								    <%-- <display:column title="Pin" property="pin" /> --%>
								</display:table>
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
