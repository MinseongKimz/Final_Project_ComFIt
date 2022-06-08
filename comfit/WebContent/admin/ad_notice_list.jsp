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
<title>Insert title here</title>
<style type="text/css">

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
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>



<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>공지사항</b></h1></div>
		<div id="Accordion_wrap">
		     <div class="que" >
		      <span>[공지] 외부 채널 유도 관련 운영정책 강화 안내</span>
		     </div>
		     <div class="anw" style="padding-left: 20px">
		      <span>Comfit 앱을 벗어나 거래를 하며 발생되는 분쟁과 사기 피해가 지속됨에 따라<br>
					외부 채널 유도에 대한 운영 정책이 아래와 같이 강화되오니 고객님들의 적극적인 협조 부탁드립니다.<br>
					<운영정책 강화 항목><br>
					- ......<br>
			 </span>
			 <div style="margin-top: 50px; border: 1px solid red;">
			 오른쪽 정렬하게 해주세요...
					<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
		     </div>		 
		     </div>
		      <div class="que">
		      <span>[공지] 특정 전자기기 거래 금지 시행 안내</span>
		     </div>
		     <div class="anw" style="padding-left: 20px">
		      <span>This is second answer.</span>
			 <div style="margin-top: 50px; border: 1px solid red;">
			 오른쪽 정렬하게 해주세요...
					<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
		     </div>		      
		     </div>
		      <div class="que">
		      <span>Comfit 개인정보처리방침 개정 안내</span>
		     </div>
		     <div class="anw" style="padding-left: 20px">
		      <span>[공지] '비트코인/가상화폐/암호화폐' 거래 금지 안내</span>
			 <div style="margin-top: 50px; border: 1px solid red;">
			 오른쪽 정렬하게 해주세요...
					<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
		     </div>	      
		     </div>
		</div>
	</div>	
</div>

<div class="container" style="border: 1px solid gray; margin-top: 10px;">
	<button class="btn btn-primary pull-right" value="글쓰기" style="width: 100px;" onclick="location.href='ad_notice_write.jsp'">글쓰기</button>
	오른쪽에 딱 붙이고 싶은데...
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