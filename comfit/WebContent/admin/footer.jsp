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
<!-- 디자인 소스 -->

<!-- 폰트 적용 -->
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;400&display=swap" rel="stylesheet">
<style type="text/css">
	.blog-footer {
	  padding: 2.5rem 0;
	  color: #727272;
	  text-align: center;
	  background-color: #f9f9f9;
	  border-top: .05rem solid #e5e5e5;
	}
	.blog-footer p:last-child {
	  margin-bottom: 0;
	}



</style>
</head>
<body>

<footer class="blog-footer">
  <p>Blog template built for <a href="">Bootstrap</a> by <a href="">@mdo</a>.</p>
  <p>
    <a href="#">Back to top</a>
  </p>
</footer>

</body>
</html>