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
<title>bbs.jsp</title>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>관리자모드_상품관리</b></h1></div> 
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="text-align: center;">카테고리</th>
					<th style="text-align: center;">등록일자</th>
					<th style="text-align: center;">판매자ID</th>
					<th style="text-align: center;">제목</th>
					<th style="text-align: center;">거래방식</th>
					<th style="text-align: center;">상태</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="product" items="${productlist}">
				<tr>
					<td>${product.cate_name}</td>
					<td>${product.regit_date}</td>
					<td>${product.u_email}</td>
					<td><a href="ad_product_list_direct.action">${product.pd_title}</a></td>
					<td>${product.ta_cate}</td>
					<td>${product.ta_status}</td>
				</tr>
				</c:forEach>
			</tbody>
		</table>

 
		<div style="text-align: right;">
		
		<div class="justify-content-end">
			<input type="checkbox" name="xxx" value="yyy" checked>블라인드 처리된 게시글만 보기
		</div>
		<div class="btn-group" style="width: 30%; text-align: right;">
			<select class="form-select" style="width: 40%; display: inline-block;">
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