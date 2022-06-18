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

<title>직거래 상품 페이지.jsp</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/css/bootstrap.min.css">
<link rel="stylesheet" href="<%=cp %>/css/bootstrap.css">

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript" src="/js/bootstrap.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta/js/bootstrap.min.js"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<style>
   .map_wrap {position:relative;width:100%;height:500px;}
    .title {font-weight:bold;display:block; font-size: 10px;}
    .hAddr {position:absolute;left:10px;top:10px; font-size: 10px; border-radius: 2px;background:#fff;background:rgba(255,255,255,0.8);z-index:1;padding:5px;}
    #centerAddr {display:block;margin-top:2px;font-weight: normal;}
    .bAddr {padding:5px;text-overflow: ellipsis;overflow: hidden;white-space: nowrap; font-size: 3px;}
    
    #map img
     {

    	max-width: none;

    	height: auto;

    	border: 0

	}
</style> 
<style type="text/css">
p
{
	font-size: 9pt;
}
/* 내용 div */
.content
{
	padding: 4%;
}
/* 내용 안에 들어가는 p */
.content_text
{
	font-size: 15pt; 
	font-weight: bold; 
	line-height: 50%;
}

/* 유저 사진 */
.user_image
{
	width: 100px;
	height: 100px;
}
th,td
{
	border: 1px solid #444444;
}

d-block
{
	width: 100%; 
	height: 100%;
	object-fit: cover;
}

 .carousel-inner > .carousel-item > img 
 {
      top: 0;
      left: 0;
      min-width: 100%;
      max-width: 100%;
      min-height: 380px;
      max-height: 380px;
      object-fit: cover;
  } 

</style>



<script type="text/javascript">
function searchAddr()
{
  
    var pd_id = document.getElementById("pd_id").value;
    
    var url = "direct_place.action?pd_id=" + pd_id;
    
}
function CountDownTimer(dt, id)
{
    var end = new Date(dt);
    var _second = 1000;
    var _minute = _second * 60;
    var _hour = _minute * 60;
    var _day = _hour * 24;
    var timer;
    function showRemaining()
    {
        var now = new Date();
        var distance = end - now;
        if (distance < 0)
        {
            clearInterval(timer);
            document.getElementById(id).innerHTML = '타임딜 종료됨';
            return;
        }
        var days = Math.floor(distance / _day);
        var hours = Math.floor((distance % _day) / _hour);
        var minutes = Math.floor((distance % _hour) / _minute);
        var seconds = Math.floor((distance % _minute) / _second);
        document.getElementById(id).innerHTML = days + '일 ';
        document.getElementById(id).innerHTML += hours + '시간 ';
        document.getElementById(id).innerHTML += minutes + '분 ';
        document.getElementById(id).innerHTML += seconds + '초';
    }
    timer = setInterval(showRemaining, 1000);
}

	window.onload = function()
	{
		
		var remain_date = document.getElementById("remain_date").value;
		//alert(remain_date);
		CountDownTimer(remain_date, 'demo');		
	};



</script>


</head>
<body>

<div class="header">
	<c:import url="/WEB-INF/view/user/main/comfit_header_user.jsp"></c:import>
</div>
<div>
	<c:forEach var="mgrs" items="${mgrs }">
	<input type="hidden" id="lat" value="${mgrs.lat }" />
	<input type="hidden" id="lon" value="${mgrs.lon }" />
	</c:forEach>
</div>

<div class="container">
	<div style="padding-top: 5%;">
	<c:forEach var="drPd"  items="${drPdList }">
	
			<p class="fs-2" style="text-align: center; font-weight: bold;">[${drPd.category_name}] ${drPd.pd_title }</p>
		
		<div class="content">
		<div class="col-md-6" style="float: left; width: 560px; height: 420px; padding-top: 5%; margin-right: 3%;" >	
			<div id="carouselExampleIndicators" class="carousel slide carousel-fade" data-bs-touch="false" data-bs-ride="true">
			  <div class="carousel-indicators">
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="3" aria-label="Slide 4"></button>
			    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="4" aria-label="Slide 5"></button>
			  </div>
			  <div class="carousel-inner">
			    <div class="carousel-item active">
			      <img src="https://cdn.pixabay.com/photo/2015/09/04/23/28/wordpress-923188__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/06/15/16/16/man-1459246__340.png" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2015/09/04/23/28/wordpress-923188__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			    <div class="carousel-item">
			      <img src="https://cdn.pixabay.com/photo/2016/03/26/13/09/cup-of-coffee-1280537__340.jpg" class="d-block w-100 rounded" alt="...">
			    </div>
			  </div>
			  <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
			    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Previous</span>
			  </button>
			  <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
			    <span class="carousel-control-next-icon" aria-hidden="true"></span>
			    <span class="visually-hidden">Next</span>
			  </button>
			</div>
		</div>
		
		<input type="text" id="pd_id" value="${drPd.pd_id }" hidden="hidden"/>
		<table class="col-md-5">
			<tr>
				<td colspan="2">
				<p>거래방식</p>
				<!-- 속성에 따라 직거래/배송 표기 -->
				<p class="content_text" >직거래</p></td>
				
			</tr>
			<tr>
				<td colspan="2"><p>희망가격</p>
				<p class="content_text" style="color: blue;">${drPd.price} 원</p></td>
			</tr>
			<tr>
				<td><p>희망 날짜</p>
					<p class="content_text" style="font-size: 12pt;">${drPd.pd_hope_sdate} ~ ${drPd.pd_hope_edate} </p>
					
				</td>
				<td><p>희망 시간대</p>
					<p class="content_text" style="font-size: 12pt;">${drPd.pd_hope_stime } ~ ${drPd.pd_hope_etime}</p>
				</td>
			</tr>
			<tr>
				<td colspan="2"><p>희망 장소</p>
					<p class="content_text" style="color: blue;">${drPd.pd_hope_place}</p>
				</td>
			</tr>
			<tr>
				<td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료까지</p>
				<!-- 경매 종료시간 적용/경매 종료시 경매종료라고 표기 -->
				<!-- <td colspan="2" style="border-bottom: 2px solid gray;"><p>경매 종료</p> -->
				<input type="text" id="remain_date" value="종료일 : ${drPd.remain_date }" >
				<p class="fs-2" style="font-weight: bold;">[<span class="fs-2" style="color: #ffd700;" id="demo"></span>]</p>
				
				<!-- 종료 시 최종가 표기  -->
				<!-- <p class="content_text" style="color: blue;">최종 가격 : 143,000원</p> -->

				</td>
			</tr>
			<tr>
				<td style="padding-top: 10px;">
					<p>제조사/물품명</p>
				</td>
				<th style="padding-top: 10px;">
				<%
					int check_id = (int)session.getAttribute("check_id");
				%>
				
					<!-- 제조사/물품명 표기 -->
					<p style="font-weight: bold;">${drPd.maker_name}(${drPd.maker_name2 }) / ${drPd.pd_name }</p>
				</th>
			</tr>
			<tr>
				<td>
					<p>Comfit 추천가격</p>
				</td>
				<th>
					<!-- 상품에 따른 추천가 표기 -->
					<p style="color: blue;">${drPd.cf_price}</p>

				</th>
			</tr>
			
			<tr>
				<td colspan="2">
				<%
					// 판매자인 경우
					if(check_id == 1)
					{
				%>
				
				<!-- 상태에 따라 버튼 변경 -->
				<!-- 판매자)입찰자 없을 때 :수정하기/삭제하기-->
				<!-- 판매자)입찰자 있을 때 :즉시낙찰/삭제하기 -->
				<!-- <button type="button" class="btn btn-warning" style="width: 48%;">즉시낙찰</button> -->
				<button type="button" class="btn btn-primary" style="width: 48%;">수정하기</button>
				<button type="button" class="btn btn-secondary" style="width: 48%;">삭제하기</button>
				<%
					}
					else
					{		
				%>
				<button type="button" class="btn btn-primary" style="width: 48%;" id="suggest"
				 data-toggle="modal" data-target="#myModal">구매제안</button>
				<button type="button" class="btn btn-secondary" style="width: 48%;">신고하기</button>
				<%
					}
				%>
				</td>
			</tr>
		</table>
		</div>
		<div>
			<div class="col-md-6" style="width:100%; display: inline-block; float:left;">
				<table style="margin-left:5%; width:90%;">
					<tr class="table-secondary">
						<th style="height:25px; width: 100%; text-align: center;">
							<p style="font-size: 18pt;">상품 상세정보</p>
						</th>
					</tr>
					
					<!-- 공간분리용 tr -->
					<tr style="height: 10px;">
					</tr>
					
					<tr class="table-secondary">
						<td style="padding:5%;">
						<p>상품 상세정보<br><br>
						1. 제조사 A/S 가능여부 : ${drPd.pd_as_name } ${drPd.pd_as_remain } 까지 가능<br><br>
						2. 특이사항 : ${drPd.comments }
						</p>
						</td>
					</tr>
				</table>
			</div>
					<!-- 구매자) 판매자 정보 -->
			<div class="seller_info col-md-5" style="display: inline-block; padding-left: 3%; height: 270px;">
			
			<div class="card" style="width: 100%; padding:3%;">
				<div>
					<div class="user_image" style="float: left;">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
					<div style="padding-left: 25%;">
						<p class="fs-2" style="margin-top: 5%; font-weight: bold;">${drPd.u_nickname } 
						<span class="fs-6" style="color: green;">Level : ${userLevel }</span>
						</p>
					</div>
				</div>
				    
				  <div class="card-body" style="height: 85px;">
				    <h5 class="card-title"></h5>
				    <div style="text-align: right;">
				    	<p class="card-text" style="font-weight: bold;">누적 판매 수 : ${sellCount }회</p>
				    	<a href="user_detail_sell.jsp" style="text-decoration: none;">상세보기</a>
				    </div>
				  </div>
				</div>
       				
				<!-- 판매자 정보 아래 버튼  -->
				<div style="text-align: center; margin-top: 1%;">
					<button class="btn btn-primary" style="width: 25%; margin-right: 15%;" onclick="location.href='user_mainlist.action'">목록으로</button>
					<button class="btn btn-primary" style="width: 25%;">찜하기</button>
				</div>
			</div>
		</div>
		
		</c:forEach>
		<!-- 제안정보가 출력될 폼 -->
		<div class="content_bid" style="margin-top: 5%; margin-left: 5%; margin-right:9%;">
		<p class="fs-3" style="padding-left: 4%; font-weight: bold;">현재 제안 정보</p>
		
			<c:forEach var="suggest" items="${suggestList }">
			<!-- 입찰 폼 한개 -->
			<div class="shadow p-3 mb-5 bg-body rounded">
			<table style="width: 100%;">
			<tr>
				<td style="width: 15%; padding-left: 3%;">
					<div class="user_image">
						<img alt="" src="https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460__480.png"
						style="object-fit:cover; height: 100%; width: 100%;">
					</div>
				</td>
				<th style="padding-left: 2%;">
					<p class="fs-4">
					${suggest.u_nickname }
					</p>
				</th>
				<td>
					<p style="padding-left:10%;">가격 : ${suggest.price }원<br>
					날짜 : ${suggest.suggest_time }<br>
					장소 : ${suggest.suggest_place } ${suggest.place_detail } </p>
				</td>
				<td style="text-align: right; margin-left: 20%;">
					<p>${suggest.suggest_date }</p>
					<button type="button" class="btn btn-primary" value="${suggest_code }">채택하기</button>
				</td>
			</tr>
			</table>
			</div>

			</c:forEach>
		</div>
		
		
	<br />
	<br />
	<br />	
	<br />
	<br />
	<br />
	<br />
	
	</div>
</div>




<!-- Modal -->

<div class="modal fade" id="myModal" data-backdrop="static" data-keyboard="false">
    <div class="modal-dialog modal-xl modal-dialog-centered" style="height: 2000px; width: 2000px;">
      <div class="modal-content">
      
        <!-- Modal Header -->
        <div class="modal-header">
          <h4 class="modal-title">구매제안하기</h4>
          <button type="button" class="close" data-dismiss="modal">&times;</button>
        </div>
        
        
			    
        
        
        <!-- Modal body -->
        <div class="modal-body">
        	<button type="button" onclick="relayout()"></button>
			<div class="map_wrap" >
			
			    <div id="map" style="width:500px;height:500px;overflow:hidden;">
			    </div>
			    
			    <div class="hAddr" >
			        <span class="title">지도중심기준 행정동 주소정보</span>
			        <span id="centerAddr"></span>
				</div>			        
	    	</div>	        	
        	
			
			    <br />
			    
			<div>
	           	<label for="address1">희망장소</label>
			      <input type="text" class="form-control" id="addr"
			       readonly="readonly" placeholder="희망장소를지도에서선택해주세요" style="width: 250px; height: 25px;" />
			      <br>
			</div>
			    
			</div>
 		 
 		 
 		 
          <div class="mb-3">
           	<label for="address2">상세장소</label>
          		 <input type="text" class="form-control" id="address2" name="address2" placeholder="상세장소를 입력해주세요."  required="required" >
          </div>
         
        
        		
        
        
        </div><!-- close.modal-body -->
        
        <!-- Modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-secondary" data-dismiss="modal">닫기(취소)</button>
        </div>
        
      </div>
    </div>
</div>



<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=86ec7935feee50bc358cd41148ffd4e2&libraries=services"></script>
<script type="text/javascript">
	$(document).ready(function()
	{
		 
			$("#suggest").click(function()
			{
				alert("11");
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
				               
				               document.getElementById("addr").value = result[0].address.address_name;
				               
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
				      
				      if (map.getLevel()<='4') // 지도 레벨이 4이하 (구체적 건물표현정도)
				         setDraggable(true);   // 로 떨어지면 드래그로 지도 위치를 바꿀수 있음
				      else 
				         setDraggable(false);
				   });
				
				
				
				
			});
			
			function relayout()
			{
				map.relayout();
			}		   
		
	});
	
	
</script>






</body>
</html>