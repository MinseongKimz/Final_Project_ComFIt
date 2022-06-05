<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>non_user_main.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="/css/bootstrap.css">
<script type="text/javascript" src="/js/bootstrap.js"></script>
 

<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.content
	{
		margin-top: 3%;
		margin-left: 17%; 
		margin-right: 17%;
	}
	
	.category
	{
		padding-top: 3%;
	}
	
	.pd_list
	{
		padding-top: 3%;
	}
	

</style>
</head>




<body>

<div>
	<!-- Header 영역 -->
	<div>
		<c:import url="comfit_header.jsp"></c:import>
	</div>
	
	
	<!-- Content 영역 -->
	<div class="content">
	
		<!-- 카테고리 -->
		<div class="category">
			<div>
				<span style="font-size:30pt;">카테고리</span>
			</div>
			
			<div style="margin-left: 20%; margin-right: 20%s">
			<!-- 페이징 처리 -->
			<button type="button" class="btn btn-primary">◀ prev</button>
			<button type="button" class="btn btn-light">그래픽카드</button>
			<button type="button" class="btn btn-light">SSD</button>  
			<button type="button" class="btn btn-light">CPU</button>   
			<button type="button" class="btn btn-light">HDD</button> 
			<button type="button" class="btn btn-light">모니터</button>
			<button type="button" class="btn btn-light">키보드</button>   
			<button type="button" class="btn btn-light">마우스</button>   
			<button type="button" class="btn btn-primary">next ▶</button>
			<br />
			</div>
			<!-- 페이징 -->
			<div style="margin-left: 40%; margin-right: 40%;">
				<span style="color:blue;">●</span>
				<span style="color:gray;">●</span>
				<span style="color:gray;">●</span>
				<span style="color:gray;">●</span>
			</div>
								
			
		</div>
		
		<!-- 최근 등록 상품 -->
		<div class="pd_list new">
			<div>
				<span style="font-size: 30pt;">최근 등록 상품</span>
			</div>
			<div  style="margin-left: 85%; margint-bottom:3%">	
				<button type="button" class="btn btn-primary">전체보기</button>
			</div>
			<table class="table">
				<tr>
					<th>
						<img alt="" src="images/graphicCard.jpg" style="width: 150px; height:150px;"><br />
						상품명  <br />
						가격 
					</th>
					<th>
						<img alt="" src="images/HDD.jpg" style="width: 150px; height:150px;">	<br />
						상품명 <br />
						가격
					</th>
					<th>
						<img alt="" src="images/keyboard.png" style="width: 150px; height:150px;">	<br />
						상품명 <br />
						가격
					</th>
					<th>
						<img alt="" src="images/monitor.jpg" style="width: 150px; height:150px;">	<br />
						상품명 <br />
						가격
					</th>
					<th>
						<img alt="" src="images/ssd.jpg" style="width: 150px; height:150px;">	<br />
						상품명 <br />
						가격
					</th>
				</tr>
			</table>
		
		
		</div>
		
		<!-- 인기 상품 -->
		<div class="pd_list hot">
			<div>
				<span style="font-size: 30pt;">인기 상품</span>
			</div>
			<div  style="margin-left: 85%; margint-bottom:3%">	
				<button type="button" class="btn btn-primary">전체보기</button>
			</div>		
			<table class="table">
			<tr>
				<th>
					<img alt="" src="images/graphicCard.jpg" style="width: 150px; height:150px;"><br />
					상품명 <br />
					가격
				</th>
				<th>
					<img alt="" src="images/HDD.jpg" style="width: 150px; height:150px;">	<br />
					상품명 <br />
					가격
				</th>
				<th>
					<img alt="" src="images/keyboard.png" style="width: 150px; height:150px;">	<br />
					상품명 <br />
					가격
				</th>
				<th>
					<img alt="" src="images/monitor.jpg" style="width: 150px; height:150px;">	<br />
					상품명 <br />
					가격
				</th>
				<th>
					<img alt="" src="images/ssd.jpg" style="width: 150px; height:150px;">	<br />
					상품명 <br />
					가격
				</th>
			</tr>
			</table>
		</div>
	</div>
	
	
	<!-- Footer 영역 -->
	<div class="footer">
	</div>
	
</div>



</body>
</html>