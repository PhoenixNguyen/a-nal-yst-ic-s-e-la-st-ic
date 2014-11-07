<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style type="text/css">
.add_record, .add_record:HOVER {
	background: url("<%=request.getContextPath()%>/images/add.png")
		no-repeat scroll left center,
		url("<%=request.getContextPath()%>/images/btngreen_bg.png") repeat-x
		scroll center top;
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

.error_detail {
	width: 400px;
	height: 250px;
}
</style>

<script type="text/javascript">
//Error detail
var tab = '<c:out value="${param.tab}"/>';
if(tab == 'error_detail'){
    
   var errorDetails = [];
   <c:forEach var="item" items="${model.outputErrorDetail }">
      errorDetails.push({key : '<c:out value="${item.key}"/>', value : '<c:out value="${item.value}"/>'});
   </c:forEach>
   
   
   size_chart_w = 300;
   size_chart_h = 250;
   drawPie(errorDetails, size_chart_w, size_chart_h, '#error_detail_chart');
   function drawPie(data, width, height, id) {
       nv.addGraph(function() {

           var chart = nv.models.pieChart().x(function(d) {
               return d.key;
           }).y(function(d) {
               return d.value;
           }).color(d3.scale.category20().range()) //d3.scale.category10().range()
           .width(width).height(height).labelType("percent");

           d3.select("#error_detail_chart").datum(data).transition().duration(1200)
           .attr('width', width).attr('height', height)
           .call(chart);

           chart.dispatch.on('stateChange', function(e) {
               nv.log('New State:', JSON.stringify(e));
           });

           return chart;
       });
   }
}

</script>
</head>
<body>
	<a href="card-error-config.html" class="add_record"
		style="margin-right: 5px;"><span>Cấu hình</span></a>
	<h1 class="srv_title">Thống kê chi tiết lỗi</h1>
	<div id="status_type">
		<fieldset class="fieldset_filter">
			<legend style="text-align: left;">
				<b>Chi tiết lỗi</b>
			</legend>
			<span class="pie"> <svg id="error_detail_chart"
					class="pie_child error_detail"> </svg>
			</span>
		</fieldset>
	</div>

	<c:if test="${model.totalError > 0}">
		<span class="pagebanner"> ${model.totalError} kết quả tìm thấy,
			hiển thị từ ${model.offsetError + 1  } tới ${(model.offsetError + model.pagesizeError) > model.totalError ? model.totalError : (model.offsetError + model.pagesizeError) }.
		</span>
	</c:if>    
	<br />

	<display:table name="model.listError" id="list"
		requestURI="card-analytics.html" partialList="true"
		size="model.totalError" pagesize="${model.pagesizeError}"
		style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;table-layout:fixed;"
		sort="list">
		<fmt:formatDate value="${list.from_time}" var="from_time"
			pattern="dd/MM/yyyy HH:mm" />
		<fmt:formatDate value="${list.end_time}" var="end_time"
			pattern="dd/MM/yyyy HH:mm" />

		<%@ include file="display_table.jsp"%>
		<display:column title="Stt" headerClass="transhead fit_to_content"
			class="transdata" style="text-align:right;border: 1px solid #CCC;">
			<span id="row${list.id}" class="rowid"> <c:out
					value="${model.offsetError + list_rowNum }" />
			</span>
		</display:column>
		<display:column title="Tiêu đề" headerClass="transhead"
			class="transdata" property="title" style="border: 1px solid #CCC;" />
		<display:column title="Telco" headerClass="transhead"
			class="transdata" property="telco" style="border: 1px solid #CCC;" />

		<display:column title="Thời gian: từ" headerClass="transhead"
			class="transdata" property="from_time"
			style="border: 1px solid #CCC; text-align:center;"
			format="{0,date,dd/MM/yyyy HH:mm:ss}" />
		<display:column title="Thời gian: đến" headerClass="transhead"
			class="transdata" property="end_time"
			style="border: 1px solid #CCC; text-align:center;"
			format="{0,date,dd/MM/yyyy HH:mm:ss}" />

		<display:column title="Ngày tạo" headerClass="transhead"
			class="transdata" property="created_time"
			style="border: 1px solid #CCC; text-align:center;"
			format="{0,date,dd/MM/yyyy HH:mm:ss}" />

	</display:table>
</body>
</html>