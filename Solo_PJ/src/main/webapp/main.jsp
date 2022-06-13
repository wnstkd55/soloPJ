<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ page import="java.io.PrintWriter"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css"> 
<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<link rel="stylesheet" href="../css/style.css">
<title>jsp 게시판 웹사이트</title>		
</head>
<body>
	<jsp:include page = "head.jsp" flush = "false"/>
	<br>
	<div class = "main">
	<div data-aos="zoom-in">
		<div class="container">
			<div class = "img_slide">
				<div id="carouselExampleFade" class="carousel slide carousel-fade" data-bs-ride="carousel">
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="./images/board_banner.png" class="d-block w-100" alt="...">
				    </div>
				    <div class="carousel-item">
				      <img src="./images/slide_img3_u.png" class="d-block w-100" alt="...">
				    </div>
				    
				  </div>
				  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="prev">
				    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Previous</span>
				  </button>
				  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade" data-bs-slide="next">
				    <span class="carousel-control-next-icon" aria-hidden="true"></span>
				    <span class="visually-hidden">Next</span>
				  </button>
				</div>
			</div>
			<div class = "sbb" style = "margin-top:10px;">
				<div class="row mb-2" style="margin-left:5%;">
				    <div class="col-md-6" style = "max-width : 500px; margin-right:10px;">
				      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-primary">새로나온 작품</strong>
				          <h3 class="mb-0">작품소개</h3>
				          <div class="mb-1 text-muted">작가명</div>
				          <p class="card-text mb-auto">작품 소개 및 설명</p>
				          <a href="#" class="stretched-link">자세히 보기</a>
				        </div>
				        <div class="col-auto d-none d-lg-block">
				          <img class="bd-placeholder-img" width="200" height="250" src="./images/product/p10.jpg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/>
				        </div>
				      </div>
				    </div>
				    <div class="col-md-6" style = "max-width : 500px;">
				      <div class="row g-0 border rounded overflow-hidden flex-md-row mb-4 shadow-sm h-md-250 position-relative">
				        <div class="col p-4 d-flex flex-column position-static">
				          <strong class="d-inline-block mb-2 text-success">작품자랑하기</strong>
				          <h3 class="mb-0">작품 이름</h3>
				          <div class="mb-1 text-muted">작가명</div>
				          <p class="mb-auto">작품 소개 및 설명</p>
				          <a href="#" class="stretched-link">자세히 보기</a>
				        </div>
				        <div class="col-auto d-none d-lg-block">
							<img class="bd-placeholder-img" width="200" height="250" src="./images/product/p11.jpg" role="img" aria-label="Placeholder: Thumbnail" preserveAspectRatio="xMidYMid slice" focusable="false"><rect width="100%" height="100%"/>
				        </div>
				      </div>
				    </div>
				 </div>
			 </div>
		</div>
		</div>
	</div>
	<script>
		AOS.init();
	</script>
	<jsp:include page = "footer.jsp" flush="false" />
</body>
</html>