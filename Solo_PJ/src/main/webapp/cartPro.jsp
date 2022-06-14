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
		
		String pp = (String)request.getParameter("pdpic");
		String imgfile = "./images/product/";
		String pdPic = imgfile+pp;
		String pdName = (String)request.getParameter("pdname");
		int pdPrice = Integer.parseInt((request.getParameter("pdprice")));
		String rgId = (String)request.getParameter("rgId");
		
       
       int pos = -1;	//등록된 제품이 없다.
       
       for(int i =0; i<cartlist.size(); i++){
    	   Cart cart = cartlist.get(i);
    	   		if(cart.getPdName().equals(pdName)){
    	   			pos=1;
    	   			cart.setPdAmount(cart.getPdAmount()+1);
    	   			break;
    	   		}
       }
       
       if(pos == -1) {
    		Cart cart = new Cart();
    		cart.setPdPic(pdPic);
    		cart.setRgId(rgId);
    		cart.setPdName(pdName);
    		cart.setPdPrice(pdPrice);
    		cart.setPdAmount(1);
    		cartlist.add(cart);
    	}
       
       session.setAttribute("cart", cartlist);
	%>
<script>
	alert("장바구니에 담았습니다."); 
	location.href = "cart.jsp"
</script>
</body>
</html>