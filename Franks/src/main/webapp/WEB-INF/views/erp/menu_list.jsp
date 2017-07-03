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
	
			<h3>메뉴 목록</h3>
			<a href="../../erp/store/list">점포목록</a>
		</div>
		<div class="well">
			<div class="row">
				<form method="post" class="form-inline">
					<div class="form-group col-sm-offset-1 col-sm-5">
						<label for="type">메뉴종류</label>
						<c:if test="${list != null}">
						<select name="type" class="form-control" id="menu_type">
							<c:forEach items="${types}" var="menu">
								<option value="${menu.MENU_TYPE }">${menu.MENU_TYPE }</option>
							</c:forEach>	
						</select>	
						</c:if>
						<button class="btn btn-default" type="submit">메뉴종류 검색</button>
					</div>
				</form>
				<form method="post" class="form-inline">
					<div class="form-group text-left col-sm-5col-sm-offset-1">
						<label for="name">메뉴이름</label>
							<input type="text" class="form-control" name="name" id="menu_name" placeholder="">
						<button class="btn btn-default" type="submit">메뉴이름 검색</button>
					</div>
				</form>
			</div>
		</div>
		
		<c:if test="${ list!=null}">
		<table class="table table-bordered">
			<tr class="info">
				<th>메뉴번호</th>
				<th>메뉴이름</th>
				<th>메뉴가격</th>
				<th>메뉴타입</th>
				<th>기능</th>
			</tr>
			<c:forEach items="${ list}" var="menu">
			<tr>
				<td>${menu.MENU_NUM }</td>
				<td>${menu.MENU_NAME }</td>
				<td>${menu.MENU_PRICE }</td>
				<td>${menu.MENU_TYPE }</td>
				<td class="text-center">
				<a href="./edit/${menu.WNUM}" class="btn btn-default" role="button">수정</a>
				<a href="./delete/${menu.WNUM}" class="btn btn-default" role="button">삭제</a>
				</td>
			</tr>
			</c:forEach>
			
		</table>
		</c:if>
		<c:if test="${ list==null}">
		<h3>메뉴이 없습니다.</h3>
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