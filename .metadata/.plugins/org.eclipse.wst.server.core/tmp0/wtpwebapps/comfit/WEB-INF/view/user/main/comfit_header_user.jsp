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
<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">

<style>
*{font-family: 'Noto Sans KR', sans-serif;}
.navbar
{
	 background-color:white !important;
	 box-shadow: 0 1px 3px 0 rgba(0,0,0,0.20);
}

.nav li a{
	background-color:red;
} 
	
.nav .active a
{
	background-color:orange !important;
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
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#searchBtn").click(function()
		{
			//alert($("#searchProduct").val());
			
			if (!$("#searchProduct").val() == "")
			{
				$(location).attr("href", "searchlist.action?searchKey="+$("#searchProduct").val()
						+"&sort=1");
			}
			else
			{
				alert("검색어를 입력해 주세요.");	
			}
		});
		
		$("#searchProduct").on("keyup", function(key)
		{
			if (key.keyCode == 13)
			{
				$("#searchBtn").click();
			}

		});
		
	});
	
</script>



</head>
<body>
<div>

  <header>
    <!-- nav 상단 고정-->
    <nav class="navbar navbar-expand-lg navbar-light bg-white">
        <div class="container">
        	<form action="user_mainlist.action" method="post">
	         <button type="submit" style="border: 1px solid white; background-color: white;"><img alt="logo" src="<%=cp%>/images/logo.png" style="width: 200px;"></button>  
	        </form>
	        
              	<button class="navbar-toggler " type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
			      <span class="navbar-toggler-icon"></span>
			    </button>
            
              	<div class="collapse navbar-collapse justify-content-between" id="navbarSupportedContent">
              		<br />
                 	<form class="form-inline" style="width: 100%;" onsubmit="return false;">
				     	<div class="input-group" style="width:75%; padding-left: 20%">
						     <input id="searchProduct" type="text" class="form-control" placeholder="원하시는 상품을 검색하세요.">
					         <button id="searchBtn" type="button" class="btn btn-outline-primary">
							 	<i class="bi bi-search"></i>
					         </button>							     
	  					</div>
                	</form>
                </div>	
                <ul class="navbar-nav">
                    <li class="nav-item ">
                        <a class="nav-link primary active" aria-current="page" href="user_svc.action">고객센터</a>
                    </li>
                    <li class="nav-item">
                        <a class="nav-link active" href="logout.action">로그아웃</a>
                    </li>
                    <li class="nav-item">
                      	<a class="nav-link active" href="user_mypage.action">마이페이지</a>
                    </li>
                    <li class="nav-item dropdown">
                    	 <a class="nav-link active dropdown-toggle" href="#" id="navbarDarkDropdownMenuLink" role="button" data-bs-toggle="dropdown" aria-expanded="false">
            				 <span class="bi bi-bell" style="font-size: 15pt; color:black;">
						  	 <span class="position-absolute badge bg-info text-white" style="size: 5">
						    	99+
						     <span class="visually-hidden">unread messages</span>
						     </span>
            				 </span>
				             
          				 </a>
                    	 
                    	 <ul class="dropdown-menu " aria-labelledby="btnGroupDrop1" >
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[직거래/제안] HP노트북중고....</a></li>
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[직거래/판매] SSD 최저가....</a></li>
					        <li class="dropdown-item"><a class="dropdown-item" href="#">[문의] 구매확정 어떻게해...</a></li>
					    </ul> 
                    </li>
                </ul>
            </div>
        </div>
    </nav>
    
    <br />
    <div class="text-end " style="">
    <div class="container">
	         <button id="sellBtn" type="button" class="btn btn-primary dropdown-toggle" data-bs-toggle="dropdown" aria-expanded="false">
	              판매하기
	         </button>
	         <ul class="dropdown-menu" aria-labelledby="btnGroupDrop1">
	            <li class="dropdown-item"><a class="dropdown-item" href="user_direct_seller_edit.action">직거래 판매하기</a></li>
	            <li class="dropdown-item"><a class="dropdown-item" href="user_delivery_seller_edit.action">택배거래 판매하기</a></li>
	         </ul>
	</div>
	</div>
  </header>
</div>  


</div>
  
</body>
</html>