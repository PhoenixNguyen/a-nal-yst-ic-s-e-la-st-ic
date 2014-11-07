<%@page import="vn.onepay.account.model.Account"%>
<%@page import="vn.onepay.common.SharedConstants"%>
<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>
<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<jsp:include page="merchant-refund.css.jsp" />

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
 -->
 
 <script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
	bkLib.onDomLoaded(function() { new nicEditor().panelInstance('content_info'); });
</script>

</head>

<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
	request.setAttribute("isBizSupporter" , account.isBizSupporter());
	request.setAttribute("isOperator", account.isOperator());
	request.setAttribute("isCustomerCare", account.isCustomerCare());
%>


<body>
	<!-- 1PAY WEB -->
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("productNavMenu",true); %>
				<%request.setAttribute("menuTrangChu", true); %>
				
				<jsp:include page="header.jsp"></jsp:include>
				
				<!-- / Header -->
				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<!-- Persanal Bar -->
						<%-- <jsp:include page="include_personal_bar.jsp" /> --%>
						<!-- Left Menu -->
						<%request.setAttribute("merchantRefund", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<div class="right_content">
							<h1 class="srv_title">Hỗ trợ chăm sóc khách hàng</h1>
							
							<div class="dash_row">
								
								<div id="dash_tab" style="padding-right: 0;">
									
									<a href="merchant-refund.html?tab=all" class="tab${(param.tab==null || param.tab=='all' || param.tab=='')?'_slc':''}"><span >Tất cả (${model.totalStatus })</span></a> 
									<a href="merchant-refund.html?tab=requesting" class="tab${param.tab=='requesting'?'_slc':''}"><span title="">Đang xử lý (${model.totalSubmit })</span></a> 
									<a href="merchant-refund.html?tab=completed" class="tab${param.tab=='completed'?'_slc':''}"><span title="">Hoàn thành (${model.totalApprove })</span></a> 
									<a href="merchant-refund.html?tab=rejected" class="tab${param.tab=='rejected'?'_slc':''}"><span title="">Từ chối (${model.totalReject })</span></a>
									<%if(account.isStaff()){ %>
									<a href="<%=request.getContextPath() %>/protected/card-fuzzy-report.html" class="add_record" style="margin-right: 5px;"><span>Thẻ nghi vấn</span></a>
									<%} %>
								</div>
							</div>
							
							<div id="merchant_search" style="display: block; ">
								
								<form action="merchant-refund.html" method="get">
								
          							<jsp:include page="merchant-refund-box-filter.jsp"></jsp:include>
         						</form>
							</div>
							
							<div id="acc_log" class="srv_row">
								<c:if test="${model.list != null && model.list.size() > 0 }">
									<a href="merchant-refund.html?action=export&<%=request.getQueryString() %>" onclick="return confirm('Xuất ra file excel');" style="float: right; margin-right: 5px;" title="Xuất excel">
										<img src="<%=request.getContextPath() %>/images/export.gif" alt="" />
									</a>
								</c:if>
								<c:if test="${isBizSupporter || isOperator || isCustomerCare}">
									<a href="#add_record_popup" rel="leanmodal" class="add_record_popup add_record" style="margin-right: 15px;"><span>Lập phiếu </span></a>
								</c:if>
								
								<c:if test="${model.total > 0}">
									<span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1  } tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
								</c:if>
								<br/>
								
								<display:table name="model.list" id="item"
									requestURI="merchant-refund.html"
									pagesize="${model.pagesize}" size="model.total" partialList="true"
									style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;"
										sort="list" 
									>
									<%@ include file="display_table.jsp" %>
									
									<fmt:formatNumber maxFractionDigits="3" value="${item.amount }" var="amount"/>
									<fmt:formatNumber maxFractionDigits="3" value="${item.revenueA }" var="revenueA"/>
									<fmt:formatNumber maxFractionDigits="3" value="${item.revenue }" var="revenue"/>
								
									<fmt:formatNumber type="number" groupingUsed="false" value="${item.amount}" var="amount2"/>
									
									<fmt:formatDate value="${item.created_time }" var="created_time" pattern="dd/MM/yyyy HH:mm:ss"/>
									
									
									<c:set var="title" value="${fn:substring(item.title, 0, 34) }"/>
									<c:if test="${fn:length(item.title) > 34 }">
										<c:set var="title" value="${title} ... "/>
									</c:if>
									
									<display:column title="Merchant"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: left;" >
							    		<div style="display: block">
							    			${item.merchant }
							    			<textarea style="display: none;" id="tara${item.id }" name="tara${item.id }" rows="" cols="">${item.description }</textarea>
							    		</div>
								    </display:column>
								    
								    <display:column title="Dịch vụ / Nhà mạng"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: left;" >
							    		<div style="display: block">
							    			${item.chargingService } / ${item.telco }
							    		</div>
								    </display:column>
								    
								    <display:column title="Tiêu đề"  headerClass="transhead width200" class="svr_data1 " style="border: 1px solid #CCC; text-align: left;" >
							    		<div style="display: block" title="${item.title }">
							    			${onepay:substringTitle(item.title, 32)}
							    		</div>
								    </display:column>
								    
								    <display:column title="<span title='Doanh thu Khách hàng'>DT khách hàng</span>"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: right;" >
							    		<div style="display: block">
							    			${amount }
							    		</div>
							    		
								    </display:column>
								    
								    <%-- <display:column title="<span title='Doanh thu chia sẻ'>DT chia sẻ</span>"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: right;" >
							    		<div style="display: block">
							    			${revenueA }
							    		</div>
							    		
								    </display:column>
								    
								    <display:column title="<span title='Doanh thu merchant'>DT merchant</span>"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: right;" >
							    		<div style="display: block">
							    			${revenue }
							    		</div>
							    		
								    </display:column> --%>
								    
								    <display:column title="<span title='Giảm cộng/Giảm trừ' style='font-size: 18px;'>+/-</span>"  headerClass="transhead width20" class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
							    		<div style="display: block; font-size: 18px;">
							    			
							    			<c:if test="${item.type == 0}"><span title="Giảm trừ">-</span></c:if>
							    			<c:if test="${item.type == 1}"><span title="Giảm cộng">+</span></c:if>
							    		</div>
							    		
								    </display:column>
								    
								    <display:column title="Ngày tạo"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
							    		<div style="display: block">
							    			${created_time }
							    		</div>
							    		
								    </display:column>
								    
								    <display:column title="Trạng thái"  headerClass="transhead width50" class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
							    		<div style="display: block">
							    			
							    			<c:if test="${item.status == 0}">
							    				<a href="#request_popup" rel="leanmodal" class="request_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Khởi tạo" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/invalid.png" title="Đề nghị" alt="" />
						    					</a>
						    					<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Khởi tạo" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/invalid.png" title="Duyệt" alt="" />
							    					
						    					</a>
							    			</c:if>
							    			<c:if test="${item.status == 2}">
							    				<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đã đề nghị" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã đề nghị" alt="" />
						    					</a>
							    				<a href="#approve_popup" rel="leanmodal" class="approve_popup" id="${item.id}"
							    					
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đề nghị" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/invalid.png" title="Duyệt" alt="" />
						    					</a>
							    			</c:if>
							    			
							    			<c:if test="${item.status == 4}">
							    				<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đã đề nghị" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã đề nghị" alt="" />
						    					</a>
						    					<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đã duyệt" 
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã duyệt" alt="" />
						    					</a>
							    			</c:if>
							    			
							    			<c:if test="${item.status == 1}">
							    				<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đã từ chối" status2="${item.status}" reason="${item.reject_reason}"
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					
							    					<img src="<%=request.getContextPath() %>/images/tick.png" title="Đã duyệt" alt="" />
						    					</a>
						    					
						    					<a href="#info_popup" rel="leanmodal" class="info_popup" id="${item.id}"
							    					merchant="${item.merchant }" service="${item.chargingService } / ${item.telco }" 
							    					amount="${amount }" created_time="${created_time }" status="Đã từ chối" status2="${item.status}" reason="${item.reject_reason}"
							    					type="${item.type}" title="${item.title}" provider= "${item.provider}"
							    					amount2="${amount2 }"
							    					>
							    					<img src="<%=request.getContextPath() %>/images/com_reject.png" title="Đã từ chối" alt="" />
						    					</a>
							    			</c:if>
							    		</div>
								    </display:column>
								    
								    <display:column title="Hành động"  headerClass="transhead width60" class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
							    		<div style="display: block">
							    			
							    			<a href="merchant-refund-detail.html?id=${item.id}"><img src="<%=request.getContextPath() %>/images/detail.png" title="Xem chi tiết" alt="" /></a>
							    			
							    			<c:choose>
							    				<c:when test="${(item.status == 0 && (isBizSupporter || isOperator || isCustomerCare)) ||
							    								(item.status == 2 && (isBizSupporter || isOperator)) ||
							    								(item.status == 4 && (isBizSupporter || isOperator)) ||
							    								(item.status == 1 && (isBizSupporter || isOperator || isCustomerCare))
							    								
							    								}">
			    								
									    			<c:if test="${item.status == 0 && (isBizSupporter || isOperator || isCustomerCare)}">
										    			
										    			<a href="#add_record_popup" rel="leanmodal" class="edit_record_popup"
										    				id="${item.id}" merchant="${item.merchant}" service="${item.chargingService}" 
										    				telco="${item.telco}" amount="${amount2}" 
										    				type="${item.type}" title="${item.title}" provider= "${item.provider}"
									    				>
										    				<img src="<%=request.getContextPath() %>/images/editComparison.png" title="Sửa" alt="" />
									    				</a>
										    			<a href="javascript:void(0);" class="delete_record" id="${item.id}"><img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa" alt="" /></a>
									    			</c:if>
									    			<c:if test="${item.status == 2 && (isBizSupporter || isOperator)}">
										    			<fmt:formatNumber type="number" groupingUsed="false" value="${item.amount}" var="amount2"/>
										    			<a href="#add_record_popup" rel="leanmodal" class="edit_record_popup"
										    				id="${item.id}" merchant="${item.merchant}" service="${item.chargingService}" 
										    				telco="${item.telco}" amount="${amount2}" 
										    				type="${item.type}" title="${item.title}" provider= "${item.provider}"
									    				>
										    				<img src="<%=request.getContextPath() %>/images/editComparison.png" title="Sửa" alt="" />
									    				</a>
										    			<a href="javascript:void(0);" onclick="alert('Chỉ xóa được ở trạng thái khởi tạo')"><img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa" alt="" /></a>
									    			</c:if>
									    			<c:if test="${item.status == 4 && (isBizSupporter || isOperator)}">
										    			<a href="javascript:void(0);" onclick="alert('Chỉ sửa được ở trạng thái khởi tạo hoặc đề nghị')"
									    				>
										    				<img src="<%=request.getContextPath() %>/images/editComparison.png" title="Sửa" alt="" />
									    				</a>
										    			<a href="javascript:void(0);" onclick="alert('Chỉ xóa được ở trạng thái khởi tạo')"><img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa" alt="" /></a>
									    			</c:if>
									    			<c:if test="${item.status == 1}">
										    			<a href="javascript:void(0);" onclick="alert('Chỉ sửa được ở trạng thái khởi tạo hoặc đề nghị')"
									    				>
										    				<img src="<%=request.getContextPath() %>/images/editComparison.png" title="Sửa" alt="" />
									    				</a>
										    			<a href="javascript:void(0);" onclick="alert('Chỉ xóa được ở trạng thái khởi tạo')"><img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa" alt="" /></a>
									    			</c:if>
									    			
								    			</c:when>
								    			
								    			<c:otherwise>
								    				<a href="javascript:void(0);" onclick="alert('Bạn không có quyền sửa phiếu')"
									    				>
										    				<img src="<%=request.getContextPath() %>/images/editComparison.png" title="Sửa" alt="" />
									    				</a>
										    			<a href="javascript:void(0);" onclick="alert('Bạn không có quyền xóa phiếu')"><img src="<%=request.getContextPath() %>/images/cross.png" title="Xóa" alt="" /></a>
								    			</c:otherwise>
							    			</c:choose>
							    		</div>
								    </display:column>
								    
								</display:table>
							</div>
							
							<%-- <c:out  value="${item.value}" escapeXml="true"/> --%>
							<script type="text/javascript">
								//Delete record
								$(document).ready(function(){
									$('.delete_record').live('click' , function(){
										if(!confirm('Bạn có chắc chắn?'))
											return false;
										
										var id = $(this).attr("id");
										
										var action = "DELETE";
										$.ajax({
											type : "get",
											url  : "merchant-refund-ajax.html",
											data : "action=" + action + "&id=" + id,
											success : function(data){
												console.log("DATA: " + data);
												if(data == "1"){
													alert("Xóa phiếu chăm sóc khách hàng thành công.");
													$(location).attr('href', location.href);
												}else if(data == "0"){
													alert("Xóa lỗi! Chỉ có thể xóa phiếu CSKH ở trạng thái khởi tạo");
												}
											}
										
										});
										
										return false;
									});
								});
							</script>
							
							<!-- Add and Edit popup -->
							<jsp:include page="merchant-refund-add-edit-popup.jsp" />
							<!-- / Add and Edit popup -->
							
							
							<script type="text/javascript">
								$(document).ready(function(){
									// =============INFO==============
									
									//push values
									function pushValues(a , popup){
										var id = $(a).attr('id');
										$('#'+popup+' .request_record').attr('id', id);
										
										//push value
										$('#'+popup+' .merchant').html($(a).attr('merchant'));
										$('#'+popup+' .service').html($(a).attr('service'));
										$('#'+popup+' .amount').html($(a).attr('amount'));
										$('#'+popup+' .created_time').html($(a).attr('created_time'));
										$('#'+popup+' .status').html($(a).attr('status'));
										
										var type = $(a).attr('type');
										var typeHtml = $('#'+popup+' .type');
										if(type == 0){
											typeHtml.html('Giảm trừ');
											typeHtml.attr('title', 'Giảm trừ');
										}
										if(type == 1){
											typeHtml.html('Giảm cộng');
											typeHtml.attr('title', 'Giảm cộng');
										}
										
										$('#'+popup+' .title').html($(a).attr('title'));
										$('#'+popup+' .provider').html($(a).attr('provider'));
										
										$('#'+popup+' .content').html($('#tara'+id+'').val());
									}
									$('.info_popup').live('click', function(){
										var tr_reason = $('#info_popup table .tr_reason');
										
										tr_reason.html('');
										
										//push values
										pushValues(this, 'info_popup');
										
										if($(this).attr('status2') == "1"){
											
											var tr = '<tr class="tr_reason"><td class="text_al_right ">Lý do:</td><td><span class="content_left status" style="margin-bottom: 10px;">'+$(this).attr('reason')+'</span></td></tr>';
											$('#info_popup .info_tb .status2').after(tr);
										}
										
									});
									// =============END INFO==============
											
									// =============REQUEST==============
									$('.request_popup').live('click', function(){
										
										var id = $(this).attr('id');
										$('#request_popup .request_record').attr('id', id);
										
										var amount = $(this).attr('amount2');
										$('#request_popup .request_record').attr('amount', amount);
										
										//push values
										pushValues(this, 'request_popup');
										
										$('#request_popup input[name=request]').removeAttr('checked');
									});
									
									//request
									$('#request_popup .request_record').live('click', function(){
										var isCustomerCare = '<c:out value = "${isCustomerCare }"/>';
										var isOperator = '<c:out value = "${isOperator }"/>';
										var isBizSupporter = '<c:out value = "${isBizSupporter }"/>';
										
										console.log(isCustomerCare);
			    						if(isCustomerCare == 'false' && isOperator == 'false' && isBizSupporter == 'false'){
			    							alert('Bạn không có quyền đề nghị.');
			    							return;
			    						}
			    						
										if(!$('#request_popup input[name=request]').is(":checked")){
											alert('Bạn chưa đọc nội dung.');
											return;
										}
											
										handleUpdateStatus(this);
										return false;
									});
									// =============END REQUEST==============
										
									// =============APPROVE==============
									$('.approve_popup').live('click', function(){
										
										var id = $(this).attr('id');
										$('#approve_popup .approve_record').attr('id', id);
										$('#approve_popup .reject_record').attr('id', id);
										
										var amount = $(this).attr('amount2');
										
										$('#approve_popup .reject_record').attr('amount', amount);
										$('#approve_popup .approve_record').attr('amount', amount);
										
										//push values
										pushValues(this, 'approve_popup');
										
										$('#approve_popup input[name=request]').removeAttr('checked');
									});
									
									//approve
									$('#approve_popup .approve_record').live('click', function(){
										//alert($(this).attr('amount'));
										var isOperator = '<c:out value = "${isOperator }"/>';
										var isBizSupporter = '<c:out value = "${isBizSupporter }"/>';
										
										console.log(isOperator +" " + isBizSupporter);
										
			    						if(isOperator == 'false' && isBizSupporter == 'false'){
			    							alert('Bạn không có quyền duyệt.');
			    							return;
			    						}
			    						
										if(!$('#approve_popup input[name=request]').is(":checked")){
											alert('Bạn chưa đọc nội dung.');
											return;
										}
										
										handleUpdateStatus(this);
										return false;
									});
									//reject approve
									$('#approve_popup .reject_record').live('click', function(){
										//alert($(this).attr('amount'));
										
										var isOperator = '<c:out value = "${isOperator }"/>';
										var isBizSupporter = '<c:out value = "${isBizSupporter }"/>';
										
										console.log(isOperator +" " + isBizSupporter);
										
			    						if(isOperator == 'false' && isBizSupporter == 'false'){
			    							alert('Bạn không có quyền từ chối.');
			    							return;
			    						}
			    						
										if($('#approve_popup textarea[name=reason]').val() == ""){
											alert('Hãy nhập lý do từ chối.');
											return;
										}
										
										if(!$('#approve_popup input[name=request]').is(":checked")){
											alert('Bạn chưa đọc nội dung.');
											return;
										}
										
										handleUpdateStatus(this);
										return false;
									});
									
									// =============END APPROVE==============
										
									function handleUpdateStatus(a){
										if(!confirm('Bạn có chắc chắn? '))
											return false;
										
										var status = $(a).attr('status');
										var id = $(a).attr('id');
										
										var amount = $(a).attr('amount');
										//alert(amount);
										/* if(parseInt(amount) == 'NaN' || parseInt(amount) <= 0){
											alert('Doanh thu khách hàng phải > 0');
											return;
										} */
										
										var reason = $('textarea[name=reason]').val();
										console.log('reason1: ' + reason);
										reason == "undefine"?"":reason;
										console.log('reason2: ' + reason);
										
										var action = "UPDATE_STATUS";
										$.ajax({
											type : "post",
											url  : "merchant-refund-ajax.html",
											data : "action=" + action + "&id=" + id + "&status=" + status +"&reason="+reason +"&amount="+amount,
											success : function(data){
												//console.log("DATA: " + data);
												alert(data);
												
												if(data.indexOf('thành công') != -1)
													$(location).attr('href', location.href);
												
											}
										
										});
									}
								});
							</script>
							
							<div id="info_popup">
								
								<jsp:include page="merchant-refund-info-tb.jsp" />
								<table align="center">
									<tr>
										<td colspan="3">
											<input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
										</td>
									</tr>
								</table>
								
							</div>
							
							<div id="request_popup">
								<jsp:include page="merchant-refund-info-tb.jsp" />
								
								<br/>
								<span style="text-align: center;" class="confirm">
									<input type="checkbox" name="request"/> <span style="color: red;">(*) Đã đọc kỹ nội dung</span>
								</span>
								
								<table align="center" class="tool">
									<tr>
											
										<td colspan="3">
											<a href="javascript:void(0);" class="request_record btn_greensmall " style="width: 80px;" status="2">Đề nghị</a>
											<input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
											
										</td>
									</tr>
								</table>
							</div>
							
							<div id="approve_popup">
								<jsp:include page="merchant-refund-info-tb.jsp" />
								
								<br/>
								<b>Lý do từ chối:</b><br/>
								<textarea class="textarea_style" name="reason" rows="4" cols="" placeholder="Nhập lý do" ></textarea>
								<br/>
								<input type="checkbox" name="request"/> <span style="color: red;">(*) Đã đọc kỹ nội dung</span>
								
								<table align="center">
									<tr>
										
										<td colspan="3">
											<a href="javascript:void(0);" class="approve_record btn_greensmall " style="width: 80px;" status="4">Duyệt</a>
											<a href="javascript:void(0);" class="reject_record btn_greensmall" style="width: 80px;" status="1">Từ chối</a>
											<input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
											
										</td>
									</tr>
								</table>
							</div>
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
	<!-- / 1PAY WEB -->
</body>
</html>
