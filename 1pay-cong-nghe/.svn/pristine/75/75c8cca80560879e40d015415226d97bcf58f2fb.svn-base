<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){
	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	//Charging Services check all
    $("#changeChargingService").click(function(){
    	if($("#changeChargingService").is(':checked'))
    	{
    		$('input[name=chargingService]').attr('checked', true);
    	}
    	else
    	{
    		$('input[name=chargingService]').attr('checked', false);
    	}
    });
});
</script>
<c:if test="${param.submit==null || fn:length(param.submit) == 0 }">
<script type="text/javascript">
$(function(){
	//Current Month
	var currentMonth = (new Date).getMonth() + 1;
    $("#month").val(currentMonth);
    $('input[name=changeChargingService]').attr('checked', true);
    $('input[name=chargingService]').attr('checked', true);
});
</script>
</c:if>
<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;">Tìm merchant: </span>
												<input id="searchMerchant" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
											</div>
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
												<c:set var="allMcs" value="," />
												<c:forEach var="mc" items="${paramValues.merchant}">
													<c:set var="allMcs" value="${allMcs}${mc}," />
												</c:forEach>
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;">Chọn merchant:</span>
												<select id="filter_merchant" name="merchant" multiple="multiple" class="dashboard_filter">
													<c:forEach var="merchant" items="${model.merchants}">
														<c:set var="merchant2" value=",${merchant}," />
														<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
															<c:out value="${merchant}"/>
														</option>
													</c:forEach>
												</select>
											</div>
											</c:if>
											<div class="filter_row">
							                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Lập đối soát:</span>
							                 	<select id="month" name="month" class="dashboard_filter">
							                 		<option value="" ${(param.month == null || param.month == '')?'selected="selected"':''}>Tất cả</option>
							                 		<option value="1" ${(param.month == '1')?'selected="selected"':''}>Tháng 1</option>
							                 		<option value="2" ${(param.month == '2')?'selected="selected"':''}>Tháng 2</option>
							                 		<option value="3" ${(param.month == '3')?'selected="selected"':''}>Tháng 3</option>
							                 		<option value="4" ${(param.month == '4')?'selected="selected"':''}>Tháng 4</option>
							                 		<option value="5" ${(param.month == '5')?'selected="selected"':''}>Tháng 5</option>
							                 		<option value="6" ${(param.month == '6')?'selected="selected"':''}>Tháng 6</option>
							                 		<option value="7" ${(param.month == '7')?'selected="selected"':''}>Tháng 7</option>
							                 		<option value="8" ${(param.month == '8')?'selected="selected"':''}>Tháng 8</option>
							                 		<option value="9" ${(param.month == '9')?'selected="selected"':''}>Tháng 9</option>
							                 		<option value="10" ${(param.month == '10')?'selected="selected"':''}>Tháng 10</option>
							                 		<option value="11" ${(param.month == '11')?'selected="selected"':''}>Tháng 11</option>
							                 		<option value="12" ${(param.month == '12')?'selected="selected"':''}>Tháng 12</option>
							                 	</select>
							                </div>
							                <div class="filter_row">
							                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Chu kỳ đối soát:</span>
							                 	<select name="paymentPolicy" class="dashboard_filter">
							                 		<option value="" ${(param.paymentPolicy == null || param.paymentPolicy == '')?'selected="selected"':''}>Tất cả</option>
							                 		<option value="15+1" ${(param.paymentPolicy == '15+1')?'selected="selected"':''}>15+1</option>
							                 		<option value="30+1" ${(param.paymentPolicy == '30+1')?'selected="selected"':''}>30+1</option>
							                 	</select>
							                 </div>	
							                <div class="filter_row">
							                	<c:set var="allCharging" value="," />
												<c:forEach var="cs" items="${paramValues.chargingService}">
													<c:set var="allCharging" value="${allCharging}${cs}," />
												</c:forEach>
							                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">
							                		<input type="checkbox" ${param.changeChargingService!=null?'checked="checked"':'' } name="changeChargingService" id="changeChargingService">
							                		Loại charging:
							                	</span>
													
													<input type="checkbox" ${fn:contains(allCharging, 'CARD')?'checked="checked"':'' } title="Thẻ cào" value="CARD" name="chargingService" class="chck_filter chargingService" id="chargingService">
                                                    <label for="chck_thecao" class="lbl_chcksub">Thẻ cào</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allCharging, 'SMS')?'checked="checked"':'' } title="SMS" value="SMS" name="chargingService" class="chck_filter chargingService" id="chargingService">
                                                    <label for="chck_sms" class="lbl_chcksub">SMS</label>
                                                       
													<input type="checkbox" ${fn:contains(allCharging, 'WAP')?'checked="checked"':'' } title="WAP" value="WAP" name="chargingService" class="chck_filter chargingService" id="chargingService"> 
													<label for="chck_wap" class="lbl_chcksub">WAP</label>
                							</div>
											<div class="filter_row">
												<span class="add-on" style="padding-left:40px; display:block; width:100px;">
													<input class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
												</span>
											</div>
											<!-- .actions -->
										<!-- .widget-content -->
										</div>
