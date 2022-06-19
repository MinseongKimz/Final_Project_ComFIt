<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>문의등록</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script> -->


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

<div class="container" style="width: 940px;">
<br /><br /><br /><br />

	<!-- 버튼 3개 -->
	<div class="btns" style="text-align: center;">
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.action'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list.action'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-primary" style="margin: 7px;" onclick="location.href='user_ask_list.action'">내 문의내역</button>
	</div>
	<br /><br /><br />
	
	
		<div style="font-weight: bold; font-size: 22pt; text-align: center;">
			문의 등록
		</div>
		<br />
		
	<div style="text-align: center;">			
		<div style="display: inline-block;">
			<select class="form-select" id="" style="padding-bottom: 6px;">
				<option value="1">배송</option>
				<option value="2">직거래</option>
				<option value="3">포인트</option>
				<option value="4">입출금</option>
				<option value="5">회원 서비스</option>
			</select>
		</div>
			
			
		<!-- 문의 제목 입력 창 -->
		<div style="display: inline-block;">
			<input type="text" name="" id="" style="width: 750px; height: 37px; margin: 2px; padding-bottom:3px; resize: none;" placeholder="문의 제목을 입력해주세요." />
		</div>
	</div>
	
		<br />
		
	<div style="text-align: center;">		
		<!-- 문의내용 입력 창 -->
		<textarea name="" id="" cols="98" rows="10" style="resize: none; " placeholder="문의 내용을 입력해주세요."></textarea>
	
	<br />
		<div style="display: inline-block; float: right;">
			<button type="button" class="btn btn-primary" id="account" style="margin: 7px; width: 100px;" data-bs-toggle="modal" data-bs-target="#Modal">등록</button>
			<button type="button" class="btn btn-primary" id="reset" style="margin: 7px; width: 100px;" onclick="location.href='user_ask_my_update.action'">취소</button>
		</div>	
	</div>	
</div>





		<!-- Modal -->
		<div class="modal fade" id="Modal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true" data-backdrop="static" data-keyboard="false">
		  <div class="modal-dialog">
		    <div class="modal-content">
		      <div class="modal-header">
		        <!-- <h5 class="modal-title" id="exampleModalLabel" style="text-align: center;">삭제하기</h5> -->
		        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
		      </div>
		      <div class="modal-body" style="text-align: center;">
		      	문의 접수가 완료되었습니다!
		      </div>
		      <div class="modal-footer">
		        <button type="button" class="btn btn-primary" data-bs-dismiss="modal" style="width: 100%;" onclick="location.href='user_ask_list.jsp'">확인</button>
		        <!-- <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#exampleModal2">삭제하기</button> -->
		      </div>
		    </div>
		  </div>
		</div>
		
</body>
</html>























