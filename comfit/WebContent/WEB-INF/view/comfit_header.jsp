<%@ page contentType="text/html; charset=UTF-8"%>
<%
	request.setCharacterEncoding("UTF-8");
	String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>comfit 나만의 컴퓨터</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
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
      	margin-left: 5px;
      	
      }
    </style>

<link href="headers.css" rel="stylesheet">

</head>
<body>
<div>
  <header class="bg-white text-dark">
    <div class="container" style="margin-top: 1%; margin-left: 16%;">
      <div class="d-flex flex-wrap align-items-center justify-content-center justify-content-lg-start" >
        <a href="/" class="d-flex align-items-center mb-2 mb-lg-0 text-decoration-none text-dark "> 
        	<img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;">
        </a>
	
    <div class="input-group mb-2 col-xl-7" >
	  <span class="input-group-text" id="inputGroup-sizing-default"><i class="bi bi-search"></i></span>
	  <input type="text" class="form-control" placeholder="원하시는 상품을 검색하세요.">
	</div>

        <div class="text-end col-xl-3 justify-content-end" >
          <button type="button" class="btn btn-primary">로그인</button>
          <button type="button" class="btn btn-secondary">회원가입</button>
          <button type="button" class="btn btn-dark">고객센터</button>
        </div>
      
    </div>
    </div>
  </header>
</div>  
</body>
</html>