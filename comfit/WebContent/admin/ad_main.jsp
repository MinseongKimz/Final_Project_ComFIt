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
<!-- 디자인 담당 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>ad_main.jsp</title>
<style type="text/css">


.social-box .box {
    background: #f2f2f2;
    border-radius: 10px; 
    cursor: pointer;
    margin: 20px 0;
    padding: 40px 10px;
    transition: all 0.5s ease-out;
}

.social-box .box:hover {
   box-shadow: 0 0 6px #4183D7;
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

<div class="col-sm-1">
	<c:import url="ad_Header.jsp"></c:import>
</div>

<div class="social-box col-sm-11">
    <div class="container">
     	<div class="row">
     	<h1 style="color: #0080FF;">Main</h1>
		    <div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
                    <i class="fa fa-behance fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>회원관리</h3>
					</div>
				 </div>
			</div>	 
			
			 <div class="col-lg-6 col-xs-12  text-center">
				<div class="box">
				    <i class="fa fa-twitter fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>카테고리 관리</h3>
					</div>
				 </div>
			</div>	 
			
			<div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
                    <i class="fa fa-pinterest-p fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>거래 관리</h3>
					</div>
				 </div>
			</div>	 
			
			<div class="col-lg-6 col-xs-12 text-center">
				<div class="box">
				    <i class="fa fa-google-plus fa-3x" aria-hidden="true"></i>
					<div class="box-title">
						<h3>고객 센터</h3>
					</div>
				 </div>
			</div>	 
			
		</div>		
    </div>
</div>




</body>
</html>