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
<title>ad_notice_write.jsp</title>
<script type="text/javascript">
	
	$(document).ready(function ()
	{
		$("#delete_btn").click(function ()
		{
			//alert("테스트");
			location.href="admin_notice_list.action";
		})
	})
</script>
</head>
<body>

<form action="admin_notice_modify.action" method="POST" name="insert">
<div class="container">
	<div class="row">
		<table class="table table-bordered " style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="2" style="background-color: #eeeeee; text-align: left;">공지 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
				
					<div class="" style="display: flex; width: 100%; align-content: right;">
						<select class="form-select" style="width: 25%; margin-right: 10px" name="announce_cate_id" id="announce_cate_id">
						<c:forEach var="noticecateList" items="${noticecateList }" > 
						   	 <option value="${noticecateList.anoun_cate_id}" >${noticecateList.anoun_cate_name }</option>
						</c:forEach>
						</select>
					
			   			<input type="text" class="form-control" id="announce_title"name="announce_title"value=${noticeModifyForm.announce_title }>
		   			</div>
					</td>	
				</tr>
				<tr>	
					<td><textarea class="form-control"  name="announce_contents" id="announce_contents" maxlength="2048" style="height: 350px;" >${noticeModifyForm.announce_contents }</textarea></td>
				</tr>
			</tbody>
		</table>
				<div style="margin-top: 20px; width: 1300px; text-align: right;">
					<input type="text" style="display: none;" name="announce_id" value="${noticeModifyForm.announce_id }" />
					<button type="submit" id="insert_btn"class="btn btn-primary" value="글쓰기" style="width: 150px" >수정</button>
					<button type="button" id="delete_btn"class="btn btn-outline-secondary" value="돌아가기" style="width: 150px">취소</button>				
				</div>	
		</div>
	</div>
</form>


</body>
</html>