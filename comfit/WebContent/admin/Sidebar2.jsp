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
<script src="https://kit.fontawesome.com/b99e675b6e.js"></script>
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>ad_Header</title>
<style type="text/css">
/* 초기화 */
*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  list-style: none;
  text-decoration: none;
  font-family: 'Josefin Sans', sans-serif;
}
/* 배경색 */
body{
   background-color: #ffffff;
}

.wrapper{
  display: flex;
  position: relative;
}
/* 사이드바 꾸미기 */
.wrapper .sidebar{
  width: 200px;
  height: 100%;
  background: #ffffff;
  padding: 30px 0px;
  box-shadow: 1px 1px 10px 5px gray;
  position: fixed;
}

.wrapper .sidebar h2{
  color: black;
  text-transform: uppercase;
  text-align: center;
  margin-bottom: 30px;
}

.wrapper .sidebar ul li{
  padding: 15px;
  border-bottom: 1px solid #bdb8d7;
  border-bottom: 1px solid rgba(0,0,0,0.05);
  border-top: 1px solid rgba(255,255,255,0.05);
}    

.wrapper .sidebar ul li a{
  color: #1C1C1C;
  display: block;
}

.wrapper .sidebar ul li a .fas{
  width: 25px;
}

.wrapper .sidebar ul li:hover{
  background-color: #1486ff;
  border-radius: 10px;  
}
    
.wrapper .sidebar ul li:hover a{
  color: #fff;
}
 
.wrapper .sidebar .social_media{
  position: absolute;
  bottom: 0;
  left: 50%;
  transform: translateX(-50%);
  display: flex;
}

.wrapper .main_content{
  width: 100%;
  margin-left: 200px;
}

.wrapper .main_content .header{
  padding: 20px;
  background: #fff;
  color: #717171;
  border-bottom: 1px solid #e0e4e8;
}

.wrapper .main_content .info{
  margin: 20px;
  color: #717171;
  line-height: 25px;
}

.wrapper .main_content .info div{
  margin-bottom: 20px;
}
</style>

</head>
<body>

<body>


<div class="wrapper">
    <div class="sidebar">
        <h2><a href="ad_main.jsp">Comfit</a></h2>
        <ul>
            <li><a href="ad_userlist.jsp"><i class="fas fa-user"></i>회원 관리</a>         
            </li>            
            <li><a href="ad_product_list.jsp"><i class="fas fa-address-book"></i>거래 관리</a></li>
            <li><a href="ad_category_list.jsp"><i class="fas fa-address-card"></i>카테고리 관리</a></li>
            <li><a href="ad_report_list.jsp"><i class="fas fa-blog"></i>고객센터</a></li>
        </ul> 
    </div>
        
    <div class="main_content">
        <div class="header">Comfit 관리자 계정입니다.</div>  
    </div>
</div>



<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>


</body>
</html>