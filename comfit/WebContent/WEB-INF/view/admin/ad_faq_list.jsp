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
<title>FAQ 리스트</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	// FAQ 글쓰기 버튼
	$(document).ready(function()
	{
		$("#write-btn").click(function()
		{
			//alert("글쓰기버튼");
			location.href="admin_faq_edit.action";
		})
		
	})
	
	// FAQ 글 수정 버튼
	$(document).ready(function()
	{
		$(".btn-modify").click(function()
		{
			//alert("글쓰기버튼");
			location.href="admin_faq_modify_form.action?faq_id=" + $(this).val();
		})
		
	})
	
	
	// FAQ 글 삭제 버튼
	$(document).ready(function()
	{
		$(".btn-delete").click(function()
		{
			//alert("글쓰기버튼");
			location.href="admin_faq_delete.action?faq_id=" + $(this).val();
		})
		
	})
	

</script>
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
	<div class="row" style="background-color: white; padding-bottom: 20px">
	<div style="margin-bottom: 20px"><h1><b>자주 묻는 질문</b></h1></div>
		<div id="Accordion">
		
			<c:forEach var="faq" items="${faqList }">
			<div class="que">
				<span>${faq.faq_title }</span>
			</div>
		     
			<div class="anw" style="padding-left: 20px">
				<span>${faq.faq_contents }</span>
				<div style="margin-top: 50px; text-align: right;">
					<button type="submit" class="btn btn-primary btn-modify" value="${faq.faq_id }" style="width: 100px;">수정하기</button>
					<button type="button" class="btn btn-outline-secondary btn-delete" value="${faq.faq_id }" style="width: 100px;">삭제하기</button>			 
				</div>
		    </div>
			</c:forEach>
		
		    <!--  <div class="que">
		      <span>회원 탈퇴를 하고 싶어요.</span>
		     </div>
		     
		     <div class="anw" style="padding-left: 20px">
			     <span>주문하신 상품은 결제 완료 후 안내된 배송예정일까지 배송됩니다.
						배송예정일은 판매자 및 배송지에 따라 차이가 있을 수 있습니다.
						또한, 도서산간 지역 배송 혹은 천재지변으로 읺애 배송일정이 변동될 수 있습니다.
				 </span>
				 <div style="margin-top: 50px; text-align: right;">
						<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
						<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
			     </div>
		     </div>
		     
		      <div class="que">
		      <span>회원정보 변경은 어디서 하나요?</span>
		     </div>
		     <div class="anw" style="padding-left: 20px">
		      <span>주문하신 상품은 결제 완료 후 안내된 배송예정일까지 배송됩니다.<br>
					배송예정일은 판매자 및 배송지에 따라 차이가 있을 수 있습니다.<br>
					또한, 도서산간 지역 배송 혹은 천재지변으로 읺애 배송일정이 변동될 수 있습니다.<br> 
			 </span>
			 <div style="margin-top: 50px; text-align: right;">
					<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
		     </div>
		     </div>
		      <div class="que">
		      <span>상품 변경은 어디서 하나요?</span>
		     </div>
		     <div class="anw" style="padding-left: 20px">
		      <span>주문하신 상품은 결제 완료 후 안내된 배송예정일까지 배송됩니다.<br>
					배송예정일은 판매자 및 배송지에 따라 차이가 있을 수 있습니다.<br>
					또한, 도서산간 지역 배송 혹은 천재지변으로 읺애 배송일정이 변동될 수 있습니다.<br> 
			 </span>
			 <div style="margin-top: 50px; text-align: right;">
					<button class="btn btn-primary" value="글쓰기" style="width: 100px;">수정하기</button>
					<button class="btn btn-outline-secondary" value="글쓰기" style="width: 100px;">삭제하기</button>			 
		     </div>
		     </div> -->
		</div>
	</div>	
</div>

<div class="container" style="margin-top: 10px; text-align: right;">
	<button class="btn btn-primary pull-right" id="write-btn" value="글쓰기" style="width: 100px;">글쓰기</button>
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