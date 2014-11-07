<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>

<body>
	<div id="wrapper">
		<!-- Web Top -->
		<div id="w_top">
			<div class="layout_1000">
				<!-- Header -->
					<jsp:include page="header.jsp" flush="true" />
				<!-- / Header -->

				<!-- Body -->
				<div id="w_body">
            	<div class="row_sub">
                	<div class="left_cat">
                  	<ul class="sub_cat">
                    
                    	<li><a href="#" class="qtr_svr">Quản trị dịch vụ</a>
                        	<ul>
                             <li><a href="#">Tổng quát</a></li>
                             <li><a href="manage_svr.html">Sản phẩm </a></li>
                   <li><a href="#">API Access</a></li>     
                        
                        
                        <li><a href="#">Báo cáo </a></li>
                        <li><a href="#">Hạn mức </a></li>
                        <li><a href="manage_svr_doisoatthanhtoan.html" >Đối soát & thanh toán </a></li>
                        <li><a href="manage_svr_hopdongdientu.html"class="slc_link">Hợp đồng điện tử</a></li>
                       
                    </ul>
                        </li>
                        
                    </ul>
                    
                    
                    
                   
                        	
                    
                    
                    
                    <ul class="sub_cat">
                        <li><a href="http://help.1pay.vn" class="help_normal">Help center</a>
                        <ul>
                        	<li><a href="http://help.1pay.vn">Liên hệ nhanh</a></li>
                        <li><a href="#">Trung tâm hỗ trợ</a></li>
                       
                        </ul>
                        </li>
                        
                        
                    </ul>
                    <div>
                        <a href="#" class="banner_sdk"></a>
                        <a href="#" class="banner_api"></a>
                    </div>
                    
              </div>
              
              <div class="right_content">
               <h1 class="srv_title">Hợp đồng điện tử</h1>
              
               
               
                <div id="filter_locketqua">
        
        <h3 class="filter_label open"><a href="#">Lọc kết quả</a></h3>
        
      </div>
                
               <div class="box_locketqua">
        	
            	<div class="filter_row">
                	 
                 <div class="input-prepend"> <span class="add-on">Chọn ngày:</span>
                <input type="text" name="reservation" id="reservation" class="txt_calendar" value="05/22/2013 - 05/23/2013">
              </div>
      <script type="text/javascript">
$(document).ready(function() {
	$('#reservation').daterangepicker({ startDate: Date.today().moveToFirstDayOfMonth().add(6).days(), endDate: Date.today().moveToFirstDayOfMonth().add(13).days()});
});
</script>
                </div>
      
        
                 
                <div class="filter_row">
                	<div class="product_slc_filter">
                  	<label class="product_lbl_filter">Merchants:</label>
                  
                  <select class="product_filter_admin">                  	<option>Tất cả</option>
                  <option>Bật</option>
                  <option>Tắt</option>
                  </select>
                  	
                  </div>
               	  
                  
                  
                 
                </div> 
                
                
                
                
                <div class="filter_row">
               		<div class="field">
                    		
            								
			<div>
														<input type="checkbox" title="nganluong" value="nganluong" name="provider" class="chck_filter" id="chck_thecao">
                                                        <label for="chck_thecao" class="lbl_chcksub">	Thẻ cào</label>
                                                        
                                                        <input type="checkbox" title="nganluong" value="nganluong" name="provider" class="chck_filter" id="chck_sms">
                                                        <label for="chck_sms" class="lbl_chcksub">	Sms</label>
                                                        
															<input type="checkbox" title="fpt" value="fpt" name="provider" class="chck_filter" id="chck_wap"> <label for="chck_wap" class="lbl_chcksub">Wap</label>
                                                            <input type="checkbox" title="viettel_telecom" value="viettel_telecom" name="provider" class="chck_filter" id="chck_sub">
															<label for="chck_sub" class="lbl_chcksub">Sub</label>
                                                            <input type="checkbox" title="abc" value="abc" name="provider" class="chck_filter"  id="chck_direct">
<label for="chck_direct" class="lbl_chcksub">															Direct charging</label>
                                                            
                                                            </div>									</div>
                                                
                </div>
                
                
                
                <div class="filter_row">
                	<a href="#" class="btn_greensmall">Lọc kết quả</a>
                </div>
                
                </div>
                <div class="srv_row">
              
                
               
                
               	
               </div>
               <div class="srv_row">
              
                
               
                
               	<strong>Total amount:</strong> 45,530,000 đ | <strong>Total items:</strong> 1,598<a class="export_link" href="#"><span>Export files</span></a>
               </div>
               <div class="srv_row">
                <table width="100%" cellspacing="0" cellpadding="0" border="1" style="border-color: #CCC">
                       <tbody>
                         <tr>
                          <td class="transhead" width="30">STT</td>
                           <td class="transhead" width="120"> Merchant</td><td  class="transhead" width="100">Ngày ký</td><td  class="transhead" width="100">Ngày hết hạn</td>
                           <td  class="transhead" width="110">Charging</td>
                          
                           <td class="transhead" width="40">Actions</td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">1</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">2</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">3</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">4</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">5</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">6</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">7</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">8</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         <tr>
                       	   <td class="svr_data" align="center">9</td>
                           <td class="svr_data">CMN</td>
                           <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center">01/06/2013</td>
                            <td class="svr_data" align="center"><a class="card_normal" href="#" ></a><a class="sms_normal" href="#" ></a><a class="sub_normal" href="#" ></a></td>
                          
                          <td class="svr_data"><a href="#" class="link_taifile" title="Tải file"></a> <a href="#" class="link_duyet" title="Duyệt"></a> <a href="#" class="link_cancel" title="Hủy"></a> </td>
                         </tr>
                         
                         
                       </tbody>
                     </table>
               </div>
               <div class="srv_row">
                 	<a class="split_slc" href="#">1</a> <a class="split_no" href="#">2</a><a class="split_no" href="#">3</a><a class="split_no" href="#">4</a><a style="margin-left:5px;" class="link_green" href="#"><strong>Xem tiếp...</strong></a>
                 </div>
              </div>
              
              
                </div>
                
                
            </div>
				
				<!-- / Body -->
			</div>
		</div>
		<!-- / Web Top -->

		<!-- Web Foot -->
			<jsp:include page="footer.jsp" />
		<!-- / Web Foot -->
	</div>

	<jsp:include page="include_popup.jsp" />
	
</body>

</html>