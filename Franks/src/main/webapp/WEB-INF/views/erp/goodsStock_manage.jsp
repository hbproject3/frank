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
						상품 재고 관리
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

					<h3>상품 재고 조회</h3>
				</div>
				<div class="well">
					<div class="row">
						<form action="" class="form-inline">
							<div class="form-group text-left col-sm-6 col-sm-offset-1">
								<label for="">상품명</label>
								<input type="text" class="form-control" name="" id="" placeholder="">
								<button class="btn btn-default" type="search">상품검색</button>

							</div>

							<div class="form-group col-sm-5">
								<label for="goods_type">상품분류</label><select name="googs_type" class="form-control" id="goods_type">
								<option value="ori_material">원재료</option>
								<option value="stuffs">부자재</option>
							</select>
								<button class="btn btn-default" type="search">상품검색</button>

							</div>
						</form>
					</div>
				</div>
				<div class="row">
					<div class="col-sm-4">
						<table class="table table-bordered">
							<tr class="info">
								<th>매장명</th>
								<th>매장 번호</th>
								<th>날짜</th>
								<th>재고 품목</th>
							</tr>
							<tr>
								<td>한빛신촌점</td>
								<td>30224</td>
								<td>17/06/04</td>
								<td>3432</td>
							</tr>

						</table>
					</div>
				</div>
				<table class="table table-bordered">
					<tr class="info">
						<th>품번</th>
						<th>품명</th>
						<th>본사재고</th>
						<th>매장재고</th>
						<th>판매량</th>
						<th>주문수량</th>
						<th>주문현황</th>
						<th>주문타입</th>
					</tr>
					<tr>
						<td>21</td>
						<td>케찹</td>
						<td>353</td>
						<td>12</td>
						<td>4</td>
						<td>3</td>
						<td>진행 중</td>
						<td>보통</td>
					</tr>
					<tr>
						<td>25</td>
						<td>빵</td>
						<td>234</td>
						<td>21</td>
						<td>5</td>
						<td>4</td>
						<td>완료</td>
						<td>급송</td>
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