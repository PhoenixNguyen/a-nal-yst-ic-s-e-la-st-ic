<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript">
	$(function() {
	 			$('a[rel*=leanModal]').leanModal({ top : 200, closeButton: ".modal_close" });		
	});
</script>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
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

				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<jsp:include page="include_personal_bar.jsp" />
						<!-- Left Menu -->
						<%request.setAttribute("accountApi", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Sản phẩm</h1>
							
							<c:choose>
								<c:when test="${model.product != null}">
									<div class="srv_row">
										<div class="product_thumb">
											<img src="<%=request.getContextPath()%>/icon?i=${model.product.id}"
												width="150" height="150" style="border-radius: 15px;-moz-border-radius:15px;-webkit-border-radius:15px;"
												border="0" /> <!-- <a href="#" class="link_upload">Thay icon</a> -->
										</div>
		
										<div class="product_dt_title">
											<span><c:out value="${model.product.productName}" /></span>&nbsp;&nbsp;&nbsp;
											<!--  
											<a href="#product_pop" class="link_edit" name="product_pop" rel="leanModal">[Sửa]</a>
											 -->
										</div>
										<div class="product_dt_type">
											Thể loại: <strong><c:out value="${model.product.productCategory.title}" /></strong> <!-- <a href="#" class="link_edit">[Sửa]</a> -->
										</div>
										<div class="product_dt_des">
											<c:out value="${model.product.description}" /> <!-- <a class="link_edit" href="#">[Sửa]</a> -->
										</div>
										<div>
					                    	<br/>
					                    	<a target="_blank" href="http://dev.1pay.vn/mo-hinh-ket-noi"><img src ="<%=request.getContextPath() %>/images/btn_apis.png"/></a>
											<a target="_blank" href="http://dev.1pay.vn/sdk"><img src ="<%=request.getContextPath() %>/images/btn_sdk.png"/></a>
										</div>
			                    		
									</div>
									<div class="srv_row">
										<strong>Thông tin kết nối thanh toán</strong>
										<table cellpadding="10" cellspacing="0" width="100%"
											class="api_access_tbl">
											<tr>
												<td>
													<table cellpadding="4" cellspacing="0" width="100%"
														border="0">
														<tr>
															<td width="100">access_key:</td>
															<td><div id="access_key" style="font-size: 14px;"><strong><c:out value="${model.product.accessKey}" /></strong></div></td>
														</tr>
														<tr>
															<td width="100">secret:</td>
															<td><div id="secret_key" style="font-size: 14px;"><strong><c:out value="${model.product.secretKey}" /></strong></div></td>
														</tr>
														<tr>
															<td>Referers:</td>
															<td><div id="referers" style="font-size: 14px;"><strong><c:out value="${model.product.referers}" /></strong></div></td>
														</tr>
														<tr>
															<td>Activated on:</td>
															<td>
																<strong>
																<fmt:formatDate 
																	value="${model.product.activedTime}" 
																	pattern="dd-MM-yyyy HH:mm:ss" />
																</strong>
															</td>
														</tr>
														<tr>
															<td>Activated by:</td>
															<td><a href="#" style = "color:#2C8F39;"><strong><c:out value="${model.product.activedByAccount}" /></strong></a></td>
														</tr>
													</table></td>
												 <td width="200" class="feature_box">
						                        	<a href="http://dev.1pay.vn" class="link_feature">Tài liệu kết nối (APIs)</a>
						                        	<a href="#referers_pop" class="link_feature" name="referers_pop" rel="leanModal">Giới hạn truy cập</a>
						                        	<a href="#" class="link_feature" id="key_generator">Tạo key mới</a>
						                        	<div id="key_generator_temp" style="display: none;"></div>
						                        	<script type="text/javascript">
						                        		$(document).ready(function() {
						                        			$('#key_generator').live('click', function() {
						                        				if(confirm('Bạn có chắc chắn muốn tạo key mới?')) {
																	var url = '<%=request.getContextPath()%>/console/ajax.wss?a=product_key_generator&pid=${model.product.id}';
																	
																	$('#key_generator_temp').load(url, function(responseTxt,statusTxt,xhr){
																		var result = responseTxt + ''; 
																		if(result.indexOf('1')==0 && result.indexOf(',')>0) {
																			var resArr = result.split(',');
																			if(resArr.length == 3) {
																				$('#access_key').html(resArr[1]);
																				$('#secret_key').html(resArr[2]);
																				$('.go_card').attr('accesskey',resArr[1]);
																			}
																		}
																	});
																} else {
																	return false;
																}
						                        			});
						                        		});
						                        	</script>
						                        	<!--
						                            <a href="#" class="link_feature">Xóa key hiện tại</a>
						                             -->
						                        </td>
											</tr>
										</table>
									</div>
									
									<!-- CHARGING  
									<div class="active_svr">
										<c:set var="cardIconKey" value="card${model.product.id}" />
								    	<c:set var="smsIconKey" value="sms${model.product.id}" />
								    	<c:set var="wapIconKey" value="wap${model.product.id}" />
								    	<c:set var="directIconKey" value="direct${model.product.id}" />
								    	<c:set var="subIconKey" value="sub${model.product.id}" />
								    	
								    	<a class="card_${model.chargingStatusIcon[cardIconKey]} go_card go_card${model.product.id}" accesskey="${model.product.accessKey}" secretkey="${model.product.secretKey}" id="${model.product.id}" pname="${model.product.productName}"
												title="${model.statusTitle[model.chargingStatusIcon[cardIconKey]]}" href="#cardchar_pop" name="cardchar_pop" state="${model.chargingStatusIcon[cardIconKey]}" 
												${!model.isAdmin?'rel="leanModal"':((model.chargingStatusIcon[cardIconKey]=='active' || model.chargingStatusIcon[cardIconKey]=='reject' || model.chargingStatusIcon[cardIconKey]=='normal')?'rel="leanModal"':'')}>
												Card Charging</a>
												 
										<a class="sms_${model.chargingStatusIcon[smsIconKey]} go_sms go_sms${model.product.id}" id="${model.product.id}" pname="${model.product.productName}"
												title="${model.statusTitle[model.chargingStatusIcon[smsIconKey]]}" href="#smschar_pop" name="smschar_pop" state="${model.chargingStatusIcon[smsIconKey]}" 
												${!model.isAdmin?'rel="leanModal"':((model.chargingStatusIcon[smsIconKey]=='active' || model.chargingStatusIcon[smsIconKey]=='reject' || model.chargingStatusIcon[smsIconKey]=='normal')?'rel="leanModal"':'')}>
												Sms Charging</a>
												 
										<a class="wap_${model.chargingStatusIcon[wapIconKey]} go_wap go_wap${model.product.id}" accesskey="${model.product.accessKey}" secretkey="${model.product.secretKey}" id="${model.product.id}" pname="${model.product.productName}"
												title="${model.statusTitle[model.chargingStatusIcon[wapIconKey]]}" href="#wapchar_pop" name="wapchar_pop" state="${model.chargingStatusIcon[wapIconKey]}" 
												${!model.isAdmin?'rel="leanModal"':((model.chargingStatusIcon[wapIconKey]=='active' || model.chargingStatusIcon[wapIconKey]=='reject' || model.chargingStatusIcon[wapIconKey]=='normal')?'rel="leanModal"':'')}>
												Wap Charging</a>
										
										<a class="direct_${model.chargingStatusIcon[directIconKey]} go_direct go_direct${model.product.id}" 
												title="${model.statusTitle[model.chargingStatusIcon[directIconKey]]}" href="#directchar_pop" name="directchar_pop" state="${model.chargingStatusIcon[directIconKey]}" 
												${!model.isAdmin?'rel="leanModal"':((model.chargingStatusIcon[directIconKey]=='active' || model.chargingStatusIcon[directIconKey]=='reject' || model.chargingStatusIcon[directIconKey]=='normal')?'rel="leanModal"':'')}>
												Direct Charging</a>
												 
										<a class="sub_${model.chargingStatusIcon[subIconKey]} go_sub go_sub${model.product.id}" 
												title="${model.statusTitle[model.chargingStatusIcon[subIconKey]]}" href="#subchar_pop" name="subchar_pop" state="${model.chargingStatusIcon[subIconKey]}" 
												${!model.isAdmin?'rel="leanModal"':((model.chargingStatusIcon[subIconKey]=='active' || model.chargingStatusIcon[subIconKey]=='reject' || model.chargingStatusIcon[subIconKey]=='normal')?'rel="leanModal"':'')}>
												Sub Charging</a>
															 
										<div id="charging_data_temp" style="display: none;"></div>		
										<script type="text/javascript">
											$(document).ready(function() {
												$('.go_card').live('click', function() {
													if($("form[name=card_post]").length > 0) {
														$('.go_card_access_key').html($(this).attr('accesskey'));
														$('.go_card_secret_key').html($(this).attr('secretkey'));
														$('.go_card_product_name').html($(this).attr('pname'));
														$('input[name=go_card_access_key]').val($(this).attr('accesskey'));
														$('input[name=go_card_secret_key]').val($(this).attr('secretkey'));
														$('form[name=card_post] input[name=pid]').val($(this).attr('id'));
														
														if('${model.isAdmin}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=card_post] input[name=approve]').css('display', 'none');
																$('form[name=card_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=card_post] input[name=approve]').css('display', '');
																$('form[name=card_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=card_post] input[name=approve]').css('display', '');
																$('form[name=card_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=card_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=card_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isAdmin?'Sản phẩm chưa đăng ký kích hoạt card charging':'Sản phẩm đã được kích hoạt card charging'}");
														return false;
													}
												});
												$('.go_sms').live('click', function() {
													if($("form[name=sms_post]").length > 0) {
														$('.go_sms_product_name').html($(this).attr('pname'));
														var pid = $(this).attr('id');
														$('form[name=sms_post] input[name=pid]').val(pid);
														
														var url = '<%=request.getContextPath()%>/console/ajax.wss?a=get_charging_data&ct=sms&pid='+pid;
														$('#charging_data_temp').load(url, function(responseTxt,statusTxt,xhr){
															var obj = eval ("(" + responseTxt + ")");
															$("form[name=sms_post] select[name=service_number]").val(obj.service_number);
															$("form[name=sms_post] input[name=service_code]").val(obj.service_code);
															$("form[name=sms_post] input[name=mo_receive_url]").val(obj.mo_receive_url);
															$("form[name=sms_post] textarea[name=mo]").val(obj.mo);
															$("form[name=sms_post] textarea[name=mt]").val(obj.mt);
															
															var serviceNumbers = obj.service_numbers;
															$("form[name=sms_post] input[name=service_numbers]").prop('checked', false);
															$("form[name=sms_post] input[name=service_numbers]").each(function() {
																for(var i=0;i<serviceNumbers.length;i++) {
																	if($(this).attr('id').indexOf(serviceNumbers[i])>0) {
																		$(this).prop('checked', true);
																		break;
																	}
																}
															});
														});
														
														if('${model.isAdmin}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=sms_post] input[name=approve]').css('display', 'none');
																$('form[name=sms_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=sms_post] input[name=approve]').css('display', '');
																$('form[name=sms_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=sms_post] input[name=approve]').css('display', '');
																$('form[name=sms_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=sms_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=sms_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isAdmin?'Sản phẩm chưa đăng ký kích hoạt sms charging':'Sản phẩm đã được kích hoạt sms charging'}");
														return false;
													}
												});
												$('.go_wap').live('click', function() {
													if($("form[name=wap_post]").length > 0) {
														$('.go_wap_access_key').html($(this).attr('accesskey'));
														$('.go_wap_secret_key').html($(this).attr('secretkey'));
														$('.go_wap_product_name').html($(this).attr('pname'));
														$('input[name=go_wap_access_key]').val($(this).attr('accesskey'));
														$('input[name=go_wap_secret_key]').val($(this).attr('secretkey'));
														$('form[name=wap_post] input[name=pid]').val($(this).attr('id'));
														
														if('${model.isAdmin}' == 'true') {
															if($(this).attr('state') == 'active') {
																$('form[name=wap_post] input[name=approve]').css('display', 'none');
																$('form[name=wap_post] input[name=reject]').css('display', '');
															} else if($(this).attr('state') == 'reject') {
																$('form[name=wap_post] input[name=approve]').css('display', '');
																$('form[name=wap_post] input[name=reject]').css('display', 'none');
															} else {
																$('form[name=wap_post] input[name=approve]').css('display', '');
																$('form[name=wap_post] input[name=reject]').css('display', '');
															}
														} else {
															if($(this).attr('state') == 'active') {
																$('form[name=wap_post] input[name=approve]').css('display', 'none');
															} else {
																$('form[name=wap_post] input[name=approve]').css('display', '');
															}
														}
													}
													
													if("leanModal" != $(this).attr('rel')) {
														alert("${model.isAdmin?'Sản phẩm chưa đăng ký kích hoạt wap charging':'Sản phẩm đã được kích hoạt wap charging'}");
														return false;
													}
												});
											});
										</script>
									</div>
									 END CHARGING -->
									<div class="srv_row">
										<strong>Lưu ý:</strong>
										<ul>
											<li>access_key: là một xâu duy nhất cho từng sản phẩm, dùng để định danh sản phẩm khi gọi api.</li>
											<li>secret: là một xâu dùng để ký lên request khi gọi api, đối tác có tránh nhiệm giữ bí mật tham số này.</li>
										</ul>
									</div>
									
								</c:when>
								<c:otherwise>
									<div class="srv_row">
										Không có sản phẩm!
									</div>
								</c:otherwise>
							</c:choose>
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
	
	<jsp:include page="include_charging_popup.jsp" />
	
	<div id="product_pop">
		<form action="<%=request.getContextPath()%>/console/ajax.wss"
			method="post" name="product_post">
			<input type="hidden" name="a" value="product_update" />
			<input type="hidden" name="pid" value="${model.product.id}" />
			<div class="pop_box">
				<div class="product_title">
					<h1>Cập nhật sản phẩm</h1> 
				</div>
				<table cellpadding="5" cellspacing="0">
					<tbody>
						<tr class="srv_row">
							<td class="profile_label" width="140">Tên sản phẩm</td>
							<td>
								<input name="productName" id="productName" class="txt_reglog" value="${model.product.productName}" />
							</td>
						</tr>
						<tr class="srv_row">
							<td class="profile_label" width="140">Mã sản phẩm</td>
							<td>
								<input name="productCode" id="productCode" class="txt_reglog" value="${model.product.productCode}" />
							</td>
						</tr>
						<tr class="srv_row">
							<td class="profile_label">Thể loại</td>
							<td>
								<select name="productCategoryId" id="productCategoryId" class="product_filter" style="margin:0;width:auto;">
									<c:forEach var="cat" items="${model.categories}">
										<option value="${cat.id}" ${cat.id==model.product.productCategory.id?'selected="selected"':''}><c:out value="${cat.title}" /></option>
									</c:forEach>
								</select>
							</td>
						</tr>
						<tr class="srv_row">
							<td class="profile_label">Mô tả</td>
							<td>
								<!-- <textarea name="description" id="description" class="txtarea_reglog" style="height: 50px" value="" /> -->
								<textarea rows="5" cols="50" name="description" id="description" class="txtarea_reglog"><c:out value="${model.product.description}" /></textarea>
							</td>
						</tr>
						<!-- <tr class="srv_row">
							<td class="profile_label">Icon</td>
							<td>
								<input type="file" name="icon" id="icon" class="txt_reglog" style="height: 30px;" />&nbsp;
							</td>
						</tr> -->
					</tbody>
				</table>
			</div>
			<div>
				<input type="submit" name="submit" value="Cập nhật"
					class="btn_greensmall" /> <input type="reset" name="reset"
					value="Hủy" class="btn_graysmall modal_close" />
			</div>
		</form>
		<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=product_post]').submit(function() {
						$.post($(this).attr('action'), $(this).serialize(), function(json) {
								if ($.isNumeric(json)) {
									var x = parseInt(json);
									if (x == 1) {
										alert('Cập nhật sản phẩm thành công');
										
										$('.product_dt_title span').html($('form[name=product_post] input[name=productName]').val());
										$('.product_dt_type strong').html($('form[name=product_post] select[name=productCategoryId]').text());
										$('.product_dt_des').html($('form[name=product_post] textarea[name=description]').val());
										
										$('.modal_close').click();
									} else {
										alert('Cập nhật sản phẩm không thành công');
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
	
	<div id="referers_pop">
		<form action="<%=request.getContextPath()%>/console/ajax.wss"
			method="post" name="referers_post">
			<input type="hidden" name="a" value="referers_update" />
			<input type="hidden" name="pid" value="${model.product.id}" />
			<div class="pop_box">
				<div class="product_title">
					<h1>Cập nhật giới hạn truy cập</h1> 
				</div>
				<table cellpadding="5" cellspacing="0">
					<tbody>
						<tr class="srv_row">
							<td class="profile_label" width="140">Giới hạn truy cập</td>
							<td>
								<input name="referers" class="txt_reglog" value="${model.product.referers}" placeholder="127.0.0.1, 192.168.0.1" />
							</td>
						</tr>
					</tbody>
				</table>
			</div>
			<div>
				<input type="submit" name="submit" value="Cập nhật"
					class="btn_greensmall" /> <input type="reset" name="reset"
					value="Hủy" class="btn_graysmall modal_close" />
			</div>
		</form>
		<script type="text/javascript">
			$(document).ready(function() {
				$('form[name=referers_post]').submit(function() {
						$.post($(this).attr('action'), $(this).serialize(), function(json) {
								if ($.isNumeric(json)) {
									var x = parseInt(json);
									if (x == 1) {
										alert('Cập nhật giới hạn truy cập thành công');
										
										$('.api_access_tbl #referers').html($('form[name=referers_post] input[name=referers]').val());
										
										$('.modal_close').click();
									} else {
										alert('Cập nhật giới hạn truy cập không thành công');
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
