<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>찜한상품</title>
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
		margin-top: 3%;
		margin-left: 15%; 
		margin-right: 15%;
	}
	
	.category
	{
		padding-top: 3%;
	}
	
	.pd_list
	{
		padding-top: 3%;
	}
	
	   .card
   {
		width: 14rem;
   }

   .newList > div.card 
   {
      display: inline-block;
      /* float: left; */
      margin: 10px;
   }
</style>
</head>


<body>

<div>
	<!-- Header 영역 -->
	<div class="header">
         <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
	</div>
	
	
	<!-- Content 영역 -->
	<div class="content">
	
		<!-- 상품 검색 결과 -->
		<div class="pd_list new">
			<div>
				<span style="font-size: 30pt;">찜한 상품</span><br /><br />
				
				<h5>전체 <span style="color: #0080FF;">10</span>개</h5>
			</div>
			
			 <div class="col-md-12 text-center">
   
         <div class="newList">
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            <div class="card">
               <img src="images/ssd.jpg" class="card-img-top">
               <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">SSD</h5>
                  <p class="card-text"  style="text-align: center;">120,000</p>
                  <a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               </div>
            </div>
            
            
            
         </div>
		</div>
	</div>	<!-- content  -->
	
	
	<!-- Footer 영역 -->
	<div class="footer">
	</div>
	
</div>



</body>
</html>