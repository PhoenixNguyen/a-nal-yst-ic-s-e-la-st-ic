<%@ page language="java" trimDirectiveWhitespaces="true"
	contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

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
					<div class="dky_row">
						<h1 class="srv_title">Service Requirement</h1>
						<div class="quydinh_dichvu">
							<strong>CLAUSE 1: TERMS</strong>
							<ul>
								<li><strong>Revenue (called DT):</strong>: is total amount of money which end user pay for services ( included VAT)</li>
								<li><strong>Revenue of Party A (called </strong><strong>DTA</strong><strong>):</strong>
									is total amount of money which end users pay for services after eliminate Telecommunication’s expenses.</li>
								<li><strong>Revenue of Party B (called </strong><strong>DTB</strong><strong>):</strong>
									: the amount of money which Party B will be received after the division of revenues and eliminating all expenses required (if any). (For example, the personal income tax for individual customers).</li>
								<li><strong>Sharing revenue rate of Party the B(</strong><strong>called</strong><strong> TLB) : </strong>is the percentage sharing revenue rate which Party B will receive.</li>
								<li><strong>Sharing revenue rate of Party the A(</strong><strong>called</strong><strong> TLA) : </strong>is the percentage sharing revenue rate which Party A will receive.</li>
								<li><strong>Payment:</strong> payment request according to request payment period.</li>
								<li><strong>Final period revenue:</strong> is the amount of money which party B will receive after confirming on the volume and unpaid revenues.</li>
								<li><strong>Payment limit:</strong> is the minimum revenue part B needed to achieve to make payment procedures. 1PAY prescribe minimum revenue limit is 500,000 (Five hundred thousands only). The unpaid revenue will be accumulated in the next payment cycle.</li>
								<li><strong>The cycle of confirming data:</strong></li>
							</ul>
							<p>
								+ Control unit for the period in months: From 00 hours 00 minutes 00 seconds to 23 hours of the first day 59 minutes 59 seconds last of the month. Clock control was taken from system clock of 1PAY.<br /> + Time to start controlling from the date of signing the contract.<br /> + Control ending period from the date of termination the contract..<br /> +Control cycle period : monthly.<br /> + Cycle to make document confirming revenue: monthly.
							</p>
							<ul>
								<li><strong>Original reported revenue:</strong> the data recorded on management system of 1PAY.</li>
								<li><strong>Successful transactions:</strong> is transactions recorded successfully on the system of  1PAY.</li>
								<li><strong>Original Data for confirmation:</strong> a successful transaction data on 1PAY system.</li>
								<li><strong>Value Added Tax (VAT):</strong> According to the current regulations of the State.</li>
								<li><strong>Personal Income Tax:</strong> According to the current regulations of the State.</li>
							</ul>
							<p>
								<strong>CLAUSE 2: REGULATIONS FOR REVENUE CONFIRMATION</strong><br /> <strong>Revenue confirming document:</strong> Party B can use original data on historical transactions to use in the revenue confirming document, those numbers can be reprinted from any revenue confirmation avaiable on 1Pay system. Number for confirm to advance  payment and payment taken by the following periods:<br />
								1. Regulations to confirming data<br /> a) 15 days period <br /> Data for confimation will be selected from 00h:00 of the first day to 23h:59:59 of the 15th of the month. <br /> b) Monthly period<br />
								Data for confimation will be selected from 00h:00 of the first day to 23h:59:59 of the last day of the month. <br /> <strong>2.
									Process of revenue data confirmation</strong><br /> The responsible person of both parties have to sign report to record production, revenue according to processes: Party B shall send the original data through e-mail recorded details of the transaction cycle control for Party A, Party A progress comparison of data Party B and the data recorded on the billing system of Party A:
							</p>
							<ul>
								<li>Where there is no difference in the control data, Party A confirm data. Then Party B sign and send the confirm report about production, revenue for Party A. Party A sign and send back the confirm report about production, revenue to make payment procedures</li>
								<li>In case the difference control data is less than figures for Deviation control that allowed, the original data is revenue sharing basis.</li>
								<li>In case of difference data for more than control deviation allowed, the two parties make proceess to control detailed data. If the two sides controlled detailed data without finding out the cause, then negotiate, agree and decide to finally figures based on good faith cooperation.</li>
							</ul>
							<p>
								<strong>CLAUSE 3: PROVISIONS OF PAYMENT PERIOD</strong><br />
								Revenue of party B is calculated immediately after the cooperative service between party A and 1Pay approved. Party B can choose the billing cycle on the flexible revenue as follows:<br /> <strong>a)
									Advance payment according to 15 day cycle</strong><br /> To make advance revenue payment according to 15 day billing cycle, the B's revenue must be gained at least 1 million / 1 billing period. On 16th  monthly, customers make control data procedures with 1PAY  on website 1pay.vn , after the two sides agreed to confirm the control data,1PAY will pay Party B after 02 working days from when party A received request payment report  from party B (including: control production report, revenue, VAT invoices and payment requests). This advance amount of money will be deducted by 1Pay on the final period of party B.<br /> <strong>b) Monthly payment cycle</strong><br /> On 1st day to 5th  every month , Party B makes control procedures for the data with 1Pay on the website 1pay.vn. The control data was calculated from 00 hours 00 minutes 00 seconds on 1st  day to 23 hours 59 minutes 59 seconds on last day of the month . To pay revenue according to the revenue 1 month cycle , revenue of party B need gain equal the minimum payment limit is 500,000 / 1 billing period . After the two paries agree and confirm the control data , the 1PAY will pay Party B after 02 working days after received the request payment report from party B ( Including : control report about production , revenue , VAT invoices and payment requests ) . Amount of money which party B paid equal total revenue in the month minus the advance payment ( if any) and other deductions ( if any).<br /> <strong>(Format of revenue confirmation documents in Appendix)</strong>
							</p>
						</div>

						<form method="post">
						<div class="srv_row">
							<input value="1" type="checkbox" id="chck_rule" name="confirm" /> <label
								for="chck_rule">Accept</label>
						</div>
						<c:if test="${model.err == '1'}">
							<div class="srv_row" style="color:#f00;">
								Reject
							</div>
						</c:if>

						<div class="btn_row">
							<input type="submit" value="Accept" name="submit" class="btn_greensmall"/>
							<input type="reset" value="Reject" name="reset" class="btn_graysmall" onclick="location.href='<%=request.getContextPath() %>/console/manager.wss'"/>
						</div>
						</form>
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
</body>

</html>