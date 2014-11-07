<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@ page import="vn.onepay.merchant.common.MerchantProfileConstant, vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Calendar,java.util.Date"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.alphanumeric.pack.js"></script>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.base64.js"></script>

<style>
	.w_50 { width:50%; float:left}
	.label_popup_edit_contact {
	width: 120px;
	float: left;
	padding-right: 10px;
	text-align: right;
	line-height:30px;
	}
	.contract_content span {
	font-size:14px;	
	font-weight: bold;
	color: #2C8F39;
	line-height: 30px;
	}
	.dashboard_filter_2 {
	border: 1px solid #CCCCCC;
	padding: 6px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	box-shadow: 0 0 0 #000000, 0 3px 3px #EEEEEE inset;
	margin:3px 0px;
	width:190px;
	}
	select.dashboard_filter_2 { width:204px}
	input.dashboard_filter_2 {width:190px;}
	
	.close {position:absolute;top:1px;right:1px;padding:3px 6px;display: block;border-radius: 10px;width: 10px;background-color: #2c8f39;color: #fff;}
</style>
<%Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED); %>
<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
	<input type="hidden" name="is_merchant_hidden" id="is_merchant_hidden" value="0" />
<%}else{%>
	<input type="hidden" name="is_merchant_hidden" id="is_merchant_hidden" value="1" />
<%}%>


<!-- (10)Xác thực email, phone -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_confirm_contract_rates_verify"  class="style_formpopup_common popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="manager_profile_merchant_confirm_verify">
		<input type="hidden" name="a" value="manager_profile_merchant_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                        <div class="contract_content"> 
                        <h1 class="srv_title">Merchant xác nhận hợp đồng</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                	<span class="button_veriry_email">
                                		[<a href="<%=request.getContextPath()%>/protected/verify_email.html" target="_blank" class="link_feature" title="Xac thuc email" style="color: #0066cc">Xác thực</a>]
                                	</span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                	<span class="button_veriry_phone">
                                		[<a href="<%=request.getContextPath()%>/protected/verify_phone.html" target="_blank" class="link_feature" title="Xac thuc so dien thoai" style="color: #0066cc">Xác thực</a>]
                                	</span>
                                </div>
								
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                
                                <div class="contract_content">
		                        	<label class="label_popup_edit_contact">Trạng thái:</label>
		                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
		                        </div>
		                        
		                        <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
		                        
								<div class="contract_content">
			                        <label class="label_popup_edit_contact"> Thông tin tỷ lệ:</label>
			                        <span class="popup_detail_profile" style="color:red;"></span>
		                        </div>
                            </div>
                            
                            <div class="w_50">
		                        <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                        
                        <div class="product_title" style="width: 800px;">
	                        <span style="color:red; width: 800px;">
	                        	Lưu ý: Quý merchant chưa xác thực email/điện thoại/thông tin thanh toán. Vui lòng xác thực để tiếp tục xác nhận profile.
	                        </span>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
							<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset" />
                        </div>
                    </div>
                </form>
</div>
<!-- /(10)Xác thực email, phone -->

<!-- (4)Merchant xác nhận profiles-->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_confirm_contract_rates"  class="style_formpopup_common popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="manager_profile_merchant_confirm">
		<input type="hidden" name="a" value="manager_profile_merchant_confirm" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                        <div class="contract_content"> 
                        <h1 class="srv_title">Merchant xác nhận hợp đồng</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <span class="button_veriry_email">
                                    	<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
										    <a href="" class="link_feature" title="Xac thuc email" style="color: #0066cc">
	                                			<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
	                                		</a>
										<%}else{%>
	                                		<a href="<%=request.getContextPath()%>/protected/verify_email.html" target="_blank" class="link_feature" title="Xac thuc email" style="color: #0066cc">
	                                			<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
	                                			[Xác thực]
	                                		</a>
                                		<%}%>
                                	</span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                	<span class="button_veriry_phone">
                                		<%if(account.checkRole(Account.ACCOUNT_STAFF_ROLE)){ %>
										    <a href="" class="link_feature" title="Xac thuc so dien thoai" style="color: #0066cc">
	                                			<img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
	                                		</a>
										<%}else{%>
	                                		<a href="<%=request.getContextPath()%>/protected/verify_phone.html" target="_blank" class="link_feature" title="Xac thuc so dien thoai" style="color: #0066cc">
                                			<img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                			[Xác thực]
                                		</a>
                                		<%}%>
                                	</span>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title">
                        	<label class="label_popup_profile">Thời gian đề nghị:</label>
                        	<span class="popup_effective_date_fmt"></span>
                        </div>
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/Lý do hủy: </label>
                        	<textarea id="popup_des_merchant_confirm" name="popup_des_merchant_confirm" title="Nội dung" style="width: 350px; height:20px;" placeholder="Mô tả/Lý do hủy"  rows="2" maxlength="200"></textarea>
                        </div>
                        
						<div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" title="Đã xem kỹ tỷ lệ" value="rate_checked" name="checkRates_merchant_confirm" class="chck_filter chargingService" id="checkRates_merchant_confirm"/>
						    Tôi đồng ý HĐ và tỷ lệ chia sẻ từ 1PAY <span class="popup_detail_profile" style="color:red;"></span>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                         	<input type="hidden" class="value_submit_edit_rates" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Xác nhận" class="btn_greensmall" />
								<input type="submit" name="reject" value="Hủy xác nhận" class="btn_merchant_profile_preview" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset" />
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=manager_profile_merchant_confirm] input[type=submit]').live('click', function() {
									$('form[name=manager_profile_merchant_confirm] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_edit_rates').val();
									if(submit2=='reject'){
										var popup_des = $('#popup_des_merchant_confirm').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy xác nhận thông tin hợp đồng và tỷ lệ chia sẻ từ 1PAY?');
					    					return false;
					    				}
										
										var answer = confirm('Bạn chắc chắn muốn hủy xác nhận thông tin hợp đồng và tỷ lệ chia sẻ từ 1PAY?');
										if (!answer)
										{
											return false;
										}
									}
									if(submit2=='approve'){
										var isChecked = $('#checkRates_merchant_confirm').is(':checked');
										if(!isChecked){
											alert('Xin hãy kiểm tra kỹ tỷ lệ chia sẻ trước khi xác nhận từ 1PAY');
					    					return false;
										}
										
										var answer = confirm('Bạn có chắc chắn muốn xác nhận thông tin HĐ và tỷ lệ chia sẻ từ 1PAY?');
										if (!answer)
										{
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
						$('form[name=manager_profile_merchant_confirm]').submit(function() {
								$.post($(this).attr('action'), $(this).serialize(), function(json) {
										if (!isNaN(json)) {
											var x = parseInt(json);
											if (x > 0) {
												var mess = '';
												if(x == 7) {
													mess = 'Hủy xác nhận thông tin HĐ và tỷ lệ chia sẻ thành công';
												} else if(x == 8) {
													mess = 'Xác nhận thông tin HĐ và tỷ lệ chia sẻ thành công';
												}
												alert(mess);
												
												var paramters = '';
												var url = document.URL;
												var parameter_callback = $("#url_callback").val();
												if(url.indexOf("?")<=0){
													paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
												}
												
												//indexOf
												var m = url.indexOf("#row");
												if(m>0)url=url.substring(0,m);
									
												var n = url.indexOf("&rand=");
												if(n>0)url=url.substring(0,n);
												var milliseconds = new Date().getTime();
												var popup_pid = $("#popup_pid").val();
												paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
												if(paramters.length>1)url=url+paramters;
												$(location).attr('href',url);
												return false;
											} else {
												alert('Unsuccessful activation');
											}
										} else {
											alert(showError(json));
										}
									}, 'text');
								return false;
							});
					});
				</script>
</div>
<!-- (4)Merchant xác nhận profiles-->

<!-- (6)kích hoạt profiles -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="effective_date" class="style_formpopup_common popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="effective_date_post_">
		<input type="hidden" name="a" value="operator_active_profile" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Kích hoạt profile</h1>
                        </div>
                         -->
                        <p class="title-box title_box_margin">Kích hoạt profile</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại HĐ: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view"></span>
                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        
                        <%
							DateFormat dtFormat = new SimpleDateFormat("dd/MM/yyyy");
							Calendar calendar = Calendar.getInstance();
							int currHour = calendar.get(Calendar.HOUR_OF_DAY);
							String strDate = dtFormat.format(calendar.getTime());
						%>
						<div class="product_title">
							<label class="label_popup_profile">Ngày hiệu lực: </label>
							<input type="text" id="popup_effective_date_approve" name="popup_effective_date_approve" value="" placeholder="dd/mm/yyyy" class="txt_reglog is_date" style="width: 100px;" maxlength="10"/>
							
							(Ví dụ: 28/08/2014)
							<script>
							  $(function() {
								  $('#popup_effective_date_approve').datepicker({
								        dateFormat: "dd/mm/yy",
								        altFormat: "dd/mm/yy"
								  });
							  });
							</script>
							&nbsp;&nbsp;Giờ: 
							<select name="popup_effective_time_approve" id="popup_effective_time_approve">
								<%
									for(int hour=0;hour<24;hour++){
										String strHour = (hour<10?"0":"")+hour;
								%>
								<option value="<%=strHour%>" ><%=hour%></option>
								<%}%>
							</select>
							&nbsp;&nbsp;Phút: 
							<select name="popup_effective_time_minute_approve" id="popup_effective_time_minute_approve">
								<%
									for(int minute=0; minute<60; minute++){
										String strMinute = (minute<10?"0":"")+minute;
								%>
								<option value="<%=strMinute%>" ><%=minute%></option>
								<%}%>
							</select>
						</div>
						
						<div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" title="Đã xem kỹ tỷ lệ" value="operator_active_profile_submit" name="operator_active_profile_submit" class="chck_filter" id="operator_active_profile_submit"/>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	Đã xem kỹ thông tin hợp đồng 
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
						
						<div class="product_title">
							<label class="label_popup_profile">&nbsp;</label>
							<input type="hidden" class="value_submit" name="submit2" value="approve" />
							<input type="submit" name="approve" value="Kích hoạt" class="btn_greensmall" />
							<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
						</div>
                    </div>
                    <script type="text/javascript">
							$(document).ready(function() {
								$('form[name=effective_date_post_] input[type=submit]').live('click', function() {
									$('form[name=effective_date_post_] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit').val();
									if(submit2=='approve'){
										var popup_effective_date = $('#popup_effective_date_approve').val();
										if(popup_effective_date.length==0) {
					    					alert('Xin hãy nhập ngày hiệu lực của profile');
					    					return false;
					    				}
										
										//Xem kỹ HĐ
										var isChecked = $('#operator_active_profile_submit').is(':checked');
										if(!isChecked){
											alert('Xin xác nhận đã kiểm tra kỹ thông tin.');
					    					return false;
										}
										
										//?
										var answer = confirm('Bạn chắc chắn muốn kích hoạt profile?');
										if (!answer)
										{
											return false;
										}
									}
								});
								
							});
						</script>
</form>
<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=effective_date_post_]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
						if(json=='0') {
							alert('Kích hoạt profile thất bại');
							return false;
						}
							if (isNaN(json)) {
								var x = json;
								var mess = '';
								if(x== 'pending')
									mess = 'Kích hoạt profile thành công';
								else
									mess = 'Kích hoạt profile thất bại';
								alert(mess);
								
								var paramters = '';
								var url = document.URL;
								var parameter_callback = $("#url_callback").val();
								if(url.indexOf("?")<=0){
									paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
								}
								
								//indexOf
								var m = url.indexOf("#row");
								if(m>0)url=url.substring(0,m);
												
								var n = url.indexOf("&rand=");
								if(n>0)url=url.substring(0,n);
								var milliseconds = new Date().getTime();
								var popup_pid = $("#popup_pid").val();
								paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
								if(paramters.length>1)url=url+paramters;
								$(location).attr('href',url);
								return false;
							} else {
								alert(showError(json));
							}
						}, 'text');
					return false;
				});
		});
	</script>
</div>
<!-- /(6)kích hoạt profiles -->

<!-- (7)Hủy kích hoạt profiles -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="cancel_approved_profile" class="style_formpopup_common popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="activate_reject_post">
		<input type="hidden" name="a" value="operator_stop_profile" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Hủy kích hoạt profile</h1>
                        </div>
                         -->
                        <p class="title-box title_box_margin">Hủy kích hoạt profile</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
								
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view"></span>
                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/lý do hủy bỏ: </label>
                        	<textarea id="popup_des" name="popup_des" title="Nội dung" style="width: 350px;" placeholder="Mô tả/lý do hủy bỏ"  rows="2" maxlength="200"></textarea>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" title="Đã xem kỹ tỷ lệ" value="operator_stop_profile_checked" name="operator_stop_profile_checked" class="chck_filter" id="operator_stop_profile_checked"/>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	Đã xem kỹ thông tin hợp đồng 
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
                        
                        <div class="product_title">
                        	<label class="label_popup_profile">&nbsp;</label>
                        	<span class="go_sms_product_name">
                        		<input type="hidden" class="value_submit" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Hủy kích hoạt" class="btn_greensmall" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
                        	</span>
                        </div>
                    </div>
 <script type="text/javascript">
							$(document).ready(function() {
								$('form[name=activate_reject_post] input[type=submit]').live('click', function() {
									$('form[name=activate_reject_post] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit').val();
									if(submit2=='approve'){
										var popup_des = $('#popup_des').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy.');
					    					return false;
					    				}
										
										//Xem kỹ HĐ
										var isChecked = $('#operator_stop_profile_checked').is(':checked');
										if(!isChecked){
											alert('Xin xác nhận đã kiểm tra kỹ thông tin.');
					    					return false;
										}
										
										var answer = confirm('Bạn chắc chắn muốn hủy kích hoạt profile?');
										if (!answer)
										{
											return false;
										}
									}
								});
								
							});
</script>
</form>
<script type="text/javascript">
		$(document).ready(function() {
			$('form[name=activate_reject_post]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (isNaN(json)) {
								var x = json;
								var mess = '';
								if(x== 'ready' || x=='destroy')
									mess = 'Hủy kích hoạt profile thành công';
								else
									mess = 'Hủy kích hoạt profile thất bại';
								alert(mess);
								
								var paramters = '';
								var url = document.URL;
								var parameter_callback = $("#url_callback").val();
								if(url.indexOf("?")<=0){
									paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
								}
								
								//indexOf
								var m = url.indexOf("#row");
								if(m>0)url=url.substring(0,m);
												
								var n = url.indexOf("&rand=");
								if(n>0)url=url.substring(0,n);
								var milliseconds = new Date().getTime();
								var popup_pid = $("#popup_pid").val();
								paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
								if(paramters.length>1)url=url+paramters;
								$(location).attr('href',url);
								return false;
							} else {
								alert(showError(json));
							}
						}, 'text');
					return false;
				});
		});
	</script>
</div>
<!-- /(7)Hủy kích hoạt profiles -->

<!-- (8)Thông tin chung -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="common_contract_infomations" class="popup_mc_info_contract">
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Hợp đồng</h1>
                        </div>
                         -->
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view"></span>
                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title">
                        	<label class="label_popup_profile">&nbsp;</label>
                        	<span class="popup_reject_log" style="color:red;"></span>
                        </div>
                        
                        <div class="product_title">
                        	<label class="label_popup_profile">&nbsp;</label>
                        	<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
                        </div>
                    </div>
</div>
<!-- (8)Thông tin chung -->

<!-- (9)Clone Profiles -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="clone_profile_contract" class="popup_mc_info_contract">
<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="clone_profile_form">
		<input type="hidden" name="a" value="manager_profile_clone_profile" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />  
                    <div class="pop_box">
                        <div class="contract_content"> 
                        <h1 class="srv_title">Clone profile</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                    <span class="popup_effective_date_fmt"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view"></span>
                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title">
                        	<span class="popup_clone_profile_note" style="color:red; margin-left:133px;font-weight:normal"></span>
                        </div>
                        
                        <div class="product_title clone_view_submit" style="display:none;">
                        	<label class="label_popup_profile">Lý do đề xuất profile: </label>
                        	<textarea id="popup_des_reason_copy_profile" name="popup_des_reason_copy_profile" title="Nội dung" style="width: 350px;" placeholder="Lý do đề xuất profile"  rows="3" maxlength="200"></textarea>
                        </div>
                        
                        <div class="product_title">
                        	<label class="label_popup_profile">&nbsp;</label>
                        	<input type="hidden" class="value_submit_copy_profile" name="submit2" value="approve" />
							<input type="submit" name="approve" value="Clone profile" class="btn_greensmall clone_view_submit" style="display:none;"/>
							<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=clone_profile_form] input[type=submit]').live('click', function() {
									$('form[name=clone_profile_form] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_copy_profile').val();
									
									if(submit2=='approve'){
										var popup_des = $('#popup_des_reason_copy_profile').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do clone profile');
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
			$('form[name=clone_profile_form]').submit(function() {
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x >= 0) {
									var pid = $('form[name=clone_profile_form] input[name=pid]').val();
									var mess = 'Clone profile thành công.';
									alert(mess);
									
									var paramters = '';
									var url = document.URL;
									var parameter_callback = $("#url_callback").val();
									if(url.indexOf("?")<=0){
										paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
									}
									
									//indexOf
									var m = url.indexOf("#row");
									if(m>0)url=url.substring(0,m);
												
									var n = url.indexOf("&rand=");
									if(n>0)url=url.substring(0,n);
									var milliseconds = new Date().getTime();
									var popup_pid = $("#popup_pid").val();
									paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
									if(paramters.length>1)url=url+paramters;
									$(location).attr('href',url);
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(showError(json));
							}
						}, 'text');
					return false;
				});
		});
	</script>
</div>
<!-- /(9)Clone Profiles -->

<div id="dialog"></div>

<!-- (1)Cập nhật thông tin HĐ-->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="comparison_provider_accept" class="popup_mc_info_contract">
            <form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="preliminary_approve_post">
            	<input type="hidden" name="a" value="require_support_submit" />
				<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
				<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Cập nhật thông tin hợp đồng</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                         -->
                        <p class="title-box title_box_margin">Cập nhật thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div style="display:none;">
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_merchant_name" name="popup_merchant_name" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Tên đối tác" value="" maxlength="100">
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                	<span class="go_sms_product_name popup_merchant_email"></span>
                                	<!-- 
                                    <input type="text" id="popup_merchant_email" name="popup_merchant_email" class="dashboard_filter_2 is_email" id="popup_link" placeholder="Email" value="" maxlength="50">
                                	 -->
                                	<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                	<span id="verified_email_account"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_merchant_phone" name="popup_merchant_phone" class="dashboard_filter_2 is_numeric" id="popup_link" placeholder="Điện thoại" value="" maxlength="15">
                                	<img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                	<span id="verified_phone_account"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_contract_no" name="popup_contract_no" class="dashboard_filter_2 is_content" id="popup_link" placeholder="Số hợp đồng" value="" maxlength="50">
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
							        <select name="popup_contract_type" id="popup_contract_type" class="dashboard_filter_2">
										<option value="A_B2B">A_B2B</option>
										<option value="A_B2C">A_B2C</option>
										<option value="B1_B2B">B1_B2B</option>
										<option value="B1_B2C">B1_B2C</option>
										<option value="B2_CN">B2_CN</option>
										<option value="C_CN">C_CN</option>
									</select>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát<span style="color: #FF0000; font-weight: normal">(*)</span>:</label>
							        <select name="popup_payment_policy" id="popup_payment_policy" class="dashboard_filter_2">
										<option value="15_1_1">15_1</option>
										<option value="30_1">30_1</option>
										<option value="30_15">30_15</option>
									</select>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_contract_date" name="popup_contract_date" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
                                    Ví dụ: 28/08/2014
                                    <script>
                                    $(function() {
										  $('#popup_contract_date').datepicker({
										        dateFormat: "dd/mm/yy",
										        altFormat: "dd/mm/yy"
										  });
									});
                                    </script>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_contract_expired_date" name="popup_contract_expired_date" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
                                    Ví dụ: 28/08/2014
                                    <script>
									  $(function() {
										  $('#popup_contract_expired_date').datepicker({
										        dateFormat: "dd/mm/yy",
										        altFormat: "dd/mm/yy"
										  });
									  });
									</script>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thông tin thêm: </label>
									<textarea id="popup_merchantDesc" class="is_alphanumeric_allow_space" name="popup_merchantDesc" title="Nội dung" style="width: 200px; height:30px;" placeholder="Thông tin thêm" maxlength="150"></textarea>
								</div>
								</div>
								
								<div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <!-- 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                </div>
								 -->
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_support" class="chck_filter chargingService" id="autoExtendedContract_support"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <!-- 
                                <div class="contract_content"> 
                                	<p>
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                    <input type="checkbox" title="Có bản cứng hợp đồng" value="hasHardCopy" name="hasHardCopy_support" class="chck_filter chargingService" id="hasHardCopy_support"/>
                                    <label class="lbl_rempass" for="chck_rempass">
                                        Có bản cứng hợp đồng
                                        <span class="popup_hardcopy"></span>
                                    </label>
                                    </p>
                                </div>    
                                 -->
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                
                                <!-- 
                                <div class="product_title">
		                        	<label class="label_popup_profile">Trạng thái:</label>
		                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
		                        	<label style="padding-left: 10px;">(Profile tham chiếu: </label>
		                        	<span class="popup_profile_reference"></span>)
		                        </div>
		                         -->
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
								
                            </div>
                            
                            <div class="w_50">
                                <div style="display:none;">
                                <!-- CMND/ĐKKD -->
                                <div class="product_slc_filter filter_row">
									<fieldset class="identity_verify_popup">
										<legend>
											<strong>
												CMND/ĐKKD &nbsp; 
												<img class="popup_common_identity_verify" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/invalid.png"/>
											</strong>
										</legend>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">CMND/ĐKKD<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_merchant_identity" name="popup_merchant_identity" class="dashboard_filter_2 is_numeric" id="popup_link" placeholder="CMND/Mã số thuế" value="" maxlength="12">
			                                </div> 
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact"> &nbsp; </label>
			                                	<a class="identity_image_popup_common_a" href="<%=request.getContextPath()%>/images/identity_no.jpg" class="top_up" toptions="overlayClose = 1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, effect=transform, shaded=1, ondisplay = open_win()">
													<img class="identity_image_popup_common" border="0" width="100" height="50" src="<%=request.getContextPath()%>/images/identity_no.jpg"/>
												</a>
			                                </div>
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Nơi cấp/Địa chỉ<span class="required_red">(*)</span>: </label>
			                                    <input type="text" id="popup_place_of_issue" name="popup_place_of_issue" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Nơi cấp CMND/Địa chỉ ĐKKD" value="" maxlength="50">
			                                </div> 
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact">Ngày cấp<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_date_of_issue" name="popup_date_of_issue" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
			                                    Ví dụ: 20/08/2010
			                                    <script>
			                                    $(function() {
													  $('#popup_date_of_issue').datepicker({
													        dateFormat: "dd/mm/yy",
													        altFormat: "dd/mm/yy"
													  });
												});
			                                    </script>
			                                </div>
										</div>
									</fieldset>
								</div>
								<!-- CMND/ĐKKD -->
                                
                                <div class="product_slc_filter filter_row">
									<fieldset class="billing_info_popup">
										<legend>
											<strong>Thông tin thanh toán &nbsp; <img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/></strong>
										</legend>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Chủ tài khoản<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_account_holder" name="popup_account_holder" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Chủ tài khoản" value="" maxlength="100">
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Số tài khoản<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_account_number" name="popup_account_number" class="dashboard_filter_2 is_alphanumeric" id="popup_link" placeholder="Số tài khoản" value="" maxlength="20">
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên ngân hàng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                	<select id="popup_bank_name" name="popup_bank_name" class="dashboard_filter_2">
			                                		<option value='' label='--- Chọn ngân hàng ---'/> 
													<c:forEach var="bank" items="${model.banks}">
														<option value="${bank.code}">
															<c:out value="${bank.name}"/>
														</option>
													</c:forEach>
												</select>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tại tỉnh/thành phố<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                	<select id="popup_city_bank" name="popup_city_bank" class="dashboard_filter_2">	
			                                		<option value='' label='--- Chọn tỉnh/thành phố ---'/> 
													<c:forEach var="province" items="${model.provinces}">
														<option value="${province.code}">
															<c:out value="${province.name}"/>
														</option>
													</c:forEach>
												</select>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên chi nhánh<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_branch_bank" name="popup_branch_bank" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Tên chi nhánh" value="" maxlength="50">
			                                </div> 
										</div>
									</fieldset>
								</div>
								</div>
								
								<!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
                        	<label>(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title" style="display:none;">
                        	<label class="label_popup_profile">Mô tả:</label>
                        	<span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
                        </div>
                        <div class="product_title" style="display:none;">
							<label class="label_popup_profile">Loại tỷ lệ:</label>
							<span class="go_sms_product_name popup_rate_type" id="popup_rate_type" style="color:red;"></span>
						</div>
						
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/lý do hủy bỏ: </label>
                        	<textarea id="popup_des_support" class="is_alphanumeric_allow_space" name="popup_des" title="Nội dung" style="width: 350px; height:20px;" placeholder="Mô tả"  rows="2" maxlength="200"></textarea>
                        </div>
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" ${fn:contains(allContractType, 'rate_checked')?'checked="checked"':'' } title="Đã xem kỹ tỷ lệ" value="rate_checked" name="checkRates" class="chck_filter chargingService" id="checkRates"/>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	Đã xem kỹ thông tin hợp đồng 
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	<input type="hidden" class="value_submit_edit_contract" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Đề nghị" class="btn_greensmall confirm" />
								<input type="submit" name="reject" value="Từ chối" class="btn_merchant_profile_preview" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
	                        </label>
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=preliminary_approve_post] input[type=submit]').live('click', function() {
				     				//Check valid
									$('form[name=preliminary_approve_post] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_edit_contract').val();
									if(submit2=='reject'){
										var popup_des = $('#popup_des_support').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy hỗ trợ');
					    					return false;
					    				}
									}
									
									if(submit2=='approve'){
										var validate_merchant_profile = $('#validate_merchant_profile').val();
										if(validate_merchant_profile=='1')
										{
											var popup_merchant_name = $('#popup_merchant_name').val();
											if(popup_merchant_name.length==0) {
						    					alert('Xin hãy nhập tên đối tác');
						    					return false;
						    				}
											
											/*
											var popup_merchant_email = $('#popup_merchant_email').val();
											if(popup_merchant_email.length==0) {
						    					alert('Xin hãy nhập email đối tác');
						    					return false;
						    				}else{
						    					if (!validateEmail(popup_merchant_email)) {
										            alert('Email sai định dạng');
										            return false;
										        }
						    				}
											*/
											var popup_merchant_phone = $('#popup_merchant_phone').val();
											if(popup_merchant_phone.length==0) {
						    					alert('Xin hãy nhập điện thoại đối tác');
						    					return false;
						    				}else{
						    					if(popup_merchant_phone.length<10) {
							    					alert('Số điện thoại yêu cầu >=10 số.');
							    					return false;
							    				}
						    					if (!validatePhone(popup_merchant_phone)) {
										            alert('Số điện thoại sai định dạng');
										            return false;
										        }
						    				}
											//Số HĐ
											var popup_contract_no = $('#popup_contract_no').val();
											if(popup_contract_no.length==0) {
						    					alert('Xin hãy nhập Số hợp đồng');
						    					return false;
						    				}
											
											//Ngày ký hợp đồng
											var popup_contract_date = $('#popup_contract_date').val();
											if(popup_contract_date.length==0) {
						    					alert('Xin hãy nhập Ngày ký hợp đồng');
						    					return false;
						    				}
											
											//Ngày hết hạn
											var popup_contract_expired_date = $('#popup_contract_expired_date').val();
											if(popup_contract_expired_date.length==0) {
						    					alert('Xin hãy nhập Ngày hết hạn');
						    					return false;
						    				}
											
											//CMND-ĐKKD
											var popup_merchant_identity = $('#popup_merchant_identity').val();
											if(popup_merchant_identity.length==0) {
						    					alert('Xin hãy nhập CMND/ĐKKD');
						    					return false;
						    				}else{
						    					if(popup_merchant_identity.length<8) {
							    					alert('CMND/ĐKKD yêu cầu >=8 chữ số.');
							    					return false;
							    				}
						    					if (!validateCMND(popup_merchant_identity)) {
										            alert('CMND/ĐKKD sai định dạng');
										            return false;
										        }
						    				}
											var popup_place_of_issue = $('#popup_place_of_issue').val();
											if(popup_place_of_issue.length==0) {
						    					alert('Xin hãy nhập nơi cấp CMND/ địa chỉ ĐKKD');
						    					return false;
						    				}
											var popup_date_of_issue = $('#popup_date_of_issue').val();
											if(popup_date_of_issue.length==0) {
						    					alert('Xin hãy nhập ngày cấp CMND/ĐKKD');
						    					return false;
						    				}
											
											//Thông tin thanh toán
											var popup_account_holder = $('#popup_account_holder').val();
											if(popup_account_holder.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Chủ tài khoản');
						    					return false;
						    				}
											var popup_account_number = $('#popup_account_number').val();
											if(popup_account_number.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Số tài khoản');
						    					return false;
						    				}
						    				var popup_branch_bank = $('#popup_branch_bank').val();
											if(popup_branch_bank.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Chi nhánh');
						    					return false;
						    				}
										}
										
										//Xem kỹ HĐ
										var isChecked = $('#checkRates').is(':checked');
										if(!isChecked){
											alert('Xin hãy kiểm tra kỹ thông tin HĐ trước khi đề xuất duyệt');
					    					return false;
										}
										
										var answer = confirm('Bạn muốn đề xuất HĐ không?');
										if (!answer)
										{
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
												if(x == 1) {
													mess = 'Hủy cập nhật thông tin hợp đồng thành công';
												} else if(x == 2) {
													mess = 'Cập nhật thông tin hợp đồng thành công';
												}
												alert(mess);
												
												var paramters = '';
												var url = document.URL;
												var parameter_callback = $("#url_callback").val();
												if(url.indexOf("?")<=0){
													paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
												}
												
												//indexOf
												var m = url.indexOf("#row");
												if(m>0)url=url.substring(0,m);
									
												var n = url.indexOf("&rand=");
												if(n>0)url=url.substring(0,n);
												var milliseconds = new Date().getTime();
												var popup_pid = $("#popup_pid").val();
												paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
												if(paramters.length>1)url=url+paramters;
												$(location).attr('href',url);
												return false;
												
											} else {
												alert('Unsuccessful activation');
											}
										} else {
											alert(showError(json));
										}
									}, 'text');
								return false;
							});
					});
				</script>
</div>
<!-- /(1)Cập nhật thông tin HĐ-->

<!-- (2)Duyệt thông tin HĐ -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_comparison_provider" class="popup_mc_info_contract">
<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="merchant_confirm_post">
		<input type="hidden" name="a" value="operator_profile_info_submit" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Duyệt thông tin hợp đồng</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                         -->
                         <p class="title-box title_box_margin">Duyệt thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                
                                <div style="display:none;">
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_review_info_merchant_name" name="popup_review_info_merchant_name" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Tên đối tác" value="" maxlength="100">
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                	<span class="go_sms_product_name popup_merchant_email"></span>
                                	<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                	<span id="popup_review_info_verified_email"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_review_info_merchant_phone" name="popup_review_info_merchant_phone" class="dashboard_filter_2 is_numeric" id="popup_link" placeholder="Điện thoại" value="" maxlength="15">
                                	<img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                	<span id="popup_review_info_verified_phone"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_review_info_contract_no" name="popup_review_info_contract_no" class="dashboard_filter_2 is_content" id="popup_link" placeholder="Số hợp đồng" value="" maxlength="50">
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
							        <select name="popup_review_info_contract_type" id="popup_review_info_contract_type" class="dashboard_filter_2">
										<option value="A_B2B">A_B2B</option>
										<option value="A_B2C">A_B2C</option>
										<option value="B1_B2B">B1_B2B</option>
										<option value="B1_B2C">B1_B2C</option>
										<option value="B2_CN">B2_CN</option>
										<option value="C_CN">C_CN</option>
									</select>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát<span style="color: #FF0000; font-weight: normal">(*)</span>:</label>
							        <select name="popup_review_info_payment_policy" id="popup_review_info_payment_policy" class="dashboard_filter_2">
										<option value="15_1_1">15_1</option>
										<option value="30_1">30_1</option>
										<option value="30_15">30_15</option>
									</select>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_review_info_contract_date" name="popup_review_info_contract_date" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
                                    Ví dụ: 28/08/2014
                                    <script>
									  $(function() {
										  $('#popup_review_info_contract_date').datepicker({
										        dateFormat: "dd/mm/yy",
										        altFormat: "dd/mm/yy"
										  });
									  });
									</script>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
                                    <input type="text" id="popup_review_info_expired_date" name="popup_review_info_expired_date" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
                                    Ví dụ: 28/08/2014
                                    <script>
									  $(function() {
										  $('#popup_review_info_expired_date').datepicker({
										        dateFormat: "dd/mm/yy",
										        altFormat: "dd/mm/yy"
										  });
									  });
									</script>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thông tin thêm: </label>
									<textarea id="popup_review_info_merchantDesc" class="is_alphanumeric_allow_space" name="popup_review_info_merchantDesc" title="Nội dung" style="width: 200px;" placeholder="Thông tin thêm" maxlength="150"></textarea>
								</div>
								</div>
								
								<div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                                <!-- 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
								-->
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_approved" class="chck_filter chargingService" id="autoExtendedContract_approved"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <!-- 
                                <div class="contract_content"> 
                                    <input type="checkbox" title="Có bản cứng hợp đồng" value="hasHardCopy" name="hasHardCopy_approved" class="chck_filter chargingService" id="hasHardCopy_approved"/>
                                    Có bản cứng hợp đồng
                                    <span class="popup_hardcopy"></span>
                                </div>
                                 -->
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            
                            <div class="w_50">
                                <div style="display:none;">
                                <!-- CMND/ĐKKD -->
                                <div class="product_slc_filter filter_row">
									<fieldset class="identity_verify_popup">
										<legend>
											<strong>
												CMND/ĐKKD &nbsp; 
												<img class="popup_common_identity_verify" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/invalid.png"/>
												<span id="view_popup_review_info_verify_identity">
												[
													<input type="checkbox" title="Xác thực" value="popup_review_info_verify_identity" id="popup_review_info_verify_identity" name="popup_review_info_verify_identity" disabled="disabled"/>
                                    				Xác thực
												]
												</span>
											</strong>
										</legend>
										<script type="text/javascript">
										  $(document).ready(function(){
											    $("#popup_review_info_verify_identity").click(function () {
													if($('input:checkbox[name=popup_review_info_verify_identity]').is(':checked'))
													{
														var answer = confirm('Bạn chắc chắn muốn xác thực CMND/ĐKKD?');
														if (!answer)
														{
															return false;
														}
													}
											    });
										  });
										</script>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">CMND/ĐKKD<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_merchant_identity" name="popup_review_info_merchant_identity" class="dashboard_filter_2 is_numeric" id="popup_link" placeholder="CMND/Mã số thuế" value="" maxlength="12">
			                                </div> 
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact"> &nbsp; </label>
			                                	<a class="identity_image_popup_common_a" href="<%=request.getContextPath()%>/images/identity_no.jpg" class="top_up" toptions="overlayClose = 1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, effect=transform, shaded=1, ondisplay = open_win()">
													<img class="identity_image_popup_common" border="0" width="100" height="50" src="<%=request.getContextPath()%>/images/identity_no.jpg"/>
												</a>
			                                </div>
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Nơi cấp/Địa chỉ<span class="required_red">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_place_of_issue" name="popup_review_info_place_of_issue" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Nơi cấp" value="" maxlength="50">
			                                </div> 
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact">Ngày cấp<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_date_of_issue" name="popup_review_info_date_of_issue" class="dashboard_filter_2 is_date" placeholder="dd/mm/yyyy" value="" maxlength="10" style="width:70px;">
			                                    Ví dụ: 20/08/2010
			                                    <script>
			                                    $(function() {
													  $('#popup_review_info_date_of_issue').datepicker({
													        dateFormat: "dd/mm/yy",
													        altFormat: "dd/mm/yy"
													  });
												});
			                                    </script>
			                                </div>
										</div>
									</fieldset>
								</div>
								<!-- CMND/ĐKKD -->
								
                                <div class="product_slc_filter filter_row">
									<fieldset class="billing_info_popup">
										<legend>
											<strong>Thông tin thanh toán &nbsp; <img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/></strong>
										</legend>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Chủ tài khoản<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_account_holder" name="popup_review_info_account_holder" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Chủ tài khoản" value="" maxlength="100">
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Số tài khoản<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_account_number" name="popup_review_info_account_number" class="dashboard_filter_2 is_alphanumeric" id="popup_link" placeholder="Số tài khoản" value="" maxlength="100">
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên ngân hàng<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                	<select id="popup_review_info_bank_name" name="popup_review_info_bank_name"class="dashboard_filter_2">
													<option value='' label='--- Chọn ngân hàng ---'/>
													<c:forEach var="bank" items="${model.banks}">
														<option value="${bank.code}">
															<c:out value="${bank.name}"/>
														</option>
													</c:forEach>
												</select>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tại tỉnh/thành phố<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                	<select id="popup_review_info_city_bank" name="popup_review_info_city_bank"class="dashboard_filter_2">
													<option value='' label='--- Chọn tỉnh/thành phố ---'/> 
													<c:forEach var="province" items="${model.provinces}">
														<option value="${province.code}">
															<c:out value="${province.name}"/>
														</option>
													</c:forEach>
												</select>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên chi nhánh<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
			                                    <input type="text" id="popup_review_info_branch_bank" name="popup_review_info_branch_bank" class="dashboard_filter_2 is_alphanumeric_name" id="popup_link" placeholder="Tên chi nhánh" value="" maxlength="100">
			                                </div> 
										</div>
									</fieldset>
								</div>
								</div>
								<!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
                        	<label>(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title" style="display:none;">
                        	<label class="label_popup_profile">Mô tả:</label>
                        	<span class="go_sms_product_name popup_reject_log" id="popup_reject_log"></span>
                        </div>
                        <div class="product_title" style="display:none;">
							<label class="label_popup_profile">Loại tỷ lệ:</label>
							<span class="go_sms_product_name popup_rate_type" id="popup_rate_type" style="color:red;"></span>
						</div>
						
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/lý do hủy bỏ: </label>
                        	<textarea id="popup_des_approve_contract" class="is_alphanumeric_allow_space" name="popup_des_approve_contract" title="Nội dung" style="width: 350px; height:20px;" placeholder="Mô tả/lý do hủy bỏ"  rows="2" maxlength="150"></textarea>
                        </div>
                        <!-- 
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
                         -->
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" title="Đã xem kỹ tỷ lệ" value="confirm_rate_checked" name="confirm_rate_checked" class="chck_filter" id="confirm_rate_checked"/>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	Đã xem kỹ thông tin hợp đồng 
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	<input type="hidden" class="value_submit_merchant" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Phê duyệt" class="btn_greensmall" />
								<input type="submit" name="reject" value="Từ chối" class="btn_merchant_profile_preview" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
	                        </label>
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=merchant_confirm_post] input[type=submit]').live('click', function() {
									$('form[name=merchant_confirm_post] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_merchant').val();
									if(submit2=='reject'){
										var popup_des = $('#popup_des_approve_contract').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy duyệt hợp đồng');
					    					return false;
					    				}
										
										var answer = confirm('Bạn chắc chắn muốn hủy duyệt HĐ này không?');
										if (!answer)
										{
											return false;
										}
									}
									
									if(submit2=='approve'){
										var validate_merchant_profile = $('#validate_merchant_profile').val();
										if(validate_merchant_profile=='1')
										{
											var popup_review_info_merchant_name = $('#popup_review_info_merchant_name').val();
											if(popup_review_info_merchant_name.length==0) {
						    					alert('Xin hãy nhập tên đối tác');
						    					return false;
						    				}
											/*
											var popup_review_info_merchant_email = $('#popup_review_info_merchant_email').val();
											if(popup_review_info_merchant_email.length==0) {
						    					alert('Xin hãy nhập email đối tác');
						    					return false;
						    				}else{
						    					if (!validateEmail(popup_review_info_merchant_email)) {
										            alert('Email sai định dạng');
										            return false;
										        }
						    				}
											*/
											var popup_review_info_merchant_phone = $('#popup_review_info_merchant_phone').val();
											if(popup_review_info_merchant_phone.length==0) {
						    					alert('Xin hãy nhập điện thoại đối tác');
						    					return false;
						    				}else{
						    					if(popup_review_info_merchant_phone.length<10) {
							    					alert('Số điện thoại yêu cầu >=10 số.');
							    					return false;
							    				}
						    					if (!validatePhone(popup_review_info_merchant_phone)) {
										            alert('Số điện thoại sai định dạng');
										            return false;
										        }
						    				}
											//Số hợp đồng
											var popup_review_info_contract_no = $('#popup_review_info_contract_no').val();
											if(popup_review_info_contract_no.length==0) {
						    					alert('Xin hãy nhập Số hợp đồng');
						    					return false;
						    				}
											
											//Ngày ký hợp đồng
											var popup_review_info_contract_date = $('#popup_review_info_contract_date').val();
											if(popup_review_info_contract_date.length==0) {
						    					alert('Xin hãy nhập ngày ký hợp đồng');
						    					return false;
						    				}
											
											//Ngày hết hạn
											var popup_review_info_expired_date = $('#popup_review_info_expired_date').val();
											if(popup_review_info_expired_date.length==0) {
						    					alert('Xin hãy nhập Ngày hết hạn');
						    					return false;
						    				}
											
											//CMND-ĐKKD
											var popup_review_info_merchant_identity = $('#popup_review_info_merchant_identity').val();
											if(popup_review_info_merchant_identity.length==0) {
						    					alert('Xin hãy nhập CMND/ĐKKD');
						    					return false;
						    				}else{
						    					if(popup_review_info_merchant_identity.length<8) {
							    					alert('CMND/ĐKKD yêu cầu >=8 chữ số.');
							    					return false;
							    				}
						    					if (!validateCMND(popup_review_info_merchant_identity)) {
										            alert('CMND/ĐKKD sai định dạng.');
										            return false;
										        }
						    				}
											var popup_review_info_place_of_issue = $('#popup_review_info_place_of_issue').val();
											if(popup_review_info_place_of_issue.length==0) {
						    					alert('Xin hãy nhập nơi cấp CMND/địa chỉ ĐKKD');
						    					return false;
						    				}
											var popup_review_info_date_of_issue = $('#popup_review_info_date_of_issue').val();
											if(popup_review_info_date_of_issue.length==0) {
						    					alert('Xin hãy nhập ngày cấp CMND/ĐKKD');
						    					return false;
						    				}
											/*
											if(!$('#popup_review_info_verify_identity').prop('checked')) {
						    					alert('CMND/ĐKKD cần xác thực trước khi duyệt thông tin HĐ');
						    					return false;
						    				}
											*/
											
											//Thông tin thanh toán
											var popup_account_holder = $('#popup_review_info_account_holder').val();
											if(popup_account_holder.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Chủ tài khoản');
						    					return false;
						    				}
											var popup_account_number = $('#popup_review_info_account_number').val();
											if(popup_account_number.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Số tài khoản');
						    					return false;
						    				}
						    				var popup_branch_bank = $('#popup_review_info_branch_bank').val();
											if(popup_branch_bank.length==0) {
						    					alert('Xin hãy nhập Thông tin thanh toán: Chi nhánh');
						    					return false;
						    				}
										}
										
										//Xem kỹ HĐ
										var isChecked = $('#confirm_rate_checked').is(':checked');
										if(!isChecked){
											alert('Xin hãy kiểm tra kỹ thông tin HĐ trước khi duyệt');
					    					return false;
										}
										
										var answer = confirm('Bạn chắc chắn muốn duyệt HĐ này không?');
										if (!answer)
										{
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
									var mess = 'Duyệt thông tin hợp đồng thất bại';
									if(x == 3) {
										mess = 'Hủy duyệt thông tin hợp đồng thành công';
									} else if(x == 4) {
										mess = 'Duyệt thông tin hợp đồng thành công';
									}
									alert(mess);
									
									var paramters = '';
									var url = document.URL;
									var parameter_callback = $("#url_callback").val();
									if(url.indexOf("?")<=0){
										paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
									}
									
									//indexOf
									var m = url.indexOf("#row");
									if(m>0)url=url.substring(0,m);
									
									var n = url.indexOf("&rand=");
									if(n>0)url=url.substring(0,n);
									
									var milliseconds = new Date().getTime();
									var popup_pid = $("#popup_pid").val();
									paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
									if(paramters.length>1)url=url+paramters;
									$(location).attr('href',url);
									return false;
								} else {
									alert('Unsuccessful activation');
								}
							} else {
								alert(showError(json));
							}
						}, 'text');
					return false;
				});
		});
	</script>
</div>
<!-- /(2)Duyệt thông tin HĐ -->
	
<!-- (3)Đề xuất tỷ lệ -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_payment_provider" class="popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="offical_post">
		<input type="hidden" name="a" value="manager_profile_rate_submit" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Đề xuất tỷ lệ chia sẻ</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                         -->
                         <p class="title-box title_box_margin">Đề xuất tỷ lệ chia sẻ</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name" id="popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email" id="popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone" id="popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no" id="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type" id="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy" id="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date" id="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_" id="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
                    	<div class="product_title">
                        	<label class="label_popup_profile">Trạng thái:</label>
                        	<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
                        	<label>(Profile tham chiếu: </label>
                        	<span class="popup_profile_reference"></span>)
                        </div>
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/lý do hủy: </label>
                        	<textarea id="popup_des_offical" class="is_alphanumeric_allow_space" name="popup_des_offical" title="Nội dung" style="width: 350px; height:20px;" placeholder="Mô tả"  rows="2" maxlength="150"></textarea>
                        </div>
                        
						<div class="product_title">
							<label class="label_popup_profile">Thời gian đề nghị<span style="color: #FF0000; font-weight: normal">(*)</span>: </label>
							<input type="text" id="popup_proposed_date" name="popup_proposed_date" value="" placeholder="dd/mm/yyyy" class="txt_reglog is_date" maxlength="10" style="width: 100px; " />
							
							(Ví dụ: 28/08/2014)
							<script>
							  $(function() {
								  $('#popup_proposed_date').datepicker({
								        dateFormat: "dd/mm/yy",
								        altFormat: "dd/mm/yy"
								  });
							  });
							</script>
							&nbsp;&nbsp;Giờ: 
							<select name="popup_proposed_time" id="popup_proposed_time">
								<%
									for(int hour=0;hour<24;hour++){
										String strHour = (hour<10?"0":"")+hour;
								%>
								<option value="<%=strHour%>" ><%=hour%></option>
								<%}%>
							</select>
							&nbsp;&nbsp;Phút: 
							<select name="popup_proposed_time_minute" id="popup_proposed_time_minute">
								<%
									for(int minute=0; minute<60; minute++){
										String strMinute = (minute<10?"0":"")+minute;
								%>
								<option value="<%=strMinute%>" ><%=minute%></option>
								<%}%>
							</select>
						</div>
						
						<div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                         	<input type="checkbox" ${fn:contains(allContractType, 'rate_checked')?'checked="checked"':'' } title="Đã xem kỹ tỷ lệ" value="rate_checked" name="checkRates_" class="chck_filter chargingService" id="checkRates_"/>
								Đã xem kỹ tỷ lệ đề xuất <span class="popup_detail_profile" style="color:red"></span>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                         	<input type="hidden" class="value_submit_edit_rates" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Đề nghị" class="btn_greensmall" />
								<input type="submit" name="reject" value="Từ chối" class="btn_merchant_profile_preview" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=offical_post] input[type=submit]').live('click', function() {
									$('form[name=offical_post] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_edit_rates').val();
									if($(this).attr('name')=='reject'){
										var popup_des = $('#popup_des_offical').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy đề xuất tỷ lệ');
					    					return false;
					    				}
										
										var answer = confirm('Bạn chắc chắn muốn hủy đề xuất tỷ lệ?');
										if (!answer)
										{
											return false;
										}
									}
									if($(this).attr('name')=='approve'){
										var popup_effective_date = $('#popup_proposed_date').val();
										if(popup_effective_date==null || popup_effective_date==''||popup_effective_date.length==0) {
					    					alert('Xin hãy nhập Thời gian đề nghị của profile');
					    					return false;
					    				}
										
										var isChecked = $('#checkRates_').is(':checked');
										if(!isChecked){
											alert('Xin hãy kiểm tra kỹ tỷ lệ trước khi đề xuất duyệt');
					    					return false;
										}
										
										var answer = confirm('Bạn chắc chắn muốn đề xuất tỷ lệ cho HĐ này?');
										if (!answer)
										{
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
												var mess = '';
												if(x == 5) {
													mess = 'Hủy đề xuất tỷ thành công';
												} else if(x == 6) {
													mess = 'Đề xuất tỷ lệ thành công';
												}
												alert(mess);
												
												var paramters = '';
												var url = document.URL;
												var parameter_callback = $("#url_callback").val();
												if(url.indexOf("?")<=0){
													paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
												}
												
												//indexOf
												var m = url.indexOf("#row");
												if(m>0)url=url.substring(0,m);
									
												var n = url.indexOf("&rand=");
												if(n>0)url=url.substring(0,n);
												var milliseconds = new Date().getTime();
												var popup_pid = $("#popup_pid").val();
												paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
												if(paramters.length>1)url=url+paramters;
												$(location).attr('href',url);
												return false;
											} else {
												alert('Unsuccessful activation');
											}
										} else {
											alert(showError(json));
										}
									}, 'text');
								return false;
							});
					});
				</script>
</div>
<!-- (3)Đề xuất tỷ lệ -->
	
<!-- (5)Duyệt profiles -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="confirm_payment_1pay" class="popup_mc_info_contract">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="billing_post">
		<input type="hidden" name="a" value="operator_profile_rate_submit" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
                    <div class="pop_box">
                    	<!-- 
                        <div class="contract_content"> 
                        <h1 class="srv_title">Duyệt thông tin profile</h1>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                         -->
                         <p class="title-box title_box_margin">Duyệt thông tin profile</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name" id="popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email" id="popup_merchant_email"></span>
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone" id="popup_merchant_phone"></span>
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no" id="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type" id="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy" id="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date" id="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_" id="popup_contract_expired_date_"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact"> &nbsp; </label>
                                	<span>
                                    <input type="checkbox" title="Tự động gia hạn hợp đồng" value="autoExtendedContract" name="autoExtendedContract_common" class="chck_filter autoExtendedContract_common" id="autoExtendedContract_common"/>
                                    Tự động gia hạn hợp đồng
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                    <span class="popup_hardcopy"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                    <div style="display: inline-block;width:250px;">
	                                    <span class="popup_hasHardCardCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardSmsCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardWapCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardIacCopy" style="display: inline-block;margin-right: 10px;"></span>
	                                    <span class="popup_hasHardBankCopy" style="display: inline-block;"></span>
                                    </div>
                                    <div class="clear"></div>
                                </div>
								<!-- 
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Trạng thái:</label>
									<span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
								</div>
								-->
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version: </label>
									<span class="go_sms_product_name popup_profile_version"></span>
								</div>
								<div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone: </label>
									<span class="go_sms_product_name popup_profile_clone_reason"></span>
								</div>
                            </div>
                            
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <jsp:include page="include_merchant_profile_identity.jsp" />
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                <jsp:include page="include_merchant_profile_billing_info.jsp" /> 
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:670px">
						<div class="product_title">
		                    <label class="label_popup_profile">Trạng thái:</label>
		                    <span class="go_sms_product_name popup_status_view" id="popup_status_view"></span>
		                    <label style="padding-left: 10px;">(Profile tham chiếu: </label>
		                    <span class="popup_profile_reference"></span>)
		                </div>
                        <div class="product_title">
                        	<label class="label_popup_profile">Mô tả/lý do hủy bỏ: </label>
                        	<textarea id="popup_des_billing" name="popup_des_billing" title="Nội dung" style="width: 350px; height:20px;" placeholder="Mô tả/lý do hủy bỏ"  rows="2" maxlength="150"></textarea>
                        </div>
                        <div class="product_title">
		                     <label class="label_popup_profile">Thời gian đề nghị:</label>
		                     <span class="go_sms_product_name popup_proposed_effective_date">fdf</span>
		                </div>
                        <div class="product_title">
							<label class="label_popup_profile">Ngày hiệu lực: </label>
							<input type="text" id="popup_effective_date_submit" name="popup_effective_date_submit" value="" placeholder="dd/mm/yyyy" class="txt_reglog is_date" style="width: 100px;" maxlength="10"/>
							
							(Ví dụ: 28/08/2014)
							<script>
							  $(function() {
								  $('#popup_effective_date_submit').datepicker({
								        dateFormat: "dd/mm/yy",
								        altFormat: "dd/mm/yy",
								        minDate: '0'
								  });
							  });
							</script>
							&nbsp;&nbsp;Giờ: 
							<select name="popup_effective_time_submit" id="popup_effective_time_submit">
								<%
									for(int hour=0;hour<24;hour++){
										String strHour = (hour<10?"0":"")+hour;
								%>
								<option value="<%=strHour%>" ><%=hour%></option>
								<%}%>
							</select>
							&nbsp;&nbsp;Phút: 
							<select name="popup_effective_time_minute_submit" id="popup_effective_time_minute_submit">
								<%
									for(int minute=0; minute<60; minute++){
										String strMinute = (minute<10?"0":"")+minute;
								%>
								<option value="<%=strMinute%>" ><%=minute%></option>
								<%}%>
							</select>
						</div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <input type="checkbox" title="Đã xem kỹ tỷ lệ" value="confirm_contract_rate_checked" name="confirm_contract_rate_checked" class="chck_filter confirm_contract_rate_checked" id="confirm_contract_rate_checked"/>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	Đã xem kỹ tỷ lệ chia sẻ 
	                         	<span class="popup_link_detail" id="popup_link_detail"></span>
	                        </label>
                        </div>
                        
                        <div class="product_title">
	                        <label class="label_popup_profile"> &nbsp; </label>
	                        <label class="lbl_rempass" for="chck_rempass">
	                         	<input type="hidden" class="value_submit_approve_rates" name="submit2" value="approve" />
								<input type="submit" name="approve" value="Phê duyệt" class="btn_greensmall" />
								<input type="submit" name="reject" value="Từ chối" class="btn_merchant_profile_preview" />
								<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset">
	                        </label>
                        </div>
                        
						<script type="text/javascript">
							$(document).ready(function() {
								$('form[name=billing_post] input[type=submit]').live('click', function() {
									$('form[name=billing_post] input[name=submit2]').val($(this).attr('name'));
									var submit2 = $('.value_submit_approve_rates').val();
									if(submit2=='reject'){
										var popup_des = $('#popup_des_billing').val();
										if(popup_des.length==0) {
					    					alert('Xin hãy nhập lý do hủy duyệt profile');
					    					return false;
					    				}
										
										var answer = confirm('Bạn chắc chắn muốn hủy duyệt profile của merchant này?');
										if (!answer)
										{
											return false;
										}
									}
									
									if(submit2=='approve'){
										//Xem kỹ HĐ
										var isChecked = $('#confirm_contract_rate_checked').is(':checked');
										if(!isChecked){
											alert('Xin hãy kiểm tra kỹ tỷ lệ chia sẻ trước khi duyệt');
					    					return false;
										}
										
										var answer = confirm('Bạn chắc chắn muốn duyệt profile cho merchant này?');
										if (!answer)
										{
											return false;
										}
									}
								});
								
							});
						</script>
                    </div>
                    </div>
                </form>
                
                <script type="text/javascript">
					$(document).ready(function() {
						$('form[name=billing_post]').submit(function() {
								$.post($(this).attr('action'), $(this).serialize(), function(json) {
										if (!isNaN(json)) {
											var x = parseInt(json);
											if (x > 0) {
												var mess = '';
												var pid = $('form[name=billing_post] input[name=pid]').val();
												if(x == 9) {
													mess = 'Hủy duyệt profile thành công';
												} else if(x == 10) {
													mess = 'Duyệt profile thành công';
												}
												alert(mess);
												
												var paramters = '';
												var url = document.URL;
												var parameter_callback = $("#url_callback").val();
												if(url.indexOf("?")<=0){
													paramters="?"+decodeURIComponent((parameter_callback+'').replace(/\+/g, '%20'));
												}
												
												//indexOf
												var m = url.indexOf("#row");
												if(m>0)url=url.substring(0,m);
									
												var n = url.indexOf("&rand=");
												if(n>0)url=url.substring(0,n);
												var milliseconds = new Date().getTime();
												var popup_pid = $("#popup_pid").val();
												paramters=paramters+'&rand='+milliseconds+'#row'+popup_pid;
												if(paramters.length>1)url=url+paramters;
												$(location).attr('href',url);
												return false;
											} else {
												alert('Unsuccessful activation');
											}
										} else {
											alert(showError(json));
										}
									}, 'text');
								return false;
							});
					});
				</script>
</div>
<!-- /(5)Duyệt profiles -->

	<!-- Action popup -->
	<script type="text/javascript">
		function open_win()
		{
			$('.popup_mc_info_contract').css('z-index', '500');
		}
		
		function resetContentPopup()
		{
			$(".status_verify_email").attr("src","<%=request.getContextPath()%>/images/invalid.png");
			$(".status_verify_email").attr("title",'Chưa xác thực');
			$('#popup_merchant_email').prop('readonly', false);
			$("#verified_email_account").html("");
			$('#popup_review_info_merchant_email').prop('readonly', false);
			$("#popup_review_info_verified_email").html("");
			
			$(".status_verify_phone").attr("src","<%=request.getContextPath()%>/images/invalid.png");
			$(".status_verify_phone").attr("title",'Chưa xác thực');
			$('#popup_merchant_phone').prop('readonly', false);
			$("#verified_phone_account").html("");
			$('#popup_review_info_merchant_phone').prop('readonly', false);
			$("#popup_review_info_verified_phone").html("");
			
			$(".popup_reject_log").html("");
			
			$(".identity_image_popup_common").attr("src","<%=request.getContextPath()%>/images/identity_no.jpg");
			$(".identity_image_popup_common_a").attr("href","<%=request.getContextPath()%>/images/identity_no.jpg");
			
			$("#popup_merchant_identity").val("");
			$(".popup_merchant_identity").html("");
			
			$("#popup_contract_expired_date").val("");
			$(".popup_contract_expired_date_").html("");
			
			//Thông tin thanh toán
			$(".popup_billing_info_billing_type").html('<i style="color:red;">Chưa có</i>');
			$(".popup_billing_info_account_holder").html('<i style="color:red;">Chưa có</i>');
			$(".popup_billing_info_account_number").html('<i style="color:red;">Chưa có</i>');
			$(".popup_billing_info_bank_name").html('<i style="color:red;">Chưa có</i>');
			$(".popup_billing_info_city_bank").html('<i style="color:red;">Chưa có</i>');
			$(".popup_billing_info_branch_bank").html('<i style="color:red;">Chưa có</i>');
			$(".billing_info_image_popup_common").attr("src","<%=request.getContextPath()%>/images/invalid.png");
			$(".billing_info_image_popup_common").attr("title",'Chưa xác thực thông tin thanh toán');
			
			$('#popup_account_number').prop('readonly', false);
			$('#popup_account_holder').prop('readonly', false);
			$('#popup_branch_bank').prop('readonly', false);
			$('select#popup_bank_name option:not(:selected)').attr('disabled', false);
			$('select#popup_city_bank option:not(:selected)').attr('disabled', false);
			
			$('#popup_review_info_account_number').prop('readonly', false);
			$('#popup_review_info_account_holder').prop('readonly', false);
			$('#popup_review_info_branch_bank').prop('readonly', false);
			$('select#popup_review_info_bank_name option:not(:selected)').attr('disabled', false);
			$('select#popup_review_info_city_bank option:not(:selected)').attr('disabled', false);
			//Thông tin thanh toán
			
			//CMND
			$(".popup_common_identity_verify").attr("src","<%=request.getContextPath()%>/images/invalid.png");
			$(".popup_common_identity_verify").attr("title",'Chưa xác thực CMND/ĐKKD');
			
			$(".popup_common_identity__identity").html('<i style="color:red;">Chưa có</i>');
			$(".popup_common_identity_place_of_issue").html('<i style="color:red;">Chưa có</i>');
			$(".popup_common_identity_date_of_issue").html('<i style="color:red;">Chưa có</i>');
			
			$('#popup_review_info_merchant_identity').prop('readonly', false);
			$('#popup_review_info_place_of_issue').prop('readonly', false);
			$('#popup_review_info_date_of_issue').prop('readonly', false);
			$('#popup_review_info_verify_identity').prop('readonly', false);
			$('#popup_review_info_verify_identity').prop('checked', false);
			
			$('#popup_merchant_identity').prop('readonly', false);
			$('#popup_place_of_issue').prop('readonly', false);
			$('#popup_date_of_issue').prop('readonly', false);
			$(".popup_hardcopy").html('');
			
			//reset identity image
			$(".identity_image_popup_common").attr("src","<%=request.getContextPath()%>/images/identity_no.jpg");
			$(".identity_image_popup_common_a").attr("href","<%=request.getContextPath()%>/images/identity_no.jpg");
			$(".popup_common_identity_image").attr("src","<%=request.getContextPath()%>/images/identity_no.jpg");
			$(".popup_common_identity_image_a").attr("href","<%=request.getContextPath()%>/images/identity_no.jpg");
			
			$('#autoExtendedContract_support').prop('disabled', true);
			$('#hasHardCopy_support').prop('disabled', true);
			$('#autoExtendedContract_approved').prop('disabled', true);
			$('#hasHardCopy_approved').prop('disabled', true);
			$('#autoExtendedContract_common').prop('disabled', true);
			$('.autoExtendedContract_common').prop('disabled', true);
			
			if($('#is_merchant_hidden').val()=='1'){
				var verify_email='<a href="<%=request.getContextPath()%>/protected/verify_email.html" target="_blank" class="link_feature" title="Xac thuc email" style="color: #0066cc">'
					+'<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>'
					+'[Xác thực]</a>';
				$('.button_veriry_email').html(verify_email);
				
				var verify_email='<a href="'+'<%=request.getContextPath()%>/protected/verify_phone.html'+'" target="_blank" class="link_feature" title="Xac thuc so dien thoai" style="color: #0066cc">'
    			+'<img class="status_verify_phone" border="0" width="16" height="16" src="'+'<%=request.getContextPath()%>/images/invalid.png'+'"  title="Chưa xác thực"/>'
    			+'[Xác thực]</a>';
				$('.button_veriry_phone').html(verify_email);
				
				var veriry_billing_infomation='<a href="'+'<%=request.getContextPath()%>/protected/billing_info_verify.html'+'" target="_blank" class="link_feature" title="Xác thực thông tin thanh toán" style="color: #0066cc">'
				+'<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/>'
				+'[Xác thực]</a>';
				$('.button_veriry_billing_infomation').html(veriry_billing_infomation);
			}else{
				var verify_email='<a href="" class="link_feature" title="Xac thuc email" style="color: #0066cc">'
					+'<img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>'
					+'</a>';
				$('.button_veriry_email').html(verify_email);
				
				var verify_email='<a href="'+''+'" class="link_feature" title="Xac thuc so dien thoai" style="color: #0066cc">'
    			+'<img class="status_verify_phone" border="0" width="16" height="16" src="'+'<%=request.getContextPath()%>/images/invalid.png'+'"  title="Chưa xác thực"/>'
    			+'</a>';
				$('.button_veriry_phone').html(verify_email);
				
				var veriry_billing_infomation='<a href="'+''+'" class="link_feature" title="Xác thực thông tin thanh toán" style="color: #0066cc">'
				+'<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/>'
				+'</a>';
				$('.button_veriry_billing_infomation').html(veriry_billing_infomation);
			}
		}
		
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
		
		function validateCMND(sCMND) {
			var cmndRegExp = /^((\+)?[1-9]{1,2})?([-\s\.])?((\(\d{1,4}\))|\d{1,4})(([-\s\.])?[0-9]{1,12}){1,2}$/;
		    if (cmndRegExp.test(sCMND)) {
		        return true;
		    }
		    else {
		        return false;
		    }
		}
		
		function showError(json){
			if(json==null||json=='') return json;
			var m = json.indexOf("0");
			if(m==0 && json.length>1)json=json.substring(1,json.length-1);
			return json;
		}
		
		function getStatusDescription(active) {
			var status_view = '';
			switch(active)
			{
				case '0':
					status_view = 'Đề xuất profile';
				  	break;
				case '1':
					status_view = 'Hủy cập nhật thông tin HĐ';
				  	break;
				case '2':
					status_view = 'Đã cập nhật thông tin HĐ';
				  	break;
				case '3':
					status_view = 'Hủy duyệt thông tin HĐ';
				  	break;
				case '4':
					status_view = 'Đã duyệt thông tin HĐ';
				  	break;
				case '5':
					status_view = 'Hủy đề xuất tỷ lệ';
				  	break;
				case '6':
					status_view = 'Đã đề xuất tỷ lệ';
				  	break;
				case '7':
					status_view = 'Merchant hủy xác nhận profile';
				  	break;
				case '8':
					status_view = 'Merchant đã xác nhận profile';
				  	break;
				case '9':
					status_view = 'Hủy duyệt đề xuất profile';
				  	break;
				case '10':
					status_view = 'Đã duyệt profile';
				  	break;
				default:
					status_view = 'Chưa xác định';
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
												
												//(1)Cập nhật thông tin HĐ
												$('.duyetsobo').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													var merchant_phone_account = $("#hd_merchant_phone_account-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													var status_view = getStatusDescription(active);
													
													//popup info
													//$(".popup_merchant").html(merchant +" (version 1."+$('#hd_version-'+pid, data).val()+")");
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!=''){
														$(".popup_merchant_name").html(merchant_name);
													}
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i>chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													
													var rate_type = $("#hd_using_default-"+pid, data).val();
													if(rate_type=='true')$(".popup_rate_type").html("Sử dụng tỷ lệ mặc định");
													else $(".popup_rate_type").html("Sử dụng tỷ lệ riêng");
													
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													
													var isSupportProfile = $("#isSupportProfile").val();
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!=''){
														$("#popup_contract_expired_date").val(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;'  target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract=='true')
													{
														$("#autoExtendedContract_support").attr("checked", true);
														$(".autoExtendedContract_common").attr("checked", true);
													}
													else
													{
														$("#autoExtendedContract_support").attr("checked", false);
														$(".autoExtendedContract_common").attr("checked", false);
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$("#hasHardCopy_support").attr("checked", true);
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$("#hasHardCopy_support").attr("checked", false);
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//ContractManager chỉ hiển thị thông tin chung & không có acion
													var formContractManager = $("#formContractManager").val();
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$("#popup_paymentInfo").val(paymentInfo);
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
														//$('#popup_merchant_email').prop('readonly', true);
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													//phone==null -> Cho phép sửa
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)
													{
														$('#popup_merchant_phone').val(merchant_phone);
													}
													$('#popup_merchant_phone').prop('readonly', true);
													if(merchant_phone_account==null || merchant_phone_account=='')
														$('#popup_merchant_phone').prop('readonly', false);
													
													var popup_reject_log = $('#hd_rejectLog-'+pid, data).val();
													$(".popup_reject_log").html(popup_reject_log);
													
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
												    
													billing_type=$("#hd_billing_type-"+pid, data).val();
										        	account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													$("#popup_account_number").val(account_number);
													$("#popup_account_holder").val(account_holder);
													$("#popup_branch_bank").val(branch_bank);
													$("select#popup_bank_name").val(code_bank_name);
													$("select#popup_city_bank").val(code_city_bank);
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_account_number').prop('readonly', true);
														$('#popup_account_holder').prop('readonly', true);
														$('#popup_branch_bank').prop('readonly', true);
														//$('select#popup_bank_name').prop('readonly', true);
														//$('select#popup_city_bank').prop('readonly', true);
														
														$('select#popup_bank_name option:not(:selected)').attr('disabled', true);
														$('select#popup_city_bank option:not(:selected)').attr('disabled', true);
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}
													
													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													$(data).remove();
													
													if(active == '0') {
														if(isSupportProfile=='true' && formContractManager!='true'){
															$("#popup_contract_date").val(contract_date);
															$("#popup_merchant_name").val(merchant_name);
															$("#popup_merchantDesc").val(merchant_desc);
															$("#popup_merchant_email").val(merchant_email);
															$("#popup_merchant_phone").val(merchant_phone);
															
															$("#popup_contract_no").val(contract_no);
															$("select#popup_payment_policy").val(paymentPolicy);
															$("select#popup_contract_type").val(contract_type);
															
															$(".preliminary_approval[id="+pid+"]").trigger("click");
														}
														else $(".common_contract_infomations_popup").trigger("click");
													}
													else
													{
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(1)Cập nhật thông tin HĐ
												
												//(2)Duyệt thông tin HĐ
												$('.merchantxacnhan').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													var merchant_phone_account = $("#hd_merchant_phone_account-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													var status_view = getStatusDescription(active);
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													
													var rate_type = $("#hd_using_default-"+pid, data).val();
													if(rate_type=='true')$(".popup_rate_type").html("Sử dụng tỷ lệ mặc định");
													else $(".popup_rate_type").html("Sử dụng tỷ lệ riêng");
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_review_info_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$("#popup_review_info_expired_date").val(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;' target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													//Tự động gia hạn HĐ
													var autoExtendedContract = $("#hd_autoExtendedContract-"+pid, data).val();
													if(autoExtendedContract=='true'){
														$("#autoExtendedContract_approved").attr("checked", true);
														$(".autoExtendedContract_common").attr("checked", true);
													}
													else{
														$("#autoExtendedContract_approved").attr("checked", false);
														$(".autoExtendedContract_common").attr("checked", false);
													}
													//popup info
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$("#popup_review_info_paymentInfo").val(paymentInfo);
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$("#hasHardCopy_approved").attr("checked", true);
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$("#hasHardCopy_approved").attr("checked", false);
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Verify email Status
													//var hd_verified_email = $("#hd_verified_email-"+pid, data).val();
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
														//$('#popup_review_info_merchant_email').prop('readonly', true);
													}
													
													//Verify phone Status
													//var hd_verified_phone = $("#hd_verified_phone-"+pid, data).val();
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													//phone==null -> Cho phép sửa
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)
													{
														$('#popup_review_info_verified_phone').val(merchant_phone);
													}
													$('#popup_review_info_merchant_phone').prop('readonly', true);
													if(merchant_phone_account==null || merchant_phone_account=='')
														$('#popup_review_info_merchant_phone').prop('readonly', false);
													
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
												    
													billing_type=$("#hd_billing_type-"+pid, data).val();
													account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup values
													$("#popup_review_info_account_number").val(account_number);
													$("#popup_review_info_account_holder").val(account_holder);
													$("#popup_review_info_branch_bank").val(branch_bank);
													$("select#popup_review_info_bank_name").val(code_bank_name);
													$("select#popup_review_info_city_bank").val(code_city_bank);
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_review_info_account_number').prop('readonly', true);
														$('#popup_review_info_account_holder').prop('readonly', true);
														$('#popup_review_info_branch_bank').prop('readonly', true);
														$('select#popup_review_info_bank_name option:not(:selected)').attr('disabled', true);
														$('select#popup_review_info_city_bank option:not(:selected)').attr('disabled', true);
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													
													//popup values
													$("#popup_review_info_merchant_identity").val(identity);
													$("#popup_review_info_place_of_issue").val(placeOfIssue);
													$("#popup_review_info_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													$('#popup_review_info_verify_identity').prop('disabled', true);
													$('#popup_review_info_verify_identity').prop('checked', false);
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_review_info_merchant_identity').prop('readonly', true);
														$('#popup_review_info_place_of_issue').prop('readonly', true);
														$('#popup_review_info_date_of_issue').prop('readonly', true);
														$('#popup_review_info_verify_identity').prop('checked', true);
													}else{
														//Điều kiện xác thực identity: có đủ các thông tin về identity
														var isVerifyIdentity = $("#isVerifyIdentity").val();
														if(isVerifyIdentity=='true' && identity.length!=0 && identityImage.length!=0 && placeOfIssue.length!=0 && dateOfIssue.length!=0){
															$('#popup_review_info_verify_identity').prop('disabled', false);
															$('#popup_review_info_verify_identity').prop('checked', false);
														}
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													var isReviewProfileInfo = $("#isReviewProfileInfo").val();
													$(data).remove();
													
													if(active == '2') {
														if(isReviewProfileInfo=='true') {
															$("#popup_review_info_contract_date").val(contract_date);
															$("#popup_review_info_merchant_name").val(merchant_name);
															$("#popup_review_info_merchantDesc").val(merchant_desc);
															$("#popup_review_info_merchant_email").val(merchant_email);
															$("#popup_review_info_merchant_phone").val(merchant_phone);
															
															$("#popup_review_info_contract_no").val(contract_no);
															$("select#popup_review_info_payment_policy").val(paymentPolicy);
															$("select#popup_review_info_contract_type").val(contract_type);
															$(".merchant_approval[id="+pid+"]").trigger("click");
														} else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(2)Duyệt thông tin HĐ
												
												//(3)Đề xuất tỷ lệ
												$('.duyetchinhthuc').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													$(".popup_detail_profile").html('<a class="slc_link" href="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+pid+'" style="color:red" target="_blank">Chi tiết hợp đồng & tỷ lệ </a>');
													
													var status_view = getStatusDescription(active);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var rate_type = $("#hd_using_default-"+pid, data).val();
													if(rate_type=='true')$(".popup_rate_type").html("Sử dụng tỷ lệ mặc định");
													else $(".popup_rate_type").html("Sử dụng tỷ lệ riêng");
													//popup info
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													//Thời gian đề nghị
													//Call ajax
													var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
													$.ajax({
												        type: "GET",
												        cache: false,
												        url: url_api,
												        //data: 'a=effective_date&merchant=' + merchant+'&id='+pid,
												        data: 'a=effective_date&merchant=' + merchant,
												        processData: false,
												        dataType: "json",
												        success: function(data) {
												            dataresponse = data;                    
												        },
												        timeout:900000,
												        complete: function(){  
												        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
												        	{
												        		alert(dataresponse.strError);
												        	}
												        	else
												        	{
													        	$("#popup_proposed_date").val(dataresponse.strDate);
													        	if(dataresponse.strHour<10)
													        		$("#popup_proposed_time").val("0"+dataresponse.strHour);
													        	else
													        		$("#popup_proposed_time").val(dataresponse.strHour);
													        	$("#popup_proposed_time_minute").val("00");
												        	}
												        },
												       error: function(request, error) {    
												           alert("Error call ajax!");
												       }
												    });
													
													var isPromoteRate = $("#isPromoteRate").val();
													//HOANPC Thêm quyền Support Đề xuất tỷ lệ
													var isSupportProfile = $("#isSupportProfile").val();
													
													$(data).remove();
													
													//Trạng thái chờ Duyệt chính thức:6
													if(active == '4') {
														//if(isPromoteRate=='true'||isSupportProfile=='true')$(".offical_approval").trigger("click");
														if(isPromoteRate=='true')$(".offical_approval[id="+pid+"]").trigger("click");
														else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(3)Đề xuất tỷ lệ
												
												//(4)Merchant xác nhận profiles
												$('.merchant_xacnhan_hd').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var account = $("#account").val();
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													$(".popup_detail_profile").html('<a class="slc_link" href="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+pid+'" style="color:red" target="_blank">Chi tiết hợp đồng & tỷ lệ </a>');
													
													var status_view = getStatusDescription(active);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//Call ajax
													<%-- var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
													$.ajax({
												        type: "GET",
												        cache: false,
												        url: url_api,
												        data: 'a=effective_date&merchant=' + merchant,
												        processData: false,
												        dataType: "json",
												        success: function(data) {
												            dataresponse = data;                    
												        },
												        timeout:900000,
												        complete: function(){  
												        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
												        	{
												        		alert(dataresponse.strError);
												        	}
												        	else
												        	{
													        	$("#popup_effective_date").val(dataresponse.strDate);
													        	$("#popup_effective_time").val(dataresponse.strHour);
													        	$("#popup_effective_time_minute").val("00");
												        	}
												        },
												       error: function(request, error) {    
												           alert("Error call ajax!");
												       }
												    }); --%>
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													
													var rate_type = $("#hd_using_default-"+pid, data).val();
													if(rate_type=='true')$(".popup_rate_type").html("Sử dụng tỷ lệ mặc định");
													else $(".popup_rate_type").html("Sử dụng tỷ lệ riêng");
													//popup info
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Chi tiết" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													/* var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>'); */
													
													//Thời gian đề nghị
													var hd_proposedDateFmt = $('#hd_proposedDateFmt-'+pid, data).val();
													if(hd_proposedDateFmt!=null && hd_proposedDateFmt!='' && hd_proposedDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(hd_proposedDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														//$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														//$(".status_verify_email").attr("title",'Đã xác thực');
														//$(".button_veriry_email").html("");
														$(".button_veriry_email").html('<img border="0" width="16" height="16" src="'+path_image_verrified_phone_email+'" title="Đã xác thực"/>');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														//$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														//$(".status_verify_phone").attr("title",'Đã xác thực');
														//$(".button_veriry_phone").html("");
														$(".button_veriry_phone").html('<img border="0" width="16" height="16" src="'+path_image_verrified_phone_email+'" title="Đã xác thực"/>');
													}
													
													//Verify bllingInfo Status
													var hd_status_verify_billing_info = $("#hd_status_verify_billing_info-"+pid, data).val();
													if(hd_status_verify_billing_info=='true'){
														//$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														//$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
														//$(".button_veriry_billing_infomation").html("");
														$(".button_veriry_phone").html('<img border="0" width="16" height="16" src="'+path_image_verrified_phone_email+'" title="Đã xác thực"/>');
													}
													
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
												    

													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													var isPromoteRate = $("#isPromoteRate").val();
													//HOANPC Thêm quyền Support Đề xuất tỷ lệ
													var isMerchantConfirm = $("#isMerchantConfirm").val();
													
													$(data).remove();
													
													//Trạng thái chờ Duyệt chính thức:6
													if(active == '6') {
														if(isMerchantConfirm=='true' ||(account==merchant)){
															//
															var hd_verified_email = $("#hd_verified_email-"+pid, data).val();
															//if((hd_verified_email!=null && hd_verified_email!='' && hd_verified_email.length!=0)||hd_status_verify_email=='true'){
																//hd_status_verify_email='true';
															//}
															var hd_verified_phone = $("#hd_verified_phone-"+pid, data).val();
															//if((hd_verified_phone!=null && hd_verified_phone!='' && hd_verified_phone.length!=0)||hd_status_verify_phone=='true'){
																//hd_status_verify_phone='true';
															//}
															/**
															Chỉ showForm xác thực email, phone khi là merchant
															**/
															if(account==merchant) {
																//Merchant
																if(hd_status_verify_email=='true' && hd_status_verify_phone=='true' && hd_status_verify_billing_info=='true')
																	$(".merchant_confirm-contract[id="+pid+"]").trigger("click");
																else
																	//$(".merchant_confirm_contract_verify").trigger("click");
																	$(".merchant_confirm-contract[id="+pid+"]").trigger("click");
															} else
																$(".merchant_confirm-contract[id="+pid+"]").trigger("click");
														} else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(4)Merchant xác nhận profiles
												
												//(5)Duyệt profiles
												$('.thanhtoan').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													$(".popup_detail_profile").html('<a class="slc_link" href="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+pid+'" style="color:red" target="_blank">Chi tiết hợp đồng & tỷ lệ </a>');
													
													var status_view = getStatusDescription(active);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//Call ajax
													<%-- var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
													$.ajax({
												        type: "GET",
												        cache: false,
												        url: url_api,
												        data: 'a=effective_date&merchant=' + merchant+'&id='+pid,
												        processData: false,
												        dataType: "json",
												        success: function(data) {
												            dataresponse = data;                    
												        },
												        timeout:900000,
												        complete: function(){  
												        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
												        	{
												        		alert(dataresponse.strError);
												        	}
												        	else
												        	{
													        	$("#popup_effective_date_submit").val(dataresponse.strDate);
													        	if(dataresponse.strHour<10)
													        		$("#popup_effective_time_submit").val("0"+dataresponse.strHour);
													        	else
													        		$("#popup_effective_time_submit").val(dataresponse.strHour);
													        	$("#popup_effective_time_minute_submit").val("00");
												        	}
												        },
												       error: function(request, error) {    
												           alert("Error call ajax!");
												       }
												    }); --%>
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;' target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													$(".popup_effective_date_fmt").html(effectiveDateFmt);
													
													var rate_type = $("#hd_using_default-"+pid, data).val();
													if(rate_type=='true')$(".popup_rate_type").html("Sử dụng tỷ lệ mặc định");
													else $(".popup_rate_type").html("Sử dụng tỷ lệ riêng");
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//Thời gian đề nghị
													var hd_proposedDateFmt = $('#hd_proposedDateFmt-'+pid, data).val();
													if(hd_proposedDateFmt!=null && hd_proposedDateFmt!='' && hd_proposedDateFmt.length!=0){
														$(".popup_proposed_effective_date").html(hd_proposedDateFmt);
													}else
														$(".popup_proposed_effective_date").html('<i style="color:red;">Chưa có</i>');
													
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													//popup info
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
													account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													var guide_effective_date = false;
													if(hd_proposedDateFmt!=null && hd_proposedDateFmt!='' && hd_proposedDateFmt.length!=0) {
														try {
															var _arr = hd_proposedDateFmt.split('/');
														    var _d = new Date(_arr[1] + '/' + _arr[0] + '/' + _arr[2]);
														    var now = new Date();
														    if(_d > now) {
														    	var guide_date = _d.getDate();
														    	var guide_month = _d.getMonth() + 1;
														    	var guide_year = _d.getFullYear();
														    	var guide_hour = _d.getHours();
														    	
														    	$("#popup_effective_date_submit").val((guide_date < 10?('0' + guide_date):guide_date) 
														    										+ '/' + (guide_month<10?('0' + guide_month):guide_month) 
														    										+ '/' + guide_year);
													        	if(guide_hour<10)
													        		$("#popup_effective_time_submit").val("0"+guide_hour);
													        	else
													        		$("#popup_effective_time_submit").val(guide_hour);
													        	$("#popup_effective_time_minute_submit").val("00");
													        	
													        	guide_effective_date = true;
														    } 
														} catch(e) {}
													}
														
													if(!guide_effective_date) {
														var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
														$.ajax({
													        type: "GET",
													        cache: false,
													        url: url_api,
													        data: 'a=effective_date&merchant=' + merchant,
													        processData: false,
													        dataType: "json",
													        success: function(data) {
													            dataresponse = data;                    
													        },
													        timeout:900000,
													        complete: function(){  
													        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
													        	{
													        		alert(dataresponse.strError);
													        	}
													        	else
													        	{
																	//effective_date
																	$("#popup_effective_date_submit").val(dataresponse.strDate);
														        	if(dataresponse.strHour<10)
														        		$("#popup_effective_time_submit").val("0"+dataresponse.strHour);
														        	else
														        		$("#popup_effective_time_submit").val(dataresponse.strHour);
														        	$("#popup_effective_time_minute_submit").val("00");
													        	}
													        },
													       error: function(request, error) {    
													           alert("Error call ajax!");
													       }
													    });
													}
													
													var isReviewProfileRate = $("#isReviewProfileRate").val();
													
													$(data).remove();
													
													//Trạng thái chờ Thanh toán:8
													if(active == '8' || (active == '10' && 'false' == '${account_logined.isSysAdmin()}' && $('.halfCircleRight', $(this).closest('tr')).length > 0)) {
														if(isReviewProfileRate=='true')$(".billing_approval[id="+pid+"]").trigger("click");
														else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(5)Duyệt profiles
												
												//(6)kích hoạt profiles
												$('.activate_approve').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													var status_view = getStatusDescription(active);
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;' target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													//Call ajax
													var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
													$.ajax({
												        type: "GET",
												        cache: false,
												        url: url_api,
												        data: 'a=effective_date&merchant=' + merchant,
												        processData: false,
												        dataType: "json",
												        success: function(data) {
												            dataresponse = data;                    
												        },
												        timeout:900000,
												        complete: function(){  
												        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
												        	{
												        		alert(dataresponse.strError);
												        	}
												        	else
												        	{
													        	$("#popup_effective_date_approve").val(dataresponse.strDate);
													        	$("#popup_effective_time_approve").val(dataresponse.strHour);
													        	$("#popup_effective_time_minute_approve").val("00");
												        	}
												        },
												       error: function(request, error) {    
												           alert("Error call ajax!");
												       }
												    });
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc!='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_effective_date_fmt").html(effectiveDateFmt);
													
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													var isReviewProfileRate = $("#isReviewProfileRate").val();
													
													$(data).remove();
													
													if(active == '10') {
														if(isReviewProfileRate=='true'){
															$(".effective_date[id="+pid+"]").trigger("click");
														} else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(6)kích hoạt profiles
												
												//(7)Hủy kích hoạt profiles
												$('.activate_reject').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													var status_view = getStatusDescription(active);
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc!='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_effective_date_fmt").html(effectiveDateFmt);
													
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;'  target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													var isReviewProfileRate = $("#isReviewProfileRate").val();
													
													$(data).remove();
													
													if(active == '10') {
														if(isReviewProfileRate=='true'){
															$(".cancel_approved_profile_").trigger("click");
														} else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//(7)Hủy kích hoạt profiles
												
												//8. Kích hoạt profiles
												$('.activate_profile_approve_').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													var status_view = getStatusDescription(active);
													
													//link detail
													$(".popup_link_detail").html("<a href='${pageContext.request.contextPath}/protected/merchant_profile_detail.html?id="+pid+"' style='color:red; font-weight:bold;' target='blank'>Chi tiết hợp đồng & tỷ lệ </a>");
													
													//Call ajax
													var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
													$.ajax({
												        type: "GET",
												        cache: false,
												        url: url_api,
												        data: 'a=effective_date&merchant=' + merchant,
												        processData: false,
												        dataType: "json",
												        success: function(data) {
												            dataresponse = data;                    
												        },
												        timeout:900000,
												        complete: function(){  
												        	if(dataresponse.strError !=null && dataresponse.strError !="undefined")
												        	{
												        		alert(dataresponse.strError);
												        	}
												        	else
												        	{
													        	$("#popup_effective_date_approve").val(dataresponse.strDate);
													        	$("#popup_effective_time_approve").val(dataresponse.strHour);
													        	$("#popup_effective_time_minute_approve").val("00");
												        	}
												        },
												       error: function(request, error) {    
												           alert("Error call ajax!");
												       }
												    });
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc!='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_effective_date_fmt").html(effectiveDateFmt);
													
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}else{
														$(".popup_paymentInfo").html('<i style="color:red;">Chưa có</i>');
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													var isReviewProfileRate = $("#isReviewProfileRate").val();
													
													$(data).remove();
													
													if(active == '10') {
														if(isReviewProfileRate=='true'){
															$(".effective_date[id="+pid+"]").trigger("click");
														} else $(".common_contract_infomations_popup").trigger("click");
													} else {
														$(".common_contract_infomations_popup").trigger("click");
														return;
													}
												});
												//END 8. Kích hoạt profiles
												
												//(9)Clone Profiles
												$('.clone_profile').live('click', function() {
													resetContentPopup();
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var data = $('<div style="display:none;">').html($.base64.atob($('#data_' + pid).val(), true));
													
													var merchant = $("#hd_merchant-"+pid, data).val();
													var merchant_name = $("#hd_merchant_name-"+pid, data).val();
													var merchant_desc = $("#hd_merchant_desc-"+pid, data).val();
													//email, phone
													var merchant_email = $("#hd_merchant_email-"+pid, data).val();
													var merchant_phone = $("#hd_merchant_phone-"+pid, data).val();
													
													var active = $('#status_hidden_'+pid, data).val();
													var paymentPolicy = $('#payment_policy_'+pid, data).val();
													var contract_type = $('#contract_type_'+pid, data).val();
													var contract_no = $('#contract_no_'+pid, data).val();
													var contract_date = $('#contract_date_'+pid, data).val();
													var rejectLog = '---';
													if($('#rejectLog_'+pid, data).val()!='' && $('#rejectLog_'+pid, data).val()!='undefined') rejectLog = $('#rejectLog_'+pid, data).val();
													if(rejectLog!='' && rejectLog!='undefined')
														$(".popup_reject_log").html(rejectLog);
													
													$(".popup_detail_profile").html('<a class="slc_link" href="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+pid+'" style="color:red" target="_blank">Chi tiết hợp đồng & tỷ lệ </a>');
													
													var status_view = getStatusDescription(active);
													
													//popup info
													//$(".popup_merchant").html(merchant);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name!='')$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_desc!=null && merchant_desc=='' && merchant_desc.length!=0)$(".popup_merchantDesc").html(merchant_desc);
													else $(".popup_merchantDesc").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_email!=null && merchant_email!='' && merchant_email.length!=0)$(".popup_merchant_email").html(merchant_email);
													else $(".popup_merchant_email").html('<i style="color:red;">chưa có</i>');
													
													if(merchant_phone!=null && merchant_phone!='' && merchant_phone.length!=0)$(".popup_merchant_phone").html(merchant_phone);
													else $(".popup_merchant_phone").html('<i style="color:red;">chưa có</i>');
													
													if(contract_no!=null && contract_no!='' && contract_no.length!=0)$(".popup_contract_no").html(contract_no);
													else $(".popup_contract_no").html('<i style="color:red;">chưa có</i>');
													
													if(contract_type!=null && contract_type!='' && contract_type.length!=0)$(".popup_contract_type").html(contract_type);
													else $(".popup_contract_type").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_contract_date").html(contract_date);
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_payment_policy").html(paymentPolicy);
													$(".popup_has_vat").html('Loại '+contract_type);
													
													//Tự động gia hạn HĐ
													var hd_autoExtendedContract=$("#hd_autoExtendedContract-"+pid, data).val();
													if(hd_autoExtendedContract==true)
														$(".autoExtendedContract_common").attr("checked", true);
													else
														$(".autoExtendedContract_common").attr("checked", true);
													
													//Identity
													/*
													var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$(".popup_merchant_identity").html(identity);
														$(".popup_merchant_identity").html(identity);
													}else $(".popup_merchant_identity").html('<i style="color:red;">chưa có</i>');
													
													var path_identity_image = $("#path_identity_image").val();
													var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(hd_identityImage!=null && hd_identityImage!='' && hd_identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+hd_identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													*/
													
													var contract_expired_date = $('#contract_expired_date_'+pid, data).val();
													if(contract_expired_date!=null && contract_expired_date!='' && contract_expired_date.length!=0){
														$(".popup_contract_expired_date_").html(contract_expired_date);
														$(".popup_contract_expired_date_").html(contract_expired_date);
													}else $(".popup_contract_expired_date_").html('<i style="color:red;">chưa có</i>');
													
													//Thông tin thanh toán
													var paymentInfo = $('#hd_paymentInfo-'+pid, data).val();
													if(paymentInfo!=null && paymentInfo!=''){
														$(".popup_paymentInfo").html(paymentInfo);
													}
													
													//bản cứng HĐ
													/* var path_contract_uri = $("#path_contract_uri").val();
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														var href='<a class="styled-button-download"  target="_blank" href="${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/'+hd_linkHardCopy+'">Download</a>';
														$(".popup_hardcopy").html(href);
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													if(hasHardCopy=='true'){
														$("#hasHardCopy_approved").attr("checked", true);
														$(".popup_hasHardCopy").html('<i style="color:red;">Có</i>');
													}
													else{
														$("#hasHardCopy_approved").attr("checked", false);
														$(".popup_hasHardCopy").html('<i style="color:red;">Chưa có</i>');
														$(".popup_hardcopy").html('');
													} */
													//bản cứng HĐ
													var path_contract_uri = $("#path_contract_uri").val();
													var host = '${pageContext.request.contextPath}'+path_contract_uri+'/hardcopy/'+merchant+'/';
													var hd_linkHardCopy = $("#hd_linkHardCopy-"+pid, data).val();
													var href = '<i style="color:#f00;">Chưa có</i>';

													if(hd_linkHardCopy!=null && hd_linkHardCopy!=''){
														href='<a class="hard_link"  target="_blank" href="' + host + hd_linkHardCopy + '">Tải về</a>';
													}
													var hasHardCopy = $("#hd_hasHardCopy-"+pid, data).val();
													$(".popup_hasHardCopy").html('<input type="checkbox"' + (hasHardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> ' + (hasHardCopy == 'true' ? '<span> Đã có </span>' : '') + href);
													$(".popup_hardcopy").html('');
													
													var hasHardCardCopy = $("#hd_hasHardCardCopy-"+pid, data).val();
													var hasHardSmsCopy = $("#hd_hasHardSmsCopy-"+pid, data).val();
													var hasHardWapCopy = $("#hd_hasHardWapCopy-"+pid, data).val();
													var hasHardIacCopy = $("#hd_hasHardIacCopy-"+pid, data).val();
													var hasHardBankCopy = $("#hd_hasHardBankCopy-"+pid, data).val();
													
													var hasCardContract = $("#hd_hasCardContract-"+pid, data).val();
													var hasSmsContract = $("#hd_hasSmsContract-"+pid, data).val();
													var hasWapContract = $("#hd_hasWapContract-"+pid, data).val();
													var hasIacContract = $("#hd_hasIacContract-"+pid, data).val();
													var hasBankContract = $("#hd_hasBankContract-"+pid, data).val();

													$(".popup_hasHardCardCopy").html('<input type="checkbox"' + (hasHardCardCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? (host + $("#hd_linkHardCardCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardCardCopy-"+pid, data).val() ? 'hard_link':(hasCardContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Card</a>');
													$(".popup_hasHardSmsCopy").html('<input type="checkbox"' + (hasHardSmsCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? (host + $("#hd_linkHardSmsCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardSmsCopy-"+pid, data).val() ? 'hard_link':(hasSmsContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Sms</a>');
													$(".popup_hasHardWapCopy").html('<input type="checkbox"' + (hasHardWapCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? (host + $("#hd_linkHardWapCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardWapCopy-"+pid, data).val() ? 'hard_link':(hasWapContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Wap</a>');
													$(".popup_hasHardIacCopy").html('<input type="checkbox"' + (hasHardIacCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? (host + $("#hd_linkHardIacCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardIacCopy-"+pid, data).val() ? 'hard_link':(hasIacContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">SMS Plus</a>');
													$(".popup_hasHardBankCopy").html('<input type="checkbox"' + (hasHardBankCopy == 'true' ? ' checked="checked"' : '') + ' disabled="true" /> <a href="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? (host + $("#hd_linkHardBankCopy-"+pid, data).val() + '" target="_blank'):'javascript: void(0);') + '" class="' + ($("#hd_linkHardBankCopy-"+pid, data).val() ? 'hard_link':(hasBankContract=='1'?'not_verify':'')) + '" style="font-size: 14px;">Bank</a>');
													
													//Tham chiều Profile tham chiếu
													var reference=$("#hd_reference-"+pid, data).val();
													if(reference!=null && reference!='' && reference!='undefined')
													$(".popup_profile_reference").html('<a href="merchant_profile_detail.html?id='+reference+'" class="" title="Xem chi tiết profile gốc" style="color:#1469EB" target="blank">Chi tiết</a>');
													else $(".popup_profile_reference").html('<i style="color:red;">Chưa có</i>');
													//popup info
													
													//Verify email Status
													var path_image_verrified_phone_email = $("#path_image_verify_phone_email").val();
													var hd_status_verify_email = $("#hd_status_verify_email-"+pid, data).val();
													if(hd_status_verify_email=='true' && hd_status_verify_email!=null && hd_status_verify_email!='' && hd_status_verify_email.length!=0){
														$(".status_verify_email").attr("src",path_image_verrified_phone_email);
														$(".status_verify_email").attr("title",'Đã xác thực');
													}
													
													//Verify phone Status
													var hd_status_verify_phone = $("#hd_status_verify_phone-"+pid, data).val();
													if(hd_status_verify_phone=='true' && hd_status_verify_phone!=null && hd_status_verify_phone!='' && hd_status_verify_phone.length!=0){
														$(".status_verify_phone").attr("src",path_image_verrified_phone_email);
														$(".status_verify_phone").attr("title",'Đã xác thực');
													}
													
													var effectiveDateFmt = $('#hd_effective_date_fmt-'+pid, data).val();
													if(effectiveDateFmt!=null && effectiveDateFmt!='' && effectiveDateFmt.length!=0){
														$(".popup_effective_date_fmt").html(effectiveDateFmt);
													}else
														$(".popup_effective_date_fmt").html('<i style="color:red;">Chưa có</i>');
													
													//Call ajax: Thông tin thanh toán
													var billing_type="";
													var account_number="";
													var account_holder="";
													var bank_name="";
													var city_bank="";
													var branch_bank="";
													var verify_billing_info="";
													
													var identity="";
													var identityImage="";
													var placeOfIssue="";
													var dateOfIssue="";
													var verify_identity="";
													
													billing_type=$("#hd_billing_type-"+pid, data).val();
												    account_number=$("#hd_account_number-"+pid, data).val();
													account_holder=$("#hd_account_holder-"+pid, data).val();
													bank_name=$("#hd_bank_name-"+pid, data).val();
													city_bank=$("#hd_bank_city-"+pid, data).val();
													code_bank_name=$("#hd_bank_name_code-"+pid, data).val();
													code_city_bank=$("#hd_bank_city_code-"+pid, data).val();
													branch_bank=$("#hd_bank_branch-"+pid, data).val();
													if($("#hd_bank_status-"+pid, data).val()==4)verify_billing_info=true;
													else verify_billing_info==false;
													
													//popup labels
													if(billing_type!=null && billing_type!='' && billing_type.length!=0)
														$(".popup_billing_info_billing_type").html(billing_type);
													if(account_holder!=null && account_holder!='' && account_holder.length!=0)
														$(".popup_billing_info_account_holder").html(account_holder);
													if(account_number!=null && account_number!='' && account_number.length!=0)
														$(".popup_billing_info_account_number").html(account_number);
													if(bank_name!=null && bank_name!='' && bank_name.length!=0)
														$(".popup_billing_info_bank_name").html(bank_name);
													if(city_bank!=null && city_bank!='' && city_bank.length!=0)
														$(".popup_billing_info_city_bank").html(city_bank);
													if(branch_bank!=null && branch_bank!='' && branch_bank.length!=0)
														$(".popup_billing_info_branch_bank").html(branch_bank);
													
													if(verify_billing_info)
													{
														$(".billing_info_image_popup_common").attr("src",path_image_verrified_phone_email);
														$(".billing_info_image_popup_common").attr("title",'Đã xác thực');
													}
													
													//CMND/DKKD
													identity=$("#hd_identity-"+pid, data).val();
													identityImage=$("#hd_identityImage-"+pid, data).val();
													placeOfIssue=$("#hd_placeOfIssue-"+pid, data).val();
													dateOfIssue=$("#hd_dateOfIssue-"+pid, data).val();
													if($("#hd_identity_status-"+pid, data).val()==4)verify_identity=true;
													else verify_identity==false;
													//popup values
													$("#popup_merchant_identity").val(identity);
													$("#popup_place_of_issue").val(placeOfIssue);
													$("#popup_date_of_issue").val(dateOfIssue);
													
													//popup labels
													if(identity!=null && identity!='' && identity.length!=0)
														$(".popup_common_identity__identity").html(identity);
													if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
														$(".popup_common_identity_place_of_issue").html(placeOfIssue);
													if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
														$(".popup_common_identity_date_of_issue").html(dateOfIssue);
													
													if(verify_identity)
													{
														$(".popup_common_identity_verify").attr("src",path_image_verrified_phone_email);
														$(".popup_common_identity_verify").attr("title",'Đã xác thực');
														
														//Đã xác thực tt thanh toán-> Không được sửa
														$('#popup_merchant_identity').prop('readonly', true);
														$('#popup_place_of_issue').prop('readonly', true);
														$('#popup_date_of_issue').prop('readonly', true);
													}
													
													//Identity
													//var identity = $("#hd_identity-"+pid, data).val();
													if(identity!=null && identity!='' && identity.length!=0){
														$("#popup_merchant_identity").val(identity);
														$(".popup_merchant_identity").html(identity);
													}
													//Identity Image
													var path_identity_image = $("#path_identity_image").val();
													//var hd_identityImage = $("#hd_identityImage-"+pid, data).val();
													if(identityImage!=null && identityImage!='' && identityImage.length!=0){
														path_identity_image_full=path_identity_image+'/'+merchant+'/'+identityImage;
														$(".identity_image_popup_common").attr("src",path_identity_image_full);
														$(".identity_image_popup_common_a").attr("href",path_identity_image_full);
														
														$(".popup_common_identity_image").attr("src",path_identity_image_full);
														$(".popup_common_identity_image_a").attr("href",path_identity_image_full);
													}
													
													//Version
													var hd_startDateFmt=$('#hd_startDateFmt-'+pid, data).val();
													if(hd_startDateFmt!=null && hd_startDateFmt!='' && hd_startDateFmt.length!=0){
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val()+" ("+hd_startDateFmt+")");
													}else{
														$('.popup_profile_version').html('1.'+$('#hd_version-'+pid, data).val());
													}

													// Clone_reason
													$('.popup_profile_clone_reason').html($('#hd_clone_reason-'+pid, data).val());
													
													//Điều kiện clone profile
													var hd_childReference=$('#hd_childReference-'+pid, data).val();
													//alert(hd_childReference);
													$(".popup_clone_profile_note").html('');
													if(hd_childReference==null || hd_childReference=='' || hd_childReference.length==0){
														//clone_view_submit
														$('.clone_view_submit').css('display', 'block');
													}else{
														//call ajax
														var url_api = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html';
														$.ajax({
													        type: "GET",
													        cache: false,
													        url: url_api,
													        data: 'a=condition_clone&id=' + pid,
													        processData: false,
													        dataType: "json",
													        success: function(data) {
													            dataresponse = data;                    
													        },
													        timeout:900000,
													        complete: function(){  
													        	if(dataresponse.strError !=null && dataresponse.strError !="undefined") {
													        		alert(dataresponse.strError);
													        	} else {
														        	if(dataresponse.result ==1)
														        	{
														        		$(".popup_clone_profile_note").html('');
														        		$('.clone_view_submit').css('display', 'block');
														        	} else {
														        		var childReference = dataresponse.childReference;
														        		var note = 'Không được phép clone: Đang tồn tại 1 bản profile clone đang xử lý';
														        		if(childReference!=null && childReference!='' && childReference.length!=0){
														        			note='Không được phép clone: Đang tồn tại 1 bản <a class="hard_link" target="_blank" href="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+childReference+'">profile clone</a>';
																		}
														        		$(".popup_clone_profile_note").html(note);
														        		$('.clone_view_submit').css('display', 'none');
														        	}
													        	}
													        },
													       error: function(request, error) {    
													           alert("Error call ajax!");
													       }
													    });
													}
													
													var isReviewProfileInfo = $("#isReviewProfileInfo").val();
													
													$(data).remove();
													
													if(isReviewProfileInfo=='true' || 'true' == '${account_logined.isBizManager()}')
														$(".clone_profile_contract_rate").trigger("click");
													else $(".common_contract_infomations_popup").trigger("click");
												});
												//(9)Clone Profiles
												
											});
										</script>

<div style="display:none;">
	<!-- Thông tin hiển thị chung -->
	<a id="${list.id}" class="sms_avai1 act_copylink common_contract_infomations_popup card_invi" href="#common_contract_infomations" rel="leanModal123"></a>
	
	<!-- Clone profile -->
	<a id="${list.id}" class="sms_avai1 act_copylink clone_profile_contract_rate card_invi" href="#clone_profile_contract" rel="leanModal123"></a>
	
	<!-- Cancel approve profile -->
	<a id="${list.id}" class="sms_avai1 act_copylink cancel_approved_profile_ card_invi" href="#cancel_approved_profile" rel="leanModal123"></a>
	
	<!-- 
	<input type="hidden" id="path_identity_image" value="${model.url_callback}">
	 -->
	<input type="hidden" id="path_image_verify_phone_email" value="<%=request.getContextPath() %>/images/tick.png">
	<input type="hidden" id="path_contract_uri" value="${model.path_contract_uri}">
	
	<input type="hidden" id="url_callback" value="${model.url_callback}">
	<input type="hidden" id="validate_merchant_profile" name="validate_merchant_profile" value="<%=MerchantProfileConstant.VALIDATE_MERCHANT_PROFILE%>" />
</div>

<script type="text/javascript">
	$(document).ready(function() {
		$('#list .rowid').each(function() {
			var state = $(this).attr('state') + '';
			if (state == '10-pending' || state == '10-approved') {
				$(this).parent().parent().addClass('approved_row');
			}
		});
	});
</script>

<script type="text/javascript">
	$(document).ready(function() {
		$('.act_detail').live('click', function() {
			var id = $(this).attr('mpid');
			var h = Math.max(document.documentElement.clientHeight, window.innerHeight || 0);
			if(h > 100) h = h - 100;
			$('#_pop').css('height', h + 'px');
			$('#_pop').css({'width': '840px'});
			$('#_pop').html('<a class="close" title="Đóng" onclick="$(\'#lean_overlay\').click();" href="javascript:void(0);">X</a>'+'<iframe src="<%=request.getContextPath()%>/protected/merchant_profile_detail.html?id='+id+'" style="border: none;width:840px;height:100%"></iframe>');
		});
	});
</script>
<div id="_pop">
</div>