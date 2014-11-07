<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<c:set var="okLabel" value="Đề nghị" />
<c:if test="${model.isAdmin}">
	<c:set var="okLabel" value="Duyệt" />
</c:if>

<div id="cardchar_pop">
<c:choose>
	<c:when test="${!model.isAdmin && !model.chargingConfirms['card']}">
		<div class="charging_confirm">
			Bạn chưa ký hợp đồng điện tử card charging, vui lòng ký hợp đồng điện tử sms charging <a href="<%=request.getContextPath() %>/dich-vu.html?n=card">tại đây</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Đóng</a>
		</div>
	</c:when>
	<c:otherwise>
	<form action="<%=request.getContextPath()%>/console/ajax.wss"
		method="post" name="card_post">
		<input type="hidden" name="go_card_access_key" value="" /> 
		<input type="hidden" name="go_card_secret_key" value="" /> <input
			type="hidden" name="a" value="card_charging_register" /> <input
			type="hidden" name="pid" value="go_card_pid" />

		<div class="pop_box">
			<div class="product_title">
				Sản phẩm: <span class="go_card_product_name"></span>
			</div>
			<h1 class="srv_title">Card Charging</h1>
			<div class="srv_row">Để kích hoạt phương thức thanh toán này
				cho sản phẩm của bạn, xin vui lòng làm theo các bước sau:</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 1</label>Dùng tài liệu kết nối <strong>API</strong>
				với <strong>Access Key</strong>: <span class="go_card_access_key"></span> và <strong>Secret Key</strong>: <span class="go_card_secret_key"></span><br />
				tiến hành kết nối tới hệ thống của <strong>1Pay</strong> theo hướng
				dẫn trong tài liệu. Bạn chọn một trong những hình thức kết nối sau:
			</div>
			<div class="srv_row">
				<a href="http://dev.1pay.vn" class="btn_api">APIs</a>
				<a href="http://dev.1pay.vn" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 2</label>Thực hiện nạp thẻ (mệnh giá bất
				kỳ) thông qua <strong>sản phẩm</strong> đã kết nối.
			</div>

			<div class="srv_row">
				<label class="lbl_moi">Bước 3</label>Nhấn nút <strong>[Kích
					Hoạt]</strong> bên dưới và chờ hệ thống <strong>1Pay</strong> kích hoạt tự
				động thanh toán cho sản phẩm của bạn.
			</div>
		</div>
		<div>
			<input type="hidden" name="submit2" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isAdmin}">
				<input type="submit" name="reject" value="Từ chối" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=card_post] input[type=submit]').live('click', function() {
					$('form[name=card_post] input[name=submit2]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=card_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if ($.isNumeric(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess ='Khai báo card charging của sản phẩm này được duyệt thành công';
									var pid = $('form[name=card_post] input[name=pid]').val();
									if(x == 1) {//Chờ duyệt
										$('.go_card'+pid).attr('class','card_normal go_card go_card'+pid);
										$('.go_card'+pid).attr('title','Chờ duyệt');
										$('.go_card'+pid).attr('state','normal');
										if($.trim($('.go_card'+pid).text()).length > 0) {
											$('.go_card'+pid).text('Chờ duyệt');
										}
										mess ='Bạn đã đăng ký card charging cho sản phẩm này, sau khi được duyệt bạn có thể sử dụng';
									} else if(x == 2) {//Từ chối
										$('.go_card'+pid).attr('class','card_reject go_card go_card'+pid);
										$('.go_card'+pid).attr('title','Reject');
										$('.go_card'+pid).attr('state','reject');
										if($.trim($('.go_card'+pid).text()).length > 0) {
											$('.go_card'+pid).text('Reject');
										}
										mess ='Khai báo card charging của sản phẩm này bị từ chối';
									} else if(x == 4) {//Đã kích hoạt
										$('.go_card'+pid).attr('class','card_active go_card go_card'+pid);
										$('.go_card'+pid).attr('title','Đã kích hoạt');
										$('.go_card'+pid).attr('state','active');
										if($.trim($('.go_card'+pid).text()).length > 0) {
											$('.go_card'+pid).text('Đã kích hoạt');
										}
									}
									alert(mess);
									$('.modal_close').click();
								} else {
									alert('Kích hoạt không thành công');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</c:otherwise>
</c:choose>
</div>

<div id="smschar_pop">
<c:choose>
	<c:when test="${!model.isAdmin && !model.chargingConfirms['sms']}">
		<div class="charging_confirm">
			Bạn chưa ký hợp đồng điện tử sms charging, vui lòng ký hợp đồng điện tử sms charging <a href="<%=request.getContextPath() %>/dich-vu.html?n=sms">tại đây</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Đóng</a>
		</div>
	</c:when>
	<c:otherwise>
	<form action="<%=request.getContextPath()%>/console/ajax.wss"
		method="post" name="sms_post">
		<input type="hidden" name="a" value="sms_charging_register" /> <input
			type="hidden" name="pid" value="go_sms_pid" />
		<div class="pop_box">
			<div class="product_title">
				Sản phẩm: <span class="go_sms_product_name"></span>
			</div>
			<h1 class="srv_title">SMS Charging</h1>
			<div class="srv_row">Để kích hoạt phương thức thanh toán này
				cho sản phẩm của bạn, xin vui lòng làm theo các bước sau:</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 1</label> Chọn đầu số: <select
					name="service_number">
					<option value="8x38">8x38</option>
				</select>

			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 2</label> Chọn mã nhắn tin CMDCODE <span
					class="other_info">(không quá 5 ký tự)</span>:<br />
					<input type="radio" name="radio_cmd" value="selectCmd" />&nbsp;
					<select name="select_service_code">
						<c:forEach var="lb" items="${model.cmdCodeMap}">
							<optgroup label="${lb.key}">
								<c:forEach var="item" items="${lb.value}">
									<option value="${item}"><c:out value="${item}" /></option>
								</c:forEach>
							</optgroup>
						</c:forEach>
					</select> 
					<br />&nbsp;&nbsp;&nbsp;(Mã dùng được ngay)<br />
					
					<input type="radio" name="radio_cmd" value="txtCmd" checked="checked" />&nbsp; 
					<input type="text" placeholder="ABCDE"
					value="" name="service_code" /> <a class="link_chitiet service_code_check"
					href="#">Kiểm tra</a> <span id="cmd_check_result" class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<br />&nbsp;&nbsp;&nbsp;(Mã phải chở đăng ký)
				<div id="service_code_check_temp" style="display: none;"></div>
				<script type="text/javascript">
             		$(document).ready(function() {
             			$('.service_code_check').live('click', function() {
             				var pid = $('form[name=sms_post] input[name=pid]').val();
             				var serviceCode = $('form[name=sms_post] input[name=service_code]').val();
             				
             				//Check valid
            				if(serviceCode.length==0 || serviceCode.length>5) {
            					alert('Mã nhắn tin không được quá 5 ký tự');
            					return false;
            				}
             				
             				var serviceNumber = $('form[name=sms_post] select[name=service_number] :selected').text();
							var url = '<%=request.getContextPath()%>/console/ajax.wss?a=service_code_check&service_code='+serviceCode+'&service_number='+serviceNumber+'&pid='+pid;
							
							$('#service_code_check_temp').load(url, function(responseTxt,statusTxt,xhr){
								var result = responseTxt + ''; 
								if(result == '1') {
									$('#cmd_check_result').attr('class','valid_sms_cmd');
									alert('Mã tin nhắn "'+serviceCode+'" với đầu số "'+serviceNumber+'" đã tồn tại');
								} else {
									$('#cmd_check_result').attr('class','invalid_sms_cmd');
									alert('Mã tin nhắn "'+serviceCode+'" với đầu số "'+serviceNumber+'" hợp lệ');
								}
							});
              			});
              		});
              	</script>
			</div>
			<div id="sms_service_numbers">
				<div class="li_row">
					<table>
						<tr>
							<td style="padding-right: 20px;"><input type="checkbox" value="80xx" name="service_numbers"
								id="chck_80xx" /> <label for="chck_80xx">80xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="81xx" name="service_numbers"
								id="chck_81xx" /> <label for="chck_81xx">81xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="82xx" name="service_numbers"
								id="chck_82xx" /> <label for="chck_82xx">82xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="83xx" name="service_numbers"
								id="chck_83xx" /> <label for="chck_83xx">83xx</label></td>
						</tr>
					</table>
				</div>
				<div class="li_row">
					<table>
						<tr>
							<td style="padding-right: 20px;"><input type="checkbox" value="84xx" name="service_numbers"
								id="chck_84xx" /> <label for="chck_84xx">84xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="85xx" name="service_numbers"
								id="chck_85xx" /> <label for="chck_85xx">85xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="86xx" name="service_numbers"
								id="chck_86xx" /> <label for="chck_86xx">86xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="87xx" name="service_numbers"
								id="chck_87xx" /> <label for="chck_87xx">87xx</label></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="li_row">
				Url nhận MO
				<br />
				<input type="text" name="mo_receive_url" value="" placeholder="http://example.com/mo_receive" style="width: 545px; " />
			</div>
			<div class="li_row">
				Kịch bản <strong>MO</strong> (tin nhắn KH gửi đến đầu số) &lt; 100
				ký tự, tiếng việt không dấu <br />
				<textarea class="txtarea_reglog" rows="1" name="mo" placeholder="ABCDE Nap handoivodoi"></textarea>
			</div>
			<div class="li_row">
				Kịch bản <strong>MT</strong> (tin nhắn trả về KH) &lt; 150 ký tự,
				tiếng việt không dấu <br />
				<textarea class="txtarea_reglog" rows="1" name="mt" placeholder="Nap tien thanh cong 100.000 WIN cho tai khoan handoivodoi"></textarea>
			</div>			
			<!-- 
			<div class="srv_row">
				<label class="lbl_moi">Bước 3</label>Dùng tài liệu kết nối <strong>API</strong>
				tiến hành kết nối tới hệ thống của <strong>1Pay</strong> theo hướng
				dẫn trong tài liệu. Bạn chọn một trong những hình thức kết nối sau:
			</div>
			<div class="srv_row">
				<a href="http://dev.1pay.vn" class="btn_api">APIs</a>
				<a href="#" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 4</label>Thực hiện soạn tin nhắn với cú pháp đã được duyệt thông qua <strong>sản phẩm</strong> đã kết nối.
			</div>

			<div class="srv_row">
				<label class="lbl_moi">Bước 5</label>Nhấn nút <strong>[Kích
					Hoạt]</strong> bên dưới và chờ hệ thống <strong>1Pay</strong> kích hoạt tự
				động thanh toán cho sản phẩm của bạn.
			</div>
			 -->		
		</div>
		<div>
			<input type="hidden" name="submit2" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isAdmin}">
				<input type="submit" name="reject" value="Từ chối" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=sms_post] input[type=submit]').live('click', function() {
					$('form[name=sms_post] input[name=submit2]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=sms_post]').submit(function() {
				//Check valid
				var serviceCode = $(this).find('input[name=service_code]').val();
				if(($(this).find('input[name=radio_cmd]:checked').val() == 'txtCmd')
						&& (serviceCode.length==0 || serviceCode.length>5)) {
					alert('Mã nhắn tin không được quá 5 ký tự');
					return false;
				}
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if ($.isNumeric(json)) {
						var x = parseInt(json);
						if (x > 0) {
							var mess = 'Khai báo sms charging của sản phẩm này được duyệt thành công';
							var pid = $('form[name=sms_post] input[name=pid]').val();
							if(x == 1) {//Chờ duyệt
								$('.go_sms'+pid).attr('class','sms_normal go_sms go_sms'+pid);
								$('.go_sms'+pid).attr('title','Chờ duyệt');
								$('.go_sms'+pid).attr('state','normal');
								if($.trim($('.go_sms'+pid).text()).length > 0) {
									$('.go_sms'+pid).text('Chờ duyệt');
								}
								mess = 'Bạn đã đăng ký sms charging cho sản phẩm này, sau khi được duyệt bạn có thể sử dụng';
							} else if(x == 2) {//Từ chối
								$('.go_sms'+pid).attr('class','sms_reject go_sms go_sms'+pid);
								$('.go_sms'+pid).attr('title','Reject');
								$('.go_sms'+pid).attr('state','reject');
								if($.trim($('.go_sms'+pid).text()).length > 0) {
									$('.go_sms'+pid).text('Reject');
								}
								mess = 'Khai báo sms charging của sản phẩm này bị từ chối';
							} else if(x == 4) {//Đã kích hoạt
								$('.go_sms'+pid).attr('class','sms_active go_sms go_sms'+pid);
								$('.go_sms'+pid).attr('title','Đã kích hoạt');
								$('.go_sms'+pid).attr('state','active');
								if($.trim($('.go_sms'+pid).text()).length > 0) {
									$('.go_sms'+pid).text('Đã kích hoạt');
								}
							}
							alert(mess);
							$('.modal_close').click();
						} else {
							alert('Kích hoạt không thành công');
						}
					} else {
						alert(json);
					}
				}, 'text');
				return false;
			});
		});
	</script>
	</c:otherwise>
</c:choose>
</div>

<div id="wapchar_pop">
<c:choose>
	<c:when test="${!model.isAdmin && !model.chargingConfirms['wap']}">
		<div class="charging_confirm">
			Bạn chưa ký hợp đồng điện tử wap charging, vui lòng ký hợp đồng điện tử wap charging <a href="<%=request.getContextPath() %>/dich-vu.html?n=wap">tại đây</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Đóng</a>
		</div>
	</c:when>
	<c:otherwise>
	<form action="<%=request.getContextPath()%>/console/ajax.wss"
		method="post" name="wap_post">
		<input type="hidden" name="a" value="wap_charging_register" /> 
		<input type="hidden" name="pid" value="go_wap_pid" />
		<input type="hidden" name="go_wap_access_key" value="" /> 
		<input type="hidden" name="go_wap_secret_key" value="" /> 

		<div class="pop_box">
			<div class="product_title">
				Sản phẩm: <span class="go_wap_product_name"></span>
			</div>
			<h1 class="srv_title">Wap Charging</h1>
			<div class="srv_row">Để kích hoạt phương thức thanh toán này
				cho sản phẩm của bạn, xin vui lòng làm theo các bước sau:</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 1</label>Dùng tài liệu kết nối <strong>API</strong>
				với <strong>Access Key</strong>: <span class="go_wap_access_key"></span> và <strong>Secret Key</strong>: <span class="go_wap_secret_key"></span><br />
				tiến hành kết nối tới hệ thống của <strong>1Pay</strong> theo hướng
				dẫn trong tài liệu. Bạn chọn một trong những hình thức kết nối sau:
			</div>
			<div class="srv_row">
				<a href="http://dev.1pay.vn" class="btn_api">APIs</a>
				<a href="http://dev.1pay.vn" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 2</label>Thực hiện một giao dịch thông qua <strong>sản phẩm</strong> đã kết nối.
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 3</label>Nhấn nút <strong>[Kích
					Hoạt]</strong> bên dưới và chờ hệ thống <strong>1Pay</strong> kích hoạt tự
				động thanh toán cho sản phẩm của bạn.
			</div>
		</div>
		<div>
			<input type="hidden" name="submit2" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isAdmin}">
				<input type="submit" name="reject" value="Từ chối" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Bỏ qua" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=wap_post] input[type=submit]').live('click', function() {
					$('form[name=wap_post] input[name=submit2]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=wap_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if ($.isNumeric(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Khai báo wap charging của sản phẩm này được duyệt thành công';
									var pid = $('form[name=wap_post] input[name=pid]').val();
									if(x == 1) {//Chờ duyệt
										$('.go_wap'+pid).attr('class','wap_normal go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Chờ duyệt');
										$('.go_wap'+pid).attr('state','normal');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Chờ duyệt');
										}
										mess = 'Bạn đã đăng ký wap charging cho sản phẩm này, sau khi được duyệt bạn có thể sử dụng';
									} else if(x == 2) {//Từ chối
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										mess = 'Khai báo wap charging của sản phẩm này bị từ chối';
									} else if(x == 4) {//Đã kích hoạt
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Đã kích hoạt');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Đã kích hoạt');
										}
									}
									alert(mess);
									$('.modal_close').click();
								} else {
									alert('Kích hoạt không thành công');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</c:otherwise>
</c:choose>
</div>

<div id="directchar_pop">
<c:choose>
	<c:when test="${!model.isAdmin && !model.chargingConfirms['direct']}">
		<div class="charging_confirm">
			Bạn chưa ký hợp đồng điện tử direct charging, vui lòng ký hợp đồng điện tử direct charging <a href="#">tại đây</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Đóng</a>
		</div>
	</c:when>
	<c:otherwise>
		Chưa có form đăng ký
	</c:otherwise>
</c:choose>
</div>

<div id="subchar_pop">
<c:choose>
	<c:when test="${!model.isAdmin && !model.chargingConfirms['sub']}">
		<div class="charging_confirm">
			Bạn chưa ký hợp đồng điện tử sub charging, vui lòng ký hợp đồng điện tử sub charging <a href="#">tại đây</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Đóng</a>
		</div>
	</c:when>
	<c:otherwise>
		Chưa có form đăng ký
	</c:otherwise>
</c:choose>
</div>

<c:if test="${model.isAdmin}">
	<script type="text/javascript">
		$(document).ready(function() {
			$("form[name=card_post] .pop_box input").attr("disabled", true);
			$("form[name=sms_post] .pop_box input").attr("readonly", true);
			$("form[name=wap_post] .pop_box input").attr("disabled", true);
			$("form[name=direct_post] .pop_box input").attr("disabled", true);
			$("form[name=sub_post] .pop_box input").attr("disabled", true);

			$("form[name=card_post] .pop_box textarea").attr("disabled", true);
			$("form[name=sms_post] .pop_box textarea").attr("readonly", true);
			$("form[name=wap_post] .pop_box textarea").attr("disabled", true);
			$("form[name=direct_post] .pop_box textarea").attr("disabled", true);
			$("form[name=sub_post] .pop_box textarea").attr("disabled", true);
			
			$("form[name=card_post] .pop_box select").attr("onfocus", "this.blur();");
			$("form[name=sms_post] .pop_box select").attr("onfocus", "this.blur();");
			$("form[name=wap_post] .pop_box select").attr("onfocus", "this.blur();");
			$("form[name=direct_post] .pop_box select").attr("onfocus", "this.blur();");
			$("form[name=sub_post] .pop_box select").attr("onfocus", "this.blur();");

		});
	</script>
</c:if>