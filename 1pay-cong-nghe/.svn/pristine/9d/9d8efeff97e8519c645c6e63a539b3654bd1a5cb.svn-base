<%@page import="vn.onepay.common.SharedConstants"%>
<%@page import="vn.onepay.sdk.item.model.SdkItem"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery-ui.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){
	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả"
	});
});
</script>
<style>
	.product_slc_filter {margin-right: 5px;}
	.export_link, .export_link:hover {
		background: url("<%=request.getContextPath()%>/images/page_white_excel.png") no-repeat scroll left center, url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
	    color: #FFFFFF;display: block;float: right;font-weight: bold;height: 20px;line-height: 20px;padding-left: 20px;padding-right: 5px;
	    border: 1px solid #39B54A;border-radius: 10px;text-shadow: 0 1px #20942B;
	}
	.addproduct_link:HOVER, .export_link:HOVER {margin-right: 0;padding-right: 5px;}
	.transdata img {margin: 0 15px;}
	
	.filter_row fieldset {border: solid 1px #ccc;}
	.filter_row .product_slc_filter {width:100%;}
	#item_area {
		width:680px; display:none; background:#FFF; border-radius:5px; -moz-border-radius:5px; -webkit-border-radius:5px; box-shadow:0 0 4px rgba(0,0,0,0.7);
		-webkit-box-shadow:0 0 4px rgba(0,0,0,0.7); -moz-box-shadow:0 0 4px rgba(0,0,0,0.7); padding: 20px;
	}
	
	.sdk_download_link, .sdk_download_link:hover {
		background: url("<%=request.getContextPath()%>/images/archive_18.png") no-repeat scroll left center, url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
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
		margin-right:5px;
	}
	
	#menu {background: #eee !important;}
	#menu li {border-bottom: 1px solid #ddd;position: relative;}
	#menu li:last-child {border-bottom: none;}
	#menu .cat_item {
		font-size: 14px;text-overflow:ellipsis;
		-webkit-line-clamp:1;line-clamp:1;
		max-height: 28px;overflow: hidden;line-height: 28px;
		padding-right: 40px;}
</style>
</head>
<%
	request.setAttribute("APPROVED_STATUS", 		SdkItem.APPROVED_STATUS);
	request.setAttribute("REJECT_STATUS", 			SdkItem.REJECT_STATUS);
	request.setAttribute("INIT_STATUS", 			SdkItem.INIT_STATUS);
	request.setAttribute("PENDING_STATUS", 			SdkItem.PENDING_STATUS);
%>
<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("productNavMenu",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						<div class="right_content">
				            <h1 class="srv_title"> [SDK] Quản lý hàng hóa </h1>
				            <div style="border-radius: 10px;padding-left: 10px;border: 1px solid #ccc;font-size: 14px;">
				            	<c:if test="${model.product != null}">
									<div class="srv_row">
										<div class="product_thumb" style="width:80px;height:80px;">
											<% request.setAttribute("PRODUCT_ICON_HOST", SharedConstants.PRODUCT_ICON_HOST); %>
											<img src="${PRODUCT_ICON_HOST}/${model.product.icon_path}"
												width="80" height="80" style="border-radius: 10px;-moz-border-radius:10px;-webkit-border-radius:10px;"
												border="0" /> 
												<!-- <a href="#" class="link_upload">Thay icon</a> -->
										</div>
		
										<div style="float:left;width:350px">		
											<div class="product_dt_title">
												<span><c:out value="${model.product.title}" /></span><span> (<c:out value="${model.product.app_code}" />)</span>&nbsp;&nbsp;&nbsp; 
											</div>
											<ul style="font-size: 14px; list-style: none;padding-left: 0;margin-bottom: 0;">
												<li style="padding: 2px 0;">
													<strong>Merchant:</strong> <strong><c:out value="${model.product.merchant}" /> - <c:out value="${onepay:getDepartmentOfMerchant(model.product.merchant)}" /></strong>
												</li>
												<li style="padding: 2px 0;">
													<strong>Access key:</strong> <c:out value="${model.product.access_key}" />
												</li>
											</ul>
										</div>
										<c:if test="${model.product.description != null && fn:length(fn:trim(model.product.description)) > 0}">
											<div style="font-size: 14px;float:left;background-color: #F8F8F8;width:297px;height:85px;margin:-10px 0;padding: 10px;border-radius:0 10px 10px 0;border-left: 1px solid #ccc;">
												<strong>Mô tả:</strong>
												<div style="padding-left: 3px;">
													<c:out value="${model.product.description}" />
												</div>
											</div>
										</c:if>
										<div class="clear"></div>
									</div>
								</c:if>
				            </div>
				            <form action="sdk-item-manager.wss?access_key=${param.access_key}" method="post" name="sdk_item_manager">
				            	<div class="dash_row">
				            		<input type="hidden" name="tab" value="${param.tab}" />
									<div id="dash_tab" style="padding-right: 0;">
										<a href="sdk-item-manager.wss" class="tab${(param.tab==null || param.tab=='')?'_slc':''}"><span>Kho hàng hóa</span></a> 
										
										<c:if test="${param.tab == null || fn:length(param.tab) == 0}">
											<a href="#item_area" rel="leanModal" class="addproduct_link add_item">
												<span>Thêm hàng hóa</span>
											</a>
											<a accesskey="${model.product.access_key}" pname="${model.product.title}" 
												title="Tạo file cấu hình SDK" class="go_sdk sdk_download_link" rel="leanModal" 
												name="sdk_pop" href="#sdk_pop"> 
												<span>Tải SDK</span>
											</a>
										</c:if>
										 
										<div class="clear"></div>
									</div>
								</div>
								
								<div id="filter_locketqua">
									<h3 class="filter_label close box_locketqua_hide">
										<a href="#">Lọc kết quả</a>
									</h3>
								</div>
								<div class="box_locketqua" style="display:none;">
									<div class="filter_row">
										<div class="product_slc_filter" style="width: auto; float:left;">
											<label class="product_lbl_filter"><strong>Tên hàng hóa</strong></label> 
											<input id="itemName" name="itemName" value="${param.itemName }" class="dashboard_filter" placeholder="Nhập tên hàng hóa"/>
										</div>
										<div class="product_slc_filter" style="float: right;width:auto;">
											<label class="product_lbl_filter"><strong>Status</strong></label> 
											<select name="status" class="product_filter">
												<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
												<c:forEach  var="status" items="${model.status }">
													<c:choose>
														<c:when test="${status == APPROVED_STATUS }">
														<option value="${status}" ${param.status == status?'selected="selected"':''}>
															Đã duyệt
														</option>
														</c:when>
														<c:otherwise>
														<option value="${status}" ${param.status == status?'selected="selected"':''}>
															Chưa duyệt
														</option>
														</c:otherwise>
													</c:choose>
												</c:forEach>
											</select>
										</div>
									</div>
									
									<div class="product_slc_filter filter_row">
										<fieldset>
											<legend>
												<input type="checkbox" name="ctChkAll" value="ctChkAll" id="ctChkAll" class="chck_filter" /> <strong>Loại dịch vụ thanh toán</strong>
												<script type="text/javascript">
													$(document).ready(function(){
														$('#ctChkAll').click(function() {
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
												<c:set var="allCt" value="," />
												<c:forEach var="ct" items="${paramValues.ct}">
													<c:set var="allCt" value="${allCt}${ct}," />
												</c:forEach>
												<c:forEach var="charging" items="${model.allCharging }">
													<div style="display: inline-block;">
														<c:set var="ct" value=",${charging}," />
														<input type="checkbox" class="chck_filter" name="ct" title="${charging} charging" value="${charging}" 
															${fn:contains(allCt, ct)?'checked="checked"':'' } />
														<label class="lbl_chcksub"><img src="../images/${fn:toLowerCase(charging)}_active2.png" align="top" /> ${charging}</label>
													</div>
												</c:forEach>
											</div>
										</fieldset>
									</div>
									<div class="clear"></div>
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
											<c:if test="${param.ctChkAll == 'ctChkAll' }">
											<script type="text/javascript">
											$(document).ready(function() {
												$('#ctChkAll').attr('checked', 'checked');
											});
											</script>									
											</c:if>
										</c:otherwise>
									</c:choose>
									<div class="filter_row">
										<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submitBtn" />
									</div>
								</div>
				               <div class="srv_row">
				               		<table style="width:100%; border: none;">
				               			<tr>
				               				<td width="140" valign="top" style="${fn:length(categories) > 0 ? '' : 'display:none;'}background-color: #eee;border-radius:4px;">
				               					<input type="hidden" name="category" value="${param.category}" />
												<ul id="menu">
													<li>
														<a href="javascript: void(0)" value="" class="${param.category == null || fn:length(param.category) == 0 ? 'selected ' : ''}cat_item">Tất cả</a>
														<div style="position:absolute; top:4px; right: -2px;">
															<a href="#"
																style="float:right;display:block;background: none; border:none;margin-top: 1px;padding-left: 0">
																<img src="<%=request.getContextPath()%>/images/huy.png" style="border:none;" width="14" align="middle" />
															</a>
															<a href="#category_pop" rel="leanmodal"
																class="add_cat" 
																style="float:right;display:block;background: none; border:none;">
																<img src="<%=request.getContextPath()%>/images/add.png" style="border:none;" />
															</a>
														</div>
													</li>
													<c:forEach var="category" items="${categories}">
												  	<li>
												  		<a title="${category}" href="javascript: void(0)" value="${category}" class="${param.category == category ? 'selected ' : '' }cat_item">
												  			<c:choose>
												  				<c:when test="${fn:length(category)>10 }">${fn:substring(category, 0, 10) }...</c:when>
												  				<c:otherwise>${category }</c:otherwise>
												  			</c:choose>
												  		</a>
												  		<div style="position:absolute; top:4px; right: -2px;">
															<a href="#"
																style="float:right;display:block;background: none; border:none;margin-top: 1px;padding-left: 0">
																<img src="<%=request.getContextPath()%>/images/huy.png" style="border:none;" width="14" align="middle" />
															</a>
													  		<a href="#category_pop" rel="leanmodal"
																class="edit_cat" name="${category }"
																style="float:right;display:block;background: none; border:none;">
																<img src="<%=request.getContextPath()%>/images/editComparison.png" style="border:none;" />
															</a>
														</div>
												  	</li>
												  	</c:forEach>
												</ul>
				               				</td>
				               				<td valign="top">
							               		<%
							               			request.setAttribute("SDK_ITEM_ICON_HOST", SharedConstants.SDK_ITEM_ICON_HOST);
							               			request.setAttribute("allCharging", SharedConstants.ALL_ACTIVED_CHARGING_SERVICES);
							               		%>
							                	<display:table name="model.list" id="list" 
																	requestURI="sdk-item-manager.wss" 
																	pagesize="${model.limit}" partialList="true" size="model.total"
																	style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
																	sort="list">
													<%@ include file="display_table.jsp" %>
													<display:column title="STT" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
															<c:out value="${model.offset + list_rowNum }" />
												    </display:column>
												    
												    <display:column title="Hàng hóa" headerClass="transhead width120" class="svr_data1" style="border: 1px solid #CCC;">
												    	<a id="${list.id}" href="#item_area" rel="leanModal" style="color:#2C8F39; font-size: 14px;" class="edit_item">
												    		<img src="${SDK_ITEM_ICON_HOST}/${list.icon_path}" border="0" align="absmiddle" style="width: 20px;height: 20px;"/>
												    		${list.title}
												    	</a>
												    	<c:if test="${param.category == null || fn:length(param.category) == 0}">
														<div align="right">
															(${list.category})
														</div>
														</c:if>
												    </display:column>
													<display:column title="Mô tả" headerClass="transhead" class="svr_data1" property="description" maxLength="30" style="border: 1px solid #CCC;font-size:9pt;" />
													<display:column title="Giá" property="price" headerClass="transhead width50" class="svr_data1" style="border: 1px solid #CCC;text-align:right;" format="{0,number}" />
													<display:column title="Loại hình DV thanh toán" headerClass="transhead width90" class="svr_data1" style="border: 1px solid #CCC;" >
														<c:set var="avaiCm" value="," />
														<c:forEach var="cm" items="${list.charging_methods}" varStatus="status">
															<c:set var="avaiCm" value="${avaiCm}${cm}," />
														</c:forEach>
														<c:forEach var="charging" items="${allCharging }">
															<c:set var="cm" value=",${charging}," />
															<c:set var="avaiClass" value="${fn:toLowerCase(charging)}_active" />
															<c:set var="inavaiClass" value="${fn:toLowerCase(charging)}_avai" />
															<span class="${fn:contains(avaiCm, cm)?avaiClass:inavaiClass}"></span>
														</c:forEach>
													</display:column>
													<display:column title="Ngày cập nhật" headerClass="transhead" class="transdata width90" property="updated_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;text-align:center;" />
													<display:column title="Actions" headerClass="transhead width80" class="transdata" sortProperty="status" style="border: 1px solid #CCC;text-align:center;">
														<a class="edit_item" title="" rel="leanModal" id="${list.id}" href="#item_area" style="width:18px;display: inline-block;float:left;margin-right: 5px;">
														<c:choose>
															<c:when test="${list.status == APPROVED_STATUS }">
																<fmt:formatDate value="${list.updated_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
																<c:set var="account" value="" />
																<img border="0" src="<%=request.getContextPath()%>/images/tick.png" title="ON lúc ${time}${account}" />
															</c:when>
															<c:when test="${list.status == PENDING_STATUS }">
																<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
																<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="OFF lúc ${time}" />
															</c:when>
															<c:when test="${list.status == REJECT_STATUS }">
																<fmt:formatDate value="${list.updated_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
																<img border="0" src="<%=request.getContextPath()%>/images/error.png" title="OFF lúc ${time}" />
															</c:when>
															<c:otherwise>
																<fmt:formatDate value="${list.created_time}" var="time" pattern="dd/MM/yyyy HH:mm:ss" />
																<img border="0" src="<%=request.getContextPath()%>/images/invalid.png" title="OFF lúc ${time}" />
															</c:otherwise>
														</c:choose>
														</a>
														
														<a class="delete_item" title="Xóa hàng hóa" style="width:18px;display: inline-block;float: left;" itemName="${list.title}" sid="${list.id}">
															<img border="0" src="<%=request.getContextPath()%>/images/huy.png" />
														</a>
												    </display:column>
												</display:table>
												<c:if test="${model.total>0 }">
									            	<div style="float:right;">
									            		<span class="pagebanner" style="float:left;"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.limit) > model.total ? model.total : (model.offset + model.limit) }. </span>
													</div>
												</c:if>
				               				</td>
				               			</tr>
				               		</table>
				               </div>
					        	
								<div id="item_area"></div>
								<script type="text/javascript">
								$(document).ready(function() {
									$("#menu").menu();
									$("#menu .cat_item").click(function(){
									    $("#menu").find(".cat_item").removeClass("selected");//remove if something was selected
									    $(this).addClass("selected");//add a selected class
									    
									    $('input[name=category]').val($(this).attr('value'));
									    $('form[name=sdk_item_manager]').submit();
									});
									
									$('.add_item').live('click', function() {
										var category = encodeURIComponent($("#menu .selected").attr('value'));
										var url = '<%=request.getContextPath()%>/console/sdk-add-or-edit-item.wss?a=add_or_edit_item&access_key=${param.access_key}&category=' + category;
										$('#item_area').html('');
										$('#item_area').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
									
									$('.edit_item').live('click', function() {
										var url = '<%=request.getContextPath()%>/console/sdk-add-or-edit-item.wss?a=add_or_edit_item&access_key=${param.access_key}&i='+ $(this).attr("id");
										$('#item_area').html('');
										$('#item_area').load(url, function(responseTxt,statusTxt,xhr) {
											if(statusTxt == 'error')
												$(this).html('Không có dữ liệu hiển thị');
										});
									});
									
									$('.delete_item').live('click', function() {
										if(!confirm('Bạn có chắc chắn muốn xóa item "'+$(this).attr('itemName')+'" ?'))
											return false;
										var url = '<%=request.getContextPath()%>/console/sdk-delete-item.wss?i='+ $(this).attr("sid");
										var tempDiv = $('<div style="display:none;"></div>');
										$(tempDiv).load(url, function(responseTxt,statusTxt,xhr) {
											alert(responseTxt);
											if(responseTxt.indexOf('thành công') > 0) {
												var href = '${CURR_POST_URL}';
												if(href.indexOf('&r=') > 0)
													href = href.substring(0, href.indexOf('&r='));
												if(href.indexOf('#') > 0)
													href = href.substring(0, href.indexOf('#'));
												href += '&r=' + Math.round(Math.random()*1000000) + '#list';
												href = href.replace(/&access_key=${param.access_key}/gi, '');
												location.href = href;
											}
										});
										$(tempDiv).remove();
									});
								});
								</script>
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
		
		<!-- Popup -->
		<jsp:include page="include_popup.jsp" />
	</div>
</body>

</html>