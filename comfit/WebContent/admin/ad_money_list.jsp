<%@page import="bbs.Bbs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.bbsDAO"%>
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
<title>ad_money_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
		<div style="margin-bottom: 20px"><h1><b>관리자모드_입출금관리</b></h1></div> 
		<table class="table table-bordered table-hover" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">회원ID</th>
					<th style="background-color: #eeeeee; text-align: center;">이름</th>
					<th style="background-color: #eeeeee; text-align: center;">입,출금</th>
					<th style="background-color: #eeeeee; text-align: center;">입출금 시간</th>
					<th style="background-color: #eeeeee; text-align: center;">입출금 은행</th>
					<th style="background-color: #eeeeee; text-align: center;">계좌</th>
					<th style="background-color: #eeeeee; text-align: center;">금액</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>afdj12</td>
					<td>김민성</td>
					<td>출금</td>
					<td>22.05.23  23:01:44	</td>
					<td>국민</td>
					<td>656502-750000</td>
					<td>70,000</td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: right;">
		<div class="btn-group" style="width: 30%;">
			<select class="form-select" style="width: 40%;">
			    <option selected>카테고리</option>
			    <option value="">1</option>
			    <option value="">2</option>
			</select> 
        <div class="input-group" style="width:100%;">
           <input type="text" class="form-control" placeholder="검색어를 입력하세요">
            <button id="Btn" type="button" class="btn btn-outline-primary">
          <i class="bi bi-search"></i>
            </button>                          
		</div>
		</div>
		</div>


</body>
</html>