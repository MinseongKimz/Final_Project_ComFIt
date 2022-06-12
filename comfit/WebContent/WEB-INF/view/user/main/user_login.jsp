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
</head>


<body>

	<!-- Header 영역 -->
	<%-- <div style="display: none;">
		<c:import url="comfit_header_user.jsp"></c:import>
	</div> --%>

<div>
   <c:import url="/WEB-INF/view/user/main/comfit_header_nolog.jsp"></c:import>
</div>

	
<div class="container" style="margin-top: 4%;">

	<!--
	<div class="title" style="margin: auto;">
		<img src="images/logo.png" alt="" style="width: 300px; height: auto; display: block; margin: 0px auto;"/>
	</div>
	-->
	<br /><br /><br />
	<div style="width: 400px; margin: auto;">
		<form action="" class="form form-group">
			<a href="ad_login.jsp" > 
				<%-- <img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;"> --%>
			</a>
			<h2 class="h3 mb-3"><b>로그인</b></h2>
			
			<div class="form-floating">
			  <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
			  <label for="floatingInput">아이디를 입력하세요</label>
			</div>
			<div class="form-floating">
			  <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
			  <label for="floatingPassword">비밀번호를 입력하세요</label>
			</div>
			<input type="text" class="errMsg" placeholder="아이디 혹은 비밀번호가 틀렸습니다. 다시 로그인해주세요." style="color:red; display: none;"/>
		</form>
	
		<!-- reCAPCHA -->
		<div style="display: none;"></div>
		
	<button type="button" class="btn btn-primary" style="width: 100%;" onclick="location.href='user_mainlist.action'">로그인</button>

	<br /><br />
	
	
	<button type="button" class="btn btn-secondary" style="width: 150px;" >회원가입</button>
	<button type="button" class="btn btn-secondary" style="width: 150px; float: right;">ID/PW 찾기</button>
	</div>
	
</div>


		

	



</body>
</html>