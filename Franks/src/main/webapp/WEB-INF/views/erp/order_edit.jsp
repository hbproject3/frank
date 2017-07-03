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

			<h3>주문 수정</h3>
		</div>
		<div class="well">
			<h4 class="text-center">선택한 해당 주문 정보</h4>
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
			<form>
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="ware_name">주문할 상품</label>
						<select class="form-control" name="ware_name" id="ware_name">
							<c:forEach item="${stock_list}" var="stock">
								<c:if test="${stock.WNUM==detail.WNUM}">
								<option value="${stock.WNUM}" selected>${stock.WNAME}</option>
								</c:if>
								<c:if test="${store.FNUM!=detail.FNUM}">
								<option value="${stock.WNUM}">${stock.WNAME}</option>
								</c:if>
							</c:forEach>
						</select>
					</div>
					<div class="col-sm-6 form-group">
						<label for="count">주문수량</label>
						<input class="form-control" type="number" name="count" id="quantity" min="1" max="1000" value="${detail.OCOUNT}" />
					</div>
				</div>
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="sendStore">발송지</label>
						<input type="text" name="sendStore" id="sendStore" class="form-control">
						<c:forEach item="${store_list}" var="store">
							<c:if test="${store.FNUM==detail.FNUM}">
							<option value="${store.FNUM}" selected>${store.FNAME}</option>
							</c:if>
							<c:if test="${store.FNUM!=detail.FNUM}">
							<option value="${store.FNUM}">${store.FNAME}</option>
							</c:if>
						</c:forEach>
					</div>
					<div class="col-sm-6 form-group">
						<label for="sendType">배송타입</label>
						<select name="sendType" id="sendType" class="form-control">
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