<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_find_pw.jsp</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">

<style>
      .bd-placeholder-img {
        font-size: 1.125rem;
        text-anchor: middle;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
      }
      @media (min-width: 768px) {
        .bd-placeholder-img-lg {
          font-size: 3.5rem;
        }
      }
      .input-group
      {
      	width: 50%;
      	margin-left: 14px;
      	
      }
      #sellBtn
      {
      	width: 200px;
      }
      #dropdown-item
      {
      	width: 200px;
      }
</style>

<link href="headers.css" rel="stylesheet">
<script type="text/javascript" src="/js/bootstrap.js"></script>


<style type="text/css">
	*
	{
		font-family: 맑은 고딕;
	}
	.form-control
	{
		width: 200px;
	}
	
</style>
</head>


<body>

<div>
	<c:import url="admin/comfit_header_nolog.jsp"></c:import>
</div>
	
<div style="margin: auto;">
	<div style="text-align: center; margin-top: 6% ">
		<button type="button" class="btn btn-secondary" style="margin-right: 20px; width: 120px;" >ID 찾기</button>
		<button type="button" class="btn btn-primary" style="margin-left: 20px; width: 120px;">PW 찾기</button>
	</div>
	<br />
	<div style="width: 300px; margin: auto;">
	<input type="text" class="form-control" placeholder="이메일을 입력하세요"/>
	<br />
	<input type="text" class="form-control" placeholder="이름을 입력하세요"/>
	<br />
	<input type="text" class="form-control" placeholder="전화번호를 입력하세요"/>
	<br />
	<input type="text" class="errMsg" placeholder="등록된 이름과 전화번호와 이메일이 일치하지 않습니다. 다시 입력해주세요." style="color:red; display: none;"/>
	<br />
	<button type="button" class="btn btn-primary" style="width: 300px;" >확인</button>
	</div>
	
	<br /><br />
	
</div>	
	

		




</body>
</html>