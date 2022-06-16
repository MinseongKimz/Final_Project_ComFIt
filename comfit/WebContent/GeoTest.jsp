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

<script type="text/javascript">

	$(function()
	{
		navigator.geolocation.getCurrentPosition(function(pos) //  좌표값 가져오는 함수 (회원 로그인시 메인에 보여줄)
	    {													   //  상품들을 이 좌표를 통해 판단함. 
		    console.log(pos);
		    var lat = pos.coords.latitude;	// 위도
		    var lon = pos.coords.longitude; // 경도
		    alert("현재 위치는 : " + lat + ", "+ lon);
		    $("#location").html('<h1>위도 : ' + lat + '경도 : ' + lon + '</h1>'); 
		});
		
	
			
		
	})

	
</script>	
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
	           				alert(result[0].y + "/" + result[0].x);  // 위도 / 경도
	           			}	
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
<div class="mb-3">
      <label for="address">주소</label><br />
      <input type="text" class="form-control" id="address" placeholder="클릭해주세요" required="required" readonly="readonly" onclick="searchAddr()">
      <div class="invalid-feedback">
           주소를 입력해주세요.
      </div>
</div>

<div class="mb-3">
     <label for="address2">상세주소</label>
     <input type="text" class="form-control" id="address2" placeholder="상세주소를 입력해주세요."  required="required" >
</div>
	
	
	
</body>
</html>