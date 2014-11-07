<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, vn.onepay.comparison.model.ComparisonInfo" %>
<%
	Account  account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/1pay_style.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/reveal.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
	$('#form_action_save').live('click', function() {
		$('#card_revenue').val(0);
		$('#sms_revenue').val(0);
		$('#wap_revenue').val(0);
		$('#card_amount').val(0);
		$('#sms_amount').val(0);
		$('#wap_amount').val(0);
	});
});
function FormatNumber(obj)
{
	var strvalue;
	if (eval(obj))
	    strvalue = eval(obj).value;
	else
	    strvalue = obj;	
	var num;
	    num = strvalue.toString().replace(/\$|\,/g,'');

	    if(isNaN(num))
	    num = "";
	    sign = (num == (num = Math.abs(num)));
	    num = Math.floor(num*100+0.50000000001);
	    num = Math.floor(num/100).toString();
	    for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
	    num = num.substring(0,num.length-(4*i+3))+','+
	    num.substring(num.length-(4*i+3));
	    //return (((sign)?'':'-') + num);
	    eval(obj).value = (((sign)?'':'-') + num);
}
function formatCurrency(num) 
{
   num = num.toString().replace(/\$|\,/g,'');
   if(isNaN(num))
   num = "0";
   sign = (num == (num = Math.abs(num)));
   num = Math.floor(num*100+0.50000000001);
   num = Math.floor(num/100).toString();
   for (var i = 0; i < Math.floor((num.length-(1+i))/3); i++)
   num = num.substring(0,num.length-(4*i+3))+','+
   num.substring(num.length-(4*i+3));
   return (((sign)?'':'-') + num);
}
function commifyCurrency(Num) {
	Num = Num.toString();
    var newNum = "";
    var newNum2 = "";
    var count = 0;

    //check for decimal number
    if (Num.indexOf('.') != -1){  //number ends with a decimal point
        if (Num.indexOf('.') == Num.length-1){
            Num += "00";
        }
        if (Num.indexOf('.') == Num.length-2){ //number ends with a single digit
            Num += "0";
        }

        var a = Num.split("."); 
        Num = a[0];   //the part we will commify
        var end = a[1] //the decimal place we will ignore and add back later
    }
    else {var end = "00";}  

    //this loop actually adds the commas
    for (var k = Num.length-1; k >= 0; k--){
      var oneChar = Num.charAt(k);
      if (count == 3){
        newNum += ",";
        newNum += oneChar;
        count = 1;
        continue;
      }
      else {
        newNum += oneChar;
        count ++;
      }
   }  //but now the string is reversed!

  //re-reverse the string
  for (var k = newNum.length-1; k >= 0; k--){
      var oneChar = newNum.charAt(k);
      newNum2 += oneChar;
  }

   // add dollar sign and decimal ending from above
   newNum2 = newNum2 + "." + end;
   return newNum2;
}
	
function change_merchant() {
    var textb = $('#merchant').val();
    //$("#merchantName").val(textb);
    //alert(textb);
    if(''!=textb)
	{
    	var url_api = '<%=request.getContextPath()%>/protected/comparison_create_ajax.html';
    	$.ajax({
            type: "GET",
            cache: false,
            url: url_api,
            data: 'a=change_merchant_create&merchant=' + textb,
            processData: false,
            dataType: "json",
            success: function(data) {
                dataresponse = data;                    
            },
            timeout:900000,
            complete: function(){  
                listcomplete1(dataresponse); 
                //$.unblockUI();                   
            },
           error: function(request, error) {    
               //$.unblockUI();   
           }
   		});
	}
    
}

function listcomplete1(data) {
	$("#merchantName").val(data.merchant_name);
	
	var list_telco_card = data.list_telco_card;
	var list_telco_sms = data.list_telco_sms;
	var list_telco_wap = data.list_telco_wap;
	
	$('#contractNo').val(data.contractNo);
	$('#contractDate').val(data.contractDate);
	//Update list telco for Card
	$('#card_telco').empty();
	$.each(list_telco_card, function(i, listTransaction) {
		if(i==0)$("#card_rate").val(listTransaction.rate);
		var card_telco = document.getElementById("card_telco");
 	    var option = document.createElement("option");
 	    option.text = listTransaction.telco;
 	    option.value = listTransaction.telco;
 	    try {
 	    	card_telco.add(option, null);
 	    }catch(error) {
 	    	card_telco.add(option);
 	    }
	});
	//Update list telco for SMS
	$('#sms_telco').empty();
	$.each(list_telco_sms, function(i, listTransaction) {
		if(i==0)$("#sms_rate").val(listTransaction.rate);
		var sms_telco = document.getElementById("sms_telco");
 	    var option = document.createElement("option");
 	    option.text = listTransaction.telco;
 	    option.value = listTransaction.telco;
 	    try {
 	    	sms_telco.add(option, null);
 	    }catch(error) {
 	    	sms_telco.add(option);
 	    }
	});
	//Update list telco for wap
	$('#wap_telco').empty();
	$.each(list_telco_wap, function(i, listTransaction) {
		if(i==0)$("#wap_rate").val(listTransaction.rate);
		var wap_telco = document.getElementById("wap_telco");
 	    var option = document.createElement("option");
 	    option.text = listTransaction.telco;
 	    option.value = listTransaction.telco;
 	    try {
 	    	wap_telco.add(option, null);
 	    }catch(error) {
 	    	wap_telco.add(option);
 	    }
	});
	
	//PaymentPolicy
	var paymentPolicy = data.paymentPolicy;
	$('#paymentPolicy option[value='+paymentPolicy+']').attr('selected','selected');
	
	//clear elements of 3 services
	$('#all_elecment_card').html('<input type="hidden" id="tbody_content" value="0" /><input type="hidden" id="card_telco_exist" value="" />');
	$('#all_elecment_sms').html('<input type="hidden" id="tbody_content_sms" value="0" /><input type="hidden" id="sms_telco_exist" value="" />');
	$('#all_elecment_wap').html('<input type="hidden" id="tbody_content_wap" value="0" /><input type="hidden" id="wap_telco_exist" value="" />');
}

function change_telco_merchant(input,service){
	var textb = $('#merchant').val();
	$('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
	var url_api = '<%=request.getContextPath()%>/protected/comparison_create_ajax.html';
	$.ajax({
        type: "GET",
        cache: false,
        url: url_api,
        data: 'a=change_telco_merchant&merchant=' + textb +'&service='+service+'&telco='+input,
        processData: false,
        dataType: "json",
        success: function(data) {
            dataresponse = data;                    
        },
        timeout:900000,
        complete: function(){  
            $("#"+service+"_rate").val(dataresponse.rate);                
        },
       error: function(request, error) {    
           //$.unblockUI();   
       }
    });
}
</script>
<script>
	//Change TAB
	$(document).ready(function(){
		$("a.tab_common").click(function () {
			$(".tab_slc").addClass("tab");
			$(".tab_slc").removeClass("tab_slc");
			$(this).addClass("tab_slc");
			$(".content").slideUp(1);
			var content_show = $(this).attr("title");
			$("#"+content_show).slideDown(1);
		});
	});
</script>
<script>
//Card Charging TAB
function clickFirstButton(){
	//Validate input
  	if($("#card_amount").val() == undefined || jQuery.trim($("#card_amount").val()) == '')
	{
		alert("Bạn chưa nhập Doanh thu");
		$("#card_amount").focus();
		return ;
	}
  	if($("#card_rate").val() == undefined || jQuery.trim($("#card_rate").val()) == '')
	{
		alert("Bạn chưa nhập tỷ lệ");
		$("#card_rate").focus();
		return ;
	}
  	if($("#card_revenue").val() == undefined || jQuery.trim($("#card_revenue").val()) == '')
	{
		alert("Bạn chưa nhập số tiền được hưởng");
		$("#card_revenue").focus();
		return ;
	}
  	//Kiem tra nha mang:card_telco_exist
  	var card_telco_exist = $("#card_telco_exist").val();
  	var card_telco = $("#card_telco").val();
	if(card_telco_exist !=null && card_telco_exist !=undefined && card_telco_exist!='')
	{
		var arr = new Array();
		arr = card_telco_exist.split("-");
		var s = "";
		var i=0;
		for(i = 1; i<arr.length; i++)
		{
			s = arr[i];
			if(s==card_telco)
			{
				alert("Doanh thu đã tồn tại");
				$("#card_amount").focus();
				return ;
			}
		}
	}
	
	var sanluong = $("#card_amount").val().replace(/\$|\,/g,'');
	var duochuong = $("#card_revenue").val().replace(/\$|\,/g,'');
	sanluong = parseInt(sanluong);
	duochuong = parseInt(duochuong);
	
	if(sanluong<=0){
		alert("Doanh thu phải >0 ");
		$("#card_amount").focus();
		return ;
	}
	var tyle = $("#card_rate").val();
	if(tyle<=0){
		alert("Tỷ lệ phải >0");
		$("#card_rate").focus();
		return ;
	}
	
	if(duochuong<0){
		alert("Số tiền được hưởng phải >0");
		$("#card_revenue").focus();
		return ;
	}
	if(duochuong>=sanluong){
		alert("Số tiền được hưởng phải < Doanh thu");
		$("#card_revenue").focus();
		return ;
	}
	
	$("#card_telco_exist").val($("#card_telco_exist").val()+"-"+card_telco);
  	
    //Hien thi Row moi len Table
    $('#tbody_content').before(table_content());
    //$("#card_amount").val("0");
    //set 0
    $('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
}
//Them 1 DK moi
var table_content = function(){
	var html_ret = '';
	if(true)
	{
		var card_telco = $("#card_telco").val();
		var card_amount = $("#card_amount").val();
		var card_rate = $("#card_rate").val();
		var card_revenue = $("#card_revenue").val();
		//convert
		var card_amount = card_amount.toString().replace(/\$|\,/g,'');
		card_amount = parseInt(card_amount);
		var card_revenue = card_revenue.toString().replace(/\$|\,/g,'');
		card_revenue = parseInt(card_revenue);
		if(card_revenue==0)
		{
			card_revenue=card_amount*card_rate/100;
		}
		//SUM
		var amount_view = Number(parseFloat($("#hd_total_amount_card").val())) + Number(parseFloat(card_amount));
		$("#amount_card").html(commifyCurrency(amount_view));
		var revenue_view = Number(parseFloat($("#hd_total_revenue_card").val())) + Number(parseFloat(card_revenue));
		$("#revenue_card").html(commifyCurrency(revenue_view));
		$("#hd_total_amount_card").val(amount_view);
		$("#hd_total_revenue_card").val(revenue_view);
		
		//TOTAL 
		var total_amount = amount_view+parseFloat($("#hd_total_amount_sms").val())+parseFloat($("#hd_total_amount_wap").val());
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_sms").val())+parseFloat($("#hd_total_revenue_wap").val());
		//TABLE
		$("#tb_amount_card").html(commifyCurrency(amount_view));
		$("#tb_revenue_card").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		var zIndex = 1;
		if(parseInt($('input[name=hd_size]').size()) > 0) zIndex = parseInt($('input[name=hd_size]').size()) + 1;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size]').size()==0)
		{
			html_ret += '<tr id="title_table_dk">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="100" >Tỷ lệ</td>';
				html_ret += '<td class="transhead" width="100" >Được hưởng</td>';
				html_ret += '<td  class="transhead" width="80" align="center">Chức năng</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + card_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_telco+'" name="hd_nhamang_card" id="hd_nhamang_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//San luong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-sanluong-'+ zIndex +'">' + commifyCurrency(card_amount) + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_amount+'" name="hd_sanluong_card" id="hd_sanluong_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Ty le
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-tyle-'+ zIndex +'">' + card_rate + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_rate+'" name="hd_tyle_card" id="hd_tyle_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Duoc huong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-duochuong-'+ zIndex +'">' + commifyCurrency(card_revenue) + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_revenue+'" name="hd_revenue_card" id="hd_revenue_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center"><a class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

		html_ret += '</tr>';
	}
	return html_ret;
};
//Xoa DK tren Table
var deleteRowTable = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
		//Xoa trong id check trung
	  	var card_telco_exist = $("#card_telco_exist").val();
	  	var card_telco_exist_update = "";
	  	var id_ = id.split('_')[2];
	  	var card_telco = $("#hd_nhamang_card-"+id_).val();
		if(card_telco_exist !=null && card_telco_exist !=undefined && card_telco_exist!='')
		{
			var arr = new Array();
			arr = card_telco_exist.split("-");
			var s = "";
			var i=0;
			for(i = 0; i<arr.length; i++)
			{
				s = arr[i];
				if(s!=card_telco)
				{
					card_telco_exist_update=card_telco_exist_update+"-"+s;
				}
			}
		}
		$("#card_telco_exist").val(card_telco_exist_update);
		
		//SUM
		var amount_view = parseFloat($("#hd_total_amount_card").val()) - parseFloat($("#hd_sanluong_card-"+id_).val());
		$("#amount_card").html(commifyCurrency(amount_view));
		$("#hd_total_amount_card").val(amount_view);
		var revenue_view = parseFloat($("#hd_total_revenue_card").val()) - parseFloat($("#hd_revenue_card-"+id_).val());
		$("#revenue_card").html(commifyCurrency(revenue_view));
		$("#hd_total_revenue_card").val(revenue_view);
		//TOTAL 
		var total_amount = amount_view+parseFloat($("#hd_total_amount_sms").val())+parseFloat($("#hd_total_amount_wap").val());
		//alert(parseFloat($("#hd_total_amount_sms").val()));
		//alert(parseFloat($("#hd_total_amount_wap").val()));
		//$("#total_amount").html(total_amount);
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_sms").val())+parseFloat($("#hd_total_revenue_wap").val());
		//$("#total_revenue").html(total_revenue);
		//TABLE
		$("#tb_amount_card").html(commifyCurrency(amount_view));
		$("#tb_revenue_card").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		$("#row-index-" + id.split('_')[2]).remove();
		var vai_ = 1;
		for (var i=1; i <= $("#hd_size").size(); i++)
		{
			if($("#row-index-" + i).html() != undefined && $("#row-index-" + i).html() != '')
			{
				$("#row-id-" + i).html('<strong>' + vai_ + '</strong>');
				vai_++;
			}
		}

		if($('input[name=hd_size]').size()==0)
		{
			$('#title_table_dk').remove();
		}
		
	}
};
</script>

<script>
//SMS Charging TAB
function clickFirstButtonSMS(){
	//Validate input
  	if($("#sms_amount").val() == undefined || jQuery.trim($("#sms_amount").val()) == '')
	{
		alert("Bạn chưa nhập Doanh thu");
		$("#sms_amount").focus();
		return ;
	}
  	if($("#sms_rate").val() == undefined || jQuery.trim($("#sms_rate").val()) == '')
	{
		alert("Bạn chưa nhập tỷ lệ");
		$("#sms_rate").focus();
		return ;
	}
  	
  	var sanluong = $("#sms_amount").val().replace(/\$|\,/g,'');
	var duochuong = $("#sms_revenue").val().replace(/\$|\,/g,'');
	sanluong = parseInt(sanluong);
	duochuong = parseInt(duochuong);
	
	if(sanluong<=0){
		alert("Doanh thu phải >0 ");
		$("#sms_amount").focus();
		return ;
	}
	var tyle = $("#sms_rate").val();
	if(tyle<=0){
		alert("Tỷ lệ phải >0");
		$("#sms_rate").focus();
		return ;
	}
	
	if(duochuong<0){
		alert("Số tiền được hưởng phải >0");
		$("#sms_revenue").focus();
		return ;
	}
	if(duochuong>=sanluong){
		alert("Số tiền được hưởng phải < Doanh thu");
		$("#sms_revenue").focus();
		return ;
	}
  	
    //Kiem tra nha mang:card_telco_exist
  	var sms_telco_exist = $("#sms_telco_exist").val();
  	var sms_telco = $("#sms_telco").val();
	if(sms_telco_exist !=null && sms_telco_exist !=undefined && sms_telco_exist!='')
	{
		var arr = new Array();
		arr = sms_telco_exist.split("-");
		var s = "";
		var i=0;
		for(i = 1; i<arr.length; i++)
		{
			s = arr[i];
			if(s==sms_telco)
			{
				alert("Doanh thu đã tồn tại");
				$("#sms_amount").focus();
				return ;
			}
		}
	}
	$("#sms_telco_exist").val($("#sms_telco_exist").val()+"-"+sms_telco);
	
    //Hien thi Row moi len Table
    $('#tbody_content_sms').before(table_content_sms());
    //$("#sms_amount").val("0");
    $('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
}
//Them 1 DK moi
var table_content_sms = function(){
	var html_ret = '';
	if(true)
	{
		var sms_telco = $("#sms_telco").val();
		var sms_amount = $("#sms_amount").val();
		var sms_rate = $("#sms_rate").val();
		var sms_revenue = $("#sms_revenue").val();
		//convert
		var sms_amount = sms_amount.toString().replace(/\$|\,/g,'');
		sms_amount = parseInt(sms_amount);
		var sms_revenue = sms_revenue.toString().replace(/\$|\,/g,'');
		sms_revenue = parseInt(sms_revenue);
		if(sms_revenue==0)
		{
			sms_revenue=sms_amount*sms_rate/100;
		}
		
		//SUM
		var amount_view = parseFloat($("#hd_total_amount_sms").val()) + parseFloat(sms_amount);
		$("#amount_sms").html(commifyCurrency(amount_view));
		var revenue_view = parseFloat($("#hd_total_revenue_sms").val()) + parseFloat(sms_revenue);
		$("#revenue_sms").html(commifyCurrency(revenue_view));
		$("#hd_total_amount_sms").val(amount_view);
		$("#hd_total_revenue_sms").val(revenue_view);
		//TOTAL 
		/*
		var total_amount = parseFloat($("#amount_card").html())+amount_view+parseFloat($("#amount_wap").html());
		$("#total_amount").html(total_amount);
		var total_revenue = parseFloat($("#revenue_card").html())+revenue_view+parseFloat($("#revenue_wap").html());
		$("#total_revenue").html(total_revenue);
		*/
		
		var total_amount = amount_view+parseFloat($("#hd_total_amount_card").val())+parseFloat($("#hd_total_amount_wap").val());
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_card").val())+parseFloat($("#hd_total_revenue_wap").val());
		
		//TABLE
		/*
		$("#tb_amount_sms").html(amount_view);
		$("#tb_revenue_sms").html(revenue_view);
		$("#tb_total_amount").html(total_amount);
		$("#tb_total_revenue").html(total_revenue);
		*/
		
		$("#tb_amount_sms").html(commifyCurrency(amount_view));
		$("#tb_revenue_sms").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		var zIndex = 1;
		if(parseInt($('input[name=hd_size_sms]').size()) > 0) zIndex = parseInt($('input[name=hd_size_sms]').size()) + 1;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size_sms]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_sms">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="100" >Tỷ lệ</td>';
				html_ret += '<td class="transhead" width="100" >Được hưởng</td>';
				html_ret += '<td  class="transhead" width="80" align="center">Chức năng</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-sms-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size_sms">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + sms_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+sms_telco+'" name="hd_nhamang_sms" id="hd_nhamang_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//San luong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-sanluong-'+ zIndex +'">' + commifyCurrency(sms_amount) + '</span>';
			html_ret +=	'<input type="hidden" value="'+sms_amount+'" name="hd_sanluong_sms" id="hd_sanluong_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Ty le
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-tyle-'+ zIndex +'">' + sms_rate + '</span>';
			html_ret +=	'<input type="hidden" value="'+sms_rate+'" name="hd_tyle_sms" id="hd_tyle_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Duoc huong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-duochuong-'+ zIndex +'">' + commifyCurrency(sms_revenue) + '</span>';
			html_ret +=	'<input type="hidden" value="'+sms_revenue+'" name="hd_revenue_sms" id="hd_revenue_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center"><a class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableSMS(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

		html_ret += '</tr>';
	}
	return html_ret;
};
//Xoa DK tren Table
var deleteRowTableSMS = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
		//Xoa trong id check trung
	  	var sms_telco_exist = $("#sms_telco_exist").val();
	  	var sms_telco_exist_update = "";
	  	var id_ = id.split('_')[2];
	  	//alert("#hd_nhamang_sms-"+id_);
	  	var sms_telco = $("#hd_nhamang_sms-"+id_).val();
	  	//alert(card_telco);
		if(sms_telco_exist !=null && sms_telco_exist !=undefined && sms_telco_exist!='')
		{
			var arr = new Array();
			arr = sms_telco_exist.split("-");
			var s = "";
			var i=0;
			for(i = 0; i<arr.length; i++)
			{
				s = arr[i];
				if(s!=sms_telco)
				{
					sms_telco_exist_update=sms_telco_exist_update+"-"+s;
				}
			}
		}
		$("#sms_telco_exist").val(sms_telco_exist_update);
		
		//SUM
		var amount_view = parseFloat($("#hd_total_amount_sms").val()) - parseFloat($("#hd_sanluong_sms-"+id_).val());
		$("#amount_sms").html(commifyCurrency(amount_view));
		$("#hd_total_amount_sms").val(amount_view);
		var revenue_view = parseFloat($("#hd_total_revenue_sms").val()) - parseFloat($("#hd_revenue_sms-"+id_).val());
		$("#revenue_sms").html(commifyCurrency(revenue_view));
		$("#hd_total_revenue_sms").val(revenue_view);
		
		/*
		var amount_view = parseFloat($("#amount_sms").html()) - parseFloat($("#hd_sanluong_sms-"+id_).val());
		$("#amount_sms").html(amount_view);
		var revenue_view = parseFloat($("#revenue_sms").html()) - parseFloat($("#hd_revenue_sms-"+id_).val());
		$("#revenue_sms").html(revenue_view);
		*/
		//TOTAL 
		var total_amount = parseFloat($("#hd_total_amount_card").val())+amount_view+parseFloat($("#hd_total_amount_wap").val());
		$("#total_amount").html(total_amount);
		var total_revenue = parseFloat($("#hd_total_revenue_card").val())+revenue_view+parseFloat($("#hd_total_revenue_wap").val());
		$("#total_revenue").html(total_revenue);
		//TABLE
		$("#tb_amount_sms").html(commifyCurrency(amount_view));
		$("#tb_revenue_sms").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		$("#row-sms-index-" + id.split('_')[2]).remove();
		var vai_ = 1;
		for (var i=1; i <= $("#hd_size_sms").size(); i++)
		{
			if($("#row-sms-index-" + i).html() != undefined && $("#row-sms-index-" + i).html() != '')
			{
				$("#row-id-" + i).html('<strong>' + vai_ + '</strong>');
				vai_++;
			}
		}

		if($('input[name=hd_size_sms]').size()==0)
		{
			$('#title_table_dk_sms').remove();
		}
	}
};
</script>
<script>
//WAP Charging TAB
function clickFirstButtonWAP(){
	//Validate input
  	if($("#wap_amount").val() == undefined || jQuery.trim($("#wap_amount").val()) == '')
	{
		alert("Bạn chưa nhập Doanh thu");
		$("#wap_amount").focus();
		return ;
	}
  	if($("#wap_rate").val() == undefined || jQuery.trim($("#wap_rate").val()) == '')
	{
		alert("Bạn chưa nhập tỷ lệ");
		$("#wap_rate").focus();
		return ;
	}
  	
  	var sanluong = $("#wap_amount").val().replace(/\$|\,/g,'');
	var duochuong = $("#wap_revenue").val().replace(/\$|\,/g,'');
	sanluong = parseInt(sanluong);
	duochuong = parseInt(duochuong);
	if(sanluong<=0){
		alert("Doanh thu phải >0 ");
		$("#wap_amount").focus();
		return ;
	}
	var tyle = $("#wap_rate").val();
	if(tyle<=0){
		alert("Tỷ lệ phải >0");
		$("#wap_rate").focus();
		return ;
	}
	
	if($("#wap_revenue").val() == undefined || jQuery.trim($("#wap_revenue").val()) == '')
	{
		alert("Bạn chưa nhập số tiền được hưởng");
		$("#wap_revenue").focus();
		return ;
	}
	
	if(duochuong<0){
		alert("Số tiền được hưởng phải >0");
		$("#wap_revenue").focus();
		return ;
	}
	if(duochuong>=sanluong){
		alert("Số tiền được hưởng phải < Doanh thu");
		$("#wap_revenue").focus();
		return ;
	}
  	
  //Kiem tra nha mang:card_telco_exist
  	var wap_telco_exist = $("#wap_telco_exist").val();
  	var wap_telco = $("#wap_telco").val();
	if(wap_telco_exist !=null && wap_telco_exist !=undefined && wap_telco_exist!='')
	{
		var arr = new Array();
		arr = wap_telco_exist.split("-");
		var s = "";
		var i=0;
		for(i = 1; i<arr.length; i++)
		{
			s = arr[i];
			if(s==wap_telco)
			{
				alert("Doanh thu đã tồn tại");
				$("#wap_amount").focus();
				return ;
			}
		}
	}
	$("#wap_telco_exist").val($("#wap_telco_exist").val()+"-"+wap_telco);
  	
    //Hien thi Row moi len Table
    $('#tbody_content_wap').before(table_content_wap());
    //$("#wap_amount").val("0");
    $('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
}
//Them 1 DK moi
var table_content_wap = function(){
	var html_ret = '';
	if(true)
	{
		var wap_telco = $("#wap_telco").val();
		var wap_amount = $("#wap_amount").val();
		var wap_rate = $("#wap_rate").val();
		var wap_revenue = $("#wap_revenue").val();
		//convert
		var wap_amount = wap_amount.toString().replace(/\$|\,/g,'');
		wap_amount = parseInt(wap_amount);
		var wap_revenue = wap_revenue.toString().replace(/\$|\,/g,'');
		wap_revenue = parseInt(wap_revenue);
		if(wap_revenue==0)
		{
			wap_revenue=wap_amount*wap_rate/100;
		}
		/*
		var amount_view = parseFloat($("#amount_wap").html()) + parseFloat(wap_amount);
		$("#amount_wap").html(amount_view);
		var revenue_view = parseFloat($("#revenue_wap").html()) + parseFloat(wap_revenue);
		$("#revenue_wap").html(revenue_view);
		*/
		
		//SUM
		var amount_view = Number(parseFloat($("#hd_total_amount_wap").val())) + Number(parseFloat(wap_amount));
		$("#amount_wap").html(commifyCurrency(amount_view));
		var revenue_view = Number(parseFloat($("#hd_total_revenue_wap").val())) + Number(parseFloat(wap_revenue));
		$("#revenue_wap").html(commifyCurrency(revenue_view));
		$("#hd_total_amount_wap").val(amount_view);
		$("#hd_total_revenue_wap").val(revenue_view);
		
		/*
		var total_amount = parseFloat($("#amount_card").html())+parseFloat($("#amount_sms").html())+amount_view;
		$("#total_amount").html(total_amount);
		var total_revenue = parseFloat($("#revenue_card").html())+parseFloat($("#revenue_sms").html())+revenue_view;
		$("#total_revenue").html(total_revenue);
		
		$("#tb_amount_wap").html(amount_view);
		$("#tb_revenue_wap").html(revenue_view);
		$("#tb_total_amount").html(total_amount);
		$("#tb_total_revenue").html(total_revenue);
		*/
		//TOTAL 
		var total_amount = amount_view+parseFloat($("#hd_total_amount_card").val())+parseFloat($("#hd_total_amount_sms").val());
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_card").val())+parseFloat($("#hd_total_revenue_sms").val());
		//TABLE
		$("#tb_amount_wap").html(commifyCurrency(amount_view));
		$("#tb_revenue_wap").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		var zIndex = 1;
		if(parseInt($('input[name=hd_size_wap]').size()) > 0) zIndex = parseInt($('input[name=hd_size_wap]').size()) + 1;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size_wap]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_wap">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="100" >Tỷ lệ</td>';
				html_ret += '<td class="transhead" width="100" >Được hưởng</td>';
				html_ret += '<td  class="transhead" width="80" align="center">Chức năng</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-wap-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size_wap">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + wap_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+wap_telco+'" name="hd_nhamang_wap" id="hd_nhamang_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//San luong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-sanluong-'+ zIndex +'">' + commifyCurrency(wap_amount) + '</span>';
			html_ret +=	'<input type="hidden" value="'+wap_amount+'" name="hd_sanluong_wap" id="hd_sanluong_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Ty le
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-tyle-'+ zIndex +'">' + wap_rate + '</span>';
			html_ret +=	'<input type="hidden" value="'+wap_rate+'" name="hd_tyle_wap" id="hd_tyle_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Duoc huong
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-duochuong-'+ zIndex +'">' + commifyCurrency(wap_revenue) + '</span>';
			html_ret +=	'<input type="hidden" value="'+wap_revenue+'" name="hd_revenue_wap" id="hd_revenue_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center"><a class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableWAP(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

		html_ret += '</tr>';
	}
	return html_ret;
};
//Xoa DK tren Table
var deleteRowTableWAP = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
		//Xoa trong id check trung
	  	var wap_telco_exist = $("#wap_telco_exist").val();
	  	var wap_telco_exist_update = "";
	  	var id_ = id.split('_')[2];
	  	///alert("#hd_nhamang_wap-"+id_);
	  	var wap_telco = $("#hd_nhamang_wap-"+id_).val();
	  	//alert(wap_telco);
		if(wap_telco_exist !=null && wap_telco_exist !=undefined && wap_telco_exist!='')
		{
			var arr = new Array();
			arr = wap_telco_exist.split("-");
			var s = "";
			var i=0;
			for(i = 0; i<arr.length; i++)
			{
				s = arr[i];
				if(s!=wap_telco)
				{
					wap_telco_exist_update=wap_telco_exist_update+"-"+s;
				}
			}
		}
		$("#wap_telco_exist").val(wap_telco_exist_update);
		
		/*
		var amount_view = parseFloat($("#amount_wap").html()) - parseFloat($("#hd_sanluong_wap-"+id_).val());
		$("#amount_wap").html(amount_view);
		var revenue_view = parseFloat($("#revenue_wap").html()) - parseFloat($("#hd_revenue_wap-"+id_).val());
		$("#revenue_wap").html(revenue_view);
		*/
		//SUM
		var amount_view = parseFloat($("#hd_total_amount_wap").val()) - parseFloat($("#hd_sanluong_wap-"+id_).val());
		$("#amount_wap").html(commifyCurrency(amount_view));
		$("#hd_total_amount_wap").val(amount_view);
		var revenue_view = parseFloat($("#hd_total_revenue_wap").val()) - parseFloat($("#hd_revenue_wap-"+id_).val());
		$("#revenue_wap").html(commifyCurrency(revenue_view));
		$("#hd_total_revenue_wap").val(revenue_view);
		//TOTAL 
		var total_amount = parseFloat($("#hd_total_amount_card").val())+parseFloat($("#hd_total_amount_sms").val())+amount_view;
		$("#total_amount").html(total_amount);
		var total_revenue = parseFloat($("#hd_total_revenue_card").val())+parseFloat($("#hd_total_revenue_sms").val())+revenue_view;
		$("#total_revenue").html(total_revenue);
		//TABLE
		$("#tb_amount_wap").html(commifyCurrency(amount_view));
		$("#tb_revenue_wap").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		
		$("#row-wap-index-" + id.split('_')[2]).remove();
		var vai_ = 1;
		for (var i=1; i <= $("#hd_size_wap").size(); i++)
		{
			if($("#row-wap-index-" + i).html() != undefined && $("#row-wap-index-" + i).html() != '')
			{
				$("#row-id-" + i).html('<strong>' + vai_ + '</strong>');
				vai_++;
			}
		}

		if($('input[name=hd_size_wap]').size()==0)
		{
			$('#title_table_dk_wap').remove();
		}
		
		//hd_sanluong_wap-1 hd_revenue_wap-1
		
		
	}
};
</script>
</head>

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
						<!-- Left Menu -->
						<%request.setAttribute("comparisonNavMenu", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<!-- Right Content -->
						<form:form id="create_comparison" name="create_comparison" commandName="create_comparison" method="post">
						<div class="right_content">
							<h1 class="srv_title">Đối soát thanh toán</h1>
							<div class="srv_row">
								<span style="color: red"><form:errors path="*"/></span>
							</div>
                			<div class="srv_row">
       	    					<table cellpadding="5" cellspacing="0">
									<tbody>
									<tr>
										<td class="profile_label" width="200">Đối tác</td>
										<td>
	                                        <form:select path="merchant" cssClass="slc_gl" onchange="change_merchant();">
									    		<form:options items="${merchants}"/>
									    	</form:select>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label">
											Tên đối tác
										</td>
										<td>
											<form:input path="merchantName" class="txt_reglog"/>
										</td>
									</tr>
	                                <tr>
										<td class="profile_label" width="140">
											Hợp đồng số</td>
										<td>
											<form:input path="contractNo" class="txt_reglog"/>
	                                    </td>
									</tr>
	                                <tr>
										<td class="profile_label" width="140">
											Ký ngày</td>
										<td>
											<form:input path="contractDate" class="txt_reglog" placeholder="dd/MM/yyyy"/>
	                                    </td>
									</tr>
									<tr>
										<td class="profile_label">
											Chu kỳ thanh toán
										</td>
										<td>
	                                        <form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
	                                    </td>
									</tr>
									<tr>
										<td class="profile_label">
											Tháng đối soát
										</td>
										<td>
	                                        <form:select path="monthComparison" items="${months}" class="slc_gl"/>
	                                        &nbsp;Năm:
	                                        <form:select path="yearComparison" items="${years}" class="slc_gl"/>
	                                    </td>
									</tr>
									<tr>
										<td class="profile_label">
											Loại hợp đồng
										</td>
										<td>
	                                        <form:select path="contractType" items="${contractType}" class="slc_gl"/>
	                                    </td>
									</tr>
						   			</tbody>
						   		</table>
                           </div>
                           
              			<div id="dash_tab">
	                    	<a href="#" class="tab_common tab" title="all_charging_id"><span>Tất cả</span></a>
	                    	<a href="#" class="tab_common tab_slc" title="card_charging_id"><span>Card Charging</span></a>
	                        <a href="#" class="tab_common tab" title="sms_charging_id"><span>Sms Charging</span></a>
	                        <a href="#" class="tab_common tab" title="wap_charging_id"><span>Wap Charging</span></a>
	                        <div class="clear"></div>
                    	</div>
                    	<!-- Tat ca -->
                    	<div class="srv_row content" style="display: none;" id="all_charging_id">
	                        <div class="srv_row" style="width: 700px; margin:auto;"">
                				<table width="100%;" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
			                       			<tbody id="all_elecment_card">
			                       				<tr id="title_table_dk">
				                       				<td class="transhead" width="100">#</td>
				                       				<td class="transhead" width="260">Service</td>
				                       				<td class="transhead" width="160" >Doanh thu</td>
				                       				<td class="transhead" width="160" >Được hưởng</td>
				                       			</tr>
				                       			<tr>
													<td class="svr_data" style="padding: 8px" width="100" align="center">
														1
													</td>
													<td class="svr_data" style="padding: 8px" width="260" align="center">
														Card Charging
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_amount_card">0 đ</span>
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_revenue_card">0 đ</span>
													</td>
												</tr>
												<tr>
													<td class="svr_data" style="padding: 8px" width="100" align="center">
														2
													</td>
													<td class="svr_data" style="padding: 8px" width="260" align="center">
														Sms Charging
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_amount_sms">0 đ</span>
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_revenue_sms">0 đ</span>
													</td>
												</tr>
												<tr>
													<td class="svr_data" style="padding: 8px" width="100" align="center">
														3
													</td>
													<td class="svr_data" style="padding: 8px" width="260" align="center">
														Wap Charging
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_amount_wap">0 đ</span>
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_revenue_wap">0 đ</span>
													</td>
												</tr>
												<tr>
													<td class="svr_data" style="padding: 8px" width="100" align="center">
														
													</td>
													<td class="svr_data" style="padding: 8px" width="260" align="center">
														Tổng
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_total_amount">0 đ</span>
														<input id="input_total_amount" value="0" type="hidden"/>
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_total_revenue">0 đ</span>
														<input id="input_total_revenue" value="0" type="hidden"/>
													</td>
												</tr>
			                       			</tbody>
			                      </table>
               				</div>
                    	</div>
                    	<!-- /Tat ca -->
                    	<!-- Telco of CARD service -->
                    	<div class="srv_row content" id="card_charging_id">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<form:select path="card_telco" items="${ls_card_telco}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'card');"/>
	                                </td>
	                            	<td width="220">
	                            		<label>Doanh thu:</label>
	                            		<form:input path="card_amount" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this);"/>
	                            	</td>
	                                <td width="105">
	                                	<label>Tỷ lệ:</label>
	                                	<form:input path="card_rate" class="txt_doisoat" style="width:50px;"/>
	                                </td>
	                                <td width="240">
	                                	<label>Được hưởng:</label>
	                                	<form:input path="card_revenue" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this);"/>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:50px;" onclick="clickFirstButton()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_card">
		                         	<input type="hidden" id="tbody_content" value="0" />
		                            <input type="hidden" id="card_telco_exist" value="" />
		                            <tr id="title_table_dk">
	                       				<td class="transhead" ></td>
	                       				<td class="transhead" >Tổng</td>
	                       				<td class="transhead" width="100" >
	                       					<div id="amount_card">0</div>
	                       					<input type="hidden" id="hd_total_amount_card" value="0" />
	                       				</td>
	                       				<td class="transhead" width="100" ></td>
	                       				<td class="transhead" width="100" >
	                       					<div id="revenue_card">0</div>
	                       					<input type="hidden" id="hd_total_revenue_card" value="0" />
	                       				</td>
	                       				<td  class="transhead" width="80" align="center"></td>
	                       			</tr>
                       		</tbody>
                     		</table>
               				</div>  
                    	</div>
                    	<!-- /Telco of CARD service -->
                    	<!-- Telco of SMS service -->
                    	<div class="srv_row content" style="display: none;" id="sms_charging_id">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<form:select path="sms_telco" items="${ls_sms_telco}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'sms');"/>
	                                </td>
	                            	<td width="220">
	                            		<label>Doanh thu:</label>
	                            		<form:input path="sms_amount" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this);"/>
	                            	</td>
	                                <td width="105">
	                                	<label>Tỷ lệ:</label>
	                                	<form:input path="sms_rate" class="txt_doisoat" style="width:50px;"/>
	                                </td>
	                                <td width="240">
	                            		<label>Được hưởng:</label>
	                            		<form:input path="sms_revenue" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this);"/>
	                            	</td>
	                                <td>
	                                    <input type="button" value="Thêm mới" class="btn_themmoi" style="width:50px;" onclick="clickFirstButtonSMS()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_sms">
		                         	<input type="hidden" id="tbody_content_sms" value="0" />
		                         	<input type="hidden" id="sms_telco_exist" value="" />
		                         	<tr id="title_table_dk">
	                       				<td class="transhead" ></td>
	                       				<td class="transhead" >Tổng</td>
	                       				<td class="transhead" width="100" >
	                       					<div id="amount_sms">0</div>
	                       					<input type="hidden" id="hd_total_amount_sms" value="0" />
	                       				</td>
	                       				<td class="transhead" width="100" ></td>
	                       				<td class="transhead" width="100" >
	                       					<div id="revenue_sms">0</div>
	                       					<input type="hidden" id="hd_total_revenue_sms" value="0" />
	                       				</td>
	                       				<td  class="transhead" width="80" align="center"></td>
	                       			</tr>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of SMS service -->
                    	<!-- Telco of WAP service -->
                    	<div class="srv_row content" style="display: none;" id="wap_charging_id">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<form:select path="wap_telco" items="${ls_wap_telco}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'wap');"/>
	                                </td>
	                            	<td width="220">
	                            		<label>Doanh thu:</label>
	                            		<form:input path="wap_amount" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this); max"/>
	                            	</td>
	                                <td width="105">
	                                	<label>Tỷ lệ:</label>
	                                	<form:input path="wap_rate" class="txt_doisoat" style="width:50px;"/>
	                                </td>
	                                <td width="240">
	                                	<label>Được hưởng:</label>
	                                	<form:input path="wap_revenue" class="txt_doisoat" maxlength="14" onkeyup="FormatNumber(this);"/>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm mới" class="btn_themmoi" style="width:50px;" onclick="clickFirstButtonWAP()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_wap">
		                         	<input type="hidden" id="tbody_content_wap" value="0" />
		                            <input type="hidden" id="wap_telco_exist" value="" />
		                            <tr id="title_table_dk">
	                       				<td class="transhead" ></td>
	                       				<td class="transhead" >Tổng</td>
	                       				<td class="transhead" width="100" >
	                       					<div id="amount_wap">0</div>
	                       					<input type="hidden" id="hd_total_amount_wap" value="0" />
	                       				</td>
	                       				<td class="transhead" width="100" ></td>
	                       				<td class="transhead" width="100" >
	                       					<div id="revenue_wap">0</div>
	                       					<input type="hidden" id="hd_total_revenue_wap" value="0" />
	                       				</td>
	                       				<td  class="transhead" width="80" align="center"></td>
	                       			</tr>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of WAP service -->
                    	
               			<div class="srv_row">
       	    				<table cellpadding="5" cellspacing="0">
							<tbody>
								<tr>
									<td class="profile_label">
										Tổng số tiền Merchant đã được tạm ứng
									</td>
									<td>
										<form:input path="advance_payment" class="txt_reglog"/>
									</td>
								</tr>
								<tr>
									<td class="profile_label">
										Phí mở mã (80.000 đ/ mã)
									</td>
									<td>
										<form:input path="fee_open" class="txt_reglog"/>
									</td>
								</tr>
                                <tr>
									<td class="profile_label" width="140">
										Phí duy trì mã (32.000 đ/ mã)</td>
									<td>
										<form:input path="fee_maintain" class="txt_reglog"/>
                                    </td>
								</tr>
                                <tr>
									<td class="profile_label" width="140">
										Thuế TNCN (nếu có)</td>
									<td>
										<form:input path="income_tax" class="txt_reglog"/>
                                    </td>
								</tr>
                                 <tr>
									<td class="profile_label" width="140">
										Phí hoàn trả cước khách hàng khiếu nại (nếu có)</td>
									<td>
										<form:input path="fee_chargeback" class="txt_reglog"/>
                                    </td>
								</tr>
                                <tr>
									<td class="profile_label" width="140">
										Phí khác (nếu có)</td>
									<td>
										<form:input path="fee_other" class="txt_reglog"/>
                                    </td>
								</tr>
						   </tbody>
						   </table>
                      	</div>
	                      <div>
	                      		<input type="submit" id="form_action_save" class="btn_greensmall" value="Cập nhật"/>
	                      		<a href="<%=request.getContextPath()%>/protected/comparison.html" class="btn_graysmall">Hủy bỏ</a>
	                      </div>
						</div>
						</form:form>
						<!-- /Right Conent -->
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
	<script type="text/javascript">
		/*         */
		jQuery(function($) {

			$(function() {
				$('#hot_productslides').slides({
					preload : true,
					preloadImage : 'images/loading.gif',
					play : 5000,
					pause : 2500,
					hoverPause : true
				});
			});

		});
		/*   */
	</script>
	<!-- Create Menu Settings: (Menu ID, Is Vertical, Show Timer, Hide Timer, On Click ('all' or 'lev2'), Right to Left, Horizontal Subs, Flush Left, Flush Top) -->
	<script type="text/javascript">
		qm_create(0, false, 0, 250, false, false, false, false, false);
	</script>
	<!--[if IE]><iframe onload="on_script_loaded(function() { HashKeeper.reloading=false; });" style="display: none" name="hashkeeper" src="/blank" height="1" width="1" id="hashkeeper"></iframe><![endif]-->
	
</body>
</html>
