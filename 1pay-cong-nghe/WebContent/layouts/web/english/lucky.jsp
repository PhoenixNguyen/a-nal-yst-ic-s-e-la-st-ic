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
<link href="<%=request.getContextPath()%>/css/personal.css" rel="stylesheet" type="text/css" />
</head>

<body>
<!-- 1PAY WEB -->
<div id=""wrapper>
	<!-- Web Top -->
	<div id="w_top">
    	<div class="layout_1000">
        	<!-- Header -->
            <jsp:include page="header.jsp"></jsp:include>
        	<!-- / Header -->
            <!-- Body -->
          	<div id="w_body">
          		
          		<div style="align:center">
          		<center>
            	<h1 >
            		Chương trình quay số trúng thưởng
            	</h1>
            	<h1>
            		Cặp đôi vô đối, dev ối giải thưởng!
            	</h1>
           		<c:if test="${model.isAdmin && model.done}">
  					<script type="text/javascript">
  						$(function(){
  							$('#lucky_merchant').html('<c:out value="${model.lucky_merchant }"/>');
  							$('#lucky_gift_code').html('<c:out value="${model.lucky_gift_code }"/>');
  							$('#luckyModal').reveal({
  									dismissmodalclass: 'modal_close'
  							});
      					});
  					</script>
  				</c:if>
            	<table  width="100%">
            		<tr>
            			<td width="50%" align="center">
            				<c:choose>
            				<c:when test="${model.isAdmin && (model.total <5)}">
            				
            				<form id="lucky" action="lucky-draw.html?r=<%=System.currentTimeMillis() %>" method="post" onsubmit="return confirm('Ban co chac muon quay thuong khong?');">
            					<div>
            						<input type="hidden" name="action" value="card"/>
            						<input type="image" src="<%=request.getContextPath()%>/images/button_card_draw.png" alt="Submit Form" style="width: 200px"/>
            					</div>
            				</form>
            				</c:when>
            				<c:otherwise>
            					<img alt="" src="<%=request.getContextPath()%>/images/button_card_draw.png" border="0" width="200px"/>
            				</c:otherwise>
            				</c:choose>
            				<h2>Còn lại <strong><c:out value="${ (5- model.total)}"/></strong> giải thưởng thẻ cào!</h2>
            			</td>
            			<td width="50%" align="center">
            				<c:choose>
            				<c:when test="${model.isAdmin && (model.lucky_galaxy==null)}">
            				<form id="lucky" action="lucky-draw.html?r=<%=System.currentTimeMillis() %>" method="post" onsubmit="return confirm('Ban co chac muon quay thuong khong?');">
            					<div>
            						<input type="hidden" name="action" value="galaxy"/>
            						<input type="image" src="<%=request.getContextPath()%>/images/button_galaxys3_draw.png" alt="Submit Form" style="width: 200px"/>
            					</div>
            				</form>
            				</c:when>
            				<c:otherwise>
            					<img alt="" src="<%=request.getContextPath()%>/images/button_galaxys3_draw.png" border="0" width="200px"/>
            				</c:otherwise>
            				</c:choose>
            			</td>
            		</tr>
            		<tr>
            			<td colspan="2">
            			<jsp:include page="include_lucky_draw_201308.jsp" ></jsp:include>
            			</td>
            		</tr>
            		<tr>
            			<td colspan="2">
            				<center>
							<h1 >
					          Thành viên trúng thưởng tại sự kiện Mobile Monday T7/2013, TP. Hà Nội
					        </h1>
						</center>
            			</td>
            		</tr>
            		<tr>
            			<td valign="top">
            				<c:choose>
            				<c:when test="${model.list!=null}">
            				<div class="srv_row">
								<script>var rownum = 1;</script>
								<display:table name="model.list" id="list" 
												requestURI="lucky.html" 
												pagesize="${model.pagesize}" partialList="true" size="model.total"
												style="width:100%;cellspacing:0;cellpadding:0;border: 1px solid #CCC;" 
												sort="list">
									<%@ include file="display_table.jsp" %>
									<display:column title="No" headerClass="transhead fit_to_content" class="transdata" style="text-align:center;border: 1px solid #CCC;">
										<span id="row${list.id}" class="rowid">
											<c:out value="${model.offset + list_rowNum }" />
										</span>
								    </display:column>
								    <display:column title="Người trúng" headerClass="transhead fit_to_content" class="transdata" style="text-align:left;border: 1px solid #CCC;">
								    	<strong><c:out value="${list.merchant.username }"/></strong><br/> 
								    	Email: <strong><c:out value="${list.merchant.email }"/></strong><br/>
								    	Mã trúng thưởng: <strong><c:out value="${list.luckyItem.giftCode }"/></strong> 
								    </display:column>
								    <display:column title="Phần thưởng" headerClass="transhead fit_to_content" class="transdata" style="text-align:right;border: 1px solid #CCC;">
								    	<c:out value="${list.luckyItem.title }"/>
								    </display:column>
								    
								</display:table>
							</div>
							</c:when>
							<c:otherwise>
							
							</c:otherwise>
							</c:choose>
            			</td>
            			<td align="center" valign="top">
            			<div class="srv_row">
            				<c:choose>
            					<c:when test="${model.lucky_galaxy !=null}">
            					<div class="yellow_round">
									<span style="color: #678B3B;font-size: 14px;"> Người chơi may mắn trúng Galaxy S3 là <strong><c:out value="${model.lucky_galaxy.merchant.username }"/></strong>, email: <strong><c:out value="${model.lucky_galaxy.merchant.email }"/></strong>
		, mã trúng thưởng: <strong><c:out value="${model.lucky_galaxy.giftCode.giftCode }"/></strong>
									</strong></span>            							
        						</div>
            					</c:when>
            					<c:otherwise>
            					</c:otherwise>
            				</c:choose>
            				<img border="0" src="<%=request.getContextPath()%>/images/samsung_galaxy_s3.jpg" alt="" />
            			</div>
            			</td>
            		</tr>
            	</table>
            	</center>
            	</div>
            	
            	<div id="luckyModal" class="reveal-modal">
					<div class="srv_row">
						Chúc mừng <strong><span style="font-size: 24px;" id="lucky_merchant"></span></strong> đã trúng với mã dự thưởng: <strong><span style="font-size: 24px;" id="lucky_gift_code"></span></strong>.<br/>
						<c:if test="${fn:containsIgnoreCase(model.lucky_type, 'card')==true}">
							<strong>Phần thưởng của bạn là 01 thẻ cào điện thoại trị giá 100.000 VNĐ.</strong>
							<img alt="" src="<%=request.getContextPath()%>/images/card_vtm_100k.png" border="0" width="500px"/>
						</c:if>
						<c:if test="${fn:containsIgnoreCase(model.lucky_type, 'galaxy')==true}">
							<strong>Phần thưởng của bạn là 01 chiếc điện thoại Galaxy S3</strong>
							<img alt="" src="<%=request.getContextPath()%>/images/samsung_galaxy_s3.jpg" border="0" width="500px"/>
						</c:if>
					</div>
					<div>
						<input type="button" name="cancel" value="Đóng" class="btn_greensmall modal_close" />
					</div>
				</div>
            	<jsp:include page="include_lucky_draw.jsp" ></jsp:include>
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