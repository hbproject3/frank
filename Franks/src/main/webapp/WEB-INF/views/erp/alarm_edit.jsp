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
	<link rel="stylesheet" href="../../../resources/css/css1/bootstrap.min.css"/>
	<link rel="stylesheet" href="../../../resources/css/css1/erp1.css"/>
	<script src="../../../resources/js/jquery.min.js"></script>
	<script src="../../../resources/js/bootstrap.min.js"></script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 panel panel-defaul">
				<div class="page-header">
					<h3 class="text-center">
						알람
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
				<div class="row content container-fluid">
					<h1 class="text-center "><strong>문의사항</strong></h1>
					<br/>
					<div class="container">
						<div class="panel panel-default">
							<div class="panel-heading">
								<h5>글 수정</h5>
							</div>
							<div class="panel-body">
								<div class="row">
									<div class="col-sm-2">
										<dt>글번호</dt>
										<dd>${detail.RNUM }</dd>
									</div>
									<div class="col-sm-2">
										<dt>확인 여부</dt>
										<C:if test="${detail.ACHK == 1}">
										<dd>확인</dd>
										</C:if>
										<C:if test="${detail.ACHK == 0}">
										<dd>미확인</dd>
										</C:if>
									</div>
									<div class="col-sm-3 col-sm-offset-5">
										<dt>날짜</dt>
										<dd><fmt:formatDate value="${detail.ASDATE }" pattern="yyyy년 MM월 dd일 hh시 mm분"/> </dd>
									</div>
								</div>
								<br/>
								<dt>글쓴이</dt>
								<dd>홍길동</dd>
								<br/>
								<form method="POST">
									<label for="">제목</label>
									<input class="form-control" type="text" name="sub" id="sub" value="${detail.ASUB }"/>
									<input type="hidden" name="anum" id="anum" value="${detail.ANUM }" />
									<br/>
									<div class="text-center">
										<textarea class="form-control detail_textarea" rows="5" name="cntnt" placeholder="${detail.ACNTNT }" style="background-color: white; color: black"></textarea>
										<br/>
										<br/>
										<button type="submit" class="btn btn-info" role="button">수정</button>
										<a href="../../alarm/${nowPage }" class="btn btn-primary" role="button">목록</a>
										<button type="reset" class="btn btn-info" role="button">취소</button>
										<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>	
		</div>
	</div>		
</body>

</html>