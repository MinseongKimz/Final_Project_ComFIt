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
<title>입금페이지</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>

<style type="text/css">
	.list-group {
	width: 120px;
	text-align: center;
}

.title {
	margin-left: 11%;
	font-family: 맑은 고딕;
	font-size: 30pt;
}


.list-group-item {
	text-align: center;
	font-weight: bold;
}
.container
{
	margin-left: 5%;
}
h5
{
	font-weight: bold;
}
.ibgum{
	color: #0080FF;
	font-weight: bold;
}
.chulgum
{
	color: red;
	font-weight: bold;
}

#virtualAccount
{
	font-size: 10pt;
	display: none;
}

</style>

<script type="text/javascript">
	
	$(function()
	{
		//alert("gfd");
		$("#payBtn").click(function()
		{
			$("#virtualAccount").css("display", "inline");
		})
		
	})
 
</script>

</head>
<body>



<div>
	<div class="header">
	      <c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
 	</div>

	<div class="title">
		마이페이지
		<br><br>
	</div>
	
	<div>
		<div class="row">
			<div style="float:left; margin-left:15%;">
					<c:import url="/WEB-INF/view/user/main/user_sidebar.jsp" ></c:import>
			</div>		 

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 5%; width: 60%;">
				<div class="d-flex justify-content-between">
					<p class="ibgum" style="font-size: 18pt; font-weight: bolder;">입금하기</p>
				</div>
				
				<!-- 테이블  -->
				<div >
					<table class="table table-borderless" style="width: 60%;">
						<tr>
							<th colspan="2">보유금액</th><th class="ibgum">40,000P</th>
						</tr>
						<tr>
							<th>입금</th> <td><input type="text" class="form-control" placeholder="원하는 금액을 입력하세요"
													id="needMoney"></td><th>원</th>
						</tr>
						<tr>
							<th colspan="3">충전 수단</th> 
						</tr>
						<tr>
						<td colspan="3" style="text-align: center;">
						<button class="btn btn-secondary" style="margin-right: 5%"
						disabled="disabled">카카오페이</button>
						<button class="btn btn-secondary" style="margin-right: 5%"
						disabled="disabled">네이버페이</button>
						<button class="btn btn-primary" id="payBtn">무통장입금</button></td>
						</tr>
						<tr>
							<td colspan="3" style="text-align: center;">
								<p id="virtualAccount">김상기님의 가상 계좌입니다<br>
								국민은행 : 656502-01-450731<br />
								30분내 입금 부탁드립니다.</p>
							</td>						
						</tr>
						<tr>
							<td colspan="3" style="text-align: center;">
								<button class="btn btn-primary" style="margin-right: 5%; width: 100px;"
								data-bs-toggle="modal" data-bs-target="#depositOk"
								>확인</button>
								<button class="btn btn-secondary"  style="width: 100px;">취소</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</div>
	</div>
	

</div>

<!-- Modal 입금 확인 -->
<div class="modal fade" id="depositOk" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h3><span class="ibgum">40,000</span> P 가 입금되었습니다.</h3><br />
         
         잔여 포인트 : <span class="ibgum">80,000</span> p<br />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>