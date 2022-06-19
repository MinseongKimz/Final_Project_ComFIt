<%@page import="com.test.mybatis.ProductDTO"%>
<%@page import="java.util.ArrayList"%>
<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
	String searchKey = (String)request.getAttribute("searchKey");
	int sort = (int)request.getAttribute("sort");
	String categoryName = (String)request.getAttribute("categoryName");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_search_list.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style>
    
   .newList > div.card 
   {
      display: inline-block;
      /* float: left; */
      margin: 10px;
   }
   .lead
   {
      margin-top: 8px; margin-bottom: 8px;
   }
   .card
   {
		width: 14rem;
   }   
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		//alert($("#sortData").val());
		// sort에 따라 버튼 색 분기
		if ($("#sortData").val() == 2)
		{
			//$("#sort2Btn").attr("class", "btn btn-primary");
			$("#sort2Btn").removeClass("btn-secondary");
			$("#sort2Btn").addClass("btn-primary");
		}
		else if ($("#sortData").val() == 3)
		{
			$("#sort3Btn").removeClass("btn-secondary");
			$("#sort3Btn").addClass("btn-primary");
		}
		else if ($("#sortData").val() == 4)
		{
			$("#sort4Btn").removeClass("btn-secondary");
			$("#sort4Btn").addClass("btn-primary");
		}
		else if ($("#sortData").val() == 5)
		{
			$("#sort5Btn").removeClass("btn-secondary");
			$("#sort5Btn").addClass("btn-primary");
		}
		else
		{
			$("#sort1Btn").removeClass("btn-secondary");
			$("#sort1Btn").addClass("btn-primary");
		}
		
		$("#sort1Btn").click(function()
		{
			location.replace("searchlist.action?searchKey="+$("#searchData").val()+"&sort=1");
		});
		
		$("#sort2Btn").click(function()
		{
			location.replace("searchlist.action?searchKey="+$("#searchData").val()+"&sort=2");
		});
		
		$("#sort3Btn").click(function()
		{
			location.replace("searchlist.action?searchKey="+$("#searchData").val()+"&sort=3");
		});
		
		$("#sort4Btn").click(function()
		{
			location.replace("searchlist.action?searchKey="+$("#searchData").val()+"&sort=4");
		});
		
		$("#sort5Btn").click(function()
		{
			location.replace("searchlist.action?searchKey="+$("#searchData").val()+"&sort=5");
		});
		
		
	});

</script>
</head>
<body>

<!-- Header 영역 -->
<%
	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != null)
	{	
%>
		<div class="header">
			<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
		</div>
<%	}
	else
	{
%>
	<div>
   		<c:import url="/WEB-INF/view/user/main/comfit_header_nolog.jsp"></c:import>
	</div>
<%	} %>	
	
<!-- contanier 영역 -->
<div class="container">

	<!-- 상품 검색 결과 -->
	<div>
		<div>	
		    <!-- 카테고리선택으로 오는 경우의 수도 있기때문에 일단 주석처리. -->
			<%-- <span style="font-size: 30pt;">
			"<%=searchKey %>"에 대한 검색 결과</span> --%>
			<input type="hidden" value=<%=searchKey %> id="searchData"/>
			<input type="hidden" value=<%=sort %> id="sortData"/>
			
		</div>
		<%if(searchKey != null)
		{
		%>
		<div style="text-align: right; margin-top: 2%;">
			<button id="sort1Btn" type="button" class="btn btn-secondary">최신순</button>
			<button id="sort2Btn" type="button" class="btn btn-secondary">고가순</button>
			<button id="sort3Btn" type="button" class="btn btn-secondary">저가순</button>
			<button id="sort4Btn" type="button" class="btn btn-secondary">직거래만</button>
			<button id="sort5Btn" type="button" class="btn btn-secondary">택배거래만</button>
		</div>
		<%
		}
		%>
	   <br />
	   <br />
	   
	   <div class="row">
			<div class="col-md-12 text-center">
		        <div class="newList">
		        
		        	<c:forEach var="product" items="${searchList }">
		        	   <div class="card">
		           	     <img alt="" src="images/${product.pd_photo }"
						class="card-img-top" style="width: 220px; height: 140px;">
		             	 <div class="card-body">
		                 <h5 class="card-title" style="text-align: center;">${product.pd_title }</h5>
		                 <p class="card-text"  style="text-align: center;">${product.pd_price }</p>
		                 <p class="card-text"  style="text-align: center;">${product.system }</p>
		                 <c:if test="${product.status }!= '입찰중' || '입찰받는중' || '제안받는중'">
		                 	<p class="card-text"  style="text-align: center;">거래완료상품</p>
		                 </c:if>
		                 <a href="pd_detail.action?pd_id=${product.pd_id }" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
		              	</div>
		           </div>
		        </c:forEach>
		        	</div><!-- newList.close -->
		        <br/>   
	    	</div><!-- col-md-12 text-center.close -->
	    </div>
	</div>
</div>	<!-- content  -->
	
	
<!-- Footer 영역 -->
<div class="footer">
</div>



</body>
</html>