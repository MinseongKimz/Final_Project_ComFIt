<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주소검색</title>
<link rel="stylesheet" type="text/css" href="css/main.css">
<style>
    .map_wrap {position:relative;width:100%;height:350px;}
    .title {font-weight:bold;display:block; font-size: 10px;}
    .hAddr {position:absolute;left:10px;top:10px; font-size: 10px; border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; font-size: 3px;}
</style>
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(document).ready(function()
	{
		$("#insert_btn").click(function()
		{
			alert($("#addr").val());
			alert($("#subAddr").val());
		})
	})


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


<div class="container">
	<div style="margin-top: 8%;">
	   <h1 style="text-align: center;">주소 검색</h1>
	   <hr />
	</div>
	
	
	<div class="map_wrap" style="left:30%; right: 30%;">
	    <div id="map" style="width:500px;height:500px; overflow:hidden;"></div>
		    <div class="hAddr" style="">
		        <span class="title">지도중심기준 행정동 주소정보</span>
		        <span id="centerAddr"></span>
		</div>
			    
		<div style="margin-top: 20px;">
			<form action="maptest01.jsp" method="get" style="display: inline-block; ">
		      <input type="text"  id="addr" readonly="readonly" style="width: 280px; height: 25px; " />
		      <br /><input type="text"  id="subAddr"  style="width: 350px; height: 25px; margin-top: 5px;" required="required" placeholder="상세 주소를 입력하세요"> 
		      <br>
		      <button type="button" class="btn btn-primary" id="insert_btn" style="width: 70px; height: 35px; margin-top: 8px;">확인</button>
		   </form>
		</div>
	    
	    <br />
	<!--     
	<div class="result_Address" style="margin-top: 2%; margin: auto; margin-left: 31%;">
	   <form action="maptest01.jsp" method="get" style="/* position: absolute; */ top: 80%; display: inline-block; ">
	      <input type="text"  id="addr" readonly="readonly" style="width: 250px; height: 25px; display: inline-block; " />
	      <br /><input type="text"  id="subAddr"  style="width: 350px; height: 25px; margin-top: 5px;" required="required" placeholder="상세 주소를 입력하세요"> 
	      <br>
	      <button type="submit" class="btn btn-primary" style="width: 70px; height: 35px; margin-top: 8px;">확인</button>
	      
	   </form>
	</div>
	 -->
	
	<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86ec7935feee50bc358cd41148ffd4e2&libraries=services"></script>
	<script>
	   var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	       mapOption = {
	           center: new kakao.maps.LatLng(37.525916,+126.717543), // 지도의 중심좌표 (게시물마다 중심 좌표가 될 값)
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
	               var detailAddr = !!result[0].road_address ? '<div style="font-size: small;">도로명주소 : ' + result[0].road_address.address_name + '</div>' : '';
	               detailAddr += '<div style="font-size: small;">지번 주소 : ' + result[0].address.address_name + '</div>';
	               
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
	               document.getElementById("subAddr").focus();
	               
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
	         map.setCenter(new kakao.maps.LatLng(37.525916,+126.717543)); // 지도의 중심좌표 (게시물마다 중심 좌표가 될 값) 로 다시 이동
	      
	      if (map.getLevel()<='2') // 지도 레벨이 4이하 (구체적 건물표현정도)
	         setDraggable(true);   // 로 떨어지면 드래그로 지도 위치를 바꿀수 있음
	      else 
	         setDraggable(false);
	   });
	   
	</script>
</div>
</div>


</body>
</html>