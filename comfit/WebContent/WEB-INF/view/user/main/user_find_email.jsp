<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_find_email.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
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
      
	#wrapper{
	  height: auto;
	  min-height: 100%;
	  padding-bottom: (footer높이);
	}
	footer{
	  height: (footer높이);
	  position : relative;
	  transform : translateY(-100%);
	}
</style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>


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
	
	.btn
	{
		/* margin: 20px; */
	}
	

</style>
<script type="text/javascript">

	function()
	{
		
	}

</script>
</head>
<body>

	<!-- Header 영역 -->
	<%-- <div style="display: none;">
		<c:import url="comfit_header_user.jsp"></c:import>
	</div> --%>

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
	<div style="width: 400px; margin: auto;" id="wrapper">
		<form action="find_email.action" class="form form-group" method="post">
			
			<div style="text-align: center; margin-bottom: 10%;">
			<button type="button" class="btn btn-primary" style="width: 150px; margin-right:20px; display: inline-block;" >이메일찾기</button>
			<button type="button" onclick="location.href='find_pw_form.action'" class="btn btn-secondary" style="width: 150px; margin-left:20px; display: inline-block;">비밀번호찾기</button>
			</div>
			<input type="text" id="u_email" name="u_name" class="form-control" placeholder="이름을 입력하세요" required="required"/>	 
			<br />
			<input type="text" id="u_tel" name="u_tel" class="form-control" placeholder="가입하신 전화번호를 입력하세요" required="required"/>
			<br />
			<button type="submit" id="search" class="btn btn-primary" style="width: 100%; display: inline-block;" >찾기</button>
		</form>
	
	<br /><br />
	
	
	
	</div>
	
</div>
	



</body>
</html>