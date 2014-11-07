<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
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
		$('#iac_revenue').val(0);
		$('#card_amount').val(0);
		$('#sms_amount').val(0);
		$('#wap_amount').val(0);
		$('#iac_amount').val(0);
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
	
	//Update list telco for iac
	$('#iac_telco').empty();
	$.each(list_telco_iac, function(i, listTransaction) {
		if(i==0)$("#iac_rate").val(listTransaction.rate);
		var iac_telco = document.getElementById("iac_telco");
 	    var option = document.createElement("option");
 	    option.text = listTransaction.telco;
 	    option.value = listTransaction.telco;
 	    try {
 	    	iac_telco.add(option, null);
 	    }catch(error) {
 	    	iac_telco.add(option);
 	    }
	});
	
	//PaymentPolicy
	var paymentPolicy = data.paymentPolicy;
	$('#paymentPolicy option[value='+paymentPolicy+']').attr('selected','selected');
	
	//clear elements of 4 services
	$('#all_elecment_card').html('<input type="hidden" id="tbody_content" value="0" /><input type="hidden" id="card_telco_exist" value="" />');
	$('#all_elecment_sms').html('<input type="hidden" id="tbody_content_sms" value="0" /><input type="hidden" id="sms_telco_exist" value="" />');
	$('#all_elecment_wap').html('<input type="hidden" id="tbody_content_wap" value="0" /><input type="hidden" id="wap_telco_exist" value="" />');
	$('#all_elecment_iac').html('<input type="hidden" id="tbody_content_iac" value="0" /><input type="hidden" id="iac_telco_exist" value="" />');
}

function change_telco_merchant(input,service){
	var textb = $('#merchant').val();
	$('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#iac_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
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
  	if($("#card_range_rate").val() == undefined || jQuery.trim($("#card_range_rate").val()) == '')
	{
		alert("Bạn chưa nhập khoảng tỷ lệ");
		$("#card_range_rate").focus();
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
		for(i = 0; i<arr.length; i++)
		{
			s = arr[i];
			if(s==card_telco)
			{
				alert("Loại dịch vụ đã tồn tại");
				$("#card_range_rate").focus();
				return ;
			}
		}
	}
	
	//var sanluong = $("#card_amount").val().replace(/\$|\,/g,'');
	//var duochuong = $("#card_revenue").val().replace(/\$|\,/g,'');
	//sanluong = parseInt(sanluong);
	//duochuong = parseInt(duochuong);
	
	/*
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
	*/
	
	//validate tỷ lệ:
	var card_range_rate = $("#card_range_rate").val();
	//alert(card_range_rate);
	var lines = $('#card_range_rate').val().split('\n');
	var amount_before = 0;
	var khoangtyle="";
	var hd_khoangtyle="";
	for(var i = 0;i < lines.length;i++){
	    //code here using lines[i] which will give you each line
	    var card_range_rate_element = lines[i];
	    if(card_range_rate_element == undefined || jQuery.trim(card_range_rate_element) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ");
			$("#card_range_rate").focus();
			return ;
		}
	    //alert(card_range_rate_element);
	    var amount_rate = card_range_rate_element.split(':');
	    if(amount_rate[0] == undefined || jQuery.trim(amount_rate[0]) == ''||amount_rate[1] == undefined || jQuery.trim(amount_rate[1]) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng.");
			$("#card_range_rate").focus();
			return ;
		}
	    
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if(amount_range<0||rate_range<=0||rate_range>100||isNaN(amount_range)||isNaN(rate_range))
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#card_range_rate").focus();
			return ;
		}
	    if(amount_before>=amount_range && i>0)
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng!");
			$("#card_range_rate").focus();
			return ;
	    }
	    amount_before=amount_range;
	    if(i!=lines.length-1)
	    {
	    	khoangtyle=khoangtyle+amount_range+":"+rate_range+"-";
	    }
	}
	
	$("#card_telco_exist").val($("#card_telco_exist").val()+"-"+card_telco);
	
	var max_element_card = parseInt($("#max_element_card").val())+1;
	$("#max_element_card").val(max_element_card);
  	
    //Hien thi Row moi len Table
    $('#tbody_content').before(table_content(max_element_card));
    //$("#card_amount").val("0");
    //set 0
    /*
    $('#card_revenue').val(0);
	$('#sms_revenue').val(0);
	$('#wap_revenue').val(0);
	$('#card_amount').val(0);
	$('#sms_amount').val(0);
	$('#wap_amount').val(0);
	*/
}
//Them 1 DK moi
var table_content = function(max_element_card){
	var html_ret = '';
	if(true)
	{
		var card_telco = $("#card_telco").val();
		//var card_amount = $("#card_amount").val();
		//var card_rate = $("#card_rate").val();
		//var card_revenue = $("#card_revenue").val();
		//convert
		//var card_amount = card_amount.toString().replace(/\$|\,/g,'');
		//card_amount = parseInt(card_amount);
		//var card_revenue = card_revenue.toString().replace(/\$|\,/g,'');
		//card_revenue = parseInt(card_revenue);
		/*
		if(card_revenue==0)
		{
			card_revenue=card_amount*card_rate/100;
		}
		*/
		//SUM
		/*
		var amount_view = Number(parseFloat($("#hd_total_amount_card").val())) + Number(parseFloat(card_amount));
		$("#amount_card").html(commifyCurrency(amount_view));
		var revenue_view = Number(parseFloat($("#hd_total_revenue_card").val())) + Number(parseFloat(card_revenue));
		$("#revenue_card").html(commifyCurrency(revenue_view));
		$("#hd_total_amount_card").val(amount_view);
		$("#hd_total_revenue_card").val(revenue_view);
		*/
		//TOTAL 
		/*
		var total_amount = amount_view+parseFloat($("#hd_total_amount_sms").val())+parseFloat($("#hd_total_amount_wap").val());
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_sms").val())+parseFloat($("#hd_total_revenue_wap").val());
		*/
		//TABLE
		/*
		$("#tb_amount_card").html(commifyCurrency(amount_view));
		$("#tb_revenue_card").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		*/
		
		//Khoang ty le:
		var khoangtyle="";
		var hd_khoangtyle="";
		var lines = $('#card_range_rate').val().split('\n');
		
		/*
		int total = telco_.size();
	     int loop = 1;
	     long amountBefore = 0;
	     String temp="";
	     for(Entry<Long, Double> entry:telco_.entrySet()){
	    	 key_ = entry.getKey();
	    	 value_ = entry.getValue();
	    	 amountRate=new AmountRate(key_, value_);
	    	 rates.add(amountRate);
	    	 
	    	 if(loop>1){
	    		 temp=temp+NumberUtil.thousandseperate(String.valueOf(amountBefore))+" < Doanh Thu <= "+NumberUtil.thousandseperate(String.valueOf(key_))+"<br>";
	    	 }
	    	 if(loop==total){
	    		 temp=temp+NumberUtil.thousandseperate(String.valueOf(key_))+" < Doanh Thu"+"<br>";
	    	 }
	    	 amountBefore = key_;
	    	 loop=loop+1;
	     }
	     */
	     
	    var total = lines.length;
	    var amountBefore = 0;
	    var temp ="";
	    var temp_tyle ="";
		for(var i = 0;i < lines.length;i++){
		    //code here using lines[i] which will give you each line
		    var card_range_rate_element = lines[i];
		    var amount_rate = card_range_rate_element.split(':');
		    var amount_range = amount_rate[0];
		    var rate_range = amount_rate[1];
		    if(i!=lines.length-1)
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range+"\n";
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range+"-";
		    }
		    else
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range;
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range;
		    }
		    
		    if(i>0){
	    		 temp=temp+formatCurrency(amountBefore)+" < Doanh Thu <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < Doanh Thu";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		//if(parseInt($('input[name=hd_size]').size()) > 0) zIndex = parseInt($('input[name=hd_size]').size()) + 1;
		zIndex = max_element_card;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size]').size()==0)
		{
			html_ret += '<tr id="title_table_dk">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="150" >Dải tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="50" align="center">Chức năng</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data width50" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data width70" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + card_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_telco+'" name="hd_nhamang_card" class="hd_nhamang_card" id="hd_nhamang_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Khoảng tỷ lệ
		html_ret += '<td class="svr_data width110" style="padding: 8px" align="center">';
			html_ret +=	'<span  class="dai_doanh_thu" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_card" class="hd_khoangtyle_card" id="hd_khoangtyle_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data width50" style="padding: 8px; text-align:center;" text-align="center"><a class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

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
  	if($("#sms_range_rate").val() == undefined || jQuery.trim($("#sms_range_rate").val()) == '')
	{
		alert("Bạn chưa nhập khoảng tỷ lệ");
		$("#sms_range_rate").focus();
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
		for(i = 0; i<arr.length; i++)
		{
			s = arr[i];
			if(s==sms_telco)
			{
				alert("Loại dịch vụ đã tồn tại");
				$("#sms_amount").focus();
				return ;
			}
		}
	}
	
	//validate tỷ lệ:
	var sms_range_rate = $("#sms_range_rate").val();
	var lines = $('#sms_range_rate').val().split('\n');
	var amount_before = 0;
	var khoangtyle="";
	var hd_khoangtyle="";
	for(var i = 0;i < lines.length;i++){
	    //code here using lines[i] which will give you each line
	    var sms_range_rate_element = lines[i];
	    if(sms_range_rate_element == undefined || jQuery.trim(sms_range_rate_element) == '')
		{
			alert("Bạn chưa nhập dải tỷ lệ");
			$("#card_range_rate").focus();
			return ;
		}
	    //alert(card_range_rate_element);
	    var amount_rate = sms_range_rate_element.split(':');
	    if(amount_rate[0] == undefined || jQuery.trim(amount_rate[0]) == ''||amount_rate[1] == undefined || jQuery.trim(amount_rate[1]) == '')
		{
			alert("Bạn chưa nhập dải tỷ lệ đúng.");
			$("#sms_range_rate").focus();
			return ;
		}
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if(amount_before>=amount_range && i>0)
	    {
	    	alert("Bạn chưa nhập dải tỷ lệ đúng!");
			$("#sms_range_rate").focus();
			return ;
	    }
	    
	    if(amount_before>=amount_range && i>0)
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng!");
			$("#sms_range_rate").focus();
			return ;
	    }
	    amount_before=amount_range;
	    if(i!=lines.length-1)
	    {
	    	khoangtyle=khoangtyle+amount_range+":"+rate_range+"-";
	    }
	}
	
	$("#sms_telco_exist").val($("#sms_telco_exist").val()+"-"+sms_telco);
	
	var max_element_sms = parseInt($("#max_element_sms").val())+1;
	$("#max_element_sms").val(max_element_sms);
	
    //Hien thi Row moi len Table
    $('#tbody_content_sms').before(table_content_sms(max_element_sms));
}
//Them 1 DK moi
var table_content_sms = function(max_element_sms){
	var html_ret = '';
	if(true)
	{
		var sms_telco = $("#sms_telco").val();
		//Khoang ty le:
		var khoangtyle="";
		var hd_khoangtyle="";
		var lines = $('#sms_range_rate').val().split('\n');
		
		var total = lines.length;
	    var amountBefore = 0;
	    var temp ="";
	    var temp_tyle ="";
		for(var i = 0;i < lines.length;i++){
		    //code here using lines[i] which will give you each line
		    var card_range_rate_element = lines[i];
		    var amount_rate = card_range_rate_element.split(':');
		    var amount_range = amount_rate[0];
		    var rate_range = amount_rate[1];
		    if(i!=lines.length-1)
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range+"\n";
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range+"-";
		    }
		    else
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range;
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range;
		    }
		    
		    if(i>0){
	    		 temp=temp+formatCurrency(amountBefore)+" < Doanh Thu <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < Doanh Thu";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		//if(parseInt($('input[name=hd_size_sms]').size()) > 0) zIndex = parseInt($('input[name=hd_size_sms]').size()) + 1;
		zIndex = max_element_sms;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size_sms]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_sms">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Dải tỷ lệ</td>';
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
			html_ret +=	'<input type="hidden" value="'+sms_telco+'" name="hd_nhamang_sms" class="hd_nhamang_sms" id="hd_nhamang_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Khoảng tỷ lệ
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span class="dai_doanh_thu_sms" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_sms" class="hd_khoangtyle_sms" id="hd_khoangtyle_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_sms" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
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
		//alert(sms_telco_exist_update);
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
		
		//alert("#row-sms-index-" + id.split('_')[2]);
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
  	if($("#wap_range_rate").val() == undefined || jQuery.trim($("#wap_range_rate").val()) == '')
	{
		alert("Bạn chưa nhập khoảng tỷ lệ");
		$("#wap_range_rate").focus();
		return ;
	}
  	
  //Kiem tra nha mang:wap_telco_exist
  	var wap_telco_exist = $("#wap_telco_exist").val();
  	var wap_telco = $("#wap_telco").val();
	if(wap_telco_exist !=null && wap_telco_exist !=undefined && wap_telco_exist!='')
	{
		var arr = new Array();
		arr = wap_telco_exist.split("-");
		var s = "";
		var i=0;
		for(i = 0; i<arr.length; i++)
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
	
	//validate tỷ lệ:
	//var wap_range_rate = $("#wap_range_rate").val();
	var lines = $('#wap_range_rate').val().split('\n');
	var amount_before = 0;
	var khoangtyle="";
	//var hd_khoangtyle="";
	for(var i = 0;i < lines.length;i++){
	    //code here using lines[i] which will give you each line
	    var wap_range_rate_element = lines[i];
	    if(wap_range_rate_element == undefined || jQuery.trim(wap_range_rate_element) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ");
			$("#wap_range_rate").focus();
			return ;
		}
	    var amount_rate = wap_range_rate_element.split(':');
	    if(amount_rate[0] == undefined || jQuery.trim(amount_rate[0]) == ''||amount_rate[1] == undefined || jQuery.trim(amount_rate[1]) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng.");
			$("#wap_range_rate").focus();
			return ;
		}
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if(amount_range<0||rate_range<=0||rate_range>100||isNaN(amount_range)||isNaN(rate_range))
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#wap_range_rate").focus();
			return ;
		}
	    if(amount_before>=amount_range && i>0)
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng!");
			$("#wap_range_rate").focus();
			return ;
	    }
	    amount_before=amount_range;
	    if(i!=lines.length-1)
	    {
	    	khoangtyle=khoangtyle+amount_range+":"+rate_range+"-";
	    }
	}
	
	$("#wap_telco_exist").val($("#wap_telco_exist").val()+"-"+wap_telco);
	
	var max_element_wap = parseInt($("#max_element_wap").val())+1;
	$("#max_element_wap").val(max_element_wap);
  	
    //Hien thi Row moi len Table
    $('#tbody_content_wap').before(table_content_wap(max_element_wap));
}
//Them 1 DK moi
var table_content_wap = function(max_element_wap){
	var html_ret = '';
	if(true)
	{
		var wap_telco = $("#wap_telco").val();
		//Khoang ty le:
		var khoangtyle="";
		var hd_khoangtyle="";
		var lines = $('#wap_range_rate').val().split('\n');
		
		var total = lines.length;
	    var amountBefore = 0;
	    var temp ="";
	    var temp_tyle ="";
		for(var i = 0;i < lines.length;i++){
		    //code here using lines[i] which will give you each line
		    var wap_range_rate_element = lines[i];
		    var amount_rate = wap_range_rate_element.split(':');
		    var amount_range = amount_rate[0];
		    var rate_range = amount_rate[1];
		    if(i!=lines.length-1)
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range+"\n";
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range+"-";
		    }
		    else
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range;
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range;
		    }
		    
		    if(i>0){
	    		 temp=temp+formatCurrency(amountBefore)+" < Doanh Thu <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < Doanh Thu";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		//if(parseInt($('input[name=hd_size_wap]').size()) > 0) zIndex = parseInt($('input[name=hd_size_wap]').size()) + 1;
		zIndex = max_element_wap;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size_wap]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_wap">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Dải tỷ lệ</td>';
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
			html_ret +=	'<input type="hidden" value="'+wap_telco+'" name="hd_nhamang_wap" class="hd_nhamang_wap" id="hd_nhamang_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Khoảng tỷ lệ
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span class="dai_doanh_thu_wap" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_wap" class="hd_khoangtyle_wap" id="hd_khoangtyle_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_wap" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
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

<script>
//IAC Charging TAB
function clickFirstButtonIAC(){
	//Validate input
  	if($("#iac_range_rate").val() == undefined || jQuery.trim($("#iac_range_rate").val()) == '')
	{
		alert("Bạn chưa nhập khoảng tỷ lệ");
		$("#iac_range_rate").focus();
		return ;
	}
  	
  //Kiem tra nha mang:iac_telco_exist
  	var iac_telco_exist = $("#iac_telco_exist").val();
  	var iac_telco = $("#iac_telco").val();
	if(iac_telco_exist !=null && iac_telco_exist !=undefined && iac_telco_exist!='')
	{
		var arr = new Array();
		arr = iac_telco_exist.split("-");
		var s = "";
		var i=0;
		for(i = 0; i<arr.length; i++)
		{
			s = arr[i];
			if(s==iac_telco)
			{
				alert("Doanh thu đã tồn tại");
				$("#iac_amount").focus();
				return ;
			}
		}
	}
	
	//validate tỷ lệ:
	//var iac_range_rate = $("#iac_range_rate").val();
	var lines = $('#iac_range_rate').val().split('\n');
	var amount_before = 0;
	var khoangtyle="";
	//var hd_khoangtyle="";
	for(var i = 0;i < lines.length;i++){
	    //code here using lines[i] which will give you each line
	    var iac_range_rate_element = lines[i];
	    if(iac_range_rate_element == undefined || jQuery.trim(iac_range_rate_element) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ");
			$("#iac_range_rate").focus();
			return ;
		}
	    var amount_rate = iac_range_rate_element.split(':');
	    if(amount_rate[0] == undefined || jQuery.trim(amount_rate[0]) == ''||amount_rate[1] == undefined || jQuery.trim(amount_rate[1]) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng.");
			$("#iac_range_rate").focus();
			return ;
		}
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if(amount_range<0||rate_range<=0||rate_range>100||isNaN(amount_range)||isNaN(rate_range))
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#iac_range_rate").focus();
			return ;
		}
	    if(amount_before>=amount_range && i>0)
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng!");
			$("#iac_range_rate").focus();
			return ;
	    }
	    amount_before=amount_range;
	    if(i!=lines.length-1)
	    {
	    	khoangtyle=khoangtyle+amount_range+":"+rate_range+"-";
	    }
	}
	
	$("#iac_telco_exist").val($("#iac_telco_exist").val()+"-"+iac_telco);
	
	var max_element_iac = parseInt($("#max_element_iac").val())+1;
	$("#max_element_iac").val(max_element_iac);
  	
    //Hien thi Row moi len Table
    $('#tbody_content_iac').before(table_content_iac(max_element_iac));
}
//Them 1 DK moi
var table_content_iac = function(max_element_iac){
	var html_ret = '';
	if(true)
	{
		var iac_telco = $("#iac_telco").val();
		//Khoang ty le:
		var khoangtyle="";
		var hd_khoangtyle="";
		var lines = $('#iac_range_rate').val().split('\n');
		
		var total = lines.length;
	    var amountBefore = 0;
	    var temp ="";
	    var temp_tyle ="";
		for(var i = 0;i < lines.length;i++){
		    //code here using lines[i] which will give you each line
		    var iac_range_rate_element = lines[i];
		    var amount_rate = iac_range_rate_element.split(':');
		    var amount_range = amount_rate[0];
		    var rate_range = amount_rate[1];
		    if(i!=lines.length-1)
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range+"\n";
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range+"-";
		    }
		    else
		    {
		    	khoangtyle=khoangtyle+formatCurrency(amount_range)+":"+rate_range;
		    	hd_khoangtyle=hd_khoangtyle+amount_range+":"+rate_range;
		    }
		    
		    if(i>0){
	    		 temp=temp+formatCurrency(amountBefore)+" < Doanh Thu <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < Doanh Thu";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		//if(parseInt($('input[name=hd_size_iac]').size()) > 0) zIndex = parseInt($('input[name=hd_size_iac]').size()) + 1;
		zIndex = max_element_iac;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size_iac]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_iac">';
				html_ret += '<td class="transhead" >#</td>';
				html_ret += '<td class="transhead" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="100" >Dải tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="80" align="center">Chức năng</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-iac-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size_iac">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + iac_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+iac_telco+'" name="hd_nhamang_iac" class="hd_nhamang_iac" id="hd_nhamang_iac-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Khoảng tỷ lệ
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span class="dai_doanh_thu_iac" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_iac" class="hd_khoangtyle_iac" id="hd_khoangtyle_iac-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_iac" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center"><a class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableIAC(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

		html_ret += '</tr>';
	}
	return html_ret;
};
//Xoa DK tren Table
var deleteRowTableIAC = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
		//Xoa trong id check trung
	  	var iac_telco_exist = $("#iac_telco_exist").val();
	  	var iac_telco_exist_update = "";
	  	var id_ = id.split('_')[2];
	  	///alert("#hd_nhamang_iac-"+id_);
	  	var iac_telco = $("#hd_nhamang_iac-"+id_).val();
	  	//alert(wap_telco);
		if(iac_telco_exist !=null && iac_telco_exist !=undefined && iac_telco_exist!='')
		{
			var arr = new Array();
			arr = iac_telco_exist.split("-");
			var s = "";
			var i=0;
			for(i = 0; i<arr.length; i++)
			{
				s = arr[i];
				if(s!=iac_telco)
				{
					iac_telco_exist_update=iac_telco_exist_update+"-"+s;
				}
			}
		}
		$("#iac_telco_exist").val(iac_telco_exist_update);
		
		/*
		var amount_view = parseFloat($("#amount_wiac").html()) - parseFloat($("#hd_sanluong_iac-"+id_).val());
		$("#amount_iac").html(amount_view);
		var revenue_view = parseFloat($("#revenue_iac").html()) - parseFloat($("#hd_revenue_iac-"+id_).val());
		$("#revenue_iac").html(revenue_view);
		*/
		//SUM
		var amount_view = parseFloat($("#hd_total_amount_iac").val()) - parseFloat($("#hd_sanluong_iac-"+id_).val());
		$("#amount_iac").html(commifyCurrency(amount_view));
		$("#hd_total_amount_iac").val(amount_view);
		var revenue_view = parseFloat($("#hd_total_revenue_iac").val()) - parseFloat($("#hd_revenue_iac-"+id_).val());
		$("#revenue_iac").html(commifyCurrency(revenue_view));
		$("#hd_total_revenue_iac").val(revenue_view);
		//TOTAL 
		var total_amount = parseFloat($("#hd_total_amount_card").val())+parseFloat($("#hd_total_amount_sms").val())+amount_view;
		$("#total_amount").html(total_amount);
		var total_revenue = parseFloat($("#hd_total_revenue_card").val())+parseFloat($("#hd_total_revenue_sms").val())+revenue_view;
		$("#total_revenue").html(total_revenue);
		//TABLE
		$("#tb_amount_iac").html(commifyCurrency(amount_view));
		$("#tb_revenue_iac").html(commifyCurrency(revenue_view));
		$("#tb_total_amount").html(commifyCurrency(total_amount));
		$("#tb_total_revenue").html(commifyCurrency(total_revenue));
		
		
		$("#row-iac-index-" + id.split('_')[2]).remove();
		var vai_ = 1;
		for (var i=1; i <= $("#hd_size_iac").size(); i++)
		{
			if($("#row-iac-index-" + i).html() != undefined && $("#row-iac-index-" + i).html() != '')
			{
				$("#row-id-" + i).html('<strong>' + vai_ + '</strong>');
				vai_++;
			}
		}

		if($('input[name=hd_size_iac]').size()==0)
		{
			$('#title_table_dk_iac').remove();
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
						<%request.setAttribute("merchantProfileNavMenu", true);%>
						<jsp:include page="include_operation_left_menu.jsp" />
						
						<!-- Right Content -->
						<form:form id="create_comparison" name="create_comparison" commandName="create_comparison" method="post">
						<div class="right_content">
							<h1 class="srv_title">Tạo Merchant Profile</h1>
							<p class="title-box">Contract information</p>
							<span style="color: red"><form:errors path="*"/></span>
							
                			<div class="srv_row">
       	    					<table cellpadding="5" cellspacing="0">
									<tbody>
									<tr>
										<td class="label_popup_profile" width="200">Đối tác</td>
										<td>
	                                        <form:select path="merchant" items="${merchants}" class="slc_gl" style="text-align:right"/>
                                        </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Tên đối tác
										</td>
										<td>
											<form:input path="merchantName" value="${merchant_name}" class="txt_reglog"/>
										</td>
									</tr>
	                                <tr>
										<td class="label_popup_profile" width="140">
											Hợp đồng số</td>
										<td>
											<form:input path="contractNo" class="txt_reglog"/>
	                                    </td>
									</tr>
	                                <tr>
										<td class="label_popup_profile" width="140">
											Ký ngày</td>
										<td>
											<form:input path="contractDate" class="txt_reglog" placeholder="dd/MM/yyyy"/>
	                                    </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Chu kỳ thanh toán
										</td>
										<td>
	                                        <form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
	                                    </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Loại hợp đồng
										</td>
										<td>
	                                        <form:select path="contractType" items="${contractType}" class="slc_gl"/>
	                                    </td>
									</tr>
									
									<tr>
											<td class="label_popup_profile">
												Thông tin thêm:
											</td>
											<td>
												<textarea id="merchantDesc" name="merchantDesc" rows="4" cols="50" placeholder="Mô tả/lý do hủy bỏ">${merchantProfile.contractInfo.merchantDesc}</textarea>
											</td>
										</tr>
										
										<tr>
											<td class="label_popup_profile">
												Loại tỷ lệ:
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
						   			</tbody>
						   		</table>
                           </div>
                           
                        <p class="title-box">
                        	<b>
                        		Tỷ lệ chia sẻ doanh thu
                        	</b>
                        </p>
                           
              			<div id="dash_tab">
	                    	<a href="#" class="tab_common tab_slc" title="card_charging_id"><span>Card Charging</span></a>
	                        <a href="#" class="tab_common tab" title="sms_charging_id"><span>Sms Charging</span></a>
	                        <a href="#" class="tab_common tab" title="wap_charging_id"><span>Wap Charging</span></a>
	                        <a href="#" class="tab_common tab" title="iac_charging_id"><span>In-App Charging</span></a>
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
														4
													</td>
													<td class="svr_data" style="padding: 8px" width="260" align="center">
														In-App Charging
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_amount_iac">0 đ</span>
													</td>
													<td class="svr_data" style="padding: 8px" width="160" align="center">
														<span id="tb_revenue_iac">0 đ</span>
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
	                            		<form:select path="card_telco" items="${ls_card_telco}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:90px;" onchange="change_telco_merchant(this.value,'card');"/>
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                                <td width="200">
	                                	<textarea id="card_range_rate" name="card_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButton()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_card">
                       			<c:if test="${not empty ls_card_telco}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<td  class="transhead" width="50">Chức năng</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_card_telco}" var="cardCharging" varStatus="i">
									<tr id="row-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
											<input type="hidden" value="1" name="hd_size"/>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${cardCharging.telco}</span>
											<input type="hidden" value="${cardCharging.telco}" name="hd_nhamang_card" class="hd_nhamang_card" id="hd_nhamang_card-${i.index+1}"/>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span  id="td-tyle-${i.index+1}" class="dai_doanh_thu">Doanh thu > 0</span>
											<input type="hidden" value="${cardCharging.amount_rate_range}" name="hd_khoangtyle_card" class="hd_khoangtyle_card" id="hd_khoangtyle_card-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
											${cardCharging.rate}
										</td>
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_card" value="${i.index+1}" />
									</c:if>
								</c:forEach>
		                         	<input type="hidden" id="tbody_content" value="0" />
		                        <c:if test="${not empty ls_card_telco}">
		                        	<input type="hidden" id="card_telco_exist" value="${list_telco_card}" />
		                        </c:if>
		                        <c:if test="${empty ls_card_telco}">
		                        	<input type="hidden" id="card_telco_exist" value="" />
		                        </c:if>
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
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="sms_range_rate" name="sms_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonSMS()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_sms">
                       			<c:if test="${not empty ls_sms_telco}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<td  class="transhead" width="50">Chức năng</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_sms_telco}" var="smsCharging" varStatus="i">
									<tr id="row-sms-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
											<input type="hidden" value="1" name="hd_size_sms"/>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${smsCharging.telco}</span>
											<input type="hidden" value="${smsCharging.telco}" name="hd_nhamang_sms" class="hd_nhamang_sms" id="hd_nhamang_sms-${i.index+1}"/>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span  id="td-tyle-${i.index+1}" class="dai_doanh_thu_sms">Doanh thu > 0</span>
											<input type="hidden" value="${smsCharging.amount_rate_range}" name="hd_khoangtyle_sms" class="hd_khoangtyle_sms" id="hd_khoangtyle_sms-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_sms" width="50" style="padding: 8px" align="center">
											${smsCharging.rate}
										</td>
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTableSMS(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_sms" value="${i.index+1}" />
									</c:if>
								</c:forEach>
		                        <input type="hidden" id="tbody_content_sms" value="0" />
		                        <c:if test="${not empty ls_sms_telco}">
		                        	<input type="hidden" id="sms_telco_exist" value="${list_telco_sms}" />
		                        </c:if>
		                        <c:if test="${empty ls_sms_telco}">
		                        	<input type="hidden" id="sms_telco_exist" value="" />
		                        </c:if>
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
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="wap_range_rate" name="wap_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonWAP()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_wap">
                       			<c:if test="${not empty ls_wap_telco}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<td  class="transhead" width="50">Chức năng</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_wap_telco}" var="wapCharging" varStatus="i">
									<tr id="row-wap-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
											<input type="hidden" value="1" name="hd_size_wap"/>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${wapCharging.telco}</span>
											<input type="hidden" value="${wapCharging.telco}" name="hd_nhamang_wap" class="hd_nhamang_wap" id="hd_nhamang_wap-${i.index+1}"/>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span  id="td-tyle-${i.index+1}" class="dai_doanh_thu_wap">Doanh thu > 0</span>
											<input type="hidden" value="${wapCharging.amount_rate_range}" name="hd_khoangtyle_wap" class="hd_khoangtyle_wap" id="hd_khoangtyle_wap-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_wap" width="50" style="padding: 8px" align="center">
											${wapCharging.rate}
										</td>
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTableWAP(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_wap" value="${i.index+1}" />
									</c:if>
								</c:forEach>
		                        <input type="hidden" id="tbody_content_wap" value="0" />
		                        <c:if test="${not empty ls_wap_telco}">
		                        	<input type="hidden" id="wap_telco_exist" value="${list_telco_wap}" />
		                        </c:if>
		                        <c:if test="${empty ls_wap_telco}">
		                        	<input type="hidden" id="wap_telco_exist" value="" />
		                        </c:if>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of WAP service -->
                    	
                    	<!-- Telco of In-App service -->
                    	<div class="srv_row content" style="display: none;" id="iac_charging_id">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<form:select path="iac_telco" items="${ls_iac_telco}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'iac');"/>
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="iac_range_rate" name="iac_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonIAC()"/>
	                                </td>
	                            </tr>
	                        </table>
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_iac">
                       			<c:if test="${not empty ls_iac_telco}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<td  class="transhead" width="50">Chức năng</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_iac_telco}" var="iacCharging" varStatus="i">
									<tr id="row-iac-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
											<input type="hidden" value="1" name="hd_size_iac"/>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${iacCharging.telco}</span>
											<input type="hidden" value="${iacCharging.telco}" name="hd_nhamang_iac" class="hd_nhamang_iac" id="hd_nhamang_iac-${i.index+1}"/>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span  id="td-tyle-${i.index+1}" class="dai_doanh_thu_iac">Doanh thu > 0</span>
											<input type="hidden" value="${iacCharging.amount_rate_range}" name="hd_khoangtyle_iac" class="hd_khoangtyle_iac" id="hd_khoangtyle_iac-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_iac" width="50" style="padding: 8px" align="center">
											${iacCharging.rate}
										</td>
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTableIAC(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_iac" value="${i.index+1}" />
									</c:if>
								</c:forEach>
		                        <input type="hidden" id="tbody_content_iac" value="0" />
		                        <c:if test="${not empty ls_iac_telco}">
		                        	<input type="hidden" id="iac_telco_exist" value="${list_telco_iac}" />
		                        </c:if>
		                        <c:if test="${empty ls_iac_telco}">
		                        	<input type="hidden" id="iac_telco_exist" value="" />
		                        </c:if>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of In-App service -->
                    	
	                      <div>
	                      	<input type="button" id="preview_merchant_profile" class="btn_merchant_profile_preview" value="Xem trước"/>
	                      	<input type="submit" id="form_action_save" class="btn_greensmall" value="Cập nhật"/>
	                      	<a href="<%=request.getContextPath()%>/protected/comparison.html" class="btn_graysmall">Hủy bỏ</a>
	                      		<script type="text/javascript">
	                      		$(document).ready(function() {
									//<!--Preview Merchant Profile-->
									$('#preview_merchant_profile').live('click', function() {
										var merchant = $("#merchant").val();
										var merchant_name = $("#merchantName").val();
										var contractNo = $("#contractNo").val();
										var contractDate = $("#contractDate").val();
										var contractType = $("#contractType").val();
										var paymentPolicy = $("#paymentPolicy").val();
										
										//popup info
										$(".popup_merchant").html(merchant);
										$(".popup_merchant_name").html(merchant_name);
										$(".popup_contractNo").html(contractNo);
										$(".popup_contract_date").html(contractDate);
										$(".popup_paymentPolicy").html(paymentPolicy);
										$(".popup_contractType").html(contractType);
										
										//CARD
										// get the unique list of classnames
										var optionTexts = [];
										$(".hd_nhamang_card").each(function() { optionTexts.push($(this).val())});
										var optionTexts1 = [];
										$(".hd_khoangtyle_card").each(function() { optionTexts1.push($(this).val())});
										
										var optionTextsDoanhThu = [];
										$(".dai_doanh_thu").each(function() { optionTextsDoanhThu.push($(this).html())});
										var optionTextsTyLe = [];
										$(".dai_ty_le").each(function() { optionTextsTyLe.push($(this).html())});
										
										var number_telco_card = $(".hd_nhamang_card").size();
										//alert(number_telco_card);
										var i;
										var html_value = "";
										for (i = 0; i < number_telco_card; ++i) {
											if(i==0)
											{
												html_value+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_card+'">';
												html_value+='<span  id="td-stt-'+i+'">CARD</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value+='</td>';
												html_value+='</tr>';
											}
											else
											{
												html_value+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value+='</td>';
												html_value+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value+='</td>';
												html_value+='</tr>';
											}
										}
										
										//SMS
										var optionTexts_sms = [];
										$(".hd_nhamang_sms").each(function() { optionTexts_sms.push($(this).val()) });
										var optionTexts1_sms = [];
										$(".hd_khoangtyle_sms").each(function() { optionTexts1_sms.push($(this).val()) });
										
										var optionTextsDoanhThuSMS = [];
										$(".dai_doanh_thu_sms").each(function() { optionTextsDoanhThuSMS.push($(this).html())});
										var optionTextsTyLeSMS = [];
										$(".dai_ty_le_sms").each(function() { optionTextsTyLeSMS.push($(this).html())});
										
										var number_telco_sms = $(".hd_nhamang_sms").size();
										var j;
										var html_value_sms = "";
										for (j = 0; j < number_telco_sms; ++j) {
											//alert(optionTexts[i]+'-'+optionTexts1[i]);
											if(j==0)
											{
												html_value_sms+='<tr id="row-index-'+j+'" class="popup_tr">';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_sms+'">';
												html_value_sms+='<span  id="td-stt-'+j+'">SMS</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-stt-'+j+'">'+j+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTexts_sms[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTextsDoanhThuSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span >'+optionTextsTyLeSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='</tr>';
											}
											else
											{
												html_value_sms+='<tr id="row-index-'+j+'" class="popup_tr">';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-stt-'+j+'">'+j+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTexts_sms[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span  id="td-nhamang-'+j+'">'+optionTextsDoanhThuSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_sms+='<span >'+optionTextsTyLeSMS[j]+'</span>';
												html_value_sms+='</td>';
												html_value_sms+='</tr>';
											}
										}
										
										//WAP
										var optionTexts_wap = [];
										$(".hd_nhamang_wap").each(function() { optionTexts_wap.push($(this).val()) });
										var optionTexts1_wap = [];
										$(".hd_khoangtyle_wap").each(function() { optionTexts1_wap.push($(this).val()) });
										var number_telco_wap = $(".hd_nhamang_wap").size();
										
										var optionTextsDoanhThuWAP = [];
										$(".dai_doanh_thu_wap").each(function() { optionTextsDoanhThuWAP.push($(this).html())});
										var optionTextsTyLeWAP = [];
										$(".dai_ty_le_wap").each(function() { optionTextsTyLeWAP.push($(this).html())});
										
										var z;
										var html_value_wap = "";
										for (z = 0; z < number_telco_wap; ++z) {
											if(z==0)
											{
												html_value_wap+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_wap+'">';
												html_value_wap+='<span  id="td-stt-'+z+'">WAP</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTexts_wap[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span >'+optionTextsTyLeWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='</tr>';
											}
											else
											{
												html_value_wap+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTexts_wap[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_wap+='<span >'+optionTextsTyLeWAP[z]+'</span>';
												html_value_wap+='</td>';
												html_value_wap+='</tr>';
											}
										}
										
										//IAC
										var optionTexts_iac = [];
										$(".hd_nhamang_iac").each(function() { optionTexts_iac.push($(this).val()) });
										var optionTexts1_iac = [];
										$(".hd_khoangtyle_iac").each(function() { optionTexts1_iac.push($(this).val()) });
										var number_telco_iac = $(".hd_nhamang_iac").size();
										
										var optionTextsDoanhThuIAC = [];
										$(".dai_doanh_thu_iac").each(function() { optionTextsDoanhThuIAC.push($(this).html())});
										var optionTextsTyLeIAC = [];
										$(".dai_ty_le_iac").each(function() { optionTextsTyLeIAC.push($(this).html())});
										
										var z;
										var html_value_iac = "";
										for (z = 0; z < number_telco_iac; ++z) {
											if(z==0)
											{
												html_value_iac+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_iac+'">';
												html_value_iac+='<span  id="td-stt-'+z+'">In-App</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-nhamang-'+z+'">'+optionTexts_iac[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuIAC[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span >'+optionTextsTyLeIAC[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='</tr>';
											}
											else
											{
												html_value_iac+='<tr id="row-index-'+z+'" class="popup_tr">';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-stt-'+z+'">'+z+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-nhamang-'+z+'">'+optionTexts_iac[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span  id="td-nhamang-'+z+'">'+optionTextsDoanhThuIAC[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_iac+='<span >'+optionTextsTyLeIAC[z]+'</span>';
												html_value_iac+='</td>';
												html_value_iac+='</tr>';
											}
										}
										///End IAC
										
										$('.popup_tr').remove();
										$('#info_amount_rate_card').before(html_value+html_value_sms+html_value_wap+html_value_iac);
										$(".merchant_profile_link").trigger("click");
										return;
									});
									//Preview Merchant Profile
	                      		});
								</script>
	                      		<div style="display:none">
	                      			<a class="sms_avai1 info_comparison_common card_invi merchant_profile_link" title="Xem thông tin Merchant" href="#merchant_profile_popup" name="merchant_profile_popup"  rel="leanModal">Xem thông tin Merchant Profile</a>
	                      		</div>
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


<!-- Popup Dải tỷ lệ -->
	<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -360px; top: 0px;" id="merchant_profile_popup">
		<div class="right_content">
							<h1 class="srv_title">Merchant Profile</h1>
                			<div class="srv_row">
       	    					<table cellpadding="5" cellspacing="0">
									<tbody>
									<tr>
										<td class="profile_label" width="200">Đối tác:</td>
										<td>
	                                        <span class="popup_merchant" id="popup_merchant"></span>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Tên đối tác:</td>
										<td>
	                                        <span class="popup_merchant_name" id="popup_merchant_name"></span>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Mã hợp đồng:</td>
										<td>
	                                        <span class="popup_contractNo" id="popup_contractNo"></span>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Ngày ký hợp đồng:</td>
										<td>
	                                        <span class="popup_contract_date" id="popup_contract_date"></span>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Chu kỳ thanh toán:</td>
										<td>
	                                        <span class="popup_paymentPolicy" id="popup_paymentPolicy"></span>
                                        </td>
									</tr>
									<tr>
										<td class="profile_label" width="200">Loại hợp đồng:</td>
										<td>
	                                        <span class="popup_contractType" id="popup_contractType"></span>
                                        </td>
									</tr>
						   			</tbody>
						   		</table>
                           </div>
                           
                    	<!-- Ty le -->
                    	<div style="height: 400px; width: 770px; display: auto; overflow:scroll;">
                			<table width="95%" border="1" cellspacing="0" cellpadding="5" style="border-collapse: collapse;">
	                       		<tr>
									<th scope="col">Dịch vụ</th>
									<th scope="col">#</th>
									<th scope="col">Nhà mạng</th>
									<th scope="col">Doanh thu(đ)</th>
									<th scope="col">Tỷ lệ(%)</th>
								</tr>
								<input type="hidden" id="info_amount_rate_card" value="0" />
                     		</table>
                     	</div>
                    	<!-- /Ty le -->
					</div>
					<div style="margin: 0 auto;">
					<input name="reset" value="Đóng" class="btn_graysmall modal_close" type="button" style="float:right"/>
					</div>
	</div>
	<!-- / Popup Dải tỷ lệ -->