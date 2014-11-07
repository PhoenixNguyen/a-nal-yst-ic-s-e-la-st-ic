<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
</head>
<%Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED); %>
<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("menuTrangChu", true); %>
				<jsp:include page="header.jsp"></jsp:include>
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Left Menu -->
						<%request.setAttribute("merchantProfileNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">Đề xuất profile</h1>
								<div>
									<div id="dash_tab">
										<a href="<%=request.getContextPath() %>/protected/merchant_profile_upgrate_user.html" class="tab_slc"><span>Đề xuất profile</span></a>
										
										<a href="<%=request.getContextPath() %>/protected/merchant_profile_approved.html" class="addcomparison_link"><span>Quản lý profile</span></a>
										<div class="clear"></div>
									</div>
									<form id="list-sms-scenario" action="merchant_profile_upgrate_user.html" method="post">
										<jsp:include page="include_box_filter_merchant_profile_upgrate_user.jsp"></jsp:include>
									</form>
				                 	
				                 	<!-- Danh sach gan tt -->
				                 	<div class="srv_row">
										<script>var rownum = 1;</script>
										<input type="hidden" value="${model.isPreliminary}" id="isPreliminary"/>
										<input type="hidden" value="${model.isMerchant}" id="isMerchant"/>
										<input type="hidden" value="${model.isOffical}" id="isOffical"/>
										<input type="hidden" value="${model.isBilling}" id="isBilling"/>
										<input type="hidden" value="${model.isRequirePreliminary}" id="isRequirePreliminary"/>
										<c:if test="${model.total > 0}">
											<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1} tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
										</c:if>
										<display:table name="model.list" id="list" 
														requestURI="merchant_profile_upgrate_user.html" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
										    <display:column title="Merchant" headerClass="transhead" class="transdata" property="username" style="border: 1px solid #CCC;" />
										    <display:column title="Full Name" headerClass="transhead" class="transdata" property="full_name" style="border: 1px solid #CCC;" />
										    <display:column title="Email" headerClass="transhead" class="transdata" property="email" style="border: 1px solid #CCC;" />
										    <display:column title="Mobile" headerClass="transhead" class="transdata" property="phone" style="border: 1px solid #CCC;" />
										    
										    <display:column title="Đề nghị" headerClass="transhead width80" class="svr_data1${model.mapMerchantActivedProfiles[list.username] != null?' activate':''}" style="border: 1px solid #CCC;text-align:center;">
											    <c:if test="${model.mapMerchantActivedProfiles[list.username] == null}">
											    	<!-- list hiden for popup -->
													<input type="hidden" id="hd_merchant-${list.id}" value="${list.username}"/>
													<input type="hidden" id="hd_merchant_name-${list.id}" value="${list.full_name}"/>
													<input type="hidden" value="${list.email}" class="email" id="email-${list.id}"/>
													<input type="hidden" value="${list.phone}" class="phone" id="phone-${list.id}"/>
													<fmt:formatDate value="${list.created_time}" var="created_time" pattern="dd/MM/yyyy HH:mm" />
													<input type="hidden" value="${created_time}" class="created_time" id="created_time-${list.id}"/>
													<!-- list hiden for popup -->
											    	
											    	<div style="display:none">
											    		<!-- Đề nghị profile -->
											    		<a id="${list.id}" class="sms_avai1 act_copylink require_preliminary_approval card_invi" title="Hủy bỏ" href="#comparison_provider_require" name="require_preliminary_approval"  rel="leanModal123"></a>
											    		<a id="${list.id}" class="sms_avai1 act_copylink profile_info_uprgate card_invi" title="Hủy bỏ" href="#profile_info_uprgate" name="profile_info_uprgate"  rel="leanModal123"></a>
											    		<!-- /Đề nghị profile -->
											    	</div>
											    	 
											    	<!-- Đề nghị profile -->
											    	<c:set var="requireComparisonIconKey" value="com${list.id}" />
													<a class="comparison_wait yeucauduyetsobo" id="${list.id}"
													title="Đề nghị profile"
													${!model.isAdmin?'rel="leanModal"':((model.statusIconRequireComparison[requireComparisonIconKey]=='active' || model.statusIconRequireComparison[requireComparisonIconKey]=='reject' || model.statusIconRequireComparison[requireComparisonIconKey]=='normal')?'rel="leanModal"':'')}></a>
											    	<!-- /Đề nghị profile -->
											    	
											    	<input type="hidden" value="${list.status}"class="status_hidden" id="status_hidden_${list.id}"/>
										    	</c:if>
										    </display:column>
										</display:table>
										<div id="product_active_change" style="display: none;"></div>
										
										<script type="text/javascript">
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
												//1.Đề nghị profile
												$('.yeucauduyetsobo').live('click', function() {
													var chkId = $(this).attr('id')+'';
													var pid = chkId.replace(/svr_/gi, '');
													var merchant = $("#hd_merchant-"+pid).val();
													var merchant_name = $("#hd_merchant_name-"+pid).val();
													var active = $('#status_hidden_'+pid).val();
													var email = $("#email-"+pid).val();
													var phone = $("#phone-"+pid).val();
													var created_time = $("#created_time-"+pid).val();
													var status_view = '';
													switch(active)
													{
														case 'verified':
														case 'actived':
														case 'active':
															status_view = 'Tài khoản đã được kích hoạt';
														  	break;
														default:
															status_view = '<i style="color:#f00;">Tài khoản chưa kích hoạt</i>';
													  		break;
													}
													
													//popup info
													$(".popup_pid").val(pid);
													$(".popup_status").val(active);
													$(".popup_status_view").html(status_view);
													$(".popup_puser").val(merchant);
													$(".popup_pfullname").val(merchant_name);
													$(".popup_merchant").html(merchant);
													
													if(merchant_name!=null && merchant_name=='' && merchant_name.length!=0)
														$(".popup_merchant_name").html(merchant_name);
													else $(".popup_merchant_name").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_email").html(email);
													
													if(phone!=null && phone=='' && phone.length!=0)
														$(".popup_phone").html(phone);
													else $(".popup_phone").html('<i style="color:red;">chưa có</i>');
													
													$(".popup_status").html(status_view);
													$(".popup_create_date").html(created_time);
													//popup info
													
													//version
													var url = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html?a=get_rejected_profile&popup_puser=' + merchant;
													$.get(url, $(this).serialize(), function(json) {
														try {
															var obj = eval('(' + json + ')');
															if(obj.version) {
																$(".popup_version").html('1.' + obj.version);
															} else {
																$(".popup_version").html('<i style="color:#f00;">chưa có</i>');
															}
															
															if(obj.log)
																$(".popup_log").html(obj.log);
															else
																$(".popup_log").html('<i style="color:#f00;">chưa có</i>');
														} catch(e) {}
													});
													
													var activatedUrl = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html?a=get_activated_profile&popup_puser=' + merchant;
													$.get(activatedUrl, $(this).serialize(), function(json) {
														try {
															if(json != null && json.length > 0) {
																var verList = '<select name="tags">';
																var vers = json.split(',');
																for(var i = 0; i < vers.length ; i++)
																	verList += '<option value="'+vers[i]+'">1.'+vers[i]+'</option>';
																verList += '</select>';
																$(".popup_version_list").html(verList);
															} else {
																$(".popup_version_list").html('<i style="color:#f00;">chưa có</i>');																
															}
														} catch(e) {
															$(".popup_version_list").html('<i style="color:#f00;">chưa có</i>');
														}
													});
													var isRequirePreliminary = $("#isRequirePreliminary").val();
													/* if(active != 'verified'){
														alert('Tài khoản '+merchant+' chưa kích hoạt');
													} */
													if(active == 'verified'||active == '1' || active == 'actived' || active == 'active') {
														//if(isRequirePreliminary=='true')$(".require_preliminary_approval").trigger("click");
														//else $(".info_comparison_common").trigger("click");
														$(".require_preliminary_approval").trigger("click");
													} else {
														$(".profile_info_uprgate").trigger("click");
														return;
													}
												});
												
												$('#list .activate').each(function() {
													$(this).parent().addClass('approved_row');
													$(this).parent().attr('title', 'Merchant đã có running profile');
												});
											});
										</script>
										<c:choose>
													<c:when test="${model.isStaff}">
														<script type="text/javascript">
															$(document).ready(function() {
																$('.onoffswitch-checkbox').live('click', function() {
																	var alertMess = 'Bạn muốn thay đổi trạng thái?';
																	var active = $(this).attr('value')+'';
																	if(active == 'false') {
																		alertMess = 'Bạn muốn kích hoạt Merchant Profile?';
																	} else if(active == 'true') {
																		alertMess = 'Bạn muốn hủy kích hoạt Merchant Profile?';
																	}
																	
																	if(confirm(alertMess)) {
																		var chkId = $(this).attr('id')+'';
																		//alert(chkId);
																		var pid = chkId.replace(/svr_/gi, '');
																		var url = '<%=request.getContextPath()%>/protected/merchant-profile-ajax.html?a=approve_merchant_profile&pid='+pid+'&active='+active;
																		//alert(pid);
																		//alert(url);
																		$('#product_active_change').load(url, function(responseTxt,statusTxt,xhr){
																			if(responseTxt == "1") {
																				$('#' + chkId).val(responseTxt);
																				if(active == 'false')$('#' + chkId).val(true);
																				if(active == 'true')$('#' + chkId).val(false);
																			}
																		});
																	} else {
																		return false;
																	}
																});
															});
														</script>
													</c:when>
												</c:choose>
									</div>
									<!-- /Danh sach gan tt -->
							</div>
					</div>
				</div>
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
		<jsp:include page="footer.jsp"></jsp:include>
		<!-- / Web Foot -->
	  </div>
	</div>
	<!-- / 1PAY WEB -->
	
	<!-- 1.Đề nghị profile-->
	<div style="display: none; background: #fff; width: 600px;" id="comparison_provider_require" class="profile_info_uprgate">
	<form action="<%=request.getContextPath()%>/protected/merchant-profile-ajax.html" method="post" name="require_preliminary_approve_post">
		<input type="hidden" name="a" value="proposal_profile" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_puser" class="popup_puser" name="popup_puser" value="" />
		<input type="hidden" id="popup_pfullname" class="popup_pfullname" name="popup_pfullname" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đề nghị profile cho tài khoản</h1>
			<br />
			<div class="product_title">
				<label class="label_popup_profile">Tài khoản:</label>
				<span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Họ tên:</label>
				<span class="go_sms_product_name popup_merchant_name" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Email:</label>
				<span class="go_sms_product_name popup_email" id="popup_email"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Điện thoại:</label>
				<span class="go_sms_product_name popup_phone" id="popup_phone"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Ngày tạo:</label>
				<span class="go_sms_product_name popup_create_date" id="popup_create_date"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Trạng thái:</label>
				<span class="go_sms_product_name popup_status" id="popup_status"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Version bị từ chối:</label>
				<span class="go_sms_product_name popup_version" id="popup_version"></span>
			</div>
			<div class="product_title clear">
				<label class="label_popup_profile">Lý do từ chối:</label>
				<span class="go_sms_product_name popup_log" id="popup_log" style="display: block; float: left; overflow: hidden; max-height: 40px; max-width: 390px;"></span>
			</div>
			<div class="product_title clear">
				<label class="label_popup_profile">Đề nghị từ version:</label>
				<span class="go_sms_product_name popup_version_list" id="popup_version_list"></span>
			</div>
		</div>
		<div style="margin-top: 30px;">
			<div class="product_title">
				<label class="label_popup_profile">
					<input type="hidden" class="value_submit_require_preliminary" name="submit2" value="approve" />				
					<input type="submit" name="approve" value="Đề nghị" class="btn_greensmall" style="float:right;" />	
				</label>
				<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			</div>
			
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
	    					alert('Xin hãy nhập lý do hủy Đề nghị profile');
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
					if(!confirm('Bạn có chắc chắn đề nghị Merchant Profile?'))
						return false;

					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							//alert(json);
							//$('.modal_close').click();
							//window.location.replace(window.location.pathname);
							if (!isNaN(json)) {
								var x = parseInt(json);
								if (x >= -1) {
									//var mess = 'Payment request for wap charging for this product has been successfuly approved';
									var pid = $('form[name=require_preliminary_approve_post] input[name=pid]').val();
									if(x == -1) {//Reject
										/*
										$('.go_wap'+pid).attr('class','wap_reject go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Reject');
										$('.go_wap'+pid).attr('state','reject');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Reject');
										}
										*/
										mess = 'Đề nghị profile thất bại';
									} else if(x >= 0) {//Activated
										/*
										$('.go_wap'+pid).attr('class','wap_active go_wap go_wap'+pid);
										$('.go_wap'+pid).attr('title','Activated');
										$('.go_wap'+pid).attr('state','active');
										if($.trim($('.go_wap'+pid).text()).length > 0) {
											$('.go_wap'+pid).text('Activated');
										}
										*/
										mess = 'Đề nghị profile thành công';
									}
									alert(mess);
									/*
									$('.modal_close').click();
									return false;
									*/
									var paramters = '';
									var merchant = $("#merchant").val();
									var month = $("#month").val();
									var status = $("#status").val();
									var paymentPolicy = $("#paymentPolicy").val();
									
									var url = document.URL;
									if(merchant != "" && typeof(merchant)!= 'undefined' && url.indexOf("merchant=")<=0)paramters=paramters+'&merchant='+merchant;
									if(month != "" && typeof(month)!= 'undefined'  && url.indexOf("month=")<=0)paramters=paramters+'&month='+month;
									if(status != "" && typeof(status)!= 'undefined' && url.indexOf("status=")<=0)paramters=paramters+'&status='+status;
									if(paymentPolicy != "" && typeof(paymentPolicy)!= 'undefined' && url.indexOf("paymentPolicy=")<=0)paramters=paramters+'&paymentPolicy='+paymentPolicy;
									
									//alert(url);
									if(url.indexOf("?")<=0){
										paramters="?"+paramters;
									}
									if(paramters.length>1)url=url+paramters;
									window.location.replace(encodeURI(url));
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
	<!-- /1.Đề nghị profile-->
	
	<!-- 2. Info-->
	<div style="display: none; background: #fff; width:600px;" class="profile_info_uprgate" id="profile_info_uprgate">
		<input type="hidden" name="a" value="proposal_profile" />
		<input type="hidden" id="popup_pid" class="popup_pid" name="popup_pid" value="" />
		<input type="hidden" id="popup_puser" class="popup_puser" name="popup_puser" value="" />
		<input type="hidden" id="popup_pfullname" class="popup_pfullname" name="popup_pfullname" value="" />
		<input type="hidden" id="popup_status" class="popup_status" name="popup_status" value="" />
		<div class="pop_box">
			<h1 class="srv_title">Đề nghị profile cho tài khoản</h1>
			<br />
			<div class="product_title">
				<label class="label_popup_profile">Tài khoản:</label>
				<span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Họ tên:</label>
				<span class="go_sms_product_name popup_merchant_name" id="popup_has_vat"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Email:</label>
				<span class="go_sms_product_name popup_email" id="popup_email"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Điện thoại:</label>
				<span class="go_sms_product_name popup_phone" id="popup_phone"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Ngày tạo:</label>
				<span class="go_sms_product_name popup_create_date" id="popup_create_date"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Trạng thái:</label>
				<span class="go_sms_product_name popup_status" id="popup_status"></span>
			</div>
			<div class="product_title">
				<label class="label_popup_profile">Version bị từ chối:</label>
				<span class="go_sms_product_name popup_version" id="popup_version"></span>
			</div>
			<div class="product_title clear">
				<label class="label_popup_profile">Lý do từ chối:</label>
				<span class="go_sms_product_name popup_log" id="popup_log" style="display: block; float: left; overflow: hidden; max-height: 40px; max-width: 390px;"></span>
			</div>			
		</div>
		<div style="margin-top: 30px;">
			<div class="product_title">
				<label class="label_popup_profile">&nbsp;</label>
				<input name="reset" value="Bỏ qua" class="btn_graysmall modal_close" type="reset"/>
			</div>
		</div>
	</div>
	<!-- /2. Info-->
	
</body>
</html>
