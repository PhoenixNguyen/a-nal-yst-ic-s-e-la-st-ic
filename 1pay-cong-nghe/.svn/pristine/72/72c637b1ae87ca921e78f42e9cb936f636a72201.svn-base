<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Calendar,java.util.Date"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.alphanumeric.pack.js"></script>	

<!-- 1.Đề nghị đối soát: Provider-->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="comparison_provider_require">
	<form action="<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html" method="post" name="require_preliminary_approve_post">
		<input type="hidden" name="a" value="require_comparison_provider" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">(1)-1PAY đối soát Provider <span class="popup_merchant" id="popup_merchant"></span></h1>
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
			<input type="submit" name="approve" value="Đề nghị đối soát" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=require_preliminary_approve_post] input[type=submit]').live('click', function() {
					//alert($(this).attr('name'));
					//var popup_des = $('form[name=sms_post] input[name=service_code]').val();
     				//Check valid
    				
					$('form[name=require_preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_require_preliminary').val();
					if(submit2=='reject'){
						var popup_des = $('#require_preliminary_popup_des').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy Đề nghị duyệt đối soát');
	    					return false;
	    				}
					}
				});
				
				/*
				$('form[name=require_preliminary_approve_post] input[type=reset]').live('click', function() {
					alert('dong');
					$.unblockUI(); 
					//return false;
				});
				*/
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=require_preliminary_approve_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//alert(json);
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									//var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=require_preliminary_approve_post] input[name=pid]').val();
									if(x == 1) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Hủy hủy Đề nghị duyệt đối soát thành công';
									} else if(x == 2) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Đề nghị Duyệt đối soát thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(typeof(month)!= 'undefined'  && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									//var url = window.location.pathname;
									
									//alert(url);
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
	<!-- /1.Đề nghị đối soát:Provider -->
	
	<!-- 2.Duyệt đối soát:Provider -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="comparison_provider_accept">
	<form action="<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html" method="post" name="preliminary_approve_post">
		<input type="hidden" name="a" value="comparison_approve" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">(2)-1PAY đối soát Provider <span class="popup_merchant" id="popup_merchant"></span></h1>
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
			<input type="submit" name="approve" value="Duyệt đối soát" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy duyệt đối soát" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=preliminary_approve_post] input[type=submit]').live('click', function() {
					//alert($(this).attr('name'));
					//var popup_des = $('form[name=sms_post] input[name=service_code]').val();
     				//Check valid
    				
					$('form[name=preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy duyệt đối soát');
	    					return false;
	    				}
					}
				});
				/*
				$('form[name=preliminary_approve_post] input[type=reset]').live('click', function() {
					window.location.replace(window.location.pathname);
					return false;
				});
				*/
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=preliminary_approve_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//alert(json);
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									//var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=preliminary_approve_post] input[name=pid]').val();
									if(x == 3) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Hủy hủy duyệt đối soát thành công';
									} else if(x == 4) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Duyệt đối soát thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
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
	<!-- /2.Duyệt đối soát:Provider -->
	
	<!-- 3.Provider xác nhận đối soát: Provider -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_comparison_provider">
	<form action="<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html" method="post" name="merchant_confirm_post">
		<input type="hidden" name="a" value="provider_confirm_comparisons" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">(3)-1PAY xác nhận đối soát <span class="popup_merchant" id="popup_merchant"></span></h1>
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
	    					alert('Xin hãy nhập lý do hủy xác nhận đối soát');
	    					return false;
	    				}
					}
				});
				/*
				$('form[name=merchant_confirm_post] input[type=reset]').live('click', function() {
					window.location.replace(window.location.pathname);
					return false;
				});
				*/
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=merchant_confirm_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//alert(json);
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=merchant_confirm_post] input[name=pid]').val();
									if(x == 5) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Hủy bỏ xác nhận đối soát thành công';
									} else if(x == 6) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Xác nhận đối soát thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
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
	<!-- /Provider xác nhận đối soát: Provider -->
	
	<!-- 4.Provider xác nhận hoàn thành thanh toán: Provider -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_payment_provider">
	<form action="<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html" method="post" name="offical_post">
		<input type="hidden" name="a" value="provider_confirm_payment" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">(4)-1PAY đối soát Provider <span class="popup_merchant" id="popup_merchant"></span></h1>
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
			<input type="submit" name="approve" value="Xác nhận thanh toán" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy xác nhận thanh toán" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=offical_post] input[type=submit]').live('click', function() {
					$('form[name=offical_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_offical').val();
					//alert(submit2);
					if(submit2=='reject'){
						var popup_des = $('#popup_des_offical').val();
						//alert(popup_des);
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy xác nhận thanh toán');
	    					return false;
	    				}
					}
				});
				/*
				$('form[name=offical_post] input[type=reset]').live('click', function() {
					window.location.replace(window.location.pathname);
					return false;
				});
				*/
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=offical_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//alert(json);
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=offical_post] input[name=pid]').val();
									if(x == 7) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Hủy xác nhận thanh toán thành công';
									} else if(x == 8) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Xác nhận thanh toán thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
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
	<!-- /Provider xác nhận hoàn thành thanh toán: Provider -->
	
	<!-- 5.1Pay xác nhận nhận được tiền: Provider -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_payment_1pay">
	<form action="<%=request.getContextPath()%>/protected/provider_comparison_app_ajax.html" method="post" name="billing_post">
		<input type="hidden" name="a" value="onepay_confirm_payment" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">(5)-1PAY đối soát Provider <span class="popup_merchant" id="popup_merchant"></span></h1>
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
			<input type="submit" name="approve" value="Xác nhận" class="btn_greensmall" />
			<input type="submit" name="reject" value="Hủy xác nhận" class="btn_greensmall" />
			<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
			<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=billing_post] input[type=submit]').live('click', function() {
					$('form[name=billing_post] input[name=submit2]').val($(this).attr('name'));
					var submit2 = $('.value_submit_billing').val();
					if(submit2=='reject'){
						var popup_des = $('#popup_des_billing').val();
						if(popup_des.length==0) {
	    					alert('Xin hãy nhập lý do hủy xác nhận thanh toán');
	    					return false;
	    				}
					}
				});
				/*
				$('form[name=billing_post] input[type=reset]').live('click', function() {
					window.location.replace(window.location.pathname);
					return false;
				});
				*/
			});
			</script>
		</div>
	</form>
	<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=billing_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x > 0) {
									var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=billing_post] input[name=pid]').val();
									if(x == 9) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Hủy xác nhận thanh toán thành công';
									} else if(x == 10) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Xác nhận thanh toán thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									/* var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(typeof(month)!= 'undefined' && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
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
	<!-- /1Pay xác nhận nhận được tiền: Provider -->
	
	<!-- Info Comparison -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="info_provider_comparison_common">
		<input type="hidden" name="a" value="operator_reject" />
		<input type="hidden" id="popup_pid" name="popup_pid" value="" />
		<div class="pop_box">
			<h1 class="srv_title">1PAY đối soát Provider <span class="popup_merchant" id="popup_merchant"></span></h1>
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

<!-- Action popup -->
<script type="text/javascript">
		<!-- Validation -->
		function validateEmail(sEmail) {
		    var filter = /^([\w-\.]+)@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.)|(([\w-]+\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})(\]?)$/;
		    if (filter.test(sEmail)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}
		
		function validatePhone(sPhone) {
			var phoneRegExp = /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/;
		    if (phoneRegExp.test(sPhone)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}
		
		function getStatusDescription(active) {
			var status_view = '';
			switch(active)
			{
				case '0':
					status_view = 'Khởi tạo đối soát';
				  	break;
				case '1':
					status_view = 'Hủy đề nghị duyệt đối soát';
				  	break;
				case '2':
					status_view = 'Đề nghị duyệt đối soát';
				  	break;
				case '3':
					status_view = '1PAY hủy duyệt đối soát';
				  	break;
				case '4':
					status_view = '1PAY đã duyệt đối soát';
				  	break;
				case '5':
					status_view = 'Provider hủy xác nhận đối soát';
				  	break;
				case '6':
					status_view = 'Provider xác nhận đối soát';
				  	break;
				case '7':
					status_view = 'Provider chưa thanh toán';
				  	break;
				case '8':
					status_view = 'Provider xác nhận đã thanh toán';
				  	break;
				case '9':
					status_view = '1PAY chưa nhận được tiền';
				  	break;
				case '10':
					status_view = '1PAY đã nhận tiền';
				  	break;
			}
			return status_view;
		}
		
		$(document).ready(function() {
			$('.is_alpha_nocaps').alpha({nocaps:true});
			$('.is_alpha_allow_space').alpha({allow:" "});
			$('.is_alphanumeric_name').alphanumeric({allow:" "});
			$('.is_alphanumeric_allow_space').alphanumeric({allow:"-_/.:, "});
			$('.is_numeric').numeric();
			$('.is_alphanumeric').alphanumeric();
			$('.is_email').alphanumeric({allow:"@."});
			$('.is_content').alphanumeric({allow:"-_/."});
			$('.is_date').numeric({allow:"/"});
		});
		
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
			//<!--1. Đề nghị đối soát-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
				
				var isRequirePreliminary = $("#isRequirePreliminary").val();
				
				if(active == '0'||active == '1') {
					if(isRequirePreliminary=='true')
						$(".require_preliminary_approval").trigger("click");
					else 
						$(".info_comparison_common").trigger("click");
				}
				else
				{
					$(".info_comparison_common").trigger("click");
					return;
				}
			});
			//<!--1. Đề nghị đối soát-->
			
			//<!--2. Duyệt đối soát-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
			//<!--2. Duyệt đối soát-->
			
			//<!--3. Provider xác nhận đối soát-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
				//Trạng thái chờ Merchant xác nhận:4
				if(active == '4') {
					if(isMerchant=='true')$(".merchant_approval").trigger("click");
					else $(".info_comparison_common").trigger("click");
				}else
				{
					$(".info_comparison_common").trigger("click");
					return;
				}
			});
			//<!--3. Provider xác nhận đối soát-->
			
			//<!--4. Provider xác nhận thanh toán-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
				
				var isOffical = $("#isOffical").val();
				//Trạng thái chờ Duyệt chính thức:6
				if(active == '6') {
					if(isOffical=='true')$(".offical_approval").trigger("click");
					else $(".info_comparison_common").trigger("click");
				}
				else
				{
					$(".info_comparison_common").trigger("click");
					return;
				}
			});
			//<!--4. Provider xác nhận thanh toán-->
			
			//<!--5. 1pay xác nhận được thanh toán-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
				
				var isBilling = $("#isBilling").val();
				
				//Trạng thái chờ Thanh toán:8
				if(active == '8') {
					if(isBilling=='true')$(".billing_approval").trigger("click");
					else $(".info_comparison_common").trigger("click");
				}
				else
				{
					$(".info_comparison_common").trigger("click");
					return;
				}
			});
			//<!--5. 1pay xác nhận được thanh toán-->
			
			//<!--merchantxacnhan thanh toan-->
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
					$(".popup_reference").html('<a href="detail_provider_comparison.html?id='+reference+'" class="" title="Xem chi tiết đối soát" style="color:#1469EB" target="blank"> - Chi tiết đối soát gốc</a>');
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
					if(isMerchant=='true')$(".merchant_approval_bill").trigger("click");
					else $(".info_comparison_common").trigger("click");
				}
				else
				{
					$(".info_comparison_common").trigger("click");
					return;
				}
			});
			//<!--/merchantxacnhan thanh toan-->
		});
</script>

