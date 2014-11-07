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

<jsp:include page="product_verify_manager.css.jsp" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.datetimepicker.css"/>
<script src="<%=request.getContextPath() %>/js/jquery.datetimepicker.js"></script>

<!-- <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.1/jquery.js"></script>
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/jquery-ui.min.js"></script>
<link rel="stylesheet" type="text/css" media="screen" href="http://ajax.googleapis.com/ajax/libs/jqueryui/1.7.2/themes/base/jquery-ui.css">
 -->
<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
  bkLib.onDomLoaded(function() { new nicEditor().panelInstance('content_info'); });
  $(function(){
		$( "#expired_time" ).datetimepicker({
				format: 'd/m/Y H:i',
				lang: 'vi',
				minDate:0,
				style: 'z-index:99999',
		});
	});
</script>

</head>

<%
  Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
  //init
  request.setAttribute("isBizSupporter" , account.isBizSupporter());
  //suggest
  request.setAttribute("isBizStaff" , account.isBizStaff());
  //approve
  request.setAttribute("isBizSupportManager", account.isBizSupportManager());
  //all
  request.setAttribute("isOperator", account.isOperator());
  
  request.setAttribute("attachmentPath", SharedConstants.UPLOAD_ADDRESS + "/product_verify/");
  
%>

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
            <!-- Persanal Bar -->
            <%-- <jsp:include page="include_personal_bar.jsp" /> --%>
            <!-- Left Menu -->
            <%request.setAttribute("productVerify", true);%>
            <jsp:include page="left_menu.jsp" />
            
            <div class="right_content">
              <h1 class="srv_title">Hậu kiểm sản phẩm</h1>
              <c:if test="${model.merchantProduct != null}">
              <div class="product_thumb">
					<% request.setAttribute("PRODUCT_ICON_HOST", SharedConstants.PRODUCT_ICON_HOST); %>
					<img src="${PRODUCT_ICON_HOST}/${model.merchantProduct.icon_path}"
						width="150" height="150" style="border-radius: 15px;-moz-border-radius:15px;-webkit-border-radius:15px;"
						border="0" /> 
				</div>
		
				<div style="float:left;max-width:610px">		
					<div class="product_dt_title">
						<span><c:out value="${model.merchantProduct.title}" /></span><span> (<c:out value="${model.merchantProduct.app_code}" />)</span>&nbsp;&nbsp;&nbsp; 
					</div>
					<ul style="font-size: 14px; list-style: none;padding-left: 0;">
						<li style="padding: 5px 0;">
							<strong>Merchant:</strong> <strong><c:out value="${model.merchantProduct.merchant}" /> - <c:out value="${onepay:getDepartmentOfMerchant(model.merchantProduct.merchant)}" /></strong>
						</li>
						<c:if test="${model.merchantProduct.description != null && fn:length(fn:trim(model.merchantProduct.description)) > 0}">
						<li style="padding: 5px 0;">
							<strong>Mô tả:</strong>
							<ul style="list-style: none;font-size: 14px; ">
								<li class="product_dt_des"><c:out value="${model.merchantProduct.description}" /></li>
							</ul>
						</li>
						</c:if>
						<li style="padding: 5px 0;">
							<div class="active_svr">
								<c:set var="unameTmp" value=",${account_logined.username}," />
								<%
									request.setAttribute("ALL_ACTIVED_CHARGING_SERVICES", SharedConstants.ALL_ACTIVED_CHARGING_SERVICES);
									request.setAttribute("PRODUCT_CHARGING_STATUS_CLASS", SharedConstants.PRODUCT_CHARGING_STATUS_CLASS);
								%>										
								<c:forEach var="charging" items="${ALL_ACTIVED_CHARGING_SERVICES}">
						    		<c:set var="ct" value="${fn:toLowerCase(charging)}" />
						    		<c:if test="${ct != 'bank' || (ct == 'bank' && fn:contains(',hahm,thuannh,huyln,huydq,dung,hahmvn,', unameTmp) )}">
						    		<c:set var="ctIconKey" value="${ct}_${model.merchantProduct.id}" />
						    		
						    		<fmt:formatDate value="${model.merchantProduct.card_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    		<fmt:formatDate value="${model.merchantProduct.updated_time}" var="updatedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    		<c:set var="userName" value="${model.merchantProduct.card_charging.update_status_by_account}" />
						    		<c:choose>
						    			<c:when test="${ct == 'sms'}">
						    				<fmt:formatDate value="${model.merchantProduct.sms_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    				<c:set var="userName" value="${model.merchantProduct.sms_charging.update_status_by_account}" />
						    			</c:when>
						    			<c:when test="${ct == 'wap'}">
						    				<fmt:formatDate value="${model.merchantProduct.wap_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    				<c:set var="userName" value="${model.merchantProduct.wap_charging.update_status_by_account}" />
						    			</c:when>
						    			<c:when test="${ct == 'iac'}">
						    				<fmt:formatDate value="${model.merchantProduct.iac_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    				<c:set var="userName" value="${model.merchantProduct.iac_charging.update_status_by_account}" />
						    			</c:when>
						    			<c:when test="${ct == 'bank'}">
						    				<fmt:formatDate value="${model.merchantProduct.bank_charging.actived_time}" var="activedTime" pattern="dd/MM/yyyy HH:mm:ss" />
						    				<c:set var="userName" value="${model.merchantProduct.bank_charging.update_status_by_account}" />
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
						    		<a class="${ct}_${model.chargingStatusIcon[ctIconKey]} go_${ct} go_${ct}_${model.merchantProduct.id}" 
						    			accesskey="${model.merchantProduct.access_key}" secretkey="${model.merchantProduct.secret}" 
						    			id="${model.merchantProduct.id}" app_code="${model.merchantProduct.app_code}" pname="${model.merchantProduct.title}" title="${model.statusTitle[model.chargingStatusIcon[ctIconKey]]} ${model.chargingStatusIcon[ctIconKey]=='active'?activedTime:updatedTime} ${userName}" 
										href="#${ct}char_pop" name="${ct}char_pop" state="${model.chargingStatusIcon[ctIconKey]}"
										${!model.isStaff?'rel="leanModal"':((model.chargingStatusIcon[ctIconKey]=='active' || model.chargingStatusIcon[ctIconKey]=='reject' || model.chargingStatusIcon[ctIconKey]=='normal')?'rel="leanModal"':'')}>
										${model.statusTitle[model.chargingStatusIcon[ctIconKey]]}
									</a>
									</c:if>
						    	</c:forEach>
						    	<jsp:include page="include_popup.jsp" />
							</div>
						</li>
						<li style="padding: 5px 0;">
							<strong>Tình trạng hậu kiểm:</strong>
							<c:choose>
								<c:when test="${model.list == null || fn:length(model.list) == 0 }">
									<span style="color:#f00;">Chưa có</span>
								</c:when>
								<c:otherwise>
									<c:set var="maxVerItem" value="${model.list[0]}"/>
									<c:if test="${maxVerItem.status == 4}">
										<%
											request.setAttribute("now", new Date());
										%>
										<c:if test="${maxVerItem.expired_date.time >= now.time}"><span style="color:#2C8F39;">Còn hạn</span></c:if>
										<c:if test="${maxVerItem.expired_date.time < now.time}"><span style="color:#f00;">Hết hạn</span></c:if>
									</c:if>
									<c:if test="${maxVerItem.status < 4}">
										<span style="color:#f00;">Chưa có</span>
									</c:if>
								</c:otherwise>
							</c:choose>
						</li>
					</ul>
				</div>
				<div class="clear"></div>
				<br />
				</c:if>
              <div id="acc_log" class="srv_row">
              	<c:set value="0" var="valid"/>
              	<c:forEach items="${model.chargingStatus }" var="item">
                 	<c:if test="${item.value == 'approved'}">
                 		<c:set value="${valid + 1 }" var="valid"/>
                 	</c:if>
                 	
                 </c:forEach>
              	<c:choose>
              		<c:when test="${(!isBizSupporter && !isBizSupportManager && !isOperator) || (valid == 0)}">
              			<span><i>Sản phẩm không đủ điều kiện hậu kiểm</i></span>
              		</c:when>
              		<c:otherwise>
              			<div class="dash_row">
			                <div id="dash_tab" style="padding-right: 0;">
			                  <c:forEach items="${model.chargingStatus }" var="item">
			                  	<c:if test="${item.value == 'approved'}">
			                  		<a href="product-verify-manager.wss?tab=${item.key}&pid=${param.pid }" class="tab${(((param.tab == null || param.tab =='') && item.key=='SMS') || param.tab==item.key)?'_slc':''}"><span >${onepay:chargingServiceCode2Text(item.key)}</span></a>
			                  	</c:if>
			                  </c:forEach>
			                  
			                  <c:if test="${(isBizSupporter || isBizSupportManager || isOperator) && (valid > 0)}">
		              			<a href="#add_edit_popup" rel="leanmodal" class="add_edit_popup add_record" style="margin-right: 15px;">
				                  	<span>Lập phiếu </span>
				                  </a>
		              		  </c:if>
			                </div>
			                
		                </div>
		                
		                <c:if test="${model.total > 0}">
		                  <span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1  } tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. </span>
		                </c:if>
		                <br/>
		                <display:table name="model.list" id="item"
		                  requestURI="product-verify-manager.wss"
		                  pagesize="${model.pagesize}" size="model.total" partialList="true"
		                  style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;margin-bottom:10px;border-top:none;"
		                    sort="list" 
		                  >
		                  <%@ include file="display_table.jsp" %>
		                  
		                  <c:set var="version" value="1.${item.version }"/>
		                  <fmt:formatDate value="${item.expired_date }" var="expired_date" pattern="dd/MM/yyyy HH:mm"/>
		                  <fmt:formatDate value="${item.created_date }" var="created_time" pattern="dd/MM/yyyy HH:mm:ss"/>
		                  
		                  <display:column title="STT"  headerClass="transhead width30" class="svr_data1 " style="border: 1px solid #CCC; text-align: right;" >
		                      <div style="display: block">
		                        ${item_rowNum }.
		                      </div>
		                   </display:column>
		                   
		                  <display:column title="Tiêu đề"  headerClass="transhead width120" class="svr_data1 " style="border: 1px solid #CCC; text-align: left;" >
		                      <div style="display: block">
		                      	${item.title }
		                      </div>
		                   </display:column>
		                   
		                  <display:column title="Phiên bản"  headerClass="transhead width80" class="svr_data1 " style="border: 1px solid #CCC; text-align: center;" >
		                      <div style="display: block">
		                      	${version }
		                      </div>
		                   </display:column>
		                    
		                  <display:column title="Ngày tạo"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
		                      <div style="display: block">
		                      	${created_time }
		                      </div>
		                    </display:column>
		                    
		                  <display:column title="Ngày hết hạn"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
		                      <div style="display: block">
		                      	${expired_date }
		                      </div>
		                    </display:column>

		                    <display:column title="Trạng thái"  headerClass="transhead " class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
		                      <div style="display: block">
		                      	 <jsp:include page="product_verify_manager_status_node.jsp" >
		                      	 	<jsp:param  value="${item.status }" name="status"/>
		                      	 	<jsp:param  value="${item.app_code }" name="app_code"/>
		                      	 	<jsp:param  value="${item.charging_type }" name="charging_type"/>
		                      	 	<jsp:param  value="${version }" name="version"/>
		                      	 	<jsp:param  value="${expired_date }" name="expired_date"/>
		                      	 	<jsp:param  value="${item.title }" name="title"/>
		                      	 	<jsp:param  value="${item.description }" name="description"/>
		                      	 	<jsp:param  value="${item.bizz_channel }" name="bizz_channel"/>
		                      	 	<jsp:param  value="${item.id }" name="id"/>
			                      	<jsp:param  value="${item.reject_reason }" name="reason"/>	
		                      	 </jsp:include>
		                      	 
		                      </div>
		                    </display:column>
		                    
		                    <display:column title="Hành động"  headerClass="transhead width80" class="svr_data1" style="border: 1px solid #CCC; text-align: center;" >
		                      <div style="display: block">
			                    <a href="#detail_popup" rel="leanmodal" class="detail_popup"
			                    	app_code="${item.app_code }" charging_type="${item.charging_type }" version="${version }" 
		                      		created_time="${created_time }" expired_date="${expired_date }" title1="${item.title }" 
		                      		description="${item.description }" bizz_channel="${item.bizz_channel }"
		                      		id="${item.id }" status="${item.status }" reason="${item.reject_reason }"
			                    >
			                    	<c:forEach items="${item.list_attachment }" var="att">
			                    		
			                    		<textarea name="textarea${item.id }" style="display: none;">${att }</textarea>
			                    	</c:forEach>
			                      	<img src="<%=request.getContextPath() %>/images/detail.png" alt="" title="Xem chi tiết" />
			                    </a>
			                    
		                      	<c:if test="${item.status == 4 }">
						    	<a href="product-verify-manager-ajax.wss?id=${item.id }&action=CLONE" class="clone">
						    		<img src="<%=request.getContextPath() %>/images/edit-copy.png" alt="" title="Clone" style="width:18px" />
						    	</a>
						    	</c:if>
						    	
		                      	<c:choose>
		                      		<c:when test="${item.status == 4 ||  item.status == 1 || item.status == 3}">
		                      			<a href="javascript:void(0)" onclick="alert('Chỉ sửa được ở trạng thái khởi tạo hoặc đề nghị');">
			                      			<img src="<%=request.getContextPath() %>/images/edit.png" alt="" title="Không thể sửa" />
			                      		</a>
		                      		</c:when>
		                      		
		                      		<c:otherwise>
		                      			<c:choose>
		                      				<c:when test="${isBizSupporter == true || isBizSupportManager == true || isOperator == true}">
		                      					<a href="#add_edit_popup" rel="leanmodal" class="edit_popup"
						                      		app_code="${item.app_code }" charging_type="${item.charging_type }" version="${version }" 
						                      		expired_date="${expired_date }" title1="${item.title }" 
						                      		description="${item.description }" bizz_channel="${item.bizz_channel }"
						                      		id="${item.id }"
						                      		>
						                      		<img src="<%=request.getContextPath() %>/images/edit.png" alt="" title="Sửa" />
						                    	</a>
		                      				</c:when>
		                      				<c:otherwise>
		                      					<a href="javascript:void(0)" onclick="alert('Bạn không có quyền sửa hậu kiểm!');">
					                      			<img src="<%=request.getContextPath() %>/images/edit.png" alt="" title="Không thể sửa" />
					                      		</a>
		                      				</c:otherwise>
		                    			</c:choose>
		                      			
		                      		</c:otherwise>
		                      	</c:choose>
		                      	
		                      </div>
		                      
		                    </display:column>
		                    
		                </display:table>
              		</c:otherwise>
              	</c:choose>
                
              </div>
              
              <script type="text/javascript">
              	$(document).ready(function(){
              		$('.clone').live('click', function(){
              			var href = $(this).attr('href');
              			if(!confirm('Bạn có chắc chắn Clone phiếu hậu kiểm?'))
              				return false;
              			
              			$.ajax({
             				type : 'get',
             				url : href,
             				data : $(this).serializeArray(),
             				success : function(data){
             					alert(data);
             					if(data.indexOf('thành công') != -1)
             						location.reload();
             				}
             			});
             			return false;
              		});
              		
              		$('.add_edit_popup').live('click', function(){
              			//reset
            			$('#add_edit_popup form[name=add_edit]').trigger('reset');
            			$('#add_edit_popup .record_title').html('Lập phiếu hậu kiểm');
              			$('#add_edit_popup input[name=submit_record]').val('Tạo mới');
              			
              			$('#add_edit_popup form[name=add_edit] input[name=id]').val('');
              			
              			var currVersion = '<c:out value="${model.currVersion}"/>';
              			$('#add_edit_popup form[name=add_edit] .version').html(currVersion);
              			
              			$('#add_edit_popup form[name=add_edit] .charging_type').html('');
              			$('#add_edit_popup form[name=add_edit] select[name=charging_type]').css('display', 'block');
              		});
              		
              		//edit 
              		$('.edit_popup').live('click', function(){
              			//reset
              			$('#add_edit_popup form[name=add_edit]').trigger('reset');
              			$('#add_edit_popup .record_title').html('Sửa phiếu hậu kiểm');
              			$('#add_edit_popup input[name=submit_record]').val('Cập nhật');
              			
              			//init
              			$('#add_edit_popup form[name=add_edit] input[name=id]').val($(this).attr('id'));
              			
              			$('#add_edit_popup form[name=add_edit] input[name=app_code]').val($(this).attr('app_code'));
              			
              			$('#add_edit_popup form[name=add_edit] select[name=charging_type]').css('display', 'none');
              			$('#add_edit_popup form[name=add_edit] select[name=charging_type]').val($(this).attr('charging_type'));
              			$('#add_edit_popup form[name=add_edit] .charging_type').html(': '+$(this).attr('charging_type'));
              			
              			$('#add_edit_popup form[name=add_edit] .version').html($(this).attr('version'));
              			
              			$('#add_edit_popup form[name=add_edit] input[name=expired_date]').val($(this).attr('expired_date'));
              			$('#add_edit_popup form[name=add_edit] input[name=title]').val($(this).attr('title1'));
              			$('#add_edit_popup form[name=add_edit] textarea[name=description]').val($(this).attr('description'));
              			$('#add_edit_popup form[name=add_edit] input[name=bizz_channel]').val($(this).attr('bizz_channel'));
              		});
              		
              		function getDoc(frame) {
					    var doc = null;
					
					    // IE8 cascading access check
					    try {
					        if (frame.contentWindow) {
					            doc = frame.contentWindow.document;
					        }
					    } catch(err) {
					    }
					
					    if (doc) { // successful getting content
					        return doc;
					    }
					
					    try { // simply checking may throw in ie8 under ssl or mismatched protocol
					        doc = frame.contentDocument ? frame.contentDocument : frame.document;
					    } catch(err) {
					        // last attempt
					        doc = frame.document;
					    }
					    return doc;
					}
              		
              		$('#add_edit_popup form[name=add_edit]').submit(function(e){
              			if(!confirm('Bạn có chắc chắn không!'))
              				return false;
              			
              			/* if($('#add_edit_popup form[name=add_edit] input[name=version]').val() ==''){
              				alert('Phiên bản không được trống');
              				return false;
              			} */
              			
              			if($('#add_edit_popup form[name=add_edit] select[name=charging_type]').val() ==''){
              				alert('Loại charging không được trống');
              				return false;
              			}
              			if($('#add_edit_popup form[name=add_edit] input[name=expired_date]').val() ==''){
              				alert('Ngày hết hạn không được trống');
              				return false;
              			}
              			
              			if(Date.parseExact($('#add_edit_popup form[name=add_edit] input[name=expired_date]').val(), 'dd/MM/yyyy HH:mm') == null){
              				alert('Ngày hết hạn sai định dạng');
              				return false;
              			}
              			
              			if($('#add_edit_popup form[name=add_edit] input[name=bizz_channel]').val() ==''){
              				alert('Kênh kinh doanh không được trống');
              				return false;
              			}
              			
              			if($('#add_edit_popup form[name=add_edit] input[name=title]').val() ==''){
              				alert('Tiêu đề không được trống');
              				return false;
              			}
              			
              			if($('#add_edit_popup form[name=add_edit] textarea[name=description]').val() ==''){
              				alert('Mô tả không được trống');
              				return false;
              			}
              			
              			/* var action = 'ADD_EDIT';
              			$(this).append('<input type="hidden" name="action" value="ADD_EDIT"/>');
              			$.ajax({
              				type : "post",
              				url : $(this).attr('action'),
              				data : $(this).serializeArray(),
              				success : function(data){
              					alert(data);
              					if(data.indexOf('thành công') != -1)
              						location.reload();
              				}
              			}); */
              			var formObj = $(this);
            		    var formURL = formObj.attr("action");
            		 
            		    if(window.FormData !== undefined)  // for HTML5 browsers
            		    {
            		 
            		        var formData = new FormData(this);
            		        $.ajax({
            		            url: formURL,
            		            type: 'POST',
            		            data:  formData,
            		            mimeType:"multipart/form-data",
            		            contentType: false,
            		            cache: false,
            		            processData:false,
            		            success: function(data, textStatus, jqXHR) {
            		 				alert(data);
            		 				if(data.indexOf('thành công') != -1)
                 						location.reload();
            		            },
            		            error: function(jqXHR, textStatus, errorThrown) {
            		 
            		            }           
            		       	});
            		        
            		        e.preventDefault();
            		        e.unbind();
            		   } else {  //for olden browsers
            		        //generate a random id
            		        var  iframeId = 'unique' + (new Date().getTime());
            		 
            		        //create an empty iframe
            		        var iframe = $('<iframe src="javascript:false;" name="'+iframeId+'" />');
            		 
            		        //hide it
            		        iframe.hide();
            		 
            		        //set form target to iframe
            		        formObj.attr('target',iframeId);
            		 
            		        //Add iframe to body
            		        iframe.appendTo('body');
            		        iframe.load(function(e)
            		        {
            		            var doc = getDoc(iframe[0]);
            		            var docRoot = doc.body ? doc.body : doc.documentElement;
            		            var data = docRoot.innerHTML;
            		            //data is returned from server.
            		            alert(data);
            		            if(data.indexOf('thành công') != -1)
             						location.reload();
            		        });
            		 
            		    }
              			return false;
              		});
              	});
              </script>
              
              <!-- Add and edit popup -->
              <div id="add_edit_popup">
                  <h1 class="srv_title"><span class="record_title">Lập phiếu hậu kiểm</span></h1>
                  <form action="product-verify-manager-ajax.wss" method="post" name="add_edit" enctype="multipart/form-data"">
                      <input type="hidden" name="id"/>
                      <input type="hidden" name="action" value="ADD_EDIT"/>
                      <div class="item">
	                      <label>App code: <b>${model.merchantProduct.app_code }</b></label>
	                      <input type="hidden" name="app_code" value="${model.merchantProduct.app_code }"/>
                      </div>
                      
                      <div class="item">
                        <label>Phiên bản: <b><span class="version">${model.currVersion }</span></b></label>
                        <%-- <input type="hidden" name="version" value="${model.currVersion }"/> --%>
                      </div>
                      
					  <div class="item">
                        <label>Tiêu đề</label>
                        <input name="title" placeholder="Nhập tiêu đề"/>
                      </div>

                      <div class="item">
	                      <label>Loại charging <b><span class="charging_type"></span></b></label>
	                      <select name="charging_type">
	                       
	                       <c:forEach items="${model.chargingStatus }" var="item">
		                       	<c:if test="${item.value == 'approved'}">
		  	                       <option value="${item.key }">${onepay:chargingServiceCode2Text(item.key)}</option>
			                    </c:if>
		                   </c:forEach>
		                  
	                       <%-- <c:if test="${model.merchantProduct.sms_charging.status == 'approved'}">
  	                       <option value="sms_charging">sms_charging</option>
	                       </c:if>
	                       <c:if test="${model.merchantProduct.iac_charging.status == 'approved'}">
                           <option value="iac_charging">iac_charging</option>
                         </c:if> --%>
                         
	                      </select>
                      </div>
                      
                      <div class="item">
                        <label>Kênh kinh doanh</label>
                        <input name="bizz_channel" placeholder="Nhập kênh kinh doanh"/>
                      </div>
                      
                      <div class="item">
                        <label>Mô tả</label>
                        <textarea name="description" placeholder="Nhập mô tả"></textarea>
                      </div>
                      
                      <div class="item">
                        <label>File đính kèm</label>
                        <input type="file" name="attachments" accept="image/png,image/jpg,image/jpeg" multiple />
                        <div class="attachments"></div>
                      </div>
                      
					  <div class="item">
                        <label>Ngày hết hạn</label>
                        <input id="expired_time" name="expired_date" placeholder="Nhập ngày hết hạn" style="width:120px" />
                      </div>
                      
                      <div class="decision">
	                      <input name="submit_record" class="btn_greensmall" type="submit" value="Tạo mới" />
	                      <input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
                      </div>
                  </form>
              </div>
              <!-- /End Add and edit popup -->
              
              <script type="text/javascript">
              	$(document).ready(function(){
              		//Get permissions
              		var isBizSupporter = '<c:out value="${isBizSupporter}"/>',
              		isBizStaff = '<c:out value="${isBizStaff}"/>',
              		isBizSupportManager = '<c:out value="${isBizSupportManager}"/>',
              		isOperator =  '<c:out value="${isOperator}"/>';
              		//alert(isBizSupporter + isBizSupporter + isBizSupportManager + isOperator);
              		
             		$('.status_popup').live('click', function(){
             			
             			$('#status_popup .app_code').html($(this).attr('app_code'));
             			$('#status_popup .charging_type').html($(this).attr('charging_type'));
             			$('#status_popup .version').html($(this).attr('version'));
             			$('#status_popup .created_date').html($(this).attr('created_date'));
             			$('#status_popup .expired_date').html($(this).attr('expired_date'));
             			$('#status_popup .bizz_channel').html($(this).attr('bizz_channel'));
             			$('#status_popup .title').html($(this).attr('title1'));
             			$('#status_popup .description').html($(this).attr('description'));
             			$('#status_popup .reasonLabelContent').html($(this).attr('reason'));
             			
             			var status = $(this).attr('status');
             			var id = $(this).attr('id');
             			var request = $(this).attr('request');
             			$('#status_popup form[name=update_status] input[name=id]').val(id);
             			
             			//attachment
    	       			var local = '${attachmentPath}';
    	       			//alert(local);
    	       			$('#status_popup .attachment').html('');
    	       			$('textarea[name=textarea'+id + ']').each( 
    	       					function(){
    	       						$('#status_popup .attachment').append('<a href="'+local+$(this).val()+'" style="color: #2c8f39;">'+$(this).val()+'</a>, ');
    	       					}	
    	       			);
    	       			
             			//set request
         				$('#status_popup form[name=update_status] input[name=request]').val(request);
             			
             			//set disable (auto)
         				$('#status_popup form[name=update_status] input[name=submit_record]').css('display', 'none');
         				$('#status_popup form[name=update_status] input[name=reject_record]').css('display', 'none');
         				$('#status_popup form[name=update_status] .requirement').css('display', 'none');
         				$('#status_popup form[name=update_status] .reason').css('display', 'none');
         				$('#status_popup .reasonLabel').css('display', 'none');
         				
         				if(status == 1 || status == 3){
         					$('#status_popup .reasonLabel').css('display', 'block');
         				}
         				
             			if(request == 0){
             				$('#status_popup form[name=update_status] input[name=submit_record]').css('display', 'none');
             				$('#status_popup form[name=update_status] input[name=reject_record]').css('display', 'none');
             				
             			}
             				
             			if(request == 1 && status == 0){
             				
             				if(isBizStaff == 'true' ||  isBizSupportManager == 'true' || isOperator == 'true'){
             					
	             				$('#status_popup form[name=update_status] input[name=submit_record]').css('display', 'block');
	             				$('#status_popup form[name=update_status] input[name=reject_record]').css('display', 'block');
	             				$('#status_popup form[name=update_status] .requirement').css('display', 'block');
	             				$('#status_popup form[name=update_status] .reason').css('display', 'block');
	             				
	             				$('#status_popup form[name=update_status] input[name=submit_record]').val('Đề nghị');
             				}
             			}
             			
             			if(request == 2 && status == 2){
             				if(isBizSupportManager == 'true' || isOperator == 'true'){
	             				$('#status_popup form[name=update_status] input[name=submit_record]').css('display', 'block');
	             				$('#status_popup form[name=update_status] input[name=reject_record]').css('display', 'block');
	             				$('#status_popup form[name=update_status] .requirement').css('display', 'block');
	             				$('#status_popup form[name=update_status] .reason').css('display', 'block');
	             				
	             				$('#status_popup form[name=update_status] input[name=submit_record]').val('Duyệt');
             				}
             			}
             		});
             		
             		//which is clicked
             		$('#status_popup form[name=update_status] input[name=submit_record]').live('click', function(){
             			var request = $('#status_popup form[name=update_status] input[name=request]').val();
             			if(request == 1){
             				$('#status_popup form[name=update_status] input[name=status]').val(2);
             			}
             			if(request == 2){
             				$('#status_popup form[name=update_status] input[name=status]').val(4);
             			}
             		});
             		$('#status_popup form[name=update_status] input[name=reject_record]').live('click', function(){
             			var request = $('#status_popup form[name=update_status] input[name=request]').val();
             			if(request == 1){
             				$('#status_popup form[name=update_status] input[name=status]').val(1);
             			}
             			if(request == 2){
             				$('#status_popup form[name=update_status] input[name=status]').val(3);
             			}
             		});
             		
             		$('#status_popup form[name=update_status]').submit(function(){
             			if(!confirm('Bạn chắc chắn muốn cập nhật?'))
             				return false;
             			if(!$('#status_popup form[name=update_status] input[name=requirement]').is(':checked')){
             				alert('Bạn hãy đọc kỹ nội dung!')
             				return false;
             			}
             			
             			var status = $('#status_popup form[name=update_status] input[name=status]').val();
             			if(status == '1' || status == '3'){
             				if($('#status_popup form[name=update_status] textarea[name=reason]').val() == ''){
             					alert('Hãy nhập lý do từ chối!')
                 				return false;
             				}
             			}
             			
             			$.ajax({
             				type : 'post',
             				url : $(this).attr('action'),
             				data : $(this).serializeArray(),
             				success : function(data){
             					alert(data);
             					if(data.indexOf('thành công') != -1)
             						location.reload();
             				}
             			});
             			return false;
             		});
              	});
              </script>
              <!-- Status popup -->
              <div id="status_popup">
              	<h1 class="srv_title"><span class="popup_title">Chi tiết phiếu hậu kiểm</span></h1>
              	<div class="item">
	              	<label>App code: </label>
	              	<span class="app_code">1122</span>
              	</div>
              	<div class="item">
	              	<label>Loại charging: </label>
	              	<span class="charging_type">sms_charging</span>
              	</div>
              	<div class="item">
	              	<label>Phiên bản: </label>
	              	<span class="version">1.0</span>
              	</div>
              	<div class="item">
	              	<label>Ngày tạo: </label>
	              	<span class="created_time">10/10/2014 07:20:00</span>
              	</div>
              	<div class="item">
	              	<label>Ngày hết hạn: </label>
	              	<span class="expired_date">10/10/2014</span>
              	</div>
              	<div class="item">
	              	<label>Kênh kinh doanh: </label>
	              	<span class="bizz_channel">kenh12kl</span>
              	</div>
              	<div class="item">
	              	<label>Tiêu đề: </label>
	              	<span class="title">Hậu kiểm sản phẩm 123</span>
              	</div>
              	<div class="item">
	              	<label>Mô tả: </label>
	              	<span class="description">Hậu kiểm sản phẩm 123 ngày 01/10/2014 Ngày hết hạn: 10/10/2014</span>
              	</div>
              	<div class="item">
	              	<label>File đính kèm: </label>
	              	<span class="attachment" style="color: #2c8f39;">Đính kèm 1</span>
              	</div>
              	<div class="item reasonLabel">
	              	<label>Lý do từ chối: </label>
	              	<span class="reasonLabelContent" style="color: red;">Lý do từ chối</span>
              	</div>
              	<form name="update_status" action="product-verify-manager-ajax.wss" method="post">
              		<input type="hidden" name="id" value=""/>
              		<input type="hidden" name="status" value=""/>
              		<input type="hidden" name="request" value=""/>
              		<input type="hidden" name="action" value="UPDATE_STATUS"/>
              		<div class="item reason">
		              	<label>Lý do từ chối: </label>
		              	<textarea name="reason" rows="5" cols="45" placeholder="Nhập lý do từ chối"></textarea>
	              	</div>
	              	<div class="item2 requirement" style="padding-left: 15px;">
		              	<input type="checkbox" name="requirement"/>
		              	<label style="color: red;"><i>Đã đọc kỹ nội dung</i></label>
	              	</div>
	              	<div class="item" style="margin-top: 10px;">
	                  <input name="submit_record" class="btn_greensmall" type="submit" value="Khởi tạo" />
	                  <input name="reject_record" class="btn_greensmall" type="submit" value="Từ chối" />
	                  <input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
	                 </div>
                 
                 </form>
                 
              </div>
              <!-- /Status popup -->
              
              <script type="text/javascript">
	              $('.detail_popup').live('click', function(){
	       			
	       			$('#detail_popup .app_code').html($(this).attr('app_code'));
	       			$('#detail_popup .charging_type').html($(this).attr('charging_type'));
	       			$('#detail_popup .version').html($(this).attr('version'));
	       			$('#detail_popup .created_time').html($(this).attr('created_time'));
	       			$('#detail_popup .expired_date').html($(this).attr('expired_date'));
	       			$('#detail_popup .bizz_channel').html($(this).attr('bizz_channel'));
	       			$('#detail_popup .title').html($(this).attr('title1'));
	       			$('#detail_popup .description').html($(this).attr('description'));
	       			$('#detail_popup .reasonContent').html($(this).attr('reason'));
	       			
	       			var status = $(this).attr('status');
	       			var id = $(this).attr('id');
	       			
	       			if(status == 0)
	       				$('#detail_popup .status').html('Khởi tạo');
	       			if(status == 1)
	       				$('#detail_popup .status').html('Từ chối đề nghị');
	       			if(status == 2)
	       				$('#detail_popup .status').html('Đã đề nghị');
	       			if(status == 3)
	       				$('#detail_popup .status').html('Từ chối duyệt');
	       			if(status == 4)
	       				$('#detail_popup .status').html('Đã duyệt');
	       			
	       			//hidden
     				$('#detail_popup .reasonItem').css('display', 'none');
     				
	       			if(status == 1 || status == 3){
     					$('#detail_popup .reasonItem').css('display', 'block');
     				}
	       			
	       			//attachment
	       			var local = '${attachmentPath}';
	       			//alert(local);
	       			$('#detail_popup .attachment').html('');
	       			$('textarea[name=textarea'+id + ']').each( 
	       					function(){
	       						$('#detail_popup .attachment').append('<a href="'+local+$(this).val()+'" style="color: #2c8f39;">'+$(this).val()+'</a>, ');
	       					}	
	       			); 
	       			
	       		});
              </script>
              <!-- Detail popup -->
              	<div id="detail_popup"> 
              		<h1 class="srv_title"><span class="popup_title">Chi tiết phiếu hậu kiểm</span></h1>
              		<div class="item">
	              	<label>App code: </label>
		              	<span class="app_code" style="font-weight: bold;">1122</span>
	              	</div>
	              	<div class="item">
		              	<label>Loại charging: </label>
		              	<span class="charging_type" style="font-weight: bold;">sms_charging</span>
	              	</div>
	              	<div class="item">
		              	<label>Phiên bản: </label>
		              	<span class="version" style="font-weight: bold;">1.0</span>
	              	</div>
	              	<div class="item">
		              	<label>Ngày tạo: </label>
		              	<span class="created_time">10/10/2014 07:20:00</span>
	              	</div>
	              	<div class="item">
		              	<label>Ngày hết hạn: </label>
		              	<span class="expired_date">10/10/2014</span>
	              	</div>
	              	<div class="item">
		              	<label>Kênh kinh doanh: </label>
		              	<span class="bizz_channel">kenh12kl</span>
	              	</div>
	              	<div class="item">
		              	<label>Tiêu đề: </label>
		              	<span class="title">Hậu kiểm sản phẩm 123</span>
	              	</div>
	              	<div class="item">
		              	<label>Mô tả: </label>
		              	<span class="description">Hậu kiểm sản phẩm 123 ngày 01/10/2014 Ngày hết hạn: 10/10/2014</span>
	              	</div>
	              	<div class="item">
		              	<label>Trạng thái: </label>
		              	<span class="status">Khởi tạo</span>
	              	</div>
	              	<div class="item reasonItem">
		              	<label>Lý do từ chối: </label>
		              	<span class="reasonContent" style="color: red;">Lý do từ chối</span>
	              	</div>
	              	<br/>
	              	<div class="item">
		              	<label>File đính kèm: </label>
		              	<span class="attachment" style="color: #2c8f39;">Đính kèm 1</span>
	              	</div>
	              	
	              	<div class="item">
		              	<input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
	              	</div>
              	</div>
              <!-- /Detail popup -->
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
