<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>


<meta charset="UTF-8">
<title>user_alert.jsp</title>
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
	.content
	{
		margin-top: 3%;
		margin-left: 15%; 
		margin-right: 15%;
	}
	
	.category
	{
		padding-top: 3%;
	}
	
	.pd_list
	{
		padding-top: 3%;
	}
	
	.title
	{
		margin-left: 5%;
		font-size: 30pt;
	}
	
	.main
	{
		margin-top: 3%; 
	}

</style>
</head>


<body>

<div>
	<!-- Header 영역 -->
<%
	String u_id = (String)session.getAttribute("u_id");
	
	if(u_id != null)
	{	
%>
		<div class="header">
			<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
		</div>
<%	}
	else
	{
%>
	<div>
   		<c:import url="/WEB-INF/view/user/main/comfit_header_nolog.jsp"></c:import>
	</div>
<%	} %>	
	<!-- title -->
	<div class="title">
			알림목록
	</div>
	
	
	<!-- Content 영역 -->
	<div class="content">
		
		
		<div class="sub_content">
			<button type="button" class="btn btn-primary">알림 전체 삭제</button>
			<button type="button" class="btn btn-primary">안읽음 : <span style="font-weight: bold;">3</span></button>
		</div>
		
		<div class="main">
			<div class="alert_list">
			<table class="table">
				<tr>
					<th>
						분류
					</th>
					<th>
						제목
					</th>
					<th>
						상품명 / 제조사
					</th>
					<th>
						내용
					</th>
					<th>
						일시
					</th>
					<th>
						읽음 / 삭제
					</th>
				</tr>
				<tr>
					<td>
						[직거래 / 제안]
					</td>
					<td>
						[HP노트북중고 팔아요]
					</td>
					<td>
						[노트북] / [HP]
					</td>
					<td>
						제안이 채택되었습니다.
					</td>
					<td>
						2022-06-01 17:52:39					
					</td>
					<td>
						<button type="button" class="btn btn-primary">읽음</button>
						<button type="button" class="btn btn-secondary">삭제</button>
					</td>
				
				</tr>
				<tr>
					<td>
						[직거래 / 판매]
					</td>
					<td>
						[SSD 최저가 판매해요]
					</td>
					<td>
						[SSD] / [NVDIA]
					</td>
					<td>
						거래가 종료되었습니다.
					</td>
					<td>
						2022-06-01 12:00:18					
					</td>
					<td>
						<button type="button" class="btn btn-primary">읽음</button>
						<button type="button" class="btn btn-secondary">삭제</button>
					</td>
				
				</tr>
				<tr>
					<td>
						[문의]
					</td>
					<td>
						[구매확정 어떻게해요?]
					</td>
					<td>
						-
					</td>
					<td>
						[답변] 구매확정은 마이페이지-구매내역에서....
					</td>
					<td>
						2022-05-30 15:25:57					
					</td>
					<td>
						<button type="button" class="btn btn-primary">읽음</button>
						<button type="button" class="btn btn-secondary">삭제</button>
					</td>
				
				</tr>
			</table>	
		
		</div>
		
		</div>
		
		
		
		
		
		
	</div>	<!-- content  -->
	
	
	<!-- Footer 영역 -->
	<div class="footer">
	</div>
	
</div>



</body>
</html>