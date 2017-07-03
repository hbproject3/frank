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
		<div class="panel panel-default">
			<div class="panel-heading">
				<h5>재고 수정</h5>
			</div>
			<div class="panel-body">
				<form method="post">
					<div class="row">
						<div class="col-sm-6 form-group">
							<label for="store_name">점포 이름</label>
							<select name="store_name" id="store_name">
								<c:foreach items=${store_list} var="store">
									<c:if test="${store.FNUM==detail.FNUM}">
									<option value="${store.FNUM}" selected>${store.FNAME}</option>
									</c:if>
									<option value="${store.FNUM}">${store.FNAME}</option>
								</c:foreach>
							</select>
						</div>	
						<div class="col-sm-6 form-group">
							<label for="ware_name">제품 종류</label>
							<select name="ware_name" id="ware_name">
								<c:foreach items=${ware_list} var="ware">
									<c:if test="${ware.WNUM==detail.WNUM}">
									<option value="${ware.WNUM}" selected>${ware.WNAME}</option>
									</c:if>
									<option value="${ware.WNUM}">${ware.WNAME}</option>
								</c:foreach>
							</select>
						</div>	
					</div>	
					<label for="now">현재 재고</label>
					<input type="text" name="now" class="form-control" value="${detail.NOWSTOCK}" />
					<label for="in">들어온 재고</label>
					<input type="text" name="in" class="form-control" value="${detail.INSTOCK}" />
					<label for="out">나간 재고</label>
					<input type="text" name="out" class="form-control" value="${detail.OUTSTOCK}" />
					<br/>
					<br/>
					<button type="submit" class="btn btn-info" role="button">수정</button>
					<button type="reset" class="btn btn-info" role="button">취소</button>
					<a href="../list/" class="btn btn-primary" role="button" id="list">목록</a>
					<a href="../delete/${idx }" class="btn btn-danger" role="button">삭제</a>
				</form>				
			</div>
		</div>
	</div>


</body>

</html>