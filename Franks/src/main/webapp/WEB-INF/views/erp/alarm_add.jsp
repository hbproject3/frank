<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<link rel="stylesheet" href="../../resources/css/css1/bootstrap.min.css"/>
	<link rel="stylesheet" href="../../resources/css/css1/erp1.css"/>
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
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
				<div class="row content">
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
			</div>	
		</div>
	</div>		
</body>

</html>