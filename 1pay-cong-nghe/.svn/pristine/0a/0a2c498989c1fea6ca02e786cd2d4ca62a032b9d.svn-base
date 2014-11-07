<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<%@ page import="java.util.List, java.util.ArrayList, java.util.Map, java.util.HashMap" %>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/top_up-min.js"></script>
<script type="text/javascript">
	TopUp.host = "<%=request.getContextPath()%>/";
  	TopUp.images_path = "images/";
  	
  	$(document).ready(function() {
  		$('#tu_overlay').live('click', function() {
  			TopUp.close();
  		});
  	});
</script>

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
</style>


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
                                    <span class="go_sms_product_name">${model.merchantContract.merchant}</span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name">
                                    	<c:if test="${model.merchantContract.merchantName!=null}">
											${model.merchantContract.merchantName}
										</c:if>
										<c:if test="${model.merchantContract.merchantName==null||model.merchantContract.merchantName==''}">
											<i class="red">Chưa có</i>
										</c:if>
                                    </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email">
                                    <a href="mailto:${model.merchantContract.email}" style="font-size: 14px;color:#2C8F39;">
										<c:if test="${model.merchantContract.email!=null}">
											${model.merchantContract.email}
										</c:if>
										<c:if test="${model.merchantContract.email==null||model.merchantContract.email==''}">
											<i class="red">Chưa có</i>
										</c:if>
									</a>
                                    </span>
                                    <!-- 
                                    <img class="status_verify_email" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png" title="Chưa xác thực"/>
                                	 -->
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name">
                                    	<c:if test="${model.merchantContract.phone!=null}">
											${model.merchantContract.phone}
										</c:if>
										<c:if test="${model.merchantContract.phone==null||model.merchantContract.phone==''}">
											<i class="red">Chưa có</i>
										</c:if>
                                    </span>
                                    <!-- 
                                    <img class="status_verify_phone" border="0" width="16" height="16" src="<%=request.getContextPath()%>/images/invalid.png"  title="Chưa xác thực"/>
                                	 -->
                                </div>
                                
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no">
                                    	<c:if test="${model.merchantContract.contractNo!=null}">
											${model.merchantContract.contractNo}
										</c:if>
										<c:if test="${model.merchantContract.contractNo==null||model.merchantContract.contractNo==''}">
											<i class="red">Chưa có</i>
										</c:if>
                                    </span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type">
							        	<c:if test="${model.merchantContract.contractType!=null}">
											${model.merchantContract.contractType}
										</c:if>
										<c:if test="${model.merchantContract.contractType==null||model.merchantContract.contractType==''}">
											<i class="red">Chưa có</i>
										</c:if>
							        </span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy">
							        	<c:if test="${model.merchantContract.paymentPolicy!=null}">
											${onepay:merchantPolicyCode2ShortText(model.merchantContract.paymentPolicy)}
										</c:if>
										<c:if test="${model.merchantContract.paymentPolicy==null||model.merchantContract.paymentPolicy==''}">
											<i class="red">Chưa có</i>
										</c:if>
							        </span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date">
                                    	<c:if test="${model.merchantContract.contract_date_fmt!=null}">
											${model.merchantContract.contract_date_fmt}
										</c:if>
										<c:if test="${model.merchantContract.contract_date_fmt==null||model.merchantContract.contract_date_fmt==''}">
											<i>Chưa có</i>
										</c:if>
                                    </span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_">
                                    	<c:if test="${model.merchantContract.expired_date_fmt!=null}">
											${model.merchantContract.expired_date_fmt}
											&nbsp;
											<c:if test="${model.merchantContract.autoExtendedContract}">
												<i class="red">(Tự động gia hạn HĐ)</i>
											</c:if>
											<c:if test="${!model.merchantContract.autoExtendedContract}">
												<i class="red">(Không tự động gia hạn HĐ)</i>
											</c:if>
										</c:if>
										<c:if test="${model.merchantContract.expired_date_fmt==null||model.merchantContract.expired_date_fmt==''}">
											<i class="red">Chưa có</i>
										</c:if>
                                    </span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy">
                                    	<c:if test="${model.merchantContract.hasHardCopy}">
											<input type="checkbox" disabled="disabled" checked="checked">
										</c:if>
										<c:if test="${!model.merchantContract.hasHardCopy}">
											<input type="checkbox" disabled="disabled">
										</c:if>
                                    </span>
                                    <span class="popup_hardcopy">
										<c:if test="${model.merchantContract.hasHardCopy}">
                                    		<span> Đã có </span>
	                                    	<c:if test="${model.merchantContract.hardContractFile!=null}">
	                                    		<a style="color:#009ce4; font-size: 14px; text-decoration: underline;" href="<%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardContractFile}">
	                                    			Tải về
	                                    		</a>
											</c:if>
										</c:if>
										<c:if test="${!model.merchantContract.hasHardCopy}">
                                    		<i style="color: #f00;"> Chưa có </i>
										</c:if>
                                    </span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Phụ lục thanh toán:</label>
                                	<div style="display: inline-block;width:250px;">
                                		<c:set var="hardCardContractFile"><%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardCardContractFile}</c:set>
                                		<c:set var="hardSmsContractFile"><%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardSmsContractFile}</c:set>
                                		<c:set var="hardWapContractFile"><%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardWapContractFile}</c:set>
                                		<c:set var="hardIacContractFile"><%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardIacContractFile}</c:set>
                                		<c:set var="hardBankContractFile"><%=request.getContextPath()%>${model.path_contract_uri}/hardcopy/${model.merchantContract.merchant}/${model.merchantContract.hardBankContractFile}</c:set>
                                		
	                                    <span style="display: inline-block;margin-right: 10px;" class="popup_hasHardCardCopy"><input type="checkbox" disabled="true"${model.merchantContract.hasHardCardCopy?' checked="checked"' : ''}> <a class="${model.merchantContract.hardCardContractFile!=null?'hard_link' : ''}" href="${model.merchantContract.hardCardContractFile!=null ? hardCardContractFile : '#'}" style="font-size: 14px;">Card</a></span>
	                                    <span style="display: inline-block;margin-right: 10px;" class="popup_hasHardSmsCopy"><input type="checkbox" disabled="true"${model.merchantContract.hasHardSmsCopy?' checked="checked"' : ''}> <a class="${model.merchantContract.hardSmsContractFile!=null?'hard_link' : ''}" href="${model.merchantContract.hardSmsContractFile!=null ? hardSmsContractFile : '#'}" style="font-size: 14px;">Sms</a></span>
	                                    <span style="display: inline-block;margin-right: 10px;" class="popup_hasHardWapCopy"><input type="checkbox" disabled="true"${model.merchantContract.hasHardWapCopy?' checked="checked"' : ''}> <a class="${model.merchantContract.hardWapContractFile!=null?'hard_link' : ''}" href="${model.merchantContract.hardWapContractFile!=null ? hardWapContractFile : '#'}" style="font-size: 14px;">Wap</a></span>
	                                    <span style="display: inline-block;margin-right: 10px;" class="popup_hasHardIacCopy"><input type="checkbox" disabled="true"${model.merchantContract.hasHardIacCopy?' checked="checked"' : ''}> <a class="${model.merchantContract.hardIacContractFile!=null?'hard_link' : ''}" href="${model.merchantContract.hardIacContractFile!=null ? hardIacContractFile : '#'}" style="font-size: 14px;">SMS Plus</a></span>
	                                    <span style="display: inline-block;" 					class="popup_hasHardBankCopy"><input type="checkbox" disabled="true"${model.merchantContract.hasHardBankCopy?' checked="checked"' : ''}> <a class="${model.merchantContract.hardBankContractFile!=null?'hard_link' : ''}" href="${model.merchantContract.hardBankContractFile!=null ? hardBankContractFile : '#'}" style="font-size: 14px;">Bank</a></span>
                                    </div>
                                </div>

                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Thời gian hiệu lực:</label>
                                	<span>
	                                	<c:set var="hasEffectiveDate" value="${model.merchantProfile.effectiveDateFmt != null && fn:length(model.merchantProfile.effectiveDateFmt) > 0}" />
                                		<c:choose>
	                                		<c:when test="${hasEffectiveDate}">
	                                			${model.merchantProfile.effectiveDateFmt}
	                                		</c:when>
	                                		<c:otherwise>
	                                			<i class="red">Chưa có</i>
	                                		</c:otherwise>
                                		</c:choose>
                                	</span>
                                </div>

                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Version:</label>
                                    <span>
                                    	<c:set var="startDateFmt" value=" (${model.merchantProfile.startDateFmt})" />
                                    	${onepay:profileVerson2Text(model.merchantProfile.version)} ${(model.merchantProfile.startDateFmt != null && fn:length(model.merchantProfile.startDateFmt) > 0) ? startDateFmt : ''}
                                    </span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Profile tham chiếu:</label>
                                    <span>
                                    	<c:if test="${model.merchantProfile != null}">
											<c:if test="${model.merchantProfile.reference != null}">
												<a href="merchant_profile_detail.html?id=${model.merchantProfile.reference}" title="Xem chi tiết profile gốc" style="color:#2C8F39; font-size: 14px;" target="blank">Chi tiết profile gốc</a>
											</c:if>
											<c:if test="${model.merchantProfile.reference == null}">
												<i class="red">Không có</i>
											</c:if>
										</c:if>
										<c:if test="${model.merchantProfile ==null}">
											<i class="red">Không có</i>
										</c:if>
                                    </span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Lý do Clone:</label>
                                    <span>
                                    	${onepay:getMerchantProfileLogs(model.merchantProfile.reference, 'manager_profile_clone_profile', pageContext.request)}
                                    </span>
                                </div>
                                
                            </div>
                            
                            <div class="w_50">
                                <!-- CMND/ĐKKD -->
                                <div class="product_slc_filter filter_row">
									<fieldset class="identity_verify_popup" style="width:360px;">
										<legend>
											<strong>
												CMND/ĐKKD &nbsp; 
												<c:if test="${model.identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!model.identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
											</strong>
										</legend>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">CMND/MSTDN: </label>
			                                    <span class="go_sms_product_name">
			                                    	<c:if test="${model.identity!=null && model.identity.identity!=null}">
																			${model.identity.identity}
																		</c:if>
																		<c:if test="${model.identity==null||model.identity.identity==null||model.identity.identity==''}">
																			<i class="red">chưa có</i>
																		</c:if>
			                                    </span>
			                                </div> 
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact"> &nbsp; </label>
												<c:if test="${model.identity.identityImage!=null}">
																			<a href="<%=request.getContextPath()%>${model.path_identity_image}/${model.merchantContract.merchant}/${model.identity.identityImage}" class="top_up" toptions="overlayClose=1, width = 600, height = 400, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, shaded=1">
																				<img border="0"  width="100" height="50" id="identity_review" src="<%=request.getContextPath()%>${model.path_identity_image}/${model.merchantContract.merchant}/${model.identity.identityImage}"/>
																			</a>
																		</c:if>
																		<c:if test="${model.identity.identityImage==null}">
																			<img border="0"  width="100" height="50" src="<%=request.getContextPath()%>/images/identity_no.jpg"/>
																		</c:if>
			                                </div>
			                                <div class="contract_content"> 
			                                	<label class="label_popup_edit_contact">Ngày cấp: </label>
			                                	<span class="go_sms_product_name">
			                                		<c:if test="${model.dateOfIssue == 'chưa có' || model.dateOfIssue == null || fn:length(model.dateOfIssue) == 0}">
																			<i class="red">chưa có</i>
																		</c:if>
																		<c:if test="${model.dateOfIssue != 'chưa có'}">
																			${model.dateOfIssue}
																		</c:if>
			                                	</span>
			                                </div>
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Nơi cấp/Địa chỉ:</label>
			                                	<span class="go_sms_product_name">
			                                		<c:if test="${model.identity!=null && model.identity.placeOfIssue!=null}">
																			${model.identity.placeOfIssue}
																		</c:if>
																		<c:if test="${model.identity==null||model.identity.placeOfIssue==null||model.identity.placeOfIssue==''}">
																			<i class="red">chưa có</i>
																		</c:if>
			                                	</span>
			                                </div> 
										</div>
									</fieldset>
								</div>
								<!-- CMND/ĐKKD -->
                                <!-- Thông tin thanh toán -->
                                 <div class="product_slc_filter filter_row">
									<fieldset class="billing_info_popup" style="width:360px;">
										<legend>
											<strong>
												Thông tin thanh toán
												<c:if test="${model.billingInformation!=null && model.billingInformation.verify=='true'}">
													<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/tick.png"/>
												</c:if>
												<c:if test="${model.billingInformation==null || model.billingInformation.verify=='false'}">
													<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/invalid.png"/>
												</c:if>
											</strong>
										</legend>
										<div style="padding: 2px;">
											<div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Hình thức thanh toán: </label>
			                                    <span class="go_sms_product_name">
			                                    	<c:if test="${model.billingInformation!=null && model.billingInformation.billing_type!=null}">
														${onepay:billingType2Text(model.billingInformation.billing_type)}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.billing_type==null|| model.billingInformation.billing_type==''}">
														<i class="red">chưa có</i>
													</c:if>
			                                    </span>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Chủ tài khoản: </label>
			                                    <span class="go_sms_product_name">
			                                    	<c:if test="${model.billingInformation!=null && model.billingInformation.bank_account_holder!=null}">
														${model.billingInformation.bank_account_holder}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_account_holder==null|| model.billingInformation.bank_account_holder==''}">
														<i class="red">chưa có</i>
													</c:if>
			                                    </span>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Số tài khoản: </label>
			                                    <span class="go_sms_product_name">
			                                    	<c:if test="${model.billingInformation!=null && model.billingInformation.bank_account_number!=null}">
														${model.billingInformation.bank_account_number}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_account_number==null|| model.billingInformation.bank_account_number==''}">
														<i class="red">chưa có</i>
													</c:if>
			                                    </span>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên ngân hàng: </label>
			                                	<span class="go_sms_product_name">
			                                		<c:if test="${model.billingInformation!=null && model.billingInformation.bank_name!=null}">
														${model.billingInformation.bank_name}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_name==null|| model.billingInformation.bank_name==''}">
														<i class="red">chưa có</i>
													</c:if>
			                                	</span>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tại tỉnh/thành phố: </label>
			                                	<span class="go_sms_product_name">
			                                		<c:if test="${model.billingInformation!=null && model.billingInformation.bank_city!=null}">
														${model.billingInformation.bank_city}
													</c:if>
													<c:if test="${model.billingInformation==null||model.billingInformation.bank_city==null|| model.billingInformation.bank_city==''}">
														<i class="red">chưa có</i>
													</c:if>
			                                	</span>
			                                </div> 
			                                <div class="contract_content">     
			                                    <label class="label_popup_edit_contact">Tên chi nhánh: </label>
			                                    <span class="go_sms_product_name">
			                                    	<c:if test="${model.billingInformation!=null && model.billingInformation.bank_branch!=null}">
														${model.billingInformation.bank_branch}
													</c:if>
													<c:if test="${model.billingInformation==null || model.billingInformation.bank_branch==null || fn:length(model.billingInformation.bank_branch) == 0}">
														<i class="red">chưa có</i>
													</c:if>
			                                    </span>
			                                </div> 
										</div>
									</fieldset>
								</div>
                                <!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                                <div class="clear"></div>
                                <!-- 
								<div class="product_title">
									<label class="label_popup_profile">Thông tin thanh toán:</label>
									<span class="go_sms_product_name">
										<c:if test="${model.merchantContract.paymentInfo!=null}">
											${model.merchantContract.paymentInfo}
										</c:if>
										<c:if test="${model.merchantContract.paymentInfo==null||model.merchantContract.paymentInfo==''}">
											<i>Chưa có</i>
										</c:if>
									</span>
								</div>
								 -->