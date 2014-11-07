<%@page import="vn.onepay.merchant.product.model.MerchantProduct"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('business_info'); });
</script>
<style>
	.product_dt_business_info, .product_dt_business_info a {font-size: 14px;}
	.product_dt_business_info a {color: #2c8f39;}
</style>
</head>

<%
	request.setAttribute("APPROVED_STATUS", 		MerchantProduct.APPROVED_STATUS);
	request.setAttribute("REJECT_STATUS", 			MerchantProduct.REJECT_STATUS);
	request.setAttribute("INIT_STATUS", 			MerchantProduct.INIT_STATUS);
	request.setAttribute("PENDING_STATUS", 			MerchantProduct.PENDING_STATUS);
	request.setAttribute("NOT_AVAIABLE_STATUS", 	MerchantProduct.NOT_AVAIABLE_STATUS);
%>

<c:set var="showBusiness" value="${account_logined.username == onepay:getOwner(model.product.merchant, pageContext.request) 
																|| account_logined.isBizSupporter()
																|| account_logined.isOperator()}" />
<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("productNavMenu",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Sản phẩm</h1>
							
							<c:choose>
								<c:when test="${model.product != null}">
									<div class="srv_row">
										<div class="product_thumb">
											<% request.setAttribute("PRODUCT_ICON_HOST", SharedConstants.PRODUCT_ICON_HOST); %>
											<img src="${PRODUCT_ICON_HOST}/${model.product.icon_path}"
												width="150" height="150" style="border-radius: 15px;-moz-border-radius:15px;-webkit-border-radius:15px;"
												border="0" /> 
												<!-- <a href="#" class="link_upload">Thay icon</a> -->
										</div>
		
										<div style="float:left;max-width:610px">		
											<div class="product_dt_title">
												<span><c:out value="${model.product.title}" /></span><span> (<c:out value="${model.product.app_code}" />)</span>&nbsp;&nbsp;&nbsp; 
												<a href="#product_pop" class="link_edit" name="product_pop" rel="leanModal">[Sửa]</a>
												<script type="text/javascript">
													$(document).ready(function() {
														$('.link_edit').live('click', function() {
															$('form[name=product_post] input[name=productName]').val($('.product_dt_title span:first').html());
															$('form[name=product_post] textarea[name=description]').val($('.product_dt_des').html().trim());
														});
													});
												</script>
											</div>
											<%-- <div class="product_dt_type">
												Thể loại: <strong><c:out value="${model.product.category}" /></strong> <!-- <a href="#" class="link_edit">[Sửa]</a> -->
											</div> --%>
											<ul style="font-size: 14px; list-style: none;padding-left: 0;">
												<li style="padding: 5px 0;">
													<strong>Merchant:</strong> <strong><c:out value="${model.product.merchant}" /> - <c:out value="${onepay:getDepartmentOfMerchant(model.product.merchant)}" /></strong>
												</li>
												<c:if test="${model.product.description != null && fn:length(fn:trim(model.product.description)) > 0}">
												<li style="padding: 5px 0;">
													<strong>Mô tả:</strong>
													<ul style="list-style: none;font-size: 14px; ">
														<li class="product_dt_des"><c:out value="${model.product.description}" /></li>
													</ul>
												</li>
												</c:if>
											</ul>
										</div>
										<div class="clear"></div>
										<br />
										<c:if test="${showBusiness}">
										<fieldset style="border: solid 1px #ccc;">
											<legend><strong>Mô tả kênh kinh doanh</strong></legend>
											<div class="product_dt_business_info">
												<c:out value="${model.product.business_info}" escapeXml="false" />
												<c:if test="${model.product.business_info == null || fn:length(fn:trim(model.product.business_info)) == 0}">
													<span style="font-style: italic;color: #999;">Chưa cập nhật</span>
												</c:if>
											</div>
										</fieldset>
										</c:if>
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
															<td width="120">Access key:</td>
															<td><div id="access_key" style="font-size: 14px;"><strong><c:out value="${model.product.access_key}" /></strong></div></td>
														</tr>
														<tr>
															<td width="120">Secret:</td>
															<td><div id="secret_key" style="font-size: 14px;"><strong><c:out value="${model.product.secret}" /></strong></div></td>
														</tr>
														<tr>
															<td>Referers:</td>
															<td><div id="referers" style="font-size: 14px;"><strong><c:out value="${model.product.referers}" /></strong></div></td>
														</tr>
														<tr>
															<td>Created on:</td>
															<td>
																<strong>
																<fmt:formatDate 
																	value="${model.product.created_time}" 
																	pattern="dd-MM-yyyy HH:mm:ss" />
																</strong>
															</td>
														</tr>
														<tr>
															<td>Last updated on:</td>
															<td>
																<strong>
																<fmt:formatDate 
																	value="${model.product.updated_time}" 
																	pattern="dd-MM-yyyy HH:mm:ss" />
																</strong>
															</td>
														</tr>
														<tr>
															<td>Activated on:</td>
															<td>
																<strong>
																<fmt:formatDate 
																	value="${model.product.actived_time}" 
																	pattern="dd-MM-yyyy HH:mm:ss" />
																</strong>
															</td>
														</tr>
														<tr>
															<td>Activated by:</td>
															<td><a href="#" style = "color:#2C8F39;"><strong><c:out value="${model.product.actived_by_account}" /></strong></a></td>
														</tr>
													</table>
												</td>
												<td width="200" class="feature_box">
						                        	<a href="http://docs.1pay.vn/doku.php?id=card-charging" class="link_feature">Tài liệu kết nối (APIs)</a>
						                        	<a href="#referers_pop" class="link_feature" name="referers_pop" rel="leanModal">Giới hạn truy cập</a>
						                        	<a href="#" class="link_feature" id="key_generator">Tạo key mới</a>
						                        	<div id="key_generator_temp" style="display: none;"></div>
						                        	<script type="text/javascript">
						                        		$(document).ready(function() {
						                        			$('#key_generator').live('click', function() {
						                        				if(confirm('Bạn có chắc chắn muốn tạo key mới?')) {
																	var url = '<%=request.getContextPath()%>/console/ajax.wss?a=product_key_generator&pid=${param.i}';
																	
																	$('#key_generator_temp').load(url, function(responseTxt,statusTxt,xhr){
																		var result = responseTxt + ''; 
																		if(result.indexOf('1')==0 && result.indexOf(',')>0) {
																			var resArr = result.split(',');
																			if(resArr.length == 3) {
																				$('#access_key').html('<strong>' + resArr[1] + '</strong>');
																				$('#secret_key').html('<strong>' + resArr[2] + '</strong>');
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
									<div class="active_svr">
										<c:set var="unameTmp" value=",${account_logined.username}," />										
										<c:forEach var="charging" items="${model.allCharging }">
								    		<c:set var="ct" value="${fn:toLowerCase(charging)}" />
								    		<c:if test="${ct != 'bank' || (ct == 'bank' && fn:contains(',hahm,thuannh,huyln,huydq,dung,hahmvn,', unameTmp) )}">
								    		<c:set var="ctIconKey" value="${ct}_${model.product.id}" />
								    		
								    		<fmt:formatDate value="${model.product.card_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    		<fmt:formatDate value="${model.product.updated_time}" var="updatedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    		<c:set var="userName" value="${model.product.card_charging.update_status_by_account}" />
								    		<c:choose>
								    			<c:when test="${ct == 'sms'}">
								    				<fmt:formatDate value="${model.product.sms_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    				<c:set var="userName" value="${model.product.sms_charging.update_status_by_account}" />
								    			</c:when>
								    			<c:when test="${ct == 'wap'}">
								    				<fmt:formatDate value="${model.product.wap_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    				<c:set var="userName" value="${model.product.wap_charging.update_status_by_account}" />
								    			</c:when>
								    			<c:when test="${ct == 'iac'}">
								    				<fmt:formatDate value="${model.product.iac_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    				<c:set var="userName" value="${model.product.iac_charging.update_status_by_account}" />
								    			</c:when>
								    			<c:when test="${ct == 'bank'}">
								    				<fmt:formatDate value="${model.product.bank_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
								    				<c:set var="userName" value="${model.product.bank_charging.update_status_by_account}" />
								    			</c:when>
								    			<c:otherwise></c:otherwise>
								    		</c:choose>
								    		<c:if test="${activedTime != null && fn:length(fn:trim(activedTime)) > 0}">
								    			<c:set var="activedTime" value=": ${activedTime}" />
								    		</c:if>
								    		<c:if test="${updatedTime != null && fn:length(fn:trim(updatedTime)) > 0}">
								    			<c:set var="updatedTime" value=": ${updatedTime}" />
								    		</c:if>
								    		<c:if test="${userName != null && fn:length(fn:trim(userName)) > 0}">
								    			<c:set var="userName" value=" bởi ${userName}" />
								    		</c:if>
								    		<a class="${ct}_${model.chargingStatusIcon[ctIconKey]} go_${ct} go_${ct}_${model.product.id}" 
								    			accesskey="${model.product.access_key}" secretkey="${model.product.secret}" 
								    			id="${model.product.id}" app_code="${model.product.app_code}" pname="${model.product.title}" title="${model.statusTitle[model.chargingStatusIcon[ctIconKey]]} ${model.chargingStatusIcon[ctIconKey]=='active'?activedTime:updatedTime} ${userName}" 
												href="#${ct}char_pop" name="${ct}char_pop" state="${model.chargingStatusIcon[ctIconKey]}"
												${!model.isStaff?'rel="leanModal"':((model.chargingStatusIcon[ctIconKey]=='active' || model.chargingStatusIcon[ctIconKey]=='reject' || model.chargingStatusIcon[ctIconKey]=='normal')?'rel="leanModal"':'')}>
												${model.statusTitle[model.chargingStatusIcon[ctIconKey]]}
											</a>
											</c:if>
								    	</c:forEach>
								    	
									</div>
									<div class="active_svr">
                   <c:if test="${model.product.sms_charging.status == 'approved' || model.product.iac_charging.status == 'approved'}">
                     <a href="product-verify-manager.wss?pid=${model.product.id }">Hậu kiểm</a>
                   </c:if>
                   </div>
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
		<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>
	
	<jsp:include page="include_popup.jsp" />
	<div id="product_pop">
		<form action="<%=request.getContextPath()%>/console/ajax.wss"
			method="post" name="product_post">
			<input type="hidden" name="a" value="product_update" />
			<input type="hidden" name="pid" value="${model.product.id}" />
			<div class="pop_box">
				<div class="product_title">
					<h1>Cập nhật sản phẩm</h1> 
				</div>
				<select name="productCategory" id="productCategory" class="product_filter" style="margin:0;width:auto;display: none;">
					<c:forEach var="cat" items="${model.categories}">
						<option value="${cat}" ${cat==model.product.category?'selected="selected"':''}><c:out value="${cat}" /></option>
					</c:forEach>
				</select>
				<table cellpadding="5" cellspacing="0">
					<tbody>
						<tr class="srv_row">
							<td class="profile_label" width="140">Tên sản phẩm (*)</td>
							<td>
								<input name="productName" id="productName" class="txt_reglog" value="${model.product.title}" placeholder="Tùy chọn" />
							</td>
						</tr>
						<%-- <tr class="srv_row">
							<td class="profile_label" width="140">Mã sản phẩm</td>
							<td>
								<input name="productCode" id="productCode" class="txt_reglog" value="${model.product.app_code}" readonly="readonly"/>
							</td>
						</tr> --%>
						<%-- <tr class="srv_row">
							<td class="profile_label">Thể loại</td>
							<td>
								<select name="productCategory" id="productCategory" class="product_filter" style="margin:0;width:auto;">
									<c:forEach var="cat" items="${model.categories}">
										<option value="${cat}" ${cat==model.product.category?'selected="selected"':''}><c:out value="${cat}" /></option>
									</c:forEach>
								</select>
							</td>
						</tr> --%>
						<tr class="srv_row">
							<td class="profile_label" valign="top">Mô tả (*)</td>
							<td>
								<!-- <textarea name="description" id="description" class="txtarea_reglog" style="height: 50px" value="" /> -->
								<textarea rows="5" cols="20" name="description" id="description" class="txtarea_reglog" style="width:345px;"><c:out value="${model.product.description}" /></textarea>
								<img id="productDesTip" src="<%=request.getContextPath() %>/images/question.png" title="Chú thích" style="vertical-align: top; margin-left: 5px;" width="16px"/>
								<style>
									.productDesTip {z-index:12000 !important;}
								</style>
								<script type="text/javascript" language="javascript">
									$.fn.qtip.zindex = 12000;
									$(document).ready(function() {
							
										$("#productDesTip").qtip({
											content: 'Mô tả theo form: <br/>'
												+'<div style="padding-left:10px;color:#fff;">Ứng dụng được sử dụng trên PC / mobile - hệ điều hành?<br />'
												+'Thu phí qua SMS số tiền? để tải / nạp / kích hoạt / mua ...</div>',										
											position : {
												corner : {
													target : 'rightMiddle',
													tooltip : 'leftMiddle'
												}
											},
											style : {
												width: {
													max: 140
												},
												name : 'cream',
												tip : 'leftMiddle',
												border : {
													width : 1,
													radius : 12,
													color : '#20942B'
												},
												color : '#fff',
												background : '#20942B',
												classes: {
													tooltip: 'productDesTip'
													}
											}
										});
									});
								</script>
							</td>
							<c:if test="${showBusiness}">
							<tr>
								<td class="profile_label" valign="top">Mô tả kênh kinh doanh</td>
								<td valign="top">
									<textarea name="business_info" id="business_info" 
										class="txtarea_reglog" style="height: 50px;width:355px;" 
										placeholder="Mô tả thông tin kinh doanh">
										<c:out value="${model.product.business_info}" />
									</textarea>
								</td>
							</tr>
							</c:if>
						</tr>
						<!-- <tr class="srv_row">
							<td class="profile_label">Icon</td>
							<td>
								<input type="file" name="icon" id="icon" class="txt_reglog" style="height: 30px;" />&nbsp;
							</td>
						</tr> -->
						<tr class="srv_row">
							<td class="profile_label">&nbsp;</td>
							<td>
								<div style="color:#f00;">(*) Thông tin bắt buộc</div>
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
				$('form[name=product_post]').submit(function() {
					if(!confirm('Bạn có chắc chắn muốn cập nhật sản phẩm?'))
						return false;
					
					if($('#business_info').length > 0)
						nicEditors.findEditor('business_info').saveContent();
					
					$.post($(this).attr('action'), $(this).serialize(), function(json) {
							if (json == '0' || json == '1') {
								if (json == '1') {
									alert('Cập nhật sản phẩm thành công');
									
									$('.product_dt_title span:first').html($('form[name=product_post] input[name=productName]').val());
									$('.product_dt_type strong').html($('form[name=product_post] select[name=productCategory]').text());
									$('.product_dt_des').html($('form[name=product_post] textarea[name=description]').val());
									if($('.product_dt_business_info').length > 0) {
										$('.product_dt_business_info').html($('form[name=product_post] textarea[name=business_info]').val());
									}
									
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
					if(!confirm('Bạn có chắc chắn muốn cập nhật giới hạn truy cập?'))
						return false;
					
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
</body>

</html>
