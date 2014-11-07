<%@ page language="java" trimDirectiveWhitespaces="true" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="include_taglib.jsp" %>

<!-- BEGIN JAVASCRIPTS(Load javascripts at bottom, this will reduce page load time) -->
<!-- BEGIN CORE PLUGINS -->
<!--[if lt IE 9]>
<script src="<%=request.getContextPath()%>/assets/plugins/respond.min.js"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/excanvas.min.js"></script> 
<![endif]-->
<!-- IMPORTANT! Load jquery-ui-1.10.3.custom.min.js before bootstrap.min.js to fix bootstrap tooltip conflict with jquery ui tooltip -->
<script src="<%=request.getContextPath()%>/assets/plugins/jquery-1.10.2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery-migrate-1.2.1.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery-ui/jquery-ui-1.10.3.custom.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap-hover-dropdown/bootstrap-hover-dropdown.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery-slimscroll/jquery.slimscroll.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery.blockui.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery.cokie.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/uniform/jquery.uniform.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/back-to-top.js" type="text/javascript"></script>
<!-- END CORE PLUGINS -->

<!-- BEGIN PAGE LEVEL PLUGINS -->
<script src="<%=request.getContextPath()%>/assets/plugins/jquery.pulsate.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap-daterangepicker/moment.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap-daterangepicker/daterangepicker.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/gritter/js/jquery.gritter.js" type="text/javascript"></script>
<!-- IMPORTANT! fullcalendar depends on jquery-ui-1.10.3.custom.min.js for drag & drop support -->

<script src="<%=request.getContextPath()%>/assets/plugins/bootstrap-select/bootstrap-select.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/select2/select2.min.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/jquery-multi-select/js/jquery.multi-select.js" type="text/javascript"></script>
<!-- END PAGE LEVEL PLUGINS -->
<!-- BEGIN PAGE LEVEL SCRIPTS -->
<script src="<%=request.getContextPath()%>/assets/scripts/core/app.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/scripts/custom/components-dropdowns.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/plugins/ckeditor/ckeditor.js" type="text/javascript"></script>
<script src="<%=request.getContextPath()%>/assets/scripts/custom/onepay.js" type="text/javascript"></script>

<!-- IMPORTANT! hack to fix ckeditor/bootstrap compatiability bug when ckeditor appears in a bootstrap modal dialog, Include this file AFTER both jQuery and bootstrap are loaded. -->
<script src="<%=request.getContextPath()%>/assets/plugins/ckeditor/bootstrap-ckeditor-fix.js" type="text/javascript"></script>

<script src="<%=request.getContextPath()%>/assets/scripts/custom/jquery.sharebox.min.js" type="text/javascript"></script>
<!-- END PAGE LEVEL SCRIPTS -->
<script>
jQuery(document).ready(function() {
	App.init(); // initlayout and core plugins
	/* 
	Index.init();
	Index.initJQVMAP(); // init index page's custom scripts
	Index.initCalendar(); // init index page's custom scripts
	Index.initCharts(); // init index page's custom scripts
	Index.initChat();
	Index.initMiniCharts();
	Index.initDashboardDaterange();
	Index.initIntro();
	Tasks.initDashboardWidget(); 
	*/
	ComponentsDropdowns.init();
	
	$('.nav-tabs a').click(function (e) {
	    // No e.preventDefault() here
	    $(this).tab('show');
	});
});
</script>
<!-- END JAVASCRIPTS -->

<!-- BEGIN QTIP -->
<script src="<%=request.getContextPath() %>/js/jquery.qtip-1.0.0-rc3.js" type="text/javascript"></script>
<!-- END QTIP -->
	
<!--Start of Zopim Live Chat Script-->
<%-- 
<c:if test="${hideZopim != 'hide'}">
<script type="text/javascript">
	window.$zopim||(function(d,s){var z=$zopim=function(c){z._.push(c)},$=z.s=
	d.createElement(s),e=d.getElementsByTagName(s)[0];z.set=function(o){z.set.
	_.push(o)};z._=[];z.set._=[];$.async=!0;$.setAttribute('charset','utf-8');
	$.src='//v2.zopim.com/?1Px2VMF7I6b2Sl4YNzp1R0AuCPcTQ54r';z.t=+new Date;$.
	type='text/javascript';e.parentNode.insertBefore($,e)})(document,'script');
</script>
</c:if>
--%>
<!--End of Zopim Live Chat Script-->

<!-- GOOGLE ANALYTICS -->
<!-- <script>
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

  ga('create', 'UA-42819651-1', '1pay.vn');
  ga('send', 'pageview');

</script> -->
<!-- END GOOGLE ANALYTICS -->