<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항</title>
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
		$("#a").hover(function()
		{
			$(this).css('color', 'grey');
		}, function()
		{
			$(this).css('color', 'black');
		});
		
		$("#a").click(function()
		{
			$( '#b' ).toggle(150);
		})
		                                               
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
		                             
	})
	

</script>

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
<br /><br /><br />
	<div class="container">
		<span style="font-weight: bold; font-size: 26pt; font: '맑은 고딕'">고객센터</span>
	</div>
	<br />
	<div class="btns" style="text-align: center;">
		<button type="button" id="notice" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_notice_list.jsp'">공지사항</button>
		<button type="button" id="faq" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_faq_list'">자주묻는질문</button>
		<button type="button" id="ask" class="btn btn-secondary" style="margin: 7px;" onclick="location.href='user_ask_list.jsp'">내 문의내역</button>
	</div>
	<br /><br />
	
	<div style="margin-left: 20%; margin-right: 20%;">
		<div style="text-align: center; font-weight: bold; font-size: 22pt; background-color: #EFF2FB; height: 70px; line-height:70px; border: 1px solid black;">고객센터</div>
		<br />
		
		<%-- 
		<c:forEach var="notice" items="${noticeList }">
			<hr />
			<div id="">${카테고리명 } ${공지사항제목 }</div>
			<div id="" style="display: none;"><hr />${공지사항내용 }</div>
		</c:forEach>
		--%>
		
		<hr />
		<div id="a">[공지] 외부 채널 유도 관련 운영정책 강화 안내</div>
		<div id="b" style="display: none; background-color: #EFF2FB;"><hr />
		안녕하세요. 번개장터입니다. <br /><br />
		번개장터 앱을 벗어나 거래를 하며 발생되는 분쟁과 사기 피해가 지속됨에 따라
		<br />외부 채널 유도에 대한 운영 정책이 아래와 같이 강화되오니 고객님들의 적극적인 협조 부탁 드립니다.
		<br /><br />[운영정책 강화 항목]
		<br />- 외부 채널로의 문의/상담으로 연결되는 링크(URL) 기재 및 연락 유도 불가
		<br />- 타 사이트로의 결제 유도 및 결제 페이지 공유 불가
		<br />(예시 : 카카오톡/라인 등의 메신저 ID기재, 휴대폰 번호 등의 연락처 기재, 카카오톡 플러스 친구, 오픈카톡 링크 기재 또는 대화 유도 등)
 		<br /><br />- 적용 일시 : 22년 6월 1일 부터 ~
		<br /><br />안전한 거래를 위해 번개톡과 번개페이 안전결제를 활용해주시기 바라며
		<br />위의 운영정책을 위반하는 경우 내부 제재 정책에 따라 상품삭제 및 이용제한 등의 조치가 진행되오니 이용에 참고 부탁 드립니다.
		<br />안전한 거래 환경이 유지될 수 있도록 고객님의 적극적인 협조 부탁드립니다. 
		<br />감사합니다. </div>
		<hr />
		<div id="c">[공지] 특정 전자기기 거래 금지 시행 안내</div>
		<div id="d" style="display: none;"><hr />안녕</div>
		<hr />
		<div id="e">[공지] Comfit 개인정보처리방침 개정 안내 </div>
		<div id="f" style="display: none;"><hr />안녕</div>
		<hr />
		<div id="g">[공지] '비트코인/가상화폐/암호화폐' 거래 금지 안내</div>
		<div id="h" style="display: none;"><hr />안녕</div>
		<hr />
		
		
		
	</div>
</div>






















</body>
</html>