<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<meta name="viewport" content="initial-scale=1.0">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<!-- jQuery library -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<!-- Latest compiled JavaScript -->
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body>
<div class="container" style="max-width: 500px">
		
		<div class="panel panel-default">
			<div class="panel-body">
				<h2>멤버추가</h2>
				<hr>
				<form action="memberAdd" method="get">
					<h4 class="text-center well well-sm">필수 정보</h4>
					<div class="form-group">
						<label for="uname">Name:</label>
						<input type="text" class="form-control" id="uname" placeholder="이름을 입력하세요" name="uname">
					</div>
					<div class="form-group">
						<label for="id">ID:</label>
						<input type="text" class="form-control" id="fid" placeholder="ID를 입력하세요" name="fid">
					</div>
					<div class="form-group">
						<label for="upw">Password:</label>
						<input type="password" class="form-control" id="upw" placeholder="password를 입력하세요" name="upw">
					</div>
						<div class="form-group">
						<label for="utype">타입:</label>
						<select name="utype" id="utype" class="form-control">
							<option value="0">직원</option>
							<option value="1">점주</option>
							<option value="2">관리자</option>
						</select>
					</div>
					<h4 class="text-center well well-sm">선택 정보</h4>
					<div class="form-group">
						<label for="phone">휴대폰:</label>
						<input type="text" class="form-control" id="phone" placeholder="휴대폰 번호를 입력하세요" name="phone">
					</div>
					<div class="form-group">
						<label for="email">E-mail:</label>
						<input type="text" class="form-control" id="email" placeholder="이메일 주소를 입력하세요" name="email">
					</div>
					<div class="text-center">
						<div class="btn-group">
							<button type="submit" class="btn btn-info">멤버추가</button>
							<button type="submit" class="btn btn-default">취소</button>
						</div>
					</div>
				</form>
			</div>
		</div>
	</div>
</body>
</html>