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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>bbs.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		//alert("테스트");
		
		$("#searchBtn").click(function()
		{
			
			//alert("확인");
			
			// 카테고리 설정 안하고 검색했을때 걸러내기
			if ($(".listselect").val() == "카테고리")
			{
				alert("검색 카테고리를 설정해 주세요.");
				return;
			}
			

			alert($("#listselect").val()); //u_email, 
			alert($("#searchvalue").val()); //서치값
			
			$(location).attr("href", "/comfit/admin_usersearchlist.action?listselect="+$("#listselect").val()+"&searchvalue="+$("#searchvalue").val());

			
			
		})
		
		$(".userblock").change(function()
		{
			// alert("차단");
			
			alert($(".userblock").val());
			
			$(location).attr('href', '/admin_userblock.action');
			
		});		
	});

</script>

</head>
<body>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">카테고리 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="ms-auto" style="margin-bottom: 10px">
            <b>차단 기간</b>
            <select class="form-select" style="width: 40%;">
			    <option value="">10일 차단</option>
			    <option value="">1달 차단</option>
			    <option value="">영구 차단</option>            
            </select>
            <hr />
          </div>
          <div class="ms-auto" style="margin-bottom: 10px">
            <b>차단 사유</b>
            <select class="form-select" style="width: 40%;">
			    <option value="">부적절한 게시물</option>
			    <option value="">광고홍보</option>
            </select>
          	<hr />
          </div>       
          <div class="ms-auto">
          	<div style="margin-bottom: 10px"><b><span style="color: #0080FF">차단 상세</span></b></div>	
          	<textarea class="form-control" id="exampleFormControlTextarea1" rows="3" placeholder="내용을 입력해주세요" ></textarea>
          </div>       
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary">입력</button>
      </div>
    </div>
  </div>
</div>


<div>

<div>
<c:import url="ad_Header.jsp"></c:import>
</div>

<div class="container">
	<div class="row">
	<div class="" style="margin-bottom: 20px"><h1><b>일반 회원 리스트</b></h1></div>  <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-bordered " style="text-align: center; border: 1px solid #dddddd; box-shadow: 0 1px 3px 0 rgba(0,0,0,0.20);">
			<thead style="background-color: #f9fafd"><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #; text-align: center;">회원코드</th>
					<th style="background-color: #; text-align: center;">E-mail</th>
					<th style="background-color: #; text-align: center;">이름</th>
					<th style="background-color: #; text-align: center;">닉네임</th>
					<th style="background-color: #; text-align: center;">전화</th>
					<th style="background-color: #; text-align: center;">레벨</th>
					<th style="background-color: #; text-align: center;">가입일</th>
					<th style="background-color: #; text-align: center;">상태</th>
					<th style="background-color: #; text-align: center;">누적 차단 횟수</th>
				</tr>
			</thead>
			<tbody style="background-color: white;">
				<c:forEach var="user" items="${userList }">
					<tr>
						<td>${user.u_id }</td>
						<td>${user.u_email }</td>
						<td>${user.u_name }</td>
						<td>${user.u_nickname }</td>
						<td>${user.u_tel }</td>
						<td>1LV</td>
						<td>${user.u_joindate }</td>
						<td style="margin-left: 20px">
						
							
							<div style="text-align: center;">
							<select class="form-select userblock" style="width: 80%; display: inline-block;">
							    <option selected>정상</option>
							    <option value="3block">3일차단</option>
							    <option value="7block">7일차단</option>
							    <option value="30block">30일차단</option>
							    <option value="perblock">영구차단</option>
							</select>
							</div>											
						</td>
						<td>${user.bancount }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<div style="text-align: right;">
			<div class="btn-group">
				<select class="form-select listselect" id="listselect" style="width: 40%;">
				    <option selected>카테고리</option>
				    <option value="u_email">E-mail</option>
				    <option value="u_name">이름</option>
				    <option value="u_nickname">닉네임</option>
				</select> 
	        <div class="input-group" style="width:100%; text-align: right;">
	           <input type="text" class="form-control" id="searchvalue"  placeholder="검색어를 입력하세요">
	            <button id="searchBtn" type="button" class="btn btn-outline-primary">
	          		<i class="bi bi-search"></i>
	            </button>
			</div>
			</div>
		</div>

	</div>
</div>


<!-- 셀렉트에 안먹어서 일단... 검색버튼에 모달 먹여놓음/드롭다운에도 먹여놓음 -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h4 class="modal-title" id="exampleModalLabel">차단 관리</h4>
      </div>
      <div class="modal-body">
        <form>
          <div class="form-group">
            <b>차단 기간</b>
            <select class="form-select" style="width: 40%; text-align: right;">
			    <option value="">10일 차단</option>
			    <option value="">1달 차단</option>
			    <option value="">영구 차단</option>            
            </select>
          </div>
          <div class="form-group">
            <b>차단 사유</b>
            <select class="form-select" style="width: 40%; text-align: right;">
			    <option value="">부적절한 게시물</option>
			    <option value="">광고홍보</option>
            </select>
          </div>
          <div class="form-group">
            <b>차단 상세</b>
          </div>
          <div class="form-group">
          	<textarea rows="5" cols="75"></textarea>
          </div>          
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-default" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary">확인</button>
      </div>
    </div>
  </div>
</div>

</div>

</body>
</html>