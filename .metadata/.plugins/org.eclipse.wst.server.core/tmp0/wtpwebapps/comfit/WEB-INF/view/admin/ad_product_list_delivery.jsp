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
<!-- 디자인 담당 -->
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
	<div style="margin-bottom: 20px;"><h1><b>관리자모드_상품상세_택배</b></h1></div> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="delivery" items="${productlistdelivery1}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">상품 번호</th>
				    <td colspan="2">${delivery.pd_num }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시 일자</th>
				    <td colspan="2">${delivery.pd_regit_date }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제목</th>
				    <td colspan="2"><a href="#">${delivery.pd_title }</a></td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">거래 방식</th>
				    <td colspan="2">${delivery.deal_type }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매자 ID</th>
				    <td colspan="2">${delivery.u_id }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시글 상태</th>
				    <td>${delivery.deal_status }</td>
				    <td><form action=""><label><input type="checkbox" name="subs" />블라인드</label></form></td>
				</tr>	
			</c:forEach>							
			</thead>
		</table>
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>상품정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="delivery" items="${productlistdelivery2}">			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">카테고리</th>
				    <td>${delivery.category_name }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">물품명</th>
				    <td>${delivery.pd_name }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제조사</th>
				    <td>${delivery.maker_name }</td>
				</tr>			
	
			</c:forEach>								
			</thead>
		</table>		
		
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>거래 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="delivery" items="${productlistdelivery3}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매자ID</th>
				    <td>${delivery.b_u_id }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">가격</th>
				    <td>${delivery.bid_price }</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매 일시</th>
				    <td>${delivery.bid_date }</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">배송 장소</th>
				    <td>${delivery.address }</td>
				</tr>		
			</c:forEach>						
			</thead>
		</table>	
		
		
		<br /><br />
		<div style="margin-top: 20px"><h2><b>거래 완료 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
			<c:forEach var="delivery" items="${productlistdelivery4}">
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매 확정 일시</th>
				    <td colspan="2">${delivery.buy_comp_date }</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매 확정 일시</th>
				    <td colspan="2">${delivery.sell_comp_date }</td>
				</tr>				
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">운송장</th>
				    <td style="color: ;">우체국</td>
				    <td id="set">${delivery.pd_deli_num }</td> 
				</tr>	
			</c:forEach>							
			</thead>
		</table>	
		

		<br /><br />
		<div style="margin-top: 20px"><h2><b>입찰 내역(제안 내역)</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제안자ID</th>
				    <th style="background-color: #eeeeee; text-align: center;">제안 시간</th>
				    <th style="background-color: #eeeeee; text-align: center;">제안 가격</th>
				    <th style="background-color: #eeeeee; text-align: center;">제안 상태</th>
				</tr>
			</thead>	    
			<tbody>
			<c:forEach var="delivery" items="${productlistdelivery5}">			
				<tr>
				    <td>${delivery.b_u_id }</td>
				    <td>${delivery.bid_date }</td>
				    <td>${delivery.bid_price }</td>
				    <td>${delivery.deal_status }</td>
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