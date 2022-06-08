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
<link href="assets/dist/css/bootstrap.min.css" rel="stylesheet">
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
    </style>
<link href="css/signin.css" rel="stylesheet">
</head>
<body class="text-center">
    
<main class="form-signin">
  <form action="ad_main.jsp">
    <img class="" src="images/logo.png" alt="" width="100%" height="100%" style="align-content: center; margin-left: 5px">
    <h2 class="h3 mb-3"><b>관리자 로그인</b></h2>

    <div class="form-floating">
      <input type="email" class="form-control" id="floatingInput" placeholder="name@example.com">
      <label for="floatingInput">아이디를 입력하세요</label>
    </div>
    <div class="form-floating">
      <input type="password" class="form-control" id="floatingPassword" placeholder="Password">
      <label for="floatingPassword">비밀번호를 입력하세요</label>
    </div>

    <button class="w-100 btn btn-lg btn-primary" type="submit">로그인</button>
    <p class="mt-5 mb-3 text-muted">&copy; 2022–2022</p>
  </form>
</main>


    
  </body>
</html>