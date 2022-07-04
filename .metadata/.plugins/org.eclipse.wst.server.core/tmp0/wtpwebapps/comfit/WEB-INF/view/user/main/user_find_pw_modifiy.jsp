<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_find_pw_modify.jsp</title>
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

<script type="text/javascript">
	
	$(function()
	{
		//alert("gd");
		$("#changeBtn").click(function()
		{
			$(".errMsg").css("display", "none");
			
			//alert($("#pw").val());
			var pw = $("#pw").val();
			var pw2 = $("#pw2").val();
			
			if(pw!=pw2)
			{	
				$(".errMsg").css("display", "inline");
			}	
			else 
			{	
				//alert("gdsd");
				$("#form23").submit();
			}
		})
		
		
	})

</script>

<body>

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
	
	<form action="changepassword2.action" method="post" id="form23">
	
		<input type="hidden" name="auth" value="${auth }" /> 		
	
		<span style="font-size: 25pt; font-weight: bold">비밀번호 변경</span>
		<br /><br />
		<span style="font-size: 15pt; font-weight: bold">새 비밀번호 입력</span>
		<br /> 
		<input type="text" id="pw" name="password" class="form-control" required="required" placeholder="새 비밀번호를 입력하세요" />
		<br /><br />
		<span style="font-size: 15pt; font-weight: bold">새 비밀번호 확인</span>
		<br />
		<input type="text" id="pw2" class="form-control" placeholder="비밀번호를 한번 더 입력하세요" required="required"/>
		<br />
		<span style="color:red; display: none;" class="errMsg" >입력하신 비밀번호가 일치하지 않습니다. 다시 입력해주세요</span>
		<br />
	</form>
	<button type="button" id="changeBtn" class="btn btn-primary" style="width: 200px; margin: auto; display: block;" >확인</button>
	</div>	
		<br /><br />
		
</div>	
	

		
		
		
		
		
		
	<!-- content  -->
	
	
	<!-- Footer 영역 -->
<!-- 	<div class="footer">
	</div> -->
	



</body>
</html>