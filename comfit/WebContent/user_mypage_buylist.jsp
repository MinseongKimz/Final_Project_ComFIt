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
<title>구매내역 리스트</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<style type="text/css">

	.subheader
	{
		font-size: 25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:5%;
	}
	.subheader_header
	{
		font-size: 20pt;
		font-weight: bold;
		margin-left: 25%;
	}
	.tablebts
	{
		margin-top:5%;
		margin-left: 38%;
    	width: 40%;
    	font-weight: bold;
  	}
  	.hi
  	{
  		margin-left:3%;
  		border-radius:5px;
  		width:80%;
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
	   		<p class="subheader_header">구매내역</p>
	   	</div>
	   



		<div class="content" >
		<h3 class="inout_point">내 구매</h3> 
		<table class="table" style="width: 1000px;">
		    <thead>
		        <tr>
		            <th>제안/입찰일</th>
		            <th>금액</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>직거래 예정 장소/배송 예정 장소</th>
		            <th>직거래 예정 일시</th>
		            <th>실제 거리 일시</th>
		            <th>상태</th>
		        </tr>
		    </thead>
		    <tbody>
		        <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선 마우스</td>
		            <td>(배송)경매</td>
		            <td>인천 계양구 새빛 아파트 104동 앞</td>
		            <td>　</td>
		            <td>2022-05-19 08:12:12</td>
		            <td>
		            	낙찰
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            </td>
		        </tr>     
		        <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선 마우스</td>
		            <td>(배송)경매</td>
		            <td>인천 계양구 새빛 아파트 104동 앞</td>
		            <td>　</td>
		            <td>2022-05-19 08:12:12</td>
		            <td>
		            	낙찰
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            </td>
		        </tr> 
		         <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선 마우스</td>
		            <td>(배송)경매</td>
		            <td>인천 계양구 새빛 아파트 104동 앞</td>
		            <td>　</td>
		            <td>2022-05-19 08:12:12</td>
		            <td>
		            	낙찰
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            </td>
		        </tr>
		         <tr>
		            <td>2022-05-20</td>
		            <td>40,000</td>
		            <td>레이저 무선 마우스</td>
		            <td>(배송)경매</td>
		            <td>인천 계양구 새빛 아파트 104동 앞</td>
		            <td>　</td>
		            <td>2022-05-19 08:12:12</td>
		            <td>
		            	낙찰
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            	<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 50px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		            </td>
		        </tr>  
		    </tbody>
		</table>
		<button type="button" class="btn btn-primary btn-sm"id="sellBtn" style="width: 400px; height: 40px; font-size: 15pt;">판매내역 자세히보기</button>
		           
	 </div>  	
</div>

</body>
</html>