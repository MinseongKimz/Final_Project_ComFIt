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
<title>구매제안</title>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-0evHe/X+R7YkIZDRvuzKMRqM+OrBnVFBL6DOitfPri4tjfHxaWutUpFmBp4vmVor" crossorigin="anonymous">

<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block; font-size: 10px;}
    .hAddr {position:absolute;left:10px;top:10px; font-size: 10px; border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; font-size: 3px;}
</style>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js" integrity="sha512-894YE6QWD5I59HgZOGReFYm4dnWc1Qt5NtvYSaNcOP+u1T9qYdvdihz0PPSiiqn/+/3e7Jo4EaG7TubfWGUrMQ==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js" integrity="sha512-uto9mlQzrs59VwILcLiRYeLKPPbS/bT71da/OEBYEwcdNUk8jYIy+D176RYoop1Da+f9mvkYrmj5MCLZWEtQuA==" crossorigin="anonymous" referrerpolicy="no-referrer"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" integrity="sha512-aOG0c6nPNzGk+5zjwyJaoRUgCdOrfSDhmMID2u4+OIslr0GjpLKo7Xm0Ao3xmpM4T8AmIouRkqwj1nrdVsLKEQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<script type="text/javascript">
   $(function()
	{
	   var hope_sdate = $("#hope_sdate").val();
	   var hope_edate =	$("#hope_edate").val();
			   
	   /* var hope_stime = $("#hope_stime").val();
	   var hope_etime = $("#hope_etime").val();
	   alert(stime);
	   alert(etime); */
	   
	   $("#datePicker").datepicker({
		   
		   dateFormat: "yy-mm-dd" //데이터 포맷 형식(yyyy : 년 mm : 월 dd : 일 )
	     , minDate: hope_sdate
	     , maxDate: hope_edate
	     , dayNamesMin: ['일', '월', '화', '수', '목', '금', '토']
	     , monthNames: ['1월','2월','3월','4월','5월','6월','7월','8월','9월','10월','11월','12월']
	     , autoclose: true
	     
	    
	   
	   }).onClose (function()
		{
			alert(selectedDate);
		});
	});
      
/*    
      .on('changeDate', function (e) {
         //show : datePicker가 보이는 순간 호출
         //hide : datePicker가 숨겨지는 순간 호출
         //clearDate: clear 버튼 누르면 호출
         //changeDate : 사용자가 클릭해서 날짜가 변경되면 호출 (개인적으로 가장 많이 사용함)
         //changeMonth : 월이 변경되면 호출
         //changeYear : 년이 변경되는 호출
         //changeCentury : 한 세기가 변경되면 호출 ex) 20세기에서 21세기가 되는 순간
 
         console.log(e);
         // e.date를 찍어보면 Thu Jun 27 2019 00:00:00 GMT+0900 (한국 표준시) 위와 같은 형태로 보인다.
      }); */
</script>
</head>
<body>
<div>
	<c:forEach var="mgrs" items="${mgrs }">
	<input type="hidden" id="lat" value="${mgrs.lat }" />
	<input type="hidden" id="lon" value="${mgrs.lon }" />
	</c:forEach>
	<input type="hidden" id="hope_sdate" value="${hope_sdate }" />
	<input type="hidden" id="hope_edate" value="${hope_edate }" />
	<%-- <input type="hidden" id="hope_stime" value="${hope_stime }" />
	<input type="hidden" id="hope_etime" value="${hope_etime }" /> --%>
</div>

<div class="map_wrap" style="margin-left: 1.5%; margin-top: 1.5%">
    <div id="map" style="width:500px;height:500px;position:relative;overflow:hidden;"></div>
    <div class="hAddr" >
        <span class="title">지도중심기준 행정동 주소정보</span>
        <span id="centerAddr"></span>
    
    
    <br />
</div>
    
<div>
   <form action="suggest_insert.action" method="get">
	   <table class="table table-borderless" style="width: 500px;">
  			<tr>
  				<th>
  					<label for="addr1">희망장소</label>		
  				</th>
  				<td colspan="2">
  					<input type="text"  class="form-control" id="addr" placeholder="지도에서 클릭해주세요" readonly="readonly"
  					 style="width: 300px; height: 35px; text-align: center;" />		
  				</td>
  			</tr>
  			<tr>
  				<th>
  				     <label for="addr2">장소상세</label>
  				</th>
  				<td colspan="2">
  				     <input type="text" class="form-control" id="addr2" style="width: 300px; height: 35px;" required="required"/>
  				</td>
  			</tr>
  			<tr>
  				<th>
  					<label for="hope_date">거래희망날짜</label>
  				</th>
  				<td colspan="2">
  					<input  id="datePicker" class="form-control" placeholder="날짜를선택해주세요" style="width: 300px; height: 35px; text-align: center;"/>
  				</td>
  			</tr>
  			<tr>
  				<th>
				      <label for="hope_time">거래희망시간</label>
  				</th>
  				<td>
  				     <select class="form-select  form-select-sm" aria-label="Default select example" style="width: 150px; height: 35px; text-align: center;">
  						<c:forEach var="time" begin="${stime }" end="${etime }" step="1">
  							<option value="${time }" style="font-size: 12pt;">${time}시</option>
  						</c:forEach>
  					</select>	
					
  				</td>
  				<td>
  				      <select class="form-select  form-select-sm" aria-label="Default select example" style="width: 150px; height: 35px; text-align: center;">
  				      <c:forEach var="minute" begin="0" end="59" step="10">
  						<option value="${minute }" style="font-size: 12pt;">${minute }분</option>
					</c:forEach>  						
					</select>
  				</td>
  			</tr>
  			<tr>
  				<th>
  					 <label for="hope_price">제안금액</label>
  				</th>
  				<td colspan="2">
 				      <input type="text" class="form-control" id="hope_price" required="required" style="width: 300px; height: 35px;" />
  				</td>
  			</tr>
		</table>
       <button type="submit" class="btn btn-primary" style="width: 150px; height: 35px; margin-left: 20%;" >제안하기</button>
       <button type="reset" class="btn btn-secondary" style="width: 150px; height: 35px;">취소</button>
   </form>
</div>
    
</div>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86ec7935feee50bc358cd41148ffd4e2&libraries=services"></script>
<script>
	// 해당상품의 위도
   var lat = document.getElementById("lat").value;
   //alert(lat);
   
   // 해당상품의 경도
   var lon = document.getElementById("lon").value;
   //alert(lon);
   
   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
       mapOption = {
           center: new kakao.maps.LatLng(lat,+lon), // 지도의 중심좌표 (게시물마다 중심 좌표가 될 값)
           level: 6 // 지도의 확대 레벨
       };  
   
   // 지도를 생성합니다    
   var map = new kakao.maps.Map(mapContainer, mapOption);
   
   
   // 주소-좌표 변환 객체를 생성합니다
   var geocoder = new kakao.maps.services.Geocoder();
   
   var marker = new kakao.maps.Marker(), // 클릭한 위치를 표시할 마커입니다
       infowindow = new kakao.maps.InfoWindow({zindex:1}); // 클릭한 위치에 대한 주소를 표시할 인포윈도우입니다
   
   // 현재 지도 중심좌표로 주소를 검색해서 지도 좌측 상단에 표시합니다
   searchAddrFromCoords(map.getCenter(), displayCenterInfo);
   
   // 지도를 클릭했을 때 클릭 위치 좌표에 대한 주소정보를 표시하도록 이벤트를 등록합니다
   kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
       searchDetailAddrFromCoords(mouseEvent.latLng, function(result, status) {
           if (status === kakao.maps.services.Status.OK) {
               var detailAddr = !!result[0].road_address ? '<div>도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
               detailAddr += '<div>지번 주소 : ' + result[0].address.address_name + '</div>';
               
               var content = '<div class="bAddr">' +
                               '<span class="title">법정동 주소정보</span>' + 
                               detailAddr + 
                           '</div>';
   
               // 마커를 클릭한 위치에 표시합니다 
               marker.setPosition(mouseEvent.latLng);
               marker.setMap(map);
   
               // 인포윈도우에 클릭한 위치에 대한 법정동 상세 주소정보를 표시합니다
               infowindow.setContent(content);
               infowindow.open(map, marker);
               
               document.getElementById("addr").value = result[0].address.address_name;
               
           }   
       });
   });
   
   // 중심 좌표나 확대 수준이 변경됐을 때 지도 중심 좌표에 대한 주소 정보를 표시하도록 이벤트를 등록합니다
   kakao.maps.event.addListener(map, 'idle', function() {
       searchAddrFromCoords(map.getCenter(), displayCenterInfo);
   });
   
   function searchAddrFromCoords(coords, callback) {
       // 좌표로 행정동 주소 정보를 요청합니다
       geocoder.coord2RegionCode(coords.getLng(), coords.getLat(), callback);         
   }
   
   function searchDetailAddrFromCoords(coords, callback) {
       // 좌표로 법정동 상세 주소 정보를 요청합니다
       geocoder.coord2Address(coords.getLng(), coords.getLat(), callback);
   }
   
   // 지도 좌측상단에 지도 중심좌표에 대한 주소정보를 표출하는 함수입니다
   function displayCenterInfo(result, status) {
       if (status === kakao.maps.services.Status.OK) {
           var infoDiv = document.getElementById('centerAddr');
   
           for(var i = 0; i < result.length; i++) {
               // 행정동의 region_type 값은 'H' 이므로
               if (result[i].region_type === 'H') {
                   infoDiv.innerHTML = result[i].address_name;
                   break;
               }
           }
       }    
   }
   
   function setDraggable(draggable) {
       // 마우스 드래그로 지도 이동 가능여부를 설정합니다
       map.setDraggable(draggable);    
   } 
   
   map.setMaxLevel(6);
   setDraggable(false);
      
   var zoomControl = new kakao.maps.ZoomControl();
   map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

   // 지도가 확대 또는 축소되면 마지막 파라미터로 넘어온 함수를 호출하도록 이벤트를 등록합니다
   kakao.maps.event.addListener(map, 'zoom_changed', function() {        
       
      if (map.getLevel()=='6')                                // 지도의 맥스 레벨이 6레벨이 되면 
         map.setCenter(new kakao.maps.LatLng(lat,+lon)); // 지도의 중심좌표 (게시물마다 중심 좌표가 될 값) 로 다시 이동
      
      if (map.getLevel()<='3') // 지도 레벨이 4이하 (구체적 건물표현정도)
         setDraggable(true);   // 로 떨어지면 드래그로 지도 위치를 바꿀수 있음
      else 
         setDraggable(false);
   });
   
</script>

</body>
</html>