<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<link rel="stylesheet"href="css/main.css"type="text/css">
<script type="text/javascript"src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"rel="stylesheet"integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"crossorigin="anonymous"></script>
<link rel="stylesheet"href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

	/* div {border: 1px solid black;} */
	
	
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
		 
		/* 
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
		*/
		
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



<div class="container">
<br /><br /><br />
	
	<br />
	<div class="btns" style="text-align: center;">
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.action'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list.action'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-primary" style="margin: 7px;" onclick="location.href='user_ask_list.action'">내 문의내역</button>
	</div>
	<br /><br />
	
	<div style="margin-left: 10%; font-weight: bold; font-size: 22pt;">내 문의내역</div>
	<br /><br />
	<div style="margin-left: 10%; margin-right: 10%;">
		<c:forEach var="asklist" items ="${asklist }">
		<table class="table">
		  <thead>
		    <tr style="background-color: #EFF2FB;">
		      <th class="col-md-7">${asklist.ask_title }</th>
		      <th class="col-md-2">문의 날짜</th>
		      <!-- <th class="col-md-1.5">처리상태</th> -->
		      <th class="col-md-1.5">문의 카테고리</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td class="col-md-7"  onclick="location.href='user_ask_my_list.action'">${asklist.ask_contents }</td>
		      <td class="col-md-2">${asklist.ask_date }</td>
		      <!-- <td class="col-md-1.5">처리완료</td> -->
		      <td class="col-md-1.5">${asklist.ask_cate_name }</td>
		    </tr>
		   
		   
		  </tbody>
		</table>
	</c:forEach> 
		
		<div>
			<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='user_ask_add.jsp'">문의등록</button>
		</div>
		
		

				</div>
			</div>
</body>
</html>






























