<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	<meta http-equiv="X-UA-Compatible" content="IE=edge"/>
	<meta name="viewport" content="width=device-width, initial-scale=1"/>
	<title>Insert title here</title>
	<link rel="stylesheet" href="../../resources/css/css1/bootstrap.min.css"/>
	<link rel="stylesheet" href="../../resources/css/css1/erp1.css"/>
	<script src="../../resources/js/jquery.min.js"></script>
	<script src="../../resources/js/bootstrap.min.js"></script>
	<style>
		.vertical_sub th{
			background-color: bisque;
		}
		
	</style>
	
</head>

<body>
	<div class="container-fluid">
		<div class="row">
			<div class="col-md-12 panel panel-defaul">
				<div class="page-header">
					<h3 class="text-center">
						상품 재고 관리
					</h3>
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
			<div class="col-md-8 col-md-offset-1">
				<div class="page-header text-center">
					<h3>내 매장 정보</h3>
				</div>
				<div class="row">
					<div class="col-xs-6 col-xs-offset-3 col-sm-offset-1 col-sm-3">
						<div class="panel panel-default">
							<div class="panel-body" style="width:100%; height:200px"></div>
							<div class="panel-footer">
								매장 관리자
							</div>
						</div>
					</div>
					<div class="col-xs-12 col-sm-offset-2 col-sm-5 text-center">
						<table class="table table-bordered vertical_sub">
							<tr>
								<th>매장 이름</th>
								<td>한빛 신촌점</td>
							</tr>
							<tr>
								<th>점장</th>
								<td>홍길동</td>
							</tr>

						</table>
					</div>
				</div>

				<div class="col-sm-offset-3 col-sm-6 text-center">
					<table class="table table-bordered vertical_sub">
						<tr>
							<th>창업일</th>
							<td>내용</td>
						</tr>
						<tr>
							<th>매장 주소</th>
							<td>내용</td>
						</tr>
						<tr>
							<th>매장 연락처</th>
							<td>내용</td>
						</tr>
						<tr>
							<th>연락처</th>
							<td>내용</td>
						</tr>
						<tr>
							<th>상주 직원</th>
							<td>내용</td>
						</tr>
						<tr>
							<th>계약 기간</th>
							<td>내용</td>
						</tr>
					</table>
				</div>
				<div class="row">
					<div class="col-sm-offset-2 col-sm-8">
						<div class="panel panel-default">
							<div class="panel-body text-center">
								<h3>찾아오시는 길</h3>
								<div id="map" style="width: 100% ;height: 400px; background-color: grey"></div>
							</div>
						</div>
					</div>
				</div>
				<script type="text/javascript" src="//apis.daum.net/maps/maps3.js?apikey=bc7bee6c8358cef4afe487743aa9470c"></script>
				<script>
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new daum.maps.LatLng(37.554687, 126.936674), //지도의 중심좌표.
						level: 3 //지도의 레벨(확대, 축소 정도)
					};

					var map = new daum.maps.Map(container, options); //지도 생성 및 객체 리턴

					// 마커가 표시될 위치입니다 
					var markerPosition = new daum.maps.LatLng(37.554687, 126.936674);
					// 마커를 생성합니다
					var marker = new daum.maps.Marker({
						position: markerPosition
					});
					// 마커가 지도 위에 표시되도록 설정합니다
					marker.setMap(map);
				</script>
			</div>
		</div>
	</div>

</body>

</html>