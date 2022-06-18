<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 문의내역</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


<style type="text/css">

	/* div {border: 1px solid black;} */
	
	.table-bordered  tr th{
		border : 1px solid grey;
		text-align: center;
	}
	
	.table-bordered  tr td{
		border : 1px solid grey;
	}
	
	.table-borderless tr th{
		padding: 20px;
		height: 30px; 
		width: 180px;
		
	}
	
	.table-borderless tr td{
		padding: 8px;
		
	}
	
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		                                          
		$("#notice").hover(function()             
		{                                         
			//alert("테스트");                       
			                                      
			$(this).removeClass("btn-secondary"); 
			$(this).addClass("btn-primary");      
		}, function()                             
		{                                         
			$(this).removeClass("btn-primary");   
			$(this).addClass("btn-secondary");    
		});	                                      
		                                          
		$("#faq").hover(function()                
		{                                         
			//alert("테스트");                       
			                                      
			$(this).removeClass("btn-secondary"); 
			$(this).addClass("btn-primary");      
		}, function()                             
		{                                         
			$(this).removeClass("btn-primary");   
			$(this).addClass("btn-secondary");    
		});                                       
		                                          
		$("#ask").hover(function()                
		{                                         
			//alert("테스트");                       
			                                      
			$(this).removeClass("btn-secondary"); 
			$(this).addClass("btn-primary");      
		}, function()                             
		{                                         
			$(this).removeClass("btn-primary");   
			$(this).addClass("btn-secondary");    
		});		                                  
		
		
		
	})
	
</script>
</head>

<body>

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

<div class="content">
<br /><br /><br />
	
	<br />
	<div class="btns" style="text-align: center;">
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.jsp'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list.jsp'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_ask_list.jsp'">내 문의내역</button>
	</div>
	<br /><br />
	
	
	<br />
	<div style="margin-left: 20%; margin-right: 20%;">
		<div style="font-weight: bold; font-size: 22pt;">문의 게시글</div>
		<br />
		<div class="container"> 
		
		
			<table class="table table-bordered" >
				<tr >
					<th>카테고리</th>
					<td>포인트</td>
				</tr>
				<tr>
					<th>제목</th>
					<td>사기당했습니다...</td>
				</tr>
				<tr>
					<th>작성날짜</th>
					<td>2022-05-29 18:54:32</td>
				</tr>
				<tr>
					<th style="height: 200px; vertical-align: middle;">내용</th>
					<td>사기를 당했습니다.. 책임져 주십시오</td>
				</tr>
			</table>
			<br />
			
			<div style="font-weight: bold; font-size: 22pt;">답변</div>
			<br />
		
	
			<table class="table-borderless" style="width:100%; background-color: #EFF8FB; padding: 20px; border-radius: 20px;">
				<tr>
					<th>제목</th>
					<td>사기당했습니다... 의 답변입니다.</td>
				</tr>
				<tr>
					<th>답변날짜</th>
					<td>2022-05-30 18:54:32</td>
				</tr>
				<tr>
					<th style="height: 100px;">답변</th>
					<td>기분탓입니다. 좋은하루되세요^^</td>
				</tr>
			</table>
		
		
		
		</div> 
		<br /><br /><br />
		
		
		
	</div>
</div>

</body>
</html>




























