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
<style type="text/css">

	.title 
	{
	font-family: 맑은 고딕;
	font-size: 30pt;
	}
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
  		display: inline-table;
  		width:100%;
  		font-weight: bold;
  	}
  	
  	
</style>
</head>
<body>


<!--sidebar  -->
<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">
	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>

<!--Header  -->
<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>

<div class="container">
	<div class="title" style="text-align: center; font-size: 28pt; font-weight: bold;">
		구매내역
	<br>
	</div>
	
    <div style="width: 100%;">
    	<!-- 정렬 아직 미구현 -->
    	<!-- 
    	<div style="text-align: right;">
			<select class="selectpicker" style="width: 100px; height: 30px;">
				<option>날짜순</option>
				<option>완료</option>
				<option>미완료</option>
			</select>
			<br>
		</div>
    	-->
    	
    	<!--table  -->
   		<table class="table table-borderd table-hover" style="margin-top: 2%;">
			<thead>
		        <tr class="table-primary">
		            <th style="width:10%;">제안/입찰일</th>
		            <th>금액</th>
		            <th>상품정보</th>
		            <th>방식</th>
		            <th>예정 장소</th>
		            <th style="font-size:10pt;">직거래 예정 일시</th>
		            <th style="font-size:10pt;">거래완료일</th>
		            <th>상태</th>
		            <th style="width: 10%;" ></th>
		        </tr>
		     </thead>
		     <tbody>
		     	<c:forEach var="buy" items="${buyList }">

					<tr>
						<td>${buy.pd_regit_date }</td>
						<td>${buy.pd_price }</td>
						<td style="font-size: 10pt;">
							<a href="pd_detail.action?pd_id=${buy.pd_id }">
							${buy.pd_title }
							</a>
						</td>
						<td>${buy.system }</td>
						<td style="font-size: 10pt;">${buy.address }</td>
						<td style="font-size: 10pt;">${buy.time }</td>
						<td style="font-size: 10pt;">${buy.comp_date }</td>
						<td style="font-size: 10pt;">${buy.status }</td>
						<c:choose>
							<c:when test="${(buy.status eq '거래중' || buy.status eq '구매확정대기중') && buy.system eq '직거래(제안거래)'}">
								<td style="text-align: center;">
								<button type="button" class="btn btn-primary btn-sm"
									id="sellBtn"
									style="width: 40%; font-size: 6pt;"
									data-bs-toggle="modal" data-bs-target="#directSellCheck${buy.pd_id }">구매확정</button>
								<button type="button" class="btn btn-danger btn-sm"
									id="danger"
									style="width: 40%; font-size: 6pt;">신고하기</button>		
								</td>
							</c:when>
							<c:when test="${(buy.status eq '거래중' || buy.status eq '구매확정대기중') && buy.system eq '택배(경매)' }">
								<td style="text-align: center;">
								<button type="button" class="btn btn-primary btn-sm"
									id="sellBtn"
									style="width: 40%; font-size: 6pt;"
									data-bs-toggle="modal" data-bs-target="#deliverySellCheck${buy.pd_id }">구매확정</button>
								<button type="button" class="btn btn-danger btn-sm"
									id="danger"
									style="width: 40%; font-size: 6pt;">신고하기</button>
								</td>
							</c:when>
							<c:otherwise>
								<td></td>
							</c:otherwise>
						</c:choose>	
					</tr>
					
					<!-- 직거래 구매확정 모달 -->
					<div class="modal fade" id="directSellCheck${buy.pd_id}" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <h5 class="modal-title" id="exampleModalLabel">구매확정하기</h5>
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					         <h5 style="font-weight: bold;">"${buy.pd_title }" <br>상품을 구매확정합니다.</h5>
					         
					         <h5>채택가격 : ${buy.pd_price }원</h5>
					         <h5>채택일자 : ${buy.selected_date }일</h5>
					         <h5 style="font-weight: bold;">내 구매 코드 : ${buy.buyer_code }</h5>
					         <br />
					         <form action="completedirectbuy.action" method="post">
					         	<input type="hidden" id="selected_id" name="selected_id" value="${buy.selected_id }"/>
					         	<h5>상대방 코드를 입력해 주세요.</h5>
					         	<input type="text" id="seller_code" name="seller_code" placeholder="판매자 코드" style="width: 90%; margin-top: 2px;">
					         	<br /><br />
					         	<h5>한줄 후기를 입력해 주세요</h5>
					         	<input type="text" id="review" name="review" placeholder="한줄 후기 입력" style="width: 90%; margin-top: 2px;">
					       		<button type="submit" class="btn btn-primary"
					        	data-bs-toggle="modal" data-bs-target="#directSellCheckOk">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					         </form>
					      </div>
					    </div>
					  </div>
					</div>
					
					<!-- 택배거래 구매확정 모달 -->
					<div class="modal fade" id="deliverySellCheck${buy.pd_id }" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
					  <div class="modal-dialog">
					    <div class="modal-content">
					      <div class="modal-header">
					        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
					      </div>
					      <div class="modal-body">
					         <h5 style="font-weight: bold;">"${buy.pd_title }" <br>상품을 구매확정합니다.</h5>
					         <h5>낙찰가격 : ${buy.pd_price }원</h5>
					         <h5>낙찰일자 : ${buy.bs_date }일</h5>
					         <h5>운송장번호 : ${buy.deli_num }</h5>

					         <br />
					         <form action="completedeliverybuy.action" method="post">
					         	<input type="hidden" id="bs_id" name="bs_id" value="${buy.bs_id }"/>
					         	<br /><br />
					         	<h5>한줄 후기를 입력해 주세요</h5>
					         	<input type="text" id="review" name="review" placeholder="한줄 후기 입력" style="width: 90%; margin-top: 2px;">
					       		<button type="submit" class="btn btn-primary"
					        	data-bs-toggle="modal" data-bs-target="#deliverySellCheckOk">확인</button>
					        	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
					         </form>
					      </div>
					    </div>
					  </div>
					</div>
				</c:forEach>
		    	</tbody>
		</table>
    </div>		
</div>

</body>
</html>