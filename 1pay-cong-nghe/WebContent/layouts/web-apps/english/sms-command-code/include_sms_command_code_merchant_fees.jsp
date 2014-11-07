<%@ page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<c:if test="${param.a == 'sms_command_code_merchant'}">
	<style>
		.merchant_name {font-weight: bold;}
		.sms_command_code_list table {max-height: 540px;overflow-y: auto; display: block;}
		.daterangepicker {z-index: 99999;}
	</style>
	<div class="srv_title">
		Phí quản lý mã SMS của Merchant: <span class="merchant_name">${param.merchant}</span>
	</div>
	<div class="sms_command_code_list">
		<c:set var="createFee" value="<%=SharedConstants.SMS_CMD_CODE_CREATE_FEES%>" />
		<c:set var="maintenanceFee" value="<%=SharedConstants.SMS_CMD_CODE_MAINTENANCE_FEES%>" />
		<div class="input-prepend" style="float:left;">
			<label class="product_lbl_filter"><strong>Chọn ngày</strong></label> <input type="text"
				name="reservation_fees" id="reservation_fees" class="txt_calendar product_filter" placeholder="Toàn thời gian" />
				<a href="javascript: $('#reservation_fees').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); $('.sms_command_code_list #list tbody').html($('.sms_command_code_list .defaultBody table tbody').html()); return false;" style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a>
		</div>
		<script type="text/javascript">
			function numberWithCommas(x) {
			    return x.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
			}
			function fees(start, end) {
				var feesTotal = 0;
				$('.sms_command_code_list #list .fees_no').each(function() {
					var no = $(this).text().trim();
					var createdTime = new Date($('.sms_command_code_list #list .fees_created_time_' + no).text().trim());
					var deltaMonth = 0;
					if(start > createdTime)
						deltaMonth = (end.getFullYear() * 12 + end.getMonth()) - (start.getFullYear() * 12 + start.getMonth()) + 1;
					else
						deltaMonth = (end.getFullYear() * 12 + end.getMonth()) - (createdTime.getFullYear() * 12 + createdTime.getMonth());
					
					if(deltaMonth < 0) {
						alert('Thời gian không hợp lệ');
						return false;
					}
					
					var createdFees = start.getFullYear() * 12 + start.getMonth() <= createdTime.getFullYear() * 12 + createdTime.getMonth() ? ${createFee} : 0;
					var maintenanceFees = deltaMonth * ${maintenanceFee};
					
					var shortCodesLength = $('.sms_command_code_list #list .fees_short_codes_' + no).text().split(',').length;
					$('.sms_command_code_list #list .fees_created_' + no).text(numberWithCommas(createdFees * shortCodesLength));
					$('.sms_command_code_list #list .fees_maintenance_' + no).text(numberWithCommas(maintenanceFees * shortCodesLength));
					feesTotal += maintenanceFees * shortCodesLength + createdFees * shortCodesLength;
				});
				
				$('.sms_command_code_list #list .fees_total').text(numberWithCommas(feesTotal));
			}
			$(document).ready(function() {
				var startTime = Date.today().moveToFirstDayOfMonth().add({ months: -1 });
				var endTime = Date.today().moveToFirstDayOfMonth().add({ days: -1 });
				$('.sms_command_code_list #reservation_fees').val(startTime.toString('dd/MM/yyyy') + ' - ' + endTime.toString('dd/MM/yyyy'));
				fees(startTime, endTime);
				try {
					$('#reservation_fees').daterangepicker({
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
						},
						startDate: Date.today().moveToFirstDayOfMonth(), endDate: Date.today().moveToLastDayOfMonth()
					},
					function(start, end) {
						fees(start, end);
					}
					);
				} catch(e){alert(e);}
			});
		</script>
		<div align="left" style="margin-bottom: 10px; margin-left: 20px;float:left;">
			<strong>Phí mở mới:</strong> <fmt:formatNumber value="${createFee * 8}" currencyCode="VND" /> đ/ 1 dải mã (duy nhất trong tháng đầu tiên) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			<br />
			<strong>Phí duy trì:</strong> <fmt:formatNumber value="${maintenanceFee * 8}" currencyCode="VND" /> đ/ 1 dải mã/ tháng
		</div>
		<display:table name="lists" id="list" class="clear"
			requestURI="sms-command-code-report.wss" 
			pagesize="${pagesize}" partialList="true" size="total"
			style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
			varTotals="totals"
			sort="list">
			<%@ include file="display_table.jsp" %>
			<display:column title="STT" headerClass="transhead fit_to_content" class="transdata fees_no" style="text-align:right;border: 1px solid #CCC;">
				<c:out value="${model.offset + list_rowNum }" />
		    </display:column>
		    
			<display:column title="Provider" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;text-align:center;" >
				<c:out value="${list.sms_charging.provider}"/>
			</display:column>
			<display:column title="CMD" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;font-weight:bold;text-transform:uppercase;" sortable="true" >
				<c:out value="${list.sms_charging.command}"/>
			</display:column>
			<display:column title="Short Code" headerClass="transhead" class="svr_data1 fees_short_codes_${model.offset + list_rowNum}" style="border: 1px solid #CCC;" >
				<c:forEach var="shortCode" items="${list.sms_charging.shortcodes}" varStatus="status">
					<c:out value="${shortCode}"/>${status.last?'':', '}
				</c:forEach>
			</display:column>
			<display:column title="Ngày tạo" headerClass="transhead" class="transdata fees_created_time_${model.offset + list_rowNum}" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;text-align:center;" />
			<display:column title="Ngày cập nhật" headerClass="transhead" class="transdata" property="updated_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;text-align:center;" />
			<display:column title="Phí mở mới" headerClass="transhead" class="transdata fees_created_${model.offset + list_rowNum}" style="border: 1px solid #CCC;text-align:right;">
				<fmt:formatNumber value="${createFee * fn:length(list.sms_charging.shortcodes)}" currencyCode="VND" />
			</display:column>
			<display:column title="Phí duy trì mã" headerClass="transhead" class="transdata fees_maintenance_${model.offset + list_rowNum}" style="border: 1px solid #CCC;text-align:right;">
				<fmt:formatNumber value="${feesMap[list.id] - createFee * fn:length(list.sms_charging.shortcodes)}" currencyCode="VND" />
			</display:column>
			<display:footer>
			    <tr>
			      <td colspan="6" align="right" class="transdata"> <strong>Tổng số:</strong> </td>
			      <td align="right" class="transdata fees_total" colspan="2">
			      	<strong><fmt:formatNumber value="${feesMap['total']}" currencyCode="VND" /></strong>
			      </td>
			    <tr>
		  	</display:footer>
		</display:table>
		
		<input type="button" name="reset" value="Đóng" class="btn_graysmall" onclick="$('#lean_overlay').click();" />
		<div class="defaultBody" style="display: none;">
		<display:table name="lists" id="list2" 
			requestURI="sms-command-code-report.wss" 
			pagesize="${pagesize}" partialList="true" size="total"
			style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;"
			varTotals="totals"
			sort="list">
			<%@ include file="display_table.jsp" %>
			<display:column title="STT" headerClass="transhead fit_to_content" class="transdata fees_no" style="text-align:right;border: 1px solid #CCC;">
				<c:out value="${model.offset + list2_rowNum }" />
		    </display:column>
		    
			<display:column title="Provider" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;text-align:center;" >
				<c:out value="${list2.sms_charging.provider}"/>
			</display:column>
			<display:column title="CMD" headerClass="transhead" class="svr_data1" style="border: 1px solid #CCC;font-weight:bold;text-transform:uppercase;" sortable="true" >
				<c:out value="${list2.sms_charging.command}"/>
			</display:column>
			<display:column title="Short Code" headerClass="transhead" class="svr_data1 fees_short_codes_${model.offset + list2_rowNum}" style="border: 1px solid #CCC;" >
				<c:forEach var="shortCode" items="${list2.sms_charging.shortcodes}" varStatus="status">
					<c:out value="${shortCode}"/>${status.last?'':', '}
				</c:forEach>
			</display:column>
			<display:column title="Ngày tạo" headerClass="transhead" class="transdata fees_created_time_${model.offset + list2_rowNum}" property="created_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;text-align:center;" />
			<display:column title="Ngày cập nhật" headerClass="transhead" class="transdata" property="updated_time" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;text-align:center;" />
			<display:column title="Phí mở mới" headerClass="transhead" class="transdata fees_created_${model.offset + list2_rowNum}" style="border: 1px solid #CCC;text-align:right;">
				<fmt:formatNumber value="${createFee * fn:length(list2.sms_charging.shortcodes)}" currencyCode="VND" />
			</display:column>
			<display:column title="Phí duy trì mã" headerClass="transhead" class="transdata fees_maintenance_${model.offset + list2_rowNum}" style="border: 1px solid #CCC;text-align:right;">
				<fmt:formatNumber value="${feesMap[list2.id] - createFee * fn:length(list2.sms_charging.shortcodes)}" currencyCode="VND" />
			</display:column>
			<display:footer>
			    <tr>
			      <td colspan="6" align="right" class="transdata"> <strong>Tổng số:</strong> </td>
			      <td align="right" class="transdata fees_total" colspan="2">
			      	<strong><fmt:formatNumber value="${feesMap['total']}" currencyCode="VND" /></strong>
			      </td>
			    <tr>
		  	</display:footer>
		</display:table>
		</div>
	</div>
</c:if>

<c:if test="${param.a == 'sms_command_code_provider_approved_tmp'}">
	<div class="srv_title">
		Upload Excel File from Telco
	</div>
	<form method="post" name="provider_approved_form" action="<%=request.getContextPath()%>/console/sms-command-code-api.wss" enctype="multipart/form-data">
		<input type="hidden" name="a" value="sms_command_code_provider_approved" />
		<input type="hidden" name="tab" value="${param.tab}" />
		<table>
			<tr>
				<td class="profile_label">
					Provider
				</td>
				<td>
					<select class="product_filter" name="provider" style="margin:0;width:auto;">
						<c:forEach var="provider" items="${providers}">
							<option value="${provider}">${provider}</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Chọn file excel
				</td>
				<td>
					<input type="file" name="smsCommandCodeFile" id="smsCommandCodeFile" class="txt_reglog" style="height: 30px;" />&nbsp;<br />
				</td>
			</tr>
		</table>
		<input type="submit" class="btn_greensmall" value="Kiểm tra" />
		<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall" onclick="$('#lean_overlay').click();" />
	</form>
	<div id="provider_sms_code_list"></div>
	<script type="text/javascript">
	$(document).ready(function() {
		function getDoc(frame) {
		     var doc = null;
		 
		     // IE8 cascading access check
		     try {
		         if (frame.contentWindow) {
		             doc = frame.contentWindow.document;
		         }
		     } catch(err) {
		     }
		 
		     if (doc) { // successful getting content
		         return doc;
		     }
		 
		     try { // simply checking may throw in ie8 under ssl or mismatched protocol
		         doc = frame.contentDocument ? frame.contentDocument : frame.document;
		     } catch(err) {
		         // last attempt
		         doc = frame.document;
		     }
		     return doc;
		 }
		$("form[name=provider_approved_form]").submit(function(e) {
		 
			$('#provider_sms_code_list').html('checking...');
		    var formObj = $(this);
		    var formURL = formObj.attr("action");
		 
		    if(window.FormData !== undefined)  // for HTML5 browsers
		    {
		 
		        var formData = new FormData(this);
		        $.ajax({
		            url: formURL,
		            type: 'POST',
		            data:  formData,
		            mimeType:"multipart/form-data",
		            contentType: false,
		            cache: false,
		            processData:false,
		            success: function(data, textStatus, jqXHR) {
		 				$('#provider_sms_code_list').html(data);
		            },
		            error: function(jqXHR, textStatus, errorThrown) {
		 
		            }           
		       	});
		        
		        e.preventDefault();
		        e.unbind();
		   } else {  //for olden browsers
		        //generate a random id
		        var  iframeId = 'unique' + (new Date().getTime());
		 
		        //create an empty iframe
		        var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');
		 
		        //hide it
		        iframe.hide();
		 
		        //set form target to iframe
		        formObj.attr('target',iframeId);
		 
		        //Add iframe to body
		        iframe.appendTo('body');
		        iframe.load(function(e)
		        {
		            var doc = getDoc(iframe[0]);
		            var docRoot = doc.body ? doc.body : doc.documentElement;
		            var data = docRoot.innerHTML;
		            //data is returned from server.
		            $('#provider_sms_code_list').html(data);
		        });
		 
		    }     
		});
	});
	</script>
</c:if>

<c:if test="${param.a == 'sms_command_code_provider_approved'}">
	<br /><br /><br><br><br>
	<form action="sms-command-code-api.wss" method="post" name="sms_cmd_import">
		<input type="hidden" value="sms_command_code_provider_approved" name="a" />
		<input type="hidden" value="true" name="import" />
		<input type="hidden" value="${provider}" name="provider" />
		<c:forEach var="map" items="${codeAvailableMaps}" varStatus="status">
			<c:set var="cmd" value="${fn:toLowerCase(map.key)}" />
			<c:set var="row" value="${map.value}" />
			<input type="hidden" value="${cmd}" name="cmd" />
			<input type="hidden" value="${row[1]}" name="short_codes_${cmd}" />
			<input type="hidden" value="${row[2]}" name="label_${cmd}" />
			<input type="hidden" value="${row[4]}" name="description_${cmd}" />
			<input type="hidden" value="${row[7]}" name="staff_registered_time_${cmd}" />
			<input type="hidden" value="${row[8]}" name="provider_actived_time_${cmd}" />
		</c:forEach>
	<div class="srv_title">
		Checking Result
		<c:if test="${error == null || fn:length(error) == 0}">
			<ul>
				<c:set var="duppCodeNew" value="0" />
				<li style="color:#f00;">Số mã bị trùng: <strong>${fn:length(codeDupplicateMaps)}</strong>
				<c:if test="${fn:length(codeDupplicateMaps) > 0}"> 
					(Ví dụ: <c:forEach var="map" items="${codeDupplicateMaps}" varStatus="status">
						<c:if test="${codeMaps[fn:toLowerCase(map.key)] == null}"><c:set var="duppCodeNew" value="${duppCodeNew + 1}" /></c:if>
						<c:if test="${status.index < 10}">${fn:toUpperCase(map.key)}</c:if>
						<c:if test="${status.index < 9}">, </c:if>
					</c:forEach>${fn:length(codeDupplicateMaps) > 10?', ...' : ''})
				</c:if>
				</li>
				<li style="color:#f00;">Số mã đã tồn tại trên hệ thống: <strong>${fn:length(codeMaps)}</strong></li>
				<li style="color:#f00;">Số mã mới: <strong>${fn:length(codeAvailableMaps)}</strong></li>
			</ul>
		</c:if>
	</div>
	<c:if test="${error != null && fn:length(error) > 0}">
		<div class="red">${error}</div>
	</c:if>
	<style>
		#sms_command_code_list {overflow-y: auto; max-height: 300px; display: block;}
	</style>
	<c:forEach var="sheet" items="${sheets}">
		<table id="sms_command_code_list" style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;">
			<c:forEach var="row" items="${sheet}" varStatus="status">
				<c:if test="${status.first}">
					<thead>
						<tr>
							<td class="${status.first?'transhead':'transdata'}">STT</td>
							<td class="${status.first?'transhead':'transdata'}">${row[0]}</td>
							<td class="${status.first?'transhead':'transdata'} width130">${row[1]}</td>
							<td class="${status.first?'transhead':'transdata'}">${row[2]}</td>
							<td class="${status.first?'transhead':'transdata'} width130">${row[4]}</td>
							<td class="${status.first?'transhead':'transdata'}">${row[7]}</td>
							<td class="${status.first?'transhead':'transdata'}">${row[8]}</td>
							<%-- <td class="${status.first?'transhead':'transdata'}">${row[9]}</td> --%>
							<td class="${status.first?'transhead':'transdata'}">Trạng thái</td>
						</tr>
					</thead>
				</c:if>
				${status.index == 1?'<tbody>':''}
				<c:if test="${!status.first}">
					<tr class="${codeMaps[fn:toLowerCase(row[0])] != null ? 'reject_row' : ''}" title="${codeMaps[fn:toLowerCase(row[0])] != null ? 'Mã đã tồn tại' : ''}">
						<td class="${status.first?'transhead':'transdata'}" align="right">${status.index}.</td>
						<td class="${status.first?'transhead':'transdata'}">${row[0]}</td>
						<td class="${status.first?'transhead':'transdata'}">${fn:replace(row[1], ',', ', ')}</td>
						<td class="${status.first?'transhead':'transdata'}">${row[2]}</td>
						<td class="${status.first?'transhead':'transdata'}">${row[4]}</td>
						<td class="${status.first?'transhead':'transdata'}">${row[7]}</td>
						<td class="${status.first?'transhead':'transdata'}">${row[8]}</td>
						<%-- <td class="${status.first?'transhead':'transdata'}">${row[9]}</td> --%>
						<td class="${status.first?'transhead':'transdata'}">${row[12].numericCellValue == 2?'reject':'approved'}</td>
					</tr>
				</c:if>
				${status.last?'</tbody>':''}
			</c:forEach>
		</table>
		<c:if test="${param.tab == 'sms_store' && fn:length(codeAvailableMaps) > 0}">
			<input type="submit" class="btn_greensmall" value="Nhập mã lệnh" />
		</c:if>
		<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=sms_cmd_import]').submit(function() {
				if(!confirm('Bạn có chắc chắn muốn nhập danh sách mã lệnh mới cho provider ${param.provider}?'))
					return false;
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if(json.indexOf('1:') == 0) {
						var arr = json.split(':');
						var smsOk = arr[1];
						var smsErr = arr[2];
						if(confirm('Cập nhật danh sách mã mới cho provider ${param.provider} thành công.\n' +
								'Số mã cập nhật: '+smsOk+'\n' +
								'Số mã bị lỗi: '+smsErr+'\n' +
								'Vui lòng refresh lại Kho mã để xem danh sách mã lệnh đã được cập nhật')) {
							var href = location.href;
							if(href.indexOf('tab=sms_store') < 0)
								href += '?tab=sms_store';
							location.href = href;
						}
					} else {
						alert(json);
					}
				}, 'text');
				
				return false;
			});
		});
		</script>
	</c:forEach>
	</form>
</c:if>

<!-- sms_command_code_add_or_edit -->
<c:if test="${param.a == 'sms_command_code_add_or_edit'}">
	<div class="srv_title">
		${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật' } mã SMS
	</div>
	<form method="post" name="sms_command_code_add_or_edit_form" action="<%=request.getContextPath()%>/console/sms-command-code-api.wss">
		<input type="hidden" name="a" value="sms_command_code_add_or_edit" />
		<input type="hidden" name="i" value="${param.i}" />
		<input type="hidden" name="btnSubmit" value="1" />
		<style>
			.sms_form td {padding: 5px 15px 5px 0}
			#sms_service_numbers .number {font-size: 14px;font-weight: bold;}
		</style>
		<table class="sms_form">
			<tr>
				<td class="profile_label">
					Mã SMS
				</td>
				<td>
					<input type="text" name="commandCode" id="commandCode" class="txt_reglog" 
						value="${smsCommandCode.command_code}" 
						style="text-transform: uppercase;" 
						maxlength="10" />
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Thể loại
				</td>
				<td>
					<input type="text" list="group_list" name="group" id="group" class="txt_reglog" value="${smsCommandCode.group}" />
					<datalist id="group_list">
						<option value="Mã có sẵn">Mã có sẵn</option>
						<option value="Xổ số">Xổ số</option>
						<option value="Bóng đá">Bóng đá </option>
						<option value="Game">Game</option>
						<option value="Ứng dụng">Ứng dụng</option>
						<option value="Âm nhạc">Âm nhạc </option>
						<option value="Hình ảnh, logo">Hình ảnh, logo</option>
						<option value="Video">Video</option> 
						<option value="Hướng dẫn sử dụng dịch vụ nhà mạng">Hướng dẫn sử dụng dịch vụ nhà mạng</option> 
						<option value="Thông tin kinh tế, văn hóa, xã hội">Thông tin kinh tế, văn hóa, xã hội</option>
						<option value="Thông tin tuyển sinh">Thông tin tuyển sinh</option>
						<option value="Kết bạn, chat">Kết bạn, chat</option>
						<option value="Chăm sóc khách hàng">Chăm sóc khách hàng</option> 
						<option value="Tư vấn sức khỏe, tâm sinh lý">Tư vấn sức khỏe, tâm sinh lý</option> 
						<option value="Dịch vụ tổng hợp">Dịch vụ tổng hợp</option> 
						<option value="Bình chọn Game show">Bình chọn Game show</option> 
						<option value="Ví điện tử">Ví điện tử</option>
					</datalist>
				</td>
			</tr>
			<tr>
				<td class="profile_label" ${smsCommandCode.provider != '9029'?'valign="top"':''}>
					Provider
				</td>
				<td>
					<select class="product_filter" name="provider" style="margin:0;width:auto;">
						<c:forEach var="provider" items="${providers}">
							<option value="${provider}" ${provider ==  smsCommandCode.provider?'selected="selected"':''}>${provider}</option>
						</c:forEach>
					</select>
					<c:if test="${smsCommandCode.provider != '9029'}">
						<c:set var="scodes" value="," />
						<c:forEach var="short_code" items="${smsCommandCode.short_codes}">
							<c:set var="scodes" value="${scodes}${fn:substring(fn:trim(short_code), 1, 2)}," />
						</c:forEach>
						<fieldset style="float:right;border: solid 1px #ccc;" class="service_number_group">
						<legend><input type="checkbox" name="all_service_numbers" value="" ${fn:length(smsCommandCode.short_codes) == 8?'checked="checked"':'' } /> Tất cả</legend>
						<table id="sms_service_numbers" style="margin-left: 2px;">
							<tr>
								<td style="padding-right: 20px;"><input type="checkbox" value="80xx" name="service_numbers" ${fn:contains(scodes, ',0,')?'checked="checked"':''}
									id="chck_80xx" /> <label for="chck_80xx">x<span class="number">0</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="81xx" name="service_numbers" ${fn:contains(scodes, ',1,')?'checked="checked"':''}
									id="chck_81xx" /> <label for="chck_81xx">x<span class="number">1</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="82xx" name="service_numbers" ${fn:contains(scodes, ',2,')?'checked="checked"':''}
									id="chck_82xx" /> <label for="chck_82xx">x<span class="number">2</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="83xx" name="service_numbers" ${fn:contains(scodes, ',3,')?'checked="checked"':''}
									id="chck_83xx" /> <label for="chck_83xx">x<span class="number">3</span>xx</label></td>
							</tr>
							<tr>		
								<td style="padding-right: 20px;"><input type="checkbox" value="84xx" name="service_numbers" ${fn:contains(scodes, ',4,')?'checked="checked"':''}
									id="chck_84xx" /> <label for="chck_84xx">x<span class="number">4</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="85xx" name="service_numbers" ${fn:contains(scodes, ',5,')?'checked="checked"':''}
									id="chck_85xx" /> <label for="chck_85xx">x<span class="number">5</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="86xx" name="service_numbers" ${fn:contains(scodes, ',6,')?'checked="checked"':''}
									id="chck_86xx" /> <label for="chck_86xx">x<span class="number">6</span>xx</label></td>
								<td style="padding-right: 20px;"><input type="checkbox" value="87xx" name="service_numbers" ${fn:contains(scodes, ',7,')?'checked="checked"':''}
									id="chck_87xx" /> <label for="chck_87xx">x<span class="number">7</span>xx</label></td>
							</tr>
						</table>
						<script type="text/javascript">
							$(document).ready(function() {
								if($('.service_number_group input[name=all_service_numbers]').attr('checked') == 'checked')
									$('#sms_service_numbers input[type=checkbox]').attr('checked', 'checked');
								
								$('.service_number_group input[name=all_service_numbers]').click(function() {
									if(this.checked) {
										$(this).closest('.service_number_group').find('input[type=checkbox]').attr('checked', 'checked');
									} else {
										$(this).closest('.service_number_group').find('input[type=checkbox]').removeAttr('checked');
									}
								});
							});
						</script>
						</fieldset>
					</c:if>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Publisher
				</td>
				<td>
					<select class="product_filter" name="publisher" style="margin:0;width:auto;">
						<option value="1PAY">1PAY</option>
					</select>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Merchant
				</td>
				<td>
					<input type="text" name="merchant" id="merchant" class="txt_reglog" value="${smsCommandCode.merchant}" />
				</td>
			</tr>
			<tr>
				<td class="profile_label" valign="top">
					Mô tả
				</td>
				<td>
					<textarea rows="5" name="description" id="description" class="txtarea_reglog" style="width:345px;">${smsCommandCode.description}</textarea>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					Provider Status
				</td>
				<td>
					<c:forEach var="st" items="${allStatus}">
						<input type="radio" name="providerStatus" id="providerStatus" value="${st}" ${(smsCommandCode.provider_action == st || (smsCommandCode.provider_action == 'init' && st=='pending'))?'checked="checked"':'' } /> ${st=='approved'?'<img src="../images/tick.png" /> Đã duyệt':'<img src="../images/invalid.png" /> Chờ duyệt'}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
			<tr>
				<td class="profile_label">
					1Pay Status
				</td>
				<td>
					<c:forEach var="st" items="${allStatus}">
						<input type="radio" name="status" id="status" value="${st}" ${(smsCommandCode.status == st || (smsCommandCode.status == 'init' && st=='pending'))?'checked="checked"':'' } /> ${st=='approved'?'<img src="../images/tick.png" /> Đã duyệt':'<img src="../images/invalid.png" /> Chờ duyệt'}
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
					</c:forEach>
				</td>
			</tr>
		</table>
		<br />
		<input type="submit" class="btn_greensmall" value="${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật' }" />
		<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall" onclick="$('#lean_overlay').click();" />
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=sms_command_code_add_or_edit_form]').submit(function() {
				var label = "${(param.i == null || fn:length(param.i) == 0)?'Tạo mới':'Cập nhật'}";
				var provider = $('form[name=sms_command_code_add_or_edit_form] select[name=provider]').val();
				var commandCode = $('form[name=sms_command_code_add_or_edit_form] input[name=commandCode]').val();
			
				if(!confirm('Bạn có chắc chắn muốn '+label+' mã lệnh cho provider ' + 
						provider + "?"))
					return false;
				
				if(!/^[a-zA-Z0-9]+$/.test(commandCode)) {
					alert('Mã SMS không hợp lệ (chỉ chứa kí tự và số, không vượt quá 10 kí tự)');
					return false;
				}
				
				if($('form[name=sms_command_code_add_or_edit_form] input[name=providerStatus]:checked').val() == 'pending'
					&& $('form[name=sms_command_code_add_or_edit_form] input[name=status]:checked').val() == 'approved') {
					alert('Provider đang chờ duyệt thì 1Pay không thể duyệt.');
					return false;
				}
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if(json == '1') {
						if(confirm(label + ' mã mới cho provider ' + 
								provider + " thành công.\n" +
								'Vui lòng refresh lại Kho mã để xem danh sách mã lệnh đã được cập nhật')) {
							var href = location.href;
							if(href.indexOf('tab=sms_store') < 0)
								href += '?tab=sms_store';
							location.href = href;
						}
					} else {
						alert(json);
					}
				}, 'text');
				
				return false;
			});
		});
		</script>
</c:if>