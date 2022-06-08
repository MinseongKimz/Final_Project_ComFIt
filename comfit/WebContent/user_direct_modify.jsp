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
<meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
<title>직거래 판매자 등록</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=cp %>/css/inputstyle.css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		// 테스트
		//alert("창열림");
		
		$("[name=asRadio]").change(function()
		{
			$("#asDate").attr("disabled", false);
			//alert($(this).val());
			
			if ($(this).val() == "불가능")
			{
				 $("#asDate").attr("disabled", true);
			}
			
		});
		
	});
</script>

</head>
<body>

<div class="header">
	<c:import url="comfit_header_user.jsp"></c:import>
</div>

<div class="container" style="padding-top: 80px;">
	<h3>
		판매글 등록-직거래	
	</h3>
	
	<div class="input_box" style="padding-left: 5%; padding-top: 10%;">
		<table style="width: 100%;">
			<tr>
				<th>제목<span class="star">*</span></th>
				<td colspan="3"><input class="form-control" id="exampleFormControlInput1" type="text" placeholder="제목을 입력해주세요." style="width: 86%;"/>
				<p align="right" style="font-size: 3px; margin-right: 16%;">32/32</p>
				</td>
			</tr>
			
			<tr>
				<th>물품 카테고리<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">상품과 일치하는 카테고리를 선택해주세요.
                 <br>적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
                </th>
				<td width="20%;">카테고리
					<br>
					<select class="form-select" name="category" style="width: 90%; height: 35px;">
					<option value="" selected="selected">카테고리</option>
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
				<td>물품명
					<br>
					<input type="text" class="form-control" id="productName" placeholder="물품명을 입력해 주세요." style="width: 90%;">
				</td>	
				<td>제조사
					<br>
					<input type="text" class="form-control" id="productMaker" placeholder="제조사를 입력해 주세요." style="width: 90%;"/>
				</td>
			</tr>
			
			<tr>
				<!-- 공간맞추기용 th -->
				<th>
				</th>
				
				<td colspan="2">
					물품검색
					<div class="input-group mb-5">
					  <span class="input-group-text" id="basic-addon1"><i class="bi bi-search"></i></span>
					  <input type="text" class="form-control" placeholder="물품검색" style="height:40px; width:100px;">
					</div>
				</td>
			</tr>
			
			<tr>
				<th>희망 시작 가격<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">희망하는 가격을 적어주세요.</p>
                </th>
                <td colspan="3"><input class="form-control" id="price1" type="text" placeholder="희망 가격을 입력해주세요." style="width: 86%;"/>
                <p style="color:blue; font-size: 10px;">추천 가격보다 2배 이상은 입력할 수 없습니다.</p>
                </td>
			</tr>
			
			<tr>
					<th>거래 가능 일시<span class="star">*</span>
					<p style="font-size: 10px;">시작일로부터 최대 5일까지 거래가 가능합니다.</p>
					<td>
						<input type="date" class="date">
					</td>
					
				</tr>
				<tr>
					<th>거래 가능 장소<span class="star">*</span>
					<td>
						<input type="text" class="hope_place"placeholder="거래가능장소 입력" />
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
				<th>A/S 가능 여부
                </th>
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
	</div>
	
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
	<br />
</div>



</body>
</html>