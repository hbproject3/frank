<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
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
				<h2 class="text-center"><strong>알림 목록</strong></h2>
				<div class="panel panel-info">
				<div class="panel-heading">
					<h5>글 읽기</h5>
				</div>
				<div class="panel-body">
					<h4>제목: ${detail.BSUB }</h4>
					<div class="row">
						<div class="col-sm-2">
							<dt>글번호</dt>
							<dd>${detail.BNUM }</dd>
						</div>
						<div class="col-sm-2">
							<dt>조회 수 </dt>
							<dd>${detail.BCNT }</dd>
						</div>
						<div class="col-sm-3 col-sm-offset-5">
							<dt>날짜</dt>
							<dd>${detail.BDATE }</dd>
						</div>
					</div>
					<dt>글쓴이</dt>
					<dd>운영자</dd>
					<dt>제목</dt>
					<dd>글번호 4에 대한 답변입니다</dd>
					<div class="text-center">
						<textarea class="form-control detail_textarea" rows="5" name="cntnt" placeholder="${detail.BCNTNT }" readonly style="background-color: white; color: black"></textarea>
						<br/>
						<br/>
						<a href="../edit/${idx }" class="btn btn-info" role="button">수정</a>
						<a href="../../headnotice/${nowPage }" class="btn btn-primary" role="button" id="list">목록</a>
						<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
					</div>
				</div>
			</div>
			</div>
		</div>	
		<script type="text/javascript">
			/* $('a#list').click(function(e){
				e.preventDefault();
				window.history.back();
			}); */
		</script>
</body>

</html>