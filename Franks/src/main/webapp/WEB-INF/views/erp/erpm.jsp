<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" >
   <!-- 모바일용웹 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<!-- 안드로이드 홈화면추가시 상단 주소창 제거 -->
<meta name="mobile-web-app-capable" content="yes">
<!-- ios홈화면추가시 상단 주소창 제거 -->
<meta name="apple-mobile-web-app-capable" content="yes">

<title>Frank ERP</title>
<script src="https://code.jquery.com/jquery-1.12.4.min.js" integrity="sha256-ZosEbRLbNQzLpnKIkEdrPv7lOy9C27hHQ+Xp8a4MxAQ=" crossorigin="anonymous"></script>
</head>
<body>


           <!-- 왼쪽부분 aside -->
            <div class="col-lg-3 aside">
                <div class="myinfo">
                	<p></p>
                </div>
                <div class="msg hidden-md-down"> 수신메시지 </div>
                <div class="ntc hidden-md-down"> 알림 </div>
            </div>            
            <!-- aside 끝 -->
            
            <!-- 오른쪽 section 부분 -->
            <div class="col-lg-9 section">
                <!-- 오른쪽 상단 배너 -->              
                <div class="banner hidden-md-down"> banner </div>
                <!-- 오른쪽 중간 매장정보 부분 -->                
                <div class="shopinfo">
                    <!-- 매장정보 tabs -->
                    <ul class="nav nav-tabs" role="tablist">
                        <li class="si_name">매장 정보</li>
                        <li role="presentation" class="active"><a href="#home" aria-controls="home" role="tab" data-toggle="tab">기본 정보</a></li>
                        <li role="presentation"><a href="#profile" aria-controls="profile" role="tab" data-toggle="tab">매출 현황</a></li>
                        <li role="presentation"><a href="#messages" aria-controls="messages" role="tab" data-toggle="tab">재고 현황</a></li>
                    </ul>
                    <!-- Tab관련 내용 -->
                    <div class="tab-content">
                        <div role="tabpanel" class="tab-pane active" id="home">home <br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/>a<br/></div>
                        <div role="tabpanel" class="tab-pane" id="profile">1</div>
                        <div role="tabpanel" class="tab-pane" id="messages">2</div>
                    </div>
                </div>
                <div class="row pannel">
                <!-- 공지사항 부분 -->
                <div class="notice col-lg-6">
                	<div class="notice-header"><img src="../resources/imgs/m1.png" class="li-style1">공지사항<img class="more" src="../resources/imgs/more.png"></div>
                	<div class="notice-cont">
                		<ul>
                			<li>1</li>
                			<li>2</li>
                			<li>3</li>
                			<li>4</li>
                			<li>5</li>
                			<li>6</li>
                		</ul>
                	</div>
                </div>
                <!-- 주문상태 부분 -->
                <div class="transfer col-lg-6">
                	<div class="transfer-header"><img src="../resources/imgs/m2.png" class="li-style2">주문정보<img class="more" src="../resources/imgs/more.png"></div>
                	<div class="transfer-cont">
                		<ul>
                			<li>1</li>
                			<li>2</li>
                			<li>3</li>
                			<li>4</li>
                			<li>5</li>
                			<li>6</li>
                		</ul>
                	</div>
                </div>
                </div>
            </div>
            <script type="text/javascript">
                $('#myTabs>li>a').click(function(e) {
                    e.preventDefault()
                    $(this).tab('show')
                });

            </script>
</body>
</html>