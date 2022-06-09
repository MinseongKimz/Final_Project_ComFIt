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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>Insert title here</title>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<form action="">
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="3" style="background-color: #ffffff; text-align: center;">김민성 님의 문의 내역</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td style="width: 20%;">글 제목</td>
					<td colspan="2">안녕하세요...</td>
				</tr>
				<tr>
					<td style="width: 20%;">작성일자</td>
					<td colspan="2">2022-06-05</td>
				</tr>
				<tr>
					<td style="width: 20%;">처리 상황</td>
					<td colspan="2">처리 진행 중</td>
				</tr>		
				<tr>
					<td style="width: 20%;">카테고리</td>
					<td colspan="2">상품문의</td>
				</tr>											
				<tr>
					<td>내용</td>
					<td colspan="2" style="min-height:200px; text-align: left;">
					안녕하세요 제가 얼마전에 물건을 샀는데 하자가 있었습니다.
					</td>
				</tr>				
			</tbody>			
		</table>
		
		</form>
		
		
		<br /><br />
		<h2><b>답변하기</b></h2>
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd; width: ">
			<thead><!-- 제목 -->
				<tr class=""><!-- 1행 -->
					<th colspan="3" style="background-color:#F2F2F2">
					[운영자] 안녕하세요 김민성 님
					</th>
				</tr>
			</thead>			
			<tbody>
				<tr>
					<td colspan="3" style="min-height:200px; text-align: left;">
					<textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 300px; width: 1300px;"></textarea></div>					
					</td>
				</tr>				
			</tbody>
		</table>	
		<div style="border: 1px solid gray;"> 정렬하고... 박스 크기 신경쓰여
			<button class="btn btn-primary" value="글쓰기" style="width: 150px;">수정하기</button>
			<button class="btn btn-outline-secondary" value="글쓰기" style="width: 150px;">삭제하기</button>
			<button class="btn btn-outline-secondary" value="돌아가기" style="width: 150px" onclick="location.href='ad_ask_list.jsp'">돌아가기</button>		
		</div>
	</div>
</div>




</body>
</html>