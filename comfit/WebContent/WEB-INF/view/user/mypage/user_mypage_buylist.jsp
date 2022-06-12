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
  	}
  	
  	
</style>
</head>
<body>
<div>
		<!--Header  -->
		<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	   	</div>
	   	
	   	
	   	<div>
	   		<p class="subheader">마이페이지</p>
	   		<p class="subheader_header">구매내역</p>
	   		<p style="font-size: 18pt; font-weight: bolder;margin-left: 25%;">내 판매</p>
	   		<!--sidebar  -->
	   			<div style="float:left; margin-left:15%;">
								<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
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
	    
<!-- Modal 운송장 번호 입력 -->
<div class="modal fade" id="sellCheck" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">구매확정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h5 style="font-weight: bold;">제품명</h5>
         레이저 무선 마우스<br />
         
         가격 : 40,000원<br />
         낙찰일시 : 2022-05-17 13시 37분<br />
         <br />
         운송장번호를 입력해 주세요. <br />
         <form action="">
         	<select id="express" class="form-select" style="width: 30%; margin-top: 2%;">
         		<option value="1">cj대한통운</option>
         		<option value="2">우체국</option>
         		<option value="3">한진</option>
         		<option value="4">롯데</option>
         		<option value="5">로젠</option>
         		<option value="6">GS25편의점</option>
         	</select>
         	<input type="text" id="expressNum" placeholder="운송장번호" style="width: 70%; margin-top: 2%;">
         </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary"
        data-bs-toggle="modal" data-bs-target="#sellCheckOk">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>



<!-- Modal 운송장 번호 확인 -->
<div class="modal fade" id="sellCheckOk" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h5 style="font-weight: bold;">제품명</h5>
         레이저 무선 마우스<br />
         
         가격 : 40,000원<br />
         낙찰일시 : 2022-05-17 13시 37분<br />
         <br />
       	 <h4 style="font-weight: bold;">구매가 확정되었습니다!</h4> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>

<!-- Modal 직거래 판매확정  -->
<div class="modal fade" id="directSellCheck" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">구매확정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h5 style="font-weight: bold;">제품명</h5>
         커세어 무선 헤드셋<br />
         
         가격 : 40,000원<br />
         낙찰일시 : 2022-04-30 21시 25분<br />
         <h5 style="font-weight: bold;">내 구매 코드 : vkgikwo </h5>
         <br />
         <form action="">
         	<h5>상대방 코드를 입력해 주세요.</h5>
         	<input type="text" id="buyerCode" placeholder="구매자 코드" style="width: 90%; margin-top: 2px;">
         	<br /><br />
         	<h5>한줄 후기를 입력해 주세요</h5>
         	<input type="text" id="review" placeholder="한줄 후기 입력" style="width: 90%; margin-top: 2px;">
         </form>
      </div>
      <div class="modal-footer">
      	<button type="button" class="btn btn-primary"
        data-bs-toggle="modal" data-bs-target="#directSellCheckOk">확인</button>
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
      </div>
    </div>
  </div>
</div>


<!-- Modal 직거래 판매 확인 -->
<div class="modal fade" id="directSellCheckOk" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <h5 style="font-weight: bold;">제품명</h5>
         커세어 무선 헤드셋<br />
         
         가격 : 40,000원<br />
         낙찰일시 : 2022-04-30 21시 25분<br />
         <h5 style="font-weight: bold;">내 구매 코드 : vkgikwo </h5>
         <br />
       	 <h4 style="font-weight: bold;">구매가 확정되었습니다!</h4> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>


			
</div>

</body>
</html>