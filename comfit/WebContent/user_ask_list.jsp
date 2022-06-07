<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의내역</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

	/* div {border: 1px solid black;} */
	
	
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
		 
		/* 
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
		*/
	})
	

</script>

<div>
	<c:import url="comfit_header_user.jsp"></c:import>
</div>

<div class="content">
<br /><br /><br />
	
	<br />
	<div class="btns" style="text-align: center;">
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.jsp'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-primary" style="margin: 7px;" onclick="location.href='user_ask_list.jsp'">내 문의내역</button>
	</div>
	<br /><br />
	
	<div style="margin-left: 10%; font-weight: bold; font-size: 22pt;">내 문의내역</div>
	<br /><br />
	<div style="margin-left: 10%; margin-right: 10%;">
		<table class="table">
		  <thead>
		    <tr style="background-color: #EFF2FB;">
		      <th class="col-md-7">제목</th>
		      <th class="col-md-2">작성일자</th>
		      <th class="col-md-1.5">처리상태</th>
		      <th class="col-md-1.5">카테고리</th>
		    </tr>
		  </thead>
		  <tbody>
		    <tr>
		      <td class="col-md-7" onclick="location.href='user_ask.jsp'">배송 문의합니다.</td>
		      <td class="col-md-2">2022-05-21</td>
		      <td class="col-md-1.5">처리완료</td>
		      <td class="col-md-1.5">배송</td>
		    </tr>
		    <tr>
		      <td class="col-md-7">포인트 문제 문의드립니다.</td>
		      <td class="col-md-2">2022-05-20</td>
		      <td class="col-md-1.5">처리대기</td>
		      <td class="col-md-1.5">포인트</td>
		    </tr>
		   
		  </tbody>
		</table>
		
		<div>
			<button type="button" class="btn btn-primary" style="float: right;" onclick="location.href='user_ask_add.jsp'">문의등록</button>
		</div>
		
		
	</div>
</div>


































