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
<title>마이페이지</title>
<link rel="stylesheet" type="text/css" href="/css/main.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//maxcdn.bootstrapcdn.com/bootstrap/latest/js/bootstrap.min.js"></script>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=cp %>/css/inputstyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<style type="text/css">

	.subheader
	{
		font-size: 25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:5%;
	}
	.logo
	{
		margin-left: 55%;
		margin-bottom:12%;
	}
	.testbox
	{
		margin-left:5%;
		margin-top:3%;
	}
	.inout_point,.table,.able
	{
		font-size: 15pt;
		font-weight: bold;
		margin-left: 25%;
	}
	
	.neyuk
	{
		font-size: 10pt;
		font-weight: bold;
		margin-left: 30%;
		color: #0080FF;
	}
	.btn-primary
	{
		
		border-radius:5px;
	}
	.tablebts
	{
		width:40%;
		margin-left:40%;
		border-radius:5px;
		table-layout:fixed;
    	font-weight: bold;
    	background-color: #D3D3D3;
	}
	.mypage
	{
		margin-bottom: 5%;
	}
	.user_image
	{
		width: 100px;
		height: 100px;
	}
</style>
</head>
<body>

<div>
	<!--Header  -->
	<div class="header">
      <c:import url="comfit_header.jsp"></c:import>
   	</div>
   	
   	<div>
   		<p class="subheader">마이페이지</p>
   	</div>
   	
	
		<div class="shadow p-3 mb-5 bg-body rounded">
			<table style="width: 100%;">
			<tr>
				<td style="width: 20%; padding-left:23%;">
					<div class="user_image">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
				</td>
				
				<th>
					<p style="padding-left:30%;">닉네임 : 김민성<br>
					LV : 2</p>
				</th>
				<td>
					<button type="button" class="btn btn-primary">찜한상품보기</button>
					<button type="button" class="btn btn-primary">내 정보 보기/수정</button>
				</td>
			</tr>
			</table>
			</div>
		
			
	
	
	 <div class="content" >
						 <div>
							<h3 class="inout_point">입출금 내역 내 포인트 : test p</h3> 
						 	<button type="button" class="btn btn-link" style="margin-left: 70%;">전체보기</button>
						 </div>
		<table class="table table-bordered" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>날짜</th>
		            <th>포인트</th>
		            <th>방식</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-17</td>
		            <td>80,000</td>
		            <td>입금</td>
		        </tr>     
		        <tr>
		            <td>2022-05-20</td>
		            <td>-50,000</td>
		            <td>입금</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		
		
		
		<div class="content" >
		<h3 class="inout_point">내 판매</h3> <p class="neyuk">1개월 간 내역</p>
		<table class="table table-bordered" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>낙찰일/채택일</th>
		            <th>최고가/낙찰가</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-20</td>
		            <td>169,000</td>
		            <td>GTX 1060 이엠텍</td>
		            <td>경매</td>
		            <td>경매중</td>
		        </tr>     
		        <tr>
		            <td>2022-05-13</td>
		            <td>50,000</td>
		            <td>HP 모니터</td>
		            <td>제안 거래</td>
		            <td>거래 종료</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 400px; height: 40px; font-size: 15pt; margin-left:47%;">판매내역 자세히보기</button>
		           
		
		<div class="content" >
		<h3 class="inout_point">내 구매</h3> <p class="neyuk">1개월 간 내역</p>
		<table class="table table-bordered" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>낙찰일/채택일</th>
		            <th>금액</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선마우스</td>
		            <td>배송(경매)</td>
		            <td>낙찰
		            	<button type="button" class="btn btn-primary btn-sm" id="buyBtn" style="width: 60px; height: 30px; font-size: 6pt;">구매확정</button>
		            </td>
		        </tr>     
		        <tr>
		            <td>2022-04-30</td>
		            <td>80,000</td>
		            <td>커세어 무선헤드셋</td>
		            <td>직거래(구매제안)</td>
		            <td>거래 종료</td>
		        </tr>
		        <tr>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		            <td>　</td>
		        </tr>  
		    </tbody>
		</table>
		<button type="button" class="btn btn-primary btn-sm"id="buyBtn" style="width: 400px; height: 40px; font-size: 15pt;margin-left:47%;">구매내역 자세히보기</button>
		
			</div>
		</div>
	</div>
</div>
</body>
</html>