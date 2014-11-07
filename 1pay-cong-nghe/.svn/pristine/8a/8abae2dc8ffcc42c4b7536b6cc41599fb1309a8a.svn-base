<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta name="apple-mobile-web-app-capable" content="yes"/>
<meta name="apple-mobile-web-app-status-bar-style" content="black"/>
<meta name="format-detection" content="telephone=no"/>
<meta name="viewport" content="width=device-width"/>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<link rel="icon" href="<%=request.getContextPath() %>/favicon.png" type="image/x-icon"/>
<link rel="shortcut icon" href="https://static.mwork.vn/favicon.png" type="image/x-icon"/>
<title>1Pay.vn - Kết nối nhanh, thanh toán linh hoạt | Ket noi nhanh, thanh toan linh hoat</title>
<style>
body {
margin: 0px;
padding: 0px;
font-family: arial;
font-size: normal;
color: #666;
background: #e9e9e9;
}
a {
color: #666;
text-decoration: none;
text-outline: none;
}
a:hover {
color: #666;
text-decoration: underline;
text-outline: none;
}
div {
display: block;
}
.header {
background: #ff9c00 url(https://static.mwork.vn/v2/images/header_bg.gif) repeat-x;
height: 44px;
}
.nav {
background: url(https://static.mwork.vn/v2/images/nav_bg.gif) repeat-x;
border-top: 1px solid #4a4f54;
border-bottom: 1px solid #4a4f54;
}
.notify {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_notify.png) no-repeat;
float:left;
margin-right: 8px;
}
.notify:hover {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_notify_hover.png) no-repeat;
float:left;
margin-right: 8px;
width: 24px;
height: 24px;
display: block;
}
.notify_focus {
background: url(https://static.mwork.vn/v2/images/icon_notify_focus.png) no-repeat;
float:left;
margin-right: 8px;
position: relative;
}
.moneynotify {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_moneynotify.png) no-repeat;
float:left;
margin-right: 8px;
float:left;
}
.moneynotify:hover {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_moneynotify_hover.png) no-repeat;
float:left;
margin-right: 8px;
text-decoration: none;
}
.moneynotify_focus {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_moneynotify_focus.png) no-repeat;
float:left;
margin-right: 8px;
position: relative;
}
.message {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_message.png) no-repeat;
margin-right: 2px;
float:left;
margin-right: 8px;
}
.message:hover {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_message_hover.png) no-repeat;
float:left;
margin-right: 8px;
text-decoration: none;
}
.message_focus {
width: 24px;
height: 24px;
display: block;
background: url(https://static.mwork.vn/v2/images/icon_message_focus.png) no-repeat;
float:left;
margin-right: 8px;
position: relative;
}
.notify_no {
display: block;
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px;
padding: 1px 3px 1px 3px;
background: #F00;
position: absolute;
top: -4px;
right: -4px;
font-weight: bold;
color: #fff;
font-size: 11px;
text-align: center;
text-decoration: none;
-moz-box-shadow: 1px 1px 0px 0px #999;
-webkit-box-shadow: 1px 1px 0px 0px #999;
box-shadow: 1px 1px 0px 0px #999;
}
.sub-nav {
position:relative;
height:48px;
color:#9a9b9c;
background: url(https://static.mwork.vn/v2/images/nav_bg.gif) repeat-x;
}
.sub-nav ul {
border-collapse:collapse;
clear:both;
display:table;
table-layout:fixed;
width:100%;
position:relative;
line-height:1;
margin: 0px;
}
.sub-nav ul li {
display:table-cell;
position:relative
}
.sub-nav ul li>.area-tap {
margin:0;
padding:2px 0 0;
border-top:1px solid #41464b;
border-bottom:1px solid #282d32;
position:relative;
display:block;
height:44px;
color:#9a9b9c;
text-shadow:0 -1px 0 #41464b;
-webkit-border-radius:0;
border-radius:0;
font-size: 11px;
font-weight:bold;
text-align:center;
z-index:2;
cursor: pointer;
}
.sub-nav ul li>.area-tap.tapped {
color:#fff;
cursor: pointer;
}
.sub-nav ul li>.area-tap .sprite {
margin-right:auto;
margin-left:auto;
text-align:center;
width:30px;
height:30px;
cursor: pointer;
}
.sub-nav ul li.current>.area-tap {
color:#9a9b9c;
text-shadow:none;
background: url(https://static.mwork.vn/v2/images/nav_focus.gif) repeat-x;
box-shadow:0 0 10px #14191e inset;
cursor: pointer;
}
@media all and (min-width: 480px) and (orientation: landscape) {
.sub-nav {
height:36px
}
.sub-nav ul li .area-tap {
padding:2px 0 0 7px;
height:33px;
cursor: pointer;
}
.sub-nav ul li .area-tap .sprite, .sub-nav ul li .area-tap .label {
display:table-cell;
vertical-align:middle
}
.sub-nav ul li .area-tap .label {
padding-left:2px
}
}
.head_title {
margin: 0px;
color: #334455;
font-size: normal;
font-weight: bold;
padding: 10px 10px 5px;
}
.box_row {
padding: 0px 8px 8px 8px;
}
.list_botron_top {
padding: 8px;
background: #fff;
border-radius: 5px 5px 0 0;
box-shadow: 0 1px 3px #E1E2E3;
border-bottom: 1px solid #EAEAEA;
}
.list_botron_mid {
padding: 8px;
background: #fff;
box-shadow: 0 1px 3px #E1E2E3;
border-bottom: 1px solid #EAEAEA;
}
.list_botron_bottom {
padding: 8px;
background: #fff;
border-radius: 0 0 5px 5px;
box-shadow: 0 1px 3px #E1E2E3;
}
.link_bold {
font-weight: bold;
color: #666;
}
.link_red {
color: #F00;
font-weight: bold;
}
.link_normal {
color: #666;
}
.notify_holder {
padding: 8px;
}
.notify_yellow_top {
border-bottom: 1px solid #EAEAEA;
border-radius: 5px 5px 0 0;
padding: 8px;
background: #ffffe3;
}
.notify_yellow_mid {
border-bottom: 1px solid #EAEAEA;
padding: 8px;
background: #ffffe3;
}
.notify_yellow_bottom {
border-radius: 0 0 5px 5px;
box-shadow: 0 1px 3px #E1E2E3;
padding: 8px;
background: #ffffe3;
}
.round_box {
border-radius: 5px;
padding: 8px;
background: #fff;
}
.product_img {
width: 82px;
height: 82px;
display: block;
position: relative
}
.data_row {
padding-bottom: 8px;
}
.link_notify {
font-size: small;
}
.link_green {
color: #678B3B;
}
.link_green:hover {
color: #678B3B;
}
.link_green_small {
font-size: small;
color: #678B3B;
}
.link_green_small:hover {
font-size: small;
color: #678B3B;
}
.focus_info {
font-weight: bold;
color: #678B3B;
}
.other_info {
color: #999;
font-size: small;
}
.data_head {
padding: 8px;
background: #F8F8F8;
border-radius: 5px 5px 0 0;
box-shadow: 0 1px 3px #E1E2E3;
border-bottom: 1px solid #EAEAEA;
}
.filter_focus {
font-weight: bold;
color: #000;
}
.filter_link {
font-weight: bold;
color: #678B3B;
}
.filter_link:hover {
font-weight: bold;
color: #678B3B;
}
.shout_box {
border: 1px solid #ccc;
height: 28px;
background: #fff
}
.txt_shout {
border: 0px solid #fff;
padding-left: 5px;
height: 26px;
width: 80%;
}
.admin_ava {
font-weight: bold;
color: #900;
}
.mod_ava {
font-weight: bold;
color: #09C;
}
.def_ava {
font-weight: bold;
color: #666;
}
.comment_row {
border-bottom: 1px solid #F4F4F4;
}
.footer {
background: url(https://static.mwork.vn/v2/images/footer_bg.gif) repeat-x top;
padding: 10px;
}
.foot_nav {
padding: 8px;
background: #F9F9F9;
}
.foot_info {
color: #CCCCCC;
font-size: x-small;
}
.ads_box {
padding: 8px;
}
.viechot {
border-bottom: 1px solid #EAEAEA;
padding: 8px;
background: #ffffe3;
}
.location_bar {
padding: 8px;
}
.des_txt {
font-size: small;
}
.pre_link {
color: #FF9900;
}
.pre_link:hover {
color: #FF9900;
}
.focus_no {
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px;
padding: 1px 3px 1px 3px;
background: #F00;
font-weight: bold;
color: #fff;
font-size: x-small;
text-align: center;
margin-bottom: 2px;
text-decoration: none;
}
.focus_link {
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px;
background:#999;
padding: 2px 5px 2px 5px;
color: #fff;
font-size: small;
}
.focus_link:hover {
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px;
background:#F90;
padding: 2px 5px 2px 5px;
color: #fff;
text-decoration: none;
font-size: small;
}
.split_slc {
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
padding: 2px 5px 2px 5px;
background:#F90;
font-weight: bold;
color: #fff;
font-size: normal;
text-align: center;
text-decoration: none;
}
.split_slc:hover {
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
padding: 2px 5px 2px 5px;
background: #999;
font-weight: bold;
color: #fff;
font-size: normal;
text-align: center;
text-decoration: none;
}
.split_no {
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
padding: 2px 5px 2px 5px;
background: #F0F0F0;
font-weight: bold;
color: #333;
font-size: normal;
text-align: center;
margin-right: 5px;
text-decoration: none;
}
.split_no:hover {
-webkit-border-radius: 5px;
-moz-border-radius: 5px;
border-radius: 5px;
padding: 2px 5px 2px 5px;
background: #F0F0F0;
font-weight: bold;
color: #333;
font-size: normal;
text-align: center;
text-decoration: none;
margin-right: 5px;
}
.txt_embed {
background: none repeat scroll 0 0 #FFFFFF;
border: 1px solid #CCCCCC;
color: #999999;
padding: 3px;
width: 95%;
}
.embed_row {
padding-top: 5px;
}
.gray_head {
background: #F8F8F8;
border-bottom: 1px solid #EAEAEA;
box-shadow: 0 1px 3px #E1E2E3;
padding: 8px;
}
.home_header
{
background: #ff9c00 url(https://static.mwork.vn/v2/images/h_headmid_bg.png) repeat-x;
height: 94px;
text-align: center;
}
.mw_words {
color: #666666;
font-size: xx-large;
font-weight: bold;
text-align: center;
}
.btn_green
{
background: url(https://static.mwork.vn/v2/images/btn_gradient.gif) repeat-x;
color: #fff;
text-align: center;
border: 1px outset #060;
padding: 6px 30px 6px 30px;
cursor: pointer;
font-size: normal
}
.btn_skip
{
background: url(https://static.mwork.vn/v2/images/btn_skip_bg.gif) repeat-x;
color: #666;
text-align: center;
border: 1px outset #CCC;
padding: 6px 30px 6px 30px;
cursor: pointer;
font-size: normal
}
.list_whatnew_row {
padding-bottom: 5px;
}
.ads_no
{
border-radius: 65px;
background: #f88e1e;
color: #fff;
font-size: large;
font-weight: bold;
padding: 3px 8px 3px 8px
}
.form_dieule
{
padding: 10px;
border: 1px solid #CCCCCC;
height: 150px;
overflow: auto;
margin-bottom: 10px;
font-size: small;
}
.lbl_dieule
{
font-size: small;
font-weight: bold;
}
.lbl_gray {
-webkit-border-radius: 3px;
-moz-border-radius: 3px;
border-radius: 3px;
background: #D8DFEA;
font-size: small;
font-weight: bold;
color: #3B5998;
padding: 2px 5px 2px 5px;
margin-right: 5px;
}
.list_row {
padding-bottom: 5px;
}
.error {
background: #fffce6;
padding: 5px;
border: 1px solid #fc0;
font-size: normal;
margin-bottom: 5px;
}
.txt_dangnhap {
color: #333;
font-size: normal;
border: 1px solid #ccc;
width: 95%;
padding: 3px;
}
</style>

<script>try {  for(var lastpass_iter=0; lastpass_iter < document.forms.length; lastpass_iter++){    var lastpass_f = document.forms[lastpass_iter];    if(typeof(lastpass_f.lpsubmitorig)=="undefined"){      if (typeof(lastpass_f.submit) == "function") {        lastpass_f.lpsubmitorig = lastpass_f.submit;        lastpass_f.submit = function(){          var form = this;          try {            if (document.documentElement && 'createEvent' in document)            {              var forms = document.getElementsByTagName('form');              for (var i=0 ; i<forms.length ; ++i)                if (forms[i]==form)                {                  var element = document.createElement('lpformsubmitdataelement');                  element.setAttribute('formnum',i);                  element.setAttribute('from','submithook');                  document.documentElement.appendChild(element);                  var evt = document.createEvent('Events');                  evt.initEvent('lpformsubmit',true,false);                  element.dispatchEvent(evt);                  break;                }            }          } catch (e) {}          try {            form.lpsubmitorig();          } catch (e) {}        }      }    }  }} catch (e) {}</script></head>

<body>

<div>
<!-- 
<div class="home_header"><a href="https://1pay.vn/"><img  src="<%=request.getContextPath() %>/images/logo_1pay_trans.png" border="0" width="160" height="94"/></a></div>
 -->
 <div class="box_row">
<div class="round_box"><a href="https://1pay.vn/"><img  src="<%=request.getContextPath() %>/images/logo_1pay_trans.png" border="0" width="150" height="90"/></a></div>
</div> 
<style>
.list_row {
padding-bottom: 5px;
}
.error {
background: #FFFCE6;
padding: 5px;
border: 1px solid #FC0;
font-size: normal;
margin-bottom: 5px;
}
.txt_dangnhap {
color: #333;
font-size: normal;
border: 1px solid #CCC;
width: 95%;
padding: 3px;
}
</style>
<div class="head_title">
Hoàn thiện thông tin đăng ký
</div>
<div class="box_row">
<div class="round_box">
	<form:form name="registration" commandName="registration" method="post">
		<form:hidden path="referer" />
		<div class="list_row">Tên hiển thị</div>
		<div class="list_row">
			<form:input path="fullName" class="txt_dangnhap"/>
		</div>		
		<div class="list_row">Tài khoản</div>
		<div class="list_row">
			<form:input path="userName" class="txt_dangnhap"/>
		</div>
		<div class="list_row">Mật khẩu</div>
		<div class="list_row">
			<form:password path="password" class="txt_dangnhap"/>
		</div>
		<div class="list_row">Nhập lại mật khẩu</div>
		<div class="list_row">
			<form:password path="rpassword" class="txt_dangnhap" />
		</div>
		<div class="list_row">Email</div>
		<div class="list_row">
			<form:input path="email" class="txt_dangnhap"/>
		</div>
		<div class="list_row">
		Số điện thoại<br>
		<span style="color:red;">(Bạn cần điền chính xác số điện thoại của mình để có thể thanh toán với 1Pay)</span>
		</div>
		<div class="list_row">
			<form:input path="phone" class="txt_dangnhap"/>
		</div>
		<div class="list_row">Bạn biết đến 1Pay từ:</div>
		<div class="list_row">
			<form:select path="referer" class="txt_dangnhap">
			   <form:option value="REF_NONE" label="--- Lựa chọn ---"/>
			   <form:options items="${referers}" />
			</form:select>
		</div>	
		<div class="list_row">
			<label for="tos_agree"><input type="checkbox" id="tos_agree" value="agree"
				name="tos_agree" tabindex="5" /> Tôi đồng ý <a href="<%=request.getContextPath() %>/dieu-khoan.html"
				target="_blank" class="link_terms">các điều khoản của 1pay!</a></label>
		</div>
		<form:errors path="*" cssStyle="color:#f00;" />
		<div class="list_row">
			<input value="Hoàn thành đăng ký" class="btn_green" type="submit" />
		</div>
	</form:form>
</div>

</div>
</div>
<div class="footer">

<table border="0" cellpadding="0" cellspacing="0"> 
	<tbody>
		<tr>
			<td class="foot_info" style="padding-left:5px; text-align: left">
				©2013 1Pay Co., Ltd. All rights reserved.
			</td> 
		</tr> 
	</tbody>
</table>
</div>
</body></html>