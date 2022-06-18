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
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#productDelBtn").click(function() 
		{
			var result = confirm('정말로 삭제하시겠습니까?');
		
			if(result) 
			{
				//삭제 명령 넣어야됨
				alert("『글제목』 게시물이 정상적으로 삭제되었습니다.");
			} 
			else 
			{
			    return;
			}
			        
		});
		
					
	});
	
	</script>

<script type="text/javascript">

function CountDownTimer(dt, id)
{
    var end = new Date(dt);
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;
    function showRemaining()
    {
        var now = new Date();
        var distance = end - now;
        if (distance < 0)
        {
            clearInterval(timer);
            document.getElementById(id).innerHTML = '경매 종료';
            return;
        }
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);
        document.getElementById(id).innerHTML = days + '일 ';
        document.getElementById(id).innerHTML += hours + '시간 ';
        document.getElementById(id).innerHTML += minutes + '분 ';
        document.getElementById(id).innerHTML += seconds + '초';
    }
    timer = setInterval(showRemaining, 1000);
}

	window.onload = function()
	{
		
		var remain_date = document.getElementById("remain_date").value;
		/* alert(remain_date); */
		CountDownTimer(remain_date, 'demo');		
	};





</script>
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
      max-width: 100%;
      min-height: 380px;
      max-height: 380px;
      object-fit: cover;
  } 

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

<%
	int end_date = (Integer)request.getAttribute("end_date");

	// 음수 : 경매시간이 끝났다면
	if(end_date < 0)
	{
%>
<!-- 종료된 경매페이지 출력 -->
<div class="container">
	<div style="padding-top: 5%;">
	<c:forEach var="dlPd"  items="${dlPdList }">
	
			<p class="fs-2" style="text-align: center; font-weight: bold;">[${dlPd.category_name }] ${dlPd.pd_title}</p>
		
		<div class="content">
		<div class="col-md-6" style="float: left; width: 560px; height: 420px; padding-top: 3%; margin-right: 3%;">	
			<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-touch="false" data-bs-ride="true">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
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
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2015/09/04/23/28/wordpress-923188__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537__340.jpg" class="d-block w-100 rounded" alt="...">
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
				<p class="content_text">택배거래</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>시작가격</p>
				<p class="content_text">${dlPd.price } 원</p></td>
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
				<td colspan="2" style="border-bottom: 2px solid gray; "><p>경매 종료까지</p>
				<input type="hidden" id="remain_date" value="종료일 : ${dlPd.remain_date }" >
				<!-- 경매 종료시간 적용/경매 종료시 경매종료라고 표기 -->
				<!-- <td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료</p> -->
				<p class="fs-2" style="font-weight: bold;">[<span class="fs-2 countDown" style="color: #ffd700;" id="demo"></span>]</p>
				
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
					<p style="font-weight: bold;">${dlPd.maker_name }(${dlPd.maker_name2 }) / ${dlPd.pd_name }</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>즉시구매가격</p>
				</td>
				<th>

					<!-- 즉시구매가 표기 -->
					<p>${dlPd.imdprice }</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>Comfit 추천가격</p>
				</td>
				<th>
					<!-- 상품에 따른 추천가 표기 -->
					<p style="color: blue;">${dlPd.cf_price } 원</p>

				</th>
			</tr>
			
			<tr>
				<td colspan="2">
				<button type="button" class="btn btn-danger" style="width: 96%;" disabled="disabled">종료된 경매입니다.</button>
				</td>
			</tr>
		</table>
		</div>
		<div>
			<div class="col-md-6" style="width:100%; display: inline-block; float:left;">
			<table style="margin-left:5%; width:90%;">
				<tr class="table-secondary">
					<th style="height:25px; width: 100%; text-align: center;">
						<p style="font-size: 18pt;">상품 상세정보</p>
					</th>
				</tr>
				
				<!-- 공간분리용 tr -->
				<tr style="height: 10px;">
				</tr>
				
				<tr class="table-secondary">
					<td style="padding:5%;">
					<p>상품 상세정보<br><br>
					1. 제조사 A/S 가능여부 : ${dlPd.pd_as_name } / ${dlPd.pd_as_remain } 까지 가능<br><br>
					2. 특이사항 : ${dlPd.comments }
					</p>
					</td>
				</tr>
			</table>
			</div>
			
			<!-- 구매자) 판매자 정보 -->
			<div class="seller_info col-md-5" style="display: inline-block; padding-left: 3%; height: 270px;">
			
			<div class="card" style="width: 100%; padding:3%;">
				<div>
					<div class="user_image" style="float: left;">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
					<div style="padding-left: 25%;">
						<p class="fs-2" style="margin-top: 5%; font-weight: bold;">${dlPd.u_nickname } 
						<span class="fs-6" style="color: green;">Level : ${userLevel }</span>
						</p>
					</div>
				</div>
				    
				  <div class="card-body" style="height: 85px;">
				    <h5 class="card-title"></h5>
				    <div style="text-align: right;">
				    	<p class="card-text" style="font-weight: bold;">누적 판매 수 : ${sellCount }회</p>
				    	<a href="user_detail_sell.jsp" style="text-decoration: none;">상세보기</a>
				    </div>
				  </div>
				</div>
				<!-- 판매자 정보 아래 버튼  -->
			</div>
		</div>
		
		</c:forEach>
		
		<!-- 입찰정보가 출력될 폼 -->
		<div class="content_bid" style="margin-top: 5%; margin-left: 5%; margin-right:9%;">
		<p class="fs-3" style="padding-left: 4%; font-weight: bold;">현재 입찰 정보</p>
		
			<!-- 입찰 폼 한개 -->
			<c:forEach var="bl"  items="${bidList }">
			<div class="shadow-lg p-3 mb-5 bg-body rounded" style="font-weight: bold;">
			<table style="width: 100%;">
			<tr>
				<td style="width: 20%; padding-left: 3%;">
					<div class="user_image">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
				</td>
				<th style="padding-left: 2%;">
					<p class="fs-4">
					${bl.u_nickname }
					</p>
				</th>
				<td>
					<p style="padding-left:10%;">가격 : ${bl.price }원</p><br>
					<p style="padding-left:10%;">배송지 : ${bl.address }</p>
				</td>
				<td style="text-align: right; margin-left: 20%;">
					<p>${bl.bid_date }</p>
					<button type="button" class="btn btn-primary">낙찰예정</button>
				</td>
			</tr>
			</table>
			</div>
			</c:forEach>
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



</body>
</html>



<%
	}
	else
	{
%>
<!-- 일반 경매페이지 출력 -->

<div class="container">
	<div style="padding-top: 5%;">
	<c:forEach var="dlPd"  items="${dlPdList }">
	
			<p class="fs-2" style="text-align: center; font-weight: bold;">[${dlPd.category_name }] ${dlPd.pd_title}</p>
		
		<div class="content">
		<div class="col-md-6" style="float: left; width: 560px; height: 420px; padding-top: 3%; margin-right: 3%;">	
			<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-touch="false" data-bs-ride="true">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
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
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2015/09/04/23/28/wordpress-923188__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537__340.jpg" class="d-block w-100 rounded" alt="...">
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
				<p class="content_text">택배거래</p></td>
			</tr>
			<tr>
				<td colspan="2"><p>시작가격</p>
				<p class="content_text">${dlPd.price } 원</p></td>
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
				<td colspan="2" style="border-bottom: 2px solid gray; "><p>경매 종료까지</p>
				<input type="hidden" id="remain_date" value="종료일 : ${dlPd.remain_date }" >
				<!-- 경매 종료시간 적용/경매 종료시 경매종료라고 표기 -->
				<!-- <td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료</p> -->
				<p class="fs-2" style="font-weight: bold;">[<span class="fs-2 countDown" style="color: #ffd700;" id="demo"></span>]</p>
				
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
					<p style="font-weight: bold;">${dlPd.maker_name }(${dlPd.maker_name2 }) / ${dlPd.pd_name }</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>즉시구매가격</p>
				</td>
				<th>

					<!-- 즉시구매가 표기 -->
					<p>${dlPd.imdprice }</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>Comfit 추천가격</p>
				</td>
				<th>
					<!-- 상품에 따른 추천가 표기 -->
					<p style="color: blue;">${dlPd.cf_price } 원</p>

				</th>
			</tr>
			
			<tr>
				<td colspan="2">
				<!-- 상태에 따라 버튼 변경 -->
				<!-- 판매자)입찰자 없을 때 :수정하기/삭제하기-->
				<!-- 판매자)입찰자 있을 때 :즉시낙찰/삭제하기 -->
				<!-- 구매자) 제안하기/신고 -->
					
				
				<!-- <button type="button" class="btn btn-warning" style="width: 48%;">즉시낙찰</button> -->
				<!-- <button type="button" class="btn btn-primary" style="width: 48%;">제안하기</button> -->
				<!-- <button type="button" class="btn btn-secondary" style="width: 48%;">신고</button> -->
				<%
					int check_id = (int)session.getAttribute("check_id");
					if(check_id == 1)
					{
				%>
				<button type="button" class="btn btn-primary" style="width: 48%;">수정하기</button>
				<button type="button" class="btn btn-secondary" id="productDelBtn" style="width: 48%;">삭제하기</button>
				<%
					}
					else
					{
				%>
					<c:choose>
						<c:when test="${ub_Check == 0 }">
						<button type="button" class="btn btn-primary" style="width: 48%;">입찰하기</button>
						<button type="button" class="btn btn-secondary" id="productDelBtn" style="width: 48%;">즉시구매하기</button>
						</c:when>
						<c:otherwise>
						<button type="button" class="btn btn-success" style="width: 96%;" disabled="disabled">입찰완료</button>
						</c:otherwise>
					</c:choose>
				<%
					}
				%>
				</td>
			</tr>
		</table>
		</div>
		<div>
			<div class="col-md-6" style="width:100%; display: inline-block; float:left;">
			<table style="margin-left:5%; width:90%;">
				<tr class="table-secondary">
					<th style="height:25px; width: 100%; text-align: center;">
						<p style="font-size: 18pt;">상품 상세정보</p>
					</th>
				</tr>
				
				<!-- 공간분리용 tr -->
				<tr style="height: 10px;">
				</tr>
				
				<tr class="table-secondary">
					<td style="padding:5%;">
					<p>상품 상세정보<br><br>
					1. 제조사 A/S 가능여부 : ${dlPd.pd_as_name } / ${dlPd.pd_as_remain } 까지 가능<br><br>
					2. 특이사항 : ${dlPd.comments }
					</p>
					</td>
				</tr>
			</table>
			</div>
			
			<!-- 구매자) 판매자 정보 -->
			<div class="seller_info col-md-5" style="display: inline-block; padding-left: 3%; height: 270px;">
			
			<div class="card" style="width: 100%; padding:3%;">
				<div>
					<div class="user_image" style="float: left;">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
					<div style="padding-left: 25%;">
						<p class="fs-2" style="margin-top: 5%; font-weight: bold;">${dlPd.u_nickname } 
						<span class="fs-6" style="color: green;">Level : ${userLevel }</span>
						</p>
					</div>
				</div>
				    
				  <div class="card-body" style="height: 85px;">
				    <h5 class="card-title"></h5>
				    <div style="text-align: right;">
				    	<p class="card-text" style="font-weight: bold;">누적 판매 수 : ${sellCount }회</p>
				    	<a href="user_detail_sell.jsp" style="text-decoration: none;">상세보기</a>
				    </div>
				  </div>
				</div>
				<!-- 판매자 정보 아래 버튼  -->
				<div style="text-align: center; margin-top: 1%;">
					<button class="btn btn-primary" style="width: 25%; margin-right: 15%;" onclick="location.href='user_mainlist.action'">목록으로</button>
					<button class="btn btn-primary" style="width: 25%;">찜하기</button>
				</div>
			</div>
		</div>
		
		</c:forEach>
		
		<!-- 입찰정보가 출력될 폼 -->
		<div class="content_bid" style="margin-top: 5%; margin-left: 5%; margin-right:9%;">
		<p class="fs-3" style="padding-left: 4%; font-weight: bold;">현재 입찰 정보</p>
		
			<!-- 입찰 폼 한개 -->
			<c:forEach var="bl"  items="${bidList }">
			<div class="shadow-lg p-3 mb-5 bg-body rounded" style="font-weight: bold;">
			<table style="width: 100%;">
			<tr>
				<td style="width: 20%; padding-left: 3%;">
					<div class="user_image">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
				</td>
				<th style="padding-left: 2%;">
					<p class="fs-4">
					${bl.u_nickname }
					</p>
				</th>
				<td>
					<p style="padding-left:10%;">가격 : ${bl.price }원</p><br>
					<p style="padding-left:10%;">배송지 : ${bl.address }</p>
				</td>
				<td style="text-align: right; margin-left: 20%;">
					<p>${bl.bid_date }</p>
					<button type="button" class="btn btn-primary">낙찰예정</button>
				</td>
			</tr>
			</table>
			</div>
			</c:forEach>
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
</body>
</html>

<%
	}
%>
