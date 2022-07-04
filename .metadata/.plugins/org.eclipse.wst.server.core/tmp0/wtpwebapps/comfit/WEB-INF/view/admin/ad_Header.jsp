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
<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<style>
  /* 사이드바 래퍼 스타일 */
  *{font-family: 'Noto Sans KR', sans-serif;}
  
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
    box-shadow: 0 1px 3px 0 rgba(0,0,0,0.50);
  }
body {
  min-height: 100vh;
  min-height: -webkit-fill-available;
}

html {
  height: -webkit-fill-available;
}

main {
  display: flex;
  flex-wrap: nowrap;
  height: 100vh;
  height: -webkit-fill-available;
  max-height: 100vh;
  overflow-x: auto;
  overflow-y: hidden;
}

.b-example-divider {
  flex-shrink: 0;
  width: 1.5rem;
  height: 100vh;
  background-color: rgba(0, 0, 0, .1);
  border: solid rgba(0, 0, 0, .15);
  border-width: 1px 0;
  box-shadow: inset 0 .5em 1.5em rgba(0, 0, 0, .1), inset 0 .125em .5em rgba(0, 0, 0, .15);
}

.bi {
  vertical-align: -.125em;
  pointer-events: none;
  fill: currentColor;
}

.dropdown-toggle { outline: 0; }

.nav-flush .nav-link {
  border-radius: 0;
}

.btn-toggle {
  display: inline-flex;
  align-items: center;
  padding: .25rem .5rem;
  font-weight: 600;
  color: rgba(0, 0, 0, .65);
  background-color: transparent;
  border: 0;
}
.btn-toggle:hover,
.btn-toggle:focus {
  color: rgba(0, 0, 0, .85);
  background-color: #d2f4ea;
}

.btn-toggle::before {
  width: 1.25em;
  line-height: 0;
  content: url("data:image/svg+xml,%3csvg xmlns='http://www.w3.org/2000/svg' width='16' height='16' viewBox='0 0 16 16'%3e%3cpath fill='none' stroke='rgba%280,0,0,.5%29' stroke-linecap='round' stroke-linejoin='round' stroke-width='2' d='M5 14l6-6-6-6'/%3e%3c/svg%3e");
  transition: transform .35s ease;
  transform-origin: .5em 50%;
}

.btn-toggle[aria-expanded="true"] {
  color: rgba(0, 0, 0, .85);
}
.btn-toggle[aria-expanded="true"]::before {
  transform: rotate(90deg);
}

.btn-toggle-nav a {
  display: inline-flex;
  padding: .1875rem .5rem;
  margin-top: .125rem;
  margin-left: 1.25rem;
  text-decoration: none;
}
.btn-toggle-nav a:hover,
.btn-toggle-nav a:focus {
  background-color: #d2f4ea;
}

.scrollarea {
  overflow-y: auto;
}

.fw-semibold { font-weight: 600; }
.lh-tight { line-height: 1.25; }
  
  
body{background-color: #edf2f9;}
table {box-shadow: 0 1px 3px 0 rgba(0,0,0,0.20);} 
table > thead {background-color: white;}
tbody {background-color: white;} 
</style>

<!-- 사이드바 스타일 참조 안먹는 이유??? -->
<!-- <link href="css/sidebars.css" rel="stylesheet"> -->

</head>
<body>
<div id="page-wrapper">

  <!-- 사이드바 -->
  <div id="sidebar-wrapper">
    <a href="" class="d-flex align-items-center pb-3 mb-3 link-dark text-decoration-none border-bottom">
      <svg class="bi me-2" width="30" height="24"><!-- <use xlink:href="admin_main.jsp"/> --></svg>
      <img alt="" src="images/logo-admin.png" style="width: 100%; margin-top: 10px">
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
            <li><a href="admin_userlist.action" class="link-dark rounded">일반회원 관리</a></li>
            <li><a href="admin_bannedlist.action" class="link-dark rounded">차단회원 관리</a></li>
            <li><a href="admin_userout_list.action" class="link-dark rounded">탈퇴회원 관리</a></li>
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
            <li><a href="admin_product_list.action" class="link-dark rounded">상품관리</a></li>
            <li><a href="admin_money_list.action" class="link-dark rounded">입출금관리</a></li>
          </ul>
        </div>
      </li>
      
      <hr /> 
      
      <li class="mb-1">
      <div class="d-grid gap-2">
        <button class="btn-toggle" data-bs-toggle="collapse" data-bs-target="#orders-collapse" aria-expanded="false" onclick="location.href='/comfit/admin_category_list.action'">
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
            <li><a href="admin_report_list.action" class="link-dark rounded">신고관리</a></li>
            <li><a href="admin_ask_list.action" class="link-dark rounded">문의관리</a></li>
            <li><a href="admin_notice_list.action" class="link-dark rounded">공지사항</a></li>
            <li><a href="admin_faq_list.action" class="link-dark rounded">FAQ</a></li>
          </ul>
        </div>
      </li>      
    </ul>
    
    
  </div>

  <!-- 본문 -->
  <div class="container-fluid" style="height: 30px; width: 25; background-color: #f3f8ff;">
  <span style="color: #bbbbbb">관리자페이지입니다</span>
  </div>
  <!-- /본문 -->
  
</div>
</body>
</html>