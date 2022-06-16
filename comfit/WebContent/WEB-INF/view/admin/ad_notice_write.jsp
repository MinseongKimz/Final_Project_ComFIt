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
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<title>공지사항 입력</title>
<script type="text/javascript">
	
	$(document).ready(function ()
	{
		$("#delete_btn").click(function ()
		{
			//alert("테스트");
			location.href="admin_notice_list.action";
		})
		
		$("#insert_btn").click(function()
		{
			$("#insertForm").submit();
		})
		
	})
</script>
</head>
<body>
<div class="container">

	<div class="row"> 
	<form action="noticeinsert.action" method="post" name="insert" id="insertForm">	
		<table class="table table-bordered " style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="2" style="background-color: #eeeeee; text-align: left;">공지 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<div style="display: flex; width: 100%; align-content: right;">
						<select class="form-select" style="width: 25%; margin-right: 10px" name="announce_cate_id" id="announce_cate_id">
						<c:forEach var="noticecateList" items="${noticecateList }" > 
						   	 <option value="${noticecateList.anoun_cate_id}" >${noticecateList.anoun_cate_name }</option>
						</c:forEach>
						</select>
						<input type="text" class="form-control " id="announce_title "name="announce_title" placeholder="제목을 입력하세요">
		   			</div>
					</td>	
				</tr>
				<tr>	
					<td><textarea class="form-control" placeholder="글 내용" name="announce_contents" id="announce_contents" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			
			</tbody>
		</table>
		</form>			
				<div style="margin-top: 20px; width: 1300px; text-align: right;">
					<button type="button" id="insert_btn"class="btn btn-primary" style="width: 150px;" >글쓰기</button>
					<button type="button" id="delete_btn"class="btn btn-outline-secondary" style="width: 150px">돌아가기</button>				
				</div>	
				
			
	</div>

</div>
</body>
</html>