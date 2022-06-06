<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_search_product.jsp</title>
<link rel="stylesheet" type="text/css" href="css/user_search_product.css">
<style type="text/css">
	
	.title
	{
		font-size: 25pt;
		font-weight: bold;
		margin-left: 25%;
		margin-top:10%;
	}
	.input_text
	{
		margin-left:25%;
		width: 200pt;
		font-size:15pt;
		height:30pt;
		border-radius:5px;
		
	}
	.btn1
	{
		background-color:#B2D7FC;
		text-align:center;
		border-radius:5px;
		width:150px;
		height:30pt;
	
	}
	.btn
	{
		text-align:center;
		border-radius:5px;
		width:150px;
		height:30pt;
	}
	.btn:hover,.btn1:hover
	{
		background:black;
		color:white;
	}
	.chucheon
	{
		margin-left:25%;
	}
	.describe
	{
		margin-left:25%;
		font-weight: bolder;
	}
</style>
</head>
<body>

<div class="subheader">
	<p class="title">물품 검색</p>
</div>

<div class="outer">
	<form action="">
		<div>
			<input type = "text" class="input_text" name="input_text" placeholder="물품을 입력하세요"/>
			<button class="btn1">검색하기</button>
			<button class="btn" type="reset">지우기</button>
			<button class="btn">찾는 물건 없음</button>
		</div>
	</form>
	<div>
		<h3 class="chucheon">Comfit 추천 중고 가격은 test원 입니다.</h3>
	</div>
	<div class="describe">
		가격은 참고용이며 절대적이지 않습니다.<br>
		제품명을 정확히 적으면 정확도가 올라갑니다.
	</div>
</div>

</body>
</html>