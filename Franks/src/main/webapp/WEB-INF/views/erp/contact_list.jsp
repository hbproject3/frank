<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="C" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<script type="text/javascript">
		$('document').ready(function() {
			$('li.active a').click(function(event) {
				return false;
			});
		});
	</script>
</head>

<body>
	<div class="col-lg-3 aside text-center">
	ㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏㅏ
	</div>
	
	<div class="col-lg-9 section text-center">
		<!-- 게시판 시작 -->
		
		<form id="lookback" method="post">
			<input type="hidden" name="list" value="back">
		</form>
		<h2 class="text-center" id="point"><strong><a href="" onclick="$('#lookback').submit(); return false;">알림 목록</a></strong></h2>
		<C:if test="${list!=null }">
		<div class="panel panel-default">
			<div class="panel-body">
				<div class="table-responsive">
					<table class="table table-hover">
						<thead>
							<tr class="info">
								<th>문의 번호</th>
								<th>문의자 이름</th>
								<th>문의자 연락처</th>
								<th>창업지역</th>
								<th>매장종류</th>
								<th>매장규모</th>
								<th>질의분야</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<C:forEach items="${list }" var="board">
								<tr>
									<td>${board.QNUM }</td>
									<td><a href="./detail/${board.QNUM }">${board.QNAME }</a></td>
									<td><a href="./detail/${board.QNUM }">${board.QPHONE }</td>
									<td><a href="./detail/${board.QNUM }">${board.QNAREA }</td>
									<td><a href="./detail/${board.QNUM }">${board.QNTYPE }</td>
									<td><a href="./detail/${board.QNUM }">${board.QNSIZE }</td>
									<td><a href="./detail/${board.QNUM }">${board.QTYPE }</td>
									<C:if test="${board.QSTATE == 0 }">
									<td><a href="./detail/${board.QNUM }">문의 대기 중</td>
									</C:if>
									<C:if test="${board.QSTATE == 1 }">
									<td><a href="./detail/${board.QNUM }">조회완료</td>
									</C:if>
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
		</C:if>
		<C:if test="${list==null }">
			<h3>내용이 없습니다.</h3>
		</C:if>	
			<div class="col-sm-2 text-right">
				<br>
				<a href="./add" class="btn btn-primary" role="button">쓰기</a>
			</div> 
		</div>
		<C:if test="${list!=null }">
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
		</C:if>		
		<!-- 게시판 끝 -->
	
	</div>
</body>

</html>