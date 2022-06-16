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
<title>ad_userbanned_list.jsp</title>
<link rel="stylesheet" type="text/css" href="<%=cp%>/css/main.css">
</head>
<body>


<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">신고 처리</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="ms-auto" style="margin-bottom: 10px">
          	<b>신고 세부 내용</b>
            <input type="text" class="form-control" id="recipient-name" readonly="readonly">
            <hr />
          </div>
          <div class="ms-auto" style="margin-bottom: 10px">
          	<b>게시글 링크</b><br>
          	<a href="#">#</a>
          	<hr />
          </div>       
          <div class="ms-auto">
          	<div style="margin-bottom: 10px"><b><span style="color: #0080FF">처리내용</span></b></div>	
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



<c:import url="ad_Header.jsp"></c:import>

<div class="container">
	<div class="row">
	<div style="margin-bottom: 20px"><h1><b>관리자모드_고객센터</b></h1></div> 
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th style="text-align: center;">회원 ID</th>
					<th style="text-align: center;">게시물 ID</th>
					<th style="text-align: center;">신고자 ID</th>
					<th style="text-align: center;">신고내용</th>
					<th style="text-align: center;">관리자 조치</th>
					<th style="text-align: center;">접수시간</th>
					<th style="text-align: center;">처리시간</th>
				</tr>
			</thead>
			<tbody>
			<c:forEach var="report" items="${userReportlist }">
				<tr>
					<td>${report.u_id }</td>
					<td ><a href="" data-bs-toggle="modal" data-bs-target="#exampleModal">${report.pd_id }</a></td>
					<td>${report.r_u_id }</td>
					<td>${report.rep_contents }</td>
					<td>${report.han_cate_name }</td>
					<td>${report.rep_date }</td>
					<td>${report.rep_han_date }</td>
				</tr>
			</c:forEach>
			</tbody>
		</table>
	</div>
</div>









</body>
</html>