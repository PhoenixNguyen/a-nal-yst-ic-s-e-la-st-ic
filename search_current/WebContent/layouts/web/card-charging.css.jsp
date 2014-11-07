<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
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
        width: 115px;
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
    .add_record_popup , .add_record_popup:HOVER{
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
    
    #add_record_popup{
    
        display: none;
        background: #fff;
        width: 300px;
        height: auto;
        padding: 20px;
        background: none repeat scroll 0 0 #fff;
        border-radius: 5px;
        box-shadow: 0 0 4px rgba(0, 0, 0, 0.698);
        font-size: 14px;
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
    
    #add_record_popup .item{
	  padding: 5px;
	  width: 90%;
	}
	#add_record_popup .item label{
	  display: block;
	  padding: 5px;
	  width: 90%;
	}
	#add_record_popup .item input{
	  padding: 5px;
	  width: 90%;
	}
	
	#add_record_popup .item textarea{
	  padding: 5px;
	  width: 90%;
	}
	
	#add_record_popup .item select{
	  padding: 5px;
	  width: 50%;
	}
	
	#add_record_popup .decision input{
	  padding: 5px;
	  width: 30%;
	  
	}
</style>