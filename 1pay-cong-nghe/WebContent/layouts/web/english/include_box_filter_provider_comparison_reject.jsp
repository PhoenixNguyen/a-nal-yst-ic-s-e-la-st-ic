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
    $('input[name=changeChargingService]').attr('checked', true);
    $('input[name=chargingService]').attr('checked', true);
    //ContractType
    $('input[name=changeContractType]').attr('checked', true);
    $('input[name=contractType]').attr('checked', true);
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
												<span style="padding-left:40px; display:inline-block; width:100px;">Tìm Provider: </span>
												<input id="searchMerchant" name="searchMerchant" value="${param.searchMerchant }" class="dashboard_filter" placeholder="Nhập tài khoản Provider"/>
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
											<div class="filter_row">
							                 	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Tháng:</span>
							                 	<select id="month" name="month" class="dashboard_filter">
							                 		<option value="" ${(param.month == null || param.month == '')?'selected="selected"':''}>Tất cả</option>
							                 		<option value="1" ${(param.month == '1' || model.month == '1')?'selected="selected"':''}>Tháng 1</option>
							                 		<option value="2" ${(param.month == '2' || model.month == '2')?'selected="selected"':''}>Tháng 2</option>
							                 		<option value="3" ${(param.month == '3' || model.month == '3')?'selected="selected"':''}>Tháng 3</option>
							                 		<option value="4" ${(param.month == '4' || model.month == '4')?'selected="selected"':''}>Tháng 4</option>
							                 		<option value="5" ${(param.month == '5' || model.month == '5')?'selected="selected"':''}>Tháng 5</option>
							                 		<option value="6" ${(param.month == '6' || model.month == '6')?'selected="selected"':''}>Tháng 6</option>
							                 		<option value="7" ${(param.month == '7' || model.month == '7')?'selected="selected"':''}>Tháng 7</option>
							                 		<option value="8" ${(param.month == '8' || model.month == '8')?'selected="selected"':''}>Tháng 8</option>
							                 		<option value="9" ${(param.month == '9' || model.month == '9')?'selected="selected"':''}>Tháng 9</option>
							                 		<option value="10" ${(param.month == '10' || model.month == '10')?'selected="selected"':''}>Tháng 10</option>
							                 		<option value="11" ${(param.month == '11' || model.month == '11')?'selected="selected"':''}>Tháng 11</option>
							                 		<option value="12" ${(param.month == '12' || model.month == '12')?'selected="selected"':''}>Tháng 12</option>
							                 	</select>
							                 	Năm: 
							                 	<select id="year" name="year" class="dashboard_filter">
							                 		<option value="" ${(param.year == null || param.year == '')?'selected="selected"':''}>Tất cả</option>
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
								                 	<span style="padding-right:10px;">Trạng thái:</span>
								                 	<select id="status" name="status" class="dashboard_filter">
								                 		<option value="" ${(param.status == null || param.status == '')?'selected="selected"':''}>Tất cả</option>
								                 		<option value="1" ${(param.status == '1')?'selected="selected"':''}>1-Hủy đề nghị duyệt đối soát</option>
								                 		<option value="3" ${(param.status == '3')?'selected="selected"':''}>3-Bị hủy duyệt đối soát</option>
								                 		<option value="5" ${(param.status == '5')?'selected="selected"':''}>5-Provider hủy xác nhận đối soát</option>
								                 		<option value="7" ${(param.status == '7')?'selected="selected"':''}>7-Provider hủy xác nhận hoàn thành thanh toán</option>
								                 		<option value="9" ${(param.status == '9')?'selected="selected"':''}>9-1Pay hủy xác nhận được thanh toán</option>
								                 	</select>
								                </div>
								                </c:if>
							                </div>
							                <div class="filter_row">
							                	<span class="add-on" style="padding-left:40px; display:block; width:100px;">Chu kỳ đối soát:</span>
							                 	<select id="paymentPolicy" name="paymentPolicy" class="dashboard_filter">
							                 		<option value="" ${(param.paymentPolicy == null || param.paymentPolicy == '')?'selected="selected"':''}>Tất cả</option>
							                 		<option value="15_1" ${(param.paymentPolicy == '15_1')?'selected="selected"':''}>15+1</option>
							                 		<option value="15_25" ${(param.paymentPolicy == '15_25')?'selected="selected"':''}>15+25</option>
							                 		
							                 		<option value="30_1" ${(param.paymentPolicy == '30_1')?'selected="selected"':''}>30+1</option>
							                 		<option value="30_10" ${(param.paymentPolicy == '30_10')?'selected="selected"':''}>30+10</option>
							                 		<option value="30_15" ${(param.paymentPolicy == '30_15')?'selected="selected"':''}>30+15</option>
							                 		<option value="30_25" ${(param.paymentPolicy == '30_25')?'selected="selected"':''}>30+25</option>
							                 	</select>
							                 </div>
							                 
							                <div class="filter_row">
							                	<c:set var="allCharging" value="," />
												<c:forEach var="cs" items="${paramValues.chargingService}">
													<c:set var="allCharging" value="${allCharging}${cs}," />
												</c:forEach>
							                	<fieldset class="fieldset_filter">
													<legend>
									                	<span>
									                		<input type="checkbox" ${param.changeChargingService!=null?'checked="checked"':'' } name="changeChargingService" id="changeChargingService">
									                		Loại charging:
									                	</span>
													</legend>
													<input type="checkbox" ${fn:contains(allCharging, 'CARD')?'checked="checked"':'' } title="Thẻ cào" value="CARD" name="chargingService" class="chck_filter chargingService" id="chargingService">
                                                    <label for="chck_thecao" class="lbl_chcksub">Thẻ cào</label>
                                                       
                                                    <input type="checkbox" ${fn:contains(allCharging, 'SMS')?'checked="checked"':'' } title="SMS" value="SMS" name="chargingService" class="chck_filter chargingService" id="chargingService">
                                                    <label for="chck_sms" class="lbl_chcksub">SMS</label>
                                                       
													<input type="checkbox" ${fn:contains(allCharging, 'WAP')?'checked="checked"':'' } title="WAP" value="WAP" name="chargingService" class="chck_filter chargingService" id="chargingService"> 
													<label for="chck_wap" class="lbl_chcksub">WAP</label>
													
													<input type="checkbox" ${fn:contains(allCharging, 'IAC')?'checked="checked"':'' } title="IAC" value="IAC" name="chargingService" class="chck_filter chargingService" id="chargingService"> 
													<label for="chck_iac" class="lbl_chcksub">IAC</label>
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
