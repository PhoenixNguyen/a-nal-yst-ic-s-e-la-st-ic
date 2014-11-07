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
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.multiselect.css" />
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/css/jquery-ui.min.css" />

<style>
	.close {position:absolute;top:1px;right:1px;padding:3px 6px;display: block;border-radius: 10px;width: 10px;background-color: #2c8f39;color: #fff;}
</style>	
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.alphanumeric.pack.js"></script>	

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery-ui-1.8.24.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/top_up-min.js"></script>
<script type="text/javascript">
	TopUp.host = "<%=request.getContextPath()%>/";
  	TopUp.images_path = "images/";
</script>

<script type="text/javascript" charset="utf-8">
$(document).ready(function() {
	$('.is_alpha_nocaps').alpha({nocaps:true});
	$('.is_alpha_allow_space').alpha({allow:" "});
	$('.is_alphanumeric_name').alphanumeric({allow:" "});
	$('.is_alphanumeric_allow_space').alphanumeric({allow:"-_/.:, "});
	$('.is_numeric').numeric();
	$('.is_alphanumeric').alphanumeric();
	$('.is_email').alphanumeric({allow:"@."});
	$('.is_content').alphanumeric({allow:"-_/."});
	$('.is_date').numeric({allow:"/"});
	$('.is_rate_range').numeric({allow:":."});
});

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
	
	//clear elements of 3 services
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
	$('#iac_amount').val(0);
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
	
	//validate tỷ lệ:
	var card_range_rate = $("#card_range_rate").val();
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
	    var amount_rate = card_range_rate_element.split(':');
	    
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if((amount_rate[0]==null || amount_rate[0]=='' || amount_rate[0].length==0)||(amount_rate[1]==null || amount_rate[1]=='' || amount_rate[1].length==0))
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#card_range_rate").focus();
			return ;
	    }
	    if(amount_range<0||rate_range<=0||rate_range>=100||isNaN(amount_rate[0])||isNaN(amount_rate[1]))
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
}
//Them 1 DK moi
var table_content = function(max_element_card){
	var html_ret = '';
	if(true)
	{
		var card_telco = $("#card_telco").val();
		//Khoang ty le:
		var khoangtyle="";
		var hd_khoangtyle="";
		var lines = $('#card_range_rate').val().split('\n');
		
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
	    		 temp=temp+formatCurrency(amountBefore)+" < DT <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < DT";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		zIndex = max_element_card;
		//Them tile cho table neu add DK dau tien
		/* if($('input[name=hd_size]').size()==0)
		{
			html_ret += '<tr id="title_table_dk">';
				html_ret += '<td class="transhead" width="20">#</td>';
				html_ret += '<td class="transhead" width="30">Nhà mạng</td>';
				html_ret += '<td class="transhead" width="210" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="50" >Tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="50" align="center">Chức năng</td>';
			html_ret += '</tr>';
		} */
		html_ret += '<tr id="row-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size">';
		html_ret +=	'</td>';
		//Nha mang
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-nhamang-'+ zIndex +'">' + card_telco + '</span>';
			html_ret +=	'<input type="hidden" value="'+card_telco+'" name="hd_nhamang_card" class="hd_nhamang_card" id="hd_nhamang_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//Khoảng tỷ lệ
		html_ret += '<td class="svr_data" style="padding: 8px" align="center" width="210">';
			html_ret +=	'<span class="dai_doanh_thu" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_card" class="hd_khoangtyle_card" id="hd_khoangtyle_card-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px;" align="center"><a style="margin-left:40px;" class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

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
		var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_sms").val())+parseFloat($("#hd_total_revenue_wap").val());
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
			//$('#title_table_dk').remove();
		}
		
	}
};

var deleteRowTableNoConfirm = function(id)
{
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
	var total_revenue = revenue_view+parseFloat($("#hd_total_revenue_sms").val())+parseFloat($("#hd_total_revenue_wap").val());
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
		//$('#title_table_dk').remove();
	}
};

var clearAllRowTableCard = function()
{
	var answer = confirm("Bạn có muốn xóa tất cả tỷ lệ Card Charging không?");
	if(answer){
		var max_element_card = parseInt($("#max_element_card").val());
		for (var i=1; i <= max_element_card; i++)
		{
			deleteRowTableNoConfirm('delete_button_'+i);
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
			$("#sms_range_rate").focus();
			return ;
		}
	    var amount_rate = sms_range_rate_element.split(':');
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if((amount_rate[0]==null || amount_rate[0]=='' || amount_rate[0].length==0)||(amount_rate[1]==null || amount_rate[1]=='' || amount_rate[1].length==0))
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#sms_range_rate").focus();
			return ;
	    }
	    if(amount_range<0||rate_range<=0||rate_range>=100||isNaN(amount_rate[0])||isNaN(amount_rate[1]))
		{
			alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
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
	    		 temp=temp+formatCurrency(amountBefore)+" < DT <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < DT";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		zIndex = max_element_sms;
		//Them tile cho table neu add DK dau tien
		/* if($('input[name=hd_size_sms]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_sms">';
				html_ret += '<td class="transhead" width="20" >#</td>';
				html_ret += '<td class="transhead" width="30" >Nhà mạng</td>';
				html_ret += '<td class="transhead" width="210" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="50" >Tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="50" align="center">Chức năng</td>';
			html_ret += '</tr>';
		} */
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
		html_ret += '<td class="svr_data" style="padding: 8px" align="center" width="210">';
			html_ret +=	'<span class="dai_doanh_thu_sms" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_sms" class="hd_khoangtyle_sms" id="hd_khoangtyle_sms-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_sms" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px;" align="center"><a style="margin-left:40px;" class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableSMS(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

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
	  	var sms_telco = $("#hd_nhamang_sms-"+id_).val();
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

var deleteRowTableSMSNoConfirm = function(id)
{
	//Xoa trong id check trung
  	var sms_telco_exist = $("#sms_telco_exist").val();
  	var sms_telco_exist_update = "";
  	var id_ = id.split('_')[2];
  	var sms_telco = $("#hd_nhamang_sms-"+id_).val();
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
};

var clearAllRowTableSMS = function()
{
	var answer = confirm("Bạn có muốn xóa tất cả tỷ lệ SMS Charging không?");
	if(answer){
		var max_element_sms = parseInt($("#max_element_sms").val());
		for (var i=1; i <= max_element_sms; i++)
		{
			deleteRowTableSMSNoConfirm('delete_button_'+i);
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
	var lines = $('#wap_range_rate').val().split('\n');
	var amount_before = 0;
	var khoangtyle="";
	for(var i = 0;i < lines.length;i++){
	    var wap_range_rate_element = lines[i];
	    if(wap_range_rate_element == undefined || jQuery.trim(wap_range_rate_element) == '')
		{
			alert("Bạn chưa nhập khoảng tỷ lệ");
			$("#wap_range_rate").focus();
			return ;
		}
	    var amount_rate = wap_range_rate_element.split(':');
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if((amount_rate[0]==null || amount_rate[0]=='' || amount_rate[0].length==0)||(amount_rate[1]==null || amount_rate[1]=='' || amount_rate[1].length==0))
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#wap_range_rate").focus();
			return ;
	    }
	    if(amount_range<0||rate_range<=0||rate_range>=100||isNaN(amount_rate[0])||isNaN(amount_rate[1]))
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
	    		 temp=temp+formatCurrency(amountBefore)+" < DT <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < DT";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		zIndex = max_element_wap;
		//Them tile cho table neu add DK dau tien
		/* if($('input[name=hd_size_wap]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_wap">';
				html_ret += '<td class="transhead" width="20">#</td>';
				html_ret += '<td class="transhead" width="30">Nhà mạng</td>';
				html_ret += '<td class="transhead" width="210" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="50" >Tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="50" align="center">Chức năng</td>';
			html_ret += '</tr>';
		} */
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
		html_ret += '<td class="svr_data" style="padding: 8px" align="center" width="210">';
			html_ret +=	'<span class="dai_doanh_thu_wap" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_wap" class="hd_khoangtyle_wap" id="hd_khoangtyle_wap-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_wap" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px;" align="center"><a style="margin-left:40px;" class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableWAP(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

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
	  	var wap_telco = $("#hd_nhamang_wap-"+id_).val();
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
	}
};

var deleteRowTableWAPNoConfirm = function(id)
{
	//Xoa trong id check trung
  	var wap_telco_exist = $("#wap_telco_exist").val();
  	var wap_telco_exist_update = "";
  	var id_ = id.split('_')[2];
  	var wap_telco = $("#hd_nhamang_wap-"+id_).val();
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
};

var clearAllRowTableWAP = function()
{
	var answer = confirm("Bạn có muốn xóa tất cả tỷ lệ Wap Charging không?");
	if(answer){
		var max_element_wap = parseInt($("#max_element_wap").val());
		for (var i=1; i <= max_element_wap; i++)
		{
			deleteRowTableWAPNoConfirm('delete_button_'+i);
		}
	}
};
</script>

<script>
//SMS Plus Charging TAB
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
	    var amount_range = parseFloat(amount_rate[0]);
	    var rate_range = parseFloat(amount_rate[1]);
	    if((amount_rate[0]==null || amount_rate[0]=='' || amount_rate[0].length==0)||(amount_rate[1]==null || amount_rate[1]=='' || amount_rate[1].length==0))
	    {
	    	alert("Bạn chưa nhập khoảng tỷ lệ đúng,");
			$("#wap_range_rate").focus();
			return ;
	    }
	    if(amount_range<0||rate_range<=0||rate_range>=100||isNaN(amount_rate[0])||isNaN(amount_rate[1]))
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
	if(isNaN(max_element_iac)) max_element_iac=1;
		
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
	    		 temp=temp+formatCurrency(amountBefore)+" < DT <= "+formatCurrency(amount_range)+"<br>";
	    	}
	    	if(i==total-1){
	    		 temp=temp+formatCurrency(amount_range)+" < DT";
	    	}
	    	amountBefore = amount_range;
	    	
	    	temp_tyle=temp_tyle+rate_range+"<br>";
		}
		
		var zIndex = 1;
		zIndex = max_element_iac;
		//Them tile cho table neu add DK dau tien
		/* if($('input[name=hd_size_iac]').size()==0)
		{
			html_ret += '<tr id="title_table_dk_iac">';
				html_ret += '<td class="transhead" width="20">#</td>';
				html_ret += '<td class="transhead" width="30">Nhà mạng</td>';
				html_ret += '<td class="transhead" width="210" >Doanh thu</td>';
				html_ret += '<td class="transhead" width="50" >Tỷ lệ</td>';
				html_ret += '<td  class="transhead" width="50" align="center">Chức năng</td>';
			html_ret += '</tr>';
		} */
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
		html_ret += '<td class="svr_data" style="padding: 8px" align="center" width="210">';
			html_ret +=	'<span class="dai_doanh_thu_iac" id="td-khoangtyle-'+ zIndex +'">' + temp + '</span>';
			html_ret +=	'<input type="hidden" value="'+hd_khoangtyle+'" name="hd_khoangtyle_iac" class="hd_khoangtyle_iac" id="hd_khoangtyle_iac-'+ zIndex +'">';
		html_ret +=	'</td>';
		//tỷ lệ
		html_ret += '<td class="svr_data width50 dai_ty_le_iac" style="padding: 8px" align="center">';
			html_ret +=	'<span >' + temp_tyle + '</span>';
		html_ret +=	'</td>';
		//Chuc nang
		html_ret += '<td class="svr_data" style="padding: 8px;" align="center"><a style="margin-left:40px;" class="link_cancel" id="delete_button_'+ zIndex +'"  onclick="deleteRowTableIAC(this.id);" href="javascript: void(0);" title="Xóa"></a></td>';

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
	  	var iac_telco = $("#hd_nhamang_iac-"+id_).val();
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
	}
};

var deleteRowTableIACNoconfirm = function(id)
{
	//Xoa trong id check trung
  	var iac_telco_exist = $("#iac_telco_exist").val();
  	var iac_telco_exist_update = "";
  	var id_ = id.split('_')[2];
  	var iac_telco = $("#hd_nhamang_iac-"+id_).val();
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
};

var clearAllRowTableIAC = function()
{
	var answer = confirm("Bạn có muốn xóa tất cả tỷ lệ SMS Plus Charging không?");
	if(answer){
		var max_element_iac = parseInt($("#max_element_iac").val());
		for (var i=1; i <= max_element_iac; i++)
		{
			deleteRowTableIACNoconfirm('delete_button_'+i);
		}
	}
};
</script>

<style>
	.w_50 { width:50%; float:left}
	.label_popup_edit_contact {
	width: 120px;
	float: left;
	padding-right: 10px;
	text-align: right;
	line-height:30px;
	}
	.contract_content span {
	font-size:14px;	
	font-weight: bold;
	color: #2C8F39;
	line-height: 30px;
	}
	.dashboard_filter_2 {
	border: 1px solid #CCCCCC;
	padding: 6px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	box-shadow: 0 0 0 #000000, 0 3px 3px #EEEEEE inset;
	margin:3px 0px;
	width:190px;
	}
	select.dashboard_filter_2 { width:204px}
	input.dashboard_filter_2 {width:190px;}
</style>
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
						<jsp:include page="include_personal_menu.jsp" />
						
						<!-- Right Content -->
						<form:form enctype="multipart/form-data" id="edit_merchant_profile" name="edit_merchant_profile" commandName="edit_merchant_profile" method="post">
						<div class="right_content">
							<h1 class="srv_title">Sửa profile của <c:out value="${merchants}"/></h1>
							<div>
								<span style="color: red"><form:errors path="*"/></span>
							</div>
                			<div class="srv_row">
                				<p class="title-box">Thông tin hợp đồng</p>
                				<c:if test="${!enable_edit_contract}">
                					<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="label_popup_profile" width="200">Đối tác:</td>
	                                        <td style="float:left; color: #2C8F39">
		                                        <b>${merchants}</b>
		                                        <input type="hidden" id="merchant" value="${merchants}"/>
	                                        </td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Tên đối tác:
											</td>
											<td style="float:left; color: #2C8F39">
												<b>${merchant_name}</b>
												<input type="hidden" id="merchantName" value="${merchant_name}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Email:
											</td>
											<td style="float:left; color: #2C8F39">
												<b>${email}</b>
												<c:if test="${account.verify_email=='true'}">
													<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath() %>/images/tick.png"/>
												</c:if>
												<c:if test="${account.verify_email=='false'}">
													<img class="status_verify_phone" border="0" width="16" height="16" title="Chưa xác thực" src="<%=request.getContextPath() %>/images/invalid.png"/>
												</c:if>
												<input type="hidden" id="email" value="${email}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Điện thoại:
											</td>
											<td style="float:left; color: #2C8F39">
												<b>${merchantProfile.contractInfo.phone}</b>
												<c:if test="${account.verify_phone=='true'}">
													<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath() %>/images/tick.png"/>
												</c:if>
												<c:if test="${account.verify_phone=='false'}">
													<img class="status_verify_phone" border="0" width="16" height="16" title="Chưa xác thực" src="<%=request.getContextPath() %>/images/invalid.png"/>
												</c:if>
												<input type="hidden" id="phone" value="${merchantProfile.contractInfo.phone}"/>
											</td>
										</tr>
										
		                                <tr>
											<td class="label_popup_profile">
												Số hợp đồng:
											</td>
		                                    <td style="float:left; color: #2C8F39">
												<b>${contractNo}</b>
												<input type="hidden" id="contractNo" value="${contractNo}"/>
											</td>
										</tr>
		                                
										<tr>
											<td class="label_popup_profile">
												Chu kỳ thanh toán:
											</td>
											<td style="float:left; color: #2C8F39">
		                                    	<b>${merchantProfile.contractInfo.paymentPolicy}</b>
		                                    	<div style="display:none">
		                                    		<form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
		                                    	</div>
		                                    </td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Loại hợp đồng:
											</td>
											<td style="float:left; color: #2C8F39">
		                                        <b>${merchantProfile.contractInfo.contractType}</b>
		                                        <div style="display:none">
		                                        	<form:select path="contractType" items="${contractType}" class="slc_gl"/>
		                                        </div>
		                                    </td>
										</tr>
										
										<tr>
											<td class="label_popup_profile">
												Thông tin thêm:
											</td>
											<td style="float:left; color: #2C8F39">
												<b>${merchantProfile.contractInfo.merchantDesc}</b>
												<input type="hidden" id="merchantDesc" value="${merchantProfile.contractInfo.merchantDesc}"/>
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- Bản cứng HĐ -->
												<!-- 
												<c:if test="${merchantProfile.contractInfo.hardContractFile!=null && merchantProfile.contractInfo.hardContractFile!=''}">
												 -->
												 	<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	Hợp đồng bản cứng &nbsp; 
																</strong>
															</legend>
															<div style="padding: 2px;">
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Bản cứng HĐ:</label>
								                                    <c:if test="${merchantProfile.contractInfo.hardContractFile!=null}">
								                                    	<span style="color: #FF0000; font-weight: normal;">
								                                    		<a href="<%=request.getContextPath()%>${path_contract_uri}/hardcopy/${merchantProfile.contractInfo.merchant}/${merchantProfile.contractInfo.hardContractFile}">
								                                    		<span style="color: #009ce4; text-decoration: underline;">Download bản cứng</span>
								                                    		</a>
								                                    	</span>
																	</c:if>
																	<c:if test="${merchantProfile.contractInfo.hardContractFile==null}">
																		<span style="color: #FF0000; font-weight: normal;">Chưa có</span>
																	</c:if>
								                                </div> 
								                                <div class="product_title">
								                                    <label class="label_popup_profile">&nbsp;</label>
																	<form:checkbox path="hasHardCopy" disabled = "true"/><b>Có bản cứng HĐ</b>
								                                </div> 
															</div>
														</fieldset>
													</div>
												<!-- 
												</c:if>
												-->
				                                <!-- /Bản cứng HĐ -->
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- CMND -->
				                                 <div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	CMND/ĐKKD &nbsp; 
																	<c:if test="${identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">CMND/ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity!=null && identity.identity!=null}">
																			${identity.identity}
																		</c:if>
																		<c:if test="${identity==null||identity.identity==null||identity.identity==''}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="identity" value="${identity.identity}"/>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Bản mềm CMND/ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity.identityImage!=null}">
																			<a href="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}" class="top_up" toptions="overlayClose=1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, shaded=1">
																				<img class="popup_common_identity_image" border="0" width="100" height="50" src="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}"/>
																			</a>
																		</c:if>
																		<c:if test="${identity.identityImage==null}">
																			<span style="color: #FF0000; font-weight: normal;">Chưa có</span>
																		</c:if>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Ngày cấp:</label>
																	<span class="go_sms_product_name">
																		<b>${dateOfIssue}</b>
																		<input type="hidden" id="dateOfIssue" value="${dateOfIssue}"/>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Nơi cấp CMND/Địa chỉ ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity!=null && identity.placeOfIssue!=null}">
																			${identity.placeOfIssue}
																		</c:if>
																		<c:if test="${identity==null||identity.placeOfIssue==null||identity.placeOfIssue==''}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="placeOfIssue" value="${identity.placeOfIssue}"/>
																	</span>
								                                </div> 
															</div>
														</fieldset>
													</div>
				                                <!-- CMND -->
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- Thông tin thanh toán -->
				                                 <div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	Thông tin thanh toán &nbsp; 
																	<c:if test="${billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">Chủ tài khoản:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_account_holder!=null}">
																			${billingInformation.bank_account_holder}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_account_holder==null||billingInformation.bank_account_holder==''}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="bank_account_holder" value="${billingInformation.bank_account_holder}"/>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Số tài khoản:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_account_number!=null}">
																			${billingInformation.bank_account_number}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_account_number==null||billingInformation.bank_account_number==''}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="bank_account_number" value="${billingInformation.bank_account_number}"/>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên ngân hàng:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_name!=null}">
																			${billingInformation.bank_name}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_name==null||billingInformation.bank_name==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<div style="display:none">
								                                    	<form:select path="bank_name" cssClass="dashboard_filter_2">  
															                <c:forEach items='${banks}' var='bank'>  
															                    <form:option value='${bank.code}' label='${bank.name}' />  
															                </c:forEach>  
															            </form:select> 
								                                    </div>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tại tỉnh/thành phố:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_city!=null}">
																			${billingInformation.bank_city}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_city==null||billingInformation.bank_city==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<div style="display:none">
								                                    	<form:select path="bank_city" cssClass="dashboard_filter_2">  
															                <c:forEach items='${provinces}' var='province'>  
															                    <form:option value='${province.code}' label='${province.name}' />  
															                </c:forEach>  
															            </form:select> 
								                                    </div>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên chi nhánh:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_branch!=null}">
																			${billingInformation.bank_branch}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_branch==null}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="bank_branch" value="${billingInformation.bank_branch}"/>
																	</span>
								                                </div> 
															</div>
														</fieldset>
													</div>
				                                <!-- /Thông tin thanh toán -->
											</td>
										</tr>
										
										<tr>
											<td class="label_popup_profile" width="140">
												Ký ngày:
											</td>
		                                    <td style="float:left; color: #2C8F39">
												<b>${contractDate}</b>
												<input type="hidden" id="contractDate" value="${contractDate}"/>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile" width="140">
												Ngày hết hạn:
											</td>
		                                    <td style="float:left; color: #2C8F39">
												<b>${expiredDate}</b>
												<input type="hidden" id="expiry_date" value="${expiredDate}"/>
												
												&nbsp;&nbsp;&nbsp;<form:checkbox path="autoExtendedContract" disabled = "true"/><b>Tự động gia hạn HĐ</b>
												&nbsp;&nbsp;&nbsp;
												<!-- 
												<form:checkbox path="hasHardCopy" disabled = "true"/><b>Có bản cứng HĐ</b>
												 -->
											</td>
										</tr>
										
						   			</tbody>
						   		</table>
                				</c:if>
                				
                				<c:if test="${enable_edit_contract}">
                				<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="label_popup_profile" width="200">Đối tác:</td>
	                                        <td style="color: #2C8F39">
		                                        <b>${merchants}</b>
		                                        <input type="hidden" id="merchant" value="${merchants}"/>
	                                        </td>
										</tr>
										<tr>
										<td class="label_popup_profile">
											Tên đối tác<span class="required_red">(*)</span>:
										</td>
										<td>
											<form:input path="merchantName" value="${merchant_name}" class="txt_reglog is_alphanumeric_name" maxlength="100"/>
										</td>
									</tr>
										<tr>
											<td class="label_popup_profile">
												Email:
											</td>
											<td style="color: #2C8F39">
												<b>${email}</b>
												<input type="hidden" id="email" value="${email}"/>
												<!-- 
												<form:input path="email" value="${merchantProfile.contractInfo.email}" class="txt_reglog is_email" maxlength="50" readonly="true"/>
												 -->
												<c:if test="${account.verify_email=='true'}">
													<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath() %>/images/tick.png"/>
												</c:if>
												<c:if test="${account.verify_email=='false'}">
													<img class="status_verify_phone" border="0" width="16" height="16" title="Chưa xác thực" src="<%=request.getContextPath() %>/images/invalid.png"/>
												</c:if>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile">
												Điện thoại<span class="required_red">(*)</span>:
											</td>
											<td>
												<c:if test="${enable_edit_phone}">
													<form:input path="phone" value="${merchantProfile.contractInfo.phone}" class="txt_reglog is_numeric" maxlength="15"/>
												</c:if>
												<c:if test="${!enable_edit_phone}">
													<b>${merchantProfile.contractInfo.phone}</b>
													<input type="hidden" id="phone" value="${merchantProfile.contractInfo.phone}"/>
												</c:if>
												
												<c:if test="${account.verify_phone=='true'}">
													<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath() %>/images/tick.png"/>
												</c:if>
												<c:if test="${account.verify_phone=='false'}">
													<img class="status_verify_phone" border="0" width="16" height="16" title="Chưa xác thực" src="<%=request.getContextPath() %>/images/invalid.png"/>
												</c:if>
											</td>
										</tr>
										
	                                <tr>
										<td class="label_popup_profile" width="140">
											Số hợp đồng<span class="required_red">(*)</span>:</td>
										<td>
											<form:input path="contractNo" class="txt_reglog is_content" maxlength="50"/>
	                                    </td>
									</tr>
	                                
									<tr>
										<td class="label_popup_profile">
											Chu kỳ thanh toán<span style="color: #FF0000; font-weight: normal;">(*)</span>:
										</td>
										<td>
	                                        <form:select path="paymentPolicy" items="${paymentPolicy}" class="slc_gl" style="text-align:right"/>
	                                    </td>
									</tr>
									<tr>
										<td class="label_popup_profile">
											Loại hợp đồng<span style="color: #FF0000; font-weight: normal;">(*)</span>:
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
												<textarea id="merchantDesc" class="is_alphanumeric_allow_space" name="merchantDesc" rows="4" cols="50" placeholder="Mô tả/lý do hủy bỏ" maxlength="150">${merchantProfile.contractInfo.merchantDesc}</textarea>
											</td>
										</tr>
										<tr>
											<td class="label_popup_profile" width="140">
												Ký ngày<span class="required_red">(*)</span>:</td>
											<td>
												<form:input path="contractDate" class="txt_reglog is_date" placeholder="dd/MM/yyyy" style="width: 100px;" maxlength="10"/>
												Ví dụ: 28/08/2014
		                                    </td>
		                                    <script>
											  $(function() {
												  $('#contractDate').datepicker({
												        dateFormat: "dd/mm/yy",
												        altFormat: "dd/mm/yy"
												  });
											  });
											</script>
										</tr>
										<tr>
											<td class="label_popup_profile" width="140">
												Ngày hết hạn<span class="required_red">(*)</span>:
											</td>
											<td style="color: #2C8F39">
												<form:input path="expiry_date" class="txt_reglog is_date" placeholder="dd/MM/yyyy" style="width: 100px;" maxlength="10"/>
												Ví dụ: 28/08/2014
												
												&nbsp;&nbsp;&nbsp;<form:checkbox path="autoExtendedContract"/><b>Tự động gia hạn HĐ</b>
												&nbsp;&nbsp;&nbsp;
												<!-- 
												<form:checkbox path="hasHardCopy"/><b>Có bản cứng HĐ</b>
												 -->
		                                    </td>
		                                    <script>
											  $(function() {
												  $('#expiry_date').datepicker({
												        dateFormat: "dd/mm/yy",
												        altFormat: "dd/mm/yy"
												  });
											  });
											</script>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- Bản cứng HĐ -->
												 	<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	Hợp đồng bản cứng &nbsp; 
																</strong>
															</legend>
															<div style="padding: 2px;">
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Bản cứng HĐ:</label>
								                                    <c:if test="${merchantProfile.contractInfo.hardContractFile!=null}">
								                                    	<span style="color: #FF0000; font-weight: normal;">
								                                    		<a href="<%=request.getContextPath()%>${path_contract_uri}/hardcopy/${merchantProfile.contractInfo.merchant}/${merchantProfile.contractInfo.hardContractFile}">
								                                    		<span style="color: #009ce4; text-decoration: underline;">Download bản cứng</span>
								                                    		</a>
								                                    	</span>
																	</c:if>
																	<c:if test="${merchantProfile.contractInfo.hardContractFile==null}">
																		<span style="color: #FF0000; font-weight: normal;">Chưa có</span>
																	</c:if>
																	<input type="file" name="hard_contract_file" id="hard_contract_file" class="btn_browse"/>
																	<script type="text/javascript">
																		$('#hard_contract_file').change(function(click) {
																			  //$('#text-logo').val(this.value);
																			  //var file = $('input[type="file"]').val();
																			  var file = $('#hard_contract_file').val();
																		      var exts = ['doc','docx','pdf','gif','png','jpg'];
																		      // first check if file field has any value
																		      if ( file ) {
																		        // split file name at dot
																		        var get_ext = file.split('.');
																		        // reverse name to check extension
																		        get_ext = get_ext.reverse();
																		        // check file type is valid as given in 'exts' array
																		        if ( $.inArray ( get_ext[0].toLowerCase(), exts ) > -1 ){
																		          	//alert( 'Allowed extension!' );
																		        } else {
																		          	alert( 'Định dạng HĐ bản cứng cho phép là doc, pdf, gif, png và jpg' );
																		        }
																		      }
																		});
																	</script>
																	
																	<c:if test="${merchantProfile.contractInfo.hardContractFile==null}">
																		<span style="color: #FF0000; font-weight: normal;">&lt;5MB</span>
																	</c:if>
								                                </div> 
								                                <div class="product_title">
								                                    <label class="label_popup_profile">&nbsp;</label>
																	<form:checkbox path="hasHardCopy"/><b>Có bản cứng HĐ</b>
								                                </div> 
															</div>
														</fieldset>
													</div>
				                                <!-- /Bản cứng HĐ -->
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- CMND/ĐKKD -->
												<c:if test="${identity!=null && identity.verify=='true'}">
													<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	CMND/ĐKKD &nbsp; 
																	<c:if test="${identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">CMND/ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity!=null && identity.identity!=null}">
																			${identity.identity}
																		</c:if>
																		<c:if test="${identity==null||identity.identity==null||identity.identity==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<input type="hidden" id="identity" value="${identity.identity}"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Bản mềm CMND/ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity.identityImage!=null}">
																			<a href="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}" class="top_up" toptions="overlayClose=1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, shaded=1">
																				<img class="popup_common_identity_image" border="0" width="100" height="50" src="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}"/>
																			</a>
																		</c:if>
																		<c:if test="${identity.identityImage==null}">
																			Chưa upload Bản mềm CMND/ĐKKD
																		</c:if>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Ngày cấp:</label>
																	<span class="go_sms_product_name">
																		<b>${dateOfIssue}</b>
																		<input type="hidden" id="dateOfIssue" value="${dateOfIssue}"/>
																	</span>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Nơi cấp CMND/Địa chỉ ĐKKD:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${identity!=null && identity.placeOfIssue!=null}">
																			${identity.placeOfIssue}
																		</c:if>
																		<c:if test="${identity==null||identity.placeOfIssue==null||identity.placeOfIssue==''}">
																			<i>chưa có</i>
																		</c:if>
																		<input type="hidden" id="placeOfIssue" value="${identity.placeOfIssue}"/>
																	</span>
								                                </div> 
															</div>
														</fieldset>
													</div>
												</c:if>
				                                <c:if test="${identity==null || identity.verify=='false'}">
													<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	CMND/ĐKKD &nbsp; 
																	<c:if test="${identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!identity.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực CMND/ĐKKD" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																		&nbsp;
																		<c:if test="${enable_verify_identity}">
																			[<form:checkbox path="identityVerified" name="identityVerified" disabled = "false"/><b>Xác thực</b>]
																			<script type="text/javascript">
																			  $(document).ready(function(){
																				    $("#identityVerified1").click(function () {
																						if($('input:checkbox[name=identityVerified]').is(':checked'))
																						{
																							var answer = confirm('Bạn chắc chắn muốn xác thực CMND/ĐKKD?');
																							if (!answer)
																							{
																								return false;
																							}
																						}
																				    });
																			  });
																			</script>
																		</c:if>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">CMND/ĐKKD<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
								                                    <form:input path="identity" value="${identity.identity}" class="txt_reglog is_numeric" maxlength="12"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Bản mềm CMND/ĐKKD:</label>
								                                    <c:if test="${identity.identityImage!=null}">
								                                    	<a href="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}" class="top_up" toptions="overlayClose=1, width = 900, height = 600, type = flash, title = Bản mềm CMND/Đăng ký Kinh doanh, shaded=1">
																				<img class="popup_common_identity_image" border="0" width="100" height="50" src="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}"/>
																		</a>
																		<input type="hidden" id="identity_image_path" value="<%=request.getContextPath()%>${path_identity_image}/${identity.username}/${identity.identityImage}"/>
																	</c:if>
																	<c:if test="${identity.identityImage==null}">
																		<span style="color: #FF0000; font-weight: normal;">Chưa có</span>
																		<input type="hidden" id="identity_image_path" value="<%=request.getContextPath()%>/images/identity_no.jpg"/>
																	</c:if>
																	<input type="file" name="identity_file" id="identity_file" class="btn_browse"/>
																	<script type="text/javascript">
																		$('#identity_file').change(function(click) {
																			  //$('#text-logo').val(this.value);xxxxx
																			  //var file = $('input[type="file"]').val();
																			  var file = $('#identity_file').val();
																		      var exts = ['gif','png','jpg','jpeg'];
																		      // first check if file field has any value
																		      if ( file ) {
																		        // split file name at dot
																		        var get_ext = file.split('.');
																		        // reverse name to check extension
																		        get_ext = get_ext.reverse();
																		        // check file type is valid as given in 'exts' array
																		        if ( $.inArray ( get_ext[0].toLowerCase(), exts ) > -1 ){
																		          	//alert( 'Allowed extension!' );
																		        } else {
																		          	alert( 'Định dạng CMND/ĐKKD cho phép là gif, png và jpg' );
																		        }
																		      }
																		});
																	</script>
																	
																	<c:if test="${identity.identityImage==null}">
																		<span style="color: #FF0000; font-weight: normal;">&lt;5MB</span>
																	</c:if>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Ngày cấp<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
																	<form:input path="dateOfIssue" class="txt_reglog is_date" placeholder="dd/MM/yyyy" style="width: 100px;" maxlength="10"/>
																	Ví dụ: 28/08/2010
								                                </div> 
								                                <script>
																  $(function() {
																	  $('#dateOfIssue').datepicker({
																	        dateFormat: "dd/mm/yy",
																	        altFormat: "dd/mm/yy"
																	  });
																  });
																</script>
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Nơi cấp CMND/Địa chỉ ĐKKD<span class="required_red">(*)</span>:</label>
																	<form:input path="placeOfIssue" value="${identity.placeOfIssue}" class="txt_reglog is_alphanumeric_name" maxlength="50"/>
								                                </div> 
															</div>
														</fieldset>
													</div>
												</c:if> 
				                                <!-- /CMND/ĐKKD -->
											</td>
										</tr>
										
										<tr>
											<td colspan="2">
												<!-- Thông tin thanh toán -->
												<c:if test="${billingInformation!=null && billingInformation.verify=='true'}">
													<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	Thông tin thanh toán &nbsp; 
																	<c:if test="${billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">Chủ tài khoản:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_account_holder!=null}">
																			${billingInformation.bank_account_holder}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_account_holder==null||billingInformation.bank_account_holder==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<input type="hidden" id="bank_account_holder" value="${billingInformation.bank_account_holder}"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Số tài khoản:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_account_number!=null}">
																			${billingInformation.bank_account_number}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_account_number==null||billingInformation.bank_account_number==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<input type="hidden" id="bank_account_number" value="${billingInformation.bank_account_number}"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên ngân hàng:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_name!=null}">
																			${billingInformation.bank_name}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_name==null||billingInformation.bank_name==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<div style="display:none">
								                                    	<form:select path="bank_name" cssClass="dashboard_filter_2">  
															                <c:forEach items='${banks}' var='bank'>  
															                    <form:option value='${bank.code}' label='${bank.name}' />  
															                </c:forEach>  
															            </form:select> 
								                                    </div>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tại tỉnh/thành phố:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_city!=null}">
																			${billingInformation.bank_city}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_city==null||billingInformation.bank_city==''}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<div style="display:none">
								                                    	<form:select path="bank_city" cssClass="dashboard_filter_2">  
															                <c:forEach items='${provinces}' var='province'>  
															                    <form:option value='${province.code}' label='${province.name}' />  
															                </c:forEach>  
															            </form:select> 
								                                    </div>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên chi nhánh:</label>
																	<span class="go_sms_product_name">
																		<c:if test="${billingInformation!=null && billingInformation.bank_branch!=null}">
																			${billingInformation.bank_branch}
																		</c:if>
																		<c:if test="${billingInformation==null||billingInformation.bank_branch==null}">
																			<i>chưa có</i>
																		</c:if>
																	</span>
																	<input type="hidden" id="bank_branch" value="${billingInformation.bank_branch}"/>
								                                </div> 
															</div>
														</fieldset>
													</div>
												</c:if>
				                                <c:if test="${billingInformation==null || billingInformation.verify=='false'}">
													<div class="product_slc_filter filter_row">
														<fieldset class="billing_info_detail">
															<legend>
																<strong>
																	Thông tin thanh toán &nbsp; 
																	<c:if test="${billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Đã xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/tick.png"/>
																	</c:if>
																	<c:if test="${!billingInformation.verify}">
																		<img class="billing_info_image_popup_common" border="0" title="Chưa xác thực thông tin thanh toán" src="<%=request.getContextPath()%>/images/com_wait.png"/>
																	</c:if>
																</strong>
															</legend>
															<div style="padding: 2px;">
																<div class="product_title">     
								                                    <label class="label_popup_profile">Chủ tài khoản<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
								                                    <form:input path="bank_account_holder" class="txt_reglog is_alphanumeric_name" maxlength="100"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Số tài khoản<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
								                                    <form:input path="bank_account_number" class="txt_reglog is_alphanumeric" maxlength="20"/>
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên ngân hàng<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
																	<form:select path="bank_name" cssClass="dashboard_filter_2">  
																		<form:option value='' label='--- Chọn ngân hàng ---'/> 
														                <c:forEach items='${banks}' var='bank'>  
														                    <form:option value='${bank.code}' label='${bank.name}' />  
														                </c:forEach>  
														            </form:select> 
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tại tỉnh/thành phố<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
																	<form:select path="bank_city" cssClass="dashboard_filter_2">  
																		<form:option value='' label='--- Chọn tỉnh/thành phố ---'/> 
														                <c:forEach items='${provinces}' var='province'>  
														                    <form:option value='${province.code}' label='${province.name}' />  
														                </c:forEach>  
														            </form:select> 
								                                </div> 
								                                <div class="product_title">     
								                                    <label class="label_popup_profile">Tên chi nhánh<span style="color: #FF0000; font-weight: normal;">(*)</span>:</label>
								                                    <form:input path="bank_branch" class="txt_reglog is_alphanumeric_name" maxlength="50"/>
								                                </div> 
															</div>
														</fieldset>
													</div>
												</c:if> 
				                                <!-- /Thông tin thanh toán -->
											</td>
										</tr>
										
						   			</tbody>
						   		</table>
                				</c:if>
                           </div>
                          
                        <c:if test="${isViewRate}">
                        <p class="title-box">
                        	<b>
                        		Tỷ lệ chia sẻ doanh thu hiện tại
                        			<c:if test="${merchantProfile.merchantChargingRate.is_default}">
												<i><span style="color:red;">(Tỷ lệ mặc định)</span></i>
									</c:if>
									<c:if test="${!merchantProfile.merchantChargingRate.is_default}">
												<i><span style="color:red;">(Tỷ lệ riêng)</span></i>
									</c:if>
                        	</b>
                        </p>
                        
                        <table cellpadding="5" cellspacing="0">
							<tbody>
								<c:if test="${!enable_edit_contract}">
									<c:if test="${isViewRate}">
										<tr>
											<td class="label_popup_profile">
												<b>Loại tỷ lệ:</b>
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
									</c:if>
									<c:if test="${!isViewRate}">
										<tr style="display:none;">
											<td class="label_popup_profile">
												<b>Loại tỷ lệ:</b>
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
									</c:if>
								</c:if>
                        		<c:if test="${enable_edit_contract}">
                        			<c:if test="${isViewRate}">
                        				<c:if test="${enable_edit_charging_rates}">
										<tr>
											<td class="label_popup_profile">
												<b>Loại tỷ lệ:</b>
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
										</c:if>
										<c:if test="${!enable_edit_charging_rates}">
										<tr style="display:none;">
											<td class="label_popup_profile">
												<b>Loại tỷ lệ:</b>
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
										</c:if>
									</c:if>
									<c:if test="${!isViewRate}">
										<tr style="display:none;">
											<td class="label_popup_profile">
												<b>Loại tỷ lệ:</b>
											</td>
											<td>
												<form:radiobutton path="usingDefaultRate" value="yes"/><b>Tỷ lệ mặc định</b>
												&nbsp;&nbsp;&nbsp;&nbsp;
												<form:radiobutton path="usingDefaultRate" value="no"/><b>Tỷ lệ riêng</b>
											</td>
										</tr>
									</c:if>
								</c:if>
							</tbody>
						</table>
                        
                        <div id="charging_rates_private" style="display:none;">
              			<div id="dash_tab">
	                    	<a href="#dash_tab" class="tab_common tab_slc tab_private_1" title="card_charging_id"><span>Card Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="sms_charging_id"><span>Sms Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="wap_charging_id"><span>Wap Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="iac_charging_id"><span>SMS Plus Charging</span></a>
	                        <div class="clear"></div>
                    	</div>
                    	<!-- Tat ca -->
                    	<div class="srv_row content" style="display: none;" id="all_charging_id">
	                        <div class="srv_row" style="width: 700px; margin:auto;">
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
														SMS Plus Charging
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
                    		<!-- Trạng thái cho phép sửa tỷ lệ -->
                    		<c:if test="${enable_edit_charging_rates}">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<select id="card_telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'card');">
											<c:forEach var="telco" items="${ls_card_telco_full}">
												<c:if test="${telco.telco !='DEFAULT'}">
														<option value="${telco.telco}">
															<c:out value="${telco.telco}"/>
														</option>
												</c:if>
											</c:forEach>
										</select>
										<!-- 
	                            		<form:select path="card_telco" items="${ls_card_telco_full}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'card');"/>
	            						 -->
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                                <td width="200">
	                                	<textarea id="card_range_rate" class="is_rate_range" name="card_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButton()"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td colspan="4" style="color:#4285F4"> &nbsp;&nbsp;&nbsp;Chú ý: Xóa hết cấu hình tỷ lệ khi muốn sử dụng tỷ lệ mặc định cho loại Charging</td>
	                            </tr>
	                        </table>
	                        </c:if>
	                        
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_card">
                       			<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
	                       					<td  class="transhead" width="50">
	                       						<a class="button_clear_all" style="margin-left:40px;" onclick="clearAllRowTableCard();" href="javascript: void(0);" title="Xóa tất cả tỷ lệ riêng Card Charging"></a>
	                       					</td>
	                       				</c:if>
	                       			</tr>
		                        <c:if test="${empty ls_card_telco}">
		                        	<div style="color:#5CC16A; font-size: 14px;">Card charging đang Sử dụng tỷ lệ default <a style="color: #0066cc;" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${profileId}">xem chi tiết tỷ lệ default ở đây</a></div>
		                        	<c:if test="${!isDefaultRatesOfChargingCARD}">
		                        		<div style="color:red; font-size: 14px;">(Card charging chưa ký hợp đồng điện tử)</div>
		                        	</c:if>
		                        	<input type="hidden" id="max_element_card" value="0" />
		                        </c:if>
		                        <c:forEach items="${ls_card_telco}" var="cardCharging" varStatus="i">
		                        <c:if test="${cardCharging.telco !='DEFAULT'}">
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
											<span class="dai_doanh_thu" id="td-tyle-${i.index+1}">${cardCharging.amount_rate_range_view}</span>
											<input type="hidden" value="${cardCharging.amount_rate_range}" name="hd_khoangtyle_card" class="hd_khoangtyle_card" id="hd_khoangtyle_card-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
											${cardCharging.rate_range_view}
										</td>
										<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
										<td class="svr_data" width="50" style="padding: 8px;" align="center">
											<a class="link_cancel" style="margin-left:40px;" id="delete_button_${i.index+1}"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
										</c:if>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_card" value="${i.index+1}" />
									</c:if>
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
                    		<!-- Trạng thái cho phép sửa tỷ lệ -->
                    		<c:if test="${enable_edit_charging_rates}">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<select id="sms_telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'sms');">
											<c:forEach var="telco" items="${ls_sms_telco_full}">
												<c:if test="${telco.telco !='DEFAULT'}">
														<option value="${telco.telco}">
															<c:out value="${telco.telco}"/>
														</option>
												</c:if>
											</c:forEach>
										</select>
										<!-- 
	                            		<form:select path="sms_telco" items="${ls_sms_telco_full}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'sms');"/>
	                                	 -->
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="sms_range_rate" class="is_rate_range" name="sms_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonSMS()"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td colspan="4" style="color:#4285F4"> &nbsp;&nbsp;&nbsp;Chú ý: Xóa hết cấu hình tỷ lệ khi muốn sử dụng tỷ lệ mặc định cho loại Charging</td>
	                            </tr>
	                        </table>
	                        </c:if>
	                        
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_sms">
                       			<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
	                       					<td  class="transhead" width="50">
	                       						<a class="button_clear_all" style="margin-left:40px;" onclick="clearAllRowTableSMS();" href="javascript: void(0);" title="Xóa tất cả tỷ lệ riêng SMS Charging"></a>
	                       					</td>
	                       				</c:if>
	                       			</tr>
		                        <c:if test="${empty ls_sms_telco}">
		                        	<div style="color:#5CC16A; font-size: 14px;">SMS charging đang Sử dụng tỷ lệ default <a style="color: #0066cc;" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${profileId}">xem chi tiết tỷ lệ default ở đây</a></div>
		                        	<c:if test="${!isDefaultRatesOfChargingSMS}">
		                        		<div style="color:red; font-size: 14px;">(SMS charging đang chưa ký hợp đồng điện tử)</div>
		                        	</c:if>
		                        	<input type="hidden" id="max_element_sms" value="0" />
		                        </c:if>
		                        <c:forEach items="${ls_sms_telco}" var="smsCharging" varStatus="i">
		                        <c:if test="${smsCharging.telco !='DEFAULT'}">
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
											<span class="dai_doanh_thu_sms" id="td-tyle-${i.index+1}">${smsCharging.amount_rate_range_view}</span>
											<input type="hidden" value="${smsCharging.amount_rate_range}" name="hd_khoangtyle_sms" class="hd_khoangtyle_sms" id="hd_khoangtyle_sms-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_sms" width="50" style="padding: 8px" align="center">
											${smsCharging.rate_range_view}
										</td>
										<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a class="link_cancel" style="margin-left:40px;" id="delete_button_${i.index+1}"  onclick="deleteRowTableSMS(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
										</c:if>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_sms" value="${i.index+1}" />
									</c:if>
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
                    		<!-- Trạng thái cho phép sửa tỷ lệ -->
                    		<c:if test="${enable_edit_charging_rates}">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<select id="wap_telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'wap');">
											<c:forEach var="telco" items="${ls_wap_telco_full}">
												<c:if test="${telco.telco !='DEFAULT'}">
														<option value="${telco.telco}">
															<c:out value="${telco.telco}"/>
														</option>
												</c:if>
											</c:forEach>
										</select>
										<!-- 
	                            		<form:select path="wap_telco" items="${ls_wap_telco_full}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'wap');"/>
	                               		 -->
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="wap_range_rate" class="is_rate_range" name="wap_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonWAP()"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td colspan="4" style="color:#4285F4"> &nbsp;&nbsp;&nbsp;Chú ý: Xóa hết cấu hình tỷ lệ khi muốn sử dụng tỷ lệ mặc định cho loại Charging</td>
	                            </tr>
	                        </table>
	                        </c:if>
	                        
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_wap">
                       			<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
	                       					<td  class="transhead" width="50">
	                       						<a class="button_clear_all" style="margin-left:40px;" onclick="clearAllRowTableWAP();" href="javascript: void(0);" title="Xóa tất cả tỷ lệ riêng SMS Charging"></a>
	                       					</td>
	                       				</c:if>
	                       			</tr>
		                        <c:if test="${empty ls_wap_telco}">
		                        	<div style="color:#5CC16A; font-size: 14px;">WAP charging đang Sử dụng tỷ lệ default <a style="color: #0066cc;" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${profileId}">xem chi tiết tỷ lệ default ở đây</a></div>
		                        	<c:if test="${!isDefaultRatesOfChargingWAP}">
		                        		<div style="color:red; font-size: 14px;">(WAP charging chưa ký hợp đồng điện tử)</div>
		                        	</c:if>
		                        	<input type="hidden" id="max_element_wap" value="0" />
		                        </c:if>
		                        
		                        <c:forEach items="${ls_wap_telco}" var="wapCharging" varStatus="i">
		                        <c:if test="${wapCharging.telco !='DEFAULT'}">
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
											<span class="dai_doanh_thu_wap" id="td-tyle-${i.index+1}">${wapCharging.amount_rate_range_view}</span>
											<input type="hidden" value="${wapCharging.amount_rate_range}" name="hd_khoangtyle_wap" class="hd_khoangtyle_wap" id="hd_khoangtyle_wap-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_wap" width="50" style="padding: 8px" align="center">
											${wapCharging.rate_range_view}
										</td>
										<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a style="margin-left:40px;" class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTableWAP(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
										</c:if>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_wap" value="${i.index+1}" />
									</c:if>
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
                    	
                    	<!-- InApp -->
                    	<div class="srv_row content" style="display: none;" id="iac_charging_id">
                    		<!-- Trạng thái cho phép sửa tỷ lệ -->
                    		<c:if test="${enable_edit_charging_rates}">
	                    	<table width="100%" cellspacing="0" cellpadding="0" >
	                        	<tr>
	                            	<td width="165">
	                            		<label>Nhà mạng</label>
	                            		<select id="iac_telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'iac');">
											<c:forEach var="telco" items="${ls_iac_telco_full}">
												<c:if test="${telco.telco !='DEFAULT'}">
														<option value="${telco.telco}">
															<c:out value="${telco.telco}"/>
														</option>
												</c:if>
											</c:forEach>
										</select>
										<!-- 
	                            		<form:select path="iac_telco" items="${ls_iac_telco_full}" itemLabel="telco" itemValue="telco" class="slc_gl" style="width:75px;" onchange="change_telco_merchant(this.value,'iac');"/>
	                                	 -->
	                                </td>
	                                <td width="110">
	                                	<label style="display: table-cell;text-align: center;vertical-align: middle;">Doanh thu: tỷ lệ</label>
	                                </td>
	                            	<td width="200">
	                                	<textarea id="iac_range_rate" class="is_rate_range" name="iac_range_rate" rows="4" cols="18" placeholder="Thông tin"></textarea>
	                                </td>
	                                <td>
	                                    <input type="button" value="Thêm" class="btn_themmoi" style="width:70px;" onclick="clickFirstButtonIAC()"/>
	                                </td>
	                            </tr>
	                            <tr>
	                            	<td colspan="4" style="color:#4285F4"> &nbsp;&nbsp;&nbsp;Chú ý: Xóa hết cấu hình tỷ lệ khi muốn sử dụng tỷ lệ mặc định cho loại Charging</td>
	                            </tr>
	                        </table>
	                        </c:if>
	                        
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_iac">
                       			<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       				<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
	                       					<td  class="transhead" width="50">
	                       						<a class="button_clear_all" style="margin-left:40px;" onclick="clearAllRowTableIAC();" href="javascript: void(0);" title="Xóa tất cả tỷ lệ riêng SMS Charging"></a>
	                       					</td>
	                       				</c:if>
	                       			</tr>
		                        <c:if test="${empty ls_iac_telco}">
		                        	<div style="color:#5CC16A; font-size: 14px;">SMS Plus Charging đang Sử dụng tỷ lệ default <a style="color: #0066cc;" href="<%=request.getContextPath() %>/protected/merchant_profile_detail.html?id=${profileId}">xem chi tiết tỷ lệ default ở đây</a></div>
		                        	<c:if test="${!isDefaultRatesOfChargingIAC}">
		                        		<div style="color:red; font-size: 14px;">(SMS Plus Charging chưa ký hợp đồng điện tử)</div>
		                        	</c:if>
		                        	<input type="hidden" id="max_element_iac" value="0" />
		                        </c:if>
		                        
		                        <c:forEach items="${ls_iac_telco}" var="iacCharging" varStatus="i">
		                        <c:if test="${iacCharging.telco !='DEFAULT'}">
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
											<span class="dai_doanh_thu_iac" id="td-tyle-${i.index+1}">${iacCharging.amount_rate_range_view}</span>
											<input type="hidden" value="${iacCharging.amount_rate_range}" name="hd_khoangtyle_iac" class="hd_khoangtyle_iac" id="hd_khoangtyle_iac-${i.index+1}"/>
										</td>
										<td class="svr_data dai_ty_le_iac" width="50" style="padding: 8px" align="center">
											${iacCharging.rate_range_view}
										</td>
										<!-- Trạng thái cho phép sửa tỷ lệ -->
                    					<c:if test="${enable_edit_charging_rates}">
										<td class="svr_data" width="50" style="padding: 8px" align="center">
											<a style="margin-left:40px;" class="link_cancel" id="delete_button_${i.index+1}"  onclick="deleteRowTableIAC(this.id);" href="javascript: void(0);" title="Xóa">
											</a>
										</td>
										</c:if>
									</tr>
									<c:if test="${i.last}">
										<input type="hidden" id="max_element_iac" value="${i.index+1}" />
									</c:if>
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
                    	<!-- /InApp -->
                    	</div>
                    	
                    	<div id="charging_rates_default" style="display:none;">
                    	<!-- Tỷ lệ mặc định -->
                    	<div id="dash_tab">
	                    	<a href="#dash_tab" class="tab_common tab_slc tab_default_1" title="default_card_charging_id"><span>Card Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="default_sms_charging_id"><span>Sms Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="default_wap_charging_id"><span>Wap Charging</span></a>
	                        <a href="#dash_tab" class="tab_common tab" title="default_iac_charging_id"><span>SMS Plus Charging</span></a>
	                        <div class="clear"></div>
                    	</div>
                    	<!-- Telco of CARD service -->
                    	<div class="srv_row content" id="default_card_charging_id">
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_card">
                       			<c:if test="${not empty ls_card_telco_default}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_card_telco_default}" var="cardCharging" varStatus="i">
									<tr id="row-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${cardCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu" id="td-tyle-${i.index+1}">${cardCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
											${cardCharging.rate_range_view}
										</td>
									</tr>
								</c:forEach>
                       		</tbody>
                     		</table>
               				</div>  
                    	</div>
                    	<!-- /Telco of CARD service -->
                    	<!-- Telco of SMS service -->
                    	<div class="srv_row content" style="display: none;" id="default_sms_charging_id">
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_sms">
                       			<c:if test="${not empty ls_sms_telco_default}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_sms_telco_default}" var="smsCharging" varStatus="i">
									<tr id="row-sms-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${smsCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu_sms" id="td-tyle-${i.index+1}">${smsCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le_sms" width="50" style="padding: 8px" align="center">
											${smsCharging.rate_range_view}
										</td>
									</tr>
								</c:forEach>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of SMS service -->
                    	<!-- Telco of WAP service -->
                    	<div class="srv_row content" style="display: none;" id="default_wap_charging_id">
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_wap">
                       			<c:if test="${not empty ls_wap_telco_default}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_wap_telco_default}" var="wapCharging" varStatus="i">
									<tr id="row-wap-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${wapCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu_wap" id="td-tyle-${i.index+1}">${wapCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le_wap" width="50" style="padding: 8px" align="center">
											${wapCharging.rate_range_view}
										</td>
									</tr>
								</c:forEach>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /Telco of WAP service -->
                    	
                    	<!-- InApp -->
                    	<div class="srv_row content" style="display: none;" id="default_iac_charging_id">
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_iac">
                       			<c:if test="${not empty ls_iac_telco_default}">
		                        	<tr id="title_table_dk">
	                       				<td class="transhead" width="20">#</td>
	                       				<td class="transhead" width="30">Nhà mạng</td>
	                       				<td class="transhead" width="210" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="50" >Tỷ lệ(%)</td>
	                       			</tr>
		                        </c:if>
		                        <c:forEach items="${ls_iac_telco_default}" var="iacCharging" varStatus="i">
									<tr id="row-iac-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span  id="td-stt-${i.index+1}">${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span  id="td-nhamang-${i.index+1}">${iacCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu_iac" id="td-tyle-${i.index+1}">${iacCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le_iac" width="50" style="padding: 8px" align="center">
											${iacCharging.rate_range_view}
										</td>
									</tr>
								</c:forEach>
                       		</tbody>
                     		</table>
               				</div> 
                    	</div>
                    	<!-- /InApp -->
                    	<!-- /Tỷ lệ mặc định -->
                    	</div>
                    	
                    	<div id="charging_rates_default_popup" style="display:none;">
                    	<!-- Tỷ lệ mặc định popupNew-->
                    	<div class="srv_row content" id="default_card_charging_id">
	                        <div class="srv_row">
                			<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       		<tbody id="all_elecment_card">
                       			<tr id="title_table_dk">
	                       				<td class="transhead" width="150">Dịch vụ</td>
	                       				<td class="transhead" width="30">#</td>
	                       				<td class="transhead" width="150">Nhà mạng</td>
	                       				<td class="transhead" width="300" >Doanh thu(đ)</td>
	                       				<td class="transhead" width="150" >Tỷ lệ(%)</td>
	                       		</tr>
                    			<!-- Telco of CARD service -->
		                        <c:set var="total_card" value="${fn:length(ls_card_telco_default)}"/>
		                        <c:forEach items="${ls_card_telco_default}" var="cardCharging" varStatus="i">
		                        <c:if test="${i.first}">
	                    			<tr>
	                    				<td class="svr_data" style="padding: 8px" align="center" rowspan="${total_card}">
	                    					<span><b>CARD</b></span>
	                    				</td>
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span>${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span>${cardCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu">${cardCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
											${cardCharging.rate_range_view}
										</td>
									</tr>
								</c:if>
								<c:if test="${!i.first}">
									<tr>
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span>${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span>${cardCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu">${cardCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
											${cardCharging.rate_range_view}
										</td>
									</tr>
								</c:if>
								</c:forEach>
                    			<!-- /Telco of CARD service -->
                    			
                    			<!-- Telco of SMS service -->
                    			<c:set var="total_sms" value="${fn:length(ls_sms_telco_default)}"/>
		                        <c:forEach items="${ls_sms_telco_default}" var="smsCharging" varStatus="i">
		                        	<c:if test="${i.first}">
		                    			<tr>
		                    				<td class="svr_data" style="padding: 8px" align="center" rowspan="${total_sms}">
		                    					<span><b>SMS</b></span>
		                    				</td>
											<td class="svr_data" width="20" style="padding: 8px" align="center">
												<span>${i.index+1}</span>
											</td>
											<td class="svr_data" width="30" style="padding: 8px" align="center">
												<span>${smsCharging.telco}</span>
											</td>
											<td class="svr_data" width="210" style="padding: 8px" align="center">
												<span class="dai_doanh_thu">${smsCharging.amount_rate_range_view}</span>
											</td>
											<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
												${smsCharging.rate_range_view}
											</td>
										</tr>
									</c:if>
									<c:if test="${!i.first}">
									<tr id="row-sms-index-${i.index+1}" >
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span>${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span>${smsCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu_sms">${smsCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le_sms" width="50" style="padding: 8px" align="center">
											${smsCharging.rate_range_view}
										</td>
									</tr>
									</c:if>
								</c:forEach>
                    			<!-- /Telco of SMS service -->
                    			
                    			<!-- Telco of WAP service -->
                    			<c:set var="total_wap" value="${fn:length(ls_wap_telco_default)}"/>
		                        <c:forEach items="${ls_wap_telco_default}" var="wapCharging" varStatus="i">
		                        	<c:if test="${i.first}">
		                    			<tr>
		                    				<td class="svr_data" style="padding: 8px" align="center" rowspan="${total_wap}">
		                    					<span><b>WAP</b></span>
		                    				</td>
											<td class="svr_data" width="20" style="padding: 8px" align="center">
												<span>${i.index+1}</span>
											</td>
											<td class="svr_data" width="30" style="padding: 8px" align="center">
												<span>${wapCharging.telco}</span>
											</td>
											<td class="svr_data" width="210" style="padding: 8px" align="center">
												<span class="dai_doanh_thu">${wapCharging.amount_rate_range_view}</span>
											</td>
											<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
												${wapCharging.rate_range_view}
											</td>
										</tr>
									</c:if>
									<c:if test="${!i.first}">
									<tr>
										<td class="svr_data" width="20" style="padding: 8px" align="center">
											<span>${i.index+1}</span>
										</td>
										<td class="svr_data" width="30" style="padding: 8px" align="center">
											<span>${wapCharging.telco}</span>
										</td>
										<td class="svr_data" width="210" style="padding: 8px" align="center">
											<span class="dai_doanh_thu_wap">${wapCharging.amount_rate_range_view}</span>
										</td>
										<td class="svr_data dai_ty_le_wap" width="50" style="padding: 8px" align="center">
											${wapCharging.rate_range_view}
										</td>
									</tr>
									</c:if>
								</c:forEach>
                    			<!-- /Telco of WAP service -->
                    	
                    			<!-- InApp -->
                    			<c:set var="total_iac" value="${fn:length(ls_card_telco_default)}"/>
		                        <c:forEach items="${ls_iac_telco_default}" var="iacCharging" varStatus="i">
		                        	<c:if test="${i.first}">
		                    			<tr id="row-index-${i.index+1}" >
		                    				<td class="svr_data" style="padding: 8px" align="center" rowspan="${total_iac}">
		                    					<span><b>SMS Plus</b></span>
		                    				</td>
											<td class="svr_data" width="20" style="padding: 8px" align="center">
												<span>${i.index+1}</span>
											</td>
											<td class="svr_data" width="30" style="padding: 8px" align="center">
												<span>${iacCharging.telco}</span>
											</td>
											<td class="svr_data" width="210" style="padding: 8px" align="center">
												<span class="dai_doanh_thu">${iacCharging.amount_rate_range_view}</span>
											</td>
											<td class="svr_data dai_ty_le" width="50" style="padding: 8px" align="center">
												${iacCharging.rate_range_view}
											</td>
										</tr>
									</c:if>
									<c:if test="${!i.first}">
										<tr>
											<td class="svr_data" width="20" style="padding: 8px" align="center">
												<span>${i.index+1}</span>
											</td>
											<td class="svr_data" width="30" style="padding: 8px" align="center">
												<span>${iacCharging.telco}</span>
											</td>
											<td class="svr_data" width="210" style="padding: 8px" align="center">
												<span class="dai_doanh_thu_iac">${iacCharging.amount_rate_range_view}</span>
											</td>
											<td class="svr_data dai_ty_le_iac" width="50" style="padding: 8px" align="center">
												${iacCharging.rate_range_view}
											</td>
										</tr>
									</c:if>
								</c:forEach>
                    			<!-- /InApp -->
                    			</tbody>
                     		</table>
               				</div>  
                    	</div>
                    	<!-- /Tỷ lệ mặc định popupNew-->
                    	</div>
                    	
                    	</c:if> 
                    	
	                      <div>
	                      	<input type="button" id="preview_merchant_profile" class="btn_merchant_profile_preview" value="Xem trước"/>
	                      	<c:if test="${enable_edit_contract || enable_edit_charging_rates}">
	                      	<input type="submit" id="form_action_save" class="btn_greensmall" value="Cập nhật"/>
	                      	</c:if>
	                      	<a href="${call_back_url}" class="btn_graysmall">Hủy bỏ</a>
	                      		<script type="text/javascript">
	                      		$(document).ready(function() {
									//<!--Preview Merchant Profile-->
									$('#preview_merchant_profile').live('click', function() {
										var merchant = $("#merchant").val();
										var merchant_name = $("#merchantName").val();
										var contractNo = $("#contractNo").val();
										var contractDate = $("#contractDate").val();
										var expiry_date = $("#expiry_date").val();
										var contractType = $("#contractType").val();
										var paymentPolicy = $("#paymentPolicy").val();
										var email = $("#email").val();
										var phone = $("#phone").val();
										
										//CMND
										var identity = $("#identity").val();
										var dateOfIssue = $("#dateOfIssue").val();
										var placeOfIssue = $("#placeOfIssue").val();
										if(identity!=null && identity!='' && identity.length!=0)
											$(".popup_merchant_identity").html(identity);
										else
											$(".popup_merchant_identity").html('Chưa có');
										if(dateOfIssue!=null && dateOfIssue!='' && dateOfIssue.length!=0)
											$(".popup_dateOfIssue").html(dateOfIssue);
										else
											$(".popup_dateOfIssue").html('Chưa có');
										if(placeOfIssue!=null && placeOfIssue!='' && placeOfIssue.length!=0)
											$(".popup_placeOfIssue").html(placeOfIssue);
										else
											$(".popup_placeOfIssue").html('Chưa có');
										
										//TTTT
										var bank_account_holder = $("#bank_account_holder").val();
										var bank_account_number = $("#bank_account_number").val();
										//var bank_name = $("#bank_name").val();
										var bank_name = $("#bank_name option:selected").text();
										//var bank_city = $("#bank_city").val();
										var bank_city = $("#bank_city option:selected").text();
										var bank_branch = $("#bank_branch").val();
										if(bank_account_holder!=null && bank_account_holder!='' && bank_account_holder.length!=0)
											$(".popup_bank_account_holder").html(bank_account_holder);
										else 
											$(".popup_bank_account_holder").html('Chưa có');
										if(bank_account_number!=null && bank_account_number!='' && bank_account_number.length!=0)
											$(".popup_bank_account_number").html(bank_account_number);
										else
											$(".popup_bank_account_number").html('Chưa có');
										if(bank_name!=null && bank_name!='' && bank_name.length!=0)
											$(".popup_bank_name").html(bank_name);
										else
											$(".popup_bank_name").html('Chưa có');
										if(bank_city!=null && bank_city!='' && bank_city.length!=0)
											$(".popup_bank_city").html(bank_city);
										else
											$(".popup_bank_city").html('Chưa có');
										if(bank_branch!=null && bank_branch!='' && bank_branch.length!=0)
											$(".popup_bank_branch").html(bank_branch);
										else
											$(".popup_bank_branch").html('Chưa có');
										
										//popup info
										$(".popup_merchant").html(merchant);
										$(".popup_merchant_name").html(merchant_name);
										$(".popup_contract_no").html(contractNo);
										$(".popup_payment_policy").html(paymentPolicy);
										$(".popup_contract_date").html(contractDate);
										$(".popup_paymentPolicy").html(paymentPolicy);
										$(".popup_contract_type").html(contractType);
										$(".popup_merchant_email").html(email);
										$(".popup_merchant_phone").html(phone);
										
										$(".popup_contract_expired_date_").html(expiry_date);
										
										//popup_identity_image
										$(".popup_identity_image").html('<img border="0" width="250" height="167" src="'+$("#identity_image_path").val()+'"/>');
										
										if($('input[name=hasHardCopy]').is(':checked'))
											$(".popup_hasHardCopy").html("Có");
										else
											$(".popup_hasHardCopy").html("Không");
										
										if($('input[name=autoExtendedContract]').is(':checked'))
											$(".autoExtendedContract").html("Có");
										else
											$(".autoExtendedContract").html("Không");
										
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
										var html_value_title = "";
										
										//title
										html_value+='<table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">';
										html_value+='<tbody id="all_elecment_card">';
										html_value_title+='<tr id="title_table_dk">';
										
										html_value_title+='<td class="transhead" width="150">Dịch vụ</td>';
										html_value_title+='<td class="transhead" width="30">#</td>';
										html_value_title+='<td class="transhead" width="150">Nhà mạng</td>';
										html_value_title+='<td class="transhead" width="300" >Doanh thu(đ)</td>';
										html_value_title+='<td class="transhead" width="150" >Tỷ lệ(%)</td>';
										html_value_title+='</tr>';
	                       		
										var html_value_card = "";
										for (i = 0; i < number_telco_card; ++i) {
											if(i==0)
											{
												html_value_card+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center" rowspan="'+number_telco_card+'">';
												html_value_card+='<span  id="td-stt-'+i+'">CARD</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='</tr>';
											}
											else
											{
												html_value_card+='<tr id="row-index-'+i+'" class="popup_tr">';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-stt-'+i+'">'+i+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-nhamang-'+i+'">'+optionTexts[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span  id="td-nhamang-'+i+'">'+optionTextsDoanhThu[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='<td class="svr_data" style="padding: 8px" align="center">';
												html_value_card+='<span >'+optionTextsTyLe[i]+'</span>';
												html_value_card+='</td>';
												html_value_card+='</tr>';
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
												html_value_iac+='<span  id="td-stt-'+z+'">SMS Plus</span>';
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
										var html_all="";
										var html_content = html_value_card+html_value_sms+html_value_wap+html_value_iac;
										if(html_content!=null && html_content!='' && html_content.length!=0)
											html_all=html_value+html_value_title+html_content;
										else
											html_all=html_value;
										html_all+='</tbody>';
										html_all+='</table>';
										
										//clear old content
										$('#include_rates').html('<input type="hidden" id="info_amount_rate_card" value="0" />');
										
										var myRadio = $('input[name=usingDefaultRate]');
										var checkedValue = myRadio.filter(':checked').val();
										$('.popup_tr').remove();
										if(checkedValue=='yes'){
											var default_rates = $("#charging_rates_default_popup").html();
											$('#info_amount_rate_card').before(default_rates);
										}else{
											$('#info_amount_rate_card').before(html_all);
										}
										
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
	
	<script type="text/javascript">
	$("input[name='usingDefaultRate']").change(function(){
	    var selected_radio = $("input[name='usingDefaultRate']:checked").val();
	    if (selected_radio == 'yes'){
	        //alert('yes');
	        $("#charging_rates_default").css("display", "block");
	        $("#charging_rates_private").css("display", "none");
	        $( ".tab_common " ).removeClass( "tab_slc" );
	        $( ".tab_default_1" ).removeClass( "tab_slc" ).addClass( "tab_slc" );
	        
	        $('#default_card_charging_id').css('display','block');
	        $('#default_sms_charging_id').css('display','none');
	        $('#default_wap_charging_id').css('display','none');
	        $('#default_iac_charging_id').css('display','none');
	    }
	    else
	    {
	    	 //alert('no');
	    	 $("#charging_rates_default").css("display", "none");
	    	 $("#charging_rates_private").css("display", "block");
	    	 $( ".tab_common " ).removeClass( "tab_slc" );
	    	 $( ".tab_private_1 " ).removeClass( "tab_slc" ).addClass( "tab_slc" );
	    	 
	    	 
	    	 $('#card_charging_id').css('display','block');
		     $('#sms_charging_id').css('display','none');
		     $('#wap_charging_id').css('display','none');
		     $('#iac_charging_id').css('display','none');
	    }
	});
	</script>
	<script type="text/javascript">
		$(document).ready(function(){
			var selected_radio = $('input:radio[name=usingDefaultRate]:checked').val();
			if (selected_radio == 'yes'){
		        $("#charging_rates_default").css("display", "block");
		        $("#charging_rates_private").css("display", "none");
		    }
		    else
		    {
		    	 //charging_rates_default
		    	 $("#charging_rates_default").css("display", "none");
		    	 $("#charging_rates_private").css("display", "block");
		    }
		});
	</script>
</body>
</html>

<!-- Popup Dải tỷ lệ -->
<div style="display: none; position: fixed; opacity: 1; z-index: 11000; left: 50%; margin-left: -420px; top: 0px;" id="merchant_profile_popup" class="style_formpopup_common popup_mc_info_contract">
                    <div class="pop_box">
                        <div class="contract_content"> 
                        <h1 class="srv_title" style="width:400px;">Xem trước chi tiết hợp đồng</h1>
                        <!-- 
                        <input name="reset" value="Thoát" type="reset" class="modal_close" style="float:right; margin-right:10px;"/>
                         -->
                        <a class="close" title="Đóng" onclick="$('#lean_overlay').click();" href="javascript:void(0);">X</a>
                        </div>
                        <p class="title-box title_box_margin">Thông tin hợp đồng</p>
                        <div class="srv_row srv_row_margin">
                        	<div class="w_50">
                            	<div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant" id="popup_payment_policy"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Tên đối tác: </label>
                                    <span class="go_sms_product_name popup_merchant_name"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Email: </label>
                                    <span class="go_sms_product_name popup_merchant_email"></span>
                                </div>
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Điện thoại: </label>
                                    <span class="go_sms_product_name popup_merchant_phone"></span>
                                </div>
                                <div class="contract_content"> 
                                    <label class="label_popup_edit_contact">Số hợp đồng: </label>
                                    <span class="popup_contract_no"></span>
                                </div>    
                                <div class="contract_content">     
                                    <label class="label_popup_edit_contact">Loại hợp đồng: </label>
							        <span class="popup_contract_type"></span>
                                </div> 
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Chu kỳ đối soát:</label>
							        <span class="popup_payment_policy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">HĐ bản cứng:</label>
                                    <span class="popup_hasHardCopy"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Tự động gia hạn HĐ:</label>
                                    <span class="autoExtendedContract"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày ký hợp đồng: </label>
                                    <span class="popup_contract_date"></span>
                                </div>
                                
                                <div class="contract_content"> 
                                	<label class="label_popup_edit_contact">Ngày hết hạn: </label>
                                    <span class="popup_contract_expired_date_"></span>
                                </div>
                            </div>
                            <div class="w_50">
                            	<!-- CMND -->
								<div class="product_slc_filter filter_row">
									<fieldset class="billing_info_detail" style="width:370px">
										<legend>
											<strong> CMND/ĐKKD &nbsp; <c:if
													test="${identity.verify}">
													<img class="billing_info_image_popup_common" border="0"
														title="Đã xác thực CMND/ĐKKD"
														src="<%=request.getContextPath()%>/images/tick.png" />
												</c:if> <c:if test="${!identity.verify}">
													<img class="billing_info_image_popup_common" border="0"
														title="Chưa xác thực CMND/ĐKKD"
														src="<%=request.getContextPath()%>/images/com_wait.png" />
												</c:if>
											</strong>
										</legend>
										<div style="padding: 2px;">
											<div class="product_title">
												<label class="label_popup_profile">CMND/ĐKKD:</label>
												<span class="go_sms_product_name popup_merchant_identity"></span>
											</div>
											<div class="product_title">
												<label class="label_popup_profile">Ngày cấp:</label>
												<span class="go_sms_product_name popup_dateOfIssue"></span>
											</div>
											<div class="product_title">
												<label class="label_popup_profile">Nơi cấp CMND/Địa chỉ ĐKKD:</label>
												<span class="go_sms_product_name popup_placeOfIssue"></span>
											</div>
										</div>
									</fieldset>
								</div>
								<!-- CMND -->

									<!-- Thông tin thanh toán -->
									<div class="product_slc_filter filter_row">
										<fieldset class="billing_info_detail" style="width:370px">
											<legend>
												<strong> Thông tin thanh toán &nbsp; <c:if
														test="${billingInformation.verify}">
														<img class="billing_info_image_popup_common" border="0"
															title="Đã xác thực thông tin thanh toán"
															src="<%=request.getContextPath()%>/images/tick.png" />
													</c:if> <c:if test="${!billingInformation.verify}">
														<img class="billing_info_image_popup_common" border="0"
															title="Chưa xác thực thông tin thanh toán"
															src="<%=request.getContextPath()%>/images/com_wait.png" />
													</c:if>
												</strong>
											</legend>
											<div style="padding: 2px;">
												<div class="product_title">
													<label class="label_popup_profile">Chủ tài khoản:</label>
													<span class="go_sms_product_name popup_bank_account_holder"></span>
												</div>
												<div class="product_title">
													<label class="label_popup_profile">Số tài khoản:</label>
													<span class="go_sms_product_name popup_bank_account_number"></span>
												</div>
												<div class="product_title">
													<label class="label_popup_profile">Tên ngân hàng:</label>
													<span class="go_sms_product_name popup_bank_name"></span>
												</div>
												<div class="product_title">
													<label class="label_popup_profile">Tại tỉnh/thành phố:</label>
													<span class="go_sms_product_name popup_bank_city"></span>
												</div>
												<div class="product_title">
													<label class="label_popup_profile">Tên chi nhánh:</label>
													<span class="go_sms_product_name popup_bank_branch"></span>
												</div>
											</div>
										</fieldset>
									</div>
									<!-- /Thông tin thanh toán -->
                            </div>
                            <div class="clear"></div>
                        </div>
                      </div>
                      <p class="title-box title_box_margin_no_title"></p>
                      
                    <div style="width:100%">
                        <!-- Ty le -->
                    	<div style="height: 250px; width: 100%; display: auto; overflow:scroll; border:1px solid #666666;" id="include_rates">
                     		<input type="hidden" id="info_amount_rate_card" value="0" />
                     	</div>
                    	<!-- /Ty le -->
                    </div>
</div>
<!-- / Popup Dải tỷ lệ -->