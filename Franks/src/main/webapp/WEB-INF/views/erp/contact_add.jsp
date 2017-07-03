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
		<h1 class="text-center "><strong>문의사항</strong></h1>
		<br/>
		<div class="panel panel-info">
			<div class="panel-heading">
				<h5 class="text-center">글쓰기</h5>
			</div>
			<div class="panel-body">
				<form method="post"  modelAttribute="hashmap">
					<label for="name">이름</label>
					<input class="form-control" type="text" name="name" id="name" placeholder="이름을 쓰세요"/>
					<label for="sub">전화번호</label>
					<input class="form-control" type="text" name="phone" id="phone" placeholder="전화번호를 쓰세요"/>
					<label for="narea">창업지역</label>
					<input class="form-control" type="text" name="narea" id="narea" placeholder="" />
					<label for="ntype"></label>
					<select name="ntype" id="ntype" class="form-control">
						<option value="푸드트럭">푸드트럭</option>
						<option value="가게">가게</option>
					</select>
					<label for="nsize"></label>
					<select name="nsize" id="nsize" class="form-control">
						<option value="대규모">대규모</option>
						<option value="중규모">중규모</option>
						<option value="소규모">소규모</option>
					</select>
					<label for=""></label>
					<input class="form-control" type="text" name="" id="" placeholder="" /><label for=""></label>
					<input class="form-control" type="text" name="" id="" placeholder="" />

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
