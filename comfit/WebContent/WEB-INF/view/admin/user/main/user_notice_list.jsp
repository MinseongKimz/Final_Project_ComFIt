<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

	/* div {border: 1px solid black;} */
	
	div #b
	{
		margin-bottom: 10px;		
	}
	
</style>
<script type="text/javascript">

	$(document).ready(function()
	{
		
		
		/*
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
		*/
		
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
		<button type="button" id="notice" class="btn btn-primary" style="margin: 7px;" onclick="location.href='user_notice_list.action'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list.action'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_ask_list.action'">내 문의내역</button>
	</div>
	<br /><br />
	
	<div style="margin-left: 20%; margin-right: 20%;">
		<div style="text-align: center; font-weight: bold; font-size: 22pt; background-color: #EFF2FB; height: 70px; line-height:70px; border: 1px solid black;">공지사항</div>
		<br />
		
	<c:forEach var = "notice" items="${usernoticeList}">
		<div class="accordion" id="accordionExample">
		  <div class="accordion-item">
		    <h2 class="accordion-header" id="headingOne">
		      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
		        ${notice.announce_title }
		      </button>
		    </h2>
		    <div id="collapseOne" class="accordion-collapse collapse" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
		      <div class="accordion-body">
		        ${notice.announce_contents }
		      </div>
		    </div>
		  </div>
		 </div>
		</c:forEach>
	  </div>


<br /><br /><br /><br /><br /><br />
















</body>
</html>