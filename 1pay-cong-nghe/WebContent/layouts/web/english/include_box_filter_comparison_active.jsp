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
		noneSelectedText: "All",
		classes: "multiSelectBox"
	});
	$("#paymentPolicy").multiselect({
		selectedList: 4,
		noneSelectedText: "All",
		classes: "multiSelectBox"
	});
	//Charging Services check all
    $("#changeChargingService").click(function(){
    	if($("#changeChargingService").is(':checked'))
    	{
    		$('input[name=chargingService_]').attr('checked', true);
    	}
    	else
    	{
    		$('input[name=chargingService_]').attr('checked', false);
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
    $('input[name=chargingService_]').attr('checked', true);
    //ContractType
    $('input[name=changeContractType]').attr('checked', true);
    $('input[name=contractType]').attr('checked', true);
});
</script>
</c:if>
<div id="filter_locketqua">
										<h3 class="filter_label open">
											<a href="#">Filter</a>
										</h3>
									</div>
									<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;">Find merchant: </span>
												<input id="searchMerchant" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Enter merchant account"/>
											</div>
											<c:if test="${model.merchants != null && fn:length(model.merchants) >1 }">
												<c:set var="allMcs" value="," />
												<c:forEach var="mc" items="${paramValues.merchant}">
													<c:set var="allMcs" value="${allMcs}${mc}," />
												</c:forEach>
											<div class="filter_row">
												<span style="padding-left:40px; display:inline-block; width:100px;">Select merchant:</span>
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
							                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Create revenue report:</span>
							                 	<select id="month" name="month" class="dashboard_filter">
							                 		<option value="" ${(param.month == null || param.month == '')?'selected="selected"':''}>All</option>
							                 		<option value="1" ${(param.month == '1' || model.month == '1')?'selected="selected"':''}>January</option>
							                 		<option value="2" ${(param.month == '2' || model.month == '2')?'selected="selected"':''}>February</option>
							                 		<option value="3" ${(param.month == '3' || model.month == '3')?'selected="selected"':''}>March</option>
							                 		<option value="4" ${(param.month == '4' || model.month == '4')?'selected="selected"':''}>April</option>
							                 		<option value="5" ${(param.month == '5' || model.month == '5')?'selected="selected"':''}>May</option>
							                 		<option value="6" ${(param.month == '6' || model.month == '6')?'selected="selected"':''}>June</option>
							                 		<option value="7" ${(param.month == '7' || model.month == '7')?'selected="selected"':''}>July</option>
							                 		<option value="8" ${(param.month == '8' || model.month == '8')?'selected="selected"':''}>August</option>
							                 		<option value="9" ${(param.month == '9' || model.month == '9')?'selected="selected"':''}>September</option>
							                 		<option value="10" ${(param.month == '10' || model.month == '10')?'selected="selected"':''}>October</option>
							                 		<option value="11" ${(param.month == '11' || model.month == '11')?'selected="selected"':''}>November</option>
							                 		<option value="12" ${(param.month == '12' || model.month == '12')?'selected="selected"':''}>December</option>
							                 	</select>
							                 	Year: 
							                 	<select id="year" name="year" class="dashboard_filter">
							                 		<option value="" ${(param.year == null || param.year == '')?'selected="selected"':''}>All</option>
							                 		<option value="2012" ${(param.year == '2012' || model.year == '2012')?'selected="selected"':''}>2012</option>
							                 		<option value="2013" ${(param.year == '2013' || model.year == '2013')?'selected="selected"':''}>2013</option>
							                 		<option value="2014" ${(param.year == '2014' || model.year == '2014')?'selected="selected"':''}>2014</option>
							                 		<option value="2015" ${(param.year == '2015' || model.year == '2015')?'selected="selected"':''}>2015</option>
							                 		<option value="2016" ${(param.year == '2016' || model.year == '2016')?'selected="selected"':''}>2016</option>
							                 		<option value="2017" ${(param.year == '2017' || model.year == '2017')?'selected="selected"':''}>2017</option>
							                 		<option value="2018" ${(param.year == '2018' || model.year == '2018')?'selected="selected"':''}>2018</option>
							                 	</select>
							                 	
							                 	<c:if test="${model.status != null && fn:length(model.status) >0 }">
								                <div style="display: block;float: right;">
								                 	<span style="padding-right:10px;">Status:</span>
								                 	<select id="status" name="status" class="dashboard_filter">
								                 		<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>All</option>
								                 		<option value="0" ${(param.status == '0')?'selected="selected"':''}>0-Initial revenue report</option>
								                 		<option value="1" ${(param.status == '1')?'selected="selected"':''}>1-Cancell preliminary summit</option>
								                 		<option value="2" ${(param.status == '2')?'selected="selected"':''}>2-Pending/Awaiting preliminary summit</option>
								                 		<option value="4" ${(param.status == '4')?'selected="selected"':''}>4-Merchant confirmation awaiting</option>
								                 		<option value="6" ${(param.status == '6')?'selected="selected"':''}>6-Official/Final approval awaiting</option>
								                 		<option value="8" ${(param.status == '8')?'selected="selected"':''}>8-Payment awaiting</option>
								                 		<option value="10" ${(param.status == '10')?'selected="selected"':''}>10-Payment is done</option>
								                 		<option value="10" ${(param.status == '12')?'selected="selected"':''}>12-Merchant confirmed payment has been made</option>
								                 	</select>
								                </div>
								                </c:if>
							                </div>
							                <div class="filter_row">
							                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Control cycle:</span>
							                 	<c:set var="allpp" value="," />
												<c:forEach var="pp" items="${paramValues.paymentPolicy}">
													<c:set var="allpp" value="${allpp}${pp}," />
												</c:forEach>
							                 	<select id="paymentPolicy" multiple="multiple" name="paymentPolicy" class="dashboard_filter">
							                 		<%-- <option value="" ${(param.paymentPolicy == null || param.paymentPolicy == '')?'selected="selected"':''}>ALl</option> --%>
							                 		<option value="15_1_1" ${fn:contains(allpp, '15_1_1')?'selected="selected"':''}>15+1 (Period I)</option>
							                 		<option value="15_1_2" ${fn:contains(allpp, '15_1_2')?'selected="selected"':''}>15+1 (Period II)</option>
							                 		<option value="30_1" ${fn:contains(allpp, '30_1')?'selected="selected"':''}>30+1</option>
							                 		<option value="30_15" ${fn:contains(allpp, '30_15')?'selected="selected"':''}>30+15</option>
							                 	</select>
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
									                		Contract type:
									                	</span>
													</legend>
													<input type="checkbox" ${fn:contains(allContractType, 'A_B2B')?'checked="checked"':'' } title="A_B2B type" value="A_B2B" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_thecao" class="lbl_chcksub">A_B2B</label>
                                                    <input type="checkbox" ${fn:contains(allContractType, 'A_B2C')?'checked="checked"':'' } title="A_B2C type" value="A_B2C" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_thecao" class="lbl_chcksub">A_B2C</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allContractType, 'B1_B2B')?'checked="checked"':'' } title="B1_B2B type" value="B1_B2B" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_sms" class="lbl_chcksub">B1_B2B</label>
                                                    <input type="checkbox" ${fn:contains(allContractType, 'B1_B2C')?'checked="checked"':'' } title="B1_B2C type" value="B1_B2C" name="contractType" class="chck_filter chargingService" id="contractType">
                                                    <label for="chck_sms" class="lbl_chcksub">B1_B2C</label>
                                                       
													<input type="checkbox" ${fn:contains(allContractType, 'B2_CN')?'checked="checked"':'' } title="B2_CN type" value="B2_CN" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">B2_CN</label>
													
													<input type="checkbox" ${fn:contains(allContractType, 'C_CN')?'checked="checked"':'' } title="C_CN type" value="C_CN" name="contractType" class="chck_filter chargingService" id="contractType"> 
													<label for="chck_wap" class="lbl_chcksub">C_CN</label>
												</fieldset>
                							</div>
							                
							                <div class="filter_row">
							                	<c:set var="allCharging" value="," />
												<c:forEach var="cs" items="${paramValues.chargingService_}">
													<c:set var="allCharging" value="${allCharging}${cs}," />
												</c:forEach>
							                	<fieldset class="fieldset_filter">
													<legend>
									                	<span>
									                		<input type="checkbox" ${param.changeChargingService!=null?'checked="checked"':'' } name="changeChargingService" id="changeChargingService">
									                		Charging type:
									                	</span>
													</legend>
													<input type="checkbox" ${fn:contains(allCharging, 'CARD')?'checked="checked"':'' } title="CARD" value="CARD" name="chargingService_" class="chck_filter chargingService" id="chargingService_">
                                                    <label for="chck_thecao" class="lbl_chcksub">Thẻ cào</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allCharging, 'SMS')?'checked="checked"':'' } title="SMS" value="SMS" name="chargingService_" class="chck_filter chargingService" id="chargingService_">
                                                    <label for="chck_sms" class="lbl_chcksub">SMS</label>
                                                       
													<input type="checkbox" ${fn:contains(allCharging, 'WAP')?'checked="checked"':'' } title="WAP" value="WAP" name="chargingService_" class="chck_filter chargingService" id="chargingService_"> 
													<label for="chck_wap" class="lbl_chcksub">WAP</label>
													
													<input type="checkbox" ${fn:contains(allCharging, 'IAC')?'checked="checked"':'' } title="In-App" value="IAC" name="chargingService_" class="chck_filter chargingService" id="chargingService_"> 
													<label for="chck_wap" class="lbl_chcksub">In-App</label>
												</fieldset>
                							</div>
                							
											<div class="filter_row">
												<span class="add-on" style="padding-left:40px; display:block; width:100px;">
													<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Filter" />
												</span>
											</div>
											<!-- .actions -->
										<!-- .widget-content -->
										</div>
