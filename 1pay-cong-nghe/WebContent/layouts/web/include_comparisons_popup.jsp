<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Calendar,java.util.Date"%>

<!-- Yeu cau Duyet so bo -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="require_preliminary_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="require_preliminary_approve_post">
		<input type="hidden" name="a" value="require_preliminary_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit_require_preliminary" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Đề nghị duyệt sơ bộ" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=require_preliminary_approve_post] input[type=submit]').live('click', function() {
					$('form[name=require_preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_require_preliminary').val();
					if(submit2=='reject'){
						var popup_des = $('#require_preliminary_popup_des').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy Đề nghị duyệt sơ bộ');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=require_preliminary_approve_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var pid = $('form[name=require_preliminary_approve_post] input[name=pid]').val();
									if(x == 1) {//Reject
										mess = 'Hủy hủy Đề nghị duyệt sơ bộ thành công';
									} else if(x == 2) {//Activated
										mess = 'Đề nghị Duyệt sơ bộ thành công';
									}
									alert(mess);
									/*var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined'  && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Yeu cau Duyet so bo -->
	
	<!-- Duyet so bo -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="preliminary_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="preliminary_approve_post">
		<input type="hidden" name="a" value="preliminary_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			<div class="li_row">
				<b>Mô tả/lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Duyệt sơ bộ" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy duyệt sơ bộ" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=preliminary_approve_post] input[type=submit]').live('click', function() {
					$('form[name=preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy duyệt sơ bộ');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=preliminary_approve_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var pid = $('form[name=preliminary_approve_post] input[name=pid]').val();
									if(x == 3) {//Reject
										mess = 'Hủy hủy duyệt sơ bộ thành công';
									} else if(x == 4) {//Activated
										mess = 'Duyệt sơ bộ thành công';
									}
									alert(mess);
									
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Duyet so bo -->
	
	<!-- Comparison Popup -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="smschar_pop">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="wap_post">
		<input type="hidden" name="a" value="operator_reject" />
		<input type="hidden" id="popup_pid" name="popup_pid" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			
			<div class="li_row">
				<b>Lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
			
		</div>
		<div>
			<input type="hidden" name="submit2" value="approve" />
			<input type="submit" name="reject" value="Reject" class="btn_greensmall" />
			<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="reset">
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
							$('.modal_close').click();
							window.location.replace(window.location.pathname);
							if ($.isNumeric(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=wap_post] input[name=pid]').val();
									if(x == 1) {//Pending
										mess = 'ou have request to integrate wap charging to your product, it will be active after getting 1Pay approvement';
									} else if(x == 2) {//Reject
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										mess = 'wap charging request for this product has been rejected';
									} else if(x == 4) {//Activated
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									//var url = window.location.pathname;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Comparison Popup -->
	<!-- Merchant xac nhan -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="merchant_confirm_post">
		<input type="hidden" name="a" value="merchant_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			<div class="li_row">
				<b>Mô tả/lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des_merchant" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit_merchant" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Xác nhận" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy xác nhận" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=merchant_confirm_post] input[type=submit]').live('click', function() {
					$('form[name=merchant_confirm_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_merchant').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des_merchant').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy Merchant xác nhận');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=merchant_confirm_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=merchant_confirm_post] input[name=pid]').val();
									if(x == 5) {//Reject
										mess = 'Hủy bỏ xác nhận đối soát thành công';
									} else if(x == 6) {//Activated
										mess = 'Xác nhận đối soát thành công';
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									//var url = window.location.pathname;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Merchant Approval -->
	
	<!-- Offical Approval -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="offical_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="offical_post">
		<input type="hidden" name="a" value="offical_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			<div class="li_row">
				<b>Mô tả/lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des_offical" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit_offical" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Duyệt chính thức" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy huyệt chính thức" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=offical_post] input[type=submit]').live('click', function() {
					$('form[name=offical_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_offical').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des_offical').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy duyệt chính thức');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=offical_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=offical_post] input[name=pid]').val();
									if(x == 7) {//Reject
										mess = 'Hủy duyệt chính thức thành công';
									} else if(x == 8) {//Activated
										mess = 'Duyệt chính thức thành công';
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Offical Approval -->
	
	<!-- Billing Approval -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="billing_approval">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="billing_post">
		<input type="hidden" name="a" value="billing_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Thanh toán cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			<div class="li_row">
				<b>Mô tả/lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des_billing" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit_billing" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Thanh toán" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy thanh toán" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=billing_post] input[type=submit]').live('click', function() {
					$('form[name=billing_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_billing').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des_billing').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy thanh toán');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=billing_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=billing_post] input[name=pid]').val();
									if(x == 9) {//Reject
										mess = 'Hủy thanh toán thành công';
									} else if(x == 10) {//Activated
										mess = 'Thanh toán thành công';
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters; 
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Billing Approval -->
	
	<!-- Merchant xac nhan Bill-->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_approval_bill">
	<form action="<%=request.getContextPath()%>/protected/comparison_app_ajax.html" method="post" name="merchant_confirm_bill_post">
		<input type="hidden" name="a" value="merchant_confirm_bill" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			<div class="li_row">
				<b>Mô tả/lý do hủy bỏ:</b>
				<br>
				<textarea id="popup_des_merchant_bill" name="popup_des" rows="10" cols="50" placeholder="Mô tả/lý do hủy bỏ"></textarea>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input type="hidden" class="value_submit_merchant_bill" name="submit2" value="approve" />
			<input type="submit" name="approve" value="Xác nhận" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy xác nhận" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=merchant_confirm_bill_post] input[type=submit]').live('click', function() {
					$('form[name=merchant_confirm_bill_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_merchant_bill').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des_merchant_bill').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy Merchant xác nhận');
	    					return false;
	    				}
					}
				});
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=merchant_confirm_bill_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=merchant_confirm_bill_post] input[name=pid]').val();
									if(x == 11) {//Reject
										mess = 'Hủy xác nhận chưa nhận được thanh toán từ 1PAY';
									} else if(x == 12) {//Activated
										mess = 'Xác nhận đã nhận được thanh toán từ 1PAY';
									}
									alert(mess);
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									//var url = window.location.pathname;
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url)); */
									
									var pageSizeHtml = '<input type="hidden" name="d-49520-p" value="' + parseInt('${model.offset / model.pagesize + 1 }') + '" />';
									$('.box_locketqua').append(pageSizeHtml);
									$('.box_locketqua input[type=submit]').click();
									
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(json);
							}
						}, 'text');
					return false;
				});
		});
	</script>
	</div>
	<!-- /Merchant Approval Bill-->
	
	<!-- Info Comparison -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="info_comparison_common">
		<input type="hidden" name="a" value="operator_reject" />
		<input type="hidden" id="popup_pid" name="popup_pid" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đối soát cho merchant <span class="popup_merchant" id="popup_merchant"></span></h1>
			<div class="product_title">
				Chu kỳ đối soát: <span class="go_sms_product_name popup_payment_policy" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				Loại hợp đồng: <span class="go_sms_product_name popup_has_vat" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				Kỳ đối soát: <span class="go_sms_product_name popup_title" id="popup_title"></span>
			</div>
			<div class="product_title">
				Trạng thái đối soát: <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
			</div>
			<div class="product_title">
				Mô tả: <span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
			</div>
			<div class="product_title">
				Doanh thu chia sẻ: <span class="go_sms_product_name popup_amount_total" id="popup_amount_total"></span>
			</div>
			<div class="product_title">
				Doanh thu merchant được hưởng: <span class="go_sms_product_name popup_amount_total_received" id="popup_amount_total_received"></span>
			</div>
			<div class="product_title">
				Chi thiết doanh thu Merchant được hưởng theo dịch vụ: <span class="go_sms_product_name popup_amount_services" id="popup_amount_services"></span>
			</div>
			
			<div class="product_title">
				Thông tin đối soát tham chiếu: 
				<div class="popup_reference">
				</div>
				<div class="popup_ref_reject_log" style="color:red"></div>
			</div>
		</div>
		<div>
			<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="button"/>
		</div>
	</div>
	<!-- /Info Comparison -->
	
<script type="text/javascript">
function getStatusDescription(active) {
	var status_view = '';
	switch(active)
	{
		case '0':
			status_view = 'Khởi tạo đối soát';
		  	break;
		case '1':
			status_view = 'Hủy đề nghị duyệt sơ bộ';
		  	break;
		case '2':
			status_view = 'Đề nghị duyệt sơ bộ';
		  	break;
		case '3':
			status_view = 'Hủy duyệt sơ bộ';
		  	break;
		case '4':
			status_view = 'Chờ merchant xác nhận';
		  	break;
		case '5':
			status_view = 'Merchant hủy xác nhận';
		  	break;
		case '6':
			status_view = 'Chờ duyệt chính thức';
		  	break;
		case '7':
			status_view = 'Hủy duyệt chính thức';
		  	break;
		case '8':
			status_view = 'Chờ thanh toán';
		  	break;
		case '9':
			status_view = 'Hủy thanh toán';
		  	break;
		case '10':
			status_view = 'Đã thanh toán';
		  	break;
		case '11':
			status_view = 'Merchant hủy xác nhận thanh toán';
		  	break;
		case '12':
			status_view = 'Merchant đã xác nhận thanh toán';
		  	break;
		default:
			status_view = 'Chưa xác định';
	}
	return status_view;
}
											$(document).ready(function() {
												$("#myTip").qtip({
													content: 'Doanh thu chia sẻ (Ký hiệu DT): là doanh thu 1PAY bắt đầu dùng để chia sẻ từ các dịch vụ hai bên hợp tác sau khi trừ đi thuế VAT (10%). Phần thuế VAT 10% 1PAY phải nộp vào ngân sách nhà nước.',										
													position : {
														corner : {
															target : 'topRight',
															tooltip : 'bottomLeft'
														}
													},
													style : {
														name : 'cream',
														tip : 'bottomLeft',
														border : {
															width : 1,
															radius : 12,
															color : '#F49105'
														},
														color : '#fff',
														background : '#F49105'
													}
												});
											});
											$(document).ready(function() {
												//<!--yeucauduyesobo-->
												$('.yeucauduyetsobo').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
													$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else $(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
													$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else $(".popup_ref_reject_log").html('');
													//
													var status_view = getStatusDescription(active);
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													//popup info
													
													var isRequirePreliminary = $("#isRequirePreliminary").val();
													
													if(active == '0'||active == '1') {
														//preliminary_pop
														if(isRequirePreliminary=='true')$(".require_preliminary_approval").trigger("click");
														else $(".info_comparison_common").trigger("click");
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												
												//<!--duyesobo-->
												$('.duyetsobo').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
													$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else $(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
													$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else $(".popup_ref_reject_log").html('');	
													var status_view = getStatusDescription(active);
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													//popup info
													
													var isPreliminary = $("#isPreliminary").val();
													//Trạng thái chờ duyệt sơ bộ:2
													if(active == '2') {
														//preliminary_pop
														if(isPreliminary=='true')$(".preliminary_approval").trigger("click");
														else $(".info_comparison_common").trigger("click");
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--/duyesobo-->
												
												//<!--merchant xacnhan đối soát-->
												$('.merchantxacnhan').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
													$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else $(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
													$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else $(".popup_ref_reject_log").html('');	
													var status_view = getStatusDescription(active);
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													
													$(".popup_has_vat").html('Loại '+contract_type);
													var isMerchant = $("#isMerchant").val();
													
													//Trạng thái chờ Merchant xác nhận:4
													if(active == '4') {
														if(isMerchant=='true')$(".merchant_approval").trigger("click");
														else $(".info_comparison_common").trigger("click");
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--/merchant xacnhan đối soát-->
												
												//<!--duyet chinh thuc-->
												$('.duyetchinhthuc').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
													$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else $(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
													$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else $(".popup_ref_reject_log").html('');	
													var status_view = getStatusDescription(active);
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var isOffical = $("#isOffical").val();
													
													//Trạng thái chờ Duyệt chính thức:6
													if(active == '6') {
														if(isOffical=='true')
															$(".offical_approval").trigger("click");
														else $(".info_comparison_common").trigger("click");
													}else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--/duyet chinh thuc-->
												
												//<!--thanh toan-->
												$('.thanhtoan').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
													$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else $(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
													$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else $(".popup_ref_reject_log").html('');	
													var status_view = getStatusDescription(active);
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var isBilling = $("#isBilling").val();
													
													//Trạng thái chờ Thanh toán:8
													if(active == '8') {
														if(isBilling=='true')
															$(".billing_approval").trigger("click");
														else
															$(".info_comparison_common").trigger("click");
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--/thanh toan-->
												
												//<!--merchant xac nhan thanh toan-->
												$('.merchantxacnhanthanhtoan').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													
													var title = $("#hd_title-"+pid).val();
													var merchant = $("#hd_merchant-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var amount_total = $('#amount_total_'+pid).val();
													var amount_total_received = $('#amount_total_received_'+pid).val();
													var amount_services = $('#amount_services_'+pid).val();
													var paymentPolicy = $('#payment_policy_'+pid).val();
													var contract_type = $('#contract_type_'+pid).val();
													var rejectLog = $('#rejectLog_'+pid).val();
													$(".popup_reject_log").html(rejectLog);
													
													var reference = $('#reference_'+pid).val();
													if(reference!='' && reference!='undefined')
														$(".popup_reference").html('<a href="detail_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
													else
														$(".popup_reference").html('');
													var refRejectLog = $('#refRejectLog_'+pid).val();
													if(refRejectLog!='' && refRejectLog!='undefined')
														$(".popup_ref_reject_log").html(' - '+refRejectLog);
													else
														$(".popup_ref_reject_log").html('');	
													var status_view = getStatusDescription(active);
													
													//popup info
													$(".popup_title").html(title);
													$(".popup_merchant").html(merchant);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_amount_total").html(amount_total);
													$(".popup_amount_total_received").html(amount_total_received);
													$(".popup_amount_services").html(amount_services);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													//popup info
													
													var isMerchant = $("#isMerchant").val();
													//Trạng thái chờ Merchant xác nhận thanh toán:10
													if(active == '10') {
														//alert(isMerchant);
														if(isMerchant=='true')
															$(".merchant_approval_bill").trigger("click");
														else
															$(".info_comparison_common").trigger("click");
													}
													else
													{
														$(".info_comparison_common").trigger("click");
														return;
													}
												});
												//<!--/merchant xac nhan thanh toan-->
											});
										</script>
	
	<!-- Info Comparison -->
	<div style="width:800px" class="_pop" id="export_info">
	</div>
	<script>
		$(document).ready(function() {
			$('.export_info').live('click', function() {
				if($('input[name=contractType]:checked').length == 0 || $('input[name=contractType]:checked').length > 1) {
					alert('Bạn phải chọn 1 loại hợp đồng');
					$('.modal_close').click();
					return false;
				}
				
				if($('select[name=paymentPolicy]').val().length <= 0) {
					alert('Bạn phải chọn 1 chu kỳ đối soát');
					$('.modal_close').click();
					return false;
				}
				
				$('#export_info').html('');
				
				var querySt = window.location + '';
				if(querySt.indexOf('?') > 0)
					querySt = '&' + querySt.substring(querySt.indexOf('?') + 1);
				else
					querySt = '';
				$('#export_info').html('<iframe src="<%=request.getContextPath()%>/protected/comparison_app_ajax.html?a=export_info' + querySt + '" style="width:100%;height:680px;border:none;"></iframe>');
			});
		});
	</script>										