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
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
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
	<div style="border: 1px solid gray; margin-bottom: 20px;"><h1><b>관리자 모드_상품관리</b></h1></div>
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">상품 번호</th>
				    <td colspan="2">P03546</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시 일자</th>
				    <td colspan="2">2022-05-22</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제목</th>
				    <td colspan="2"><a href="#">CPU 팔아요</a></td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">거래 방식</th>
				    <td colspan="2">직거래</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매자 ID</th>
				    <td colspan="2">hjajks78</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시글 상태</th>
				    <td>블라인드</td>
				    <td><form action=""><label><input type=checkbox value="check" name="check" checked disabled="disabled"/><b>블라인드</b></label></form></td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판/구매자 코드</th>
				    <td>판매자:x67854</td>
				    <td id="set">구매자:x45452</td> <!-- 어케합침... -->
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">코드 입력 여부</th>
				    <td>Y</td>
				    <td id="set">N</td>
				</tr>					
			</thead>
		</table>
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>상품정보</b></h2></div>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">카테고리</th>
				    <td>
				    	<select name="name" id="">
						    <option value="1">카테고리</option>
						    <option value="2">2</option>
						    <option value="3">3</option>
						    <option value="4">4</option>				    	
				    	</select>
				    </td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">물품명</th>
				    <td>i7 - 12700k</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제조사</th>
				    <td>인텔</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 가격</th>
				    <td>300,000원</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 장소</th>
				    <td>인천 계양구 새벌로 12번길 12</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 날짜</th>
				    <td>2022 - 05 - 23  ~ 2022 - 05 -26</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 시간</th>
				    <td>16시 ~ 18시</td>
				</tr>								
			</thead>
		</table>		
		
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>거래정보</b></h2></div>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매자ID</th>
				    <td>inseong12</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">가격</th>
				    <td>280,000원</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 일시</th>
				    <td>2022 - 05 - 24   17:30</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 장소</th>
				    <td>인천 광역시 계양구 새벌로 112번길 13 405동 관리사무소 앞</td>
				</tr>								
			</thead>
		</table>	
		
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>거래 완료 정보</b></h2></div>
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매 확정 일시</th>
				    <td></td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">가격</th>
				    <td>280,000원</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 일시</th>
				    <td>2022 - 05 - 24   17:30</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">직거래 장소</th>
				    <td>인천 광역시 계양구 새벌로 112번길 13 405동 관리사무소 앞</td>
				</tr>								
			</thead>
		</table>	
		

		<br /><br />
		<div style="margin-top: 20px;"><h2><b>입찰 내역</b></h2></div>
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">입찰자ID</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰 시간</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰가격</th>
				    <th style="background-color: #eeeeee; text-align: center;">입찰상태</th>
				</tr>
			</thead>	    
			<tbody>
				<tr>
				    <td>agsdag455</td>
				    <td>022-05-23  11:06:20</td>
				    <td>+28,000</td>
				    <td>낙찰(채택)</td>
				</tr>
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