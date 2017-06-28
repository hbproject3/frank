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
	
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 panel panel-defaul">
				<div class="page-header">
					<h3 class="text-center">
						상단 메뉴
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
					<h3>매출 목록</h3>
				</div>
				<div class="well">
					<div class="row">
						<form action="" class="form-inline">
							<div class="form-group col-sm-5 col-sm-offset-1">
								<label for="srch_day">검색일자</label>
								<input type="date" name="srch_day" id="srch_day" min="2016-01-01" max="2020-01-01"><!--sql 상으로 min, max 값 주입-->
								<button class="btn btn-primary" type="search">검색</button>
							</div>
						
							<div class="form-group text-center col-sm-offset-0 col-sm-5">
								<input type="time" class="form-control" name="stTime" id="stTime" placeholder="" value="00:00">
								<span>~</span>
								<input type="time" class="form-control" name="enTime" id="enTime" placeholder="">
								<button class="btn btn-primary" type="search">점포검색</button>
							</div>
						</form>
					</div>
				</div>
				<table class="table table-bordered">
					<tr class="info">
						<th>날짜</th>
						<th>결제수단</th>
						<th>실제매출</th>
						<th>기프티콘 매출</th>
						<th>이벤트성 매출</th>
						<th>결제 시각</th>
					</tr>
					<tr>
						<td>2017-06-12</td>
						<td>카드</td>
						<td>2500</td>
						<td>0</td>
						<td>0</td>
						<td>13:42:32</td>
					</tr>
					<tr>
						<td>2017-06-12</td>
						<td>현금</td>
						<td>1500</td>
						<td>0</td>
						<td>0</td>
						<td>13:24:03</td>
					</tr>
					
				</table>
				<div class="row">
					<div class="col-sm-4 col-sm-offset-8">
						<div class="well text-center">
							<a href="#" class="btn btn-default" role="button">추가</a>
							<a href="#" class="btn btn-default" role="button">수정</a>
							<a href="#" class="btn btn-default" role="button">삭제</a>
						</div>
					</div>
				</div>


			</div>
		</div>
	</div>

</body>

</html>