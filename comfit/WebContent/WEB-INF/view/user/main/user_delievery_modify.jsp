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
<title>배송 판매글 수정(입찰 없을 시)</title>
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">
<link rel="stylesheet" href="<%=cp %>/css/inputstyle.css">
<link rel="stylesheet" href="css/main.css" type="text/css">

<link rel="stylesheet" type="text/css" href="<%=cp %>/css/jquery-ui.css">




<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<script src="http://code.jquery.com/jquery-1.11.0.min.js"></script>
<script src="jQuery.MultiFile.min.js"></script>

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
<script type="text/javascript">
					var fileNo = 0;
					var filesArr = new Array();
					/* 첨부파일 추가 */
					function addFile(obj){
					   var minFileCnt = 6;
					    var maxFileCnt = 10;   // 첨부파일 최대 개수
					    var attFileCnt = document.querySelectorAll('.filebox').length;    // 기존 추가된 첨부파일 개수
					    var remainFileCnt = maxFileCnt - attFileCnt;    // 추가로 첨부가능한 개수
					    var curFileCnt = obj.files.length;  // 현재 선택된 첨부파일 개수
					   
					    
					    // 첨부파일 개수 확인
					    if (curFileCnt > remainFileCnt) {
					        alert("첨부파일은 최대 " + maxFileCnt + "개 까지 첨부 가능합니다.");
					    }
					    for (var i = 0; i < Math.min(curFileCnt, remainFileCnt); i++) {
					      
					       
					        const file = obj.files[i];
					      
					        
					        
					        
					        // 첨부파일 검증
					        if (validation(file)) {
					            // 파일 배열에 담기
					            var reader = new FileReader();
					            reader.onload = function () {
					                filesArr.push(file);
					            };
					            reader.readAsDataURL(file)
					            // 목록 추가
					            let htmlData = '';
					            htmlData += '<div id="file' + fileNo + '" class="filebox">';
					            htmlData += '   <p class="name">' + file.name + '</p>';
					            htmlData += '   <a class="delete" onclick="deleteFile(' + fileNo + ');"><button class="btn btn-danger">취소</button></a>';
					            htmlData += '</div>';
					            $('.file-list').append(htmlData);
					            fileNo++;
					        } else {
					            continue;
					        }
					    }
					    // 초기화
					    document.querySelector("input[type=file]").value = "";
					}
					   /* 첨부파일 검증 */
					   function validation(obj){
					    const fileTypes = ['application/pdf', 'image/gif', 'image/jpeg', 'image/png', 'image/bmp', 'image/tif'];
					    if (obj.name.length > 100) {
					        alert("파일명이 100자 이상인 파일은 제외되었습니다.");
					        return false;
					    } else if (obj.size > (100 * 1024 * 1024)) {
					        alert("최대 파일 용량인 100MB를 초과한 파일은 제외되었습니다.");
					        return false;
					    } else if (obj.name.lastIndexOf('.') == -1) {
					        alert("확장자가 없는 파일은 제외되었습니다.");
					        return false;
					    }else if (!fileTypes.includes(obj.type)) {
					        alert("첨부가 불가능한 파일은 제외되었습니다.");
					        return false;
					    }
					    else {
					        return true;
					    }
					}
					
					
					
					
					/* 첨부파일 삭제 */
					function deleteFile(num) {
					    document.querySelector("#file" + num).remove();
					    filesArr[num].is_delete = true;
					}
					/* 폼 전송 */
					function submitForm() {
					    // 폼데이터 담기
					    var form = document.querySelector("form");
					    var formData = new FormData(form);
					    for (var i = 0; i < filesArr.length; i++) {
					        // 삭제되지 않은 파일만 폼데이터에 담기
					        if (!filesArr[i].is_delete) {
					            formData.append("attach_file", filesArr[i]);
					        }
					    }
					    $.ajax({
					        method: 'POST',
					        url: '/register',
					        dataType: 'json',
					        data: formData,
					        async: true,
					        timeout: 30000,
					        cache: false,
					        headers: {'cache-control': 'no-cache', 'pragma': 'no-cache'},
					        success: function () {
					            alert("파일업로드 성공");
					        },
					        error: function (xhr, desc, err) {
					            alert('에러가 발생 하였습니다.');
					            return;
					        }
					    })
					}
</script>
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
		   
</script>



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
<script type="text/javascript" src="<%=cp%>/js/jquery-ui.js"></script>
<div class="container" style="padding-top: 80px;">
	<p class="fs-3" style="font-weight: bold;">
		판매글 수정-배송(입찰 없을 시)	
	</p>
	
	<!-- 입력 페이지를 복사해서 만든 수정 페이지 -->
	<!-- 기존에 입력해둔 값을 넣어주는 속성만 추가하면 됨 -->
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
					<option selected="selected">카테고리</option>
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
					  <span class="input-group-text" id="basic-addon1" onclick="location.href='searchproduct.action';"><i class="bi bi-search"></i></span>
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
				<th>즉시 구매 가격<span class="star">*</span>
				 <p style="font-weight: normal; font-size: 7pt;">즉시 거래 가격을 적어주세요.</p>
                </th>
                <td colspan="3"><input class="form-control" id="price2" type="text" placeholder="즉시구매 가격을 입력해주세요." style="width: 86%;"/>
                <p style="color:blue; font-size: 10px;">추천 가격보다 2배 이상은 입력할 수 없습니다.</p>
                </td>
			</tr>
			
			<tr>
            <th>물품 사진<span class="star">*</span>
             <p style="font-weight: normal; font-size: 7pt;">최소 여섯장 이상 등록해 주세요.</p>
                </th>
                <td colspan="3">
                      <div class="insert">
                   <form method="POST" onsubmit="return false;" enctype="multipart/form-data">
                      <p style="font-weight: normal;">[ 최소 6장 ~ 최대 10장 ]</p>
                       <input type="file" onchange="addFile(this);" multiple />
                       <div class="file-list"  >
                       </div>
                   </form>
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
					<div style="background-color: #C9E0F5; height: 70px; padding: 10px; width: 85%;">
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