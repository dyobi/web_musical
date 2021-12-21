<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="shortcut icon" href="#">
    <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7bd3589ba719de55eabf7d4a70eb077d"></script>

    <style>
        html, body {
            height: 100%;

            margin: 0;
            padding: 0;
        }

        #bgi {
            background-size: cover;
            background-image: url("img/background.png");
            background-position: center;
            min-height: 85%;
            border: 0;
            padding: 0;
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: center;
            flex-wrap: wrap;
            padding: 100px 80px;
        }

        #map {
            width: 500px;
            height: 400px;
            border-radius: 1%;
            -webkit-box-shadow: 0 0 18px #fff;
            box-shadow: 0 0 18px #fff;
            margin: 20px 20px;
        }

        .info {
            width: 240px;
            height: 400px;
            margin: 20px 20px;
            color: #D5CDCC;
            line-height: 26px;

            font-family: 'Barlow', sans-serif;
            font-size: 18px;
            font-weight: 300;
        }

        .subway_icon {
            width: 40px;
            margin: 4px;
        }

    </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <div id="map"></div>
        <div class="info">
            <h2>Direction</h2>
            서울시 종로구<br>
            돈화문로 26 단성사 3층<br><br>
            3th floor, 26<br> Donhwamun-ro<br>
            Jongro-gu<br> Seoul, KOREA<br><br>
            TEL. 02-3672-6900<br><br>
            <div>
                <img class="subway_icon" src="img/line1.png" alt="">
                <img class="subway_icon" src="img/line3.png" alt="">
                <img class="subway_icon" src="img/line5.png" alt="">
            </div>
        </div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
<script>
    var mapContainer = document.getElementById("map"),
        mapOption = {
            center: new kakao.maps.LatLng(37.5710213, 126.9928249),
            level: 3
        };
    var map = new kakao.maps.Map(mapContainer, mapOption);
    var markerPosition = new kakao.maps.LatLng(37.5710213, 126.9928249);
    var marker = new kakao.maps.Marker({
        position: markerPosition
    });

    marker.setMap(map);
    marker.setDraggable(true);
</script>
</html>