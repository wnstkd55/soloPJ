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
		UserDAO userDAO = new UserDAO();
		
		String pdPic = (String)request.getParameter("pdpic");
		String pdName = (String)request.getParameter("pdname");
		ArrayList<String> productlist = (ArrayList<String>)session.getAttribute("ArrayList");
		String pdPrice = (String)(request.getParameter("pdprice"));
		String rgId = (String)request.getParameter("rgId");
		if(productlist==null){ //만약 productlist가 널값이면
		       productlist = new ArrayList<String>(); //ArrayList를 만들어줌
		    }
	   productlist.add(pdPic); //productlist에 값을 넣어준다.
       productlist.add(pdName); 
       productlist.add(pdPrice);
       productlist.add(rgId);
       
       session.setAttribute("ArrayList", productlist); //ArrayList 세션에 productlist를 넣어줌 
     
		
	%>
	<br> 		
	<div class = "cart">
		<div class = "container" style = "background-color : #f8f9fa;">	
			<h3><%=userID %>의 장바구니</h3>
			<table style="margin-left: auto; margin-right: auto; width:900px; margig-bottom: 20px;">
			    <thead>
			    <tr>
			        <th colspan="2">사진</th>
			        <th>작품이름</th>
			        <th>작가</th>
			        <th>가격</th>
			        <th>갯수</th>
			    </tr>
			    </thead>
			    <tbody>
			    <tr>
			        <td><img src="./images/product/<%=pdPic %>" width=100px height=100></td>
			        <td></td>
			        <td><%=pdName %></td>
			        <td><%=rgId %></td>
			        <td><%=pdPrice %></td>
			    </tr>
			    </tbody>
			</table>
		</div>
		
	</div>
	
	<jsp:include page="footer.jsp" flush="false"/>
</body>
</html>