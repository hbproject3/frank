<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>

<head>
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<script type="text/javascript">
		$('document').ready(function() {
			$('li.active a').click(function(event) {
				return false;
			});
		});
	</script>
</head>

<body>
	<div class="col-lg-3 aside text-center">
	ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
	</div>
	
	<div class="col-lg-9 section text-center">
		<div class="page-header text-center">
	
			<h3>주문 목록</h3>
			<a href="../../erp/store/list">주문목록</a>
		</div>

		<div class="well">
			<c:if test="${ list != null}">
			<div class="row">
				<form method="post" class="form-inline">
					<div class="form-group col-sm-offset-1 col-sm-5">	
						<label for="wtype">주문 자재 분류 </label>
						<select name="wtype" class="form-control" id="wtype">
							<c:forEach items="${ type}" var="ware">
								<c:if test='${(ware.WTYPE).equals("0") }'>
								<option value="${ware.WTYPE }">메인 메뉴 재료</option>
								</c:if>
								<c:if test='${(ware.WTYPE).equals("1") }'>
								<option value="${ware.WTYPE }">비품</option>
								</c:if>
								<c:if test='${(ware.WTYPE).equals("2") }'>
								<option value="${ware.WTYPE }">사이드메뉴 재료</option>
								</c:if>
							</c:forEach>	
						</select>	
						<button class="btn btn-default" type="submit">검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left col-sm-5col-sm-offset-1">
						<label for="wname">주문한 상품명</label>
							<input type="text" class="form-control" name="wname" id="wname" placeholder="">
						<button class="btn btn-default" type="submit">검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left">
						<label for="fnum">주문한 상점</label>
						<select name="fnum" class="form-control" id="fnum">
							<c:forEach items="${ stores}" var="store">
								<option value="${store.FNUM }">${store.FNAME }</option>
							</c:forEach>	
						</select>	
						<button class="btn btn-default" type="submit">검색</button>						
					</div>
				</form>
			</div>
			</c:if>
			<c:if test="${ list==null}">
			<h3>주문가 없습니다.</h3>
			</c:if>
		</div>
		<c:if test="${ list!=null}">
		<div class="table-responsive">
		<table class="table table-bordered">
			<tr class="info">
				<th>주문번호</th>
				<th>주문한 물건 이름</th>
				<th>주문량</th>
				<th>주문 유형</th>
				<th>주문한 날짜</th>
				<th>주문품이 도착한 날짜</th>
				<th>주문받은 상점</th>
				<th>주문한 상점</th>
				<th>기능</th>
			</tr>
			<c:forEach items="${ list}" var="order">
			<tr>
				<td>${order.ONUM }</td>
				<td>${order.WNAME }</td>
				<td>${order.OCOUNT }</td>
				<c:if test='${order.OTYPE==1 }'>
				<td>보통 주문</td>
				</c:if>
				<c:if test='${order.OTYPE==2 }'>
				<td>빠른 주문</td>
				</c:if>
				<td><fmt:formatDate value="${order.OSDATE }" pattern="yyyy.MM.dd"/></td>
				<td><fmt:formatDate value="${order.OEDATE }" pattern="yyyy.MM.dd"/></td>
				<td>${order.OSSTORENAME }</td>
				<td>${order.ORSTORENAME }</td>
				<td class="text-center">
				<a href="./edit/${order.WNUM}" class="btn btn-default" role="button">수정</a>
				<a href="./delete/${order.WNUM}" class="btn btn-default" role="button">삭제</a>
				</td>
			</tr>
			</c:forEach>
			

		</table>
		</div>
		</c:if>
		<c:if test="${ list==null}">
		<h3>주문이 없습니다.</h3>
		</c:if>
		<div class="row">
			<div class="col-sm-4 col-sm-offset-8">
				<div class="well text-center">
					<a href="#" class="btn btn-default" role="button">추가</a>
				</div>
			</div>
		</div>
		</div>
</body>

</html>