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

			<h3>재고 추가</h3>
		</div>
		<div class="well">
			<form method="post">
				<div class="row">
					<div class="col-sm-6 form-group">
						<label for="store_name">점포 이름</label>
						<select name="store_name" id="sname">
							<c:foreach items=${store_list} var="store">
								<option value="${store.fnum}">${store.fname}</option>
							</c:foreach>
						</select>
					</div>	
					<div class="col-sm-6 form-group">
						<label for="store_name">제품 종류</label>
						<select name="ware_name" id="wname">
							<c:foreach items=${ware_list} var="ware">
								<option value="${ware.wnum}">${ware.wname}</option>
							</c:foreach>
						</select>
					</div>	
					<label for="stock_num">현재 재고</label>
					<input type="text" name="stock_num" class="form-control" />
				</div>
				<div class="text-center">
					<br/>
					<br/>
					<button type="submit" class="btn btn-info" role="button">추가</button>
					<button type="reset" class="btn btn-warning" role="button">취소</button>
					<a href="../list" class="btn btn-primary" role="button">목록</a>
				</div>
			</form>
		</div>
	</div>

</body>

</html>