<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="display" uri="http://displaytag.sf.net/el"%>

<%@ page import="java.util.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<c:if test="${param.status == 0 }">
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }" request="0" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã khởi tạo" />
		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="1" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/invalid.png" alt="" title="Đề nghị" />
   		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="2" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/invalid.png" alt="" title="Duyệt" />
   		</a>
   	</c:if>
   	<c:if test="${param.status == 1 }">
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="0" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã khởi tạo" />
		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="1" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/com_reject.png" alt="" title="Đề nghị bị từ chối" />
   		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="2" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/invalid.png" alt="" title="Duyệt" />
   		</a>
   	</c:if>
   	<c:if test="${param.status == 2 }">
  		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="0" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã khởi tạo" />
		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="1" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã đề nghị" />
   		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="2" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/invalid.png" alt="" title="Duyệt" />
   		</a>
  	</c:if>
   	<c:if test="${param.status == 3 }">
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="0" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã khởi tạo" />
		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="1" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã đề nghị" />
   		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="2" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/com_reject.png" alt="" title="Duyệt bị từ chối" />
   		</a>
   	</c:if>
   	<c:if test="${param.status == 4 }">
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="0" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã khởi tạo" />
		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="1" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã đề nghị" />
   		</a>
   		<a href="#status_popup" rel="leanmodal" class="status_popup"
   			app_code="${param.app_code }" charging_type="${param.charging_type }" version="${param.version }" 
    		expired_date="${param.expired_date }" title1="${param.title }" 
    		description="${param.description }" bizz_channel="${param.bizz_channel }"
    		id="${param.id }" status="${param.status }"  request="2" reason="${param.reason }"
   		>
   			<img src="<%=request.getContextPath() %>/images/tick.png" alt="" title="Đã duyệt" />
   		</a>
   	</c:if>
</body>
</html>