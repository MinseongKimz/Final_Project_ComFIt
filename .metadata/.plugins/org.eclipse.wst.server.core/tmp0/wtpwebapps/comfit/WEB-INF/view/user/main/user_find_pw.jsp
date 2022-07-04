<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_find_pw.jsp</title>
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
</style>



<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.form-control
	{
		width: 200px;
	}
	
</style>
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

	
<div style="margin: auto;">
	<div style="text-align: center; margin-top: 6% ">
		<button type="button" onclick="location.href='find_email_form.action'"  class="btn btn-secondary" style="margin-right: 20px; width: 120px;" >이메일 찾기</button>
		<button type="button" class="btn btn-primary" style="margin-left: 20px; width: 120px;">PW 찾기</button>
	</div>
	<br />
	<form action="find_pw.action" method="post">
	<div style="width: 300px; margin: auto;">
	<input type="text" name="u_email" class="form-control" placeholder="이메일을 입력하세요" required="required">
	<br />
	<input type="text" name="u_name" class="form-control" placeholder="이름을 입력하세요" required="required"/>
	<br />
	<input type="text" name="u_tel" class="form-control" placeholder="전화번호를 입력하세요" required="required"/>
	<br />
	<br />
	<button type="submit" class="btn btn-primary" style="width: 300px;" >확인</button>
	</div>
	</form>
	<br /><br />
	
</div>	
	

		




</body>
</html>