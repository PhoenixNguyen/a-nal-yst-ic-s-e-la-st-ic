<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="onepay" uri="http://1pay.vn/jsp/jstl/functions"%>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript">
$(function(){
	$("#filter_policy").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	$("#filter_merchant").multiselect({
		selectedList: 4,
		noneSelectedText: "Tất cả",
		classes: "multiSelectBox"
	});
	//Charging Services check all
    $("#changeChargingService").click(function(){
    	if($("#changeChargingService").is(':checked'))
    	{
    		$('input[name=chargings]').attr('checked', true);
    	}
    	else
    	{
    		$('input[name=chargings]').attr('checked', false);
    	}
    });
    //ContractType check all
    $("#changeContractType").click(function(){
    	if($("#changeContractType").is(':checked'))
    	{
    		$('input[name=contractType]').attr('checked', true);
    	}
    	else
    	{
    		$('input[name=contractType]').attr('checked', false);
    	}
    });
});
</script>
<c:if test="${param.submit==null || fn:length(param.submit) == 0 }">
<script type="text/javascript">
$(function(){
    $('input[name=changeChargingService]').attr('checked', true);
    $('input[name=chargings]').attr('checked', true);
    //ContractType
    $('input[name=changeContractType]').attr('checked', true);
    $('input[name=contractType]').attr('checked', true);
});
</script>
</c:if>
<c:if test="${param.month==null}">
	<script type="text/javascript">
	$(function(){
		var currentMonth = (new Date).getMonth() + 1;
		var currentDate = (new Date).getDate();
		if(currentDate<15){
			currentMonth=currentMonth-1;
		}
		$("#month").val(currentMonth);
	});
	</script>
</c:if>
<c:if test="${param.year==null}">
	<script type="text/javascript">
	$(function(){
		var currentYear = (new Date).getYear() + 1900;
		$("#year").val(currentYear);
	});
	</script>
</c:if>
<style>
	.filter_row .fieldset_filter {border: solid 1px #ccc;margin-left:40px; width: auto;}
</style>
<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Lọc kết quả</a>
										</h3>
									</div>
									<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;">Tên Merchant: </span>
												<input id="searchMerchant" list="allMcList" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản merchant"/>
												<datalist id="allMcList">
													<c:forEach var="merchant" items="${model.merchants}">
													<option value="${merchant}">${merchant}</option>
													</c:forEach>
												</datalist>
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
												<c:set var="allMcs" value="," />
												<c:forEach var="mc" items="${paramValues.merchant}">
													<c:set var="allMcs" value="${allMcs}${mc}," />
												</c:forEach>
												<select id="filter_merchant" name="merchant" multiple="multiple" class="dashboard_filter">
													<c:forEach var="merchant" items="${model.merchants}">
														<c:set var="merchant2" value=",${merchant}," />
														<option value="${merchant }" ${fn:contains(allMcs, merchant2)?'selected':'' }>
															<c:out value="${merchant}"/>
														</option>
													</c:forEach>
												</select>
											</c:if>
											</div>
											<!-- 
											<div class="filter_row">
							                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Tháng:</span>
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
							                 	Năm:
							                 	<select id="year" name="year" class="dashboard_filter">
							                 		<option value="" ${(param.year == null || param.year == '')?'selected="selected"':''}>Tất cả</option>
							                 		<option value="2012" ${(param.year == '2012')?'selected="selected"':''}>2012</option>
							                 		<option value="2013" ${(param.year == '2013')?'selected="selected"':''}>2013</option>
							                 		<option value="2014" ${(param.year == '2014')?'selected="selected"':''}>2014</option>
							                 		<option value="2015" ${(param.year == '2015')?'selected="selected"':''}>2015</option>
							                 		<option value="2016" ${(param.year == '2016')?'selected="selected"':''}>2016</option>
							                 		<option value="2017" ${(param.year == '2017')?'selected="selected"':''}>2017</option>
							                 		<option value="2018" ${(param.year == '2018')?'selected="selected"':''}>2018</option>
							                 	</select>
							                </div>
							                 -->
							                <div class="filter_row">
							                	<c:set var="allPolicies" value="," />
												<c:forEach var="paymentPolicy" items="${paramValues.paymentPolicy}">
													<c:set var="allPolicies" value="${allPolicies}${paymentPolicy}," />
												</c:forEach>
							                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Chu kỳ đối soát:</span>
							                 	<select id="filter_policy" name="paymentPolicy" multiple="multiple" class="dashboard_filter">
														<c:forEach var="paymentPolicy" items="${model.paymentPolicies}">
															<c:set var="paymentPolicy2" value=",${paymentPolicy}," />
															<option value="${paymentPolicy }" ${fn:contains(allPolicies, paymentPolicy2)?'selected':'' }>
																<c:out value="${onepay:merchantPolicyCode2ShortText(paymentPolicy)}"/>
															</option>
														</c:forEach>
												</select>
												
												<c:if test="${model.status != null && fn:length(model.status) >0 }">
								                <div style="display: block;float: right;">
								                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Trạng thái:</span>
								                 	<select id="status" name="status" class="dashboard_filter">
								                 		<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
								                 		<%-- <option value="0" ${(param.status == '0')?'selected="selected"':''}>0-Đề xuất thông tin hợp đồng</option> --%>
								                 		<option value="2" ${(param.status == '2')?'selected="selected"':''}>2-Cập nhật thông tin hợp đồng</option>
								                 		<option value="4" ${(param.status == '4')?'selected="selected"':''}>4-Đã duyệt thông tin hợp đồng</option>
								                 		<option value="6" ${(param.status == '6')?'selected="selected"':''}>6-Đã đề xuất tỷ lệ</option>
								                 		<option value="8" ${(param.status == '8')?'selected="selected"':''}>8-Merchant đã xác nhận profile</option>
								                 		<option value="10" ${(param.status == '10')?'selected="selected"':''}>10-Đã duyệt profile</option>
								                 	</select>
								                </div>
								                </c:if>
							                </div>
							                <div class="filter_row">
							                	<c:set var="allContractType" value="," />
												<c:forEach var="cs" items="${paramValues.contractType}">
													<c:set var="allContractType" value="${allContractType}${cs}," />
												</c:forEach>
												<fieldset class="fieldset_filter">
													<legend>
									                	<span>
									                		<input type="checkbox" ${param.changeContractType!=null?'checked="checked"':'' } name="changeContractType" id="changeContractType">
									                		Loại hợp đồng:
									                	</span>
									                </legend>
													
													<input type="checkbox" ${fn:contains(allContractType, 'A_B2B')?'checked="checked"':'' } title="Loại A_B2B" value="A_B2B" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_thecao" class="lbl_chcksub">A_B2B</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allContractType, 'A_B2C')?'checked="checked"':'' } title="Loại A_B2C" value="A_B2C" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_sms" class="lbl_chcksub">A_B2C</label>
                                                       
													<input type="checkbox" ${fn:contains(allContractType, 'B1_B2B')?'checked="checked"':'' } title="Loại B1_B2B" value="B1_B2B" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">B1_B2B</label>
													
													<input type="checkbox" ${fn:contains(allContractType, 'B1_B2C')?'checked="checked"':'' } title="Loại B1_B2C" value="B1_B2C" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">B1_B2C</label>
													
													<input type="checkbox" ${fn:contains(allContractType, 'B2_CN')?'checked="checked"':'' } title="Loại B2_CN" value="B2_CN" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">B2_CN</label>
													
													<input type="checkbox" ${fn:contains(allContractType, 'C_CN')?'checked="checked"':'' } title="Loại C_CN" value="C_CN" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">C_CN</label>
												</fieldset>
                							</div>
							                <div class="filter_row">
							                	<c:set var="allCharging" value="," />
												<c:forEach var="cs" items="${paramValues.chargings}">
													<c:set var="allCharging" value="${allCharging}${cs}," />
												</c:forEach>
												<fieldset class="fieldset_filter">
													<legend>
									                	<span>
									                		<input type="checkbox" ${param.changeChargingService!=null?'checked="checked"':'' } name="changeChargingService" id="changeChargingService">
									                		Loại charging:
									                	</span>
													</legend>
													<input type="checkbox" ${fn:contains(allCharging, 'CARD')?'checked="checked"':'' } title="Thẻ cào" value="CARD" name="chargings" class="chck_filter chargings" id="chargings">
                                                    <label for="chck_thecao" class="lbl_chcksub">Thẻ cào</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allCharging, 'SMS')?'checked="checked"':'' } title="SMS" value="SMS" name="chargings" class="chck_filter chargings" id="chargings">
                                                    <label for="chck_sms" class="lbl_chcksub">SMS</label>
                                                       
													<input type="checkbox" ${fn:contains(allCharging, 'WAP')?'checked="checked"':'' } title="WAP" value="WAP" name="chargings" class="chck_filter chargings" id="chargings"> 
													<label for="chck_wap" class="lbl_chcksub">WAP</label>
													
													<input type="checkbox" ${fn:contains(allCharging, 'IAC')?'checked="checked"':'' } title="IAC" value="IAC" name="chargings" class="chck_filter chargings" id="chargings"> 
													<label for="chck_iac" class="lbl_chcksub">In-App</label>
												</fieldset>
                							</div>
                							
                							<div class="filter_row">
												<fieldset class="fieldset_filter">
													<legend>
									                	<span>
									                		Sắp xếp:
									                	</span>
													</legend>
													
													<!-- Sắp xếp theo -->
													<span class="add-on" style="display:block; width:70px;">Trạng thái:</span>
								                 	<select id="order_by_status" name="order_by_status" class="dashboard_filter" style="width:150px;">
								                 		<option value="" ${(param.order_by_status == '')?'selected="selected"':''}>Mặc định</option>
								                 		<option value="asc" ${(param.order_by_status == 'asc')?'selected="selected"':''}>Trạng thái tăng dần</option>
								                 		<option value="desc" ${(param.order_by_status == 'desc')?'selected="selected"':''}>Trạng thái giảm dần</option>
								                 	</select>
								                 	<!-- Sắp xếp theo -->
												</fieldset>
                							</div>
							                
											<div class="filter_row">
												<span class="add-on" style="padding-left:40px; display:block; width:100px;">
													<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
												</span>
											</div>
											<!-- .actions -->
										<!-- .widget-content -->
										</div>
