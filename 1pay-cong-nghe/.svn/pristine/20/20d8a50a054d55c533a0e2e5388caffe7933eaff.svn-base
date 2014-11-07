<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ page import="java.text.DateFormat, java.text.SimpleDateFormat, java.util.Calendar,java.util.Date"%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
</head>

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
						<%request.setAttribute("constractNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<!-- Right Content -->
						<form:form  enctype="multipart/form-data" method="post" id="fm1" commandName="edit_contract" cssClass="fm-v clearfix" htmlEscape="true">
						<div class="right_content">
							<h1 class="srv_title">Tạo thông tin hợp đồng</h1>
							<div>
								<span style="color: red"><form:errors path="*"/></span>
							</div>
                			<div class="srv_row">
                				<p class="title-box">Contract information</p>
                				<c:if test="${!isSupport && !isOperator}">
                					<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="label_popup_profile" width="200">Đối tác::</td>
	                                        <td>
		                                        <b>${merchants}</b>
		                                        <input type="hidden" id="merchant" value="${merchants}"/>
	                                        </td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Tên đối tác:
											</td>
											<td>
												<b>${merchant_name}</b>
												<input type="hidden" id="merchantName" value="${merchant_name}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Email:
											</td>
											<td>
												<b>${merchantProfile.contractInfo.email}</b>
												<input type="hidden" id="email" value="${merchantProfile.contractInfo.email}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Điện thoại:
											</td>
											<td>
												<b>${merchantProfile.contractInfo.phone}</b>
												<input type="hidden" id="phone" value="${merchantProfile.contractInfo.phone}"/>
											</td>
										</tr>
										
		                                <tr>
											<td class="label_popup_profile" width="140">
												Hợp đồng số:
											</td>
		                                    <td>
												<b>${contractNo}</b>
												<input type="hidden" id="contractNo" value="${contractNo}"/>
											</td>
										</tr>
		                                <tr>
											<td class="label_popup_profile" width="140">
												Ký ngày:
											</td>
		                                    <td>
												<b>${contractDate}</b>
												<input type="hidden" id="contractDate" value="${contractDate}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Chu kỳ thanh toán:
											</td>
											<td>
		                                    	<b>${merchantProfile.paymentPolicy}</b>
		                                    	<div style="display:none">
		                                    		<form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
		                                    	</div>
		                                    </td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Loại hợp đồng:
											</td>
											<td>
		                                        <b>${merchantProfile.contractType}</b>
		                                        <div style="display:none">
		                                        	<form:select path="contractType" items="${contractType}" class="slc_gl"/>
		                                        </div>
		                                    </td>
										</tr>
										
						   			</tbody>
						   		</table>
                				</c:if>
                				<c:if test="${isSupport || isOperator}">
                				<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="label_popup_profile" width="200">Đối tác:</td>
	                                        <td>
		                                        <b>${contractInfo.merchant}</b>
		                                        <!-- 
		                                        <input type="hidden" id="merchant" value="${contractInfo.merchant}"/>
		                                         -->
		                                        <form:select path="merchant" items="${merchants}" class="slc_gl" style="text-align:right"/>
	                                        </td>
										</tr>
										<tr>
										<td class="label_popup_profile">
											Tên đối tác:
										</td>
										<td>
											<form:input path="merchantName" value="${contractInfo.merchantName}" class="txt_reglog"/>
										</td>
									</tr>
										<tr>
											<td class="label_popup_profile">
												Email:
											</td>
											<td>
												<form:input path="email" value="${contractInfo.email}" class="txt_reglog"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Điện thoại:
											</td>
											<td>
												<form:input path="phone" value="${contractInfo.phone}" class="txt_reglog"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												CMND:
											</td>
											<td>
												<form:input path="identity" value="${contractInfo.identity}" class="txt_reglog"/>
											</td>
										</tr>
										
										<tr>
											<td class="label_popup_profile">
												CMND bản sao:
											</td>
											<td>
												<c:if test="${contractInfo.identityImage!=null}">
													<img border="0" width="250" height="167" src="<%=request.getContextPath()%>${path_identity_image}/${contractInfo.merchant}/${contractInfo.identityImage}"/>
												</c:if>
												<c:if test="${contractInfo.identityImage==null}">
													Chưa upload bản mềm CMND
												</c:if>
												<input type="file" name="file_icon" class="btn_browse"/>
											</td>
										</tr>
										
	                                <tr>
										<td class="label_popup_profile" width="140">
											Hợp đồng số:</td>
										<td>
											<form:input path="contractNo" class="txt_reglog"/>
	                                    </td>
									</tr>
									<%
										DateFormat dtFormat = new SimpleDateFormat("dd/MM/yyyy");
										Calendar calendar = Calendar.getInstance();
										int currHour = calendar.get(Calendar.HOUR_OF_DAY);
										String strDate = dtFormat.format(calendar.getTime());
									%>
	                                <tr>
										<td class="label_popup_profile" width="140">
											Ký ngày:</td>
										<td>
											<!-- 
											<input type="hidden" id="contract_date_fmt" value="${contractInfo.contract_date_fmt}"/>
											<script>
											  $(function() {
												  $('#contractDate').val($('#contract_date_fmt').val());
											  });
											</script>
											<form:input path="contractDate" class="txt_reglog" placeholder="dd/MM/yyyy" style="width: 100px; "/>
											<input type="text" id="contract_date_fmt" name="contract_date_fmt" value="" placeholder="dd/mm/yyyy" class="txt_reglog" style="width: 100px; " />
											 -->
											<form:input path="contract_date_fmt" placeholder="dd/mm/yyyy" value="<%=strDate%>" class="txt_reglog" style="width: 100px; "/>
											<script>
											  $(function() {
												  $('#contract_date_fmt').datepicker({
												        dateFormat: "dd/mm/yy",
												        altFormat: "dd/mm/yy"
												  });
											  });
											</script>
											Ví dụ: 28/08/2014
											&nbsp;&nbsp;&nbsp;<form:checkbox path="autoExtendedContract"/><b>Tự động gia hạn HĐ</b>
	                                    </td>
	                                    <!-- 
	                                    <script>
										  $(function() {
											  $('#contractDate').datepicker({
											        dateFormat: "dd/mm/yy",
											        altFormat: "dd/mm/yy"
											  });
										  });
										</script>
										 -->
									</tr>
									<tr>
										<td class="label_popup_profile">
											Chu kỳ thanh toán:
										</td>
										<td>
	                                        <form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
	                                    </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Loại hợp đồng:
										</td>
										<td>
	                                        <form:select path="contractType" items="${contractType}" class="slc_gl"/>
	                                    </td>
									</tr>
									
									<tr>
										<td class="label_popup_profile">
											Trạng thái:
										</td>
										<td>
	                                        <form:radiobutton path="status" value="actived"/><b>Kích hoạt</b>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<form:radiobutton path="status" value="inactived"/><b>Hủy kích hoạt</b>
	                                    </td>
									</tr>
						   			</tbody>
						   		</table>
						   		
						   		<!-- Thông tin thanh toán -->
						   		<p class="title-box">Thông tin thanh toán</p>
						   		<table cellpadding="5" cellspacing="0">
									<tbody>
										<!-- 
										<tr>
											<td class="label_popup_profile">
												Mã số thuế:
											</td>
											<td>
												<form:input path="taxCode" value="${contractInfo.taxCode}" class="txt_reglog"/>
											</td>
										</tr>
										 -->
										<tr>
											<td class="label_popup_profile">
												Thông tin thanh toán:
											</td>
											<td>
												<textarea id="paymentInfo" name="paymentInfo" rows="4" cols="50" placeholder="- Thông tin tài khoản - Mã số thuế - Địa chỉ đăng ký kinh doanh">${contractInfo.paymentInfo}</textarea>
											</td>
										</tr>
										
						   			</tbody>
						   		</table>
                				</c:if>
                				
                           </div>
                    	
	                      <div>
	                      	<!-- 
	                      	<input type="button" id="preview_merchant_profile" class="btn_merchant_profile_preview" value="Xem trước"/>
	                      	 -->
	                      	<input type="submit" id="form_action_save" class="btn_greensmall" value="Cập nhật"/>
	                      	<a href="<%=request.getContextPath()%>/protected/merchant_contract_manager.html" class="btn_graysmall">Hủy bỏ</a>
	                      		<script type="text/javascript">
	                      		$(document).ready(function() {
									//<!--Preview Merchant Profile-->
									$('#preview_merchant_profile').live('click', function() {
										var merchant = $("#merchant").val();
										var merchant_name = $("#merchantName").val();
										var contractNo = $("#contractNo").val();
										var contractDate = $("#contractDate").val();
										var contractType = $("#contractType").val();
										var paymentPolicy = $("#paymentPolicy").val();
										
										//popup info
										$(".popup_merchant").html(merchant);
										$(".popup_merchant_name").html(merchant_name);
										$(".popup_contractNo").html(contractNo);
										$(".popup_contract_date").html(contractDate);
										$(".popup_paymentPolicy").html(paymentPolicy);
										$(".popup_contractType").html(contractType);
										
										//CARD
										// get the unique list of classnames
										var optionTexts = [];
										$(".hd_nhamang_card").each(function() { optionTexts.push($(this).val())});
										var optionTexts1 = [];
										$(".hd_khoangtyle_card").each(function() { optionTexts1.push($(this).val())});
										
										var optionTextsDoanhThu = [];
										$(".dai_doanh_thu").each(function() { optionTextsDoanhThu.push($(this).html())});
										var optionTextsTyLe = [];
										$(".dai_ty_le").each(function() { optionTextsTyLe.push($(this).html())});
										
										var number_telco_card = $(".hd_nhamang_card").size();
										//alert(number_telco_card);
										var i;
										var html_value = "";
										for (i = 0; i < number_telco_card; ++i) {
											if(i==0)
											{
												html_value+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_card+'">';
												html_value+='<span  id="td-stt-'+i+'">CARD</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value+='</td>';
												html_value+='</tr>';
											}
											else
											{
												html_value+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value+='</td>';
												html_value+='</tr>';
											}
										}
										
										//SMS
										var optionTexts_sms = [];
										$(".hd_nhamang_sms").each(function() { optionTexts_sms.push($(this).val()) });
										var optionTexts1_sms = [];
										$(".hd_khoangtyle_sms").each(function() { optionTexts1_sms.push($(this).val()) });
										
										var optionTextsDoanhThuSMS = [];
										$(".dai_doanh_thu_sms").each(function() { optionTextsDoanhThuSMS.push($(this).html())});
										var optionTextsTyLeSMS = [];
										$(".dai_ty_le_sms").each(function() { optionTextsTyLeSMS.push($(this).html())});
										
										var number_telco_sms = $(".hd_nhamang_sms").size();
										var j;
										var html_value_sms = "";
										for (j = 0; j < number_telco_sms; ++j) {
											//alert(optionTexts[i]+'-'+optionTexts1[i]);
											if(j==0)
											{
												html_value_sms+='<tr id="row-index-'+j+'" class="popup_tr">';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_sms+'">';
												html_value_sms+='<span  id="td-stt-'+j+'">SMS</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-stt-'+j+'">'+j+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTexts_sms[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTextsDoanhThuSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span >'+optionTextsTyLeSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='</tr>';
											}
											else
											{
												html_value_sms+='<tr id="row-index-'+j+'" class="popup_tr">';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-stt-'+j+'">'+j+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTexts_sms[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTextsDoanhThuSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span >'+optionTextsTyLeSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='</tr>';
											}
										}
										
										//WAP
										var optionTexts_wap = [];
										$(".hd_nhamang_wap").each(function() { optionTexts_wap.push($(this).val()) });
										var optionTexts1_wap = [];
										$(".hd_khoangtyle_wap").each(function() { optionTexts1_wap.push($(this).val()) });
										var number_telco_wap = $(".hd_nhamang_wap").size();
										
										var optionTextsDoanhThuWAP = [];
										$(".dai_doanh_thu_wap").each(function() { optionTextsDoanhThuWAP.push($(this).html())});
										var optionTextsTyLeWAP = [];
										$(".dai_ty_le_wap").each(function() { optionTextsTyLeWAP.push($(this).html())});
										
										var z;
										var html_value_wap = "";
										for (z = 0; z < number_telco_wap; ++z) {
											if(z==0)
											{
												html_value_wap+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_wap+'">';
												html_value_wap+='<span  id="td-stt-'+z+'">WAP</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTexts_wap[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span >'+optionTextsTyLeWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='</tr>';
											}
											else
											{
												html_value_wap+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTexts_wap[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span >'+optionTextsTyLeWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='</tr>';
											}
										}
										
										$('.popup_tr').remove();
										$('#info_amount_rate_card').before(html_value+html_value_sms+html_value_wap);
										$(".merchant_profile_link").trigger("click");
										return;
									});
									//Preview Merchant Profile
	                      		});
								</script>
	                      		<div style="display:none">
	                      			<a class="sms_avai1 info_comparison_common card_invi merchant_profile_link" title="Xem thông tin Merchant" href="#merchant_profile_popup" name="merchant_profile_popup"  rel="leanModal">Xem thông tin Merchant Profile</a>
	                      		</div>
	                      </div>
						</div>
						</form:form>
						<!-- /Right Conent -->
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
	<!-- / 1PAY WEB -->
	<script type="text/javascript">
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->
	
</body>
</html>


<!-- Popup Dải tỷ lệ -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_profile_popup">
		<div class="right_content">
							<h1 class="srv_title">Merchant Profile</h1>
                			<div class="srv_row">
       	    					<table cellpadding="5" cellspacing="0">
									<tbody>
									<tr>
										<td class="label_popup_profile" width="200">Đối tác:</td>
										<td>
	                                        <span class="popup_merchant" id="popup_merchant"></span>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile" width="200">Tên đối tác:</td>
										<td>
	                                        <span class="popup_merchant_name" id="popup_merchant_name"></span>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile" width="200">Mã hợp đồng:</td>
										<td>
	                                        <span class="popup_contractNo" id="popup_contractNo"></span>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile" width="200">Ngày ký hợp đồng:</td>
										<td>
	                                        <span class="popup_contract_date" id="popup_contract_date"></span>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile" width="200">Chu kỳ thanh toán:</td>
										<td>
	                                        <span class="popup_paymentPolicy" id="popup_paymentPolicy"></span>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile" width="200">Loại hợp đồng:</td>
										<td>
	                                        <span class="popup_contractType" id="popup_contractType"></span>
                                        </td>
									</tr>
						   			</tbody>
						   		</table>
                           </div>
                           
                    	<!-- Ty le -->
                    	<div style="height: 400px; width: 770px; display: auto; overflow:scroll; border:1px solid #666666;"">
                			<table width="95%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse;">
	                       		<tr>
									<th scope="col">Dịch vụ</th>
									<th scope="col">#</th>
									<th scope="col">Nhà mạng</th>
									<th scope="col">Doanh thu(đ)</th>
									<th scope="col">Tỷ lệ(%)</th>
								</tr>
								<input type="hidden" id="info_amount_rate_card" value="0" />
                     		</table>
                     	</div>
                    	<!-- /Ty le -->
					</div>
					<div style="margin: 0 auto;">
					<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="button" style="float:right"/>
					</div>
	</div>
	<!-- / Popup Dải tỷ lệ -->