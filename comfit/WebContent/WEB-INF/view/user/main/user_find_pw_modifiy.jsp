<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_find_pw_modify.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
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
<script type="text/javascript" src="/js/bootstrap.js"></script>


<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}

	
	.form-control
	{
		width: 250px;
	}
	.category
	{
		padding-top: 3%;
	}
	
	.pd_list
	{
		padding-top: 3%;
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
	
	<!-- title -->
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

<div class="container" style="margin-top: 8%;">
	<div style="width: 500px; margin: auto;">
		<span style="font-size: 25pt; font-weight: bold">비밀번호 변경</span>
		<br /><br />
		<span style="font-size: 15pt; font-weight: bold">새 비밀번호 입력</span>
		<br /> 
		<input type="text" class="form-control" placeholder="새 비밀번호를 입력하세요"/>
		<br /><br />
		<span style="font-size: 15pt; font-weight: bold">새 비밀번호 확인</span>
		<br />
		<input type="text" class="form-control" placeholder="비밀번호를 한번 더 입력하세요"/>
		<br /><br />
		<input type="text" class="errMsg" placeholder="입력하신 비밀번호가 일치하지 않습니다. 다시 입력해주세요" style="color:red; display: none;"/>
		
		<button type="button" class="btn btn-primary" style="width: 200px; margin: auto; display: block;" >확인</button>
	</div>	
		<br /><br />
		
</div>	
	

		
		
		
		
		
		
	<!-- content  -->
	
	
	<!-- Footer 영역 -->
<!-- 	<div class="footer">
	</div> -->
	



</body>
</html>