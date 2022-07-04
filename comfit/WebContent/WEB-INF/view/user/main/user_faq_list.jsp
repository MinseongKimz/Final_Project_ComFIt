<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

/* div {border: 1px solid black;} */
div
{
	font-weight: bold;
}

*{
  box-sizing: border-box; 
}
  
.que:first-child{
    border-top: 1px solid black;
  }
  
.que{
  position: relative;
  padding: 17px 0;
  cursor: pointer;
  font-size: 14px;
  border-bottom: 1px solid #dddddd;
  
}
  
.que::before{
  display: inline-block;
  content: 'Q';
  font-size: 14px;
  color: #006633;
  margin-right: 5px;
}

.que.on>span{
  font-weight: bold;
  color: #0080FF; 
}
  
.anw {
  display: none;
    overflow: hidden;
  font-size: 14px;
  background-color: #f4f4f2;
  padding: 27px 0;
}
  
.anw::before {
  display: inline-block;
  content: 'A';
  font-size: 14px;
  font-weight: bold;
  color: #666;
  margin-right: 5px;
}

</style>
<script type="text/javascript">
	$(document).ready(function()
	{

		$("#notice").hover(function()
		{
			//alert("테스트");                       

			$(this).removeClass("btn-secondary");
			$(this).addClass("btn-primary");
		}, function()
		{
			$(this).removeClass("btn-primary");
			$(this).addClass("btn-secondary");
		});

		/*
		$("#faq").hover(function()                
		{                                         
			//alert("테스트");                       
			                                      
			$(this).removeClass("btn-secondary"); 
			$(this).addClass("btn-primary");      
		}, function()                             
		{                                         
			$(this).removeClass("btn-primary");   
			$(this).addClass("btn-secondary");    
		});                                       
		 */

		$("#ask").hover(function()
		{
			//alert("테스트");                       

			$(this).removeClass("btn-secondary");
			$(this).addClass("btn-primary");
		}, function()
		{
			$(this).removeClass("btn-primary");
			$(this).addClass("btn-secondary");
		});

	})
</script>

<script type="text/javascript">
	$(".que").click(function()
	{
		$(this).next(".anw").stop().slideToggle(300);
		$(this).toggleClass('on').siblings().removeClass('on');
		$(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>
</head>

<body>
<%
	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != null)
	{	
%>
		<div class="header">
			<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
		</div>
<%	}
	else
	{
%>
	<div>
   		<c:import url="/WEB-INF/view/user/main/comfit_header_nolog.jsp"></c:import>
	</div>
<%	} %>	
	
	

	<div class="content">
		<br /> <br /> <br /> <br />
		<div class="btns" style="text-align: center;">
			<button type="button" id="notice" class="btn btn-secondary"
				style="margin: 7px;" onclick="location.href='user_notice_list.action'">공지사항</button>
			<button type="button" id="faq" class="btn btn-primary"
				style="margin: 7px;" onclick="location.href='user_faq_list.action'">자주묻는질문</button>
			<button type="button" id="ask" class="btn btn-secondary"
				style="margin: 7px;" onclick="location.href='user_ask_list.action'">내
				문의내역</button>
		</div>
		<br /> <br />
		
		<div style="margin-left: 30%; margin-right: 30%;">
			<br />
			
			<div id="Accordion">
		
			<c:forEach var="faq" items="${userfaqList }">
			<div class="que">
				<span>${faq.faq_title }</span>
			</div>
		     
			<div class="anw" style="padding-left: 20px">
				<span>${faq.faq_contents }</span>
				<div style="margin-top: 50px; text-align: right;">
				</div>
		    </div>
			</c:forEach>
			</div>
			
		</div>
	</div>

<script type="text/javascript">
$(".que").click(function() {
	  $(this).next(".anw").stop().slideToggle(300);
	  $(this).toggleClass('on').siblings().removeClass('on');
	  $(this).next(".anw").siblings(".anw").slideUp(300); // 1개씩 펼치기
	});
</script>

</body>
</html>