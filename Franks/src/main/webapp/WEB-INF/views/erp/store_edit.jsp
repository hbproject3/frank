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
					<h2 class="text-center"><strong>점포 수정</strong></h2>
					<div class="panel panel-info">
						<div class="panel-heading">
							<h5>점포 정보</h5>
						</div>
						<div class="panel-body">
							<div class="row">
								<div class="col-sm-2">
									<dt>점포번호</dt>
									<dd>${list.FNUM }</dd>
								</div>
								<div class="col-sm-2">
									<dt>점포이름</dt>
									<dd>${list.FNAME}</dd1>
								</div>
								<div class="col-sm-2">
									<dt>전화번호</dt>
									<dd>${list.FPHONE}</dd>
								</div>
								<div class="col-sm-2">
									<dt>주소</dt>
									<dd>${list.FADDRESS}</dd>
								</div>
								<br/>
								<br/>
								<a href="../../alarm/${nowPage }" class="btn btn-primary" role="button" id="list">목록</a>
								<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
							</div>
						</div>	
					</div>
				</div>
			</div>	
		</div>
	</div>		
</body>

</html>