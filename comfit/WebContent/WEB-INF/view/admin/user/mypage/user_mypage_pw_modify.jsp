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
<title>비밀번호 수정</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">


	$(document).ready(function()
	{
		$("#btn-modify-success").click(function()
		{
			location.href="user_information.action";
		})
	})
	

</script>

<style type="text/css">

	.subheader
	{
		font-size: 25pt;
		font-weight: bold;
	}
	.tablebts
	{
		border-radius:5px;
		margin-top:5%;
    	font-weight: bold;
    	display: inline-block;
  	}
  	.btn
  	{
  		width: 10%;
  	}
  	
</style>

</head>
<body>



<!--Sidebar-->
<div style="float:left; margin-left: 10px; margin-top: 20%; position: fixed;">
	<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
</div>

<!--Header  -->
<div class="header">
     <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>

<div class="container" style="text-align: center;">
  	<!--Content  -->
  	<div>
  		<p class="subheader">비밀번호 수정</p>
  	</div>
  
  	<table class="tablebts" style="text-align: left;">
  		<tr>
  			<td>현재 비밀번호</td>
  			<td>
  				<input class="form-control" type="text" placeholder="비밀번호를 입력하세요" />
  			</td>
  		</tr>
  		<tr>
  			<td>새 비밀번호</td>
  			<td>
  				<input class="form-control" type="text" placeholder="새 비밀번호를 입력하세요" />
  			</td>
  		</tr>
  		<tr>
  			<td>새 비밀번호 확인</td>
  			<td>
  				<input class="form-control" type="text" placeholder="새 비밀번호를 재입력해주세요" />
  			</td>
  		</tr>
  	</table>
  	
  	<div style="margin-top: 2%;">
		<button class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#check">확인</button>
		<button class="btn btn-secondary" >취소</button>
  	</div>
  	
<!-- Modal 입금 확인 -->
	<div class="modal fade" id="check" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	         <h3 style="color: #0000ff; font-weight: bold;">Comfit</h3><br />
	         
	         <span class="ibgum" style="font-size: 15px;">비밀번호 수정이 완료되었습니다.</span><br />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="btn-modify-success" aria-label="Close" data-bs-dismiss="modal">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
</div>

</body>
</html>