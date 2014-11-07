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

<style type="text/css">
h3.filter_label_ {
  margin: 0;
  font-size: 14px;
  padding: 0px;
}

h3.filter_label_ a {
  background: url("../images/sprite.png") 5px 13px no-repeat;
  display: block;
  padding: 10px;
  padding-left: 24px;
  margin: 0;
  text-decoration: none;
  font-weight: normal;
   font-size: 14px;
  
}
h3.filter_label_:hover { }
h3.open  {  }
h3.open a { background-position: 5px -25px; }
h3.filter_label + .box_locketqua { padding: 10px; border: 1px solid #ccc;
font-size: 14px; }

h3.filter_label_+.box_locketqua{
  display: block;
  margin-bottom: 20px;
}
</style>

<script type="text/javascript" src="<%=request.getContextPath() %>/js//nicEdit.js"></script>
<script type="text/javascript">
//<![CDATA[
bkLib.onDomLoaded(function() {
    nicEditors.editors.push(
        new nicEditor().panelInstance(
            document.getElementById('description')
        )
    );
});
//]]>
</script>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
$(document).ready(function() {
	$('.filter_label_').live('click', function() {
		var lbClass = $(this).attr('class') + '';
		if(lbClass.indexOf('box_locketqua_hide')>0) {
			lbClass = lbClass.replace(/ close/gi,' open');
			$(this).attr('class', lbClass.replace(/ box_locketqua_hide/gi,''));
			$('.box_locketqua').fadeIn(300);
		} else {
			lbClass = lbClass.replace(/ open/gi,' close');
			$(this).attr('class', lbClass + ' box_locketqua_hide');
			$('.box_locketqua').fadeOut(300);
		}
	});
});

/* Ẩn hiện thêm điều kiện*/
$(document).ready(function(){
    $(".slidingDiv").hide();
    $(".show_hide").show();
	$('.show_hide').click(function(){
		$(".slidingDiv").slideToggle();
	});
});
/* Ẩn hiện thêm điều kiện*/

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
  //$(".slidingDiv").hide();
  $('.filter_label_').click();

  //Hien thi Row moi len Table
  $('#tbody_content').before(table_content());
  
  $("#dk").val("");
  $("#mt").val("");
}

//Them 1 DK moi
var table_content = function(){
	var html_ret = '';
	if(true)
	{
		var zIndex = 1;
		if(parseInt($('input[name=hd_size]').size()) > 0) zIndex = parseInt($('input[name=hd_size]').size()) + 1;
		//Them tile cho table neu add DK dau tien
		if($('input[name=hd_size]').size()==0)
		{
			html_ret += '<tr id="title_table_dk">';
				html_ret += '<td class="transhead" width="30">#</td>';
				html_ret += '<td class="transhead" width="120">Điều kiện</td>';
				html_ret += '<td  class="transhead" width="100">MT</td>';
				html_ret += '<td class="transhead" width="40">Actions</td>';
			html_ret += '</tr>';
		}
		html_ret += '<tr id="row-index-'+ zIndex +'" >';
		//stt
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-stt-'+ zIndex +'">' + zIndex + '</span>';
			html_ret +=	'<input type="hidden" value="1" name="hd_size">';
		html_ret +=	'</td>';
		//dieu kien
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-dieukien-'+ zIndex +'">' + $("#dk").val() + '</span>';
			html_ret +=	'<input type="hidden" value="'+$("#dk").val()+'" name="hd_dieukien" id="hd_dieukien-'+ zIndex +'">';
		html_ret +=	'</td>';
		
		html_ret += '<td class="svr_data" style="padding: 8px" align="center">';
			html_ret +=	'<span  id="td-mt-'+ zIndex +'">' + $("#mt").val() + '</span>';
			html_ret +=	'<input type="hidden" value="'+$("#mt").val()+'" name="hd_mt" id="hd_mt-'+ zIndex +'">';
		html_ret +=	'</td>';

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
			//$("#title_table_dk").hide();
			//$('tr#title_table_dk').removeAttr('id');
			$('#title_table_dk').remove();
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
						<%request.setAttribute("merchantSupport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<form:form name="create_sms_scenario" commandName="create_sms_scenario" method="post">
						<div class="right_content">
							<h1 class="srv_title">SMS - Tạo URL nhận MO</h1>
							<div class="srv_row">
								<!-- Form thong tin kich ban-->
								<table cellpadding="10" cellspacing="0" width="100%" class="api_access_tbl">
									<tbody>
										<tr>
											<td class="profile_label" width="140">Tiêu đề<span class="red">(&#42;)</span>:</td>
											<td>
												<form:input path="title"  class="txt_filter" placeholder="Tiêu đề" onfocus="clear(this)" />
												<form:errors path="title" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140" valign="top">MT mặc định<span class="red">(&#42;)</span>:</td>
											<td>
												<form:textarea path="mtDefault"  rows="3" cols="47"/>
												<form:errors path="mtDefault" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140" valign="top">Mô tả kịch bản:</td>
											<td>
												<form:textarea id="description" path ="description" name="txtContent" style="width: 350px; height: 100px;" />
												<form:errors path="description" cssStyle="color:#f00;" />
											</td>
										</tr>
										<tr><td colspan="2"></td></tr>
									</tbody>
								</table>
								<!-- /Form thong tin kich ban-->
							    <br/>
							    <table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
			                       <tbody>
			                         <input type="hidden" id="tbody_content" value="0" />
			                       </tbody>
			                     </table>
							    <form:errors path="hd_dieukien" cssStyle="color:#f00;" />
							    <br/>
							    <div id="">
									<h3 class="filter_label_ close box_locketqua_hide"><a href="#">Khởi tạo kịch bản</a></h3>
								</div>
								<!-- Them DK -->
								<div class="box_locketqua" style="display: none;">
									<table cellpadding="5" cellspacing="0" width="100%">
									<tbody>
										<tr>
											<td class="profile_label" width="140" valign="top">MO đến<span class="red">(&#42;)</span>:</td>
											<td>
												<form:input path="dk"  class="txt_filter" placeholder="Tin nhắn đến chứa từ khoá" onfocus="clear(this)" />
											</td>
										</tr>
										<tr>
											<td class="profile_label" width="140" valign="top">MT trả về<span class="red">(&#42;)</span>:</td>
											<td>
												<form:textarea path="mt"  placeholder="Nội dung MT tương ứng trả về" onfocus="clear(this)" rows="3" cols="42"/>
											</td>
										</tr>
										<tr>
											<td>&nbsp;</td>
											<td><input class="btn_greensmall" id="themdieukien" value="Thêm" type="button" onclick="clickFirstButton()"/></td>
										</tr>
									</tbody>
									</table>
				                </div>
				                <!-- /Them DK -->
								<input id="form-action-cabinet-save" value="Cập nhật" class="btn_greensmall" type="submit"/>
								<a href="<%=request.getContextPath()%>/protected/list-sms-scenario.html" class="btn_graysmall">Hủy bỏ</a>
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
