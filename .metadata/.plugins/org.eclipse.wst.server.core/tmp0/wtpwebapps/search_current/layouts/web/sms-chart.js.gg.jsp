<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script type="text/javascript" src="https://www.google.com/jsapi"></script>

<script>
	var oneDayMilis = 24*60*60*1000;
	var period = 0.1;
	//alert(period);

	var limitError = [];
	//var maxFrame = parseFloat('<c:out value="${model.total}"/>') / (24.0/period);
	var countLimit = 3;
	/* if('<c:out value="${param.limit }"/>' != '' && !isNaN('<c:out value="${param.limit }"/>') )
        countLimit = parseInt('<c:out value="${param.limit }"/>'); */
	
	///////////////////////////////////////// LINE =============================================
	//curr
	var mapHistogram = [];
	<c:forEach var="map" items="${model.dataHistogramMap }">
		var listInterval = [];
		<c:forEach var="item" items="${map.value }">
			listInterval.push({key : parseInt('<c:out value="${item.key}"/>'), count : parseInt('<c:out value="${item.count}"/>')});
		</c:forEach>
		mapHistogram.push({key : '<c:out value="${map.key}"/>', list : listInterval});
	</c:forEach>
	
	//alert(new Date(mapHistogram[0].list[0].key) + " " + mapHistogram[0].list[0].count);
	google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(draw);
      
	function draw() {
		
		var reservationRequest = '<c:out value="${param.reservation}"/>';
		
		var reservation, from_date, to_date;
		
		if(reservationRequest != ''){
			reservation = reservationRequest.split('-');
	        from_date = reservation[0].trim();
	        to_date = reservation[1].trim();
		}
		
		var today = new Date();
		if(from_date == '' || Date.parseExact(from_date, 'dd/MM/yyyy') == null){
			from_date = today.toString('dd/MM/yyyy');
		}
		if(to_date == '' || Date.parseExact(to_date, 'dd/MM/yyyy') == null){
			to_date = today.toString('dd/MM/yyyy');
        }
		
		//Analytic
		//var period = 0.1;
		var fromDate = Date.parseExact(from_date, 'dd/MM/yyyy');
		var toDate = Date.parseExact(to_date, 'dd/MM/yyyy');
		
		var day = Math.floor((toDate.getTime() - fromDate.getTime())/(24*60*60*1000)) + 1;
		var max = '<c:out value="${model.DATE_FILTER_MAX}"/>';
        if(!isNaN(max) && (day-1) > parseInt(max)){
        	fromDate = Date.parseExact(today.toString('dd/MM/yyyy'), 'dd/MM/yyyy');
        	toDate = Date.parseExact(today.toString('dd/MM/yyyy'), 'dd/MM/yyyy');
        	day = 1;
        }
        
		var hours = 24 * day;
		
		var levels = hours / period; 
		
		var levelTimeAll = generateTemplateTimePeriod(period, fromDate, fromDate, hours, levels);
		function generateTemplateTimePeriod(period, fromDate, toDate, hours, levels){
			var levelTime = [];
			for(var i = 0; i < levels; i++){
				levelTime.push(fromDate.getTime() + i*period*60*60*1000);
			}
			return levelTime;
		}
		
		function generateLineCoordinates() {
			//To fill missions
			for (var i = 0; i < levelTimeAll.length; i++) {
				limitError.push({key : levelTimeAll[i] , count : countLimit});
				
				//map
				for(var j = 0; j < mapHistogram.length; j++){
					if (mapHistogram[j].list == '' || (mapHistogram[j].list.length - 1) < i
							|| levelTimeAll[i] != mapHistogram[j].list[i].key) {
						var blank = {
							key : levelTimeAll[i],
							count : 0
						};
						mapHistogram[j].list.splice(i, 0, blank);
					}
				}
			}
			mapHistogram.push({key:'', list : limitError});//Giới hạn
			
			var arrayData = [];
			var key = [];
			key.push('Ngay');
			//put key
			for(var j = 0; j < mapHistogram.length; j++){
				key.push(mapHistogram[j].key);
			}
			arrayData.push(key);
			
			for (var i = 0; i < levelTimeAll.length; i++) {
				var item = [];
				item.push((new Date(parseInt(levelTimeAll[i]))).toString('dd/MM/yyyy HH:mm'));
				for(var j = 0; j < mapHistogram.length; j++){
					item.push(mapHistogram[j].list[i].count);
				}
				arrayData.push(item);
			}
			return arrayData;
		}
		
		var arrayData = generateLineCoordinates();
		var limitLine = arrayData[0].length-1;
		
		//alert(arrayData);
		/* for(i = 0; i < arrayData.length; i++)
			console.log(arrayData[i]); */
		
		var data = google.visualization.arrayToDataTable(arrayData);
		
           var options = {
             title: 'Lược đồ thời gian',
             chartArea:{left:100,top:20}
           };

           var chart = new google.visualization.LineChart(document.getElementById('line_chart'));
           chart.draw(data, options);
	}
	//End LINE
	
	/////////////////////PIE===============================
	var tab = '<c:out value="${param.tab}"/>';
	var topDataMap = [];
	
	if(tab == '' || tab == 'subscriber' || tab != 'merchant'){
		<c:forEach var="items" items="${model.topDataMap }">
	        var topData = [];
	        topData.push(['item', 'value']);
	        <c:forEach var="item" items="${items.value }">
	            topData.push(['<c:out value="${item.msisdn}"/>' , parseInt('<c:out value="${item.amount}"/>')]);
	        </c:forEach>
	        topDataMap.push({key : '<c:out value="${items.key}"/>', value : topData});
        </c:forEach>
    }
    else{
    	<c:forEach var="items" items="${model.topDataMap }">
	        var topData = [];
	        topData.push(['item', 'value']);
	        <c:forEach var="item" items="${items.value }">
	            topData.push(['<c:out value="${item.merchant}"/>' , parseInt('<c:out value="${item.amount}"/>')]);
	        </c:forEach>
	        topDataMap.push({key : '<c:out value="${items.key}"/>', value : topData});
	    </c:forEach>
    }
	
	google.load("visualization", "1", {packages:["corechart"]});
    google.setOnLoadCallback(drawPieChart);
	function drawPieChart(){
		for(var i = 0; i < topDataMap.length; i++){
			if(topDataMap[i]['value'].length <= 1)
				continue;
			var data = google.visualization.arrayToDataTable(
					topDataMap[i]['value']);
	        var options = {
	                legend: {position:'bottom'},
	                pieSliceText: 'percentage',
	                title: '',
	                pieStartAngle: 100,
	                chartArea:{left:0,top:0, width: 300},
	              };
	        
	        var chart = new google.visualization.PieChart(document.getElementById(topDataMap[i]['key']+'pie_chart'));
	        chart.draw(data, options);
		}
	} 
	//END PIE
	
</script>