<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/meyer-reset/2.0/reset.min.css">
 <script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/3.4.1/jquery.min.js'></script>
<link rel="stylesheet" href="css/style_head2.css">
<script src="js/script.js"></script>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body translate="no" >
  <ul id="nav-1"> 
    <li class="slide1"></li>         
    <li class="slide2"></li>
    <li><a href="#/">Alpha</a></li>
    <li><a href="#/">Beta</a></li>
    <li><a href="#/">Gamma</a></li>
    <li><a href="#/">Delta</a></li>
    <li><a href="#/">Epsilon</a></li>
</ul>

  
      <script id="rendered-js" >
$("#nav-1 a").on("click", function () {
  var position = $(this).
  parent().position();
  var width = $(this).
  parent().width();
  $("#nav-1 .slide1").css({ opacity: 1, left: +position.left, width: width });
});

$("#nav-1 a").on("mouseover", function () {
  var position = $(this).
  parent().position();
  var width = $(this).
  parent().width();
  $("#nav-1 .slide2").css({
    opacity: 1, left: +position.left, width: width }).
  addClass("squeeze");
});

$("#nav-1 a").on("mouseout", function () {
  $("#nav-1 .slide2").css({ opacity: 0 }).removeClass("squeeze");
});

var currentWidth = $("#nav-1").
find("li:nth-of-type(3) a").
parent("li").
width();
var current = $("li:nth-of-type(3) a").position();
$("#nav-1 .slide1").css({ left: +current.left, width: currentWidth });
    </script>

</body>
</html>