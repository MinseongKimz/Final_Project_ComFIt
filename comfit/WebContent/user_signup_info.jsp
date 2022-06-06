<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_signup_info.jsp</title>
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
      .table
      {
      	width: 450px;
      }
</style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript">
	function findAddr()
	{
		window.open("user_signup_find_address.jsp", "주소검색", "width=800, height=550");
	}
	
</script>

<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.content
	{
		margin-top: 3%;
		margin-left: 40%;
		margin-right: 30%;
	}
	
	.txtbox
	{
		width: 160px;
	}
	.txtbox2
	{
		width: 90px;
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
	
	<!-- title -->
<div class="title">
	<img src="images/logo.png" alt="" style="width: 300px; height: auto;"/>
			<!-- Content 영역 -->
</div>
	
<div class="content">
	<span style="font-size: 30pt; font-weight: bold;">Comfit 회원가입</span>
	<table class="table">
		<tr>
			<th>이름</th>
			<th>
				<input type="text" class="txtbox"/>
			</th>
		</tr>
		<tr>
			<th>이메일</th>
			<th>
				<input type="text" class="txtbox2"/> @
				<select name="email" id="email" class="txtbox2">
					<option value="userEmail">직접입력</option>
					<option value="naver">naver.com</option>
					<option value="naver">gmail.com</option>
					<option value="naver">daum.net</option>
				</select>
				<button type="button" class="btn btn-primary">중복검사</button>
				<br />
				<input type="text" class="errMsg" style="display: none;" placeholder="유효하지 않은 이메일입니다." />
			</th>
 
		</tr>
		<tr>
			<th>비밀번호</th>
			<th>
				<input type="password" class="txtbox"/>
			</th>
		</tr>
		<tr>
			<th>
				비밀번호 확인
			</th>
			<th>
				<input type="password" class="txtbox"/>
				<br />
				<span style="font-size: 8pt; color: skyblue;">8자리 이상(영어, 숫자, 특수문자 각 1개 포함) </span>
			</th>
		</tr>
		<tr>
			<th>
				휴대폰 번호
			</th>
			<th>
				<input type="text" class="txtbox"/>
			</th>
		</tr>
		<tr>
			<th>
				닉네임
			</th>
			<th>
				<input type="text" class="txtbox"/>
				<button type="button" class="btn btn-primary">중복검사</button>
				<br />
				<input type="text" class="errMsg" style="display: none;" placeholder="유효하지 않은 이메일입니다." />
			</th>
		</tr>
		<tr>
			<th>
				주소
			</th>
			<th>
				<input type="text" class="txtbox"/>
				<button type="button" class="btn btn-primary" onclick="findAddr()">주소검색</button>
			</th>
		</tr>
		<tr>
			<th>
				상세주소
			</th>
			<th>
				<input type="text" class="txtbox"/>
			</th>
		</tr>
		<tr>
			<th colspan="2" style="text-align: center;">
			<button type="button" class="btn btn-secondary" style="width: 160px;" >취소</button>
			<button type="button" class="btn btn-primary" style="width: 160px;" >회원가입</button>
			</th>
		</tr>
	</table>
	
	

	<br /><br />
	
</div>	
	

		
		
		
		
		
		
	<!-- content  -->
	
	
	<!-- Footer 영역 -->
<!-- 	<div class="footer">
	</div> -->
	



</body>
</html>