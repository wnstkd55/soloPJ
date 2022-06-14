<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.Enumeration" %>
<%@ page import="java.util.ArrayList"%>
<%@ page import = "cart.Cart"%>
<%@ page import = "user.UserDAO" %>

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
<link rel="stylesheet" href="css/style_cart.css">
<title>CMM</title>
</head>
<body>
	<jsp:include page="head.jsp" flush="false"/>
	<% 
		//로긴 한사람이면 userID라는 변수에 해당 아이디가 담기고 그렇지 않으면 null값
		String userID = null;
		if (session.getAttribute("userID") != null) {
			userID = (String) session.getAttribute("userID");
		}
	%>
	<%
		ArrayList<Cart> cartlist = null;
		Object obj = session.getAttribute("cart");
		
		if(obj == null){
			cartlist = new ArrayList<Cart>();
		}else{
			cartlist=(ArrayList<Cart>)obj;
		}
		
	%>
	<br> 		
	<div class = "cart">
		<div class = "container" style = "background-color : #f8f9fa;">	
			<h3><%=userID %>의 장바구니</h3>
			<table style="margin-left: auto; margin-right: auto; width:1000px; margig-bottom: 20px;">
			    <thead>
			    <tr>
			    	<th>번호</th>
			        <th>작품 사진</th>
			        <th>작품이름</th>
			        <th>작가</th>
			        <th>단가</th>
			        <th>갯수</th>
			        <th>가격</th>
			    </tr>
			    </thead>
			    <tbody>
			    <%
						if(cartlist.size() == 0) {
				%>
			    <tr>
			        <td colspan="5">
			        	장바구니에 담긴 상품이 없습니다.
			        	<a href="pbbs.jsp"></a>
			        </td>
			    </tr>
			    <% 
					}else{
						int totalSum = 0, total = 0;
						for(int i=0; i<cartlist.size(); i++){
							Cart cart = cartlist.get(i);	
						
			    %>
			    <tr>
				    <td><%=(i+1)%></td>
				    <td><img src="<%=cart.getPdPic() %>" style="width:100px; height:100px;"></td>
				    <td><%=cart.getPdName() %></td>
				    <td><%=cart.getRgId() %></td>
				    <td><%=cart.getPdPrice() %></td>
				    <td><%=cart.getPdAmount() %></td>
				    <%
				    	total=cart.getPdPrice() * cart.getPdAmount();
				    %>
				    <td><%=total %>
			    </tr>
			    <%			
			    			totalSum+=total;
						}	//for
			    %>
			    <tr align = 'center'>
					<td colspan= '4'>
						<input type='button' value='결제하기' onclick='fnPay()' />
						<input type='button' value='장바구니 비우기' onclick='fnClear()' />
						<input type='button' value='쇼핑 계속하기' onclick='fnGo()' />
					</td>
					<td colspan='3'>
						<span style="font-weight: bold; font-size:18px;">총 가격 : <%= totalSum %></span>
					</td>
				</tr>
				<%
					}
				%>
			    </tbody>
			</table>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp" flush="false"/>
	
	<script>
	function fnPay(){
		alert("결제 기능을 지원하지 않습니다.");
	}

	function fnClear(){
		if(confirm("장바구니를 비우시겠습니까?")) {
			location.href = "cartclear.jsp";	
		}
	}

	function fnGo(){
		location.href = "pbbs.jsp";
	}
	</script>
</body>
</html>