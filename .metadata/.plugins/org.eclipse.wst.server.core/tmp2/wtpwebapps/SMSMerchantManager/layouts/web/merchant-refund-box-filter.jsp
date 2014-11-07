<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<style>
	.filter_row .fieldset_filter {border: solid 1px #ccc;margin-left:40px; width: auto;}
</style>

<script type="text/javascript">
$(function(){

	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả"
	});
	$("#filter_service").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả"
	});
	
	$("#filter_telco").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả"
	});
});

</script>

<div id="filter_locketqua">
		<h3 class="filter_label open">
			<a href="#">Lọc kết quả</a>
		</h3>
	</div>
	<!-- .widget-header -->
		<div class="box_locketqua">
			<input type="hidden" name="tab" value="${param.tab}"/>
			<div class="filter_row">
				<span style="padding-left:40px; display:inline-block; width:100px;">Tìm merchant</span>
				<input id="searchMerchant" list="listForSearchMC" maxlength="100" name="searchMerchant" value="${param.searchMerchant }" class="merchant_filter" placeholder="Nhập tên merchant"/>
				
				<c:set var="listForSearchMC" value="<datalist id='listForSearchMC'>" />
				<c:set var="allMC" value="," />
				<c:forEach var="mc" items="${paramValues.merchant}">
					<c:set var="allMC" value="${allMC}${mc}," />
				</c:forEach>
				<select id="filter_merchant" name="merchant" multiple="multiple" style="width:250px; padding: 6px;">
				
					<c:forEach var="merchant" items="${model.merchants}">
						<c:set var="merchant2" value=",${merchant}," />
						<option value="${merchant }" ${fn:contains(allMC, merchant2)?'selected':'' }>
							<c:out value="${merchant}"/>
						</option>
						<c:set var="listForSearchMC" value="${listForSearchMC}<option value='${merchant}'>${merchant}</option>" />
					</c:forEach>
				</select>
				<c:out value="${listForSearchMC}" escapeXml="false" />
			</div>
			
			<div class="filter_row">
				<c:if test="${param.tab != 'requesting' && param.tab != 'completed' && param.tab != 'rejected' }">
					<span style="padding-left:40px; display:inline-block; width:100px;">Trạng thái</span>
					<select name="status" class="merchant_filter" >
						<option value = "" ${param.status=='' || param.status==null? 'selected':'' }>Tất cả</option>					
						
						<c:forEach items="${model.status }" var="item">
							<option value="${item }" ${fn:contains(param.status, item)? 'selected':'' }>
								
								<c:if test="${item == 0}">Khởi tạo</c:if>
								<c:if test="${item == 1}">Đã từ chối</c:if>
								<c:if test="${item == 2}">Đã đề nghị</c:if>
								<c:if test="${item == 4}">Đã duyệt</c:if>
								
							</option>
						</c:forEach>
					</select>
				</c:if>
				
				<span style="padding-left:40px; display:inline-block; width:100px;">Kiểu tiền</span>
				<select name="type" class="merchant_filter" >
					<option value = "" ${param.type=='' || param.type==null? 'selected':'' }>Tất cả</option>					
					
					<c:forEach items="${model.types }" var="item">
						<option value="${item }" ${fn:contains(param.type, item)? 'selected':'' }>
							
							<c:if test="${item == 1}">Giảm cộng</c:if>
							<c:if test="${item == 0}">Giảm trừ</c:if>
							
						</option>
					</c:forEach>
				</select>
				
			</div>
			<div class="filter_row">
				<div class="input-prepend" style="float:left; ">
					<label class="product_lbl_filter"><span style="padding-left:40px;">Chọn ngày</span></label> 
					<input type="text" style="margin-left: 38px;"
						name="reservation" id="reservation" class="txt_calendar product_filter" placeholder="Toàn thời gian"
						value="${(param.reservation!=null && fn:length(param.reservation)>0)?param.reservation:''}" />
						<%-- <a href="javascript:void(0)" 
							onclick="$('#reservation').val(''); $('.daterangepicker .ranges ul li').removeClass('active'); return false;" 
							style="vertical-align: middle;"><img src="<%=request.getContextPath() %>/images/huy.png" border="0" title="Toàn thời gian" /></a> --%>
				</div>
				<script type="text/javascript">
					$(document).ready(function() {
						
						/* $('#reservation').daterangepicker({
							format : 'dd/MM/yyyy',
						}); */
						
						var reservation = $('#reservation');
						if(reservation.val() == ''){
							var date = new Date();
							var firstDay = new Date(date.getFullYear(), date.getMonth(), 1);
							
							reservation.val(date.toString('dd/MM/yyyy') +' - ' + date.toString('dd/MM/yyyy'));
						}
						
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
			<div class="filter_row">
				
			</div>
			<div class="filter_row">
				<fieldset class="fieldset_filter">
					<legend>
						<input type="checkbox" name="chargingServiceAll" value="chargingServiceAll" id="chargingServiceAll" class="chck_filter" ${fn:contains(param.chargingServiceAll,'chargingServiceAll')?'checked="checked"':'' }  /> Dịch vụ
						<script type="text/javascript">
							$(document).ready(function(){
								$('#chargingServiceAll').click(function() {
									if(this.checked) {
										$(this).closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
									} else {
										$(this).closest('.filter_row').find('input[type=checkbox]').removeAttr('checked');
									}
								});
							});
						</script>
					</legend>
					
					<div style="padding: 2px;">
						<c:set var="allSv" value="," />
						<c:forEach var="sv" items="${paramValues.chargingService}">
							<c:set var="allSv" value="${allSv}${sv}," />
						</c:forEach>
						<c:forEach var="sv" items="${model.chargingServices}">
							<div style="display: inline-block;">
								<c:set var="_sv" value=",${sv}," />
								<input type="checkbox" class="chck_filter" name="chargingService" title="${sv}" value="${sv}" 
									${fn:contains(allSv,_sv)?'checked="checked"':'' } />
								
								<c:if test="${sv == 'CARD' }"><img style="float: left;" src="<%=request.getContextPath() %>/images/card_active2.png" align="top"></c:if>
								<c:if test="${sv == 'SMS' }"><img style="float: left;" src="<%=request.getContextPath() %>/images/sms_active2.png" align="top"></c:if>
								<c:if test="${sv == 'WAP' }"><img style="float: left;" src="<%=request.getContextPath() %>/images/wap_active2.png" align="top"></c:if>
								<c:if test="${sv == 'IAC' }"><img style="float: left;" src="<%=request.getContextPath() %>/images/iac_active2.png" align="top"></c:if>
								
								<label class="lbl_chcksub">${sv}</label>
							</div>
						</c:forEach>
					</div>
				</fieldset>
			</div>
			
			<div class="filter_row">
				<fieldset class="fieldset_filter">
					<legend>
						<input type="checkbox" name="telcoAll" value="telcoAll" id="telcoAll" class="chck_filter" ${fn:contains(param.telcoAll,'telcoAll')?'checked="checked"':'' }  /> Nhà mạng
						<script type="text/javascript">
							$(document).ready(function(){
								$('#telcoAll').click(function() {
									if(this.checked) {
										$(this).closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
									} else {
										$(this).closest('.filter_row').find('input[type=checkbox]').removeAttr('checked');
									}
								});
							});
						</script>
					</legend>
					
					<div style="padding: 2px;">
						<c:set var="allTc" value="," />
						<c:forEach var="tc" items="${paramValues.telco}">
							<c:set var="allTc" value="${allTc}${tc}," />
						</c:forEach>
						<c:forEach var="tc" items="${model.telcos}">
							<div style="display: inline-block;">
								<c:set var="_tc" value=",${tc}," />
								<input type="checkbox" class="chck_filter" name="telco" title="${tc}" value="${tc}" 
									${fn:contains(allTc,_tc)?'checked="checked"':'' } />
								<label class="lbl_chcksub">${tc}</label>
							</div>
						</c:forEach>
					</div>
				</fieldset>
			</div>
			
			
			<div class="filter_row">
				<span class="add-on" style="padding-left:40px; display:block; width:100px;">
					<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
				</span>
			</div>
		</div>
