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

	$(document).ready(function()
	{
		
		
		
		$("#cancel-btn").click(function()
		{
			//alert("취소버튼확인");
			location.href="admin_faq_list.action";
		})
		
		$("#submitBtn").click(function()
		{
			$("#modifyForm").submit();
		});
		
	})
	

</script>
</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<div class="container" style="margin-top: 5%;">
	<div class="row">
	<form action="admin_faq_modify.action" method="post" id="modifyForm">
		<table class="table table-bordered" style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="2" style="background-color: #ffffff; text-align: left;" >FAQ 수정</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<div class="" style="display: flex; width: 100%; align-content: right;">
			   			<input type="text" class="form-control" name="faq_title" id="faq_title" value="${modify.faq_title }">
		   			</div>
					</td>	
				</tr>
				<tr>	
					<td><textarea class="form-control" name="faq_contents" id="faq_contents" maxlength="2048" style="height: 350px;">${modify.faq_contents }</textarea></td>
				</tr>
			</tbody>
		</table>
		<div>
			<input type="text" style="display: none;" name="faq_id" value="${modify.faq_id }" />
			<button type="button" class="btn btn-primary pull-right" id="submitBtn" style="width: 100px;">수정</button>
			<button type="button" class="btn btn-outline-secondary" id="cancel-btn" value="글쓰기" style="width: 100px;">취소</button>	
		</div>
	</form>
	</div>
</div>


</body>
</html>