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
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath() %>/js/jquery.multiselect.js"></script>

<script src="<%=request.getContextPath()%>/js/numeral.js" type="text/javascript"></script>
<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/css/jquery.datetimepicker.css"/>
<script src="<%=request.getContextPath() %>/js/jquery.datetimepicker.js"></script>

<jsp:include page="card-charging.css.jsp" />

<style>
    .fieldset_filter {border: solid 1px #ccc;margin-left:20px; margin-bottom:20px; width: auto;}
</style>

<script type="text/javascript">
/* var th = new Date();
alert(th.toString('dd/MM/yyyy')); */

</script>

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
                            <h1 class="srv_title">Cấu hình thẻ lỗi</h1>
                            <!-- Filter -->
                            <div id="filter_locketqua">
                                <h3 class="filter_label open">
                                    <a href="#">Lọc kết quả</a>
                                </h3>
                            </div>
                            <form action="card-error-config.html" method="get" name="filter_result">
                            <div class="box_locketqua">
                              <div class="filter_row">
                                  <label class="label_filter">Từ ngày:</label>
                                  <input id="from_date" maxlength="100" name="from_date" value="${param.from_date}" class="select_filter" placeholder="Chọn ngày"/>
                                  <label class="label_filter">Đến ngày:</label>
                                  <input id="to_date" maxlength="100" name="to_date" value="${param.to_date}" class="select_filter" placeholder="Chọn ngày"/>
                                  <script type="text/javascript">
                                  
                                      $(function(){
                                          var from_date = $('input[name=from_date]');
                                          if(from_date.val() == '')
                                          {
                                              var date = new Date();
                                              from_date.val(date.toString('dd/MM/yyyy'));
                                          }
                                          
                                          var to_date = $('input[name=to_date]');
                                          if(to_date.val() == '')
                                          {
                                              var date = new Date();
                                              to_date.val(date.toString('dd/MM/yyyy'));
                                              
                                          }
                                      
                                      });
                                      $('#from_date').datetimepicker({
                                           lang:'vi',
                                           timepicker:false,
                                           format:'d/m/Y'
                                           /* ,
                                           onClose : function(t){
                                               $('form[name=filter_histogram]').submit();
                                           } */
                                          });
                                      $('#to_date').datetimepicker({
                                           lang:'vi',
                                           timepicker:false,
                                           format:'d/m/Y'
                                           
                                           /* ,
                                           onClose : function(t){
                                               $('form[name=filter_histogram]').submit();
                                           } */
                                          });
                                      
                                          
                                  </script>
                              </div>
                              <div class="filter_row">
                                  <fieldset class="fieldset_filter" style="margin-left: 20px;">
                                      <legend>
                                          <input type="checkbox" name="telcoAll" value="telcoAll" id="telcoAll" class="chck_filter" ${fn:contains(param.telcoAll,'telcoAll')?'checked="checked"':'' }  /> Loại thẻ
                                          <script type="text/javascript">
                                              $(document).ready(function(){
                                                  $('#telcoAll').click(function() {
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
                                          <c:set var="allTc" value="," />
                                          <c:forEach var="tc" items="${paramValues.telcos}">
                                              <c:set var="allTc" value="${allTc}${tc}," />
                                          </c:forEach>
                                          <c:forEach var="tc" items="${model.telcos}">
                                              <div style="display: inline-block;">
                                                  <c:set var="_tc" value=",${tc}," />
                                                  <input type="checkbox" class="chck_filter" name="telcos" title="${tc}" value="${tc}" 
                                                      ${fn:contains(allTc,_tc)?'checked="checked"':'' } />
                                                  <label class="lbl_chcksub">${tc}</label>
                                              </div>
                                          </c:forEach>
                                      </div>
                                  </fieldset>
                                  <c:if test="${param.telcos == null}">
                                    <script type="text/javascript">
                                        $('#telcoAll').closest('.filter_row').find('input[type=checkbox]').attr('checked', 'checked');
                                    </script>
                                  </c:if>
                              </div>
                                
                                <div class="filter_row" style="text-align: center;">
                                    <input  style="margin-top: 0px;"  class="btn_greensmall" type="submit" value="Lọc" />
                                </div>
                            </div>
                            
                            </form>
                            <!-- End Filter -->
                            
                            <a href="#add_record_popup" rel="leanmodal" class="add_record_popup" style="margin-right: 5px; margin-top: 5px;"><span>Thêm mới</span></a>
                            
                            <c:if test="${model.total > 0}">
                                 <span class="pagebanner"> ${model.total} kết quả tìm thấy, hiển thị từ ${model.offset + 1  } tới ${(model.offset + model.pagesize) > model.total ? model.total : (model.offset + model.pagesize) }. 
                                 </span>
                             </c:if>
                             <br/>
                             
                            <display:table name="model.list" id="list"
                                requestURI="card-error-config.html" partialList="true" size="model.total" pagesize="${model.pagesize}"
                                style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;" 
                                sort="list"
                                >
                                <fmt:formatDate value="${list.from_time}" var="from_time" pattern="dd/MM/yyyy HH:mm"/>
                                <fmt:formatDate value="${list.end_time}" var="end_time" pattern="dd/MM/yyyy HH:mm"/>
                                
                                <%@ include file="display_table.jsp" %>
                                <display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
                                    <span id="row${list.id}" class="rowid">
                                        <c:out value="${model.offset + list_rowNum }" />
                                    </span>
                                </display:column>
                                <display:column title="Tiêu đề" headerClass="transhead" class="transdata" property="title" style="border: 1px solid #CCC;" />
                                <display:column title="Telco" headerClass="transhead" class="transdata" property="telco" style="border: 1px solid #CCC;" />
                                
                                <display:column title="Thời gian: từ" headerClass="transhead" class="transdata" property="from_time" style="border: 1px solid #CCC; text-align:center;" format="{0,date,dd/MM/yyyy HH:mm:ss}" />
                                <display:column title="Thời gian: đến" headerClass="transhead" class="transdata" property="end_time" style="border: 1px solid #CCC; text-align:center;" format="{0,date,dd/MM/yyyy HH:mm:ss}" />
                                
                                <display:column title="Ngày tạo" headerClass="transhead" class="transdata" property="created_time" style="border: 1px solid #CCC; text-align:center;" format="{0,date,dd/MM/yyyy HH:mm:ss}" />
                                
                                <display:column title="Hành động" headerClass="transhead width70" class="transdata" style="border: 1px solid #CCC; text-align:center;" >
                                    <a href="#add_record_popup" class="edit_record_popup" rel="leanmodal"
                                        id="${list.id }"
                                        tit="${list.title }"
                                        telco="${list.telco }"
                                        from_time="${from_time }"
                                        end_time="${end_time }"
                                        note="${list.note }"
                                        >
                                        <img src="<%=request.getContextPath() %>/images/editComparison.png" alt="" title="Sửa cấu hình"/>
                                    </a>
                                    <a class="delete_record"
                                        id="${list.id }"
                                        >
                                        <img src="<%=request.getContextPath() %>/images/cross.png" alt="" title="Xóa cấu hình"/>
                                    </a>
                                
                                </display:column>
                            </display:table>
                            
                            <script type="text/javascript">
                            
                              $(document).ready(function(){
                            	// Delete
                            	$('.delete_record').live('click', function(){
                            		if(!confirm('Bạn có chắc muốn xóa cấu hình này?'))
                            			return false;
                            		
                            		var id = $(this).attr('id');
                            		
                            		var action = 'DELETE';
                            		$.ajax({
                                        type : "post",
                                        url : 'card-error-config-ajax.html',
                                        data : 'action='+action + '&id=' + id,
                                        success : function(data){
                                            alert(data);
                                            if(data.indexOf('thành công') != -1)
                                                location.reload();
                                        }
                                    
                                    });
                                    return false;
                            	});
                            	
                            	// Add new
                            	$('.add_record_popup').live('click', function(){
                            		// Set labels
                            		$('form[name=add_edit] input[name=submit_record]').val('Tạo mới');
                            		
                            		$('#add_record_popup form[name=add_edit]').trigger('reset');
                                }); 
                            	
                            	// Edit
                            	$('.edit_record_popup').live('click', function(){
                            		// Set labels
                                    $('form[name=add_edit] input[name=submit_record]').val('Cập nhật');
                            		
                            		$('form[name=add_edit] input[name=action]').val('ADD_EDIT');
                            		
                            		$('#add_record_popup form[name=add_edit]').trigger('reset');
                            		
                            		$('form[name=add_edit] input[name=id]').val($(this).attr('id'));
                            		$('form[name=add_edit] input[name=title]').val($(this).attr('tit'));
                            		$('form[name=add_edit] select[name=telco]').val($(this).attr('telco'));
                            		$('form[name=add_edit] input[name=from_time]').val($(this).attr('from_time'));
                            		$('form[name=add_edit] input[name=end_time]').val($(this).attr('end_time'));  
                            		$('form[name=add_edit] textarea[name=note]').val($(this).attr('note'));
                            		
                            	});
                            	
                           	    $('#add_record_popup form[name=add_edit]').submit(function(){
                           	    	
                           	    	if(!confirm('Bạn có chắc chắn?'))
                           	    		return false;
                           	    	
                           	    	var title = $('form[name=add_edit] input[name=title]').val();
                           	    	var telco = $('form[name=add_edit] select[name=telco]').val();
                           	    	var from_time = $('form[name=add_edit] input[name=from_time]').val();
                           	    	var end_time = $('form[name=add_edit] input[name=end_time]').val();  
                           	    	var note = $('form[name=add_edit] textarea[name=note]').val();
                                    
                           	    	var fromDate = Date.parseExact(from_time, "dd/MM/yyyy HH:mm");
                           	    	var endDate = Date.parseExact(end_time, "dd/MM/yyyy HH:mm");
                           	    	
                           	    	if(title == ''){
                           	    		alert('Tiêu đề không được trống');
                           	    		return false;
                           	    	}
                           	    	if(telco == ''){
                                        alert('Telco không được trống');
                                        return false;
                                    }
                           	    	if(from_time == ''){
                                        alert('Thời gian bắt đầu không được trống');
                                        return false;
                                    }
                           	    	
                           	    	if(fromDate == null){
                           	    		alert('Thời gian bắt đầu sai định dạng!');
                                        return false;
                           	    	}
                           	    	if(end_time == ''){
                                        alert('Thời gian cuối không được trống');
                                        return false;
                                    }
                           	    	if(endDate == null){
                                        alert('Thời gian kết thúc sai định dạng!');
                                        return false;
                                    }
                           	    	
                           	    	if(endDate.getTime() < fromDate.getTime()){
                           	    		alert('Thời gian kết thúc phải sau thời gian bắt đầu!');
                                        return false;
                           	    	}
                           	    	if(note == ''){
                                        alert('Nội dung không được trống');
                                        return false;
                                    }
                           	    	
                           	    	$.ajax({
                                        type : "post",
                                        url : $(this).attr('action'),
                                        data : $(this).serializeArray(),
                                        success : function(data){
                                            alert(data);
                                            if(data.indexOf('thành công') != -1)
                                                location.reload();
                                        }
                           	    	
                                    });
                           	    	return false;
                           	    	
                           	    });
                              });
                            </script>
                            <!-- add & edit popup -->
                            <div id="add_record_popup">
                                <form action="card-error-config-ajax.html" method="post" name="add_edit">
                                    <input type="hidden" name="action" value="ADD_EDIT"/>
                                    <input type="hidden" name="id" value=""/>
                                    
	                                <h2 class=""><span class="update_status">Cấu hình thẻ lỗi</span></h2>
	                                <div class="item">
					                    <label>Tiêu đề: </label>
					                    <input type="text" name="title" placeholder="Nhập tiêu đề"/>
					                </div>
					                <div class="item">
					                    <label>Telco: </label>
					                    <select name="telco">
					                       <c:forEach items="${model.telcos }" var="item">
					                           <option value="${item }">${item }</option>
					                       </c:forEach>
					                    </select>
					                </div>
					                <div class="item">
					                    <label>Thời gian bắt đầu: </label>
					                    <input type="text" id="from_time" name="from_time" placeholder="Thời gian từ"/>
					                </div>
					                <div class="item">
					                    <label>Thời gian kết thúc: </label>
					                    <input type="text" id="end_time" name="end_time" placeholder="Thời gian đến"/>
					                </div>
					                
					                <div class="item">
                                        <label>Nội dung: </label>
                                        <textarea rows="5" cols="" name="note" placeholder="Nhập nội dung"></textarea>
                                    </div>
                                    
					                <div class="decision" >
			                          <input name="submit_record" class="btn_greensmall" type="submit" value="Tạo mới" />
			                          <input name="cancel_record" class="btn_graysmall modal_close" type="reset" value="Bỏ qua" name="reset" />
		                            </div>
	                            </form>
                            </div>
                            <script type="text/javascript">
							  $(function(){
							        $( "#end_time" ).datetimepicker({
							                format: 'd/m/Y H:i',
							                lang: 'vi',
							                minDate:0,
							                style: 'z-index:99999',
							        });
							        
							        $( "#from_time" ).datetimepicker({
	                                        format: 'd/m/Y H:i',
	                                        lang: 'vi',
	                                        minDate:0,
	                                        style: 'z-index:99999',
	                                });
							    });
							</script>
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
