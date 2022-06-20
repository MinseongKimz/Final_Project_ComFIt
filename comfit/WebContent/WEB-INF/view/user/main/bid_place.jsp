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
<title>입찰</title>
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
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
    function bid()
   {
		var suggest_price = document.getElementById("price").value;
		//alert(suggest_price);
		
		var address = document.getElementById("address").value;
		//alert(address);
		
		var addr_detail = document.getElementById("addr_detail").value;
		//alert(addr_detail);
		
		var u_id = document.getElementById("bidding").value;
		//alert(u_id);
		
		var pd_id = document.getElementById("pd_id").value;
		//alert(pd_id);
		 
		var url = "suggest_price=" + suggest_price + "&address=" + address
				+ "&addr_detail=" + addr_detail + "&u_id="+u_id + "&pd_id=" +pd_id;
		
		location.href = "bid.action?"+url;
		
 
	}

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
                   
                   alert(fullRoadAddr);
                   document.getElementById('address').value = fullRoadAddr;
                   
               }
           }).open({
              /* popupKey : 'popup1'   // 팝업창 key 설정 */
           });   
       }
             
    
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
	<%-- <c:forEach var="mgrs" items="${mgrs }">
	<input type="hidden" id="lat" value="${mgrs.lat }" />
	<input type="hidden" id="lon" value="${mgrs.lon }" />
	</c:forEach> --%>
	<%-- <input type="hidden" id="hope_sdate" value="${hope_sdate }" />
	<input type="hidden" id="hope_edate" value="${hope_edate }" /> --%>
	<input type="hidden" id="pd_id" value="${pd_id }" />
	<%-- <input type="hidden" id="hope_stime" value="${hope_stime }" />
	<input type="hidden" id="hope_etime" value="${hope_etime }" /> --%>
</div>

   
	<div>
	   <table class="table table-borderless" style="width: 500px;">
  			<tr>
  				<th>
  					<label for="addr1">배송주소지</label>		
  				</th>
  				<td colspan="2">
  					<input type="text" class="form-control" id="address" name="address" placeholder="클릭해주세요" required="required" readonly="readonly" onclick="searchAddr()"
  					 style="width: 300px; height: 35px; text-align: center;" />		
  				</td>
  			</tr>
  			<tr>
  				<th>
  				     <label for="addr2">장소상세</label>
  				</th>
  				<td colspan="2">
  				     <input type="text" class="form-control" name="addr_detail" id="addr_detail" style="width: 300px; height: 35px;"/>
  				</td>
  			</tr>
  			<tr>
  				<th>
  					 <label for="hope_price">제안금액</label>
  				</th>
  				<td colspan="2">
 				      <input type="text" class="form-control" id="price" style="width: 300px; height: 35px;" />
  				</td>
  			</tr>
		</table>
	
       <%-- <button type="button" id="suggestion" class="btn-primary" style="width: 150px; height: 35px; margin-left: 20%;"
        value="${u_id }">제안하기</button> --%>
        <button type="button" id="bidding" class="btn btn-primary" style="width: 150px; height: 35px; margin-left: 20%;"
        	value="${u_id }" onclick="bid()">입찰하기</button>
       <button type="reset" class="btn btn-secondary" style="width: 150px; height: 35px;">취소</button>
	</div>
    
</body>
</html>