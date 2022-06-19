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
<title>배송 판매글 등록</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=cp %>/css/inputstyle.css">
<link rel="stylesheet" href="css/main.css" type="text/css">

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">



<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="jQuery.MultiFile.min.js"></script>

<script type="text/javascript">
$(document).ready(function()
		{
			$("input[name=pd_as_id]").change(function()
			{
				//alert($(this).val());
				
				if ($(this).val() == "3")
				{
					 $("#pd_asDate").val('none');
					 $("#pd_asDate").attr("readonly", true);
				}
				else
				{
					$("#pd_asDate").attr("readonly", false);
					$("#pd_asDate").val("");	
				}
				
			});
			
		});
	
	
	$(document).ready(function()
	{
		$("#category-select").change(function()
		{
			//alert($(this).val());
			var param = "optionValue=" + $(this).val();
			 
			// select option value 에  카테고리id가 들어가도록 변경
			
			
			$.ajax(
			{
				url: "changeMakerSelect.action"
				, type: "GET"
				, data: param
				, success: function(result)
				{
					
					$("#maker_id").html(result)
					
				/* $("#maker_name").html("<c:forEach var='maker' items='${makerlist }'>"
							+ "<option value='${maker.maker_name }'>" + ${maker.maker_name }+ "</option>"
							+"</c:forEach>") */
					
				}
				, error: function(e)
				{
					alert(e.responseText);
				}
			})
			
		})
			
	})
	
/* 	var pd_as_id = $('input[name=pd_as_id]:checked').val();
	var comments = $("textarea[name=comments]").val();
	var cf_price = $("input[name=cf_price]").val();
	var pd_as_remain = $("input[name=pd_as_remain]").val();
	 */
	 $(document).ready(function()
	{
		$("#delivery_Insert").click(function()
		{
			//alert($("input[name=cf_price]").val());
			
			$("#deliform").submit();
		})
	})
	
	
</script>
<style type="text/css">
.insert {
    padding: 20px 30px;
    display: block;
    width: 75%;
    height: 15%;
    border: 1px solid #dbdbdb;
    -webkit-box-sizing: border-box;
    -moz-box-sizing: border-box;
    box-sizing: border-box;
}
.insert .file-list {
    height: 15%;
    overflow: auto;
    border: 1px solid #989898;
    padding: 10px;
}
.insert .file-list .filebox p {
    font-size: 14px;
    margin-top: 10px;
    display: inline-block;
}
.insert .file-list .filebox .delete i
{
    size:50%;
    margin-left: 5px;
}
</style>

</head>
<body>

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

<div class="container" style="padding-top: 80px;">
	<p class="fs-3" style="font-weight: bold;">
		판매글 등록-배송	
	</p>
	
	<div class="input_box" style="padding-left: 5%; padding-top: 10%;">
	<!-- <form action="deliveryinsert.action" method="POST" enctype="multipart/form-data"> -->
	<form id="deliform" action="delivery_seller_ok.jsp" method="POST" enctype="multipart/form-data">
		<input type="hidden" name=comments/>	
		<input type="hidden" name=cf_price/>	
		<input type="hidden" name=pd_as_remain/>	
		<table style="width: 100%;">
			<tr>
				<th>물품검색<span class="star">*</span></th>
				<td colspan="2">
					<div><!--  class="input-group mb-6" -->
					  <input type="text" class="<!-- form-control  -->" placeholder="판매할 물품을 검색해주세요" style="height:40px; width: 260px; display: inline-block; font-style: italic;" readonly="readonly">
					  <span class="input-group-text" id="basic-addon1" onclick="location.href='searchproduct.action';" style="width: 50px; display: inline-block;"><i class="bi bi-search"></i></span>
					</div>
				</td>
			</tr>
			<tr>
				<th>제목<span class="star">*</span></th>
				<td colspan="3"><input class="form-control" id="pd_title" name="pd_title" type="text" placeholder="제목을 입력해주세요." style="width: 86%; font-style: italic;"/>
				<p align="right" style="font-size: 3px; margin-right: 16%;"></p>
				</td>
			</tr>
			<tr>
				<th>물품 카테고리<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">상품과 일치하는 카테고리를 선택해주세요.
                 <br>적합하지 않을 경우 운영자에 의해 조정될 수 있습니다.</p>
                </th>
				<td width="20%;"><!-- 카테고리
					<br> -->
					<select class="form-select" id="category-select" name="category_select" style="width: 90%; height: 35px;">
					<option>카테고리 선택</option>
					
						<c:forEach var="category" items="${categorylist }">
	
							<option class="option_select" value="${category.pd_category_id }" ${category.category_name eq cate ? 'selected' : ''}>${category.category_name }</option>
	
						</c:forEach>
					
					</select>
				</td>
				<td width="20%;" id="maker_c">
					<%-- <input type="text" class="form-control" id="maker" name="maker" placeholder="제조사를 입력해 주세요." style="width: 90%;" value="${maker }"/> --%>
					<select class="form-select" id="maker_id" name="pd_maker_id" style="width: 90%; height: 35px;">
					<option id="pd_maker">제조사 카테고리 선택</option>
						<c:forEach var="maker" items="${makerlist }">
							<option value="${maker.pd_maker_id }" ${maker.maker_name eq mk ? 'selected' : ''}>${maker.maker_name }</option>
						</c:forEach>

					</select>
				</td>	
					
				<td>
					<input type="text" class="form-control" id="pd_name" name="pd_name" placeholder="물품명을 입력해 주세요." style="width: 90%;" value="${name }">
				</td>	
			</tr>
			<tr>
				<th>희망 시작 가격<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">희망하는 가격을 적어주세요.</p>
                </th>
                <td colspan="3"><input class="form-control" id="pd_start_price" name="pd_start_price" type="text" placeholder="희망 가격을 입력해주세요." style="width: 50%; display: inline-block; font-style: italic;"/>
                <div style="display: inline-block; font-style: italic; color:red; font-size: small; margin-left: 15px;"> ※comfit 추천 가격 : ${realAvgPrice }원</div>
                <p style="color:blue; font-size: 10px;">추천 가격보다 2배 이상은 입력할 수 없습니다.</p>
                </td>
			</tr>
			
			<tr>
				<th>즉시 구매 가격<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">즉시 거래 가격을 적어주세요.</p>
                </th>
                <td colspan="3"><input class="form-control" id="pd_imd_price" name="imd_price" type="text" placeholder="즉시구매 가격을 입력해주세요." style="width: 50%; font-style: italic;"/>
                <p style="color:blue; font-size: 10px;">추천 가격보다 2배 이상은 입력할 수 없습니다.</p>
                </td>
			</tr>
			
			<tr>
            <th>물품 사진<span class="star">*</span>
             <p style="font-weight: normal; font-size: 7pt;">최소 3장 이상 등록해 주세요.</p>
                </th>
                <td colspan="3">
                      <div class="insert">
                      <p style="font-weight: normal;">[ 최소 3장 ~ 최대 5장 ]</p>
                       <input type="file" name="uploadFile"  />
                       <div class="file-list"  >
                       </div>
                  </div>
            	</td>
         	</tr>
			
			<tr>
				<th>A/S 가능 여부
                </th>
                <td colspan="3">
                <div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="pd_as_id" id="inlineRadio1" value="1" checked="checked">
				  <label class="form-check-label" for="inlineRadio1">유상</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="pd_as_id" id="inlineRadio2" value="2">
				  <label class="form-check-label" for="inlineRadio2">무상</label>
				</div>
				<div class="form-check form-check-inline">
				  <input class="form-check-input" type="radio" name="pd_as_id" id="inlineRadio3" value="3">
				  <label class="form-check-label" for="inlineRadio3">불가능</label>
				</div>
				

				<input class="form-control" id="pd_asDate" name="pd_as_remain" type="text" placeholder="AS 만료 기간 입력. 예) 2024-09" style="width: 86%; font-style: italic;">

				

			</tr>
			
			<tr>
				<th>
					<div style="background-color: #C9E0F5; height: 70px; padding: 10px; width: 85%;">
						<p style="font-size: 9pt;"> ※ 게시글 유지 기간</p>
						<p style="font-size: 7pt; font-weight: normal;">게시글 등록 시간부터 00일까지 유지됩니다.</p>
					</div>
				</th>
				
				<td colspan="3" rowspan="2">
				<textarea placeholder=" 판매자 코멘트 작성" name="comments" style="width:86%; height: 150px;"></textarea>
				</td>
			</tr>
			
			<tr>
				<th style="margin-right: 10%;">
					<div style="background-color: #C9E0F5; height: 100px; padding: 10px; width: 85%;">
						<p style="font-size: 9pt;"> ※ 코멘트 작성 시 주의사항</p>
						<p style="font-size: 7pt; font-weight: normal;">불필요한 개인 정보 노출 및 판매와 관련없는 문구
						<br>등록 시 약관에 위배되어 제재될 수 있습니다.</p>
					</div>
				</th>
			</tr>
			
			<tr>
				<td colspan="4">
					<div class="d-grid gap-2 d-md-flex justify-content-md-end" style="width: 90%;">
					<input type="text" name="cf_price" value="${realAvgPrice }" style="display: none;" />
	                <button type="button" class="btn btn-primary" id="delivery_Insert">등록하기</button>
	                <button type="button" class="btn btn-secondary">취소</button>
	                </div>
                </td>
			</tr>
			
		</table>
		</form>
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