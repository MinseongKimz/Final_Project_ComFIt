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

</head>
<body>


<div class="container">
	<div class="row">
	<form action="" method="post">
		<table class="table table-bordered " style="text-align: center; border: 1px solid #dddddd">
			<thead><!-- 제목 -->
				<tr><!-- 1행 -->
					<th colspan="2" style="background-color: #eeeeee; text-align: left;">공지 등록</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>
					<div class="" style="display: flex; width: 100%; align-content: right;">
						<select class="form-select" style="width: 25%; margin-right: 10px">
						    <option selected>카테고리</option>
						    <option value="">1</option>
						    <option value="">2</option>
						</select>
			   			<input type="text" class="form-control" placeholder="제목을 입력하세요">
		   			</div>
					</td>	
				</tr>
				<tr>	
					<td><textarea class="form-control" placeholder="글 내용" name="bbsContent" maxlength="2048" style="height: 350px;"></textarea></td>
				</tr>
			</tbody>
		</table>
				<div style="margin-top: 20px; width: 1100px;"> 오른쪽 정렬... 어케함
					<button class="btn btn-primary" value="글쓰기" style="width: 150px">글쓰기</button>
					<button class="btn btn-outline-secondary" value="돌아가기" style="width: 150px" onclick="location.href='ad_ask_list.jsp'">돌아가기</button>				
				</div>	
	</form>
	</div>
</div>


</body>
</html>