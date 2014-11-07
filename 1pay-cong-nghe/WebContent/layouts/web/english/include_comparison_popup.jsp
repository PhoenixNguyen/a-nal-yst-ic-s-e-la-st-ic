<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<script type="text/javascript">
	$(function() {
  			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
	$(document).ready(function() {
		$('.go_card').live('click', function() {
			var pid = $(this).attr('id');
			//alert(pid);
			var title = $("#hd_title-"+pid).val();
			var merchant = $("#hd_merchant-"+pid).val();
			$("#popup_title").html(title);
			$("#popup_merchant").html(merchant);
			$("#popup_pid").val(pid);
			
			var url = '<%=request.getContextPath()%>/protected/comparison_app_ajax.html?a=bookkeeper_get_info_bill&pid='+pid;
			$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
				var obj = eval ("(" + responseTxt + ")");
				
				$("#comparosin_popup_merchant").text(obj.merchant);
				$("#comparosin_popup_title").text(obj.title);
				$("#comparosin_popup_status_message").text(obj.status_message);
				
				/*
				$("#popup_create_by").text(obj.bookkeeper_init_user);
				$("#popup_date").text(obj.bookkeeper_init_date);
				
				//Bookkeeper
				if(obj.bookkeeper_submit_user !== undefined) {
					$(".bookkeeper_submit_user").css('display', '');
				}
				$("#bookkeeper_submit_user").text(obj.bookkeeper_submit_user);
				$("#bookkeeper_submit_date").text(obj.bookkeeper_submit_date);
				
				if(obj.bookkeeper_reject_user !== undefined) {
					$(".bookkeeper_reject_user").css('display', '');
				}
				$("#bookkeeper_reject_user").text(obj.bookkeeper_reject_user);
				$("#bookkeeper_reject_date").text(obj.bookkeeper_reject_date);
				$("#bookkeeper_reject_reason").text(obj.bookkeeper_reject_reason);
				
				//Operator
				if(obj.operator_submit_user !== undefined) {
					$(".operator_submit_user").css('display', '');
				}
				$("#operator_submit_user").text(obj.operator_submit_user);
				$("#operator_submit_date").text(obj.operator_submit_date);
				
				if(obj.operator_reject_user !== undefined) {
					$(".operator_reject_user").css('display', '');
				}
				$("#operator_reject_user").text(obj.operator_reject_user);
				$("#operator_reject_date").text(obj.operator_reject_date);
				$("#operator_reject_reason").text(obj.operator_reject_reason);
				
				//Billing
				if(obj.billing_submit_user !== undefined) {
					$(".billing_submit_user").css('display', '');
				}
				$("#billing_submit_user").text(obj.billing_submit_user);
				$("#billing_submit_date").text(obj.billing_submit_date);
				
				if(obj.billing_reject_user !== undefined) {
					$(".billing_reject_user").css('display', '');
				}
				$("#billing_reject_user").text(obj.billing_reject_user);
				$("#billing_reject_date").text(obj.billing_reject_date);
				$("#billing_reject_reason").text(obj.billing_reject_reason);
				*/
			});
		});
	});
</script>

<!-- Thông tin đối soát -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="cardchar_pop">
	<form action="" method="post" name="comparosin_post">
		<input type="hidden" name="comparosin_a" value="comparison_info_log" />
		<input type="hidden" id="comparosin_popup_pid" name="comparosin_popup_pid" value="" />
		<div class="pop_box">
			<div class="srv_row"><b>Thông tin chi tiết đối soát cho Merchant như sau:</b></div>
			
			<div class="product_title">
				<b>Merchant</b>: <span class="go_sms_product_name" id="comparosin_popup_merchant"></span>
			</div>
			<div class="product_title">
				<b>Title</b>: <span class="go_sms_product_name" id="comparosin_popup_title"></span>
			</div>
			<div class="product_title">
				<b>Status Message</b>: <span class="go_sms_product_name" id="comparosin_popup_status_message"></span>
			</div>
			
			<!-- 
			<div class="product_title">
				Tạo bởi: <span class="go_sms_product_name" id="popup_create_by"></span>
			</div>
			<div class="product_title">
				Ngày tạo: <span class="go_sms_product_name" id="popup_date"></span>
			</div>
			
			<div class="product_title bookkeeper_submit_user" style="display:none">
				[<b>Đối soát</b>]Duyệt bởi: <span class="go_sms_product_name" id="bookkeeper_submit_user"></span>
						  Ngày duyệt: <span class="go_sms_product_name" id="bookkeeper_submit_date"></span>
			</div>
			<div class="product_title bookkeeper_reject_user" style="display:none">
				[<b>Đối soát</b>]Hủy bởi: <span class="go_sms_product_name" id="bookkeeper_reject_user"></span>
						  Ngày hủy: <span class="go_sms_product_name" id="bookkeeper_reject_date"></span>
					      Lý do: <span class="go_sms_product_name" id="bookkeeper_reject_reason"></span>
			</div>
			
			<div class="product_title operator_submit_user" style="display:none">
				[<b>Điều hành</b>]Duyệt bởi: <span class="go_sms_product_name" id="operator_submit_user"></span>
						  Ngày duyệt: <span class="go_sms_product_name" id="operator_submit_date"></span>
			</div>
			<div class="product_title operator_reject_user" style="display:none">
				[<b>Điều hành</b>]Hủy bởi: <span class="go_sms_product_name" id="operator_reject_user"></span>
						  Ngày hủy: <span class="go_sms_product_name" id="operator_reject_date"></span>
					      Lý do: <span class="go_sms_product_name" id="operator_reject_reason"></span>
			</div>
			
			<div class="product_title billing_submit_user" style="display:none">
				[<b>Kế toán</b>]Duyệt bởi: <span class="go_sms_product_name" id="billing_submit_user"></span>
						  Ngày duyệt: <span class="go_sms_product_name" id="billing_submit_date"></span>
			</div>
			<div class="product_title billing_reject_user" style="display:none">
				[<b>Kế toán</b>]Hủy bởi: <span class="go_sms_product_name" id="billing_reject_user"></span>
						  Ngày hủy: <span class="go_sms_product_name" id="billing_reject_date"></span>
					      Lý do: <span class="go_sms_product_name" id="billing_reject_reason"></span>
			</div>
			 -->
			
		</div>
		<div>
			<input type="hidden" name="submit2" value="approve" />
			<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="reset">
		</div>
	</form>
	</div>
	<!-- /Thông tin đối soát -->