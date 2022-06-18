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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		//alert("테스트");
		
		$("#searchBtn").click(function()
		{
			
			// 카테고리 설정 안하고 검색했을때 걸러내기
			if ($(".listselect").val() == "카테고리")
			{
				alert("검색 카테고리를 설정해 주세요.");
				return;
			}
			
			alert($("#listselect").val()); //u_email, 
			alert($("#searchvalue").val()); //서치값
			
			$(location).attr("href", "/comfit/admin_money_searchlist.action?listselect="+$("#listselect").val()+"&searchvalue="+$("#searchvalue").val());
		});		
	});

</script>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>관리자모드_입출금관리</b></h1></div> 
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="text-align: center;">회원ID</th>
					<th style="text-align: center;">이름</th>
					<th style="text-align: center;">입,출금</th>
					<th style="text-align: center;">입출금 시간</th>
					<th style="text-align: center;">입출금 은행</th>
					<th style="text-align: center;">계좌</th>
					<th style="text-align: center;">금액</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="moneylist" items="${moneylist}">
				<tr>
					<td>afdj12</td>
					<td>${moneylist.u_name }</td>
					<td>${moneylist.io_type }</td>
					<td>${moneylist.io_date }</td>
					<td>${moneylist.bank_name }</td>
					<td>${moneylist.account }</td>
					<td>${moneylist.money }</td>
				</tr>
			</c:forEach>	
			</tbody>
		</table>

		<div style="text-align: right;">
		<div class="btn-group" style="width: 30%;">
			<select class="form-select listselect" id="listselect" style="width: 40%;">
				<option selected>카테고리</option>
			    <option value="u_name">이름</option>
			    <option value="io_type">입출금</option>
			    <option value="bank_name">은행</option>
			</select> 
        <div class="input-group" style="width:100%;">
           <input type="text" class="form-control" id="searchvalue" placeholder="검색어를 입력하세요">
            <button id="searchBtn" type="button" class="btn btn-outline-primary">
          <i class="bi bi-search"></i>
            </button>                          
		</div>
		</div>
		</div>
		
	</div>
</div>


</body>
</html>