<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_signup_find_address.jsp</title>
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
</style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>


<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.content
	{
		margin-left: 5%;
	}
	
	.txtbox
	{
		width: 350px;
	}
	
	.title
	{
		margin-left: 2%;
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
	<span style="font-size: 30pt; font-weight: bold;">주소 검색</span>
	<br />
	<input type="text" class="txtbox" placeholder="도로명 주소 혹은 지번 입력"/>
	<button type="button" class="btn btn-primary" style="width: 60px; font-size: 10pt;">검색</button>
	<br />
	<span style="font-size: 10pt; font-weight: bold; color: skyblue;">검색어 예 : 도로명(반포대로 58), 건물명(독립기념관), 지번(삼성동85)</span>
	<br /><br />
	
</div>	
	

		
		
		
		
		
		
	<!-- content  -->
	
	
	<!-- Footer 영역 -->
<!-- 	<div class="footer">
	</div> -->
	



</body>
</html>