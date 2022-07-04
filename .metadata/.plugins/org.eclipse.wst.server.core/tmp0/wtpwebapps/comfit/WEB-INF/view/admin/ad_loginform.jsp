<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ad_login.jsp</title>
<link rel="canonical" href="https://getbootstrap.com/docs/5.0/examples/sign-in/">
<link href="<%=cp%>/assets/dist/css/bootstrap.min.css" rel="stylesheet">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
html,
body {
  height: 100%;
}

body {
  display: flex;
  align-items: center;
  padding-top: 40px;
  padding-bottom: 40px;
  background-color: #f5f5f5;
}

.form-signin {
  width: 100%;
  max-width: 330px;
  padding: 15px;
  margin: auto;
}

.form-signin .checkbox {
  font-weight: 400;
}

.form-signin .form-floating:focus-within {
  z-index: 2;
}

.form-signin input[type="email"] {
  margin-bottom: -1px;
  border-bottom-right-radius: 0;
  border-bottom-left-radius: 0;
}

.form-signin input[type="password"] {
  margin-bottom: 10px;
  border-top-left-radius: 0;
  border-top-right-radius: 0;
}
    
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
</style>
<script type="text/javascript">
	
	/* 로그인 jquery */
	$(document).ready(function()
	{
		// alert("창 확인");
		$("#adLoginBtn").click(function()
		{
			//alert("로그인 버튼 클릭");
			
			if ($("#ad_id").val() == "")
			{
				$(".idErrMsg").html("ID를 입력해 주세요.");
				$(".idErrMsg").css('display', 'block');
				$("#ad_id").focus();
				return;
			}
			
			if ($("#ad_pw").val() == "")
			{
				$(".pwErrMsg").html("PW를 입력해 주세요.");
				$(".pwErrMsg").css('display', 'block');
				$("#ad_pw").focus();
				return;
			}
			
			$("#ad_id").attr("action","");

			$("form").submit();
				
			$("loginform").submit();

</script>

   
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
    
<main class="form-signin">
  <form action="ad_login.action" method="post" id="loginform">
            <a href="ad_loginform.action" > 
	           <img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;">
	        </a>
    <h2 class="h3 mb-3"><b>관리자 로그인</b></h2>

    <div class="form-floating">
      <input type="text" class="form-control" id="ad_id" name="ad_id" placeholder="name">
      <label for="floatingInput" id="ad_id">아이디를 입력하세요</label>
      <span style="color:red; display: none;" class="idErrMsg"></span>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="ad_pw" name="ad_pw" placeholder="Password">
      <label for="floatingPassword" id="ad_pw">비밀번호를 입력하세요</label>
      <span style="color:red; display: none;" class="pwErrMsg"></span>
    </div>

    <button class="w-100 btn btn-lg btn-primary" id="adLoginBtn" type="submit">로그인</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2022–2022</p>
  </form>
</main>


    
  </body>
</html>