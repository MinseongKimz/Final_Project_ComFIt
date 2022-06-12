<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 판매 목록</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
.list-group {
	width: 120px;
	text-align: center;
}
.title {
	margin-left: 11%;
	font-family: 맑은 고딕;
	font-size: 30pt;
}
.list-group-item {
	text-align: center;
	font-weight: bold;
}
.container
{
	margin-left: 5%;
}
h5
{
	font-weight: bold;
}
</style>



</head>
<body>
<div>
	<div>
		<!-- 헤더 영역 -->
		<c:import url="comfit_header_user.jsp"></c:import>
	</div>

	<div class="title">
		마이페이지 &nbsp;&nbsp;<span style="font-size: 20pt;">판매내역</span>
		<br><br>
	</div>


	<div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-1" style="margin-left: 3%;">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">회원정보</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">구매내역</a>
					<br /> <a href="#"
						class="list-group-item list-group-item-action active">판매내역</a> <br />
					<a href="#" class="list-group-item list-group-item-action">입출금내역</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
				</div>
			</div>

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 4%;">
				<div class="d-flex justify-content-between">
					<p style="font-size: 18pt; font-weight: bolder;">내 판매</p>
					<select class="selectpicker" style="width: 100px; text-align: center; height: 30px;">
						<option>날짜순</option>
						<option>완료</option>
						<option>미완료</option>
					</select>
				</div>
				
				<!-- 테이블  -->
				<div >
					<table class="table table-bordered" style="font-size: 10pt;">
						<thead>
							<tr>
								<th>판매 시작일</th>
								<th>최종 금액</th>
								<th>상품정보</th>
								<th>방식</th>
								<th>예정 장소</th>
								<th>직거래 예정 일시</th>
								<th>실제 거래 일시</th>
								<th>상태</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td>2022-05-17</td>
								<td>40,000</td>
								<td>레이저 무선 마우스</td>
								<td>배송(경매)</td>
								<td style="font-size: 8pt;">인천 계양구 새빛 아파트 104동 203호</td>
								<td style="font-size: 8pt;"></td>
								<td style="font-size: 8pt;"></td>
								<td>낙찰</td>
							</tr>
							<tr>
								<td>2022-04-30</td>
								<td>80,000</td>
								<td>커세어 무선 헤드셋</td>
								<td>직거래(구매제안)</td>
								<td style="font-size: 8pt;">인천 계양구 새빛 아파트 경비실 뒤</td>
								<td style="font-size: 8pt;">2022-05-18 18시30분</td>
								<td style="font-size: 8pt;"></td>
								<td>채택 &nbsp;
									<button type="button" class="btn btn-primary btn-sm"
										id="sellBtn"
										style="width: 60px; height: 30px; font-size: 6pt;"
										data-bs-toggle="modal" data-bs-target="#directSellCheck">판매확정</button>
									<button type="button" class="btn btn-danger btn-sm"
										id="danger"
										style="width: 60px; height: 30px; font-size: 6pt;">신고하기</button>
								</td>
							</tr>
							<tr>
								<td>2022-05-17</td>
								<td>40,000</td>
								<td>레이저 무선 마우스</td>
								<td>배송(경매)</td>
								<td style="font-size: 8pt;">인천 계양구 새빛 아파트 104동 앞</td>
								<td style="font-size: 8pt;"></td>
								<td style="font-size: 8pt;"></td>
								<td>채택 &nbsp;
									<button type="button" class="btn btn-primary btn-sm"
										id="sellBtn"
										style="width: 60px; height: 30px; font-size: 6pt;"
										data-bs-toggle="modal" data-bs-target="#sellCheck">판매확정</button>
									<button type="button" class="btn btn-danger btn-sm"
										id="danger"
										style="width: 60px; height: 30px; font-size: 6pt;">신고하기</button>
								</td>
							</tr>
							<tr>
								<td>2022-05-17</td>
								<td>40,000</td>
								<td>레이저 무선 마우스</td>
								<td>배송(경매)</td>
								<td style="font-size: 8pt;">인천 계양구 새빛 아파트 104동 앞</td>
								<td></td>
								<td></td>
								<td>낙찰</td>
							</tr>
							<tr>
								<td>2022-05-17</td>
								<td>40,000</td>
								<td>레이저 무선 마우스</td>
								<td>배송(경매)</td>
								<td style="font-size: 8pt;">인천 계양구 새빛 아파트 104동 앞</td>
								<td></td>
								<td></td>
								<td>낙찰</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</div>
</div>
	

<!-- Modal 운송장 번호 입력 -->
<div class="modal fade" id="sellCheck" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">판매확정하기</h5>
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
       	 <h4 style="font-weight: bold;">판매가 확정되었습니다!</h4> 
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
        <h5 class="modal-title" id="exampleModalLabel">판매확정하기</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h5 style="font-weight: bold;">제품명</h5>
         커세어 무선 헤드셋<br />
         
         가격 : 40,000원<br />
         낙찰일시 : 2022-04-30 21시 25분<br />
         <h5 style="font-weight: bold;">내 판매 코드 : vkgikwo </h5>
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
         <h5 style="font-weight: bold;">내 판매 코드 : vkgikwo </h5>
         <br />
       	 <h4 style="font-weight: bold;">판매가 확정되었습니다!</h4> 
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>







</body>
</html>