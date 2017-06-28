<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<link rel="stylesheet" href="../../resources/css/css1/bootstrap.min.css"/>
	<link rel="stylesheet" href="../../resources/css/css1/erp1.css"/>
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		var barChartData1 = {
			labels: ["1월", "2월", "3월", "4월", "5월", "6월", "7월", "8월", "9월", "10월", "11월", "12월"],
			datasets: [{
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,0.8)",
				highlightFill: "rgba(151,187,205,0.75)",
				highlightStroke: "rgba(151,187,205,1)",
				data: [3000, 2400, 1500, 3000, 3080, 200, 3000, 2350, 2390, 2389, 4000, 3000]
			}]
		}																										
		var barChartData2 = {
			labels: ["1주", "2주", "3주", "4주", "5주"],
			datasets: [{
				fillColor: "rgba(151,187,205,0.5)",
				strokeColor: "rgba(151,187,205,0.8)",
				highlightFill: "rgba(151,187,205,0.75)",
				highlightStroke: "rgba(151,187,205,1)",
				data: [200, 300, 840, 320, 20]
			}]
		}
		var doughnutData1 = [
			{
				value: 300,
				color: "#F7464A",
				highlight: "#FF5A5E",
				label: "핫도그"
			},
			{
				value: 50,
				color: "#46BFBD",
				highlight: "#5AD3D1",
				label: "콘도그"
			},
			{
				value: 100,
				color: "#FDB45C",
				highlight: "#FFC870",
				label: "사이드메뉴"
			},
			{
				value: 40,
				color: "#949FB1",
				highlight: "#A8B3C5",
				label: "사이다"
			},
			{
				value: 120,
				color: "#4D5360",
				highlight: "#616774",
				label: ""
			}
		];

		window.onload = function() {
			window.myBar = new Chart(document.getElementById('canvas1').getContext("2d")).Bar(barChartData1, {
				responsive: true
			});
			window.myBar = new Chart(document.getElementById('canvas2').getContext("2d")).Bar(barChartData2, {
				responsive: true
			});
			window.myDoughnut = new Chart(document.getElementById('canvas3').getContext("2d")).Doughnut(doughnutData1, {
				responsive: true
			});
		}

	</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 panel panel-defaul">
				<div class="page-header">
					<h3 class="text-center">
						재고 조회 페이지
					</h3>
					<hr>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h3>
					사이드 바
				</h3>
			</div>
			<div class="col-md-8">
				<div class="page-header text-center">

					<h3>매출 현황</h3>
					<div class="col-sm-6 col-sm-offset-3 text-center">
						<div class="well">
							<label for="mrgn_year">검색년도</label>
							<input type="number" name="mrgn_year" id="mrgn_year" value="2016" min="2016" max="2020" placeholder="">
							<button type="search" class="btn  btn-primary">검색</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-sm-offset-1 col-sm-10">
						<div class="panel-body" style="height:350px;">
							<h4 class="text-center">월 매출</h4>
							<small>(단위: 만)</small>
							<div>
								<canvas id="canvas1" height="40%" width="100%">	
								</canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 text-center">
						<div class="well">
							<label for="mrgn_month">검색할 달</label>
							<input type="month" value="2017-06" name="mrgn_month" id="mrgn_month" placeholder="">
							<button type="search" class="btn  btn-primary">검색</button>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-sm-offset-1 col-sm-10">
						<div class="panel-body" style="height:350px;">
							<h4 class="text-center">월 매출</h4>
							<small>(단위: 만)</small>
							<div>
								<canvas id="canvas2" height="40%" width="100%">	
								</canvas>
							</div>
						</div>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 col-sm-offset-3 text-center">
						<div class="well">
							<label for="mrgn_day">검색일자</label>
							<input type="date" name="mrgn_day" id="mrgn_day" value="2017-06-22" min="2016-01-01" max="2020-01-01" placeholder="">
							<button type="search" class="btn btn-primary">검색</button>
						</div>
					</div>
				</div>
				<h2 class="text-center">시간대별 매출</h2>
				<div class="row">
					<div class="col-sm-8 col-sm-offset-2">
						<table class="table table-bordered">
							<tr class="info">
								<th>시간</th>
								<th>시간대별 판매 횟수</th>
								<th>판매 금액</th>
							</tr>
							<tr>
								<td>s</td>
								<td>s</td>
								<td>s</td>
							</tr>	
						</table>
					</div>
				</div>
				<div class="row">
					<div class="panel panel-default col-sm-offset-1 col-sm-10">
						<div class="panel-body" style="height:350px;">
							<h4 class="text-center">매출 비중</h4>
							<div id="canvas-holder">
								<canvas id="canvas3" width="100%" height="40%" />
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>

</html>