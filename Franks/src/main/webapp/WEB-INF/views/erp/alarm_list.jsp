<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<head>
	<meta charset="utf-8">
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<link rel="stylesheet" href="../resources/css/css1/bootstrap.min.css"/>
	<link rel="stylesheet" href="../resources/css/css1/erp1.css"/>
	<script src="../resources/js/jquery.min.js"></script>
	<script src="../resources/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		$('document').ready(function() {
			$('li.active a').click(function(event) {
				return false;
			});
		});
	</script>
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 panel panel-defaul">
				<div class="page-header">
					<h3 class="text-center">
						알람
					<hr>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<h3>
					사이드 바
				</h3>
			</div>
			<div class="col-md-8">
			
				<!-- 게시판 시작 -->
				
				<form id="lookback" method="post">
					<input type="hidden" name="list" value="back">
				</form>
				<h2 class="text-center" id="point"><strong><a href="" onclick="$('#lookback').submit(); return false;">알림 목록</a></strong></h2>
				<div class="panel panel-default">
					<div class="panel-body">
						<div class="table-responsive">
							<table class="table table-hover">
								<thead>
									<tr class="info">
										<th>알림번호</th>
										<th>선택</th>
										<th>제목</th>
										<th>발신날짜</th>
										<th>수신날짜</th>
										<th>알림확인여부</th>
									</tr>
								</thead>
								<tbody>
									<C:forEach items="${alist }" var="alarm">
										<tr>
											<td>${alarm.ANUM }</td>
											<td><input type="checkbox" name="checkbox"></td>
											<td><a href="./detail/${alarm.ANUM }">${alarm.ASUB }</a></td>
											<td><fmt:formatDate value="${alarm.ASDATE}" pattern="yyyy.MM.dd"/></td>
											<td><fmt:formatDate value="${alarm.ARDATE}" pattern="yyyy.MM.dd"/></td>
											<C:if test="${alarm.ACHK == 1 }">
											<td>확인</td>
											</C:if>
											<C:if test="${alarm.ACHK == 0 }">
											<td>미확인</td>
											</C:if>
										</tr>
									</C:forEach>									
								</tbody>
							</table>
						</div>
					</div>
				</div>	
				<div class="row">
					<div class="text-center col-sm-offset-3 col-sm-6">
						<nav>
							<ul class="pagination">
								<C:if test="${colCnt > 1}">
									<li>
										<a href="${prevPg }" aria-label="Previous">
											<span aria-hidden="true">이전</span>
										</a>
									</li>
								</C:if>
								<C:forEach items="${links }" var="link">
									<C:choose>
										<C:when test="${idx == link }">
											<li class="active"><a href="#point" >${link} </a></li>								
										</C:when>
										<C:otherwise>
											<li><a href="./${link}" >${link} </a></li>	
										</C:otherwise>
									</C:choose>
								</C:forEach>
								<C:if test="${colCnt < maxCol }">	
									<li>
										<a href="${nextPg }" aria-label="Next">
											<span aria-hidden="true">다음</span>
										</a>
									</li>
								</C:if>
							</ul>
						</nav>
						
						<br>
					</div>
					<div class="col-sm-2 text-right">
						<br>
						<a href="./add" class="btn btn-primary" role="button">쓰기</a>
					</div> 
				</div>
				<div class="text-center">
					<br/>
					<form method="POST" class="form-inline" >
						<div class="form-group">
							<label for="search_text">검색할 단어</label>
							<input type="text" class="form-control" name="search_text" value="${sess_text}" />
						</div>
						<div class="form-group">
							<select name="search_type" class="form-control">
								<C:if test="${sess_type.equals(\"sub\") }">
								<option value="sub"  selected >제목</option>
								</C:if>
								<C:if test="${!sess_type.equals(\"sub\") }">
								<option value="sub">제목</option>
								</C:if>
								 <C:if test="${sess_type.equals(\"cntnt\") }">
								<option value="cntnt" selected >내용</option>
								</C:if>
								 <C:if test="${!sess_type.equals(\"cntnt\") }">
								<option value="cntnt">내용</option>
								</C:if>
							</select>
						</div>
						<button class="btn btn-primary" type="submit">검색</button>
					</form>
				</div>
				<!-- 게시판 끝 -->
			
			</div>
		</div>
	</div>

</body>

</html>