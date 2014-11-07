<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<jsp:include page="head.jsp"></jsp:include>
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">

//Xoa Kich ban tren luoi kich ban
var deleteKichBan = function(id)
{
	var answer = confirm("Do yoy want delete?");
	if(answer){
		window.location= ("<%=request.getContextPath()%>/protected/delete-sms-scenario.html?id="+id); 
	}
};

//Sua Kich ban tren luoi kich ban->Redirect /protected/sua-kich-ban.html?id=5260163cb393628c065c46b1
var editKichBan = function(id)
{
	window.location= ("<%=request.getContextPath()%>/protected/edit-sms-scenario.html?id="+id); 
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
						<%request.setAttribute("merchantSupport", true);%>
						<jsp:include page="include_personal_menu.jsp" />
						<div class="right_content">
							<h1 class="srv_title">SMS - Services list</h1>
							<div class="dash_row">
			                	<div id="dash_tab">
			                    	<a href="#" class="tab_slc"><span>All</span></a>
			                        <a href="#" class="tab"><span></span></a>
			                        <a href="#" class="tab"><span></span></a>
			                        <a href="<%=request.getContextPath()%>/protected/create-sms-scenario.html" class="addproduct_link"><span>Add services</span></a>
			                        <div class="clear"></div>
			                    </div>
			                </div>
			               	 <div id="filter_locketqua">
			               	 	<form id="list-sms-scenario" action="list-sms-scenario.html" method="post">
										<h3 class="filter_label close box_locketqua_hide"><a href="#">Filter</a></h3>
										<!-- .widget-header -->
										<div class="box_locketqua">
											<div class="filter_row">
											<div class="other_filter">
												<label class="lbl_dash_filter">Status:</label> 
												<select name="status"
													class="dashboard_filter">
													<option value="-1" ${(param.status == null || param.status == '')?'selected="selected"':''}>All</option>
													<option value="1" ${param.status == '1'?'selected="selected"':''}>On</option>
													<option value="0" ${param.status == '0'?'selected="selected"':''}>Off</option>
												</select>
											</div>
											<div class="filter_row">
							                 	<span class="add-on">Title:</span>
							               		<input type="text" name="title" value="${param.title}" class="txt_filter" />
							                </div>
							                <div class="filter_row">
							                 	<span class="add-on">Default MT:</span>
							               		<input type="text" name="respMsg" value="${param.respMsg}" class="txt_filter" />
							                </div>
							                <c:if test="${model.isStaff }">
							                <div class="filter_row">
							                 	<span class="add-on">Merchant:</span>
							               		<select name="merchant"
													class="dashboard_filter">
													<option value="" ${(param.merchant == null || param.merchant == '')?'selected="selected"':''}>All</option>
													<c:forEach items="${model.merchants }" var="mc">
														<option value="${mc}" ${fn:containsIgnoreCase(param.merchant,mc)?'selected="selected"':''}><c:out value="${mc}"/></option>
													</c:forEach>
												</select>
							                </div>
							                </c:if>
											<div class="filter_row">
												<input class="btn_greensmall" type="submit" name="submit" value="Filter" />
											</div>
											<!-- .actions -->
										</div>
										<!-- .widget-content -->
									</div>
								</form>
							</div>
							<div class="srv_row">
								<script>var rownum = 1;</script>
								<display:table name="model.list" id="list" 
												requestURI="list-sms-scenario.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
												sort="list">
									<%@ include file="display_table.jsp" %>
									<display:column title="Stt" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
										<span id="row${list.id}" class="rowid">
											<c:out value="${model.offset + list_rowNum }" />
										</span>
								    </display:column>
								    <c:if test="${model.isStaff }">
								    <display:column title="Merchant" headerClass="transhead" class="transdata" property="merchant" style="border: 1px solid #CCC;" />
								    </c:if>
								    <display:column title="Title" headerClass="transhead" class="transdata" property="title" style="border: 1px solid #CCC;" />
								    <display:column title="Default MT" headerClass="transhead" class="transdata" property="defaultResp" style="border: 1px solid #CCC;" />
								    <display:column title="Creation date" headerClass="transhead" class="transdata" property="createdTime" format="{0,date,yyyy-MM-dd HH:mm:ss}" style="border: 1px solid #CCC;" />
								    <display:column title="URL" headerClass="transhead" class="transdata" style="border: 1px solid #CCC;" >
								    	<a href="http://api.1pay.vn/sms-scenario/${list.id}" target="blank" title="Click here"><img src="<%=request.getContextPath()%>/images/wap_active2.png"/></a>
								    </display:column>
								    <display:column title="Actions" headerClass="transhead width105" class="svr_data1" style="border: 1px solid #CCC;">
										    	<a href="edit-sms-scenario.html?id=${list.id }"
														class="act_edit" title="Edit"></a>
												<a href="#" class="link_cancel" title="delete" id="hd_delete_id-${list.id}" onclick="deleteKichBan('${list.id}');"></a>		
									</display:column>					
								</display:table>
							</div>
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
