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

<!-- 내가 올린 게시물 보는 사이트  -->
<style type="text/css">

	/* div {border: 1px solid black;} */
	
	.table-bordered  tr th{
		border : 1px solid grey;
		text-align: center;
	}
	
	.table-bordered  tr td{
		border : 1px solid grey;
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
		
		
		
		 
	 	 $("#ask_id").click(function()
		{
			//alert("수정");
			location.href="user_ask_modify_form.action?ask_id="+$(this).val();
		}) 
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
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.action'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list.action'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-primary" style="margin: 7px;" onclick="location.href='user_ask_list.action'">내 문의내역</button>
	</div>
	<br /><br />
	<div style="margin-left: 20%; margin-right: 20%;">
		<div class="container"> 
			<div style="font-weight: bold; font-size: 22pt;">내 문의 게시글</div>
			<br />
				<table class="table table-bordered" >
				<c:forEach var="asklist" items ="${asklist }">
					<tr>
						<th>제목</th>
						<td>${asklist.ask_title }</td>
					</tr>
					<tr>
						<th>작성날짜</th>
						<td>${asklist.ask_date }</td>
					</tr>
					<tr >
						<th>카테고리</th>
						<td>${asklist.ask_cate_name }</td>
					</tr>
					<tr>
						<th style="height: 300px; vertical-align: middle;">내용</th>
						<td>${asklist.ask_contents }</td>
					</tr>
				</c:forEach>
				</table>
		<div >
			<button type="button" class="btn btn-primary" style="margin: 7px; float: right;" data-bs-toggle="modal" data-bs-target="#deleteModal">삭제하기</button>
			<button type="submit" class="btn btn-primary" id="ask_id" name="aks_id" value="${askModifyForm.ask_id }"  style="margin: 7px; float: right;" >수정하기</button>
		</div>

		</div> 
		
		<!-- deleteModal -->
		<div class="modal fade" id="deleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <!-- <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">삭제하기</h5> -->
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      <div class="modal-body" style="text-align: center;">
		        정말로 삭제하시겠습니까?
		      </div>
		      <div class="modal-footer">
		      	<div style="margin:auto; display:block;">
		        <button type="submit" class="btn btn-secondary" data-bs-dismiss="modal" style="width: 100px;" onclick="location.href='user_ask_my_list.action'">아니오</button>
		        <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#complete" style="width: 100px;">네</button>
		        </div>
		      </div>
		    </div>
		  </div>
		</div>
		
		<div class="modal fade" id="complete" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <!-- <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">삭제하기</h5> -->
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      <div class="modal-body" style="text-align: center;">
		        삭제가 완료되었습니다
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" onclick="location.href='user_ask_list.jsp'" style="margin:auto; display:block; width: 50%;">확인</button>
		        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">네</button> -->
		      </div>
		    </div>
		  </div>
		</div>
		
		
		
		
		
		
	</div>
</div>
</body>
</html>




























