<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<style>
table {
    *border-collapse: collapse; /* IE7 and lower */
    border-spacing: 0;
    width: 100%;    
}

.bordered {
    border: solid #ccc 1px;
    -moz-border-radius: 6px;
    -webkit-border-radius: 6px;
    border-radius: 6px;
    -webkit-box-shadow: 0 1px 1px #ccc; 
    -moz-box-shadow: 0 1px 1px #ccc; 
    box-shadow: 0 1px 1px #ccc;         
}

.bordered tr:hover {
    background: #fbf8e9;
    -o-transition: all 0.1s ease-in-out;
    -webkit-transition: all 0.1s ease-in-out;
    -moz-transition: all 0.1s ease-in-out;
    -ms-transition: all 0.1s ease-in-out;
    transition: all 0.1s ease-in-out;     
}    
    
.bordered td, .bordered th {
    border-left: 1px solid #ccc;
    border-top: 1px solid #ccc;
    padding: 10px;
    text-align: left;    
}

.bordered th {
    background-color: #dce9f9;
    background-image: -webkit-gradient(linear, left top, left bottom, from(#ebf3fc), to(#dce9f9));
    background-image: -webkit-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:    -moz-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:     -ms-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:      -o-linear-gradient(top, #ebf3fc, #dce9f9);
    background-image:         linear-gradient(top, #ebf3fc, #dce9f9);
    -webkit-box-shadow: 0 1px 0 rgba(255,255,255,.8) inset; 
    -moz-box-shadow:0 1px 0 rgba(255,255,255,.8) inset;  
    box-shadow: 0 1px 0 rgba(255,255,255,.8) inset;        
    border-top: none;
    text-shadow: 0 1px 0 rgba(255,255,255,.5); 
}

.bordered td:first-child, .bordered th:first-child {
    border-left: none;
}

.bordered th:first-child {
    -moz-border-radius: 6px 0 0 0;
    -webkit-border-radius: 6px 0 0 0;
    border-radius: 6px 0 0 0;
}

.bordered th:last-child {
    -moz-border-radius: 0 6px 0 0;
    -webkit-border-radius: 0 6px 0 0;
    border-radius: 0 6px 0 0;
}

.bordered th:only-child{
    -moz-border-radius: 6px 6px 0 0;
    -webkit-border-radius: 6px 6px 0 0;
    border-radius: 6px 6px 0 0;
}

.bordered tr:last-child td:first-child {
    -moz-border-radius: 0 0 0 6px;
    -webkit-border-radius: 0 0 0 6px;
    border-radius: 0 0 0 6px;
}

.bordered tr:last-child td:last-child {
    -moz-border-radius: 0 0 6px 0;
    -webkit-border-radius: 0 0 6px 0;
    border-radius: 0 0 6px 0;
}

.icon-16-delete {background:url("../images/delete.gif") no-repeat center; width: 20px; }
</style>

<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
/* Ẩn hiện thêm điều kiện*/
$(document).ready(function(){
    $(".slidingDiv").hide();
    $(".show_hide").show();
	$('.show_hide').click(function(){
		$(".slidingDiv").slideToggle();
	});
});
/* Ẩn hiện thêm điều kiện*/

$("#themdieukien").click(function() {
	 alert('ao');
});
function clickFirstButton(){
	//Validate input
  if($("#dk").val() == undefined || jQuery.trim($("#dk").val()) == '')
	{
		alert("Bạn chưa nhập điều kiện");
		$("#dk").focus();
		return ;
	}
  if($("#mt").val() == undefined || jQuery.trim($("#mt").val()) == '')
	{
		alert("Bạn chưa nhập MT");
		$("#mt").focus();
		return ;
	}
  //An Form them moi
  $(".slidingDiv").hide();

  //Hien thi Row moi len Table
  $('#tbody_content').before(table_content());
  
  $("#dk").val("");
  $("#mt").val("");
}

var table_content = function(){
	var html_ret = '';
	if(true)
	{
		var zIndex = 1;
		if(parseInt($('input[name=hd_size]').size()) > 0) zIndex = parseInt($('input[name=hd_size]').size()) + 1;
		html_ret = '<tr id="row-index-'+ zIndex +'">';
		//stt
		html_ret += '<td>';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size">';
		html_ret +=	'</td>';
		//dieu kien
		html_ret += '<td>';
			html_ret +=	'<span  id="td-dieukien-'+ zIndex +'">' + $("#dk").val() + '</span>';
			html_ret +=	'<input type="hidden" value="'+$("#dk").val()+'" name="hd_dieukien" id="hd_dieukien-'+ zIndex +'">';
		html_ret +=	'</td>';
		
		html_ret += '<td>';
			html_ret +=	'<span  id="td-mt-'+ zIndex +'">' + $("#mt").val() + '</span>';
			html_ret +=	'<input type="hidden" value="'+$("#mt").val()+'" name="hd_mt" id="hd_mt-'+ zIndex +'">';
		html_ret +=	'</td>';

		html_ret += '<td class="isPub" width="16"><a class="isPub" id="delete_button_'+ zIndex +'"  onclick="deleteRowTable(this.id);" href="javascript: void(0);" title="Xóa"><div class="icon-16-delete" style="cursor: pointer;width:16px;">&nbsp;</div></a></td>';

		html_ret += '</tr>';
	}
	return html_ret;
};

//Xoa dieu kien tren Table
var deleteRowTable = function(id)
{
	var answer = confirm("Bạn có muốn xóa");
	if(answer){
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
	}
};

$("#form-action-cabinet-save").click(function() {
	alert('submit');
	var flag = 0;
	if(($("#pharmacy_id").val() == null || $("#pharmacy_id").val() == undefined || $("#pharmacy_id").val()  == '') && parseInt($('input[name=hd_size]').size()) > 0)
	{	
		flag = 1;
	}else{
		flag = 0;
		addRowTable('0');
	}
	if(flag == 1){
		$("#form-action-cabinet-save").css("display", "none");
		$("#action").val("save");
		$("#frmAction").removeAttr("onsubmit");
		$("#frmAction").submit();
	}
});
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
						<%request.setAttribute("accountProfile", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						
						<form:form name="/protected/profile" commandName="create_service" method="post">
						<div class="right_content">
							<h1 class="srv_title">Khởi tạo kịch bản</h1>
							<div class="srv_row">
								<table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="profile_label" width="140">Title:</td>
											<td>
												<form:input path="title"  class="txt_filter" placeholder="Title" onfocus="clear(this)" />
												<span class="red">(&#42;)</span>
												<form:errors path="title" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140">Description:</td>
											<td>
												<form:input path="description"  class="txt_filter" placeholder="Description" onfocus="clear(this)" />
												<span class="red">(&#42;)</span>
												<form:errors path="description" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140">MT Default:</td>
											<td>
												<form:input path="mtDefault"  class="txt_filter"/>
												<form:errors path="mtDefault" cssStyle="color:#f00;" />
												<span class="red">(&#42;)</span>
											</td>
										</tr>
										
										<tr><td colspan="2"></td></tr>
									</tbody>
								</table>
								
								<table cellpadding="5" cellspacing="0" class="bordered">
									<tr>
										<th>STT</th><th>Điều kiện</th><th>MT</th><th>#</th>
									</tr>
									<input type="hidden" id="tbody_content" value="0" />
							    </table>
							    <form:errors path="hd_dieukien" cssStyle="color:#f00;" />
							    <br>
							    
							    <a href="#" class="show_hide"><b>Thêm điều kiện</b></a>
							    <div class="slidingDiv">
							    <table cellpadding="5" cellspacing="0">
									<tbody>
										<tr>
											<td class="profile_label" width="140">Điều kiện:</td>
											<td>
												<form:input path="dk"  class="txt_filter" placeholder="Điều kiện" onfocus="clear(this)" />
												<span class="red">(&#42;)</span>
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140">MT:</td>
											<td>
												<form:input path="mt"  class="txt_filter" placeholder="MT" onfocus="clear(this)" />
												<span class="red">(&#42;)</span>
												<input id="themdieukien" value="Thêm" type="button" onclick="clickFirstButton()"/>
											</td>
										</tr>
									</tbody>
								</table>
								</div>
								
								<input id="form-action-cabinet-save" value="Cập nhật" class="btn_greensmall" type="submit"/>
								<a href="<%=request.getContextPath()%>/protected/create-service.html" class="btn_greensmall">Hủy</a>
							</div>
						</div>
						</form:form>
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
