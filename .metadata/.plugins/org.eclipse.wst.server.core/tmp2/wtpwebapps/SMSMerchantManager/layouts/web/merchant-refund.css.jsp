<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>

<style type="text/css">
	.a_tag a{
	font-size: 14px;
	color: #2c8f39;
	display: block;
	padding: 5px 0px 5px 0px;
}

.a_tag a:HOVER {
	font-size: 14px;
	color: #2c8f39;
	display: block;
	padding: 5px 0px 5px 0px;
}

.input_txt{
	width: 80%;
	padding: 5px;
	margin-left: 5%;
}

.input_number{
	width: 80%;
	padding: 5px;
	margin-left: 5%;
	text-align: right;
}

.select_style{
	width: 40%;
	padding: 5px;
	margin-left: 5%;
}

.textarea_style{
	width: 80%;
	padding: 5px;
	/* margin-left: 5%; */
}

.text_al_right{
	text-align: right;
	height: 30px;
}

.text_al_left{
	height: 30px;
	text-align: left;
	margin-left: 5%;
}

.select_full_style{
	width: 90%;
	padding: 5px;
	margin-left: 5%;
}

.content_left{
	min-height: 30px;
	text-align: left;
	margin-left: 5%;
	
	font-size: 14px;
	font-weight: bold;
	color: #2C8F39;
	line-height: 30px;
	
}

.content{
	height: 30px;
	text-align: left;
	margin-left: 5%;
	
	font-size: 14px;
	/* color: #2C8F39; */
	/* line-height: 30px; */
	
	width : 80%; height: auto; 
	float : left; margin-bottom: 10px; background: #F9F9F9; 
	padding: 10px; border-radius: 5px 5px 5px 5px; 
	font-weight: normal;
}

.bottom_border_span{
	width: 100%; display: block; border-bottom: 1px solid #CCCCCC;
}

#form_info table{
		font-size: 14px;
}
#form_info table tr{
	padding: 5px;
}
#form_info table tr td:FIRST-CHILD{
	width: 30%;
}

.width50{
	width: 50px;
}
.width60{
	width: 60px;
}
.width10{
	width: 10px;
}
.width15{
	width: 15px;
}
.width20{
	width: 20px;
}
.width80{
	width: 80px;
}

.width90{
	width: 80px;
}

.width100{
	width: 100px;
}

.width120{
	width: 120px;
}

.width200{
	width: 200px;
}

.add_record , .add_record:HOVER{
	background: url("<%=request.getContextPath()%>/images/add.png") no-repeat scroll left center, url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
	color: #FFFFFF;
	display: block;
	float: right;
	font-weight: bold;
	height: 20px;
	line-height: 20px;
	padding-left: 20px;
	padding-right: 5px;
	border: 1px solid #39B54A;
	border-radius: 10px;
	text-shadow: 0 1px #20942B;
}

.action_record , .action_record:HOVER{
	background: url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x scroll center top;
	color: #FFFFFF;
	display: block;
	float: right;
	font-weight: bold;
	height: 20px;
	line-height: 20px;
	padding-left: 10px;
	padding-right: 5px;
	border: 1px solid #39B54A;
	border-radius: 10px;
	text-shadow: 0 1px #20942B;
}

#add_record_popup{
	display: none;
	background: #fff;
	width: 800px;
	height: auto;
	padding: 20px;
	background: none repeat scroll 0 0 #fff;
	border-radius: 5px;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
	font-size: 14px;
}

#request_popup{
	display: none;
	background: #fff;
	width: 800px;
	height: auto;
	padding: 20px;
	background: none repeat scroll 0 0 #fff;
	border-radius: 5px;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
	font-size: 14px;
}
#approve_popup{
	display: none;
	background: #fff;
	width: 800px;
	height: auto;
	padding: 20px;
	background: none repeat scroll 0 0 #fff;
	border-radius: 5px;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
	font-size: 14px;
}

#info_popup{
	display: none;
	background: #fff;
	width: 800px;
	height: auto;
	padding: 20px;
	background: none repeat scroll 0 0 #fff;
	border-radius: 5px;
	box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
	font-size: 14px;
}
.left_column{
	text-align: right;
	width: 20%;
}

.right_column{
	text-align: left;
	width: 80%;
	margin-left: 5%;
}

.margin_left_5percent{
	margin-left: 5%;
}

.width20percent{
	width: 20%;
}

.merchant_filter{
	border: 1px solid #CCCCCC;
	padding: 6px;
	margin: 0px;
	-webkit-border-radius: 3px;
	-moz-border-radius: 3px;
	border-radius: 3px;
	width: 140px;
	box-shadow: 0 0 0 #000000, 0 3px 3px #EEEEEE inset;
}

::-webkit-input-placeholder { font-style: italic; }
::-moz-placeholder { font-style: italic; }
::-ms-input-placeholder { font-style: italic; }
</style>
