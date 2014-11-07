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
		
		<display:table name="model.amount" id="list"
			requestURI="management.mf?tab=${param.tab }"
			pagesize="${model.size}" size="model.size" partialList="true"
			style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;"
			sort="list"
		>
		<%@ include file="display_table.jsp" %>
			
			<fmt:formatDate value="${list.month_year }" pattern="MM/yyyy" var="month_year"/>
			<fmt:formatNumber value="${list.first_period }" maxFractionDigits="3" var="first_period"/>
		    <fmt:formatNumber value="${list.in_period }" maxFractionDigits="3" var="in_period"/>
		    <fmt:formatNumber value="${list.last_period}" maxFractionDigits="3" var="last_period"/>
		    
		    <display:column title="Báo cáo" paramProperty="id" headerClass="transhead width40_percent" class="svr_data_name" style="border: 1px solid #CCC; text-align: left; color: #2C8F39;" >
	    		<div style="display: block; font-weight: bold;">
		    		${list.title }
	    		</div>
		    </display:column>
		    
		    <display:column title="<span title='Kiểu dòng tiền'>Kiểu</span>" headerClass="transhead width10_percent" class="svr_data_name" style="border: 1px solid #CCC; text-align: left; color: #2C8F39;" >
	    		<div style="display: block;">
		    		${list.type }
	    		</div>
	    		
		    </display:column>
		    
			<display:column title="Đầu kỳ"  headerClass="transhead " class="svr_data_name" style="border: 1px solid #CCC; text-align: right;" >
	    		<div style="display: block">
		    		${first_period }
	    		</div>
		    </display:column>
		    
			<display:column title="Trong kỳ"  headerClass="transhead " class="svr_data_name " style="border: 1px solid #CCC; width: 100px; text-align: right;" >
	    		<div style="display: block">
		    		${in_period }
	    		</div>
		    </display:column>
		    
		    <display:column title="Cuối kỳ"  headerClass="transhead " class="svr_data_name" style="border: 1px solid #CCC; text-align: right;" >
	    		<div style="display: block">
		    		${last_period }
	    		</div>
		    </display:column>
		    
		    <%-- <display:column title="Tháng/Năm"  headerClass="transhead width11_percent" class="svr_data_name" style="border: 1px solid #CCC; text-align: center;" >
	    		<div style="display: block">
		    		${month_year }
	    		</div>
		    </display:column>
		    
			<display:column title="Kỳ"  headerClass="transhead width7_percent" class="svr_data_name" style="border: 1px solid #CCC; text-align: center;" >
	    		<div style="display: block">
		    		${list.period }
	    		</div>
		    </display:column>
		    
			<display:column title="Tài khoản"  headerClass="transhead width11_percent" class="svr_data_name " style="border: 1px solid #CCC; width: 100px; text-align: left;" >
	    		<div style="display: block; color:#2C8F39;">
		    		${list.account }
	    		</div>
		    </display:column> --%>
		    
		    <display:column title="Sửa"  headerClass="transhead width7_percent" class="svr_data_name" style="border: 1px solid #CCC; text-align: right;" >
	    		<div style="display: block">
	    			<c:if test="${list.id != null }">
			    		<a href="#record_management_popup" class="record_management_popup" rel="leanmodal" id="${list.id }" title="${list.title }" type="${list.type }"
			  				first_period="${list.first_period }" in_period="${list.in_period }" last_period="${list.last_period }" 
			  				period="${list.period }" month_year="${month_year }" number_code="${list.code_name }" description="${list.description }" request="${list.request }">
			  				<img src="<%=request.getContextPath() %>/images/edit.png" title="Sửa Bản ghi" alt="" />
		  				</a>
		  				<a href="management.mf?delete_record=${list.id }&backURL=${model.currURL}" onclick='return confirm("Bạn có chắc chắn?");'>
		  					<img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa Bản ghi" alt="" />
		  				</a>
	  				</c:if>
	    		</div>
		    </display:column>
		    
		</display:table>
	</div>
	
	<script type="text/javascript">
		$(document).ready(function(){
			
			//EDIT RECORD
			$('.record_management_popup').live('click', function(){
				
				if(typeof $(this).attr('id') !== 'undefined'){
					//RESET
					$('#record_management_popup .manager_money_flow_record').html('Sửa Báo cáo');
					$('form[name=money_flow_record_save] input[name=submit_money_flow_record]').val('Cập nhật');
				}
				else{
					//RESET
					$('#record_management_popup .manager_money_flow_record').html('Thêm Báo cáo');
					$('form[name=money_flow_record_save] input[name=submit_money_flow_record]').val('Tạo mới');
				}
				//PUSH VALUE
				$('form[name=money_flow_record_save] input[name=id]').val($(this).attr('id'));
				
				$('form[name=money_flow_record_save] input[name=title]').val($(this).attr('title'));
				$('form[name=money_flow_record_save] textarea[name=description]').val($(this).attr('description'));
				$('form[name=money_flow_record_save] input[name=number_code]').val($(this).attr('number_code'));
				
				$('form[name=money_flow_record_save] input[name=type]').val($(this).attr('type'));
				$("form[name=money_flow_record_save] input[name=first_period]").val($(this).attr('first_period'));
				$("form[name=money_flow_record_save] input[name=in_period]").val($(this).attr('in_period'));
				$("form[name=money_flow_record_save] input[name=last_period]").val($(this).attr('last_period'));
				$("form[name=money_flow_record_save] select[name=period]").val($(this).attr('period'));
				$("form[name=money_flow_record_save] input[name=month_year]").val($(this).attr('month_year'));
				
				//$("form[name=money_flow_record_save] input[name=request][value="+$(this).attr('request')+"]").attr('checked', 'checked');
			});
			
			$('#record_management_popup form[name=money_flow_record_save]').submit(function(){
				if(!confirm('Bạn có chắc chắn?'))
					return false;
				
				var id = $('form[name=money_flow_record_save] input[name=id]').val();
				//title new
				var title = $('form[name=money_flow_record_save] input[name=title]').val();
				//
				var number_code = $('form[name=money_flow_record_save] input[name=number_code]').val();
				var description = $('form[name=money_flow_record_save] textarea[name=description]').val();
				
				var type = $('form[name=money_flow_record_save] input[name=type]').val();
				if(type.trim() == ''){
					alert('Kiểu dòng tiền không được trống.');
					return false;
				}
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
				
				//var request = $("form[name=money_flow_record_save] input[name=request]:checked").val();
				
				var action = "RECORD_REPORT";
				
				console.log('TYPE: ' + type);
				$.ajax({
					type : "get",
					url : "handle_ajax.mf",
					data : "action="+action + "&id="+id+ "&title="+title+ "&type="+type + "&first_period=" + first_period + "&in_period="+in_period+ "&last_period="+ last_period + "&period="+period+  "&month_year="+ month_year +  "&number_code="+ number_code +  "&description="+ description,
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
							alert("Lưu lỗi! Kiểu dòng tiền thu và chi không được phép thêm.");
						}
						else if(data == "4"){
							alert("Lưu lỗi! Kiểu dòng tiền không được trống.");
						}
					}
				});
				return false;
			});
		});
	</script>
	
	<div id="record_management_popup">
		<h1 class="srv_title" ><span class="manager_money_flow_record">Thêm mới Báo cáo</span></h1>
		<form name="money_flow_record_save" action="handle_ajax.mf">
		
			<div style="display: -webkit-box; border: 1px solid #ccc; padding: 10px;font-size: 14px;border-radius: 5px;">
				
				<!-- Parent = NULL default -->
						
				<input type="hidden" name="action"/>
				<input type="hidden" name="id"/>
				<table width="100%" id="">
				<col width="20%"/>
				<col width="80%"/>
					<input type="hidden" name="id"/>
					
					<td align="right" valign="middle"><span id="style_label" class="style_label">Kiểu dòng tiền: </span></td>
					<td >
						<input class="input_text" name="type" placeholder="Nhập kiểu dòng tiền"/></td>
					
					</td>
					<tr class="manage_change">
						<td align="right" valign="middle">Tiêu đề: </td>
						<td ><input class="input_text" name="title" placeholder="Nhập tiêu đề"/></td>
					</tr>
					
					<!-- <tr >
						<td align="right" valign="middle">Mã số: </td>
						<td ><input class="input_text" name="number_code" placeholder="Mã số"/></td>
					</tr> -->
					<input class="input_text" type="hidden" name="number_code" placeholder="Mã số"/>
					
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
	
</body>
</html>