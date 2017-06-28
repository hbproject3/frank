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

					<h3>주문 추가</h3>
				</div>
				<div class="well">
					<form>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="orderMaterail">주문할 상품</label>
								<select class="form-control" name="orderMaterial" id="">
										<option value="ketchup">케찹</option>
										<option value="cheese">치즈</option>
										<option value="bread">빵</option>
									</select>
							</div>
							<div class="col-sm-6 form-group">
								<label for="quantity">주문수량</label>
								<input class="form-control" type="number" name="quantity" id="quantity" min="1" max="1000" />
							</div>
						</div>
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="sendArea">발송지</label>
								<input type="text" name="sendArea" id="sendArea" class="form-control">
								<div class="text-right">
									<button type="search" class="btn btn-default text-right">발송지 검색</button>
								</div>
							</div>
							<div class="col-sm-6 form-group">
								<label for="sendType">배송타입</label>
								<select name="sendType" id="sendType" class="form-control">
									<option value="normal">보통</option>
									<option value="express">급속</option>
								</select>
							</div>
						</div>
						
						<div class="text-center">
							<label for="cntnt">추가할 주문 메시지</label>
							<textarea class="form-control detail_textarea" rows="5" name="cntnt" placeholder="내용을 입력해주세요" style="background-color: white; color: black"></textarea>
							<br/>
							<br/>
							<button type="submit" class="btn btn-info" role="button">추가</button>
							<a href="#" class="btn btn-primary" role="button">취소 후 목록</a>
						</div>
					</form>
				</div>
			</div>
		</div>



	</div>


</body>

</html>