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
		
		$(".btn_edit").click(function()
		{
			//alert("수정버튼");
			location.href="admin_notice_modify_form.action?announce_id="+ $(this).val();
			//alert($("#btn_edit").val());
		})
		
		$(".btn_delete").click(function()
		{
			location.href="admin_motice_delete.action?announce_id="+ $(this).val();
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
 
 
<div class="container">
	<div class="row" style="background-color: white; padding-bottom: 20px">
	<div style="margin-bottom: 20px"><h1><b>공지 사항</b></h1></div>
		<div id="Accordion">
		     <!-- <div class="que" >
		      <span>[공지] 외부 채널 유도 관련 운영정책 강화 안내</span>
		     </div> -->
		     <c:forEach var = "noticeModifyForm" items="${noticeList}">
							     <div class="que">
							     	<span>${noticeModifyForm.announce_title }</span>
							     </div>	
							     
		     	<div class="anw" style="padding-left: 20px">
				 <span>${noticeModifyForm.announce_contents }</span>
			 				    <div style="margin-top: 50px; text-align: right;">
									<button type="submit"class="btn btn-primary btn_edit" value="${noticeModifyForm.announce_id }"  id="btn_edit"  style="width: 100px;">수정하기</button>
									<button class="btn btn-outline-secondary btn_delete" value="${noticeModifyForm.announce_id }"  id="btn_delete" style="width: 100px;">삭제하기</button>			 
		     					</div>		 
		     	</div>
		     </c:forEach>
  		</div>
     </div>
 </div>


<div class="container" style="margin-top: 10px; text-align: right;">
	<button class="btn btn-primary pull-right " id="btn-write"  style="width: 100px;">글쓰기</button>
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