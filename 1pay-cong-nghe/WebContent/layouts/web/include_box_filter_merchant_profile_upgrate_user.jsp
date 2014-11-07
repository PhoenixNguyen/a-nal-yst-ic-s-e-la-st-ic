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
    $('input[name=chargingService]').attr('checked', true);
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
												<span class="add-on" style="padding-left:40px; display:block; width:100px;">
													<input id="searchComparison" class="btn_greensmall" type="submit" name="submit" value="Lọc kết quả" />
												</span>
											</div>
											<!-- .actions -->
										<!-- .widget-content -->
										</div>
