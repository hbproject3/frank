 function initialize() {

        /*
				http://openapi.map.naver.com/api/geocode.php?key=f32441ebcd3cc9de474f8081df1e54e3&encoding=euc-kr&coord=LatLng&query=서울특별시 강남구 강남대로 456
                위의 링크에서 뒤에 주소를 적으면 x,y 값을 구할수 있습니다.
			*/
        var Y_point = 37.555299 // Y 좌표
        var X_point = 126.932926; // X 좌표

        var zoomLevel = 16; // 지도의 확대 레벨 : 숫자가 클수록 확대정도가 큼

        var markerTitle = "위즈소프트"; // 현재 위치 마커에 마우스를 오버을때 나타나는 정보
        var markerMaxWidth = 300; // 마커를 클릭했을때 나타나는 말풍선의 최대 크기

        // 말풍선 내용
        var contentString = '<div>' +
            '<h2>위즈소프트</h2>' +
            '<p>위즈소프트는 WEB Agency & SI 분야에서 10년 이상의 풍부한 경험을 보유한<br />' +
            '전문 인력으로 구성된 E-Business 전문 기업입니다.</p>' +
            //'<a href="http://www.daegu.go.kr" target="_blank">http://www.daegu.go.kr</a>'+ //링크도 넣을 수 있음
            '</div>';

        var myLatlng = new google.maps.LatLng(Y_point, X_point);
        var mapOptions = {
            zoom: zoomLevel,
            center: myLatlng,
            mapTypeId: google.maps.MapTypeId.ROADMAP
        }
        var map = new google.maps.Map(document.getElementById('map_view'), mapOptions);

        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: markerTitle
        });

        var infowindow = new google.maps.InfoWindow({
            content: contentString,
            maxWidth: markerMaxWidth
        });

        google.maps.event.addListener(marker, 'click', function() {
            infowindow.open(map, marker);
        })
    }


 $(document).scroll(function() { /*head-img*/
        if ($(document).scrollTop() >= 30) {
            $(".headline").fadeOut("slow");
        } else {
            $(".headline").fadeIn("slow");
        }
    });


    $(document).ready(function() { /* food-icon*/
        $(".food-icon").hide();
        $(document).scroll(function() {
            console.log($(document).scrollTop());
            if ($(document).scrollTop() >= 1350 && $(document).scrollTop() < 1600) {
                $(".food-icon").fadeIn("slow");
            }
            /*else if ($(document).scrollTop() >= 2000 || $(document).scrollTop() < 1350) {
                           $(".food-icon").fadeOut("slow");
                       }*/
        });
    })

function buger(a) {
        if ($('.img-overflow').hasClass('gray') && !$(a).hasClass('gray')) {
            $(a).css("transform", "scale(1.0)");
            $('.img-overflow').removeClass("gray");
        } else {
            $('.img-overflow').addClass("gray");
            $(a).removeClass("gray");
            $('.img-overflow').css("transform", "scale(1.0)");
            $(a).css("transform", "scale(1.4)");

        }
    }

    $(document).ready(function() {
        $('.menu-detaile').hide();
        $('.img-overflow').click(function() {
            buger(this);

            if ($(this).hasClass('m1')) {
                $('.menu-detaile').fadeOut();
                $('.buger1').fadeToggle("slow");
            } else if ($(this).hasClass('m2')) {
                $('.menu-detaile').fadeOut("slow");
                $('.buger2').fadeToggle();
            } else if ($(this).hasClass('m3')) {
                $('.menu-detaile').hide();
                $('.buger3').fadeToggle("slow");
            } else if ($(this).hasClass('m4')) {
                $('.menu-detaile').hide();
                $('.buger4').fadeToggle("slow");
             } else if ($(this).hasClass('d1')) {
                $('.menu-detaile').hide();
                $('.dog1').fadeToggle("slow");
            } else if ($(this).hasClass('d2')) {
                $('.menu-detaile').hide();
                $('.dog2').fadeToggle("slow");
            } else if ($(this).hasClass('d3')) {
                $('.menu-detaile').hide();
                $('.dog3').fadeToggle("slow");
            } else if ($(this).hasClass('d4')) {
                $('.menu-detaile').hide();
                $('.dog4').fadeToggle("slow");
            } else if ($(this).hasClass('s1')) {
                $('.menu-detaile').hide();
                $('.sl1').fadeToggle("slow");
            } else if ($(this).hasClass('s2')) {
                $('.menu-detaile').hide();
                $('.sl2').fadeToggle("slow");
            } else if ($(this).hasClass('s3')) {
                $('.menu-detaile').hide();
                $('.sl3').fadeToggle("slow");
            }  else if ($(this).hasClass('s4')) {
                $('.menu-detaile').hide();
                $('.sl4').fadeToggle("slow");
            }  else if ($(this).hasClass('b1')) {
                $('.menu-detaile').hide();
                $('.be1').fadeToggle("slow");
            }  else if ($(this).hasClass('b2')) {
                $('.menu-detaile').hide();
                $('.be2').fadeToggle("slow");
            }  else if ($(this).hasClass('b3')) {
                $('.menu-detaile').hide();
                $('.be3').fadeToggle("slow");
            } else if ($(this).hasClass('b4')) {
                $('.menu-detaile').hide();
                $('.be4').fadeToggle("slow");
            } 

        });
    });


