<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_login.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .input-group
      {
      	width: 50%;
      	margin-left: 14px;
      	
      }
      #sellBtn
      {
      	width: 200px;
      }
      #dropdown-item
      {
      	width: 200px;
      }
</style>

<link href="headers.css" rel="stylesheet">


<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	
	
	.form-control
	{
		width: 350px;
	}
	.category
	{
		padding-top: 3%;
	}
	
	.pd_list
	{
		padding-top: 3%;
	}
	
	.title
	{
		margin-left: 42%;
		margin-top: 10%;
		font-size: 30pt;
	}
	
	.main
	{
		margin-top: 3%; 
	}
	
	

</style>

<script type="text/javascript">




		$(function()
		{
			<%
				String err = null;
				String hello = null;
				try
				{
					err = request.getParameter("err");
					hello = request.getParameter("hello");
					
					if(hello!=null)
					{	%>
							alert("환영합니다~!!!");
						<%
					}		
					
					if(err!=null)
					{	%>
							alert("조회결과가 없습니다!");
						<%
					}	
				}
				catch (Exception e)
				{
					System.out.println(e.toString());
				}
			%>
			
			$("#searchEmail").click(function()
			{
				location.href = "find_email_form.action";
			})
			
			$("#searchPw").click(function()
			{
				location.href = "find_pw_form.action";
			})

			
			
			$("#submitBtn").click(function()
			{
				//alert("gd");
				
				if ($("#u_email").val()== "" || $("#u_password").val()== "")
				{
					//alert("asfsa");
					$("#errMsg").html("항목을 모두 입력하셔야 합니다.").css("display", "inline");
				}
				else
				{
					$("#loginForm").submit();
					
				}
			});
		});

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

<div class="container" style="margin-top: 4%;">

	<!--
	<div class="title" style="margin: auto;">
		<img src="images/logo.png" alt="" style="width: 300px; height: auto; display: block; margin: 0px auto;"/>
	</div>
	-->
	<br /><br /><br />
	<div style="width: 400px; margin: auto;">
		<form action="login.action" class="form form-group" id="loginForm" method="post">
			
			<h2 class="h3 mb-3"><b>로그인</b></h2>
			
			<div class="form-floating">
			  <input type="email" class="form-control" id="u_email" name="u_email">
			  <label for="floatingInput">아이디를 입력하세요</label>
			</div>
			<div class="form-floating">
			  <input type="password" class="form-control" id="u_password" name="u_password">
			  <label for="floatingPassword">비밀번호를 입력하세요</label>
			</div>
				<button type="button" class="btn btn-primary" id="submitBtn" 
	  			style="width: 100%;">로그인</button>
	  		 
		</form>
		<span class="errMsg" id="errMsg" style="color:red; display: none;"></span>
		<!-- reCAPCHA -->
		<div style="display: none;"></div>
		
	<br /><br />
	
	<button type="button" id="searchEmail" class="btn btn-secondary" style="width: 150px;" >이메일찾기</button>
	<button type="button" id="searchPw" class="btn btn-secondary" style="width: 150px; float: right;">PW찾기</button>
	</div>
	
</div>



</body>
</html>