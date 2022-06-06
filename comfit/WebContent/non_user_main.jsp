<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>non_user_main.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

    <style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .input-group
      {
      	width: 50%;
      	margin-left: 14px;
      	
      }
      #sellBtn
      {
      	width: 200px;
      }
      #dropdown-item
      {
      	width: 200px;
      }
    </style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>
 

<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.content
	{
		margin-top: 3%;
		margin-left: 15%; 
		margin-right: 15%;
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