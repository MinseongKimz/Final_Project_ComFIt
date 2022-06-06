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
    *
    {
    color: black;
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
      .input-group
      {
         width: 50%;
         margin-left: 14px;
         
      }
      #mypage
      {
         font-family: 맑은 고딕;
         font-weight: bold;
         font-size: 18pt;
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


</head>
<body>
<div>
  <header>
    <!-- nav 상단 고정-->
        <nav class="navbar navbar-expand-md">
        <div class="container">
            <a href="/" > 
	           <img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;">
	        </a>
	        
            <button class="navbar-toggler bg-dark " type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav-menu"
                aria-controls="navbarNav-menu" aria-expanded="false" aria-label="Toggle navigation">
                <span class="navbar-toggler-icon"></span>
            </button>
            
            <div class="collapse navbar-collapse justify-content-between " id="navbarNav-menu">
                 <form class="form-inline" style="width: 50%;">
				     	<div class="input-group" style="width:80%;">
						     <span class="input-group-text" id="inputGroup-sizing-default"><i class="bi bi-search"></i></span>
						     <input type="text" class="form-control" placeholder="원하시는 상품을 검색하세요.">
	  					</div>
                </form>
                <ul class="navbar-nav ">
                    <li class="nav-item">
                        <button type="button" class="btn btn-primary">고객센터</button>
                    </li>
                    <li class="nav-item" style="margin-left: 2px;">
                        <button type="button" class="btn btn-secondary" >로그아웃</button>
                    </li>
                    <li class="nav-item">
                      	<button type="button" class="btn btn-link text-decoration-none text-dark" id="mypage">마이페이지</button>
                    </li>
                    <li class="nav-item dropdown">
                    	 <a class="nav-link dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				 <span class="bi bi-bell" style="font-size: 15pt; color:black;"></span>
				             <span style="color:red; background-color:white; font-weight: bold;" class="badge text-bg-secondary">3</span>
          				 </a>
                    	 
                    	 <ul class="dropdown-menu " aria-labelledby="btnGroupDrop1" >
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[직거래/제안] 『HP노트북중고』 상품이 2022-06-01 17:52..</a></li>
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[직거래/판매] 『SSD 최저가 판매해요』 상품이 2022-06-01 12:00..</a></li>
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[문의] 『구매확정 어떻게해요?』 문의가 2022-05-30 15:25..</a></li>
					    </ul> 
                    </li>
                </ul>
            </div>
        </div>
    </nav>
  </header>
</div>  
</body>
</html>