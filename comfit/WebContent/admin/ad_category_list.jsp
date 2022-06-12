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
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 디자인 담당 -->
<title>카테고리 관리</title>
<style type="text/css">

</style>



</head>
<body>

<c:import url="ad_Header.jsp"></c:import>


<div class="container" style="margin-bottom: 20px; ">
	<h1><b>카테고리 관리</b></h1>
</div> 


<div class="container" style="border: ; background-color: white; box-shadow: 0 1px 3px 0 rgba(0,0,0,0.50); border-radius: 3px; padding-top: 20px; padding-bottom: 300px;">
<!-- 	
	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 20%">
	  <strong>카테고리 추가</strong> 
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 20%">
	  <strong>카테고리 추가</strong> 
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 20%">
	  <strong>카테고리 추가</strong>
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
	
	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 20%">
	  <strong>카테고리 추가</strong> 
	  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
 -->
 
 	<c:forEach var="category" items="${categorylist }">
 	<div class="alert alert-warning alert-dismissible fade show" role="alert" style="width: 20%; display: inline-block;">
		<strong>${category.category_name }</strong> 
	<button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
	</div>
 	</c:forEach>
 
 
<!-- Button trigger modal -->
  <div class="row" style="border: ; padding-bottom: 20px">
    <div class="col-auto me-auto"></div>
    <div class="col-auto">
		<button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#addCategoryModal">
		  카테고리 생성
		</button>        
    </div>
  </div>



<!-- Modal -->
<div class="modal fade" id="addCategoryModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">카테고리 추가</h5>
        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
      </div>
      <div class="modal-body">
        <form>
          <div class="ms-auto" style="margin-bottom: 10px">
          	<b>카테고리 이름</b>
            <input type="text" class="form-control" id="recipient-name">
          </div>            
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
        <button type="button" class="btn btn-primary" onclick="insertBtn()">입력</button>
      </div>
    </div>
  </div>
</div>


</div>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	/* 
	$(function()
	{
		$("#addCategoryModal").on('show.bs.modal', function (event)
		{
			//var button = $(event.relatedTarget);
			//var deleteUrl = button.data('title');
			//var modal = $(this);
			alert("확인");
		})
		
	})
	*/
	
	$(function()
	{
		$(".btn-close").click(function()
		{
			alert("확인");
		})
	})
	
	$(function()
	{
		alert("첫화면");
	})

</script>





</body>
</html>