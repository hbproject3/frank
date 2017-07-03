<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
	

MENU_NUM
MENU_NAME
MENU_PRICE
MENU_TYPE
MENU_COUNT

	<div class="col-lg-9 section text-center">
		<div class="row content container-fluid">
			<h2 class="text-center"><strong>매뉴 수정</strong></h2>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h5>매뉴 정보</h5>
				</div>
				<div class="panel-body">
					<form action="" method="post">
						<div class="form-group">
							<label for="name">메뉴 이름</label>
							<input type="text" value="" class="form-control" name="name" id="">
						</div>
						<div class="form-group">
							<label for="price">메뉴 가격</label>
							<input type="text" value="" class="form-control" name="price" id="">
						</div>
						<div class="form-group">
							<label for="type">메뉴 타입</label>
							<select name="type" id="menu_type">
								<c:forEach items="${menu_types}" var="menu">
									<c:choose>
										<c:when test="${(menu.MENU_TYPE).equals(detail.MENU_TYPE)}">
											<option value="${menu.MENU_TYPE}" selected>${menu.MENU_TYPE}</option>
										</c:when>	
										<c:otherwise>
											<option value="${menu.MENU_TYPE}">${menu.MENU_TYPE}</option>
										</c:otherwise>
									</c:choose>
								</c:forEach>
							</select>
						</div>
						<button type="submit" class="btn btn-default">수정</button>
						<button type="reset" class="btn btn-default">취소</button>
					</form>
						<br/>
						<br/>
						<a href="../../alarm/${nowPage }" class="btn btn-primary" role="button" id="list">목록</a>
						<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
					</div>
				</div>	
			</div>
		</div>
	</div>	
</body>

</html>