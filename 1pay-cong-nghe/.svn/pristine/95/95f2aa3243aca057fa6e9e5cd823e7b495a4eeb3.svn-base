<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<jsp:include page="merchant-refund.css.jsp" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('content_info'); });
</script>

</head>
<body>
	<script type="text/javascript">
		//add and edit records
		$(document).ready(function(){
			$('.add_record_popup').live('click', function(){
				$('form[name=create_record] input[name=submit_record]').val("Tạo mới");
				$('#add_record_popup .record_title').html('Lập phiếu chăm sóc khách hàng');
			
				nicEditors.findEditor( "content_info" ).setContent('');
				$('form[name=create_record]').trigger('reset');
				
				//CARDS
				var provider2 = $('#add_record_popup form[name=create_record] select[name=provider]');
				resetProvider(provider2, 'CARD');
				//AMOUNT
				var amount2 = $('#add_record_popup form[name=create_record] select[name=amount]');
				resetAmount(amount2, 'CARD');
			});
			
			//Edit
			$('.edit_record_popup').live('click', function(){
				$('form[name=create_record] input[name=submit_record]').val("Cập nhật");
				$('#add_record_popup .record_title').html('Sửa phiếu chăm sóc khách hàng');
			
				var id = $(this).attr("id");
				var merchant = $(this).attr("merchant"); 
				var service = $(this).attr("service");
				var telco = $(this).attr("telco");
				var amount = $(this).attr("amount");
				//var description = $(this).attr("description");
				
				//alert('id: ' +id +' ' + $('textarea[name=tara'+id+']').val());
				nicEditors.findEditor( "content_info" ).setContent($('#tara'+id+'').val());
				
				
				$('form[name=create_record] input[name=id]').val(id);
				$('form[name=create_record] input[name=merchant]').val(merchant);
				$('form[name=create_record] select[name=service]').val(service);
				$('form[name=create_record] select[name=telco]').val(telco);
				
				$('form[name=create_record] select[name=type]').val($(this).attr("type"));
				$('form[name=create_record] input[name=title]').val($(this).attr("title"));
				
				//add
				var amount2 = $('#add_record_popup form[name=create_record] select[name=amount]');
				resetAmount(amount2, service);
				$('form[name=create_record] select[name=amount]').val(amount);
				
				var provider2 = $('#add_record_popup form[name=create_record] select[name=provider]');
				resetProvider(provider2, service);
				$('form[name=create_record] select[name=provider]').val($(this).attr("provider"));
			});
			
			//Transform
			var serviceValue = '<c:out value="${model.cardService }"/>';
			if( serviceValue != ''){
				//services
				var service = $('#add_record_popup form[name=create_record] select[name=service]');
				service.html('');
				service.append('<option value="'+serviceValue + '" >'+serviceValue+'</option>');
				
			}
			$('.transform_record_popup').live('click', function(){
				$('form[name=create_record] input[name=submit_record]').val("Lập phiếu");
				$('#add_record_popup .record_title').html('Lập phiếu chăm sóc khách hàng');
			
				var id = $(this).attr("id");
				var merchant = $(this).attr("merchant"); 
				var service = $(this).attr("service");
				var telco = $(this).attr("telco");
				var amount = $(this).attr("amount");
				var provider = $(this).attr("provider");
				
				var serial = $(this).attr("serial");
				var created_time = $(this).attr("created_time");
				
				var sequence = $(this).attr("sequence");
				var pin = $(this).attr("pin");
				var updated_time = $(this).attr("updated_time");
				var message = $(this).attr("message");
				
				var content = '<br/>---------------------------------------------------------------------<br/>' +
					'<b>Serial:</b> ' + serial+'<br/>' +
					'<b>Pin:</b> '+pin+'<br/>' +
					'<b>Số lần cập nhật:</b> '+sequence+'<br/>' +
					'<b>Lần cập nhật cuối:</b> '+updated_time+'<br/>' +
					'<b>Message:</b> '+message+'<br/>' +
					'Hệ thống đơn vị phát hành (Telco) bị lỗi hoặc quá tải, thẻ có thể bị trừ, cần phối hợp với 1pay.vn để tra soát.'
					;
				
				//alert('id: ' +id +' ' + $('textarea[name=tara'+id+']').val());
				nicEditors.findEditor( "content_info" ).setContent(content);
				
				
				$('form[name=create_record] input[name=id]').val(id);
				
				$('form[name=create_record] input[name=merchant]').html('');
				$('form[name=create_record] input[name=merchant]').val(merchant);
				
				$('form[name=create_record] select[name=service]').val(service);
				
				$('form[name=create_record] select[name=telco]').html('');
				$('form[name=create_record] select[name=telco]').append('<option value="'+convertTelcoName(telco)+'" >'+convertTelcoName(telco)+'</option>');
				
				$('form[name=create_record] select[name=type]').html('');
				$('form[name=create_record] select[name=type]').append('<option value="'+$(this).attr("type")+'" >'+'Giảm cộng'+'</option>');
				
				var title = '[1Pay_'+merchant+'] Giải quyết khiếu nại thẻ ' + telco + ', serial: ' + serial + ', ngày: ' + created_time;
				$('form[name=create_record] input[name=title]').val(title);
				
				$('form[name=create_record] select[name=amount]').html('');
				$('form[name=create_record] select[name=amount]').append('<option value="'+amount+'" >'+amount+'</option>');
				$('form[name=create_record] select[name=provider]').html('');
				$('form[name=create_record] select[name=provider]').append('<option value="'+provider+'" >'+provider+'</option>');
				
				$('form[name=create_record] input[name=cardFuzzyID]').val($(this).attr("cardFuzzyID"));
				
				
			});
			
			function convertTelcoName(telco){
				if(telco == 'vinaphone')
					return 'VNP';
				if(telco == 'viettel')
					return 'VTM';
				if(telco == 'mobifone')
					return 'VMS';
				if(telco == 'vietnammobile')
					return 'VNM';
				
				return telco;
			}
			
			//Init amount
			//services
			$('#add_record_popup form[name=create_record] select[name=service]').live('click', function(){
				if( serviceValue != ''){
					return;
				}
				
				var amount = $('#add_record_popup form[name=create_record] select[name=amount]');
				var provider = $('#add_record_popup form[name=create_record] select[name=provider]');
				
				amount.html('');
				provider.html('');
				
				resetAmount(amount, $(this).val());
				resetProvider(provider, $(this).val());
			});
			
			//tecols
			$('#add_record_popup form[name=create_record] select[name=telco]').live('click', function(){
				if( serviceValue != ''){
					return;
				}
			
				/* var service = $('#add_record_popup form[name=create_record] select[name=service]').val();
				var telco = $(this).val();
				
				var amount = $('#add_record_popup form[name=create_record] select[name=amount]');
				
				resetAmount(amount, service); */
					
			});
			function resetProvider(provider, service){
				provider.html('');
				
				if(service == 'CARD'){
					<c:forEach items="${model.cardProviders }" var="item">
						var v = '<c:out value="${item }"/>';
						provider.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				
				if(service == 'SMS'){
					<c:forEach items="${model.smsProviders }" var="item">
						var v = '<c:out value="${item }"/>';
						provider.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				
				if(service == 'WAP'){
					<c:forEach items="${model.wapProviders }" var="item">
						var v = '<c:out value="${item }"/>';
						provider.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				if(service == 'IAC'){
					<c:forEach items="${model.iacProviders }" var="item">
						var v = '<c:out value="${item }"/>';
						provider.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
			}
			
			function resetAmount(amount, service){
				amount.html('');
				
				if(service == 'CARD'){
					<c:forEach items="${model.card_price_ranges }" var="item">
						var v = '<c:out value="${item }"/>';
						amount.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				
				if(service == 'SMS'){
					<c:forEach items="${model.sms_price_ranges }" var="item">
						var v = '<c:out value="${item }"/>';
						amount.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				
				if(service == 'WAP'){
					<c:forEach items="${model.wap_price_ranges }" var="item">
						var v = '<c:out value="${item }"/>';
						amount.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
				if(service == 'IAC'){
					<c:forEach items="${model.iac_price_ranges }" var="item">
						var v = '<c:out value="${item }"/>';
						amount.append('<option value="'+v+'" >'+v+'</option>');
						
					</c:forEach>
				}
			}
			
			$('#add_record_popup form[name=create_record]').submit(function(){
				if(!confirm('Bạn có chắc chắn?'))
					return false;
				var id =  $('form[name=create_record] input[name=id]').val();
				
				var merchant = $('form[name=create_record] input[name=merchant]').val();
				var service = $('form[name=create_record] select[name=service]').val();
				var telco = $('form[name=create_record] select[name=telco]').val();
				
				var amount = $('form[name=create_record] select[name=amount]').val();
				
				var type = $('form[name=create_record] select[name=type]').val();
				var title = $('form[name=create_record] input[name=title]').val();
				var provider = $('form[name=create_record] select[name=provider]').val();
				
				var cardFuzzyID = $('form[name=create_record] input[name=cardFuzzyID]').val();
				//var description = $('form[name=create_record] textarea[name=description]').val();
				
				//var nicE = new nicEditors.findEditor('content_info');
				var description = nicEditors.findEditor('content_info').getContent();
				//alert(description);
				
				if(title.trim() == ""){
					alert('Tiêu đề không được trống');
					return false;
				}
				if(amount.trim() == ""){
					alert('Doanh thu không được trống');
					return false;
				}
				if(provider.trim() == ""){
					alert('Nhà cung cấp không được trống');
					return false;
				}
				if(description.trim() == "" || description.trim() == "<br>"){
					alert('Nội dung không được trống');
					return false;
				}
				var action = "ADD_EDIT";
				$.ajax({
					type : "post",
					url  : "merchant-refund-ajax.html",
					data : "action=" + action + "&id=" + id + "&merchant=" + merchant + "&service=" + service + "&telco=" + telco + "&amount=" + amount + "&type=" + type+ "&title=" + title+ "&provider=" + provider + "&description=" + description + "&cardFuzzyID=" + cardFuzzyID, 
					success : function(data){
						console.log("DATA: " + data);
						if(data == "1"){
							alert("Lưu phiếu chăm sóc khách hàng thành công.");
							$(location).attr('href', location.href);
						}else if(data == "0"){
							alert("Lưu phiếu chăm sóc khách hàng lỗi.");
						}
						else if(data == "2"){
							alert("Bạn không có quyền tạo phiếu");
						}
						else if(data == "3"){
							alert("Merchant không tồn tại");
						}
						else if(data == "4"){
							alert("Dịch vụ không tồn tại");
						}
						else if(data == "5"){
							alert("Nhà mạng không tồn tại");
						}
						else if(data == "6"){
							alert("Nội dung không được trống.");
						}
						else if(data == "7"){
							alert("Bạn không có quyền sửa");
						}
						else if(data == "8"){
							alert("Giá trị doanh thu không đúng");
						}
						else if(data == "9"){
							alert("Tiêu đề không được trống");
						}
						else if(data == "10"){
							alert("Nhà cung cấp không được trống");
						}
						else if(data == "11"){
							alert("Kiểu tiền không đúng");
						}
						else if(data == "12"){
							alert("Nhà cung cấp không đúng");
						}
						
						else if(data == "13"){
							alert("Dữ liệu đã được chuyển đổi");
						}
						
					}
				
				});
				
				return false;
			});
			
			function htmlEncode(value){
			  //create a in-memory div, set it's inner text(which jQuery automatically encodes)
			  //then grab the encoded contents back out.  The div never exists on the page.
			  return $('<div/>').text(value).html();
			}

			function htmlDecode(value){
			  return $('<div/>').html(value).text();
			}
		});
	</script>
	
	<div id="add_record_popup">
		<h1 class="srv_title"><span class="record_title">Lập phiếu chăm sóc khách hàng</span></h1>
		<form action="" method="get" name="create_record">
			<input type="hidden" name="id" value=""/>
			<input type="hidden" name="cardFuzzyID" value=""/>
			
			<div style="display: -webkit-box; border: 1px solid #ccc; padding: 10px;font-size: 14px;border-radius: 5px;">
				<table width="100%">
				<tr><td>
				
				<table width="100%">
				
					<tr>
						<td width="15%" class="text_al_right">Merchant:</td>
						<td width="35%">
							<input id="merchant" list="listForSearchMC" maxlength="100" name="merchant" class="merchant_filter" placeholder="Nhập tên merchant" style="margin-left: 5%; width: 85%;"/>
							<%-- <select class="select_full_style" name="merchant">
								<c:forEach items="${model.merchants }" var="item">
									<option value="${item }">${item }</option>
								</c:forEach>
							</select> --%>
						</td>
						<td width="15%"></td>
						<td width="35%"></td>
						
					</tr>
					
					<tr>
						<td class="text_al_right">Dịch vụ:</td>
						<td>
							<select class="select_full_style" name="service">
								<c:forEach items="${model.chargingServices }" var="item">
									<option value="${item }">${item }</option>
								</c:forEach>
							</select>
						</td>
						<td class="text_al_right">Nhà mạng:</td>
						<td>
							<select class="select_full_style" name="telco">
								<c:forEach items="${model.telcos }" var="item">
									<option value="${item }">${item }</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					
					<tr>
						<td class="text_al_right" title="Doanh thu khách hàng">DT khách hàng:</td>
						<td>
							<!-- <input class="input_number" type="number" name="amount" value="0"/> -->
							<select class="select_full_style" name="amount">
								
							</select>
							
						</td>
						<td class="text_al_right">Kiểu tiền:</td>
						<td>
							<select class="select_full_style" name="type">
								<c:forEach items="${model.types }" var="item">
									<option value="${item }">${item == 0?'Giảm trừ':'Giảm cộng'}</option>
								</c:forEach>
							</select>
						</td>
					</tr>
					
					<tr>
						<td width="15%" class="text_al_right">Nhà cung cấp:</td>
						<td>
							<!-- <input class="input_txt" name="provider" style="margin-left: 2.2%;" type="text" placeholder="Nhập tên nhà cung cấp"/> -->
							<select class="select_full_style" name="provider">
								
							</select>
						</td>
					</tr>
				</table>
				</td></tr>
				<tr><td>
				<table width="100%" style="margin-top: 10px;">
					
					<tr>
						<td class="text_al_right">Tiêu đề:</td>
						<td>
							<input class="input_txt" name="title" style="margin-left: 2.2%;" type="text" placeholder="Nhập tiêu đề"/>
						</td>
					</tr>
					<tr>
						<td class="text_al_right">Nội dung:</td>
						<td>
							<div style="margin-left: 2.2%; display: block;">
								<textarea  id="content_info" class="input_txt" style="width: 650px; height: 200px; margin-left: 50px;" cols="800" rows="50"  placeholder="Nhập nội dung" name="description"></textarea>
							</div>
						</td>
						
					</tr>
				</table>
				</td></tr>
				</table>
			</div>	
				<table align="center">
					<tr>
						
						<td colspan="3">
							<input name="submit_record" class="btn_greensmall" type="submit" value="Tạo mới" />
							<input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
						</td>
					</tr>
				</table>
				
			
		</form>
	</div>
</body>
</html>