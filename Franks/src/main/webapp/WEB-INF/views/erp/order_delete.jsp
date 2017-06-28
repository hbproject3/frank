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

					<h3>주문 수정</h3>
				</div>
				<div class="well">
					<h4 class="text-center">삭제할 해당 주문 정보</h4>
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
						<tr class="white">
							<td>21</td>
							<td>케찹</td>
							<td>353</td>
							<td>12</td>
							<td>4</td>
							<td>3</td>
							<td>진행 중</td>
							<td>보통</td>
						</tr>
					</table>
					<br/>
					<br/>
					<div class="text-center">
						<button type="submit" class="btn btn-warning" role="button">삭제</button>
						<a href="#" class="btn btn-primary" role="button">취소 후 목록</a>
					</div>
				</div>
			</div>
		</div>
	
</body>

</html>