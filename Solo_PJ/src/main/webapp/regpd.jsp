<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "product.Product" %>
<%@ page import = "product.ProductDAO" %>
<%@ page import = "java.util.ArrayList" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조  -->
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
	<link rel="stylesheet" href="css/style_join.css">
	<link rel="stylesheet" href="https://unpkg.com/aos@2.3.1/dist/aos.css">
	<script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script> 
<title> jsp 게시판 웹사이트</title>
</head>
<body>
	<jsp:include page="head.jsp"/>
	<%
	//로그인 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		ProductDAO ppDAO = new ProductDAO();
		String pdName = null;
		String rgId = null;
		int pdPrice = 0;
		String pdPic = null;
		String pdExp = null;
		String pdCate = null;
		
		ArrayList<Product> plist = ppDAO.SpInfoList(userID);
		
		for(int i=0; i<plist.size(); i++){
			if(userID.equals(plist.get(i).getRgId())){
				pdName = plist.get(i).getPdName();
				rgId = plist.get(i).getRgId();
				pdPrice = plist.get(i).getPdPrice();
				pdPic = plist.get(i).getPdPic();
				pdExp = plist.get(i).getPdExp();
				pdCate = plist.get(i).getPdCate();
			}
		}
	%>
	<div class="container">
	<div data-aos = "fade-left">
		<div class="input-form-backgroud row">
		      <div class="input-form col-md-12 mx-auto" style="max-width:480px;">
		        <h3 class="mb-2">상품 등록</h3>
		        <form class="validation-form" novalidate method="post" action="regpdAction.jsp">
		          <div class="row">
		            <div class="mb-3">
		              <label for="pdName">상품명</label>
		              <input type="text" class="form-control" name="pdName" placeholder="상품명" value="" required>
		              <div class="invalid-feedback">
		                상품명를 입력해주세요.
		              </div>
		            </div>
		            <br><br><br>
		            <div class="mb-3">
		              <label for="rgId">등록자 ID</label>
		              <input type="text" class="form-control" name="rgId" placeholder="<%=rgId %>" value="<%=rgId %>" readonly>
		            </div>
		          </div>
					<div class="mb-3">
		            <label for="pdPrice">가격</label>
		            <input type="number" class="form-control" name="pdPrice" placeholder="가격을 입력해주세요" required>
		            <div class="invalid-feedback">
		              가격을 입력해주세요.
		            </div>
		          </div>
		          <div class="mb-3">
		            <label for="pdPic">사진파일</label>
  						<input type="file" class="form-control" name="pdPic" value="" onchange="javascript:document.getElementById('pdPic').value = this.value" required>
		            <div class="invalid-feedback">
		            	사진파일을 넣어주세요
		            </div>
		          </div>
		          <div class="mb-3">
		            <label for="pdExp">간단 설명</label>
		            <textarea class="form-control" name="pdExp" rows="3" placeholder="간단한 작품 설명을 입력해주세요"></textarea>
		          </div>
		           <div class="col-md-4 mb-3">
		            	<label for="pdCate">카테고리</label><br>
			              <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="A" required>
							  <label class="form-check-label" for="inlineRadio1">악세사리</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="B" required>
							  <label class="form-check-label" for="inlineRadio2">술, 전통주</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="C" required>
							  <label class="form-check-label" for="inlineRadio2">도자기</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="D" required>
							  <label class="form-check-label" for="inlineRadio2">생활용품</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="E" required>
							  <label class="form-check-label" for="inlineRadio2">디저트</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="F" required>
							  <label class="form-check-label" for="inlineRadio2">음식</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="G" required>
							  <label class="form-check-label" for="inlineRadio2">옷</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="pdCate"  value="H" required>
							  <label class="form-check-label" for="inlineRadio2">향수, 디퓨저</label>
							</div>
		            </div>
		          <hr class="mb-4">
		          <div class="mb-4"></div>
		          <div class="d-grid gap-2 d-md-flex justify-content-md-end">
		          <button class="btn btn-outline-primary" type="submit">상품 등록하기</button>
		          </div>
		        </form>
		      </div>
		    </div>
		</div>
	</div>
	<script>
		AOS.init();
	</script>
	<script>
    window.addEventListener('load', () => {
      const forms = document.getElementsByClassName('validation-form');

      Array.prototype.filter.call(forms, (form) => {
        form.addEventListener('submit', function (event) {
          if (form.checkValidity() === false) {
            event.preventDefault();
            event.stopPropagation();
          }

          form.classList.add('was-validated');
        }, false);
      });
    }, false);
  </script>
	<jsp:include page="footer.jsp"/>
</body>
</html>