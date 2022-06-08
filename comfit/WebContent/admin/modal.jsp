<%@page import="bbs.Bbs"%>
<%@page import="java.util.ArrayList"%>
<%@page import="bbs.bbsDAO"%>
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
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/custom.css">
<title>bbs.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<h1>일반 회원 리스트</h1> <!-- 왜 서체가? 배민서체지? 커스텀 css해놔서 그럼 -->
		<table class="table table-striped" style="text-align: center; border: 1px solid #dddddd">
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
						<select name="job">
						    <option value="">카테고리</option>
						    <option value="정상">정상</option>
						    <option value="차단" data-target="#modal" data-toggle="modal">차단</option>
						</select>
					</td>
					<td>1회</td>
				</tr>
			</tbody>
		</table>

		오른쪽 정렬 어케함... 
		<div class="btn-group" style="display: flex; width: 30%; align-content: right;">
			<select name="job">
			    <option value="">카테고리</option>
			    <option value="">1</option>
			    <option value="">2</option>
			</select> 
		   <input type="text" class="form-control" placeholder="검색어를 입력하세요">
		   <button type="submit" class="btn btn-default" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">검색</button>
		</div>	
	</div>
</div>


<!-- 셀렉트에 안먹어서 일단... 검색버튼에 모달 먹여놓음 -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
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
            <select name="" id="">
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
        <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary">Send message</button>
      </div>
    </div>
  </div>
</div>

<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
<script src="js/bootstrap.js"></script>

</body>
</html>