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
<title>Insert title here</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">



	
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86ec7935feee50bc358cd41148ffd4e2&libraries=services"></script>
<script>

   function searchAddr()
   {
      new daum.Postcode({
         
           oncomplete: function(data) {
               // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
               // 예제를 참고하여 다양한 활용법을 확인해 보세요.
               //alert(data); //[Object]
               
               var fullRoadAddr = data.roadAddress;   // 도로명 주소 변수
               var extraRoadAddr = '';
               
             // 법정동명이 있을 경우 추가한다. (법정리는 제외)
             // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
               if(data.bname !== '' && /[동|로|가]$/g.test(data.bname))
               {
                     extraRoadAddr += data.bname;
               }
                 // 건물명이 있고, 공동주택일 경우 추가한다.
               if(data.buildingName !== '' && data.apartment == 'Y')
               {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
               }
               // 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
               if(extraRoadAddr !== '')
               {
                   extraRoadAddr = ' (' + extraRoadAddr + ')';
               }
               // 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
               if(fullRoadAddr !== '')
               {
                   fullRoadAddr += extraRoadAddr;
               }
               
               document.getElementById('address').value = fullRoadAddr;
               
	           	if($("#address").val() != "") // 여기서부턴 검색으로 좌표값을 알아내기 위한 코드
	    		{
	           		var add = $("#address").val();
	    			//alert(add)
	    			
	    			var geocoder = new kakao.maps.services.Geocoder();
	    			
	           	    geocoder.addressSearch(add, function(result, status)
					{
	           			if (status === kakao.maps.services.Status.OK)
	           			{
	           				//alert(result[0].y + "/" + result[0].x);  // 위도 / 경도
	           				
							$("#pd_hope_place", opener.document).val($("#address").val());
		     				$("#address", opener.document).val(result[0].y+"/"+result[0].x);
		     				
     						
	           			}	
	           			window.close();
					})
					
	    			
	    		}
               
           }
       }).open({
          /* popupKey : 'popup1'   // 팝업창 key 설정 */
       });   
   }
	
</script>

</head>
<body>
<div class="mb-3" style="margin-left: 3%; margin-top: 2%">
	<form action="georesult.action" method="get">
		<label for="address">주소검색</label><br />
		<input type="text" class="form-control" name="addr" id="address" placeholder="클릭해주세요" required="required" readonly="readonly" style="width: 400px;" onclick="searchAddr()">
		<br />
		<button type="button" class="btn btn-secondary" id="geoBtn" style="margin-left: 60%;">주소선택완료</button>
	</form>
</div>


	
	
</body>
</html>