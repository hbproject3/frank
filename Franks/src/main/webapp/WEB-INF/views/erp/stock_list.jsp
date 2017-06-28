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
	
			<h3>재고 목록</h3>
			<a href="../../erp/store/list">재고목록</a>
		</div>
		<div class="well">
			<c:if test="${ list != null}">
			<div class="row">
				<form method="post" class="form-inline">
					<div class="form-group col-sm-offset-1 col-sm-5">
						<label for="wtype">재고종류</label>
						<select name="wtype" class="form-control" id="goods_type">
							<c:forEach items="${ type}" var="ware">
								<option value="${ware.WTYPE }">${ware.WTYPE }</option>
							</c:forEach>	
						</select>	
						<button class="btn btn-default" type="submit">재고이름 검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left col-sm-5col-sm-offset-1">
						<label for="wname">물건이름</label>
							<input type="text" class="form-control" name="wname" id="wname" placeholder="">
						<button class="btn btn-default" type="submit">물건검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left">
						<label for="fnum">점포이름</label>
						<select name="fnum" class="form-control" id="goods_type">
							<c:forEach items="${ stores}" var="store">
								<option value="${store.FNUM }">${store.FNAME }</option>
							</c:forEach>	
						</select>	
						<button class="btn btn-default" type="submit">점포검색</button>						
					</div>
				</form>
			</div>
			</c:if>
			<c:if test="${ list==null}">
			<h3>재고가 없습니다.</h3>
			</c:if>
		</div>
		<c:if test="${ list!=null}">
		<table class="table table-bordered">
			<tr class="info">
				<th>가맹점번호</th>
				<th>물건이름</th>
				<th>현재 재고 수</th>
				<th>들어온 재고 수</th>
				<th>나간 재고 수</th>
				<th>업데이트 날짜</th>
				<th>종류</th>
				<th>기능</th>
			</tr>
			<c:forEach items="${ list}" var="stock">
			<tr>
				<td><a href="./detail/${stock.WNUM}">${stock.FNUM }</a></td>
				<td><a href="./detail/${stock.WNUM}">${stock.WNAME }</a></td>
				<td><a href="./detail/${stock.WNUM}">${stock.NOWSTOCK }</a></td>
				<td><a href="./detail/${stock.WNUM}">${stock.INSTOCK }</a></td>
				<td><a href="./detail/${stock.WNUM}">${stock.OUTSTOCK }</a></td>
				<td><a href="./detail/${stock.WNUM}"><fmt:formatDate value="${stock.UDATE }" pattern="yyyy.MM.dd"/></a></td>
				<td><a href="./detail/${stock.WNUM}">${stock.WTYPE }</a></td>
				<td class="">
				<a href="./edit/${stock.WNUM}" class="btn btn-default" role="button">수정</a>
				<a href="./delete/${stock.WNUM}" class="btn btn-default" role="button">삭제</a>
				</td>
			</tr>
			</c:forEach>
			

		</table>
		</c:if>
		<c:if test="${ list==null}">
		<h3>재고가 없습니다.</h3>
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