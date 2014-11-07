<!doctype html>
<html lang="en-US">
<head>
<jsp:include page="head.jsp"></jsp:include>
</head>
<body>
	<h4>Simple Tooltip:</h4>
	<br/>
	<br/><br/><br/><br/><br/><br/><br/><br/><br/>
	<a id="myLink1" href="#" title="Click to show/hide source">Mouse
		over me</a>
		<script type="text/javascript" language="javascript">
		$(document).ready(function() {

			$("#myLink1").qtip({
				content: 'Presets, presets and more presets. Let\'s spice it up a little with our own style!',
				position : {
					corner : {
						target : 'topRight',
						tooltip : 'bottomLeft'
					}
				},
				style : {
					name : 'cream',
					tip : 'bottomLeft',
					border : {
						width : 1,
						radius : 12,
						color : '#F49105'
					},
					color : '#fff',
					background : '#F49105'
				}
			});
		});
	</script>
	<br />
</body>
</html>