<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>신고 페이지</title>
<link rel="stylesheet" href="<%=cp%>/css/main.css" type="text/css">
<link rel="stylesheet" href="<%=cp%>/css/bootstrap.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<style type="text/css">
	.content
	{
		text-align: center;
	}
	.fs-6
	{
		font-weight: bold;
	}

</style>
</head>
<body>

<%
	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != "")
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




<div class="container">
	<div class="content" style="margin: auto;">
		<p class="fs-2">신고정책</p>
		<!-- 신고정책 div -->
		<div class="reportrole">
			
			<!-- 약관 -->
			<textarea class="form-control" style="float: none; margin: auto; width: 50%; height: 150px; font-size: 9pt;" readonly="readonly">
제 1조 총칙
신고에 관하여 신고자는... 책임을 진다.
			
제 2조 신고자의 의무
신고자는 신고한 대상(해당 게시물)에 대해 충분히 숙지한 상태에서 신고해야 하며
그렇지 않을 경우 허위신고에 대한 책임을 질 수 있다...
			</textarea>	
			<br>
			
			<!-- 약관동의 라디오버튼 -->
			<div style="width: 50%; display: inline-block; text-align: right;">
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="asRadio" id="inlineRadio1" value="동의">
				  <label class="form-check-label" for="inlineRadio1">동의</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="asRadio" id="inlineRadio2" value="비동의">
				  <label class="form-check-label" for="inlineRadio2">비동의</label>
				</div>
			</div>
		</div>
		
		<br>
		<p class="fs-2">신고접수</p>
		<div class="reportrec" style="width: 50%; display: inline-block; text-align: left;">
			<p class="fs-6">신고 사유<span style="font-size: 6pt; color:red;">※사유 필수 체크</span></p>
			
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="flexCheck1">
			  <label class="form-check-label" for="flexCheck1">
			    <p>허위 내용 기재
				    <br>
				    <span style="font-size: 7pt;">-사진과 카테고리가 다른 경우</span>
			    </p>
			    
			  </label>
			</div>
			<div class="form-check">
			  <input class="form-check-input" type="checkbox" value="" id="flexCheck2">
			  <label class="form-check-label" for="flexCheck2">
			    <p>판매와 관련없는 부적절한 광고 및 홍보글 기재
				    <br>
					<span style="font-size: 7pt;">- 자신의 홈페이지나 상업적 목적을 위한 문구가 기재된 경우</span>
				</p>
			  </label>
			</div>
			
			<p class="fs-6">신고 세부내용</p>
			<textarea class="form-control" placeholder="내용을 입력해주세요." style="height: 150px; font-size: 9pt;"></textarea>
			
			<div class="report_button" style="text-align: right; padding: 3%;">
				<button type="button" class="btn btn-dark" style="width: 18%; font-size: 9pt;">작성취소</button>
				<button type="button" class="btn btn-secondary" style="width: 18%; font-size: 9pt;">목록으로</button>
				<button type="button" class="btn btn-primary" style="width: 18%; font-size: 9pt;">제출</button>
			</div>
		</div>
		
		
	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</div>

<div class="footer">
</div>

</body>
</html>