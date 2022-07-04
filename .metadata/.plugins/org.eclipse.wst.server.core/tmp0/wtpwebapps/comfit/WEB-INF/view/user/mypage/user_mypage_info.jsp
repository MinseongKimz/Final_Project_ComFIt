<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>내 정보 확인/수정</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#btn-pw-modify").click(function()
		{
			location.href="pawsswordmodifyform.action";
		})
		
		
		$("#btn-tel-modify").click(function()
		{
			location.href="telmodifyform.action";
		})
		
		$("#btn-address-modify").click(function()
		{
			location.href="addressmodifyform.action";
		})
	})

</script>
<style type="text/css">

   .subheader
   {
      font-size: 25pt;
      font-weight: bold;
      margin-left: 15%;
      margin-top:5%;
   }
   .subheader_header
   {
      font-size: 20pt;
      font-weight: bold;
      margin-left: 25%;
   }
   
   .tablebts
   {
      width:50%;
      margin-left: 25%;
      border-radius:5px;
      table-layout:fixed;
       font-weight: bold;
       background-color: #FFFFFF;
       outline: 1px solid #E0E6F8;
       
     }
     
     .hi
     {
        margin-left: 38%;
     }
     
     .title
   {
      font-family: 맑은 고딕;
      font-size: 30pt;
   }
   .list-group 
   {
      width: 120px;
      text-align: center;
   }
   .list-group-item 
   {
      text-align: center;
      font-weight: bold;
   }
</style>
</head>
<body>


<!--Sidebar-->
<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">
	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>


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
    <div class="title" style="text-align: center; font-size: 28pt; font-weight: bold;">
		내 정보 확인/수정
	<br>
	</div>
      

	<table class="tablebts"  style="colspan:2; margin-top:2%;">

		<tr>
			<th>
				<a href="changeprofileform.action?u_id=<%=u_id%>">
				<img alt="" src="images/${userInfo.u_profile }"
				style="object-fit:cover; height: 70%; width: 70%; margin-left:120%;"></a>
			</th>
		</tr>
		<tr>
  			<td>이메일</td>
  			<td>${userInfo.u_email }</td>
		</tr>
		<tr>
  			<td>이름</td>
  			<td>${userInfo.u_name }</td>
		</tr>
		<tr>
			<td>닉네임</td>
			<td>${userInfo.u_nickname }</td>
		</tr>
		<tr>
  			<td>레벨</td>
  			<td>${level }</td>
		</tr>
		<tr>
  			<td>비밀번호</td>
  			<td>${userInfo.u_password }</td>
			<td>
				<button type="button" class="btn btn-primary btn-sm"id="btn-pw-modify" style="margin-left:45%;">변경하기</button>
			</td>
		</tr>
		<tr>
  			<td>휴대폰번호</td>
  			<td>${userInfo.u_tel }</td>
			<td>
				<button type="button" class="btn btn-primary btn-sm"id="btn-tel-modify" style="margin-left:45%;">변경하기</button>
			</td>
		</tr>
		<tr>
  			<td>주소</td>
  			<td>${userInfo.u_address }</td>
			<td>
				<button type="button" class="btn btn-primary btn-sm"id="btn-address-modify" style="margin-left:45%;">변경하기</button>
			</td>
       </tr>
	</table>
</div>
     

</body>
</html>