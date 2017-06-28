<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
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
		<h1 class="text-center "><strong>알림</strong></h1>
		<br/>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h5 class="text-center">글 쓰기</h5>
			</div>
			<div class="panel-body">
				<form method="post"  modelAttribute="hashmap">
					<label for="sub">제목</label>
					<input class="form-control" type="text" name="sub" id="sub" placeholder="제목을 쓰세요"/>
					<br/>
					<label for="asStoreList">받을 상점</label>
					<c:if test="${list != null }">
					<select name="asStoreList" id="asStoreList">
					<c:forEach items="${list}" var="store">
						<c:if test="${store.FNUM != myFnum }">
						<option value="${store.FNUM }">${store.FNAME }</option>]
						</c:if>
					</c:forEach>
					</select>
					</c:if>
					<label for="cntnt">내용</label>
					<textarea class="form-control detail_textarea" rows="5" name="cntnt" placeholder="내용을 입력해주세요" style="background-color: white; color: black"></textarea>
					<br/>
					<br/>
					<div class="text-center">
						<button type="submit" class="btn btn-info" role="button">글쓰기</button>
						<a href="./1" class="btn btn-primary" role="button">목록</a>
						<button type="reset" class="btn btn-warning" role="button">취소</button>
					</div>	
				</form>
			</div>
		</div>
	</div>	
</body>

</html>