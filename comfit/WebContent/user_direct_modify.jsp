<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
   request.setCharacterEncoding("UTF-8");
   String cp = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>user_direct_modify.jsp</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=cp %>/css/inputstyle.css">
<link rel="stylesheet" href="css/main.css" type="text/css"> 
<script type="text/javascript">

	function readURL(input) {
	  if (input.files && input.files[0]) {
	    var reader = new FileReader();
	    reader.onload = function(e) {
	      document.getElementById('preview').src = e.target.result;
	    };
	    reader.readAsDataURL(input.files[0]);
	  } else {
	    document.getElementById('preview').src = "";
	  }
	}
</script>
<style type="text/css">
	.subheader
	{
		font-size:25pt;
		font-weight: bold;
		margin-left: 15%;
		margin-top:3%;
	}
	.share
	{
		margin-left: 25%;
		margin-top:3%;
		font-size:25pt;;
	}
	.txt
	{
		margin-left:5%;
		border-radius:5px;
		width:300px;
		height:30pt;
	}
	.category,.product_name,.jejosa_name,.hope_price,.date,.hope_day,.hope_place
	{
		margin-left:5%;
		border-radius:5px;
		width:240px;
		height:30pt;
	}
	.p_share,.j_share
	{
		margin-left:5%;
		font-weight:bold;
		font-size:20pt;
	}
	.as_btn
	{
		margin-left:5%;
		border-radius:5px;
	}
	.as_btn:hover,.btn_modify:hover,.btn_reset:hover
	{
		background:black;
		color:white;
	}
	#comment
	{
		margin-top: 5%;
	}
	.gazi
	{
		margin-top: 5%;
		margin-left:5%;
		border-radius:5px;
		width:200px;
		height:30pt;
	}
	.btn_modify,.btn_reset
	{
		border-radius:5px;
		width:150px;
		height:30pt;
	}
</style>
</head>
<body>
<div>
	<!--Header  -->
	<div class="header">
      <c:import url="comfit_header_user.jsp"></c:import>
   	</div>
   	
	<div>
		<p class="subheader">판매글 수정-직거래</p>
		<hr />
	</div>
	<div class="share">
		<form action="">
			<table>
				<tr>
					<th class="share">제목</th>
					<th>
						<input type="text" class="txt" name="txt" placeholder="제목을 입력해주세요"/>
					</th>
				</tr>
				<tr>
					<th class="share">물품검색</th>
					<td>
						<div class="input-group">
    						<div>
    							<button class="input-group-text" id="btnGroupAddon">검색</button>
    						</div>
   						    <input type="text" class="form-control" placeholder="물품검색" aria-label="Input group example" aria-describedby="btnGroupAddon">
  						</div>
					</td>
				</tr>
				<tr>
					<th class="share">카테고리</th>
					<td>
						<select name="category" id="category" class="category">
							<option value="" selected="selected">물품카테고리</option>
							<option value="">CPU</option>
							<option value="">쿨러/튜닝</option>
							<option value="">메인 보드</option>
							<option value="">메모리</option>
							<option value="">그래픽 카드</option>
							<option value="">HDD/SSD</option>
							<option value="">외장 HDD</option>
							<option value="">케이스</option>
							<option value="">파워</option>
							<option value="">키보드/마우스</option>
							<option value="">모니터</option>
							<option value="">오디오</option>
						</select>
					</td>
						<td class="p_share">물품명</td>
						<td>
						<input type="text" class="product_name"placeholder="물품명을 입력하세요" />
						</td>
						<td class="j_share">제조사</td>
						<td>
						<input type="text" class="jejosa_name"placeholder="제조사를 입력하세요" />
						</td>
				</tr>
				<tr>
					<th class="share">희망가격</th>
					<td>
						<input type="text" class="hope_price"placeholder="희망가격을 입력하세요." />원
					</td>
				</tr>
				<tr>
					<th class="share">거래 가능 일시</th>
					<td>
						<input type="date" class="date">
					</td>
				</tr>
				<tr>
					<th class="share">거래 가능 장소</th>
					<td>
						<input type="text" class="hope_place"placeholder="거래가능장소를 입력하세요." />
					</td>
				</tr>
				<tr>
				<th>물품 사진<span class="star">*</span>
						 <p style="font-weight: normal; font-size: 7pt;">최소 두장 이상 등록해 주세요.</p>
		                </th>
		                <td colspan="3">
		                	<div style="width: 86%; height: 100%; border: 1px solid;">
		                		<p style="text-align: center; font-size: 9px;">
		                		<br>
		                		이미지 업로드(0/5)
		                		<br><br>
		                		최소 2개, 최대 5개까지 업로드 가능<br>
		                		파일 형식 : jpg / png 사이즈 : 가로 ??px, 세로 ??px 이상<br>
		                		※ 이미지를 등록하면 반영됩니다.
		                		</p>
		                	</div>
		                	<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="margin-right: 14%;">
		                	<button type="button" class="btn btn-primary btn-sm">이미지 업로드</button>
		                	<button type="button" class="btn btn-secondary btn-sm">이미지 삭제</button>
		                	</div>
						</td>
			</tr>
				<tr>
				<th>A/S 가능 여부</th>
			                <td colspan="3">
			                <div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="asRadio" id="inlineRadio1" value="유상" checked="checked">
							  <label class="form-check-label" for="inlineRadio1">유상</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="asRadio" id="inlineRadio2" value="무상">
							  <label class="form-check-label" for="inlineRadio2">무상</label>
							</div>
							<div class="form-check form-check-inline">
							  <input class="form-check-input" type="radio" name="asRadio" id="inlineRadio3" value="불가능">
							  <label class="form-check-label" for="inlineRadio3">불가능</label>
							</div>
				
				<input class="form-control" id="asDate" type="text" placeholder="유효날짜 (연/월/일)" style="width: 86%;"/>
			</tr>
			
			<tr>
				<th>
					<div style="background-color: #C9E0F5; height: 70px; padding: 10px;">
						<p style="font-size: 9pt;"> ※ 게시글 유지 기간</p>
						<p style="font-size: 7pt; font-weight: normal;">게시글 등록 시간부터 00일까지 유지됩니다.</p>
					</div>
				</th>
				
				<td colspan="3" rowspan="2">
				<textarea placeholder="코멘트 특이사항" style="width:86%; height: 150px;"></textarea>
				</td>
			</tr>
			
			
			<tr>
				<th style="margin-right: 10%;">
					<div style="background-color: #C9E0F5; height: 100px; padding: 10px;">
						<p style="font-size: 9pt;"> ※ 코멘트 작성 시 주의사항</p>
						<p style="font-size: 7pt; font-weight: normal;">불필요한 개인 정보 노출 및 판매와 관련없는 문구를
						<br>등록 시 약관에 위배되어 제재될 수 있습니다.</p>
					</div>
				</th>
			</tr>
			
			<tr>
				<td colspan="4">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="width: 90%;">
	                <button type="button" class="btn btn-primary">등록하기</button>
	                <button type="button" class="btn btn-secondary">취소</button>
	                </div>
                </td>
			</tr>
			</table>
		</form>
	</div>


</div>
</body>
</html>