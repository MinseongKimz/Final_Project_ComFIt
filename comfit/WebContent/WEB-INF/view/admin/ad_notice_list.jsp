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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
	// 공지사항 글쓰기 버튼
	$(document).ready(function()
	{
		$("#btn-write").click(function()
		{
			//alert("글쓰기버튼");
			location.href="admin_notice_edit.action";
			
			
		})
		
	})
	
	//공지사항 수정 버튼
	$(document).ready( function()
	{
		$("#btn_edit").click(function()
		{
			//alert("수정버튼");
			location.href="admin_notice_modify_form.action?announce_id="+$(this).val();
		})
	})
	
	//공지사항 삭제 버튼
	$(document).ready( function()
	{
		$("#btn_delete").click(function()
		{
			//alert("삭제버튼");
		})
	})
	
</script>




<!-- 디자인 담당 -->
<title>공지사항 리스트</title>
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
<!-- 
<div class="container">
<div style="margin-bottom: 20px"><h1><b>공지사항</b></h1></div>
</div>
 -->
 <%-- 		
<div class="accordion" id="accordionExample">
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingOne">
      <button class="accordion-button" type="button" data-bs-toggle="collapse" data-bs-target="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
        [공지] 외부 채널 유도 관련 운영정책 강화 안내
      </button>
    </h2>
    <div id="collapseOne" class="accordion-collapse collapse show" aria-labelledby="headingOne" data-bs-parent="#accordionExample">
      <div class="accordion-body">
					Comfit 앱을 벗어나 거래를 하며 발생되는 분쟁과 사기 피해가 지속됨에 따라<br>
					외부 채널 유도에 대한 운영 정책이 아래와 같이 강화되오니 고객님들의 적극적인 협조 부탁드립니다.<br>
					<운영정책 강화 항목><br>
					- ......<br>      
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingTwo">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
       [공지] 특정 전자기기 거래 금지 시행 안내
      </button>
    </h2>
    <div id="collapseTwo" class="accordion-collapse collapse" aria-labelledby="headingTwo" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the second item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
  <div class="accordion-item">
    <h2 class="accordion-header" id="headingThree">
      <button class="accordion-button collapsed" type="button" data-bs-toggle="collapse" data-bs-target="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
        Comfit 개인정보처리방침 개정 안내
      </button>
    </h2>
    <div id="collapseThree" class="accordion-collapse collapse" aria-labelledby="headingThree" data-bs-parent="#accordionExample">
      <div class="accordion-body">
        <strong>This is the third item's accordion body.</strong> It is hidden by default, until the collapse plugin adds the appropriate classes that we use to style each element. These classes control the overall appearance, as well as the showing and hiding via CSS transitions. You can modify any of this with custom CSS or overriding our default variables. It's also worth noting that just about any HTML can go within the <code>.accordion-body</code>, though the transition does limit overflow.
      </div>
    </div>
  </div>
</div>		
		
	</div>	
</div> --%>
 
 
 
<div class="container">
	<div class="row" style="background-color: white; padding-bottom: 20px">
	<div style="margin-bottom: 20px"><h1><b>공지사항</b></h1></div>
		<div id="Accordion_wrap">
		     <!-- <div class="que" >
		      <span>[공지] 외부 채널 유도 관련 운영정책 강화 안내</span>
		     </div> -->
		     <c:forEach var = "notice" items="${noticeList}">
				     <div class="que" >
				     	<span>${notice.announce_title }</span>
				     </div>	
		     
		     <div class="anw" style="padding-left: 20px">
		      <!-- <span>Comfit 앱을 벗어나 거래를 하며 발생되는 분쟁과 사기 피해가 지속됨에 따라<br>
					외부 채널 유도에 대한 운영 정책이 아래와 같이 강화되오니 고객님들의 적극적인 협조 부탁드립니다.<br>
					<운영정책 강화 항목><br>
					- ......<br>
			 </span> -->
			 <span>${notice.announce_contents }</span>
			 <div style="margin-top: 50px; text-align: right;">
					<button class="btn btn-primary" value="${notice.announce_id }" id="btn_edit"style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="${notice.announce_id }" id="btn_delete" style="width: 100px;">삭제하기</button>			 
		     </div>		 
		     </div>
		     </c:forEach>
  		</div>
     </div>
 </div>


<div class="container" style="margin-top: 10px;text-align: right;">
	<button class="btn btn-primary pull-right " id="btn-write"  style="width: 100px;" value="${announce_id }">글쓰기</button>
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