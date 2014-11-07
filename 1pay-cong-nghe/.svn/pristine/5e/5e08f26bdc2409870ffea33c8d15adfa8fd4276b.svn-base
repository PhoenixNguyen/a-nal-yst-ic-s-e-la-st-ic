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

<body>

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
		
		<c:choose>
			<c:when test="${model.recordList.size() == 0}">
				Không có dữ liệu để hiển thị.
			</c:when>
			<c:otherwise>
			
				<div id="table_record">
					<table id= "table_record" width="100%" >
					<col width="5%"/>
					<col width="47%" />
					<col width="14%"/>
					<col width="14%"/>
					<col width="14%"/>
					<%-- <col width="4%"/>
					<col width="7%"/>
					<col width="12%"/> --%>
					<col width="6%"/>
						<tr>
							<th>STT</th>
							<th>Nội dung</th>
							<th>Đầu kỳ</th>
							<th>Trong kỳ</th>
							<th>Cuối kỳ</th>
							<!-- <th>Tháng/Năm</th>
							<th>Kỳ</th>
							<th>Tài khoản</th> -->
							<th>Sửa</th>
						</tr>
						<tag:treeTr treeMap="${model.categoryMap}"/>
					</table>
				</div>
			</c:otherwise>
		</c:choose>
		<script type="text/javascript">
				$(document).ready(function(){
					
					$('.record_management_popup').live('click', function(){
						
						//RESET
						$('#record_management_popup .manager_money_flow_record').html('Tạo mới bản ghi');
						$('form[name=money_flow_record_save] input[name=submit_money_flow_record]').val('Tạo mới');
						
						$('form[name=money_flow_record_save] select[name=parent_id]').val('');
						$('form[name=money_flow_record_save] input[name=parent]').val('');
						$('form[name=money_flow_record_save] input[name=parent_id]').val('');
						
						$('form[name=money_flow_record_save] input[name=title]').val('');
						$('form[name=money_flow_record_save] textarea[name=description]').val('');
						$('form[name=money_flow_record_save] input[name=number_code]').val('');
						
						$('form[name=money_flow_record_save] select[name=type]').val('');
						$("form[name=money_flow_record_save] input[name=first_period]").val('');
						$("form[name=money_flow_record_save] input[name=in_period]").val('');
						$("form[name=money_flow_record_save] input[name=last_period]").val('');
						$("form[name=money_flow_record_save] select[name=period]").val('');
						$("form[name=money_flow_record_save] input[name=month_year]").val('${param.monthYearSearch }');
						
						$("form[name=money_flow_record_save] select[name=request]").val('');
						
					});
					
					//EDIT RECORD
					$('.record_management_edit_popup').live('click', function(){
						$('.record_management_popup').click();
						
						//RESET
						$('#record_management_popup .manager_money_flow_record').html('Sửa bản ghi');
						$('form[name=money_flow_record_save] input[name=submit_money_flow_record]').val('Cập nhật');
						
						//PUSH VALUE
						$('form[name=money_flow_record_save] select[name=parent_id]').val($(this).attr('parent_id'));
						$('form[name=money_flow_record_save] input[name=parent]').val($(this).attr('parent'));
						$('form[name=money_flow_record_save] input[name=id]').val($(this).attr('id'));
						
						$('form[name=money_flow_record_save] input[name=title]').val($(this).attr('title'));
						$('form[name=money_flow_record_save] textarea[name=description]').val($(this).attr('description'));
						$('form[name=money_flow_record_save] input[name=number_code]').val($(this).attr('number_code'));
						
						$('form[name=money_flow_record_save] select[name=type]').val($(this).attr('type'));
						$("form[name=money_flow_record_save] input[name=first_period]").val($(this).attr('first_period'));
						$("form[name=money_flow_record_save] input[name=in_period]").val($(this).attr('in_period'));
						$("form[name=money_flow_record_save] input[name=last_period]").val($(this).attr('last_period'));
						$("form[name=money_flow_record_save] select[name=period]").val($(this).attr('period'));
						$("form[name=money_flow_record_save] input[name=month_year]").val($(this).attr('month_year'));
						
						$("form[name=money_flow_record_save] select[name=request]").val($(this).attr('request'));
						
					});
					
					$('#record_management_popup form[name=money_flow_record_save]').submit(function(){
						if(!confirm('Bạn có chắc chắn?'))
							return false;
						
						var parent_id = $('form[name=money_flow_record_save] select[name=parent_id]').val();
						if(parent_id == null || parent_id.trim() == ''){
							alert('Hãy chọn danh mục cha');
							return false;
						}
						
						var id = $('form[name=money_flow_record_save] input[name=id]').val();
						//title new
						var title = $('form[name=money_flow_record_save] input[name=title]').val();
						
						//
						var number_code = $('form[name=money_flow_record_save] input[name=number_code]').val();
						var description = $('form[name=money_flow_record_save] textarea[name=description]').val();
						var type = $('form[name=money_flow_record_save] select[name=type]').val();
						
						//NUMBER
						var first_period = parseFloat($("form[name=money_flow_record_save] input[name=first_period]").val());
						var in_period = parseFloat($("form[name=money_flow_record_save] input[name=in_period]").val());
						var last_period = parseFloat($("form[name=money_flow_record_save] input[name=last_period]").val());
						
						if(isNaN(first_period)){
							alert('Tiền đầu kỳ sai định dạng');
							return false;
						}
						if(isNaN(in_period)){
							alert('Tiền trong kỳ sai định dạng');
							return false;
						}
						if(isNaN(last_period)){
							alert('Tiền cuối kỳ sai định dạng');
							return false;
						}
						
						var period = $("form[name=money_flow_record_save] select[name=period]").val();
						var month_year = $("form[name=money_flow_record_save] input[name=month_year]").val();
						
						if(month_year == ""){
							alert("Tháng năm không được trống");
							return false;
						}
						var request = $("form[name=money_flow_record_save] select[name=request]").val();
						 
						var action = "RECORD_MANAGE";
						
						console.log(parent_id + "RECORD_MANAGE: " + first_period);
						$.ajax({
							type : "get",
							url : "cf_handle_ajax.html",
							data : "action="+action+"&parent_id=" + parent_id + "&id="+id+ "&title="+title+ "&type="+type + "&first_period=" + first_period + "&in_period="+in_period+ "&last_period="+ last_period + "&period="+period+  "&month_year="+ month_year +  "&number_code="+ number_code +  "&description="+ description + "&request=" + request,
							success : function(data){
								console.log("DATA: " + data);
								if(data == "1"){
									alert("Đã lưu bản ghi");
									$(location).attr('href', location.href);
								}else if(data == "0"){
									alert("lưu lỗi");
								}else if(data == "2"){
									alert("Lưu lỗi! Đã tồn tại kỳ và tháng/năm.");
								}
								else if(data == "3"){
									alert("Lưu lỗi! Hãy chọn Category để lưu trữ.");
								}
								
							}
						});
						return false;
					});
					
				});
				
				
				</script>
				
		<div id="record_management_popup">
			<h1 class="srv_title" ><span class="manager_money_flow_record">Thêm mới Bản ghi</span></h1>
				
				<form name="money_flow_record_save" action="cf_handle_ajax.html">
				
					<div style="display: -webkit-box; border: 1px solid #ccc; padding: 10px;font-size: 14px;border-radius: 5px;">
						
								<input type="hidden" name="action"/>
								<input type="hidden" name="id"/>
								<table width="100%" id="">
								<col width="20%"/>
								<col width="80%"/>
									<input type="hidden" name="id"/>
									
									<tr>
										<td align="right" valign="middle">Kiểu dòng tiền: </td>
										<td >
											<select name="type" class="select_style">
												
												<c:choose>
													<c:when test="${param.tab == 'cost' }">
														<option value="COST">Chi</option>
													</c:when>
													
													<c:otherwise>
														<option value="REVENUE">Thu</option>
													</c:otherwise>
												</c:choose>
											</select>
										</td>
									</tr>
									<tr>
										<td align="right" valign="middle"><span id="parent_label" class="parent_label">Danh mục cha: </span></td>
										<td >
											<select name= "parent_id" class="select_style" style="width: 82.3%;">
												<tag:treeOption treeMap="${model.categoryMap}"/>
											</select>
										
										</td>
									</tr>
									
									<!-- <tr >
										<td align="right" valign="middle">Mã số: </td>
										<td ><input class="input_text" name="number_code" placeholder="Mã số"/></td>
									</tr> -->
									<input class="input_text" type="hidden" name="number_code" placeholder="Mã số"/>
									
									<tr class="manage_change">
										<td align="right" valign="middle">Tiêu đề: </td>
										<td ><input class="input_text" name="title" placeholder=""/></td>
									</tr>
									
									<tr >
										<td align="right" valign="middle">Thuyết minh: </td>
										<td ><textarea rows="" cols="" class="input_text" name="description" placeholder="Mô tả"></textarea></td>
									</tr>
									
									<tr>
										<td align="right" valign="middle">Chu kỳ: </td>
										<td >
											<select name="period" class="select_style">
												<c:forEach items="${model.periodList}" var="item">
													<option value="${item }">${item }</option>
												</c:forEach>
											</select>
											
											<input id="date-picker" class="time_picker" name="month_year" placeholder="Tháng/Năm"/>
										</td>
									</tr>
									<script type="text/javascript">
										$(function() {
										    $('#date-picker').datepicker( {
										        changeMonth: true,
										        changeYear: true,
										        showButtonPanel: true,
										        dateFormat: 'mm/yy',
										        onClose: function(dateText, inst) { 
										            var month = $("#ui-datepicker-div .ui-datepicker-month :selected").val();
										            var year = $("#ui-datepicker-div .ui-datepicker-year :selected").val();
										            $(this).datepicker('setDate', new Date(year, month, 1));
										        }
										    });
										});
										</script>
										<style>
										.ui-datepicker-calendar {
										    display: none;
										    }
										</style>
										
										<tr>
											<td align="right" valign="middle">Đầu kỳ: </td>
											<td ><input class="input_number" name="first_period" placeholder="0"/></td>
										</tr>
										
										<tr>
											<td align="right" valign="middle">Trong kỳ: </td>
											<td ><input class="input_number" name="in_period" placeholder="0"/></td>
										</tr>
										
										<tr>
											<td align="right" valign="middle">Cuối kỳ: </td>
											<td >
												<input class="input_number" type="text" name="last_period" placeholder="0"/>
											</td>
										</tr>
										
										<tr>
											<td align="right" valign="middle">Trạng thái: </td>
											<td >
												
												<select name="request" class="select_style">
													<option value="requesting">Chờ duyệt</option>
													<option value="accepted">Đã duyệt</option>
													<option value="rejected">Từ chối</option>
												</select>
												
											</td>
										</tr>
										
								</table>
							
					</div>
					<table align="center">
							<tr>
								
								<td colspan="3">
									<input name="submit_money_flow_record" class="btn_greensmall" type="submit" value="Tạo mới" />
									<input name="cancel_money_flow_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
								</td>
							</tr>
						</table>
				</form>
		</div>
	</div>
</body>
</html>