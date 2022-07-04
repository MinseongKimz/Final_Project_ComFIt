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
<!-- 기기별 크기 담당 -->
<meta name="viewport" content="width=device-width", initial-scale="1">
<title>ad_productlist_direct.jsp</title>
<style type="text/css">
  #set {
    border-left: 1px solid gray;
    padding: 10px;
  }
</style>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1><b>관리자모드_상품상세_직거래</b></h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="direct" items="${productlistdirect1}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">상품 번호</th>
				    <td colspan="2">${direct.pd_num }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시 일자</th>
				    <td colspan="2">${direct.pd_regit_date }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제목</th>
				    <td colspan="2"><a href="#">${direct.pd_title }</a></td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">거래 방식</th>
				    <td colspan="2">${direct.deal_type }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매자 ID</th>
				    <td colspan="2">${direct.u_id }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시글 상태</th>
				    <td>${direct.deal_status }</td>
				    <td><form action=""><label><input type="checkbox" name="subs" />블라인드</label></form></td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판/구매자 코드</th>
				    <td>${direct.seller_code }</td>
				    <td id="set">${direct.buyer_code }</td> 
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">코드 입력 여부</th>
				    <td>${direct.sell_ok }</td>
				    <td id="set">${direct.buy_ok }</td>
				</tr>	
			</c:forEach>				
			</thead>
		</table>
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>상품정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="direct" items="${productlistdirect2}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">카테고리</th>
				    <td>${direct.category_name }</td>
				</tr>	
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">물품명</th>
				    <td>${direct.pd_name }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제조사</th>
				    <td>${direct.maker_name }</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 가격</th>
				    <td>${direct.pd_hopeprice }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 장소</th>
				    <td>${direct.pd_hope_place }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 날짜</th>
				    <td>${direct.hope_sate }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 시간</th>
				    <td>${direct.hope_time }</td>
				</tr>			
			</c:forEach>					
			</thead>
		</table>		
		
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>거래 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="direct" items="${productlistdirect3}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매자ID</th>
				    <td>${direct.u_id }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">가격</th>
				    <td>${direct.suggest_price }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 일시</th>
				    <td>${direct.suggest_time }</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 장소</th>
				    <td>${direct.hope_sate }</td>
				</tr>	
			</c:forEach>							
			</thead>
		</table>	
		
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>거래 완료 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="direct" items="${productlistdirect4}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매 확정 일시</th>
				    <td>${direct.buy_comp_date }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">가격</th>
				    <td>${direct.suggest_price }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 일시</th>
				    <td>${direct.suggest_time }</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 장소</th>
				    <td>${direct.hope_sate }</td>
				</tr>
			</c:forEach>								
			</thead>
		</table>	
		

		<br /><br />
		<div style="margin-top: 20px"><h2><b>입찰 내역(제안 내역)</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">입찰자ID</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰 시간</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰가격</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰상태</th>
				</tr>
			</thead>	    
			<tbody>
			<c:forEach var="direct" items="${productlistdirect5}">
				<tr>
				    <td>${direct.s_u_id }</td>
				    <td>${direct.suggest_date }</td>
				    <td>${direct.suggest_price }</td>
				    <td>${direct.deal_status }</td>
				</tr>
			</c:forEach>
			</tbody> 	    
		</table>					
	</div>
</div>


		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />



</body>
</html>