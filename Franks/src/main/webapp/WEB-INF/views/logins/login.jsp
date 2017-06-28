<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="../resources/js2/jq-1.js"></script>
<script type="text/javascript" src="../resources/js2/bootstrap.min.js"></script><!--4.0--><!--jquery-->
<link rel="stylesheet" href="../resources/css2/bs-2.css">
<style>
	*{
		margin : 0px;
		padding: 0px;
	}
	body{
		background-image: url(../resources/imgs/sosi-patturn3.png);
	}
	.login_header{
		border : gray 1px solid;
		box-sizing: border-box;
	}
	.login_cont{
		border : gray 1px solid;
		box-sizing: border-box;
		margin-top:100px;
		background-color: white;
	}
</style>
</head>
<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-3"></div>
			<div class="col-md-6 login_header">
				<h1>Frank's 핫도그 <br/> ERP 시스템 입니다.</h1>
				<p>ERP 시스템을 이용하시려면 로그인 해주세요.</p>
			</div>
		</div>
		<div class="row">
			<div class="col-md-4"></div>
			<div class="col-md-4 login_cont">
				<form action="../erp/loginck" method="post">
					<div class="row" style="margin-top:10px;">
					<div class="col-md-4 text-right">
						<label for="fid">아이디</label>
					</div>
					<div>
					<input type="text" name="fid" id="fid"/>
					</div>
					</div>
					<div class="row">
					<div class="col-md-4 text-right">
						<label for="upw">비밀번호</label>
					</div>
					<input type="password" name="upw" id="upw" />
					</div>
					<div style="text-align: center; margin:10px auto;">
						<button type="submit" style="width:80%;height:50px;">로그인</button>
					</div>
				</form>
				<span style="color:red;">a
					<c:forEach var="entry" items="${err}" varStatus="status">
						${entry.fid}
    				</c:forEach>
				</span>
				<p class="text-center"> 아이디, 패스워드 분실 시 관리자에게 문의하세요.</p>
			</div>
		</div>	
	</div>
	<!-- <div class="login_header">
	
	</div>
	<div class="login_cont">
	
	</div> -->
</body>
</html>