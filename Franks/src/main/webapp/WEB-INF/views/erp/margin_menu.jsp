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
					<h3>메뉴별 매출</h3>
				</div>
				<div class="well">
					<div class="row">
						<form action="" class="form-inline">
							<div class="form-group col-sm-5 col-sm-offset-1 text-center">
								<label for="month">월</label>
								<input type="month" name="month" id="month" min="2016-01-01" max="2020-01-01" value="2016-06">
								<!--sql 상으로 min, max 값 주입-->
								<button class="btn btn-primary" type="search">월 검색</button>
							</div>

							<div class="form-group text-center col-sm-offset-0 col-sm-5 text-center">
								<label for="day">일</label>
								<input type="date" class="form-control" name="day" id="day" placeholder="" value="2017-06-17">
								<button class="btn btn-primary" type="search">일 검색</button>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<h3 class="text-center">주 메뉴</h3>
					<div class="col-sm-8 col-sm-offset-2">
						<table class="table table-bordered">
							<tr class="info">
								<th>메뉴</th>
								<th>단가</th>
								<th>판매량</th>
								<th>총액</th>
							</tr>
							<tr>
								<td>치즈 콘도그</td>
								<td>2000</td>
								<td>250개</td>
								<td>500000원</td>
							</tr>
							<tr>
								<td>라면 콘도그</td>
								<td>2500</td>
								<td>180개</td>
								<td>450000원</td>
							</tr>
							<tr>
								<td>매콤 콘도그</td>
								<td>2500</td>
								<td>180개</td>
								<td>450000원</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<h3 class="text-center">사이드 메뉴</h3>
					<div class="col-sm-8 col-sm-offset-2">
						<table class="table table-bordered">
							<tr class="info">
								<th>메뉴</th>
								<th>단가</th>
								<th>판매량</th>
								<th>총액</th>
							</tr>
							<tr>
								<td>치즈 콘도그</td>
								<td>2000</td>
								<td>250개</td>
								<td>500000원</td>
							</tr>
							<tr>
								<td>라면 콘도그</td>
								<td>2500</td>
								<td>180개</td>
								<td>450000원</td>
							</tr>
							<tr>
								<td>매콤 콘도그</td>
								<td>2500</td>
								<td>180개</td>
								<td>450000원</td>
							</tr>
						</table>
					</div>
				</div>
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