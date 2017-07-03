<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h5>글 수정</h5>
			</div>
			<div class="panel-body">
				<div class="row">
					<div class="col-sm-2">
						<dt>글번호</dt>
						<dd>${detail.BNUM }</dd>
					</div>
					<div class="col-sm-2">
						<dt>조회 수</dt>
						<dd>${detail.BCNT }</dd>
					</div>
					<div class="col-sm-3 col-sm-offset-5">
						<dt>날짜</dt>
						<dd><fmt:formatDate value="${detail.BDATE }" pattern="yyyy년 MM월 dd일 hh시 mm분"/> </dd>
					</div>
				</div>
				<br/>
				<br/>
				<form method="POST">
					<label for="">제목</label>
					<input class="form-control" type="text" name="sub" id="sub" value="${detail.BSUB }"/>
					<input type="hidden" name="bnum" id="bnum" value="${detail.BNUM }" />
					<br/>
					<div class="text-center">
						<textarea class="form-control detail_textarea" rows="5" name="cntnt" placeholder="${detail.BCNTNT }" style="background-color: white; color: black"></textarea>
						<br/>
						<br/>
						<button type="submit" class="btn btn-info" role="button">수정</button>
						<a href="../../headnotice/${nowPage }" class="btn btn-primary" role="button">목록</a>
						<button type="reset" class="btn btn-info" role="button">취소</button>
						<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
					</div>
				</form>
			</div>
		</div>
	</div>


</body>

</html>