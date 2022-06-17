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
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<title>배송 상품 페이지.jsp</title>

<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

<style type="text/css">
p
{
	font-size: 9pt;
}
/* 내용 div */
.content
{
	padding: 4%;
}
/* 내용 안에 들어가는 p */
.content_text
{
	font-size: 15pt; 
	font-weight: bold; 
	line-height: 50%;
}

/* 유저 사진 */
.user_image
{
	width: 100px;
	height: 100px;
}
th,td
{
	border: 1px solid #444444;
}

d-block
{
	width: 100%; 
	height: 100%;
	object-fit: cover;
}

 .carousel-inner > .carousel-item > img 
 {
      top: 0;
      left: 0;
      min-width: 100%;
      min-height: 100%;
      max-height: 350px;
      object-fit: cover;
  } 

carousel-item

/* 사진 전체 */
</style>

</head>
<body>

<%
	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != null)
	{	
%>
		<div class="header">
			<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
		</div>
<%	}
	else
	{
%>
	<div>
   		<c:import url="/WEB-INF/view/user/main/comfit_header_nolog.jsp"></c:import>
	</div>
<%	} %>	

<div class="container">
	<div style="padding-top: 5%;">
	
			<p class="fs-4" style="text-align: center; font-weight: bold;">[카테고리]2022 GTX 0000 아주 합리적인 가격에 드립니다.</p>
		
		<div class="content">
		<div class="col-md-6" style="float: left; width: 560px; height: 420px; padding-top: 3%; margin-right: 3%;">	
			<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-ride="true">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="https://cdn.pixabay.com/photo/2015/09/04/23/28/wordpress-923188__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/06/15/16/16/man-1459246__340.png" class="d-block w-100 rounded" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		
		<table class="col-md-5">
			<tr>
				<td colspan="2"><p>거래방식</p>
				<!-- 속성에 따라 직거래/배송 표기 -->
				<p class="content_text">배송(경매)</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>시작가격</p>
				<p class="content_text">100,000 원</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>현재가격</p>

					<!-- 입찰최고가가 반영 -->
					<!-- 입찰이 완료된 상품입니다. -->
					<!-- <p class="content_text" style="color: blue;">입찰이 완료된 상품입니다.</p> -->
					<p class="content_text" style="color: blue;">100,000 원</p>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료까지</p>
				<!-- 경매 종료시간 적용/경매 종료시 경매종료라고 표기 -->
				<!-- <td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료</p> -->
				<p class="fs-3" style="font-weight: bold;">[<span class="fs-3" style="color: #ffd700;">08:51:37</span>]</p>
				
				<!-- 종료 시 최종가 표기  -->
				<!-- <p class="content_text" style="color: blue;">최종 가격 : 143,000원</p> -->

				</td>
			</tr>
			<tr>
				<td style="padding-top: 10px;">
					<p>제조사/물품명</p>
				</td>
				<th style="padding-top: 10px;">

					<!-- 제조사/물품명 표기 -->
					<p style="font-weight: bold;">제조사/물품명</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>즉시구매가격</p>
				</td>
				<th>

					<!-- 즉시구매가 표기 -->
					<p>143,200원</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>Comfit 추천가격</p>
				</td>
				<th>
					<!-- 상품에 따른 추천가 표기 -->
					<p style="color: blue;">189,200원</p>

				</th>
			</tr>
			
			<tr>
				<td colspan="2">
				<!-- 상태에 따라 버튼 변경 -->
				<!-- 판매자)입찰자 없을 때 :수정하기/삭제하기-->
				<!-- 판매자)입찰자 있을 때 :즉시낙찰/삭제하기 -->
				<!-- <button type="button" class="btn btn-warning" style="width: 48%;">즉시낙찰</button> -->
				<div style="width: 100%; float: right;">
					<input type="text" class="form-control" placeholder="입찰가격을 적어주세요"/>
				</div>
				<div class="input-group" style="float: right; width: 100%;">
				   <input type="text" class="form-control" placeholder="배송지를 검색해주세요." readonly="readonly">
				    <button id="Btn" type="button" class="btn btn-outline-primary">
				  		<i class="bi bi-search"></i>
				    </button>                          
				</div>
				<div style="width: 100%; float: right;">
					<input type="text" class="form-control" placeholder="상세주소" readonly="readonly"/>
				</div>
				<div style="">
					<button type="button" class="btn btn-primary" style="width: 100%;">입찰하기</button>
				</div>
				</td>
			</tr>
		</table>
		</div>
		
		<div class="content" style="height: 300px;">
		<table class="col-md-6" style="float: left;">
			<tr class="table-secondary">
				<th style="height:25px; width: 75%; text-align: center;">
				<p style="font-size: 18pt;">상품 상세정보</p>
				</th>
			</tr>
			
			<!-- 공간분리용 tr -->
			<tr style="height: 10px;">
				<th>
				</th>
			</tr>
			
			<tr class="table-secondary">
				<td style="padding:5%;">
				<p>상품 상세정보<br><br>
				1. 제조사 A/S 가능여부 : 무상 5개월까지 가능<br><br>
				2. 특이사항 : 외관상 흠집 및 오염 없음, 작동상태 양호, 사용기간 3개월
				</p>
				</td>
			</tr>
		</table>
		
		<button class="btn btn-primary procut_list" style="margin-left: 3%;">목록으로</button>
		</div>
		
		
		
		<!-- 입찰정보가 출력될 폼 -->
		<div class="content_bid" style="margin-top: 5%; margin-left: 5%; margin-right:9%;">
		<p class="fs-3" style="padding-left: 4%; font-weight: bold;">현재 입찰 정보</p>
		
			
			
		</div>
	
<!-- bootstrap card 사용해서 구성 가능 -->	
<!-- 
<div class="card">
  <div class="card-header">
    Featured
  </div>
  <div class="card-body">
    <h5 class="card-title">Special title treatment</h5>
    <p class="card-text">With supporting text below as a natural lead-in to additional content.</p>
    <a href="#" class="btn btn-primary">Go somewhere</a>
  </div>
</div>
 -->
		
	<br />
	<br />
	<br />	
	<br />
	<br />
	<br />
	<br />
	
	</div>
</div>


<div class="input-group" style="width:100%;">
   <input type="text" class="form-control" placeholder="배송지를 입력해주세요.">
    <button id="Btn" type="button" class="btn btn-outline-primary">
  		<i class="bi bi-search"></i>
    </button>                          
</div>



</body>
</html>