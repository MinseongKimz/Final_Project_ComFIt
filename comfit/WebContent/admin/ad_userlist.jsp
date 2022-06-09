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
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>일반 회원 리스트</h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-boreded" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="background-color: #eeeeee; text-align: center;">E-mail</th>
					<th style="background-color: #eeeeee; text-align: center;">이름</th>
					<th style="background-color: #eeeeee; text-align: center;">닉네임</th>
					<th style="background-color: #eeeeee; text-align: center;">전화</th>
					<th style="background-color: #eeeeee; text-align: center;">레벨</th>
					<th style="background-color: #eeeeee; text-align: center;">가입일</th>
					<th style="background-color: #eeeeee; text-align: center;">상태</th>
					<th style="background-color: #eeeeee; text-align: center;">누적 차단 횟수</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>yjooo0816@gmail.com</td>
					<td>이연주</td>
					<td>이연주</td>
					<td>010-1111-1111</td>
					<td>1LV</td>
					<td>2022.05.05</td>
					<td>
					
						<!-- 셀렉트박스 -->
						<select class="form-select" style="width: 40%; text-align: right;">
						    <option selected>카테고리</option>
						    <option value="">1</option>
						    <option value="">2</option>
						</select> 
						
						<!-- 드롭다운 -->
						<div class="btn-group">
						  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
						    카테고리 <span class="caret"></span>
						  </button>
						  <ul class="dropdown-menu" role="menu">
						    <li><a href="#">정상</a></li>
						    <li><a href="#" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">차단</a></li>
						  </ul>	  
						</div>		
											
					</td>
					<td>1회</td>
				</tr>
			</tbody>
		</table>

		<div style="text-align: right;">
			<div class="btn-group" style="width: 30%; text-align: right;">
				<select class="form-select" style="width: 40%; text-align: right;">
				    <option selected>카테고리</option>
				    <option value="">1</option>
				    <option value="">2</option>
				</select> 
	        <div class="input-group" style="width:100%; text-align: right;">
	           <input type="text" class="form-control" placeholder="검색어를 입력하세요">
	            <button id="Btn" type="button" class="btn btn-outline-primary" data-bs-toggle="modal" data-bs-target="#exampleModal">
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
            <select name="" id="" >
			    <option value="">10일 차단</option>
			    <option value="">1달 차단</option>
			    <option value="">영구 차단</option>            
            </select>
          </div>
          <div class="form-group">
            <b>차단 사유</b>
            <select name="" id="">
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



</body>
</html>