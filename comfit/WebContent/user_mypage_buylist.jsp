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
  	.hi
  	{
  		margin-left:3%;
  		border-radius:5px;
  		width:80%;
  	
  	}
  	table
  	{
  		
  		display:inline;
  		margin-left:25%;
  		width:70%;
  		margin-top: -10%;
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
	   		<p style="font-size: 18pt; font-weight: bolder;margin-left: 25%;">내 판매</p>
	   		<!--sidebar  -->
	   			<div style="float:left; margin-left: 15%; ">
	   						<c:import url="user_sidebar.jsp"></c:import>
	   			</div>
	   		
	   	</div>
	    <div>
	    	<!--table  -->
					   		<table class="table table-bordered"  style="float:left;">
							<thead>
						        <tr style="background-color: white;">
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
						        <tr>
						            <td>2022-05-20</td>
						            <td>40,000</td>
						            <td>레이저 무선 마우스</td>
						            <td>(배송)경매</td>
						            <td style="font-size: 8pt;">인천 계양구 새빛 아파트 104동 203호</td>
						            <td style="font-size: 8pt;">　</td>
						            <td style="font-size: 8pt;">2022-05-19 08:12:12</td>
									<td>낙찰 &nbsp;
													<button type="button" class="btn btn-primary btn-sm"
														id="sellBtn"
														style="width: 60px; height: 30px; font-size: 6pt;"
														data-bs-toggle="modal" data-bs-target="#directSellCheck">구매확정</button>
													<button type="button" class="btn btn-danger btn-sm"
														id="danger"
														style="width: 60px; height: 30px; font-size: 6pt;">신고하기</button>
												
									</td>		        
												
								</tr>     
						        <tr>
						            <td>2022-04-30</td>
						            <td>80,000</td>
						            <td>커세어 무선 헤드셋</td>
						            <td>직거래(구매제안)</td>
						            <td style="font-size: 8pt;">경비실 뒤</td>
						            <td style="font-size: 8pt;">2022-05-18 00:00:00</td>
						            <td style="font-size: 8pt;">2022-05-19 08:12:58</td>
									<td>채택 &nbsp;
													<button type="button" class="btn btn-primary btn-sm"
														id="sellBtn"
														style="width: 60px; height: 30px; font-size: 6pt;"
														data-bs-toggle="modal" data-bs-target="#directSellCheck">구매확정</button>
													<button type="button" class="btn btn-danger btn-sm"
														id="danger"
														style="width: 60px; height: 30px; font-size: 6pt;">신고하기</button>		
									</td>				         
						         </tr> 
						         <tr>
						            <td>2022-04-25</td>
						            <td>167,000</td>
						            <td>대형 모니터</td>
						            <td>직거래(구매제안)</td>
						            <td style="font-size: 8pt;">주차장 계단 뒤</td>
						            <td style="font-size: 8pt;">　</td>
						            <td style="font-size: 8pt;">　</td>
						            <td>구매완료</td>
						         </tr>
						         <tr>
						            <td>2022-04-14</td>
						            <td>70,000</td>
						            <td>게이밍 키보드</td>
						            <td>(배송)경매</td>
						            <td style="font-size: 8pt;">일산 동구 백석동</td>
						            <td style="font-size: 8pt;">　</td>
						            <td style="font-size: 8pt;">　</td>
						            <td>구매완료</td>
						        </tr>  
						</table>
	    </div>



			
</div>

</body>
</html>