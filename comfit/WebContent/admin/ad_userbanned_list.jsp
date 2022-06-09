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
<title>ad_userbanned_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>차단 회원 관리</b></h1></div> 
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">E-mail</th>
					<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
					<th style="background-color: #eeeeee; text-align: center;">차단기간</th>
					<th style="background-color: #eeeeee; text-align: center;">차단일시</th>
					<th style="background-color: #eeeeee; text-align: center;">차단내용</th>
					<th style="background-color: #eeeeee; text-align: center;">차단상세</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>yjooo0816@gmail.com</td>
					<td>이연주</td>
					<td>3일</td>
					<td>2022.05.05</td>
					<td>부적절한 게시물</td>
					<td>-</td>
				</tr>
			</tbody>
		</table>


		<div style="text-align: right;">
			<div class="btn-group" style="width: 30%; text-align: right;">
				<select class="form-select" style="width: 40%; text-align: right;">
				    <option selected>카테고리</option>
				    <option value="">1</option>
				    <option value="">2</option>
				</select> 
	        <div class="input-group" style="width:100%; text-align: right;">
	           <input type="text" class="form-control" placeholder="검색어를 입력하세요">
	            <button id="Btn" type="button" class="btn btn-outline-primary">
	          <i class="bi bi-search"></i>
	            </button>                          
			</div>
			</div>
		</div>
			
	</div>
</div>


</body>
</html>