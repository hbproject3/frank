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
		<div class="row content container-fluid">
			<h2 class="text-center"><strong>점포 수정</strong></h2>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h5>점포 정보</h5>
				</div>
				<div class="panel-body">
					<form method="post">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="name">점포 이름</label>
								<input type="text" class="form-control" name="name" id="name" value="${list.FNAME}">
							</div>
							<div class="col-sm-6 form-group">
								<label for="phone">전화번호</label>
								<input type="text" name="phone" id="phone" class="form-control" value="${list.FPHONE}">
							</div>
							<div class="col-sm-6 form-group">
								<label for="address">주소</label>
								<input type="text" name="address" id="address" class="form-control" value="${list.FADDRESS}">
							</div>
							<br/>
							<br/>
							<button type="submit" class="btn btn-info" role="button">수정</button>
							<button type="reset" class="btn btn-info" role="button">취소</button>
							<a href="../list/" class="btn btn-primary" role="button" id="list">목록</a>
							<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
						</div>	
					</form>				
				</div>	
			</div>
		</div>
	</div>	
</body>

</html>