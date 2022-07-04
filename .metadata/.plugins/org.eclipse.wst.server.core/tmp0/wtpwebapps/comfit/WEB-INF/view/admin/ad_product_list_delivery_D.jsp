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
	<h1><b>관리자모드_상품상세_택배</b></h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
	<span style="color: red; margin-bottom: 10px;">※ 해당 상품은 신고가 접수되었습니다.</span>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
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
				    <td colspan="2">택배거래</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매자 ID</th>
				    <td colspan="2">hjajks78</td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">게시글 상태</th>
				    <td>
						<select class="form-select" style="width: 50%; display: inline-block;">
						    <option selected>카테고리</option>
						    <option value="">1</option>
						    <option value="">2</option>
						</select>
				    </td>
				    <td><form action=""><label><input class="form-check-input" type="checkbox" value="" id="flexCheckChecked" checked>블라인드</label></form></td>
				</tr>							
			</thead>
		</table>
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>상품 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">카테고리</th>
				    <td>
						<select class="form-select" style="width: 50%; display: inline-block;">
						    <option selected>카테고리</option>
						    <option value="">1</option>
						    <option value="">2</option>
						</select>
				    </td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">물품명</th>
				    <td>청축 키보드</td>
				</tr>		
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">제조사</th>
				    <td>중국</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">희망 가격</th>
				    <td>300,000원</td>
				</tr>								
			</thead>
		</table>		
		
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>거래 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
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
				    <th style="background-color: #eeeeee; text-align: center;">구매 일시</th>
				    <td>2022 - 05 - 24   17:30</td>
				</tr>			
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">배송 장소</th>
				    <td>인천 광역시 계양구 새벌로 112번길 13 405동 관리사무소 앞</td>
				</tr>								
			</thead>
		</table>	
		
		
		<br /><br />
		<div style="margin-top: 20px;"><h2><b>거래 완료 정보</b></h2></div>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: 700px">
			<thead><!-- 제목 -->
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">구매 확정 일시</th>
				    <td colspan="2"></td>
				</tr>
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">판매 확정 일시</th>
				    <td colspan="2"></td>
				</tr>				
				<tr>
				    <th style="background-color: #eeeeee; text-align: center;">운송장</th>
				    <td>우체국</td>
				    <td id="set">asdf45679849656</td> 
				</tr>								
			</thead>
		</table>	
		

		<br /><br />
		<div style="margin-top: 20px;"><h2><b>입찰 내역(제안 내역)</b></h2></div>
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
				<tr>
				    <td>agsdag455</td>
				    <td>022-05-23  11:06:20</td>
				    <td>+28,000</td>
				    <td>낙찰(채택)</td>
				</tr>
			</tbody> 
				    
		</table>					
		
		<br />
		<br />
		<br />
		
				<div style="margin-left: 570px">		
					<button type="button" class="btn btn-primary">저장</button>	
					<button type="button" class="btn btn-outline-secondary">삭제</button>	
				</div>
		
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />
		<br />


	</div>
</div>

</body>
</html>