<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <link rel="shortcut icon" href="#">
  <title>Insert title here</title>
  <style>
    @import url('https://fonts.googleapis.com/css2?family=Shadows+Into+Light&display=swap');

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

    #video {
      margin: 20px 20px;
    }

    .title_main{
      margin: auto;
      width: 50%;
      display:flex;
      flex-direction: column;
      align-items: center;

      color: white;
      font-family: 'Shadows Into Light', cursive;
      line-height: 48px;
      font-weight: 300;
    }

    .desc {
      display: flex;
      flex-direction: column;
      align-items: center;

      color: white;
      font-family: 'Barlow', sans-serif;
      font-size: 18px;
      line-height: 28px;
      font-weight: 200;
    }

    @media screen and (min-width: 1100px) {
      #video, video {
        width: 800px;
        height: 600px;
      }

      .title_main {
        font-size: 80px;
      }

      .desc {
        width: 800px;
      }
    }

    @media screen and (min-width: 1000px) and (max-width: 1099px) {
      #video, video {
        width: 760px;
        height: 570px;
      }

      .title_main {
        font-size: 70px;
      }

      .desc {
        width: 760px;
      }
    }

    @media screen and (min-width: 865px) and (max-width: 999px) {
      #video, video {
         width: 720px;
         height: 540px;
       }

      .title_main {
        font-size: 60px;
      }

      .desc {
        width: 720px;
      }
    }

    @media screen and (min-width: 750px) and (max-width: 864px) {
      #video, video {
        width: 640px;
        height: 480px;
      }

      .title_main {
        font-size: 50px;
      }

      .desc {
        width: 640px;
      }
    }

    @media screen and (max-width: 749px) {
      #video, video {
        width: 520px;
        height: 390px;
      }

      .title_main {
        font-size: 42px;
      }

      .desc {
        width: 520px;
      }
    }
  </style>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
  <div class="container">
    <div class="title_main">
      THE PANDEMIC
    </div>
    <figure>
      <div id="video">
        <video loop="true" muted autoplay="autoplay">
          <source src="video/covid.mp4" type="video/mp4">
        </video>
      </div>
      <div class="desc">
        <figcaption>
          <h3>Synopsis</h3>
          One of the words that defined 2020, 20201 is pandemic<br>
          - it literally affected every single human & and even non-human beings as well.<br>
          The pandemic has changed how we work, learn and interact as social distancing<br>
          guidelines have led to a more virtual existence, both personally and professionally.<br>
          Here, four young people living in different regions are looking for ways to overcome the<br>
          effects of the corona virus on them in their own way<br>
        </figcaption>
      </div>
    </figure>
  </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>
