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
.alert-purple { border-color: #694D9F;background: #694D9F;color: #fff; }
.alert-info-alt { border-color: #B4E1E4;background: #81c7e1;color: #fff; }
.alert-danger-alt { border-color: #B63E5A;background: #E26868;color: #fff; }
.alert-warning-alt { border-color: #F3F3EB;background: #E9CEAC;color: #fff; }
.alert-success-alt { border-color: #19B99A;background: #20A286;color: #fff; }
.glyphicon { margin-right:10px; }
</style>

</head>
<body>

<c:import url="ad_Header.jsp"></c:import>

<script type="text/javascript">
function button1_click() 
{
    if (confirm("정말로 삭제하시겠어요?")) {
    	//aria-hidden="true"
    } else {
        // 취소 버튼 클릭 시 동작
    }
}



</script>

<div class="container">
    <div class="row">
        <div class="col-md-3">
            <h2><b>카테고리</b></h2>
            					
            <!-- 마진용 div -->					
            <div style="margin-top: 50px"></div>
            					
            <div class="alert alert-info-alt alert-dismissable">
                <span class="glyphicon glyphicon-certificate"></span>
                <!-- 나중에 데이터베이스 상으로 구현? -->
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="button1_click();">×</button>
                <strong>CPU</strong>
            </div>
            <div class="alert alert-warning-alt alert-dismissable">
                <span class="glyphicon glyphicon-certificate"></span>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="">×</button>
                <strong>RAM</strong>
            </div>     
            <div class="alert alert-success-alt alert-dismissable">
                <span class="glyphicon glyphicon-certificate"></span>
                <button type="button" class="close" data-dismiss="alert" aria-hidden="true" onclick="">×</button>
                <strong>그래픽카드</strong>
            </div>                     
        </div>
    </div>
</div>

<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />

<div style="margin-left: 1000px">		
	<button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">추가하기</button>		
</div>


<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
        <h3 class="modal-title" id="exampleModalLabel"><b>카테고리 추가</b></h3>
      </div>
      <div class="modal-body">
        <form>
          <div class="ms-auto">
            <input type="text" class="form-control" id="recipient-name" placeholder="카테고리를 입력해주세요">
          </div>
        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-outline-secondary" data-dismiss="modal">취소</button>
        <button type="submit" class="btn btn-primary" onclick="">입력</button>
      </div>
    </div>
  </div>
</div>




</body>
</html>