<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="shortcut icon" href="#">
    <meta charset="UTF-8">
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

        @media screen and (min-width: 1300px) {
            .container {
                padding: 80px;
            }

            .pic {
                width: 200px;
                height: 200px;
                padding: 20px;
            }
        }

        @media screen and (min-width: 1200px) and (max-width: 1299px) {
            .container {
                padding: 80px;
            }

            .pic {
                width: 200px;
                height: 200px;
                padding: 20px;
            }
        }

        @media screen and (min-width: 1100px) and (max-width: 1199px) {
            .container {
                padding: 80px;
            }

            .pic {
                width: 180px;
                height: 180px;
                padding: 18px;
            }
        }

        @media screen and (min-width: 1000px) and (max-width: 1099px) {
            .container {
                padding: 80px;
            }

            .pic {
                width: 160px;
                height: 160px;
                padding: 16px;
            }
        }

        @media screen and (max-width: 999px) {
            .container {
                padding: 60px;
            }

            .pic {
                width: 130px;
                height: 130px;
                padding: 14px;
            }
        }

        .container {
            display: flex;
            flex-direction: row;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .pic {
            display: inline-block;
            border-radius: 50%;

            cursor: pointer;

            object-fit: cover;
            -webkit-user-drag: none;
        }

        .pic_opacity {
            opacity: 0.7;
            transition: opacity 0.3s ease-in;
        }

        .container img:hover {
            opacity: 1;
        }

        #info {
            display: flex;
            flex-direction: column;
            align-items: center;

            color: white;
            font-family: 'Barlow', sans-serif;
            font-size: 18px;
            line-height: 28px;
            font-weight: 200;

            margin-bottom: 80px;
        }
    </style>
    <script>
        var curr = 0;

        const getInfo = (i) => {
            if (curr === i) {
                document.getElementById("info").outerHTML =
                    "<div id=\"info\"><h2>Hello, welcome to мюзикл</h2><br>"
                    +"<div>Here are descriptions about each performers<br></div>"
                    +"<div>Just click any of pictures :)</div></div>";
                document.getElementById("pic" + i.toString()).className = "pic pic_opacity";
                curr = 0;
            } else {
                if (curr !== 0) {
                    document.getElementById("pic" + curr.toString()).className = "pic pic_opacity";
                } if (i === 1) {
                    curr = 1;
                    document.getElementById("info").outerHTML =
                        "<div id=\"info\"><h3>Kylie</h3><br>"
                        +"<div>Kylie is a psychologist, academic and introvert.<br></div>"
                        +"<div>She is a member of hiking class in the Blue Mountains in New South Wales<br></div>"
                        +"<div>and you wouldn't have guessed she was an introvert if you meet her there.<br></div>"
                        +"<div>She loves socialising and sparks with energy during conversation,<br></div>"
                        +"<div>but she says if she overdoes it, she feels<br></div>"
                        +"<div>exhausted and can experience headaches.</div></div>";

                    document.getElementById("pic1").className = "pic";
                } else if (i === 2) {
                    curr = 2;
                    document.getElementById("info").outerHTML =
                        "<div id=\"info\"><h3>Adam</h3><br>"
                        +"<div>When the world is in the middle of pandemic chaos what<br></div>"
                        +"<div>you really need is some strategies to unwind<br></div>"
                        +"<div>And that is the reason why Adam Willson, 32, has turn his life<br></div>"
                        +"<div>to vegetable gardening as the chaos rages on.<br></div>"
                        +"<div>The Wollongong-based frontline worker has spent his day off<br></div>"
                        +"<div>during the cooler months growing vegetables like carrots and peas<br></div>"
                        +"<div>Now that spring is coming up Adam's checking the garden<br></div>"
                        +"<div>to favour spring vegetables.</div></div>";

                    document.getElementById("pic2").className = "pic";
                } else if (i === 3) {
                    curr = 3;
                    document.getElementById("info").outerHTML =
                        "<div id=\"info\"><h3>Julie</h3><br>"
                        +"<div>Julie has been to about 20 different countries in her life.<br></div>"
                        +"<div>She sees travel as the thing that makes her happy and feel most alive.<br></div>"
                        +"<div>But since the pandemic started and state and international borders<br></div>"
                        +"<div>were closed for almost 2 years, this 25-year-old young lady <br></div>"
                        +"<div>has decided that she can no longer spend her life like this <br></div>"
                        +"<div>She is now away from her home in Melbourne to seek her freedom.</div></div>";
                    document.getElementById("pic3").className = "pic";
                } else if (i === 4) {
                    curr = 4;
                    document.getElementById("info").outerHTML =
                        "<div id=\"info\"><h3>Paul</h3><br>"
                        +"<div>When Paul was asked to share the moments that made him happy <br></div>"
                        +"<div>and laugh during covid lockdown, he started to frown and racking his brain.<br></div>"
                        +"<div>Would he be able to think of three things that made him happy and laugh during lockdown?<br></div>"
                        +"<div>Or could he even think of just one moment?<br></div>"
                        +"<div>In fact, has he ever laughed before in his entire life?<br></div>"
                        +"<div>He quietly whispered... I don't remember.</div></div>";

                    document.getElementById("pic4").className = "pic";
                }
            }
        };
    </script>
</head>
<body>
<jsp:include page="header.jsp"/>
<div id="bgi">
    <div class="container">
        <img id="pic1" class="pic pic_opacity" src="img/person1.jpg" alt="" onclick="getInfo(1)">
        <img id="pic2" class="pic pic_opacity" src="img/person2.jpg" alt="" onclick="getInfo(2)">
        <img id="pic3" class="pic pic_opacity" src="img/person3.jpg" alt="" onclick="getInfo(3)">
        <img id="pic4" class="pic pic_opacity" src="img/person4.jpg" alt="" onclick="getInfo(4)">
    </div>
    <div id="info">
        <h2>Hello, welcome to мюзикл</h2><br>
        <div>Here are descriptions about each performers<br></div>
        <div>Just click any of pictures :)</div>
    </div>
</div>
<jsp:include page="footer.jsp"/>
</body>
</html>