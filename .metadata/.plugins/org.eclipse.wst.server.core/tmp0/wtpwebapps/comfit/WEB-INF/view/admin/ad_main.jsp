<!-- http://bootstrapk.com/components/ 
여기서 아이콘을 따오든지 이미지를 따오든지 하기
-->

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
<!-- 기기별 크기 담당 -->
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 폰트 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Black+Han+Sans&family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<title>ad_main.jsp</title>
<style type="text/css">

h3 {font-family: 'Black Han Sans', sans-serif;}

.social-box .box {
    background: white;
    border-radius: 10px; 
    cursor: pointer;
    margin: 20px 0;
    padding: 40px 10px;
    transition: all 0.5s ease-out;
}

.social-box .box:hover {
   box-shadow: 0 0 6px gray;
}

.social-box .box-text {
	border: 1px;
    font-size: 15px;
    line-height: 30px;
    margin: 20px 0;
}

.social-box .box-btn a {
    color: #4183D7;
    font-size: 16px;
    text-decoration: none;
}

.social-box .fa {
    color: #4183D7;
}
</style>


</head>



<body class="pl-5">

<div class="">
	<c:import url="ad_Header.jsp"></c:import>
</div>

<div class="container" style="margin-left: 260px">
     	<h1><b><span style="color: #0080FF;">MAIN</span></b></h1>
</div>     	

<div class="container" style="margin-left: 250px">
<div class="social-box col-sm-11">
    <div class="container">
     	<div class="row">
     	
		  <div class="col-sm-6"">
		    <div class="card box">
		      <div class="card-body">
		      <div class="" style="text-align: center;">
		        <h3 class="card-title">회원관리</h3>
		      </div>
		      <div class="" style="text-align: center;">
		      <i class="bi bi-emoji-smile" style="font-size: 100px"></i>  
		      </div> 
		        <!-- <p class="card-text">회원을 관리하는 창입니다.</p> -->
		    
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card box">
		      <div class="card-body">
			  <div class="" style="text-align: center;">
		        <h3 class="card-title">거래관리</h3>
		      </div>
		      <div class="" style="text-align: center;">
		      <i class="bi bi-cart2" style="font-size: 100px"></i>  
		      </div> 
		      </div>
		    </div>
		  </div>
		</div>


     	<div class="row">  	
		  <div class="col-sm-6">
		    <div class="card box">
		      <div class="card-body" onclick="location.href='admin_category_list.action'">
			  <div class="" style="text-align: center;">
		        <h3 class="card-title">카테고리 관리</h3>
		      </div>
		      <div class="" style="text-align: center;">
		      <i class="bi bi-card-checklist" style="font-size: 100px"></i>  
		      </div> 
		      </div>
		    </div>
		  </div>
		  <div class="col-sm-6">
		    <div class="card box">
		      <div class="card-body">
			  <div class="" style="text-align: center;">
		        <h3 class="card-title">고객센터</h3>
		      </div>
		      <div class="" style="text-align: center;">
		      <i class="bi bi-chat-left-quote-fill" style="font-size: 100px"></i>  
		      </div> 
		      </div>
		    </div>
		  </div>
		</div>
			
    </div>
</div>
</div>



</body>
</html>