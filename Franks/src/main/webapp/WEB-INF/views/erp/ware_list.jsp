<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
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
	
			<h3>물건 목록</h3>
			<a href="../../erp/store/list">점포목록</a>
		</div>
		<div class="well">
			<div class="row">
				<form method="post" class="form-inline">
					<div class="form-group col-sm-offset-1 col-sm-5">
						<label for="wtype">물건종류</label>
						<c:if test="${ list != null}">
						<select name="wtype" class="form-control" id="goods_type">
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
						</c:if>
						<button class="btn btn-default" type="submit">물건이름 검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left col-sm-5col-sm-offset-1">
						<label for="wname">물건이름</label>
							<input type="text" class="form-control" name="wname" id="wname" placeholder="">
						<button class="btn btn-default" type="submit">물건검색</button>
					</div>
				</form>
			</div>
		</div>
		
		<c:if test="${ list!=null}">
		<table class="table table-bordered">
			<tr class="info">
				<th>물건번호</th>
				<th>물건이름</th>
				<th>물건타입</th>
				<th>기능</th>
			</tr>
			<c:forEach items="${ list}" var="ware">
			<tr>
				<td><a href="./detail/${ware.WNUM}">${ware.WNUM }</a></td>
				<td><a href="./detail/${ware.WNUM}">${ware.WNAME }</a></td>
				<c:if test='${(ware.WTYPE).equals("0") }'>
				<td><a href="./detail/${ware.WNUM}">메인 메뉴 재료</a></td>
				</c:if>
				<c:if test='${(ware.WTYPE).equals("1") }'>
				<td><a href="./detail/${ware.WNUM}">비품</a></td>
				</c:if>
				<c:if test='${(ware.WTYPE).equals("2") }'>
				<td><a href="./detail/${ware.WNUM}">사이드 메뉴 재료</a></td>
				</c:if>
				<td class="text-center">
				<a href="./edit/${ware.WNUM}" class="btn btn-default" role="button">수정</a>
				<a href="./delete/${ware.WNUM}" class="btn btn-default" role="button">삭제</a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		</c:if>
		<c:if test="${ list==null}">
		<h3>물건이 없습니다.</h3>
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