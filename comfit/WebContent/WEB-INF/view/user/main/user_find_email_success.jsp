<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_find_email_success.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
     /* 	.bd-placeholder-img {
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
      } */
</style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>


<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	
	/* 
	.btn
	{
		margin: 10px;
	} */
</style>

<script type="text/javascript">

	$(function()
	{
		$("#login").click(function()
		{
			location.href="comfit.action"
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
	
	<div style="width: 500px; margin: auto; margin-top: 10%;">	
		<div style="font-size: 28pt; font-weight: bold; text-align: center;">
			이메일 찾기 완료
		</div>
		<hr />
		<div style="text-align: center;">
			
		<c:if test="${dto.u_email==null }">
			<script type="text/javascript">
				alert("일치하는 정보가 없습니다.")
				location.href = "comfit.action";			
			</script>
		</c:if>

			회원님은 <span style="color: #0174DF">${dto.u_email }</span>(으)로 등록하셨습니다.
			<br />
			가입일자는 <span style="color: #0174DF">${dto.u_joindate }</span>입니다.
		</div>
		<hr />
		
		<br />
		
		<div style="text-align: center;">
			<div style="display: block;">
				<button type="button" class="btn btn-primary" id="login">메인으로</button>
				<button type="button" class="btn btn-secondary">비밀번호 찾기</button>
			</div>
		</div>
	</div>	
	
	
	
</div>	
	
	
		
		



</body>
</html>