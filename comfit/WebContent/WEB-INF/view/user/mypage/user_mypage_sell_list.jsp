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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
	.list-group 
	{
		width: 120px;
		text-align: center;
	}
	.title 
	{
		font-family: 맑은 고딕;
		font-size: 30pt;
	}
	.list-group-item 
	{
		text-align: center;
		font-weight: bold;
	}
  	table
  	{
  		display: inline-table;
  		width:100%;
  		font-weight: bold;
  	}

</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
</script>


</head>
<body>



<!-- sidebar -->
<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">
	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>
<!-- header -->
<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>


<div class="container">
	<div class="title" style="text-align: center; font-size: 28pt; font-weight: bold;">
		판매내역
	<br>
	</div>

	<div style="width: 100%;">
		<div style="text-align: right;">
			<select class="selectpicker" style="width: 100px; height: 30px;">
				<option>날짜순</option>
				<option>완료</option>
				<option>미완료</option>
			</select>
		</div>
		
		<!-- 테이블  -->

		<table class="table table-bordered table-hover" style="font-size: 10pt; margin-top: 2%;">
			<thead>
				<tr class="table-primary">
					<th>상품등록일</th>
					<th>최종 금액</th>
					<th>상품정보</th>
					<th>방식</th>
					<th>예정 장소</th>
					<th>직거래 예정 일시</th>
					<th>거래완료일</th>
					<th>상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="sell" items="${sellList }">
				<tr onclick="location.href='pd_detail.action?pd_id=${sell.pd_id }';">
					<td>${sell.pd_regit_date }</td>
					<c:if test="${sell.pd_price == -1}">
		            	<td>제안받는중</td>
		            </c:if>
		            <c:if test="${sell.pd_price != -1}">
		            	<td>${sell.pd_price }</td>
		            </c:if>
					<td>${sell.pd_title }</td>
					<td>${sell.system }</td>
					<td style="font-size: 10pt;">${sell.address }</td>
					<td style="font-size: 10pt;">${sell.time }</td>
					<td style="font-size: 10pt;">${sell.comp_date }</td>
					<td>${sell.status }</td>
				</tr>
				</c:forEach>
				
				<!-- <tr>
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
				-->
			</tbody>
		</table>
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