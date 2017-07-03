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

			<h3>제품 추가</h3>
		</div>
		<div class="well">
			<form method="post">
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="name">제품 이름</label>
						<input type="text" name="name" class="form-control" />
					</div>
					<div class="col-sm-6 form-group">
						<label for="type">제품 타입</label>
						<select name="type">
							<option value="0">메인 메뉴 재료</option>
							<option value="1">비품</option>
							<option value="2">사이드 메뉴 재료</option>
						</select>
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