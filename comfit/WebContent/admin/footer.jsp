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
<title>Insert title here</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
</head>
<body>


<!-- 색미쳤네... 프린트업체같음
bg-primary면 프린트업체 됨 -->

<footer class="text-center text-lg-start bg-light text-muted">
  <!-- Grid container -->
  <div class="container p-4">
    <!--Grid row-->
    <div class="row">
      <!--Grid column-->
      <div class="col-lg-6 col-md-12 mb-4 mb-md-0">
        <h5 class="text-uppercase">Comfit name</h5>

        <p>
          우리 이름이 왜 컴핏이 되었는지 서술하기...
        </p>
      </div>
      <!--Grid column-->

      <!--Grid column-->
      <div class="col-lg-3 col-md-6 mb-4 mb-md-0">
      <h5 class="text-uppercase fw-bold mb-4">이용안내</h5>

        <ul class="list-unstyled mb-0">
          <li>
            <a href="#!" class="text-reset">공지사항</a>
          </li>
          <li>
            <a href="#!" class="text-reset">FAQ</a>
          </li>
          <li>
            <a href="#!" class="text-reset">문의사항</a>
          </li>
          <li>
            <a href="#!" class="text-reset">서비스 소개</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->

      <!--Grid column-->
     <div class="col-md-2 col-lg-2 col-xl-2 mx-auto mb-4">
          <!-- Links -->
          <h5 class="text-uppercase fw-bold mb-4">
            정책
          </h5>

        <ul class="list-unstyled">
          <li>
            <a href="#!" class="text-reset">이용약관</a>
          </li>
          <li>
            <a href="#!" class="text-reset">개인정보 처리방침</a>
          </li>
          <li>
            <a href="#!" class="text-reset">경매 심사 기준</a>
          </li>
        </ul>
      </div>
      <!--Grid column-->
    </div>
    <!--Grid row-->
  </div>
  <!-- Grid container -->

  <!-- Copyright -->
  <div class="text-center p-3" style="background-color: rgba(0, 0, 0, 0.2);">
    © 2020 Copyright:
    <a class="text-white" href="https://mdbootstrap.com/">MDBootstrap.com</a>
  </div>
  <!-- Copyright -->
</footer>

</body>
</html>