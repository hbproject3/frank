<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!doctype html>

<html>
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>사이트</title>
    <script src="resources/js2/jq-1.js"></script>
    <script type="text/javascript" src="resources/js2/bootstrap.min.js"></script>
    <!--4.0-->
    <!--jquery  BX CSS JS & 머테리얼 -->
    <script type="text/javascript" src="resources/js2/jquery.bxslider.min.js"></script>
    <script type="text/javascript" src="resources/js2/materialize.min.js"></script>
    <link type="text/css" href="resources/css2/jquery.bxslider.min.css" rel="stylesheet">
    <link type="text/css" href="resources/css2/materialize.min.css" rel="stylesheet">
    <!--jquery  BX CSS JS & 머테리얼 -->
    <link rel="stylesheet" href="resources/css2/bg-1.css">
    <!--grid-->
    <link rel="stylesheet" href="resources/css2/bs-2.css">
    <!--bootst-->
    <link type="text/css" href="resources/css2/mainpage.css" rel="stylesheet">
    <!--페이지 본문-->
    <script type="text/javascript" src="resources/js2/menu.js"></script>
    <!--Google-->
    <script src="https://maps.googleapis.com/maps/api/js?sensor=false"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            /*    $('.bxslider').bxSlider();*/
            $('.bxslider').bxSlider({
                minSlides: 4,
                maxSlides: 4,
                auto: true,
                autoControls: true,
                slideMargin: 300,
                pause: 2000
            });

        });
    </script>
    <style>
        .gray {
            -webkit-filter: grayscale(100%);
            height: 200px;
        }
    </style>
    <style>

		#info-content {
		 overflow-y: scroll;	
		}
	</style>
    <style type="text/css">

    </style>
</head>

<body>
    <div class="container-fluid">
        <div class="nav-bg" id="home">
            <div class="row hidden-md-up justify-content-center">
                <a href=""><img src="resources/imgs/pic-logo4.png" alt="" id="logo2"></a>
            </div>
            <div class="row nav-box">
                <div class="col-md-2 col-sm-2 col-2 hidden-sm-down">
                    <a href=""><img src="resources/imgs/pic-logo4.png" alt="" id="logo"></a>
                </div>
                <div class="col-md-10 col-sm-10 col-10">
                    <ul class="nav nav-pills justify-content-end">
                        <li class="nav-item">
                            <a class="nav-link" id="li" href="home">Home</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="li" href="#">Longer</a>
                        </li>

                        <li class="nav-item">
                            <a class="nav-link" id="li" href="#">Longer</a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link" id="li" href="logins/login">로그인</a>
                        </li>
                        <li class="offset-1"></li>
                    </ul>
                </div>
            </div>
        </div>
        <!--nav box row end -->
        <div class="row box1 justify-content-center">
            <div class="col-md-12 justify-content-center text-center">
                <img src="resources/imgs/full-typo-logo.png" alt="" class="img-fluid" id="head-logo-small">
            </div>
        </div>
        <div class="row text1 justify-content-center">
            <div class="col-md-6 ">
                <h3>STORY01. 독일식 소시지, 독일의 맛</h3>
                <p>미국 영화에서 맛있게 소시지와 햄버거를 먹는 모습이 많이나와서 소시지가 독일로 시작되었음을 모른다.</p>
                <p>사실은 '소시지'는 독일에서 만든 음식이며, '핫도그'는 독일의 개. '닥스훈트'의 모양새롤 보고 생긴 단어이다</p>
                <p>외국에서 산 김치가, 외국에서 만든 김치가 한국의 김치의 맛을 못 따라오듯 '소시지' 와 '핫도그'도 그러하다 </p>
                <p>재료가 하급 고기가 아닌, 식감과 맛이 살아있는 고기로 만들며 과정 또한 복잡하다.</p>
                <p>그래서 '독일 소시지'는 맛있다.</p>
                <p>해외 여행 프로그램에서 본 통통하고 빛나는 그 소시지- 그 맛을 한국에서, 그리고 '프랑크 아저씨네 핫도그'에서는 맛볼 수 있다!</p>
                <p class="text-right">-Frank Hotdog-</p>
            </div>
        </div>
        <!-- header intus end-->
   
    <div class="row text-center text03 ">
        <div class="row justify-content-center">
            <div class="col-md-1 col-sm-1 col-1">
                <img src="resources/imgs/icon/120-quotes-left.png" alt="">
            </div>
            <div class="col-md-7 col-sm-auto col0-9">
                <h2 id="h2-1">프랑크 핫도그. 특별하다. 맛있다.</h2>
            </div>
            <div class="col-md-1 col-sm-1 col">
                <img src="resources/imgs/icon/121-quotes-right.png" alt="">
            </div>
            <div class="col-md-12 text-left text03-in ">
                <div class="row justify-content-center">
                    <p>소시지의 고장 독일에서 최고로 손꼽히는 '소시지'를 독일 전통 조리법으로 수제로 제조합니다.</p>
                    <p>당일 제조. 당일 판매를 원칙으로 신선하고 특별한 핫도그 & 버거를 선보입니다.</p>
                </div>
            </div>
        </div>
    </div>
     </div>
    <div class="container-fluid circle">
        <!--row end-->
        <div class="row justify-content-center text-center icons">
            <!--icons-->
            <div class="row justify-content-center">
                <!--추가 정렬 및 클래스 title jus-->
                <div class="col-md-10 col-8 col-md-8">
                    <img src="resources/imgs/icon/why.png" class="icons-title" alt="">
                </div>
            </div>
            <!--	<div class="col-md-12">
				<div class="row justify-content-center">-->
            <div class="row justify-content-center icons-in">
                <div class="col-md-4 col-sm-4 col-6">
                    <img src="resources/imgs/icon/067-phone.png" alt="">
                    <h3>친절한 상담</h3>
                    <p>이익을 위한 상담이 아닌 부담없는 창업비용과 경영 노하우까지 가르쳐주는 친절한 상담을 해드립니다.</p>
                </div>
                <div class="col-md-4 col-sm-4 col-6">
                    <img src="resources/imgs/icon/226-smile.png" alt="">
                    <h3>만족 하는 맛</h3>
                    <p>통통하고 깊은맛이 있는 독일식 소시지에 다양한 소스를 취향에 따라 고를 수 있습니다.</p>
                </div>
                <div class="col-md-4 col-sm-4 col-6">
                    <img src="resources/imgs/icon/219-heart.png" alt="">
                    <h3>건강을 생각한 맛</h3>
                    <p>패스트 푸드에 부족한 영양소를 양상추, 양배추, 블랙 올리브 등 다양한 야채로 채워줍니다.</p>
                </div>
                <!--	</div>
			</div>-->
                <!--<div class="col-md-12">
				<div class="row justify-content-center">-->
                <div class="col-md-4 col-sm-4 col-6 ">
                    <img src="resources/imgs/icon/073-location2.png" alt="">
                    <h3>좋은 위치</h3>
                    <p>주변 상가, 유동 인구, 나이&성별 비율에 등 과학적인 데이터를 바탕으로 위치 선정에 도움을 드립니다.</p>
                </div>
                <div class="col-md-4 col-sm-4 col-6">
                    <img src="resources/imgs/icon/115-users.png" alt="">
                    <h3>가족같은 관계</h3>
                    <p>창업 단계, 창업 이후에 생기는 어려움에 대해서 전폭적인 지원과 조언을 해드립니다.</p>
                </div>
                <div class="col-md-4 col-sm-4 col-6">
                    <img src="resources/imgs/icon/158-stats-bars2.png" alt="">
                    <h3>보장된 수익</h3>
                    <p>특별한 맛으로 고정적인 고객층 확보하여 고정된 수입을 보장해드립니다.</p>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid">
        <div class="box2-bg">
            <div class=" box2 row justify-content-center">
                <div class="row justify-content-center text-center">
                    <div class="col-sm-5">
                        <img src="resources/imgs/historytitle.png" alt="" id="history-title">
                    </div>
                    <div class="col-12 col-md-12 col-sm-12">
                        <div class="row justify-content-center text-center">
                            <div class="col-md-4 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-image">
                                        <img src="resources/imgs/1.png">
                                    </div>
                                    <div class="card-content" id="info-content">
                                        <h3 class="text-center">소시지의 본 고장. <br>맛을 배우다</h3>
                                        <p>힐링 여행으로 처음가게 된 독일에서 맛 본 소시지 너무 맛있었고 '만들고 싶다!'라는 의지가 생겨 제조법을 배우게 되어 독일 번화가에 작은 노점상으로 시작하였습니다. 독일 소시지를 살린 메뉴를 개발하여 본 고장 사람들도 찾는 유명한 맛집으로 번창. </p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4 col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-image">
                                        <img src="resources/imgs/2.png">
                                    </div>
                                    <div class="card-content text-left" id="info-content">
                                        <h3>돌아온 학국, 보여주고 싶다.</h3>
                                        <p>다른 나라로 사업을 시작한다는 건 실패시 엄청난 손해를 봅니다.하지만 이 맛 이라면 한국에서도 성공 할 수 있다는 자신감이 있기에 당차게 서울로 올라와 종로구의 작은 가게에서 1호점을 열게 되었습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-4  col-sm-12 col-12">
                                <div class="card">
                                    <div class="card-image">
                                        <img src="resources/imgs/3.png">
                                    </div>
                                    <div class="card-content" id="info-content">
                                        <h3>성공. 역시 맛은 통한다.</h3>
                                        <p>하루 50명. 한달 후 100명 3달 후 줄서는 맛집으로 되었습니다<br>자연스레 프랑크 핫도그의 맛을 가게를 내고 싶다는 연락이 오기 시작하여 한구의 20개의 핵심 도시에서 기본 50개의 점포를 갖고 있는 큰 기업.이 되었습니다.</p>
                                    </div>
                                </div>
                            </div>
                            <p style="color:#393a3f;">프랑크 아저씨의 도전기 end</p>
                        </div>
                        <!--  </div>
                        <div class="col-4 col-md-3">
                            <img src="resources/imgs/hot/05.jpg" alt="" class="img-thumbnail">
                            <p>Lorem ipsum.</p>
                            <p>Lorem ipsum dolor sit.</p>
                        </div>
                        <div class="col-4 col-md-3">
                            <img src="resources/imgs/hot/06.jpg" alt="" class="img-thumbnail">
                            <p>Lorem ipsum.</p>
                            <p>Lorem ipsum dolor sit.</p>
                        </div>
                        <div class="col-4 col-md-3">
                            <img src="resources/imgs/hot/03.jpg" alt="" class="img-thumbnail">
                            <p>Lorem ipsum.</p>
                            <p>Lorem ipsum dolor sit.</p>
                        </div>-->
                    </div>

                </div>
            </div>
            <!--end -->
            <div class="row history">
                <div class="col-sm-12 history">
                </div>
            </div>
            <div class="row history-02">
                <div class="col-sm-12">

                </div>
            </div>
            <!--box3 end-->
            <div class="row justify-content-center">
                <div class="col-11 col-md-11 col-sm-11 ">
                    <div class="row justify-content-center">
                        <div class="col-sm-8 col-7 col-md-4">
                            <img src="resources/imgs/menulist.png" alt="" id="list-logo">
                        </div>
                    </div>
                    <!--menu hambeger-->
                    <div class="row justify-content-center">
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow m1">
                                <img src="resources/imgs/hotdog/bug01.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SauarCheeseBuger</p>
                                <p>사우어 치즈 버거</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow m2">
                                <img src="resources/imgs/hotdog/bug06.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>소시앤 불고기 버거</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-4 col-sm-4">
                            <div class="img-overflow m4">
                                <img src="resources/imgs/hotdog/bug02.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>소시앤 불고기 버거</p>

                            </div>
                        </div>
                        <!--메뉴 상세-->
                        <!--1-->
                        <div class="col-md-10 text-center menu-detaile buger1">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--2-->
                        <div class="col-md-10 text-center menu-detaile buger2">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--3-->
                        <div class="col-md-10 text-center menu-detaile buger3">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--4-->
                        <div class="col-md-12 text-center menu-detaile buger4">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--메뉴 상세-->
                    </div>
                    <!-- 햇도그 row-->

                    <!--menu hambeger-->
                    <div class="row justify-content-center">
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow d2">
                                <img src="resources/imgs/hotdog/dog2.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>소시앤 핫도그</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow d3">
                                <img src="resources/imgs/hotdog/dog5.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>불고기 핫도그</p>

                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow d4">
                                <img src="resources/imgs/hotdog/dog3.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>피클 핫도그</p>

                            </div>
                        </div>
                        <!--메뉴 상세-->
                        <!--1-->
                        <div class="col-md-12 text-center menu-detaile dog1">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--2-->
                        <div class="col-md-12 text-center menu-detaile dog2">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--3-->
                        <div class="col-md-12 text-center menu-detaile dog3">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--4-->
                        <div class="col-md-12 text-center menu-detaile dog4">
                            <p><strong>-</strong>SosianBulgogiBuger<strong>-</strong></p>
                            <hr id="under">
                            <p>독일식 삭힌 야채와 소시시를 넣어 아삭아삭한 식감과 고급스러운 맛과 진한 체다치즈를 넣어 깊은 치즈의 향이 일품인 프리미엄 핫도그 입니다.</p>
                            <p>단품 : 4500won 세트 : 7000won ＊칼로리 : 900kal ＊ 추천 : 단짠 단짠을 좋아하는 분!
                            </p>
                        </div>
                        <!--메뉴 상세-->
                    </div>
                    <!--row-->
                    <div class="row justify-content-center drink">
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow s1">
                                <img src="resources/imgs/suv/sl1.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-title text-center">
                                <p>SauarCheeseBuger</p>
                                <p>흑맥주 수무디</p>
                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow s3">
                                <img src="resources/imgs/suv/sl3.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>홍초 스무디</p>

                            </div>
                        </div>
                        <div class="col-md-3 col-sm-4 col-4">
                            <div class="img-overflow s4">
                                <img src="resources/imgs/suv/sl4.png" id="foodfodd" alt="">
                            </div>
                            <div class="menu-text text-center">
                                <p>SosianBulgogiBuger</p>
                                <p>타로 스무디</p>

                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!--menu row end-->
            <div class="container-fluid">
                <div class="row justify-content-center">
                    <div class="col-md-4 col-6 col-sm-5 text-center">
                        <img src="resources/imgs/icon/1.png" alt="" id="s01">
                    </div>
                </div>
                <div class="row justify-content-center" id="sources-img">
                    <div class="col-md-9 col-sm-10 hidden-sm-down">
                        <img src="resources/imgs/icon/sources.png" alt="" id="s02">
                    </div>
                </div>
                <div class="row justify-content-center">
                    <div class="col-sm-11 col-11 hidden-md-up ">
                        <img src="resources/imgs/icon/sources-small.png" alt="" id="s03">
                    </div>
                </div>
                <div class="row justify-content-center text-center " id="source-inputs">
                    <div class="input-field col-sm-10 col-md-7 col-10 justify-content-center">
                        <input id="last_name" type="text" class="validate" value="수제 케첩의 레시피를 사용하여 새콤달콤한 맛" readonly>
                        <label for="last_name">KECHAP</label>
                    </div>
                    <div class="input-field col-sm-10 col-md-7 col-10 justify-content-center">
                        <input id="last_name" type="text" class="validate" value="머스타드의 매콤함과 벌꿀의 달콤함을 동시에!" readonly>
                        <label for="last_name">Honey meoseu</label>
                    </div>
                    <div class="input-field col-sm-10 col-md-7 col-10 justify-content-center">
                        <input id="last_name" type="text" class="validate" value="체다 치즈의 깊고 잔한 맛" readonly>
                        <label for="last_name">cheese</label>
                    </div>
                    <div class="input-field col-sm-10 col-md-7 col-10 justify-content-center">
                        <input id="last_name" type="text" class="validate" value="화끈 달달 칠리 칠리" readonly>
                        <label for="last_name">Chili</label>
                    </div>
                    <div class="input-field col-sm-10 col-md-7 col-10 justify-content-center">
                        <input id="last_name" type="text" class="validate" value="마늘향과 달콤한 간장으로 만든 깔끔한 소스" readonly>
                        <label for="last_name">BBQ</label>
                    </div>
                    <div class="col-sm-12 col-md-12">
                        <div class="row justify-content-center">
                            <div class="col-md-9">
                            </div>
                            <div class="col-md-9">

                            </div>
                        </div>
                    </div>
                </div>
                <!--contaier source end-->
                <div class="row justify-content-center qna-list">
                    <!--table-->
                    <div class="col-md-3 text-center align-self-center">
                        <img src="resources/imgs/clogo.png" alt="" id="qna-logo">
                    </div>
                    <div class="col-md-9 col-sm-9 col-12">
                        <table class="table table-sm">
                            <thead>
                                <tr>
                                    <th>#</th>
                                    <th>First Name</th>
                                    <th>Last Name</th>
                                    <th>Username</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <th scope="row">1</th>
                                    <td>Mark</td>
                                    <td>Otto</td>
                                    <td>@mdo</td>
                                </tr>
                                <tr>
                                    <th scope="row">2</th>
                                    <td>Jacob</td>
                                    <td>Thornton</td>
                                    <td>@fat</td>
                                </tr>
                                <tr>
                                    <th scope="row">3</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                                <tr>
                                    <th scope="row">4</th>
                                    <td colspan="2">Larry the Bird</td>
                                    <td>@twitter</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <!--table box end-->
                    <div class="col-12 col-md-12 col-sm-12 text-center">
                        <button type="button" class="btn btn-primary">Primary</button>
                        <button type="button" class="btn btn-primary">Primary</button>
                    </div>
                </div>

                <!--tabel end-->
                <div class="container-fluid">
                    <div class="row justify-content-center text-center hidden-md-up">
                        <ul class="bxslider">
                            <li>
                                <a href=""><img src="resources/imgs/icon/6.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/5.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/4.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/3.png" alt=""></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <div class="container">
                    <div class="row justify-content-center text-center hidden-sm-down">
                        <ul class="bxslider">
                            <li>
                                <a href=""><img src="resources/imgs/icon/6.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/5.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/4.png" alt=""></a>
                            </li>
                            <li>
                                <a href=""><img src="resources/imgs/icon/3.png" alt=""></a>
                            </li>
                        </ul>
                    </div>
                </div>
                <!--bx contaier-->
                <div class="container-fluid call-box" id="call">
                    <div class="row justify-content-center" id="contact">
                        <img src="resources/imgs/icon/contact.png" alt="">
                    </div>
                    <div class="row justify-content-center">
                        <div class="col-md-7 col-sm-10 col-10 ">
                            <ul>
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <li><label for="name">이름</label></li>
                                        <input type="name" class="form-control" id="name" placeholder="이름을 입력해주세요">
                                    </div>
                                    <div class="form-group col-md-6">
                                        <li><label for="name">연락처</label></li>
                                        <input type="name" class="form-control" id="number" placeholder="연락처">
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <li><label name="contact-type">매장 타입</label></li>
                                        <select class="form-control" name="contact-type" id="contact-type" placeholder="매장 타입 선택">
					<option value="매장형">매장형</option>
					<option value="트럭형">트럭형</option>
					<option value="미정">미정</option>
					</select>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <li><label for="location">지역 선택</label></li>
                                        <select class="form-control" name="location" id="location">
					<option value="서울">서울 특별시</option>
					<option value="부산">부산 광역시</option>
					<option value="광주">광주 광역시</option>
					<option value="기타">기타</option>
					</select>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-sm-6 form-group">
                                        <li><label for="orderMaterail">창업 규모</label></li>
                                        <select class="form-control" name="scale" id="scale">
					<option value="7">7평</option>
					<option value="15">15평</option>
					<option value="20">20평</option>
					</select>
                                    </div>
                                    <div class="col-sm-6 form-group">
                                        <li><label for="orderMaterail">질의 타입</label></li>
                                        <select class="form-control" name="qna" id="qna">
					<option value="ketchup">창업 비용</option>
					<option value="cheese">상권 분석</option>
					</select>
                                    </div>
                                </div>
                                <div class="row">
                                    <li><label for="qna-text" id="qna-text">자세한 내용</label></li>
                                    <textarea class="form-control" rows="10" name="qna-text" id="qna-text"></textarea>
                                </div>
                            </ul>
                        </div>
                        <!--picturn-->
                        <div class="col-md-3 call hidden-sm-down ">
                            <div class="hidden-md-down">
                                <img src="resources/imgs/bullun.png" alt="" id="b">
                            </div>
                        </div>
                        <!--picturn-->
                    </div>
                </div>
                <!--call container end-->
                <div class="card">
                    <div class="card-content text-center">
                       <div class="card-bg">
                        <img src="resources/imgs/icon/why.png" class="col-sm-8 col-md-3 col-8" id="store" alt="">
                        <h4>예상 비용 및 점포 정보</h4>
                        <p>간단하며 빠르게 점포에 대해서 알 수 있습니다.</p>
                        </div>
                    </div>
                    <div class="card-tabs">
                        <ul class="tabs tabs-fixed-width">
                            <li class="tab"><a href="#test4">예상 견적&매장사진</a></li>
                            <li class="tab"><a class="active" href="#test5">점포 후기</a></li>
                            <li class="tab"><a href="#test6">오시는 길</a></li>
                        </ul>
                    </div>
                    <div class="card-content grey lighten-4">
                        <div id="test4">
                            <div class="card-block text-center ">
                                <div>
                                    <img src="resources/imgs/store01.png" alt="" class="col-sm-12 col-12 col-md-8">
                                </div>
                                <p>평수에 가격 상이함.<br>
                                빠른 점포 문의 : 02-1234-22234
                                </p>
                            </div>
                        </div>
                        <div id="test5">
                            <div class="row justify-content-center">
                                <div class="card horizontal col-md-7 ">
                                    <div class="card-image">
                                       
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content">
                                           <h5>한빛 1호점 점장</h5>
                                            <p>다른 핫도그 가맹점 보다 저렴한 가맹비 교교육비가 이점 이였고, 무엇보다 '프랑크 핫도그'가 제일 맛있었습니다~</p>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">서울특별시 마포구 상암동 363-1길 1호점</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card horizontal col-md-7">
                                    <div class="card-image">
                                       
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content">
                                           <h5>한빛 2호점 점장</h5>
                                            <p>사후 지원이 꾸준하고, 교육때 말하신 것처럼 꾸준한 수입이 들어와서 좋습니다 ..^^</p>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">부산광역시 해운대구 255-3 해운대 1호점</a>
                                        </div>
                                    </div>
                                </div>
                                <div class="card horizontal col-md-7">
                                    <div class="card-image">
                                    </div>
                                    <div class="card-stacked">
                                        <div class="card-content">
                                           <h5>한빛 3호점 점장</h5>
                                            <p>번화가라 다른 핫도그 프랜차이즈점이 많아서 입점 위치를 추천하셔서 걱정했지만, 맛과 서비스로 승부하니 '신촌'에서도 끄떡 없습니다!</p>
                                        </div>
                                        <div class="card-action">
                                            <a href="#">서울특별시 서대문구 신촌동 225-1 신촌로3호점</a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div id="test6">
                            <div class="row map">
                                <div class="col-md-6 map-img">
                                    <div id="map_view" style="width:100%; height:500px;">
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <p>오시는 길</p>
                                    <p>(주)FrankHotdog</p>
                                    <p>서울특별시 마포구 노고산동 54-27</p>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="card-bg text-center" style="height:200px;">
                       <p> -Frank`s Hot Dog-</p>
                    </div>
                </div>
                <!--tab end-->
                <div class="row footer text-center align-self-center">
                    <div class="col-md-12">
                        <h3>Frank Hot Hotdog</h3>
                        <p>CEO : Fank.Watson.J</p>
                        <p>서울특별시 서대문구 신촌동 373-2 대성타운 5층</p>
                        map <span>│</span>call<span>│</span>storinfo<span>│</span> service
                        <p><img src="resources/imgs/icon/sns-icon.png" id="sns" alt=""></p>
                    </div>
                    <p></p>
                    <div class="col-md-12">

                    </div>
                    <div class="col-md-12">
                        <div class="row justify-content-center">
                            <div class="col-md-auto align-self-center copy">
                                azzi@frank.co.org @copyrighter FrankHotdog Company.lnc.All.rights resolved
                            </div>
                        </div>
                    </div>
                </div>
         
            </div>
        </div>
    </div>
    <div class="row">
        <div class="fixed-action-btn horizontal click-to-toggle">
            <a class="btn-floating btn-large red">
                <i class="material-icons">★</i>
            </a>
            <ul>
                <li><a class="btn-floating red" href="#nav-bg"><i class="material-icons">↑</i></a></li>
                <li><a class="btn-floating yellow darken-1"><i class="material-icons">?</i></a></li>
                <li><a class="btn-floating green"><i class="material-icons">#</i></a></li>
                <li><a class="btn-floating blue"><i class="material-icons">#</i></a></li>
            </ul>
        </div>
    </div>
    <!--Container -->
</body>

</html>
