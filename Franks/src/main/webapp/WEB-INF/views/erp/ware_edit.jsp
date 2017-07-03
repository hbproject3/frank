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
			<h2 class="text-center"><strong>제품 수정</strong></h2>
			<div class="panel panel-info">
				<div class="panel-heading">
					<h5>제품 정보</h5>
				</div>
				<div class="panel-body">
					<form method="post">
						<div class="row">
							<div class="col-sm-6 form-group">
								<label for="name">제품 이름</label>
								<input type="text" class="form-control" name="name" id="name" value="${detail.WNAME}">
							</div>
							<div class="col-sm-6 form-group">
								<label for="type">타입</label>
								<select name="type" class="form-control" id="type">
								<c:foreach items="${types}" var="type">
									<c:if test="${detail.WTYPE.equals(type.WTYPE)}">
										<option value="${type.WTYPE}" selected>${type.WTYPE}</option>
									</c:if>
									<option value="${type.WTYPE}">${type.WTYPE}</option>
								</c:foreach>	
								</select>
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