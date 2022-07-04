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
<meta name="viewport" content="width=device-width", initial-scale="1">
<!-- 디자인 담당 -->
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
  /* 사이드바 래퍼 스타일 */
  
  #page-wrapper {
    padding-left: 250px;
  }
  
  #sidebar-wrapper {
    position: fixed;
    width: 250px;
    height: 100%;
    margin-left: -250px;
    background: white;
    overflow-x: hidden;
    overflow-y: auto;
  }
  .


</style>

<!-- Custom styles for this template -->
<link href="css/sidebars.css" rel="stylesheet">

</head>
<body>
<div id="page-wrapper">

  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <a href="/" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><use xlink:href="#bootstrap"/></svg>
      <span class="fs-5 fw-semibold">Comfit admin</span>
    </a>  
  
    <ul class="list-unstyled ps-0">
      <li class="mb-1">
      <div class="d-grid gap-2">         
        <button class="btn-toggle" data-bs-toggle="collapse" data-bs-target="#home-collapse" aria-expanded="true">
          회원관리
        </button>
      </div>
        <div class="collapse" id="home-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">일반회원 관리</a></li>
            <li><a href="#" class="link-dark rounded">차단회원 관리</a></li>
            <li><a href="#" class="link-dark rounded">탈퇴회원 관리</a></li>
          </ul>
        </div>
      </li>
      
      <hr />
      
      <li class="mb-1">
      <div class="d-grid gap-2">
        <button class="btn-toggle" data-bs-toggle="collapse" data-bs-target="#dashboard-collapse" aria-expanded="false">
          거래관리
        </button>
      </div>  
        <div class="collapse" id="dashboard-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">상품관리</a></li>
            <li><a href="#" class="link-dark rounded">입출금관리</a></li>
          </ul>
        </div>
      </li>
      
      <hr /> 
      
      <li class="mb-1">
      <div class="d-grid gap-2">
        <button class="btn-toggle" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false">
          카테고리 관리
        </button>
      </div>  
      </li>
      
      <hr />
      
      <li class="mb-1">
      <div class="d-grid gap-2">      
        <button class="btn-toggle" data-bs-toggle="collapse" data-bs-target="#account-collapse" aria-expanded="false">
          고객센터
        </button>
      </div>
        <div class="collapse" id="account-collapse">
          <ul class="btn-toggle-nav list-unstyled fw-normal pb-1 small">
            <li><a href="#" class="link-dark rounded">신고관리</a></li>
            <li><a href="#" class="link-dark rounded">문의관리</a></li>
            <li><a href="#" class="link-dark rounded">공지사항</a></li>
            <li><a href="#" class="link-dark rounded">FAQ</a></li>
          </ul>
        </div>
      </li>      
    </ul>
    
    
  </div>

  <!-- 본문 -->
    <div class="container-fluid">
      <h1>공간확인</h1>
    </div>
  <!-- /본문 -->
  
</div>
</body>
</html>
