<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ taglib tagdir="/WEB-INF/tags" prefix="tag"%>
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
jQuery(function($){
    $.datepicker.regional['month_of_numbers'] = {
    		closeText: "Chọn", // Display text for close link
    		prevText: "Lùi", // Display text for previous month link
    		nextText: "Tiếp", // Display text for next month link
    		currentText: "Hôm nay", // Display text for current month link
    		monthNames: ["Tháng 1","Tháng 2","Tháng 3","Tháng 4","Tháng 5","Tháng 6",
    			"Tháng 7","Tháng 8","Tháng 9","Tháng 10","Tháng 11","Tháng 12"], // Names of months for drop-down and formatting
    		monthNamesShort: ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12"], // For formatting
    		dayNames: ["Chủ nhật", "Thứ 2", "Thứ 3", "Thứ 4", "Thứ 5", "Thứ 6", "Thứ 7"], // For formatting
    		dayNamesShort: ["CN", "T2", "T3", "T4", "T5", "T6", "T7"], // For formatting
    		dayNamesMin: ["CN","2","3","4","5","6","7"], // Column headings for days starting at Sunday
    		weekHeader: "Wk", // Column header for week of the year
    		dateFormat: "mm/dd/yy", // See format options on parseDate
    		firstDay: 0, // The first day of the week, Sun = 0, Mon = 1, ...
    		isRTL: false, // True if right-to-left language, false if left-to-right
    		showMonthAfterYear: false, // True if the year select precedes month, false for month then year
    		yearSuffix: "" // Additional text to append to the year in the month headers
    		};
    $.datepicker.setDefaults($.datepicker.regional['month_of_numbers']);
});
</script>
<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
 -->
<style type="text/css">
	.add_category_management { background: url(<%=request.getContextPath() %>/images/sub_invi.png) no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	.add_category_management:HOVER, .add_record:HOVER, .back:HOVER { color: #FFFFFF; margin-right: 0; padding-right: 5px; text-shadow: 0 1px #20942B; }
 
	.add_record { background: url("<%=request.getContextPath() %>/images/add.png") no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	.back { background:  url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; /* url("<%=request.getContextPath() %>/images/add.png") no-repeat scroll left center, */ border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	#category_management_popup { background: #fff; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); display: none; font-size: 14px; height: auto; padding: 20px; width: 600px; }
	 
	#display_tree table { padding: 10px; }
	 
	#display_tree2 table tr { border-bottom: 1px solid #CCCCCC; }
	 
	.input_number { margin-left: 5%; padding: 5px; text-align: right; width: 80%; }
	 
	.input_text { margin-left: 5%; padding: 5px; text-align: left; width: 80%; }
	 
	.input_time { margin-left: 5%; padding: 5px; text-align: center; width: 80%; }
	 
	.radio_style { margin-left: 5%; margin-top: 5px; padding: 5px; }
	 
	#record_management_popup { background: #fff; background: none repeat scroll 0 0 #fff; border-radius: 5px; box-shadow: 0 0 4px rgba(0, 0, 0, 0.698); display: none; font-size: 14px; height: auto; padding: 20px; width: 550px; }
	 
	.requesting_color { color: red; }
	 
	.select_style { margin-left: 5%; padding: 5px; width: 40%; }
	 
	.sms_link, .sms_link:HOVER { background: url(<%=request.getContextPath() %>/images/sub_invi.png) no-repeat scroll left center, url("<%=request.getContextPath() %>/images/btngreen_bg.png") repeat-x scroll center top; border-radius: 10px; border: 1px solid #39B54A; color: #FFFFFF; display: block; float: right; font-weight: bold; height: 20px; line-height: 20px; padding-left: 20px; padding-right: 5px; text-shadow: 0 1px #20942B; }
	 
	.time_picker { margin-left: 0%; padding: 5px; width: 39.5%; }
	 
	.title_category { font-size: 14px; /* color: #2C8F39; */ }
	 
	.title_color { /* color: #2C8F39; */ }
	 
	.width10_percent { width: 10%; }
	 
	.width11_percent { width: 11%; }
	 
	.width12_percent { width: 12%; }
	 
	.width13_percent { width: 13%; }
	 
	.width20 { width: 20px; }
	 
	.width23_percent { width: 23%; }
	 
	.width250 { width: 250px; }
	 
	.width40_percent { width: 40%; }
	 
	.width5_percent { width: 5%; }
	 
	.width60 { width: 60px; }
	 
	.width7_percent { width: 7%; }
	 
	.width8_percent { width: 8%; }
</style>
</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	boolean isAdmin = account.isAdmin();
	boolean mbiz =  SharedConstants.MBIZ && isAdmin;
	request.setAttribute("MBIZ", mbiz);
	
	boolean isOperator = account.isOperator();
	request.setAttribute("isOperator",isOperator);
	//thay doi email & phone
%>


<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("moneyFlowMenu",true); %>
				<%request.setAttribute("menuTrangChu", true); %>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<!-- / Header -->
				<script type="text/javascript">
					if('<c:out value="${model.delete_record_status}"/>' == '1')
						alert('Xóa bản ghi thành công');
					if('<c:out value="${model.delete_record_status}"/>' == '2')
						alert('Xóa bản ghi lỗi');
					
					if('<c:out value="${model.delete_cate_status}"/>' == '1')
						alert('Xóa danh mục thành công');
					if('<c:out value="${model.delete_cate_status}"/>' == '2')
						alert('Không thể xóa danh mục này, hãy chắc chắn danh mục không chứa danh mục con hoặc bản ghi!');
					
				</script>
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("cashFlowManagement", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Cây danh mục</h1>
							
							
							<div class="dash_row">
								
								<div id="dash_tab" style="padding-right: 0;">
									
									<a href="cash-flow-category.html?tab=revenue&cate_type=cate" class="tab${(param.tab==null || param.tab=='revenue' || param.tab=='')?'_slc':''}"><span title="Danh mục Báo cáo Thu">Thu</span></a>
									<a href="cash-flow-category.html?tab=cost&cate_type=cate" class="tab${param.tab=='cost'?'_slc':''}"><span title="Danh mục Báo cáo Chi">Chi</span></a>
									
									<c:set value="0" var="tmp" />
									<c:forEach items="${model.cateTypes }" var="item" >
										<c:if test="${tmp == 0 }">
											<c:set value="${item.key }" var="firstCate" />
											<c:set value="1" var="tmp" />
										</c:if>
										
									</c:forEach>
									<a href="cash-flow-category.html?tab=amount&cate_type=${firstCate }" class="tab${param.tab=='amount'?'_slc':''}"><span title="Danh mục Báo cáo Khác">Khác</span></a>
									
									<a href="cash-flow.html" class="back" style="margin-right: 5px;padding-left: 5px;"><span>Quay lại</span></a>
									<a href="#category_management_popup" rel="leanmodal" class="category_management_popup add_record" style="margin-right: 5px;"><span>Thêm danh mục</span></a>
									
								</div>
							</div>
							
							<!-- Table View -->
							<div class="srv_row">
								
								<style>
									#table_record{
										font-size: 9pt;
											
									}
									#table_record table tr{
										padding: 5px;
										border : 1px solid #CCCCCC;
									}
									#table_record table th{
										padding: 5px;
										border : 1px solid #CCCCCC;
										background: none repeat scroll 0 0 #F3F3F3;
									}
									#table_record table td{
										padding: 5px;
										border : 1px solid #CCCCCC;
										background: #F9F9F9;
									}
								</style>
								
								<c:if test="${param.tab == 'amount' }">
								<div id="amount_cate" style="margin-bottom: 20px;">
								
									<form action="cash-flow-category.html" method="get" name="cates">
										<input type="hidden" value="amount" name="tab"/>
										<div id="filter_locketqua">
											<h3 class="filter_label open">
												<a href="#">Kiểu dòng tiền</a>
												
											</h3>
										</div>
										<div class="box_locketqua">
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;"><b>Kiểu dòng tiền</b></span>
												<select class="select_style" name="cate_type" onchange="this.form.submit()">
													<c:forEach items="${model.cateTypes }" var="item" >
														<option value="${item.key }" ${item.key == param.cate_type?'selected':'' }>${item.value }</option>
													</c:forEach>
													
												</select>
											</div>
											
										</div>
										
									</form>
								</div>
								</c:if>
								
								<c:choose>
								<c:when test="${model.categoryMap == null || model.categoryMap.size() == 0}">
									Không có dữ liệu để hiển thị.
								</c:when>
								<c:otherwise>
									<div id="table_record">
										<table id= "table_record" width="100%" >
										<col width="5%"/>
										<col width="81%" />
										
										<col width="6%"/>
											<tr>
												<th>STT</th>
												<th>Tiêu đề</th>
												<th>Sửa</th>
											</tr>
											<tag:treeCategoryTr treeMap="${model.categoryMap}"/>
										</table>
									</div>
								</c:otherwise>
								</c:choose>
								
								<script type="text/javascript">
										$(document).ready(function(){
											
											$('.category_management_popup').live('click', function(){
												//FIRST - add root parent
												var select = $('form[name=money_flow_save] select[name=parent_id]');
												if(!select.find('option[value=""]').length)
													select.prepend('<option value="">Danh mục gốc</option>');
												
												//RESET
												$('#category_management_popup h1').html('Thêm mới Danh mục');
												$('form[name=money_flow_save] input[name=submit_money_flow_category]').val('Tạo mới');
												
												//PUSH VALUE
												$('form[name=money_flow_save] select[name=parent_id]').val('');
												$('form[name=money_flow_save] input[name=parent]').val('');
												$('form[name=money_flow_save] input[name=id]').val('');
												$('form[name=money_flow_save] input[name=title]').val('');
												$('form[name=money_flow_save] input[name=code_name]').val('');
												$('form[name=money_flow_save] input[name=index]').val('999');
											});
											//EDIT CATEGORY
											$('.category_management_edit_popup').live('click', function(){
												
												
												$('.category_management_popup').click();
												
												//RESET
												$('#category_management_popup h1').html('Sửa Danh mục');
												$('form[name=money_flow_save] input[name=submit_money_flow_category]').val('Cập nhật');
												
												//PUSH VALUE
												var pr_id = $(this).attr('parent_id');
												//ADD IF EDIT ROOT
												var select = $('form[name=money_flow_save] select[name=parent_id]');
												if(pr_id == ''){
													if(!select.find('option[value=""]').length)
														select.prepend('<option value="">NULL</option>');
												}
												else
													if(select.find('option[value=""]').length)
														select.find('option[value=""]').remove();
												select.val(pr_id);
												
												$('form[name=money_flow_save] input[name=id]').val($(this).attr('id'));
												
												$('form[name=money_flow_save] input[name=title]').val($(this).attr('title'));
												
												$('form[name=money_flow_save] input[name=code_name]').val($(this).attr('code_name'));
												$('form[name=money_flow_save] input[name=index]').val($(this).attr('index'));
												
											});
											
											$('form[name=money_flow_save]').submit(function(){
												if(!confirm('Bạn có chắc chắn?'))
													return false;
												
												var parent_id = $('form[name=money_flow_save] select[name=parent_id]').val();
												/* if(parent_id.trim() == ''){
													alert('Hãy chọn danh mục');
													return false;
												} */
												
												var id = $('form[name=money_flow_save] input[name=id]').val();
												
												//title new
												var title = $('form[name=money_flow_save] input[name=title]').val();
												if(title.trim() == ''){
													alert('Hãy nhập tiêu đề');
													return false;
												}
												var type = $('form[name=money_flow_save] select[name=type]').val();
												
												var code_name = $('form[name=money_flow_save] input[name=code_name]').val();
												if(code_name.trim() == ''){
													alert('Hãy nhập code name');
													return false;
												}
												
												var index = $('form[name=money_flow_save] input[name=index]').val();
												if(isNaN(parseInt(index))){
													alert('Số thứ tự sai định dạng');
													return false;
												}
												
												var action = "CATEGORY_MANAGE";
												
												console.log(title);
												$.ajax({
													type : "GET",
													url : "cf_handle_ajax.html",
													data : "action="+action+"&parent_id=" + parent_id + "&id="+id+ "&title="+title+ "&type="+type + "&code_name=" + code_name + "&index=" + index,
													contentType: "charset=utf-8",
													success : function(data){
														console.log("DATA: " + data);
														if(data == "1"){
															alert("Đã lưu bản ghi");
															$(location).attr('href', location.href);
														}else if(data == "0"){
															alert("lưu lỗi");
														}else if(data == "2"){
															alert("Lưu lỗi! Đã tồn tại ROOT.");
														}
														else if(data == "3"){
															alert("Lưu lỗi! Không thể lưu cha là chính nó.");
														}else if(data == "4"){
															alert("Lưu lỗi! Đã tồn tại Code name.");
														}
														
														else if(data == "5"){
															alert("Lưu lỗi! Code name không được trống.");
														}
													}
												});
												return false;
											})
										});
										</script>
										
								<div id="category_management_popup">
									<h1 class="srv_title" name="manager_cash_flow">Thêm mới Danh mục</h1>
										
										<form name="money_flow_save" action="cf_handle_ajax.html">
										
											<div style="display: -webkit-box; border: 1px solid #ccc; padding: 10px;font-size: 14px;border-radius: 5px;">
												
												<input type="hidden" name="action"/>
												<input type="hidden" name="id"/>
												<table width="100%" id="">
												<col width="20%"/>
												<col width="80%"/>
													<!-- <input type="hidden" name="parent_id"/> -->
													<input type="hidden" name="id"/>
													
													<tr >
														<td align="right" valign="middle"><span id="parent_label" class="parent_label">Danh mục cha: </span></td>
														<td >
															<select name= "parent_id" class="select_style" style="width: 83.2%;">
																<tag:treeOption treeMap="${model.categoryMap}"/>
															</select>
														
														</td>
													</tr>
													
													<tr class="manage_change">
														<td align="right" valign="middle">Code name: </td>
														<td ><input class="input_text" name="code_name" placeholder="Nhập code name"/></td>
													</tr>
													
													<tr class="manage_change">
														<td align="right" valign="middle">Tiêu đề: </td>
														<td ><input class="input_text" name="title" placeholder="Nhập tiêu đề"/></td>
													</tr>
													<tr>
														<td align="right" valign="middle">Thứ tự xuất hiện: </td>
														<td ><input class="input_text" name="index" value="999" placeholder="Thứ tự xuất hiện"/></td>
													</tr>
													<tr>
														<td align="right" valign="middle">Kiểu dòng tiền: </td>
														<td >
															<select name="type" class="select_style">
																<c:if test="${param.tab == 'revenue' || param.tab==null || param.tab==''}">
																	<option value="REVENUE">Thu</option>
																</c:if>
																<c:if test="${param.tab == 'cost' }">
																	<option value="COST">Chi</option>
																</c:if>
																<c:if test="${param.tab == 'amount' }">
																	<option value="${param.cate_type }">
																		<c:forEach items="${model.cateTypes }" var="item" >
																			<c:if test="${item.key ==  param.cate_type}">
																				${item.value}
																			</c:if>
																		</c:forEach>	
																	</option>
																</c:if>
																
															</select>
														</td>
													</tr>
													
												</table>
													
											</div>
											<table align="center">
													<tr>
														
														<td colspan="3">
															<input name="submit_money_flow_category" class="btn_greensmall" type="submit" value="Tạo mới" />
															<input name="cancel_money_flow_category" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
														</td>
													</tr>
												</table>
										</form>
								</div>
								
							</div>
							<!-- End Table View -->
							
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
