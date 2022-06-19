<%@ page import="javax.security.auth.callback.ConfirmationCallback"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.io.PrintWriter"%>
<%@ page import="product.ProductDAO"%>
<%@ page import="product.Product"%>
<%@ page import="java.util.ArrayList"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 뷰포트 -->
<meta name="viewport" content="width=device-width" initial-scale="1">
<!-- 스타일시트 참조 -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src='https://cdnjs.cloudflare.com/ajax/libs/jquery/2.1.3/jquery.min.js'></script>
<link rel="stylesheet" href="javascript/jquery-1.12.3.js">
<link rel="stylesheet" href="css/style_pview.css">
<title>CMM</title>

</head>
<body>
	<%
		//로긴한 사람이라면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
		
		int pdId= 0;
		if (request.getParameter("pdId") != null) {
			pdId = Integer.parseInt(request.getParameter("pdId"));
		}
		if (pdId == 0) {
			PrintWriter script = response.getWriter();
			script.println("<script>");
			script.println("alert('유효하지 않은 글 입니다.')");
			script.println("location.href = 'pbbs.jsp'");
			script.println("</script>");
		}
		Product product = new ProductDAO().getProduct(pdId);
		
	%>
	<jsp:include page="head.jsp"/>
	<br>
	<div class = "container">
		<div class="card mx-auto mb-3">
		  <div class="row g-0 mx-auto">
		    <div class="col-md-4">
		      <img src="./images/product/<%=product.getPdPic() %>" class="img-fluid rounded-start" alt="상품사진">
		    </div>
		    <div class="col-md-8">
		      <div class="card-body">
		        <h5 class="card-title">작품명 : <%=product.getPdName() %></h5>
		        <br>
		        <p class="card-text"><small class="text-muted">작가명 : <%=product.getRgId() %></small></p>
		        <p class="card-text">가격 : <%=product.getPdPrice() %>원</p>
		        <div class="d-grid gap-2 d-md-block justify-content-center">
				  <button class="btn btn-secondary" type="button"onclick="location.href='cart.jsp'">장바구니보러가기</button>
				  <button class="btn btn-secondary" type="button" onclick="location.href='cartPro.jsp?pdname=<%= product.getPdName()%>&pdprice=<%= product.getPdPrice()%>&rgId=<%=product.getRgId()%>&pdpic=<%=product.getPdPic()%>'">
				  장바구니에담기</button>
				  <button class="btn btn-secondary" type="button" onclick="location.href='pbbs.jsp'">목록으로돌아가기</button>
				</div>
		      </div>
		    </div>
		  </div>
		</div>
		<div class = "container">	
		<div class = "preview col-md-12 mx-auto" style = "max-width:800px;">
			<ul class="nav nav-tabs" id="myTab" role="tablist">
		  		<li class="nav-item" role="presentation">
		    	<button class="nav-link active" id="home-tab" data-bs-toggle="tab" data-bs-target="#home" type="button" role="tab" aria-controls="home" aria-selected="true">간단 설명</button>
		  	</li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="policy-tab" data-bs-toggle="tab" data-bs-target="#policy" type="button" role="tab" aria-controls="policy" aria-selected="false">배송정책</button>
			  </li>
			  <li class="nav-item" role="presentation">
			    <button class="nav-link" id="contact-tab" data-bs-toggle="tab" data-bs-target="#contact" type="button" role="tab" aria-controls="contact" aria-selected="false">Contact</button>
			  </li>
			</ul>
			<div class="tab-content" id="myTabContent">
			  <div class="tab-pane fade show active" id="home" role="tabpanel" aria-labelledby="home-tab">
			  	<%=product.getPdExp() %>
			  </div>
			  <div class="tab-pane fade" id="policy" role="tabpanel" aria-labelledby="profile-tab">
							<table>
								<tr>
									<th>배송비</th>
									<td>
										<ul >
											<li>
												기본료 :
												<em class="hilight blue">3,000원</em>
											</li>
											<li>
												배송비 무료 조건 :
												<em class="hilight blue">100,000원</em>
												<em class="txt-dim">제주, 도서산간일 경우 기본료만 무료가 됩니다.</em>
											</li>
											<li>
												제주 / 도서산간 추가비용 :
												<em class="hilight blue">4,500원</em>
											</li>
																				</ul>
									</td>
								</tr>
								<tr>
									<th>제작 / 배송</th>
									<td>
										<div class="inner">
											<em class="hilight blue">10일 이내</em> <br />
											<span class="txt-preline">주문 후 제작에 들어가는 작품입니다.
									평균8~10일후  발송됩니다.</span>
										</div>
									</td>
								</tr>
								<tr>
									<th>교환 / 환불</th>
									<td>
										<div class="inner">
											<em class="hilight blue">가능</em> <br />
											<span class="txt-preline">주문 전 판매 작가님과 연락하여 확인해주세요.</span>
										</div>
									</td>
								</tr>
							</tbody>
						</table>
						
			  </div>
			  <div class="tab-pane fade" id="contact" role="tabpanel" aria-labelledby="contact-tab">...</div>
			</div>
		</div>
		</div>
	</div>
	<jsp:include page="footer.jsp"/>
</body>
</html>