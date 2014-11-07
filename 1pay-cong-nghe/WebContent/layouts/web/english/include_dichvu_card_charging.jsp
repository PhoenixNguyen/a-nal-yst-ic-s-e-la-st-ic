<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ page import="vn.onepay.common.SharedConstants, vn.onepay.account.model.Account, java.lang.String"%>
<%
	Account account = (Account) request.getSession().getAttribute(SharedConstants.ACCOUNT_LOGINED);
%>
<div id="w_body">
	<div class="row_sub">
		<%request.setAttribute("cardCharging", true);%>
		<jsp:include page="include_dichvu_menu.jsp"></jsp:include>
		
		<div class="right_content">
			<div class="srv_details_box">
				<div class="srv_img_thumb">
					<img src="images/card_charging-logo.jpg" border="0" /> 
						<c:set var="card_charging_code" value="<%=SharedConstants.CARD_CHARGING_SERVICE_CODE %>" scope="page"/>
						<c:choose>
							<c:when test="${account_activated_chargings!=null && account_activated_chargings[card_charging_code]}">
								<a href="<%=request.getContextPath() %>/console/index.wss" class="btn_dangkysrv">Product managment</a>
							</c:when>
							<c:otherwise>
								<a href="<%=request.getContextPath() %>/protected/card_contract.html" class="btn_dangkysrv">Activate</a>
							</c:otherwise>
						</c:choose>
				</div>
				<div class="srv_details">
					<h1 class="srv_title">Card Charging</h1>

					<div class="srv_detail_des">Provide telco's prepaid phone-card payment for your product services and applications,... on mobile internet.</div>
					<div class="srv_mainfeature">
						<a href="<%= request.getContextPath() %>/card/chinh-sach.html" class="srv_feature_link"><img
							src="images/document_icon.png" border="0" hspace="5"
							align="absmiddle" />Policy</a> · 
							<c:choose>
								<c:when test="${account_activated_chargings!=null && account_activated_chargings[card_charging_code]}">
									<a href="<%=request.getContextPath() %>/protected/card_contract.html" class="srv_feature_link">
								</c:when>
								<c:otherwise>
									<a href="<%=request.getContextPath() %>/hop-dong-mau.html" class="srv_feature_link" target="_blank">
								</c:otherwise>
							</c:choose>
							<img src="<%=request.getContextPath() %>/images/doc_hopdong.png"
							border="0" hspace="5" align="absmiddle" />Electric cotract</a> · <a
							href="http://dev.1pay.vn" class="srv_feature_link"><img
							src="<%=request.getContextPath() %>/images/apis_icon.png" border="0" hspace="5"
							align="absmiddle" />Document (APIs)</a>
					</div>
					<div class="srv_sdk_holder">
						<div class="sdk_col">
							<div class="sdk_row"><strong>IOS</strong></div>
							<div class="sdk_row">
								<a href="#"><strong>Download SDK</strong></a>
							</div>
							<div class="sdk_row">
								<a href="#">Tutorial</a> &nbsp;&nbsp;&nbsp; <a href="#">Documentation</a>
							</div>

						</div>
						<div class="sdk_col_end">
							<div class="sdk_row"><strong>Android</strong></div>
							<div class="sdk_row">
								<a href="#"><strong>Download SDK</strong></a>
							</div>
							<div class="sdk_row">
								<a href="#">Tutorial</a> &nbsp;&nbsp;&nbsp; <a href="#">Documentation</a>
							</div>
						</div>
					</div>
				</div>
				<div class="clear"></div>

			</div>

			<div class="srv_row">
				<div class="srv_content_col">
					<div class="key_title">Online payment activation</div>
					<div class="srv_des">Merchants can create charging directly and online on 1Pay website</div>
				</div>
				<div class="srv_content_col">
					<div class="key_title">Online checking</div>
					<div class="srv_des">Fast, accurate, secure, bypass all redundant administrative procedures.</div>
				</div>
				<div class="srv_content_col_end">
					<div class="key_title">Online cash out</div>
					<div class="srv_des">Merchants can request cash out on 1Pay website and receive immediate confirmation .</div>
				</div>
			</div>
		</div>
	</div>
</div>