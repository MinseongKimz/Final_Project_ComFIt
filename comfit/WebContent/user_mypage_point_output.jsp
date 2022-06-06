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
<title>출금페이지</title>
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
		
	})
 
</script>

</head>
<body>



<div>
	<div>
		<!-- 헤더 영역 -->
		<c:import url="comfit_header_user.jsp"></c:import>
	</div>

	<div class="title">
		마이페이지
		<br><br>
	</div>
	
	<div>
		<div class="row">
			<div class="col-md-12 col-sm-12 col-lg-1" style="margin-left: 3%;">
				<div class="list-group ">
					<a href="#" class="list-group-item list-group-item-action">회원정보</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">구매내역</a>
					<br /> <a href="#"
						class="list-group-item list-group-item-action ">판매내역</a> <br />
					<a href="#" class="list-group-item list-group-item-action active" >입출금내역</a>
					<br /> <a href="#" class="list-group-item list-group-item-action">회원탈퇴</a>
				</div>
			</div>

			<div class="col-lg-10 col-sm-12 col-md-12"  style="margin-left: 5%; width: 60%;">
				<div class="d-flex justify-content-between">
					<p class="ibgum" style="font-size: 18pt; font-weight: bolder;">출금하기</p>
				</div>
				
				<!-- 테이블  -->
				<div >
					<table class="table" style="width: 60%;">
						<tr>
							<th colspan="2">보유금액</th><th class="ibgum">80,000P</th>
						</tr>
						<tr>
							<th>출금</th> <td><input type="text" class="form-control" placeholder="원하는 금액을 입력하세요"
													id="withdrawMoney"></td><th>원</th>
						</tr>
						<tr>
							<th colspan="3">출금 계좌 입력</th> 
						</tr>
						<tr>
							<th>은행</th>
							<td colspan="2">
								<select class="form-control" id="bankName"> 
									<option selected="selected">--은행을 선택하세요--</option>
									<option value="1">국민은행</option>
									<option value="2">기업은행</option>
									<option value="3">우리은행</option>
									<option value="4">하나은행</option>
									<option value="5">외환은행</option>
								</select>
							</td>
						</tr>
						<tr>
							<th>계좌번호</th>
							<td colspan="2">
								<input type="text" class="form-control" id="accountNum" placeholder="계좌번호를 입력해 주세요">
							</td>
						
						</tr>
						<tr>
							<td colspan="3" style="text-align: center;">
								<button class="btn btn-primary" style="margin-right: 5%; width: 100px;"
								data-bs-toggle="modal" data-bs-target="#withdrawOk"
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

<!-- Modal 출금 확인 -->
<div class="modal fade" id="withdrawOk" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
         <h3><span class="chulgum">40,000</span> P 가 출금 되었습니다.</h3><br />
         
         잔여 포인트 : <span class="ibgum">40,000</span> p<br />
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-primary" aria-label="Close" data-bs-dismiss="modal">확인</button>
      </div>
    </div>
  </div>
</div>



</body>
</html>