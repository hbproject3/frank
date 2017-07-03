<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
		<div class="page-header text-center">

			<h3>점포 추가</h3>
		</div>
		<div class="well">
			<form method="post">
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="fnum">점포 이름</label>
						<input type="text" name="fnum" class="form-control" />
					</div>
					<div class="col-sm-6 form-group">
						<label for="fphone">휴대폰 번호</label>
						<input type="text" name="fphone" class="form-control" />
					</div>
				</div>
				<div class="col-sm-12 form-group">
					<label for="faddress">주소</label>
					<input type="text" name="faddress" id="faddress" class="form-control">
					<div class="text-right">
						<button type="search" class="btn btn-default text-right">발송지 검색</button>
					</div>
				</div>
				
				<div class="text-center">
					<br/>
					<br/>
					<button type="submit" class="btn btn-info" role="button">추가</button>
					<button type="reset" class="btn btn-warning" role="button">취소</button>
					<a href="./" class="btn btn-primary" role="button">목록</a>
				</div>
			</form>
		</div>
	</div>

</body>

</html>