<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />

<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){

	$("#filter_charging").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
});
</script>

</head>

<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
				<%request.setAttribute("constractNavMenu",true); %>
				<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
					<div class="row_sub">
						<jsp:include page="left_menu.jsp" />
						
						<div class="right_content">
				            <h1 class="srv_title">Hợp đồng điện tử</h1>
				            <form action="eConstract.wss" method="post">
				            	<c:if test="${model.isStaff}">   
				                <div id="filter_locketqua">
				        			<h3 class="filter_label open"><a href="#">Lọc kết quả</a></h3>
				      			</div>
				                
				               <div class="box_locketqua">
				               	   <!-- 
				            		<div class="filter_row">
				                 		<div class="input-prepend">
												<span class="add-on">Chọn ngày:</span> <input type="text"
													name="reservation" id="reservation" class="txt_calendar"
													value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:model.today}" />
											</div>
											<script type="text/javascript">
												$(document).ready(function() {
													/* $('#reservation').daterangepicker({
														format : 'dd/MM/yyyy',
													}); */
													$('#reservation').daterangepicker({
														format : 'dd/MM/yyyy',
														ranges: {
														'Hôm nay': ['today', 'today'],
														'Hôm qua': ['yesterday', 'yesterday'],
														'7 Ngày trước': [Date.today().add({ days: -7 }), 'today'],
														'30 Ngày trước': [Date.today().add({ days: -30 }), 'today'],
														'Tháng này': [Date.today().moveToFirstDayOfMonth(), Date.today().moveToLastDayOfMonth()],
														'Tháng trước': [Date.today().moveToFirstDayOfMonth().add({ months: -1 }), Date.today().moveToFirstDayOfMonth().add({ days: -1 })]
														}
													});
												});
											</script>
				                	</div>
				                	 -->
					                <div class="filter_row">
					                	<div class="product_slc_filter">
					                  		<label class="product_lbl_filter">Họ và Tên:</label>
					                  		<input type="text" name="fullName" value="${param.fullName}" class="txt_filter" />
					                 	</div>
					                </div>
					                <c:if test="${model.chargingMethods != null && fn:length(model.chargingMethods)>1 }">
										<c:set var="allChargs" value="," />
										<c:forEach var="charg" items="${paramValues.chargingMethod}">
											<c:set var="allChargs" value="${allChargs}${charg}," />
										</c:forEach>
										<div class="filter_row">
											<div class="field">
												<div style="padding-bottom: 5px; overflow: hidden;">
													<label class="lbl_chcksub_admin">Charging:</label>
												</div>
												<div class="clear"></div>
												<div>
												<select id="filter_charging" name="chargingMethod" multiple="multiple" style="width:300px">
													<c:forEach var="charging" items="${model.chargingMethods}">
														<c:set var="charging2" value=",${charging.key}," />
														<option value="${charging.key }" ${fn:contains(allChargs, charging2)?'selected':'' }>
															<c:out value="${charging.value}"/>
														</option>
													</c:forEach>
												</select>
												</div>
											</div>
										</div>
									</c:if>
				                <div class="filter_row">
				                	<input type="submit" class="btn_greensmall" value="Lọc kết quả" name="submit" />
				                </div>
				                </div>
				                </c:if>
				                <div class="srv_row"/>
				               
				               <div class="srv_row">
				               		<script>var rownum = 1;</script>
				                	<display:table name="model.list" id="list" 
														requestURI="/console/eConstract.wss" 
														pagesize="${model.pagesize}" partialList="true" size="model.total"
														style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
														sort="list">
											<%@ include file="display_table.jsp" %>
											<display:column title="STT" headerClass="transhead width50" class="svr_data1" style="text-align:right;border: 1px solid #CCC;">
												<span id="row${list.id}" class="rowid">
													<c:out value="${model.offset + list_rowNum }" />
												</span>
										    </display:column>
											<display:column title="Merchant" headerClass="transhead" class="svr_data1" property="merchant" style="border: 1px solid #CCC;" />
											<display:column title="Họ và Tên" headerClass="transhead" class="svr_data1" property="fullName" style="border: 1px solid #CCC;" />
											<display:column title="Ngày ký" headerClass="transhead" class="transdata" property="signedTime" format="{0,date,yyyy-MM-dd hh:mm:ss}" style="border: 1px solid #CCC;" />
											<display:column title="Charging" headerClass="transhead width130" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a class="card_${(list.card!=null && fn:length(list.card)>0)? 'active':'invi'}"
														title="${(list.card!=null)? 'Đã đăng ký Card Charging':'Chưa đăng ký Card Charging'}"
														href="#"></a> 
												<a class="sms_${(list.sms!=null)? 'active':'invi'}"
														title="${(list.sms!=null)? 'Đã đăng ký Sms Charging':'Chưa đăng ký Sms Charging'}"
														href="#"></a> 
												<a class="wap_${(list.wap!=null && fn:length(list.wap)>0)? 'active':'invi'}"
														title="${(list.wap!=null)? 'Đã đăng ký Wap Charging':'Chưa đăng ký Wap Charging'}"
														href="#"></a> 		
												<a class="direct_${(list.direct!=null && fn:length(list.direct)>0)? 'active':'invi'}"
														title="${(list.direct!=null && fn:length(list.direct)>0)? 'Đã đăng ký Direct Charging':'Chưa đăng ký Direct Charging'}"
														href="#"></a>
												<a class="sub_${(list.sub!=null && fn:length(list.sub)>0)? 'active':'invi'}"
														title="${(list.sub!=null && fn:length(list.sub)>0)? 'Đã đăng ký Sub Charging':'Chưa đăng ký Sub Charging'}"
														href="#"></a>		 		
										    </display:column>
										    <display:column title="Actions" headerClass="transhead width105" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="<%=request.getContextPath() %>/protected/hop-dong.html?un=${list.merchant}"class="link_taifile" title="Tải hợp đồng"></a>
										    	<c:if test="${ model.isStaff}">
										    	<a href="#" class="link_duyet" title="Duyệt" id="duyet_${list.id} "></a> <a href="#" class="link_cancel" title="Hủy" id="cancel_${list.id}">
										    	</c:if>
											</display:column>			
									</display:table>
									<div id="constract_approve_change" style="display: none;"></div>
									<script type="text/javascript">
		                        		$(document).ready(function() {
		                        			$('.link_duyet').live('click', function() {
		                        				if(confirm('Bạn có chắc chắn muốn tạo duyệt hợp đồng này?')) {
		                        					var chkId = $(this).attr('id')+'';
		                        					var cid = chkId.replace('duyet_','');
													var url = '<%=request.getContextPath()%>/console/ajax.wss?a=approve_constract&cid='+cid;
													$('#constract_approve_change').load(url, function(responseTxt,statusTxt,xhr){
														var result = responseTxt + '';
														if(result.indexOf('1')==0){
															alert('Hợp đồng đã được duyệt!');
														}else{
															alert('Duyệt hợp đồng không thành công!');
														}; 
													});
												} else {
													return false;
												}
		                        			});
		                        			$('.link_cancel').live('click', function() {
		                        				if(confirm('Bạn có chắc chắn không duyệt hợp đồng này?')) {
		                        					var chkId = $(this).attr('id')+'';
		                        					var cid = chkId.replace('cancel_','');
													var url = '<%=request.getContextPath()%>/console/ajax.wss?a=disapprove_constract&cid='+cid;
													$('#constract_approve_change').load(url, function(responseTxt,statusTxt,xhr){
														var result = responseTxt + '';
														if(result.indexOf('1')==0){
															alert('Không duyệt thành công!');
														}
													});
												} else {
													return false;
												}
		                        			});
		                        		});
		                        	</script>		
				               </div>
				            </form>
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
</body>

</html>