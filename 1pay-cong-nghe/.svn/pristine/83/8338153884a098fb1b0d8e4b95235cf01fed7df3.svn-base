<%@page import="vn.onepay.utils.Utils"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%
request.setAttribute("BLACK_LIST_SMS_SERVICE_NUMBERS", SharedConstants.BLACK_LIST_SMS_SERVICE_NUMBERS);
%>

<!-- --------------------------- popup charging type begin------------------------------ -->
<div id="charging_data_temp" style="display: none;"></div>
<style>
	textarea[name=comment] {color:#2c8f39; ${!model.isStaff?'background-color: #eee;':''}}
	#cardchar_pop .srv_title, #smschar_pop .srv_title, #wapchar_pop .srv_title, #iacchar_pop .srv_title {
		float:left;display: block;
	}
	.progressBar {float:right;margin-top: -80px; /* margin-right: -30px; */ border: none; height: 120px; overflow: hidden;width: 400px;}
</style>
<script type="text/javascript">
	var blackListSmsServices = ${fn:replace(fn:replace(fn:replace(BLACK_LIST_SMS_SERVICE_NUMBERS,', ', '","'), '[', '["'), ']', '"]')};
	
	var chargingStatusTilte = {
			"${APPROVED_STATUS}" : "${ALL_CHARGING_STATUS_EN['Đã xác nhận']}",
			"${APPROVED_PENDING_STATUS}" : "${ALL_CHARGING_STATUS_EN['1PAY đã xác nhận']}",
			"${REJECT_STATUS}" : "${ALL_CHARGING_STATUS_EN['Bị từ chối']}",
			"${PENDING_STATUS}" : "${ALL_CHARGING_STATUS_EN['Đã đề nghị']}"
	};
	function clear_form_elements(ele) {
	
	    $(ele).find(':input').each(function() {
	        switch(this.type) {
	            case 'password':
	            case 'select-multiple':
	            case 'select-one':
	            case 'text':
	            case 'textarea':
	                $(this).val('');
	                break;
	            case 'checkbox':
	            case 'radio':
	                //this.checked = false;
	        }
	    });
	
	}
	
	$(document).ready(function() {
		$('.go_card').live('click', function() {
			$('#cardchar_pop .progressBar').attr('src', '<%=request.getContextPath()%>/progress-step.jsp?ver=en&state='+$(this).attr("state"));
			if($("form[name=card_post]").length > 0) {
				$('.go_card_access_key').html($(this).attr('accesskey'));
				$('.go_card_secret_key').html($(this).attr('secretkey'));
				$('.go_card_product_name').html($(this).attr('pname'));
				$('input[name=go_card_access_key]').val($(this).attr('accesskey'));
				$('input[name=go_card_secret_key]').val($(this).attr('secretkey'));
				$('form[name=card_post] input[name=pid]').val($(this).attr('id'));
				
				if('${model.isStaff}' == 'true') {
					if($(this).attr('state') == 'active') {
						$('form[name=card_post] input[name=approve]').css('display', 'none');
						$('form[name=card_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=card_post] input[name=approve]').css('display', 'none');
						$('form[name=card_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'reject') {
						$('form[name=card_post] input[name=approve]').css('display', '');
						$('form[name=card_post] input[name=reject]').css('display', 'none');
					} else {
						$('form[name=card_post] input[name=approve]').css('display', '');
						$('form[name=card_post] input[name=reject]').css('display', '');
					}
					
					if($(this).attr('owner') == 'true') {
						$('form[name=card_post] input[name=reject]').css('display', 'none');
						$('form[name=card_post] input[name=approve]').val('Đề nghị');
						if($(this).attr('state') == 'active') {
							$('form[name=card_post] input[name=approve]').css('display', 'none');
						} else if($(this).attr('state') == 'normal_active') {
							$('form[name=card_post] input[name=approve]').css('display', 'none');
						} else {
							$('form[name=card_post] input[name=approve]').css('display', '');
						}
					}
				} else {
					if($(this).attr('state') == 'active') {
						$('form[name=card_post] input[name=approve]').css('display', 'none');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=card_post] input[name=approve]').css('display', 'none');
					} else {
						$('form[name=card_post] input[name=approve]').css('display', '');
					}
				}
			}
			
			if("leanModal" != $(this).attr('rel')) {
				alert("${model.isStaff?'Unregistered card charging product':'Registered card charging product'}");
				return false;
			}
		});
		$('.go_sms').live('click', function() {
			if($("form[name=sms_post]").length > 0) {
				//reset form
				clear_form_elements($("form[name=sms_post]"));
				$("form[name=sms_post] select[name=service_number] option").css('display', '');
				
				$('form[name=sms_post] .progressBar').attr('src','<%=request.getContextPath()%>/progress-step.jsp?ver=en&state='+$(this).attr("state"));
				
				$('.go_sms_product_name').html($(this).attr('pname'));
				var pid = $(this).attr('id');
				$('form[name=sms_post] input[name=pid]').val(pid);
				$("form[name=sms_post] input[name=service_numbers]").attr('checked', 'checked');
				
				var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=sms&pid='+pid;
				$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
					try {
						var obj = eval ("(" + responseTxt + ")");
						$("form[name=sms_post] select[name=service_number]").val(obj.service_number);
						$("form[name=sms_post] input[name=radio_cmd]").removeAttr('checked');
						$("form[name=sms_post] input[name=radio_cmd]").each(function() {
							if($(this).val() == obj.radio_cmd) {
								$(this).attr('checked', 'checked');
								if($(this).val() == 'selectCmd') {
									$("form[name=sms_post] select[name=select_service_code]").val(obj.service_code.toUpperCase());
									$("form[name=sms_post] input[name=service_code]").val('');
								} else {
									$("form[name=sms_post] input[name=service_code]").val(obj.service_code);
								}
							} else {
								$(this).removeAttr('checked');
							}
						});
						
						serviceChange();
						
						$("form[name=sms_post] input[name=mo_receive_url]").val(obj.mo_receive_url);
						$("form[name=sms_post] .ope_update_result").html('');
						$("form[name=sms_post] .mo_update_result").html('');
						$("form[name=sms_post] input[name=mo]").val(obj.mo);
						$("form[name=sms_post] textarea[name=mt]").val(obj.mt);
						$("form[name=sms_post] input[name=mt_type]").each(function() {
							if($(this).val() == obj.mt_type) {
								$(this).attr('checked', 'checked');
							}else{
								$(this).removeAttr('checked');
							}
						});
						
						var isNewFrm = true;
						try {
							$("form[name=sms_post] input[name=service_numbers]").removeAttr('checked');
							var serviceNumbers = obj.service_numbers;
							$("form[name=sms_post] input[name=service_numbers]").each(function() {
								for(var i=0;i<serviceNumbers.length;i++) {
									var _id = $(this).val();
									var _svNumber = serviceNumbers[i];
									if($(this).attr('id').indexOf(serviceNumbers[i])>0 || _id.charAt(1) == _svNumber.charAt(1)) {
										$(this).attr('checked', 'checked');
										isNewFrm = false;
										break;
									}
								}
							});	
						} catch(e) {}
						
						try {
							$("form[name=sms_post] input[name=operator]").removeAttr('checked');
							var operators = obj.operators;
							$("form[name=sms_post] input[name=operator]").each(function() {
								for(var i=0;i<operators.length;i++) {
									var value = $(this).val();
									var operator = operators[i];
									if(value == operator) {
										$(this).attr('checked', 'checked');
										isNewFrm = false;
										break;
									}
								}
							});
							
							if(operators.length < 4)
								$("form[name=sms_post] input[name=allOpe]").removeAttr('checked');
							else
								$("form[name=sms_post] input[name=allOpe]").attr('checked', 'checked');
						} catch(e) {
							$("form[name=sms_post] input[name=allOpe]").attr('checked', 'checked');
							$("form[name=sms_post] input[name=operator]").attr('checked', 'checked');
						}
						
						if(isNewFrm) {
							$("form[name=sms_post] input[name=service_numbers]").attr('checked', 'checked');
						}
						
						$("form[name=sms_post] textarea[name=comment]").val(obj.comment);
					} catch(e2) {
						$("form[name=sms_post] input[name=allOpe]").attr('checked', 'checked');
						$("form[name=sms_post] input[name=operator]").attr('checked', 'checked');
						serviceChange();
					}
				});
				
		    	$("form[name=sms_post] select[name=service_number] option:not(:selected)").each(function() {
		    		if($.inArray($(this).val(), blackListSmsServices) >= 0) {
		    			$(this).css('display', 'none');
		    		}
		    	});
		    	
				if('${model.isStaff}' == 'true') {
					if($(this).attr('state') == 'active') {
						$('form[name=sms_post] input[name=approve]').css('display', 'none');
						$('form[name=sms_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=sms_post] input[name=approve]').css('display', 'none');
						$('form[name=sms_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'reject') {
						$('form[name=sms_post] input[name=approve]').css('display', '');
						$('form[name=sms_post] input[name=reject]').css('display', 'none');
					} else {
						$('form[name=sms_post] input[name=approve]').css('display', '');
						$('form[name=sms_post] input[name=reject]').css('display', '');
					}
					
					$('form[name=sms_post] textarea[name=comment]').removeAttr('readonly');
					
					if($(this).attr('owner') == 'true') {
						$('form[name=sms_post] input[name=reject]').css('display', 'none');
						$('form[name=sms_post] input[name=approve]').val('Đề nghị');
						if($(this).attr('state') == 'active') {
							$('form[name=sms_post] input[name=approve]').css('display', 'none');
						} else if($(this).attr('state') == 'normal_active') {
							$('form[name=sms_post] input[name=approve]').css('display', 'none');
						} else {
							$('form[name=sms_post] input[name=approve]').css('display', '');
						}
						
						$('form[name=sms_post] textarea[name=comment]').attr('readonly', 'readonly');
					}
				} else {
					if($(this).attr('state') == 'active') {
						$('form[name=sms_post] input[name=approve]').css('display', 'none');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=sms_post] input[name=approve]').css('display', 'none');
					} else {
						$('form[name=sms_post] input[name=approve]').css('display', '');
					}
					
					$('form[name=sms_post] textarea[name=comment]').attr('readonly', 'readonly');
				}
			}
			
			if("leanModal" != $(this).attr('rel')) {
				alert("${model.isStaff?'Unregistered sms charging product':'Registered sms charging product'}");
				return false;
			}
		});
		$('.go_wap').live('click', function() {
			var pid = $(this).attr('id');
			if($("form[name=wap_post]").length > 0) {
				//reset form
				clear_form_elements($("form[name=wap_post]"));
				
				$('form[name=wap_post] .progressBar').attr('src', '<%=request.getContextPath()%>/progress-step.jsp?ver=en&state='+$(this).attr("state"));
				
				$('.go_wap_access_key').html($(this).attr('accesskey'));
				$('.go_wap_secret_key').html($(this).attr('secretkey'));
				$('.go_wap_product_name').html($(this).attr('pname'));
				$('input[name=go_wap_access_key]').val($(this).attr('accesskey'));
				$('input[name=go_wap_secret_key]').val($(this).attr('secretkey'));
				$('form[name=wap_post] input[name=pid]').val($(this).attr('id'));

				var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=wap&pid='+pid;
				$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
					var obj = eval ("(" + responseTxt + ")");
					$("form[name=wap_post] input[name=go_wap_back_url]").val(obj.back_url);
					$("form[name=wap_post] input[name=go_wap_error_url]").val(obj.error_url);
					
					$("form[name=wap_post] textarea[name=comment]").val(obj.comment);
				});
				
				if('${model.isStaff}' == 'true') {
					if($(this).attr('state') == 'active') {
						$('form[name=wap_post] input[name=approve]').css('display', 'none');
						$('form[name=wap_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=wap_post] input[name=approve]').css('display', 'none');
						$('form[name=wap_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'reject') {
						$('form[name=wap_post] input[name=approve]').css('display', '');
						$('form[name=wap_post] input[name=reject]').css('display', 'none');
					} else {
						$('form[name=wap_post] input[name=approve]').css('display', '');
						$('form[name=wap_post] input[name=reject]').css('display', '');
					}
					
					$('form[name=wap_post] textarea[name=comment]').removeAttr('readonly');
					
					if($(this).attr('owner') == 'true') {
						$('form[name=wap_post] input[name=reject]').css('display', 'none');
						$('form[name=wap_post] input[name=approve]').val('Đề nghị');
						if($(this).attr('state') == 'active') {
							$('form[name=wap_post] input[name=approve]').css('display', 'none');
						} else if($(this).attr('state') == 'normal_active') {
							$('form[name=wap_post] input[name=approve]').css('display', 'none');
						} else {
							$('form[name=wap_post] input[name=approve]').css('display', '');
						}
						
						$('form[name=wap_post] textarea[name=comment]').attr('readonly', 'readonly');
					}
				} else {
					if($(this).attr('state') == 'active') {
						$('form[name=wap_post] input[name=approve]').css('display', 'none');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=wap_post] input[name=approve]').css('display', 'none');
					} else {
						$('form[name=wap_post] input[name=approve]').css('display', '');
					}
					
					$('form[name=wap_post] textarea[name=comment]').attr('readonly', 'readonly');
				}
			}
			
			if("leanModal" != $(this).attr('rel')) {
				alert("${model.isStaff?'Unregistered wap charging product':'Registered wap charging product'}");
				return false;
			}
		});
		
		$('.go_iac').live('click', function() {
			var pid = $(this).attr('id');
			var app_code = $(this).attr('app_code');
			if($("form[name=iac_post]").length > 0) {
				//reset form
				clear_form_elements($("form[name=iac_post]"));

				$('form[name=iac_post] .progressBar').attr('src', '<%=request.getContextPath()%>/progress-step.jsp?ver=en&state='+$(this).attr("state"));
				
				$('.go_iac_access_key').html($(this).attr('accesskey'));
				$('.go_iac_secret_key').html($(this).attr('secretkey'));
				$('.go_iac_product_name').html($(this).attr('pname'));
				$('input[name=go_iac_access_key]').val($(this).attr('accesskey'));
				$('input[name=go_iac_secret_key]').val($(this).attr('secretkey'));
				$('form[name=iac_post] input[name=pid]').val($(this).attr('id'));
				
				var repCode = app_code.replace(/APP_/gi, '');
				$("form[name=iac_post] input[name=rep_code]").val('REP_' + repCode);
				$("form[name=iac_post] input[id=rep_code_radio]").click();
				
				var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=iac&pid='+pid;
				$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
					var obj = eval ("(" + responseTxt + ")");
					$("form[name=iac_post] input[name=game_code]").val(obj.game_code);
					if(obj.rep_code) {
						$("form[name=iac_post] input[name=rep_code]").val(obj.rep_code);
						$("form[name=iac_post] input[id=rep_code_radio]").click();
					} else {
						$("form[name=iac_post] input[id=game_code_radio]").click();
					}
					$("form[name=iac_post] input[name=go_iac_notify_url]").val(obj.notify_url);
					$("form[name=iac_post] input[name=mo_vtm]").val(obj.mo_vtm);
					$("form[name=iac_post] input[name=mo_vms]").val(obj.mo_vms);
					$("form[name=iac_post] textarea[name=mt]").val(obj.mt);
					
					$("form[name=iac_post] textarea[name=comment]").val(obj.comment);
				});
				
				if('${model.isStaff}' == 'true') {
					if($(this).attr('state') == 'active') {
						$('form[name=iac_post] input[name=approve]').css('display', 'none');
						$('form[name=iac_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=iac_post] input[name=approve]').css('display', 'none');
						$('form[name=iac_post] input[name=reject]').css('display', '');
					} else if($(this).attr('state') == 'reject') {
						$('form[name=iac_post] input[name=approve]').css('display', '');
						$('form[name=iac_post] input[name=reject]').css('display', 'none');
					} else {
						$('form[name=iac_post] input[name=approve]').css('display', '');
						$('form[name=iac_post] input[name=reject]').css('display', '');
					}
					
					$('form[name=iac_post] textarea[name=comment]').removeAttr('readonly');
					
					if($(this).attr('owner') == 'true') {
						$('form[name=iac_post] input[name=reject]').css('display', 'none');
						$('form[name=iac_post] input[name=approve]').val('Đề nghị');
						if($(this).attr('state') == 'active') {
							$('form[name=iac_post] input[name=approve]').css('display', 'none');
						} else if($(this).attr('state') == 'normal_active') {
							$('form[name=iac_post] input[name=approve]').css('display', 'none');
						} else {
							$('form[name=iac_post] input[name=approve]').css('display', '');
						}
						
						$('form[name=iac_post] textarea[name=comment]').attr('readonly', 'readonly');
					}
				} else {
					if($(this).attr('state') == 'active') {
						$('form[name=iac_post] input[name=approve]').css('display', 'none');
					} else if($(this).attr('state') == 'normal_active') {
						$('form[name=iac_post] input[name=approve]').css('display', 'none');
					} else {
						$('form[name=iac_post] input[name=approve]').css('display', '');
					}
					
					$('form[name=iac_post] textarea[name=comment]').attr('readonly', 'readonly');
				}
			}
			
			if("leanModal" != $(this).attr('rel')) {
				alert("${model.isStaff?'Unregistered iac charging product':'Registered iac charging product'}");
				return false;
			}
		});
		
		$('.go_onOffProduct').live('click', function() {
			if($("form[name=onOffProduct_post]").length > 0) {
				//reset form
				clear_form_elements($("form[name=onOffProduct_post]"));
				
				$('form[name=onOffProduct_post] input[name=pid]').val($(this).attr('pid'));
				$('form[name=onOffProduct_post] input[name=pa]').val($(this).attr('pa'));
				$('form[name=onOffProduct_post] .product_name').html($(this).attr('pn'));
				
			}
		});
		
		$('.go_sdk').live('click', function() {
			var activeCount = $(this).attr('active');
			if(activeCount == '0') {
				alert('You have no registered charging product.');
				return false;
			}
		});
	});
</script>
<!-- --------------------------- popup charging type end------------------------------ -->
<script type="text/javascript">
	function validateStatus(json) {
		if(		json == '${APPROVED_STATUS}' 
			||	json == '${APPROVED_PENDING_STATUS}'
			||	json == '${REJECT_STATUS}'
			||	json == '${INIT_STATUS}'
			||	json == '${PENDING_STATUS}'
			||	json == '${NOT_AVAIABLE_STATUS}')
			return true;
		return false;
	}
</script>

<div id="product_active_change_temp" style="display: none;"></div>
<script type="text/javascript">
// function prodActiveOnOff(pid) {
function getProductOnOffStatus(pid) {	
	var chkId = 'svr_' + pid;
	// var active = $('#' + chkId).attr('value') + '';
	var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_product_active_status&pid='+pid;
	
	$('#product_active_change_temp').load(url, function(responseTxt,statusTxt,xhr){
		if(validateStatus(responseTxt)) {
			$('#' + chkId).val(responseTxt);
			if(responseTxt == "${APPROVED_STATUS}") {
				$('#' + chkId).attr('checked', 'checked');
			}
		}
	});
}
</script>

<c:set var="okLabel" value="proposal" />
<c:if test="${model.isStaff}">
	<c:set var="okLabel" value="approval" />
</c:if>

<div id="cardchar_pop">
<c:choose>
	<c:when test="${!model.isStaff && !model.chargingConfirms['card']}">
		<h1 class="srv_title">Card Charging</h1>
		<iframe class="progressBar" scrolling="no"></iframe>
		<div class="clear"></div>
		<div class="charging_confirm">
			You are not signed electronic contract card charging, please sign electronic contracts card charging
			<a href="<%=request.getContextPath() %>/dich-vu.html?n=card">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
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
				Product name: <span class="go_card_product_name"></span>
			</div>
			<h1 class="srv_title">Card Charging</h1>
			<iframe class="progressBar" scrolling="no"></iframe>
			<div class="clear"></div>
			<div class="srv_row">To sign up for this payment services for your products, please follow these steps:</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 1</label>Use a connection document <strong>API</strong>
				with <strong>Access Key</strong>: <span class="go_card_access_key"></span> and <strong>Secret Key</strong>: <span class="go_card_secret_key"></span><br />
				proceed to connect the  <strong>1Pay</strong> follow the instructions in the document. You select one of the following forms of connection:
			</div>
			<div class="srv_row">
				<a href="http://dev.1pay.vn" class="btn_api">APIs</a>
				<a href="http://dev.1pay.vn" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 2</label>
				Perform loaded card (any value) through the <strong>product</strong> connected.
			</div>

			<div class="srv_row">
				<label class="lbl_moi">Step 3</label>Press the <strong>[Propose]</strong> button 
				below and wait for the <strong>1Pay</strong> system automatic approval payment for your product.
			</div>
		</div>
		<div>
			<input type="hidden" name="approve_submit" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isStaff}">
				<input type="submit" name="reject" value="Reject" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Cancel" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=card_post] input[type=submit]').live('click', function() {
					$('form[name=card_post] input[name=approve_submit]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=card_post]').submit(function() {
					var action = '${okLabel}';
					if($('form[name=card_post] input[name=approve_submit]').val() == 'reject')	
						action = 'reject';
					if(!confirm('Are you sure to ' + action + ' card charging?'))
						return false;
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
						if (validateStatus(json)) {
							var mess ='Declare card charging of the product had ${okLabel} success';
							var pid = $('form[name=card_post] input[name=pid]').val();
							
							$('.go_card_'+pid).attr('title', chargingStatusTilte[json]);
							if($.trim($('.go_card_'+pid).text()).length > 0) {
								$('.go_card_'+pid).text(chargingStatusTilte[json]);
							}
							if(json == '${PENDING_STATUS}') {//Chờ ${okLabel}
								$('.go_card_'+pid).attr('class', 'card_normal go_card go_card_' + pid + ' charging_' + pid);
								$('.go_card_'+pid).attr('state', 'normal');
								
								mess ='You have registered card charging for this product, after 1PAY approval, you can use';

								//auto active
								//prodActiveOnOff(pid);
								getProductOnOffStatus(pid);
							} else if(json == '${REJECT_STATUS}') {//Từ chối
								$('.go_card_'+pid).attr('class','card_reject go_card go_card_' + pid + ' charging_' + pid);
								$('.go_card_'+pid).attr('state','reject');
								
								mess = 'Declare card charging of the product had reject';
							} else if(json == '${APPROVED_PENDING_STATUS}') {//1PAY Đã xác nhận
								$('.go_card_'+pid).attr('class','card_normal_active go_card go_card_' + pid + ' charging_' + pid);
								$('.go_card_'+pid).attr('state','normal_active');

								getProductOnOffStatus(pid);
							} else if(json == '${APPROVED_STATUS}') {//Đã xác nhận
								$('.go_card_'+pid).attr('class','card_active go_card go_card_' + pid + ' charging_' + pid);
								$('.go_card_'+pid).attr('state','active');
								
								getProductOnOffStatus(pid);
							}
							
							alert(mess);
							$('.modal_close').click();
						} else {
							alert('${okLabel} unsuccessful \n' + json);
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
	<c:when test="${!model.isStaff && !model.chargingConfirms['sms']}">
		<h1 class="srv_title">SMS Charging</h1>
		<iframe class="progressBar" scrolling="no"></iframe>
		<div class="clear"></div>
		<div class="charging_confirm">
			You are not signed electronic contract sms charging, please sign electronic contracts sms charging 
			<a href="<%=request.getContextPath() %>/dich-vu.html?n=sms">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
		</div>
	</c:when>
	<c:otherwise>
	<form action="<%=request.getContextPath()%>/console/ajax.wss"
		method="post" name="sms_post">
		<input type="hidden" name="a" value="sms_charging_register" /> <input
			type="hidden" name="pid" value="go_sms_pid" />
		<div class="pop_box">
			<div class="product_title">
				Product name: <span class="go_sms_product_name"></span>
			</div>
			<h1 class="srv_title">SMS Charging</h1>
			<iframe class="progressBar" scrolling="no"></iframe>
			<div class="clear"></div>
			<div class="srv_row">To sign up for this payment services for your products, please follow these steps:</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 1</label> Select service number: 
				<select name="service_number">
					<option value="8xx8">8xx8</option>	
				</select>
				(<span class="short_codes"></span>)
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 2</label> Choose SMS Command Code: <span
					class="other_info">(no more than 10 characters)</span>:<br />
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
					<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>(Sms Command Code is used immediately)</i><br />
					
					<input type="radio" name="radio_cmd" value="txtCmd" checked="checked" />&nbsp; 
					<input type="text" placeholder="ABCDE"
					value="" name="service_code" /> <a class="link_chitiet service_code_check"
					href="#">Kiểm tra</a> <span id="cmd_check_result" class="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
					<br />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<i>(Sms Command Code must carry registration)</i>
				<div id="service_code_check_temp" style="display: none;"></div>
				<script type="text/javascript">
             		$(document).ready(function() {
             			$('.service_code_check').live('click', function() {
             				var pid = $('form[name=sms_post] input[name=pid]').val();
             				var serviceCode = $('form[name=sms_post] input[name=service_code]').val();
             				
             				//Check valid
            				if(serviceCode.length==0 || serviceCode.length>10) {
            					alert('Sms command code has no more than 10 characters');
            					return false;
            				}
             				
             				var serviceNumber = $('form[name=sms_post] select[name=service_number] :selected').text();
							var url = '<%=request.getContextPath()%>/console/ajax.wss?a=service_code_check&service_code='+serviceCode+'&service_number='+serviceNumber+'&pid='+pid;
							
							$('#service_code_check_temp').load(url, function(responseTxt,statusTxt,xhr){
								var result = responseTxt + ''; 
								if(result == '1') {
									$('#cmd_check_result').attr('class','valid_sms_cmd');
									alert('Sms command code "'+serviceCode+'" with service number "'+serviceNumber+'" was existed');
								} else {
									$('#cmd_check_result').attr('class','invalid_sms_cmd');
									alert('Sms command code "'+serviceCode+'" with service number "'+serviceNumber+'" is valid');
								}
							});
              			});
              		});
              	</script>
			</div>
			<style>
				#sms_service_numbers .number {font-size: 14px;font-weight: bold;}
			</style>
			<div id="sms_service_numbers" style="display:none;">
				<div class="li_row">
					<table>
						<tr>
							<td style="padding-right: 20px;"><input type="checkbox" value="80xx" name="service_numbers"
								id="chck_80xx" /> <label for="chck_80xx">x<span class="number">0</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="81xx" name="service_numbers"
								id="chck_81xx" /> <label for="chck_81xx">x<span class="number">1</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="82xx" name="service_numbers"
								id="chck_82xx" /> <label for="chck_82xx">x<span class="number">2</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="83xx" name="service_numbers"
								id="chck_83xx" /> <label for="chck_83xx">x<span class="number">3</span>xx</label></td>
								
							<td style="padding-right: 20px;"><input type="checkbox" value="84xx" name="service_numbers"
								id="chck_84xx" /> <label for="chck_84xx">x<span class="number">4</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="85xx" name="service_numbers"
								id="chck_85xx" /> <label for="chck_85xx">x<span class="number">5</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="86xx" name="service_numbers"
								id="chck_86xx" /> <label for="chck_86xx">x<span class="number">6</span>xx</label></td>
							<td style="padding-right: 20px;"><input type="checkbox" value="87xx" name="service_numbers"
								id="chck_87xx" /> <label for="chck_87xx">x<span class="number">7</span>xx</label></td>
						</tr>
					</table>
				</div>
			</div>
			<div class="li_row filter_row" style="padding-top: 0;margin-top: -10px;">
				<fieldset style="width: 535px;padding-bottom: 0;float:left;">
					<legend>
						<input type="checkbox" name="allOpe" value="allOpe" /> Operators
						<script type="text/javascript">
							$(document).ready(function(){
								$('form[name=sms_post] input[name=allOpe]').click(function() {
									if(this.checked) {
										$(this).closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
									} else {
										$(this).closest('.filter_row').find('input[type=checkbox]').removeAttr('checked');
									}
								});
							});
						</script>
					</legend>
					<div style="padding: 2px;">
						<%
						String[] mobileOperators = { "VNP", "VMS", "VTM", "VNM"};
						for(String ope : mobileOperators) {%>
							<div style="display: inline-block;">
								<input type="checkbox" class="chck_filter" value="<%=ope%>" name="operator" id="chck_<%=ope%>" /> <label class="lbl_chcksub" for="chck_<%=ope%>"><%=Utils.findMobileOperatorByCode(ope)%></label>
							</div>
						<%}%>
					</div>
				</fieldset>
				<div style="float:left;margin-top: 20px">
					<img src="<%=request.getContextPath()%>/images/update_icon.png" border="0" alt="Cập nhật Nhà mạng" id="ope_update_btn" />
					<span class="ope_update_result" style="display: block; color: #f00; width: 100px; float: right;"></span>
				</div> 
			</div>
			<div class="li_row">
				Receive <strong>MO</strong> URL (Merchant use to receive MO from 1Pay)
				<br />
				<input type="text" class="txt_reglog" name="mo_receive_url" value="" placeholder="VD: http://example.com/mo_receive" style="width: 545px; " />
				<img src="<%=request.getContextPath()%>/images/update_icon.png" border="0" alt="Cập nhật URL nhận MO" id="mo_update_btn" />
				<span class="mo_update_result" style="display: block; color: #f00; width: 100px; float: right;"></span>
			</div>
			<div class="li_row">
				Scenario <strong>MO</strong> (Required include information such as: games name, payment activities (TAI, KH, NAP ...)) <br />
				<input type="text" class="txt_reglog"  name="mo" placeholder="VD: 1PAY [Tengame] TAI" style="width: 545px; " />
			</div>
			<div class="li_row">
				Scenario <strong>MT</strong> (Follow form below) <br />
				<textarea class="txtarea_reglog" rows="1" name="mt" placeholder="Ex: Thank you for [downloading, active, using,...] my [game, application, ringtones,...] service in link:... Supporter: 09xxxxxxxx"></textarea>
				<div align="justify" class="txtarea_reglog_guide" style="font-style: italic; float: right; width: 110px; color: #999;line-height: 15px;"></div>
			</div>
			<div class="li_row">
				<!-- Định dạng tin nhắn trả về?<br/> -->
				<input type ="radio" name="mt_type" value="text" checked="checked"/> <strong>Text</strong>&nbsp;&nbsp;<input type ="radio" name="mt_type" value="wap_push"/> <strong>Wap Push</strong>
			</div>
			<div class="li_row">
				Comment of Suppoter <br />
				<textarea class="txtarea_reglog" rows="2" name="comment"></textarea>
			</div>			
			<!-- 
			<div class="srv_row">
				<label class="lbl_moi">Bước 3</label>Dùng tài liệu kết nối <strong>API</strong>
				tiến hành kết nối tới hệ thống của <strong>1Pay</strong> theo hướng
				dẫn trong tài liệu. Bạn chọn một trong những hình thức kết nối sau:
			</div>
			<div class="srv_row">
				<a href="http://docs.1pay.vn/doku.php?id=sms-charging" class="btn_api">APIs</a>
				<a href="#" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Bước 4</label>Thực hiện soạn tin nhắn với cú pháp đã được ${okLabel} thông qua <strong>sản phẩm</strong> đã kết nối.
			</div>

			<div class="srv_row">
				<label class="lbl_moi">Bước 5</label>Nhấn nút <strong>[Đề nghị]</strong> 
				bên dưới và chờ hệ thống <strong>1Pay</strong> ${okLabel} tự
				động thanh toán cho sản phẩm của bạn.
			</div>
			 -->	
			 <script type="text/javascript">
				$(document).ready(function() {
					$("form[name=sms_post] .txtarea_reglog").focus(function() {
						if($(this).parent().find(".txtarea_reglog_guide").length) {
							$(this).parent().find(".txtarea_reglog_guide").html($(this).attr('placeholder'));
							$(this).parent().find(".txtarea_reglog_guide").fadeIn(300);
						}
					});
					
					$("form[name=sms_post] .txtarea_reglog").blur(function() {
						if($(this).parent().find(".txtarea_reglog_guide").length) {	
							$(this).parent().find(".txtarea_reglog_guide").fadeOut(300);
						}
					});
					
					$("form[name=sms_post] #mo_update_btn").live('click', function() {
						if(confirm('Are you sure to update receive MO URL?')) {
							var pid = $('form[name=sms_post] input[name=pid]').val();
							var mo_url = encodeURIComponent($('form[name=sms_post] input[name=mo_receive_url]').val());
							var url = '<%=request.getContextPath()%>/console/ajax.wss?a=sms_mo_url_update&pid='+pid + '&mo_url=' + mo_url;
							$('form[name=sms_post] .mo_update_result').load(url, function(responseTxt, statusTxt, xhr){
								if(responseTxt == '1') {
									$(this).html('Receive MO URL was updated');
								} else {
									$(this).html(responseTxt);
								}
							});
						} else {
							return false;
						}
					});
					
					$("form[name=sms_post] #ope_update_btn").live('click', function() {
						if(confirm('Are you sure to update operators?')) {
							var pid = $('form[name=sms_post] input[name=pid]').val();
							var opes = '';
							$('form[name=sms_post] input[name=operator]:checked').each(function() {
								opes += '&ope=' + $(this).val();								
							});
							var url = '<%=request.getContextPath()%>/console/ajax.wss?a=sms_ope_update&pid='+pid + opes;
							$('form[name=sms_post] .ope_update_result').load(url, function(responseTxt, statusTxt, xhr){
								if(responseTxt == '1') {
									$(this).html('Operators were updated');
								} else {
									$(this).html(responseTxt);
								}
							});
						} else {
							return false;
						}
					});
				});
			</script>	
		</div>
		<div>
			<input type="hidden" name="approve_submit" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isStaff}">
				<input type="submit" name="reject" value="Reject" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Cancel" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=sms_post] input[type=submit]').live('click', function() {
					$('form[name=sms_post] input[name=approve_submit]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	
	<c:set var="serviceNumberTemp" value="" />
	<c:set var="jsAllServiceContent">var allServiceCont = new Array(), allCmdCont;</c:set>
	<c:forEach var="svr" items="${model.allServiceContent}">
		<c:set var="serviceNumberTemp">${serviceNumberTemp}<option value="${svr.key}">${svr.key}</option></c:set>
		<c:set var="jsAllServiceContent">
			${jsAllServiceContent}
			allCmdCont = new Array();
		</c:set>
		<c:set var="cmdSelectTemp" value="" />
		<c:forEach var="lb" items="${svr.value}">
			<c:if test="${!fn:startsWith(lb.key, 'cmd')}">
				<c:set var="jsAllServiceContent">
					${jsAllServiceContent}
					allCmdCont["${lb.key}"] = '${lb.value}';
				</c:set>
			</c:if>
		</c:forEach>
		<c:set var="jsAllServiceContent">
			${jsAllServiceContent}
			allCmdCont["cmd"] = '${cmdSelectTemp}';
			allServiceCont["${svr.key}"] = allCmdCont;
		</c:set>
	</c:forEach>
	
	<script type="text/javascript">
		${jsAllServiceContent} 
		
		Object.size = function(obj) {
		    var size = 0, key;
		    for (key in obj) {
		        if (obj.hasOwnProperty(key)) size++;
		    }
		    return size;
		};
		
		function serviceChange() {
			
		    var serviceNumber = $("form[name=sms_post] select[name=service_number]").val();

		    var codes = [];
		    if("8xx8" == serviceNumber){
				codes = ["8008","8118","8228","8338","8448","8558","8658","8758"];
			} else if("8x38" == serviceNumber){
				codes = ["8038", "8138", "8238", "8328", "8438", "8538", "8638", "8738"];
			} else {
				codes = ["x0xx", "x1xx", "x2xx", "x3xx", "x4xx", "x5xx", "x6xx", "x7xx"];
				for(var i = 0; i<codes.length; i++)
					codes[i] = serviceNumber.substring(0, 1) + codes[i].substring(1, 2) + serviceNumber.substring(2);
			}
		    var short_codes = '';
		    for(var i = 0; i<codes.length; i++) {
		    	if("8008" != codes[i] && "8269" != codes[i]) {
			    	short_codes += codes[i];
			    	if(i < codes.length - 1)
			    		short_codes += ' - ';
		    	}
		    }
		    $('form[name=sms_post] span.short_codes').html(short_codes);
			
			if($("form[name=sms_post] input[name=radio_cmd]:checked").val() == "selectCmd") {
			    //$("form[name=sms_post] select[name=select_service_code]").html(allServiceCont[serviceNumber]["cmd"]);
			    $("form[name=sms_post] input[name=mo_receive_url]").val(allServiceCont[serviceNumber]["moUrl"]);
			    //$("form[name=sms_post] input[name=mt_receive_url]").val(allServiceCont[serviceNumber]["mtUrl"]);
			    var pid = $("form[name=sms_post] input[name=pid]").val();
			    var url = '<%=request.getContextPath()%>/console/ajax.wss?a=sms_command_code_for_product&pid=' + pid + '&s=' + serviceNumber;
			    //$("form[name=sms_post] select[name=select_service_code]").load(url);
			    $.get(url, $(this).serialize(), function(optionHtml) {
			    	$("form[name=sms_post] select[name=select_service_code]").html(optionHtml);
			    	if($.inArray(serviceNumber, blackListSmsServices) >= 0) {
				    	$("form[name=sms_post] select[name=select_service_code] option:not(:selected)").css('display', 'none');
				    }
			    }, 'text');
			    cmdCodeChange();
			} else {   
			    $("form[name=sms_post] select[name=select_service_code]").html("");
			    $("form[name=sms_post] input[name=mo_receive_url]").val("");
			    //$("form[name=sms_post] input[name=mt_receive_url]").val("");
			    $("form[name=sms_post] textarea[name=mo]").val("");
			    $("form[name=sms_post] textarea[name=mt]").val("");
			}
		}
		
		function cmdCodeChange() {
			if($("form[name=sms_post] input[name=radio_cmd]:checked").val() == "selectCmd") {
				var serviceNumber = $("form[name=sms_post] select[name=service_number]").val();
				var cmdCode = $("form[name=sms_post] select[name=select_service_code]").val();

			    $("form[name=sms_post] textarea[name=mo]").val(allServiceCont[serviceNumber]["mo_" + cmdCode]);
			    $("form[name=sms_post] textarea[name=mt]").val(allServiceCont[serviceNumber]["mt_" + cmdCode]);
			}
		}
		
		$(document).ready(function() {
			$("form[name=sms_post] select[name=service_number]").html('${serviceNumberTemp}');
			$("form[name=sms_post] select[name=service_number]").change(serviceChange);
			$("form[name=sms_post] input[name=radio_cmd]").change(serviceChange);
			$("form[name=sms_post] select[name=select_service_code]").change(cmdCodeChange);

			$('form[name=sms_post]').submit(function() {
				var action = '${okLabel}';
				if($('form[name=sms_post] input[name=approve_submit]').val() == 'reject')	
					action = 'reject';
				if(!confirm('Are you sure to ' + action + ' sms charging?'))
					return false;
				
				//Check valid
				var serviceCode = $(this).find('input[name=service_code]').val();
				if(($(this).find('input[name=radio_cmd]:checked').val() == 'txtCmd')
						&& (serviceCode.length==0 || serviceCode.length>10)) {
					alert('Sms command code has no more than 10 characters');
					return false;
				}
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if (validateStatus(json)) {
						var mess = 'Declare sms charging of the product had ${okLabel} success';
						var pid = $('form[name=sms_post] input[name=pid]').val();
						
						$('.go_sms_'+pid).attr('title', chargingStatusTilte[json]);
						if($.trim($('.go_sms_'+pid).text()).length > 0) {
							$('.go_sms_'+pid).text(chargingStatusTilte[json]);
						}
						
						if(json == '${PENDING_STATUS}') {//Chờ ${okLabel}
							$('.go_sms_'+pid).attr('class','sms_normal go_sms go_sms_' + pid + ' charging_' + pid);
							$('.go_sms_'+pid).attr('state','normal');
							
							mess = 'You have registered sms charging for this product, after 1PAY approval, you can use';

							//auto active
							//prodActiveOnOff(pid);
							getProductOnOffStatus(pid);
						} else if(json == '${REJECT_STATUS}') {//Từ chối
							$('.go_sms_'+pid).attr('class','sms_reject go_sms go_sms_' + pid + ' charging_' + pid);
							$('.go_sms_'+pid).attr('state','reject');
							
							mess = 'Declare sms charging of the product had reject';
						} else if(json == '${APPROVED_PENDING_STATUS}') {//1PAY Đã xác nhận
							$('.go_sms_'+pid).attr('class','sms_normal_active go_sms go_sms_' + pid + ' charging_' + pid);
							$('.go_sms_'+pid).attr('state','normal_active');
							
							getProductOnOffStatus(pid);
						} else if(json == '${APPROVED_STATUS}') {//Đã xác nhận
							$('.go_sms_'+pid).attr('class','sms_active go_sms go_sms_' + pid + ' charging_' + pid);
							$('.go_sms_'+pid).attr('state','active');
							
							getProductOnOffStatus(pid);
						}
						
						alert(mess);
						$('.modal_close').click();
					} else {
						alert('${okLabel} unsuccessful \n' + json);
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
	<c:when test="${!model.isStaff && !model.chargingConfirms['wap']}">
		<h1 class="srv_title">Wap Charging</h1>
		<iframe class="progressBar" scrolling="no"></iframe>
		<div class="clear"></div>
		<div class="charging_confirm">
			You are not signed electronic contract wap charging, please sign electronic contracts wap charging
			<a href="<%=request.getContextPath() %>/dich-vu.html?n=wap">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
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
				Product name: <span class="go_wap_product_name"></span>
			</div>
			<h1 class="srv_title">Wap Charging</h1>
			<iframe class="progressBar" scrolling="no"></iframe>
			<div class="clear"></div>
			<div class="srv_row">To sign up for this payment services for your products, please follow these steps:</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 1</label>Using connection documents <strong>API</strong>
				with <strong>Access Key</strong>: <span class="go_wap_access_key"></span> and <strong>Secret Key</strong>: <span class="go_wap_secret_key"></span>.
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 2</label>More declare (Optional SDK):<br/>
				<div class="li_row">
					<strong>Transaction processing results URL:</strong><br />
					<input type="text" class="txt_reglog" name="go_wap_back_url" value="" placeholder="http://example.com/back_url" style="width: 545px; " />
				</div>
				<div class="li_row">
					<strong>Error or Cancel transactions processing URL:</strong><br />
					<input type="text" class="txt_reglog" name="go_wap_error_url" value="" placeholder="http://example.com/error_url" style="width: 545px; " />
				</div>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 3</label>Proceed to connect the <strong>1Pay</strong> system follow the instructions in the document. 
				You select one of the following forms of connection:
			</div>
			<div class="srv_row">
				<a href="http://dev.1pay.vn" class="btn_api">APIs</a>
				<a href="http://dev.1pay.vn" class="btn_apk">SDK</a>
			</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 4</label>
				Perform a transaction through <strong> product </strong> is connected. Press the <strong> [Proposal] </strong> button 
				below and wait for the <strong> 1Pay </strong> system automatic confirmation payment for your product.
			</div>
			
			<div class="srv_row">
				Comment of Supporter <br />
				<textarea class="txtarea_reglog" rows="1" name="comment"></textarea>
			</div>
		</div>
		<div>
			<input type="hidden" name="approve_submit" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isStaff}">
				<input type="submit" name="reject" value="Reject" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Cancel" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=wap_post] input[type=submit]').live('click', function() {
					$('form[name=wap_post] input[name=approve_submit]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=wap_post]').submit(function() {
				var action = '${okLabel}';
				if($('form[name=wap_post] input[name=approve_submit]').val() == 'reject')	
					action = 'reject';
				if(!confirm('Are you sure to ' + action + ' wap charging?'))
					return false;
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if (validateStatus(json)) {
						var mess = 'Declare wap charging of the product had ${okLabel} success';
						var pid = $('form[name=wap_post] input[name=pid]').val();
						
						$('.go_wap_'+pid).attr('title', chargingStatusTilte[json]);
						if($.trim($('.go_wap_'+pid).text()).length > 0) {
							$('.go_wap_'+pid).text(chargingStatusTilte[json]);
						}
						
						if(json == '${PENDING_STATUS}') {//Chờ ${okLabel}
							$('.go_wap_'+pid).attr('class','wap_normal go_wap go_wap_' + pid + ' charging_' + pid);
							$('.go_wap_'+pid).attr('state','normal');
							
							mess = 'You have registered wap charging for this product, after 1PAY approval, you can use';

							//auto active
							//prodActiveOnOff(pid);
							getProductOnOffStatus(pid);
						} else if(json == '${REJECT_STATUS}') {//Từ chối
							$('.go_wap_'+pid).attr('class','wap_reject go_wap go_wap_' + pid + ' charging_' + pid);
							$('.go_wap_'+pid).attr('state','reject');
							
							mess = 'Declare wap charging of the product had reject';
						} else if(json == '${APPROVED_PENDING_STATUS}') {//1PAY đã xác nhận
							$('.go_wap_'+pid).attr('class','wap_normal_active go_wap go_wap_' + pid + ' charging_' + pid);
							$('.go_wap_'+pid).attr('state','normal_active');
							
							getProductOnOffStatus(pid);
						} else if(json == '${APPROVED_STATUS}') {//Đã xác nhận
							$('.go_wap_'+pid).attr('class','wap_active go_wap go_wap_' + pid + ' charging_' + pid);
							$('.go_wap_'+pid).attr('state','active');
							
							getProductOnOffStatus(pid);
						}
						
						alert(mess);
						$('.modal_close').click();
					} else {
						alert('${okLabel} unsuccessful \n' + json);
					}
				}, 'text');
				return false;
			});
		});
	</script>
	</c:otherwise>
</c:choose>
</div>

<div id="iacchar_pop">
<c:choose>
	<c:when test="${!model.isStaff && !model.chargingConfirms['iac']}">
		<h1 class="srv_title">In-App Charging</h1>
		<iframe class="progressBar" scrolling="no"></iframe>
		<div class="clear"></div>
		<div class="charging_confirm">
			You are not signed electronic contract in-app charging, please sign electronic contracts in-app charging
			<a href="<%=request.getContextPath() %>/dich-vu.html?n=iac">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
		</div>
	</c:when>
	<c:otherwise>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=iac_post] input[name=code_group_radio]').live('click', function() {
				var chkedRadioVal = $(this).val();
				$('form[name=iac_post] #code_group .code_value').each(function() {
					if($(this).attr('name') == chkedRadioVal) {
						$(this).removeAttr("disabled"); 
					} else {
						$(this).attr("disabled", "disabled"); 
					}
				});
			});
		});
	</script>
	<form action="<%=request.getContextPath()%>/console/ajax.wss" method="post" name="iac_post">
		<input type="hidden" name="a" value="iac_charging_register" /> 
		<input type="hidden" name="pid" value="go_iac_pid" />
		<input type="hidden" name="go_iac_access_key" value="" /> 
		<input type="hidden" name="go_iac_secret_key" value="" />
		<div class="pop_box">
			<div class="product_title">
				Product name: <span class="go_iac_product_name"></span>
			</div>
			<h1 class="srv_title">In-App Charging</h1>
			<iframe class="progressBar" scrolling="no"></iframe>
			<div class="clear"></div>
			<div class="srv_row">To sign up for this payment services for your products, please follow these steps:</div>
			<div class="srv_row">
				<label class="lbl_moi">Step 1</label>Using connection documents <strong>API</strong>
				with <strong>Access Key</strong>: <span class="go_iac_access_key"></span> and <strong>Secret Key</strong>: <span class="go_iac_secret_key"></span>.
			</div>
			<div class="srv_row" style="padding-top: 0;">
				<label class="lbl_moi">Step 2</label> Declaration:<br/>
				<div class="li_row" id="code_group">
					<table>
						<tr>
							<td valign="top"><input type="radio" name="code_group_radio" value="game_code" id="game_code_radio" /></td>
							<td valign="top">
								GAMECODE (Merchant propose or 1Pay provide):<br />
								<input class="code_value" list="gameCodes" name="game_code">
								<datalist id="gameCodes">
									<c:forEach var="gameCode" items="${model.gameCodes}" begin="1">
										<option value="${gameCode}">${gameCode}</option>	
									</c:forEach>
								</datalist>	
								<%-- <select class="code_value" name="game_code">
									<c:forEach var="gameCode" items="${model.gameCodes}" begin="1">
										<option value="${gameCode}">${gameCode}</option>	
									</c:forEach>
								</select> --%>
							</td>
						</tr>
						<tr>
							<td valign="top"><input type="radio" name="code_group_radio" value="rep_code" id="rep_code_radio" /></td>
							<td valign="top">
								REPCODE (1Pay declare automatic and be filled information after ${okLabel} service):<br />	
								<input type="text" class="code_value" placeholder="REPCODE" value="" readonly="readonly" name="rep_code" />
							</td>
						</tr>
					</table>
				</div>
				<div class="li_row">
					Receive MO URL (Merchant's URL use to receive MO from 1Pay)<br />
					<input type="text" class="txt_reglog" name="go_iac_notify_url" value="" placeholder="VD: http://example.com/notify_url" style="width: 545px; " />
					<img src="<%=request.getContextPath()%>/images/update_icon.png" border="0" alt="Cập nhật URL nhận MO" id="mo_update_btn" />
					<span class="mo_update_result" style="display: block; color: #f00; width: 100px; float: right;"></span>
				</div>
				<div class="li_row">
					Guide to using <strong>MO</strong> (message send to 9029 &lt; 100 characters, ASCII code) <br />
					Viettel (MW_GIATIEN_GAMECODE_CONTENDID_ACCOUNT1PAY_THONG TIN KHAC)<br/>
					<input type="text" class="txt_reglog"  name="mo_vtm" placeholder="MW_GIATIEN_GAMECODE_CONTENDID_ACCOUNT1PAY_THONG TIN KHAC" style="width: 545px; " /><br/>
					MobiFone (MW_GAMECODE_CONTENDID_ACCOUNT1PAY_THONG TIN KHAC)<br/>
					<input type="text" class="txt_reglog"  name="mo_vms" placeholder="MW_GAMECODE_CONTENDID_ACCOUNT1PAY_THONG TIN KHAC" style="width: 545px; " />
				</div>
				<div class="li_row">
					Scenario <strong>MT</strong> (Folow form below)<br />
					<textarea class="txtarea_reglog" rows="1" name="mt" placeholder="Ex: You have successful payment transaction. Amount: 10000d. Service: [GAMECODE follow MO scenario]. Content: [optional]"></textarea>
					<div align="justify" class="txtarea_reglog_guide" style="font-style: italic; float: right; width: 110px; color: #999;margin-top: -70px;line-height: 15px;"></div>
				</div>
				<div class="li_row">
					Comment of Supporter <br />
					<textarea class="txtarea_reglog" rows="1" name="comment"></textarea>
				</div>
			</div>
		</div>
		<div>
			<input type="hidden" name="approve_submit" value="approve" />
			<input type="submit" name="approve" value="${okLabel}" class="btn_greensmall" />
			<c:if test="${model.isStaff}">
				<input type="submit" name="reject" value="Reject" class="btn_greensmall" />
			</c:if> 
			<input type="reset" name="reset" value="Cancel" class="btn_graysmall modal_close" />
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=iac_post] input[type=submit]').live('click', function() {
					$('form[name=iac_post] input[name=approve_submit]').val($(this).attr('name'));
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$("form[name=iac_post] .txtarea_reglog").focus(function() {
				if($(this).parent().find(".txtarea_reglog_guide").length) {
					$(this).parent().find(".txtarea_reglog_guide").html($(this).attr('placeholder'));
					$(this).parent().find(".txtarea_reglog_guide").fadeIn(300);
				}
			});
			
			$("form[name=iac_post] .txtarea_reglog").blur(function() {
				if($(this).parent().find(".txtarea_reglog_guide").length) {	
					$(this).parent().find(".txtarea_reglog_guide").fadeOut(300);
				}
			});
			
			$("form[name=iac_post] #mo_update_btn").live('click', function() {
				if(confirm('Are you sure to update receive MO URL?')) {
					var pid = $('form[name=iac_post] input[name=pid]').val();
					var mo_url = encodeURIComponent($('form[name=iac_post] input[name=go_iac_notify_url]').val());
					var url = '<%=request.getContextPath()%>/console/ajax.wss?a=iac_mo_url_update&pid='+pid + '&mo_url=' + mo_url;
					$('form[name=iac_post] .mo_update_result').load(url, function(responseTxt, statusTxt, xhr){
						if(responseTxt == '1') {
							$(this).html('Receive MO URL was updated');
						} else {
							$(this).html(responseTxt);
						}
					});
				} else {
					return false;
				}
			});
		
			$('form[name=iac_post]').submit(function() {
				var action = '${okLabel}';
				if($('form[name=iac_post] input[name=approve_submit]').val() == 'reject')	
					action = 'reject';
				if(!confirm('Are you sure to ' + action + ' in-app charging?'))
					return false;
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if(validateStatus(json)) {
						var mess ='Declare in-app charging of the product had ${okLabel} success';
						var pid = $('form[name=iac_post] input[name=pid]').val();
						
						$('.go_iac_'+pid).attr('title', chargingStatusTilte[json]);
						if($.trim($('.go_iac_'+pid).text()).length > 0) {
							$('.go_iac_'+pid).text(chargingStatusTilte[json]);
						}
						
						if(json == '${PENDING_STATUS}') {//Chờ ${okLabel}
							$('.go_iac_'+pid).attr('class','iac_normal go_iac go_iac_' + pid + ' charging_' + pid);
							$('.go_iac_'+pid).attr('state','normal');
							
							mess ='You have registered in-app charging for this product, after 1PAY approval, you can use';

							//auto active
							//prodActiveOnOff(pid);
							getProductOnOffStatus(pid);
						} else if(json == '${REJECT_STATUS}') {//Từ chối
							$('.go_iac_'+pid).attr('class','iac_reject go_iac go_iac_' + pid + ' charging_' + pid);
							$('.go_iac_'+pid).attr('state','reject');
							
							mess = 'Declare In-App Charging of the product had reject';
						} else if(json == '${APPROVED_PENDING_STATUS}') {//1PAY Đã xác nhận
							$('.go_iac_'+pid).attr('class','iac_normal_active go_iac go_iac_' + pid + ' charging_' + pid);
							$('.go_iac_'+pid).attr('state','normal_active');
							
							getProductOnOffStatus(pid);
						} else if(json == '${APPROVED_STATUS}') {//Đã xác nhận
							$('.go_iac_'+pid).attr('class','iac_active go_iac go_iac_' + pid + ' charging_' + pid);
							$('.go_iac_'+pid).attr('state','active');
							
							getProductOnOffStatus(pid);
						}
						alert(mess);
						$('.modal_close').click();
					} else {
						alert('${okLabel} unsuccessful \n' + json);
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
	<c:when test="${!model.isStaff && !model.chargingConfirms['direct']}">
		<div class="charging_confirm">
			You are not signed electronic contract direct charging, please sign electronic contracts direct charging
			<a href="#">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
		</div>
	</c:when>
	<c:otherwise>
		Has no register form
	</c:otherwise>
</c:choose>
</div>

<div id="subchar_pop">
<c:choose>
	<c:when test="${!model.isStaff && !model.chargingConfirms['sub']}">
		<div class="charging_confirm">
			You are not signed electronic contract sub charging, please sign electronic contracts sub charging
			<a href="#">in here</a>
			<a href="#" class="modal_close" style="float: right;color:#2C8F39;">Close</a>
		</div>
	</c:when>
	<c:otherwise>
		Has no register form
	</c:otherwise>
</c:choose>
</div>

<div id="onOffProduct_pop">
	<form action="<%=request.getContextPath()%>/console/ajax.wss"
		method="post" name="onOffProduct_post">
		<input type="hidden" name="a" value="product_active_change" />
		<input type="hidden" name="pid" value="" />
		<input type="hidden" name="pa" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Product name: <span class="product_name"></span></h1>
			<div class="srv_row">
				<label class="profile_label">Turn ON/OFF product reason</label>
				<div class="li_row">
					<textarea class="txtarea_reglog" rows="5" name="log" style="width: 665px;"></textarea>
				</div>
			</div>
		</div>
		<div>
			<input type="hidden" name="a" value="1" />
			<input type="submit" name="approve" value="Update" class="btn_greensmall" style="width:auto" />
			<input type="reset" name="reset" value="Cancel" class="btn_graysmall modal_close" />
		</div> 
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=onOffProduct_post]').submit(function() {
				if(!confirm('Are you sure to update product status?'))
					return false;
				
				if($('form[name=onOffProduct_post] textarea[name=log]').val().trim().length <= 0) {
					alert('You have no turn ON/OFF product reason');
					return false;
				}
				
				var pid = $('form[name=onOffProduct_post] input[name=pid]').val();
				var onOffChk = $('#svr_' + pid);
				
				$.post($(this).attr('action'), $(this).serialize(), function(json) {
					if(json == "${REJECT_STATUS}" || json == "${PENDING_STATUS}" 
							|| json == "${INIT_STATUS}" || json == "${APPROVED_STATUS}") {
						onOffChk.val(json);
						$('.go_onOffProduct', onOffChk.parent()).attr('pa', json);
						var isActive = (json == '${APPROVED_STATUS}');			   
						if(isActive) {
							onOffChk.attr('checked','checked');
						} else {
							onOffChk.removeAttr('checked');
						}
						
						$('.modal_close').click();
					} else {
						alert(json);
					}
				}, 'text');
				
				return false;
			});
		});
	</script>
</div>

<!-- 
<c:if test="${model.isStaff}">
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
 -->