<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="${pageContext.request.contextPath }/css/personal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.datetimepicker.css"/>

<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.countdownTimer.js"></script>
<script src="<%=request.getContextPath()%>/js/numeral.js" type="text/javascript"></script>
<script src="<%=request.getContextPath() %>/js/jquery.datetimepicker.js"></script>

<style>
    .fieldset_filter {border: solid 1px #ccc;margin-left:20px; margin-bottom:20px; width: auto;}
</style>

<script type="text/javascript">
$(function(){
    
    $("#filter_merchant").multiselect({
        selectedList: 4,
        noneSelectedText: "Tất cả"
    });
    $("#filter_provider").multiselect({
        selectedList: 4,
        noneSelectedText: "Tất cả"
    });
    $("#filter_card_type").multiselect({
        selectedList: 4,
        noneSelectedText: "Tất cả"
    });
    $("#filter_card_amount").multiselect({
        selectedList: 4,
        noneSelectedText: "Tất cả"
    });
});
</script>

<style >
    .search_ , .search_:HOVER{
        background: url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
        color: #FFFFFF;
        display: block;
        float: right;
        font-weight: bold;
        height: 20px;
        line-height: 20px;
        padding-left: 5px;
        padding-right: 5px;
        border: 1px solid #39B54A;
        border-radius: 10px;
        text-shadow: 0 1px #20942B;
    }
    
    .box_locketqua table a{
        font-size: 14px;
        color: #2c8f39;
        padding-top: 2px;
        
    }
    
    .box_locketqua table a.slc_link {
        color: #FFA200;
    }
    
    .select_filter{
        border: 1px solid #CCCCCC;
        padding: 6px;
        margin: 0px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        width: 194px;
        margin-left: 0px;
        box-shadow: 0 0 0 #000000, 0 3px 3px #EEEEEE inset;
    }
    .text_filter{
        border: 1px solid #CCCCCC;
        padding: 6px;
        margin: 0px;
        -webkit-border-radius: 3px;
        -moz-border-radius: 3px;
        border-radius: 3px;
        width: 180px;
        margin-left: 0px;
        box-shadow: 0 0 0 #000000, 0 3px 3px #EEEEEE inset;
    }
    .chart , .chart:HOVER{
        background: url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
        color: #FFFFFF;
        display: block;
        float: right;
        font-weight: bold;
        height: 20px;
        line-height: 20px;
        padding-left: 5px;
        padding-right: 5px;
        border: 1px solid #39B54A;
        border-radius: 10px;
        text-shadow: 0 1px #20942B;
    }
    
    .label_filter{
        margin-left: 20px;
        width: 80px;
        display: inline-block;
    }
    
    .pie{
        margin:auto; display:table; 
    }
    .pie_child{
        
        width: 500px;
    }
    .pie_child_inline{
        /* width: 200px; */
    }
    
    #countdowntimer{
        display: none;
        
    }
    
    .width30{
        width: 30px;
    }
    .width90{
        width: 90px;
    }
    .width20{
        width: 20px;
    }
    .width70{
        width: 70px;
    }
</style>
</head>
<%
    Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
    boolean isAdmin = account.isAdmin();
    boolean mbiz =  SharedConstants.MBIZ && isAdmin;
    request.setAttribute("MBIZ", mbiz);
    
    request.setAttribute("isOperator", account.isOperator());
    request.setAttribute("isBizSupporter", account.isBizSupporter());
    request.setAttribute("isCustomerCare", account.isCustomerCare());
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
                        <jsp:include page="include_personal_bar.jsp" />
                        <!-- Left Menu -->
                        <%request.setAttribute("cardReportElastic", true);%>
                        <jsp:include page="include_personal_menu.jsp" />
                        
                        <div class="right_content">
                            <%-- <a href="<%=request.getContextPath() %>/protected/card-charging.html" class="search_" style="margin-right: 5px;"><span>Tìm kiếm chi tiết</span></a> --%>
                            <h1 class="srv_title">Cảnh báo vi phạm</h1>
                            <div class="dash_row">
                                
                                <div id="dash_tab" style="padding-right: 0; margin-top: 10px;">
                                    
                                    <a href="sms-analytics.html?pv_tab=sms"  class="tab${(param.pv_tab==null || param.pv_tab=='' || param.pv_tab=='sms' || param.pv_tab!='smsplus')?'_slc':''}"><span title="">SMS</span></a> 
                                    <a href="sms-analytics.html?pv_tab=smsplus"  class="tab${param.pv_tab=='smsplus'?'_slc':''}"><span title="">SMSplus</span></a>
                                </div>
                            </div>
                            <div id="countdowntimer">
                                <i>
                                    (refresh sau
                                    <span id="future_date"></span>
                                    giây)
                                </i>
                            </div>
                            <script type="text/javascript">
                            $(function(){
                                    var refresh = '<c:out value="${param.refresh}"/>';
                                    if(refresh == '' || refresh != 'on')
                                        return;
                                    var timeText = '<c:out value="${param.from_date}"/>';
                                    var day = new Date();
                                    var today = new Date(day.getFullYear() +'/' + (day.getMonth() +1) + '/' +day.getDate());
                                    
                                    var timeSearch;
                                    if(timeText != '')
                                        timeSearch = Date.parseExact(timeText, 'dd/MM/yyyy');
                                    else
                                        timeSearch = today;
                                    
                                    if(timeSearch.getTime() >= today.getTime() && timeSearch.getTime() < (today.getTime() + 24*60*60*1000) ){
                                        $('#countdowntimer').css('display', 'block');
                                        $(function(){
                                             $('#future_date').countdowntimer({
                                                 minutes :1,
                                                 size : "lg",
                                                 timeUp : timeisUp
                                             });
                                       });
                                        function timeisUp() {
                                            location.reload();
                                        }
                                    }
                            });
                            </script>
                            
                            <!-- Filter -->
                            <div id="filter_locketqua">
                                <h3 class="filter_label open">
                                    <a href="#">Lọc kết quả</a>
                                </h3>
                            </div>
                            <form action="sms-analytics.html" method="get" name="filter_histogram">
                             <input type="hidden" name="pv_tab" value="${param.pv_tab }"/>
                            <div class="box_locketqua">
                                
                                    <c:forEach items="${model.fieldMaps }" var="map">
                                    
                                        <c:if test="${param[map.key] != null && param[map.key] != ''  }">
                                            <input type="hidden" name="${map.key }" value="${param[map.key] }"/>
                                        </c:if>
                                    </c:forEach>    
                                    
                                    <div class="filter_row">
                                        <label class="label_filter" >Chọn ngày:</label>
                                        <input id="reservation" style="width: 180px;" maxlength="100" name="reservation" value="${model.today == null || model.today =='' ? param.reservation:model.today}" class="select_filter" placeholder="Chọn ngày" title="Chỉ được chọn khoảng thời gian trong 1 tháng"/>
                                        
                                        <label class="label_filter" style="width: 120px; ">Thuê bao:</label>
                                        <input type="text" name="filter_msisdn" class="text_filter" placeholder="Nhập số thuê bao" value="${param.filter_msisdn }"/>
                                            
                                        <script type="text/javascript">
                                            $(function(){
                                                // Check time greate than 30 days
                                                $('form[name=filter_histogram]').submit(function(){
                                                    var reservationRequest = $('#reservation').val();
                                                    var reservation, from_date, to_date;
                                                    
                                                    if(reservationRequest != ''){
                                                        reservation = reservationRequest.split('-');
                                                        from_date = reservation[0].trim();
                                                        to_date = reservation[1].trim();
                                                        
                                                        var fromDate = Date.parseExact(from_date, 'dd/MM/yyyy');
                                                        var toDate = Date.parseExact(to_date, 'dd/MM/yyyy');
                                                        
                                                        var day = Math.floor((toDate.getTime() - fromDate.getTime())/(24*60*60*1000));
                                                        
                                                        var max = '<c:out value="${model.DATE_FILTER_MAX}"/>';
                                                        if(!isNaN(max) && day > parseInt(max)){
                                                            alert('Hãy chọn khoảng thời gian ít hơn 1 tháng!');
                                                            return false;
                                                        }
                                                    }
                                                });
                                                
                                                //Enter
                                                $('form[name=filter_histogram] input[name=filter_merchant]').keydown(function(event) {
                                                    if (event.keyCode == 13) {
                                                        this.form.submit();
                                                        return false;
                                                     }
                                                });
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
                                        <c:if test="${true || model.displayMerchant }">
                                            <label class="label_filter">Merchant:</label>
                                            <input type="text" list="merchants" name="filter_merchant" class="text_filter" placeholder="Nhập tên merchant" value="${param.filter_merchant }"/>
                                            
                                            <datalist id="merchants">
                                                <c:forEach items="${model.merchantList }" var="item">
                                                    <option value="${item }">
                                                </c:forEach>
                                            </datalist>
                                        </c:if>
                                        
                                        <label class="label_filter" style="width: 120px;">Command code:</label>
                                        <input type="text" name="filter_command_code" class="text_filter" placeholder="Nhập Command code" value="${param.filter_command_code }"/>
                                            
                                    </div>
                                    
                                    <div class="filter_row">
                                    <label class="label_filter">Loại vi phạm:</label>
                                        <select class="select_filter" name="filter_type">
                                            <option value="" ${param.filter_type == null || param.filter_type == '' ? 'selected':''}>Tất cả</option>
                                            <c:forEach items="${model.filterTypes}" var="item">
                                                <option value="${item.key }" ${param.filter_type == item.key ? 'selected':''}>${item.value }</option>
                                            </c:forEach>
                                        </select>
                                    </div>
                                    <div class="filter_row">
                                        <fieldset class="fieldset_filter" style="margin-left: 0px;">
                                            <legend>
                                                <input type="checkbox" name="providerAll" value="providerAll" id="providerAll" class="chck_filter" ${fn:contains(param.providerAll,'providerAll')?'checked="checked"':'' }  /> Provider
                                                <script type="text/javascript">
                                                    $(document).ready(function(){
                                                        $('#providerAll').click(function() {
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
                                                <c:set var="allPv" value="," />
                                                <c:forEach var="pv" items="${paramValues.providers}">
                                                    <c:set var="allPv" value="${allPv}${pv}," />
                                                </c:forEach>
                                                <c:forEach var="pv" items="${model.providers}">
                                                    <div style="display: inline-block;">
                                                        <c:set var="_pv" value=",${pv}," />
                                                        <input type="checkbox" class="chck_filter" name="providers" title="${pv}" value="${pv}" 
                                                            ${fn:contains(allPv,_pv)?'checked="checked"':'' } />
                                                        
                                                        <label class="lbl_chcksub">${pv}</label>
                                                    </div>
                                                </c:forEach>
                                            </div>
                                            
                                            <c:if test="${paramValues.providers == null  }">
                                                <script type="text/javascript">
                                                    $(document).ready(function(){
                                                        $('#providerAll').closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
                                                    });
                                                </script>
                                            </c:if>
                                        </fieldset>
                                    </div>
                                <div class="filter_row" style="text-align: center;">
                                    <input name="submitForm" style="margin-top: 0px;"  class="btn_greensmall" type="submit" value="Lọc" />
                                </div>
                            </div>
                            
                            <div class="dash_row">
                                <div id="dash_tab" style="padding-right: 0; margin-top: 10px;">
                                    <a href="javascript:switchTab('subscriber');"  class="tab${(param.tab==null || param.tab=='subscriber' || param.tab=='' || param.tab!='merchant')?'_slc':''}"><span >Thuê bao</span></a> 
                                    <a href="javascript:switchTab('merchant');"  class="tab${param.tab=='merchant'?'_slc':''}"><span title="">Merchant</span></a>
                                    
                                    <input type="hidden" value="subscriber" name="tab"/>
                                    <script type="text/javascript">
                                        function switchTab(tab){
                                            
                                            $('form[name=filter_histogram] input[name=tab]').val(tab);
                                            $('form[name=filter_histogram]').submit();
                                        }
                                    </script> 
                                </div>
                            </div>
                            <script type="text/javascript">
                                $(document).ready(function(){
                                    $('#limit').keydown(function(event) {
                                        if (event.keyCode == 13) {
                                            this.form.submit();
                                            return false;
                                         }
                                    });
                                    $('#refresh').live('click', function(){
                                        var val = $(this).is(':checked');
                                        $(this).prop('checked', val);
                                        $('form[name=filter_histogram]').submit();
                                    }); 
                                });
                            </script>
                            </form>
                            <br/>
                            <!-- End Filter -->
                            
                            <!-- Statisic chart -->
                            <!-- LINE CHART -->
                            <jsp:include page="sms-chart.js.gg.jsp" />
                            <div id="line_chart" style="height: 400px; width: 830px;"></div>
                            
                            <!-- PIE CHART -->
                            <table width="100%">
                            <c:forEach items="${model.topDataMap }" var="items">
                                <tr class="${items.key}">
                                    <td>
                                        <h1 class="srv_title">${model.filterTypes[items.key]}&nbsp
                                            <c:choose>
                                                <c:when test="${model.dataCount[items.key] > 0 }">
                                                    <span style="font-size: 15px;">
                                                        <c:if test="${model.tabFilter == 1 }">(${model.dataCount[items.key]} thuê bao tìm thấy)</c:if>
                                                        <c:if test="${model.tabFilter == 2 }">(${model.dataCount[items.key]} merchant tìm thấy)</c:if>
                                                    </span>
                                                    
                                                </c:when>
                                                <c:otherwise>
	                                                <span style="color: red; font-size: 15px;">
	                                                    <c:if test="${model.tabFilter == 1 }">(Không có thuê bao vi phạm)</c:if>
	                                                    <c:if test="${model.tabFilter == 2 }">(Không có merchant vi phạm)</c:if>
	                                                </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </h1>
                                        <style>
                                            .fieldset_filter .pagelinks{
                                                display: none;
                                            }
                                            #pie_chart .nv-legendWrap{
                                                display: none;
                                            }
                                            .nvtooltip { margin-left: -100px; }
                                        </style>
                                        <div class="srv_row1" style="width: 100%;">
                                            <style>
                                                .fieldset_filter table{
                                                    border: 1px solid #CCC;
                                                }
                                                .fieldset_filter table tr th{
                                                    background: none repeat scroll 0 0 #F3F3F3;
                                                    border: 1px solid #CCCCCC;
                                                    font-weight: bold;
                                                    padding: 5px 8px;
                                                    text-align: center;
                                                }
                                                .fieldset_filter table tr td{
                                                    border: 1px solid #CCCCCC;
                                                    font-size: small;
                                                    padding: 5px;
                                                }
                                                .tr_none{
                                                    display : none;
                                                }
                                                .tr_block{
                                                    display : block;
                                                }
                                                .btn_graytoggle
                                                {
                                                    margin-top: 3px;
                                                    background: url("../images/btngray_bg.png") repeat-x scroll center top transparent;
                                                    border: 1px solid #afafaf;
                                                    border-radius: 5px 5px 5px 5px;
                                                    color: #FFFFFF;
                                                    width: 108px;
                                                    display: block;
                                                    font-size: 14px;
                                                    font-weight: bold;
                                                    padding: 6px 10px 6px 10px;
                                                    text-align: center;
                                                    text-shadow: 0 1px #999;
                                                    cursor: pointer;
                                                    text-decoration: none;
                                                    float: left;
                                                    margin-right: 5px;
                                                }
                                                .toggle{
                                                    text-align: center;
                                                }
                                            </style>
                                            <script type="text/javascript">
                                                var toggle = true;
                                                $(document).ready(function(){
                                                    var tr = '<c:out value="${items.key}" />';
                                                    //alert(tr);
                                                    $('table .'+tr+' .toggle').live('click', function(){
                                                        $('.'+tr+' .tr_none').slideToggle('slow');
                                                        toggle = !toggle;
                                                        if(toggle == false){
                                                            $('.'+tr+' .btn_graytoggle1').html('&#9650;');
                                                        }
                                                        else{
                                                            $('.'+tr+' .btn_graytoggle1').html('&#9660;');
                                                        }
                                                    });
                                                });
                                            </script>
                                            <c:choose>
                                                <c:when test="${items.value.size() > 0}">
                                                    <fieldset class="fieldset_filter" style="width: 15%; float: left; border: none; display: inline-block;">
                                                        <span class="pie">
                                                            <div id="${items.key}pie_chart" class="pie_child_inline" style="width: 300px; height: 380px;">
                                                            </div>
                                                        </span>
                                                    </fieldset>
                                                    
                                                    <fieldset class="fieldset_filter" style="width: 50%; float: right; border: none; display: inline-block;">
                                                        <table width="100%">
                                                            <tr>
                                                                <th>Stt</th>
                                                                <c:choose>
                                                                    <c:when test="${model.tabFilter == 1 }">
                                                                        <th>MSISDN</th>
                                                                        <th>Merchant</th>
                                                                    </c:when>
                                                                    <c:otherwise>
                                                                        <th>Merchant</th>
                                                                        <th>MSISDNs</th>
                                                                    </c:otherwise>
                                                                </c:choose>
                                                                
                                                                <th>SMS</th>
                                                                <th>Amount</th>
                                                            </tr>
                                                            <c:forEach items="${items.value}" var="item" varStatus="index" >
                                                                <fmt:formatNumber type="number" value="${item.amount }" var="amount" maxFractionDigits="3"/>
                                                                <tr ${index.index > 9?'class="tr_none"':''}>
                                                                    <td style="text-align: right;">${index.index + 1 }</td>
                                                                    
                                                                    <c:choose>
                                                                        <c:when test="${model.tabFilter == 1 }">
                                                                            <td>${item.msisdn}</td>
                                                                            <td>${item.merchant }</td>
                                                                        </c:when>
                                                                        <c:otherwise>
                                                                            <td>${item.merchant}</td>
                                                                            <td>${item.count_msisdn }</td>
                                                                        </c:otherwise>
                                                                    </c:choose>
                                                                    
                                                                    <td style="text-align: right;">${item.count_sms }</td>
                                                                    <td style="text-align: right;">${amount }</td>
                                                                </tr>
                                                                
                                                            </c:forEach>
                                                            <c:if test="${items.value.size() > 10}">
                                                                <tr style="height: 25px; padding: 0px;">
                                                                    <td class="toggle " colspan="6" style="padding: 0px;"><span class="btn_graytoggle1" style="display:block; color: blue; cursor: pointer;">&#9660;</span></td>
                                                                </tr>
                                                            </c:if>
                                                        </table>
                                                    </fieldset>
                                                </c:when>
                                                <c:otherwise>
                                                    <span class="pagebanner"> 
                                                        <!-- Không tìm thấy kết quả để hiển thị! -->
                                                    </span>
                                                </c:otherwise>
                                            </c:choose>
                                        </div>
                                    </td>
                                </tr>
                            </c:forEach>
                            <tr>
                                <td>
                                    <h1 class="srv_title">Chi tiết thuê bao</h1>
                                    <script>var rownum = 1;</script>
                                    <%-- <c:if test="${model.total > 0}">
                                        <span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1  } tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. 
                                            &nbsp(Thời gian tìm kiếm ${model.timeHandleTotal /1000.0} giây)
                                        </span>
                                    </c:if> --%>
                                    <br/>
                                    
                                    <display:table name="model.list" id="list" 
                                                    requestURI="sms-analytics.html" 
                                                    pagesize="${model.pagesize}" partialList="true" size="model.total"
                                                    style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
                                                    sort="list">
                                        <%@ include file="display_table.jsp" %>
                                        <display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
                                            <span id="row${list.id}" class="rowid">
                                                <!-- <script>document.write(rownum++);</script> -->
                                                <c:out value="${model.offset + list_rowNum }" />
                                            </span>
                                        </display:column>
                                        
                                        <display:column title="MSISDN" headerClass="transhead" class="transdata" property="msisdn" style="border: 1px solid #CCC;" />
                                        <display:column title="Short code" headerClass="transhead" class="transdata" property="short_code" style="border: 1px solid #CCC;text-align:center;"  />
                                        <display:column title="Command code" headerClass="transhead" class="transdata" property="command_code" style="border: 1px solid #CCC;text-align:left;"  />
                                        <display:column title="Provider" headerClass="transhead" class="transdata" property="provider" style="border: 1px solid #CCC;" />
                                        <display:column title="Telco" headerClass="transhead" class="transdata" property="telco" style="border: 1px solid #CCC;text-align:center;" />
                                        <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
                                        <display:column title="App id" headerClass="transhead" class="transdata" property="app_id" style="border: 1px solid #CCC;" />
                                        <display:column title="Amount" headerClass="transhead" class="transdata" property="amount" style="border: 1px solid #CCC;text-align:right;" format="{0,number,0,000} đ" />
                                        <display:column title="Request time" headerClass="transhead" class="transdata" property="request_time" style="border: 1px solid #CCC;" format="{0,date,dd/MM/yyyy HH:mm:ss}" />
                                        
                                    </display:table>
                                </td>
                            </tr>
                        </table>
                        <!-- /Statisic chart -->
                            
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
