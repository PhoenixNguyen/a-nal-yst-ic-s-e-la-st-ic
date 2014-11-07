<%@page import="org.springframework.ui.ModelMap"%>
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
	
	<script type="text/javascript">
	$(function(){
	
	 $(".filter_merchant").multiselect({
	  selectedList: 4,
	  noneSelectedText: "Tất cả",
	  classes: "multiSelectBox"
	 });
	 
	});
	</script>
	<style >
		#new_record,#edit_record{
			display: none;
			background: #fff;
			width: 700px;
			height: auto;
			padding: 20px;
			background: none repeat scroll 0 0 #fff;
			border-radius: 5px;
			box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
			font-size: 14px;
		}
		.filter_row fieldset {border: solid 1px #ccc;width:95%;}
		.filter_row .product_slc_filter {width:100%;}
		.sms_link, .sms_link:HOVER {
			background: url(../images/sms_white.gif) no-repeat scroll left center, url("../images/btngreen_bg.png") repeat-x scroll center top;
		    color: #FFFFFF;
		    display: block;
		    float: right;
		    font-weight: bold;
		    height: 20px;
		    line-height: 20px;
		    padding-left: 20px;
		    padding-right: 5px;
		
		    border: 1px solid #39B54A;
		    border-radius: 10px;
		    text-shadow: 0 1px #20942B;
		}
	</style> 
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	ModelMap typeTitle = new ModelMap();
	typeTitle.put("accept", "Chấp nhận");
	typeTitle.put("reject", "Từ chối");
	request.setAttribute("typeTitle", typeTitle);
	
	ModelMap typeIcon = new ModelMap();
	typeIcon.put("accept", "<img src=\""+request.getContextPath()+"/images/com_actived.png\" />");
	typeIcon.put("reject", "<img src=\""+request.getContextPath()+"/images/com_reject.png\" />");
	request.setAttribute("typeIcon", typeIcon);
%>

<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("mpaNavMenu",true); %>
				<%request.setAttribute("menuTrangChu", true); %>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<!-- / Header -->
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Left Menu -->
						<jsp:include page="left_menu.jsp" />

						<!-- Begin right content -->						
						<div class="right_content">
													
						<h1 class="srv_title">Phân bổ đầu số cho Merchant</h1>
						
						    <!-- Tạo menu tab -->
							<div id="dash_tab" style="padding-right: 0;">
								<a href="merchant-provider-allocation.wss" class="${param.tab == null || param.tab ==''?'tab_slc':'tab' }"><span>Tất cả (${model.totalAll})</span></a>
								<a href="merchant-provider-allocation.wss?tab=accept" class="${param.tab =='accept'?'tab_slc':'tab' }"><span>Chấp nhận (${model.totalAccept})</span></a>
								<a href="merchant-provider-allocation.wss?tab=reject" class="${param.tab =='reject'?'tab_slc':'tab' }"><span>Từ chối (${model.totalReject})</span></a>
								<a href="#new_record" rel="leanmodal" class="addproduct_link"><span>Thêm phân bổ</span></a>
								<c:if test="${account_logined.isBizManager() || account_logined.isOperator() || account_logined.isBizSupporter()}">
									<a href="<%=request.getContextPath() %>/console/sms-command-code-manager.wss?tab=sms_store" class="sms_link" style="margin-right: 5px;"><span>Quản lý mã SMS</span></a>
								</c:if>	
								<div class="clear"></div>
							</div>
							<div id="filter_locketqua">
								<h3 class="filter_label close">
									<a href="javascript:void(0)">Lọc kết quả</a>
								</h3>
							</div>
							 <!-- /Tạo menu tab -->
							
							<div class="box_locketqua">
								<form action="#" method="get" name="filterForm">
									<input type="hidden" name="tab" value="${param.tab }"/>
									<!-- Tạo danh sách lọc Merchant -->
									<div class="filter_row">
										<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
											<c:set var="allMcs" value="," />
											<c:forEach var="mc" items="${paramValues.merchant}">
												<c:set var="allMcs" value="${allMcs}${mc}," />
											</c:forEach>          	
											<div class="field" style="width:auto; float:left;">
												<div style="padding-bottom: 5px; overflow: hidden;">
													<label class="product_lbl_filter" style="margin-right: 38px;"><strong>Merchant</strong></label>
													<input id="searchMerchant" list="listForSearchMc" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
													<c:set var="listForSearchMc" value="<datalist id='listForSearchMc'>" />
													<select class="filter_merchant" name="merchant" multiple="multiple">
														<c:forEach var="merchant" items="${model.merchants}">
															<c:set var="merchant2" value=",${merchant}," />
															<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
																<c:out value="${merchant}"/>
															</option>
															<c:set var="listForSearchMc" value="${listForSearchMc}
															<option value='${merchant}'>${merchant}</option>" />
														</c:forEach>
													 </select>
													 <c:out value="${listForSearchMc}" escapeXml="false" />
												</div>
											</div>
										</c:if>			
									</div>	
									<!--/ Tạo danh sách lọc Merchant -->
									
									<!-- Check đầu số  -->
									<div class="product_slc_filter filter_row" style="margin-right: 5px;width:450px;">
										<fieldset class="short_codes_fs">
											<legend>
												<input type="checkbox" name="prChkAll" value="prChkAll" id="prChkAll" class="chck_filter" /> <strong>Provider</strong>
												<script type="text/javascript">
													$(document).ready(function(){
														$('#prChkAll').click(function() {
															if(this.checked) {
																$(this).closest('.product_slc_filter').find('input[type=checkbox]').attr('checked', 'checked');
															} else {
																$(this).closest('.product_slc_filter').find('input[type=checkbox]').removeAttr('checked');
															}
														});
													});
												</script>
											</legend>
											<div style="padding: 2px;">
												<c:set var="allSN" value="," />
												<c:forEach var="sn" items="${paramValues.provider}">
													<c:set var="allSN" value="${allSN}${sn}," />
												</c:forEach>
												<c:forEach items="${model.allsv_number}" var ="svnumber">
													<c:set var="_sn" value=",${svnumber },"/>
													<div style="display: inline-block;width:120px;">
														<input type="checkbox" class="chck_filter" name="provider" title="${svnumber}" value="${svnumber}" ${fn:contains(allSN, _sn)?'checked="checked"':'' }/>
														       <label class="lbl_chcksub">${svnumber}</label>
													</div>
												</c:forEach>		
											</div>
										</fieldset>
									</div>
									
									<c:choose>
										<c:when test="${param.submitBtn==null || fn:length(param.submitBtn) == 0 }">
											<script type="text/javascript">
												$(document).ready(function() {
													$('.box_locketqua').find('fieldset').each(function() {
														$(this).find('input[type=checkbox]').attr('checked', 'checked');
													});
												});
											</script>
										</c:when>
										<c:otherwise>
											<c:if test="${param.prChkAll == 'prChkAll' }">
												<script type="text/javascript">
													$(document).ready(function() {
														$('#prChkAll').attr('checked', 'checked');
													});
												</script>									
											</c:if>
										</c:otherwise>
									</c:choose>
									<!--/ Check đầu số  -->
									
							        <!-- Lọc Trạng thái và Loại -->		
									<div style="float: right;width:auto;">
										<c:if test="${param.tab == null ||param.tab == '' }">
											<div class="product_slc_filter" style="float:right;">
												<label class="product_lbl_filter"><strong>Loại</strong></label> 
											    <select class="product_filter" name="ftype">
											        <option value="">Tất cả</option>
											        <option value="accept" ${param.ftype=='accept'?'selected':''}>${typeTitle['accept']}</option>
											        <option value="reject" ${param.ftype=='reject'?'selected':''}>${typeTitle['reject']}</option>
											    </select>	
											</div>
										    <br /><br />	
										</c:if> 	
										<div class="product_slc_filter" style="margin-top: 10px;">
									        <label class="product_lbl_filter"><strong>Trạng thái</strong></label> 
										    <select class="product_filter" name="fstatus">
										        <option value="" >Tất cả</option>
										        <option value="ON" ${param.fstatus=='ON'?'selected':''}>ON</option>
										        <option value="OFF" ${param.fstatus=='OFF'?'selected':''}>OFF</option>
										    </select>
									    </div>
									</div>
									<!-- /Lọc Trạng thái và đầu số -->	
							
									<div class="clear"></div>
									
									<div class="filter_row">
										<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submitBtn" />
									</div>
								</form>   
							</div>         
						
							<div id="new_record"><jsp:include page="merchant_provider_allocation_create.jsp" /></div>
							<div id="edit_record"><jsp:include page="merchant_provider_allocation_edit.jsp" /></div>
							<br/>
						
						
							<c:if test="${model.size > 0}">
								<span class="pagebanner"> ${model.size} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pageSize) > model.size ? model.size : (model.offset + model.pageSize) }. </span>
							</c:if>
							
							<!-- Phân trang -->
							<display:table name="model.smcs" id="list" 
								requestURI="merchant-provider-allocation.wss" 
								pagesize="${model.pageSize}" partialList="true" size="model.size"
								style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;text-align:center;"
								sort="list">
								<%@ include file="display_table.jsp" %>
							    <display:column title="Merchant" headerClass="transhead width200" class="svr_data_name" style="border: 1px solid #CCC;text-align:left;" >
							   		<strong>${list.merchant}</strong>
							   	</display:column>	
							    <display:column title="Provider" headerClass="transhead" class="svr_data_name" style="border: 1px solid #CCC;" >
							   		${list.provider}
							   	</display:column>
							   	<c:if test="${!(param.tab == 'accept' || param.tab == 'reject') }">   	
							    <display:column title="Loại" headerClass="transhead width50" class="transdata" style="border: 1px solid #CCC;" >
							   		<span title="${typeTitle[list.type]}">${typeIcon[list.type]}</span>
							   	</display:column>
							   	</c:if>
							   	<display:column title="Ngày tạo <br/> <span style='color:#f00;'>Ngày cập nhật</span>" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
							   		<fmt:formatDate value="${list.created_time}" pattern="yyyy-MM-dd HH:mm:ss" /> <br />
							   		<span style="color:#f00;"><fmt:formatDate value="${list.updated_time}" pattern="yyyy-MM-dd HH:mm:ss" /></span>     		
							   	</display:column>
							    <display:column title="Trạng thái" headerClass="transhead width80" class="transdata" style="border: 1px solid #CCC;" >
							   		<div class="onoffswitch" style="cursor: pointer;text-align: left;margin-left: 15px;">
										<c:set var="active" value="${list.status == 'ON'}" />
										<input type="checkbox" name="onoffswitch" value="${list.status}"
											class="onoffswitch-checkbox" id="svr_${list.id}" ${active?'checked="checked"':'' } />
										
										<label class="onoffswitch-label"
											for="svr_${list.id}">
											<div class="onoffswitch-inner"></div>
											<div class="onoffswitch-switch"></div>
										</label>
									</div>
							   	</display:column>
							    <display:column  title="Hành động" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
								     <a href="#edit_record" rel="leanmodal" class="edit_record" 
								     	id="${list.id}" 
								     	name="${list.merchant}"  
								        service_number="${list.provider}" 
								        type="${list.type}" status="${list.status}" >
								      <img src="<%=request.getContextPath()%>/images/denghi.png" title="Sửa"/>
								     </a> 	 
							 	     <a href="merchant-provider-allocation.wss?delete_id=${list.id}" class="delete_record">
							 	     	<img src="<%=request.getContextPath()%>/images/cross.png" title="Xóa"/>
							 	     </a> 
							   	</display:column>	       	 	   			
							</display:table>
							<script type="text/javascript">
								$(document).ready(function(){
									$('.edit_record').live('click', function(){
										var id = $(this).attr('id');
										var name = $(this).attr('name');
										var service_number = $(this).attr('service_number');
										var type = $(this).attr('type');
										var status = $(this).attr('status');
										
										$('#edit_record input[name=e_id]').val(id);
										$('#edit_record input[name=ename]').val(name);
										$('#edit_record input[name=esv_number]').each(function() {
											if($(this).val() == service_number)
												$(this).attr('checked', 'checked');
											else
												$(this).removeAttr('checked');
										});
										$('#edit_record select[name=etypemc]').val(type);
										$('#edit_record select[name=estatussv_number]').val(status);
									});
									
									$('.delete_record').live('click', function(){
										if(!confirm('Bạn có đồng ý xóa không?'))
											return false;
										
										$.post($(this).attr('href'), $(this).serialize(), function(json) {
											alert(json);
										}, 'text');
										
										$(this).closest('tr').remove();
										
										return false;
									});
									
									$('.onoffswitch-checkbox').live('click', function() {
										if($(this).is(':checked')) {
											$(this).removeAttr('checked');	
										} else {
											$(this).attr('checked','checked');
										}
										$('.edit_record', $(this).closest('tr')).click();
									});
								});
							</script>
							<!-- /Phân trang -->	
						</div>
						<!--/ End right content -->

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
