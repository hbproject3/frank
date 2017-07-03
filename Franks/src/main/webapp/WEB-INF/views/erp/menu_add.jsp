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

			<h3>메뉴 추가</h3>
		</div>
		<div class="well">
			<form method="post">
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="name">메뉴 이름</label>
						<input type="text" name="name" class="form-control" />
					</div>
					<div class="col-sm-6 form-group">
						<label for="price">메뉴 가격</label>
						<input type="number" name="price" class="form-control" min="0" />
					</div>
				</div>
				<label for="type">메뉴 타입</label>
				<select name="type" class="form-control">
					<option value="단품메뉴">단품메뉴</option>
					<option value="음료메뉴">음료메뉴</option>
					<option value="사이드메뉴">사이드메뉴</option>
					<option value="세트메뉴">세트메뉴</option>
				</select>
				
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