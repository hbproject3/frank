<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
</head>

<body>
	<div class="col-lg-3 aside text-center">
	ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
	</div>
	
	<div class="col-lg-9 section text-center">
		<div class="page-header text-center">

			<h3>주문 추가</h3>
		</div>
		<div class="well">
			<form>
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="ware_name">주문할 상품</label>
						<select name="ware_name" id="ware_name">
						<c:foreach items="${stock_list}" var="stock">
							<option value="${stock.WNUM}">${store.WNAME}</option>
						</c:foreach>	
						</select>
					</div>
					<div class="col-sm-6 form-group">
						<label for="count">주문수량</label>
						<input class="form-control" type="number" name="count" id="quantity" min="1" max="1000" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="send_store">발송지</label>
						<select name="send_store" id="send_store">
						<c:foreach items="${store_list}" var="store">
							<option value="${store.FNUM}">${store.FNAME}</option>
						</c:foreach>
						</select>
					</div>
					<div class="col-sm-6 form-group">
						<label for="send_type">배송타입</label>
						<select name="send_type" id="send_type" class="form-control">
							<option value="0">보통</option>
							<option value="1">급속</option>
						</select>
					</div>
				</div>
				
				<div class="text-center">
					<br/>
					<br/>
					<button type="submit" class="btn btn-info" role="button">추가</button>
					<a href="#" class="btn btn-primary" role="button">취소 후 목록</a>
				</div>
			</form>
		</div>
	</div>
</body>

</html>