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
					<h3>점포별 매출 순위</h3>
				</div>
				<div class="well">
					<div class="row">
						<form action="" class="form-inline">
							<div class="form-group col-sm-5 col-sm-offset-1 text-center">
								<label for="month">월</label>
								<input type="month" name="month" id="month" min="2016-01" max="2020-01" value="2016-06">
								<!--sql 상으로 min, max 값 주입-->
								<button class="btn btn-primary" type="search">월 검색</button>
							</div>

							<div class="form-group text-center col-sm-offset-0 col-sm-5 text-center">
								<label for="day">일</label>
								<input type="date" class="form-control" name="day" id="day" placeholder="" value="2017-06-17" min="2016-01-01" max="2020-01-01">
								<button class="btn btn-primary" type="search">일 검색</button>
							</div>
							<div class="form-group col-sm-5 col-sm-offset-2">
								<label for="guide">기준</label><select name="guide" class="form-control" id="guide">
									<option value="totMargin">총 매출</option>
									<option value="cardMargin">카드 매출</option>
									<option value="billMargin">현금 매출</option>
									<option value="giftMargin">기프티콘 매출</option>
									<option value="evntMargin">이벤트 매출</option>
								</select>
							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<h3 class="text-center">일 단위 매출</h3>
					<div class="col-sm-10 col-sm-offset-1">
						<table class="table table-bordered">
							<tr class="info">
								<th>순위</th>
								<th>점포지역</th>
								<th>점포코드</th>
								<th>점포명</th>
								<th>총 매출</th>
								<th>카드 매출</th>
								<th>현금 매출</th>
								<th>기프티콘 매출</th>
								<th>이벤트 매출</th>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
							</tr>
						</table>
					</div>
				</div>
				<div class="row">
					<h3 class="text-center">월 단위 매출</h3>
					<div class="col-sm-10 col-sm-offset-1">
						<table class="table table-bordered">
							<tr class="info">
								<th>순위</th>
								<th>점포지역</th>
								<th>점포코드</th>
								<th>점포명</th>
								<th>총 매출</th>
								<th>카드 매출</th>
								<th>현금 매출</th>
								<th>기프티콘 매출</th>
								<th>이벤트 매출</th>
							</tr>
							<tr>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
								<td>&nbsp;</td>
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