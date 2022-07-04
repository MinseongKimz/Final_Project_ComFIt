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
<meta charset="UTF-8">
<title>user_search_product.jsp</title>
<!-- <link rel="stylesheet" type="text/css" href="css/user_search_product.css"> -->
<style type="text/css">
   
   .image{
      width: 100px;
      height: 100px;
   
   }
   .price{
      color: red;
      font-weight: bold;
   }
   .caption{
      color: red;
      font-size: small;
      font-weight: bold;
   }
   
   .title
   {
      font-size: 25pt;
      font-weight: bold;
      margin-top:10%;
   }
   .input_text
   {
      
      width: 200pt;
      font-size:15pt;
      height:30pt;
      border-radius:5px;
   }
   .btn1
   {
      text-align:center;
      border-radius:5px;
      width:100px;
      height:30pt;
   
   }
   .btn
   {
      text-align:center;
      border-radius:5px;
      width:120px;
      height:30pt;
   }
   .btn:hover,.btn1:hover
   {
      background:black;
      color:white;
   }
   .chucheon
   {
      margin-left:25%;
   }
   .describe
   {
      margin-left:25%;
      font-weight: bolder;
   }
   .imglink 
   {
      text-decoration: none; 
      color: black;
      outline: 0;
      border: 0;
      background-color: white;
      font-size: 14pt;
            
   }
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">
   $(function()
   {
      var pdname = "";
      
      $("#loadBtn").click(function()
      {
         pdname = $("#name").val();
         
         if(pdname == "")
         {
            alert("물품을 입력해주세요.");
            
            return;            
         }
         
         $("form").submit();
         
      })
      
      var result = '${result }';
      
      if(result != null)
      {
         pdname= '${pdname}';
         
         var searchXml = $.parseXML(result);
         //alert(searchXml);
         var txt = "";
         var priceArr; 
         var arr = []; 
         var tprice = 0;  // 검색 결과 나온 물품들의 누적 합 
         
         $(searchXml).find('item').each(function(index) // 각 상품은 <item> 태그로 묶여있다.
         {
            var name = $(this).find('title').text(); // 타이틀 : 물건 이름
            var price = $(this).find('lprice').text();   // lprice : 각 항목의 최저가 → 최고가는 안나오는듯..?
            var image = $(this).find('image').text();   // image : 각 항목의 사진 
            var category3 = $(this).find('category3').text();
            if(category3=="")
            	var category3 = $(this).find('category2').text();
            
            var maker = $(this).find('maker').text();
            
            if(index!=0&&index%3==0)
               txt += "<br>";
            
            
            if (maker!="")
            {
               txt += "<button class='imglink' value='" + pdname + "/"+ category3 + "/"+ maker +"'>";
               txt += "<img class='image' style='width: 200px; height:auto;' src='" + image +"' >"+"<p>" + name + "<br> 카테고리 : "
                 +category3 +"<br>제조사 : "+ maker +"</p></button>";
            }
            
            
            
            arr[index] = Number(price);
            
         });   
         
            
            for (var i = 0; i < arr.length; i++)
               tprice += Number(arr[i]); // 누적 실행
            
            var avgPrice = (tprice/arr.length);    // 누적합 ÷ 물품갯수
            
            for (var i = 0; i < arr.length; i++)
            {
               if (arr[i] < (avgPrice * 1.1 ) && arr[i] > (avgPrice * 0.98)) // 물품중에 평균 가격 범위안에 들어왔다면
               {
                  arr.splice(i, 1);
                  i--;
               }
            }
            
            var tprice2 = 0; // 거른 것들을 누적합 하기위해 만든 변수 
            
            //alert(arr.length)
            
            for(var i=0; i<arr.length; i++)
               tprice2 += arr[i]; 
               
            
            //console.log(tprice2);
            var AvgPrice = parseInt((tprice2/arr.length) * 0.65);
            
            realAvgPrice = Math.floor(AvgPrice/1000) * 1000;
            
            //alert(avgPrice);
            //alert(realAvgPrice);
            
            if (arr.length==0)
            {
               $("#result").html("<p>검색결과가 없습니다.</p>");
            } 
            
            else
            {
               var txt2 = "<p class='price'>추천중고가격은 : " + realAvgPrice + " 입니다</p>" 
                + "<p class='caption'>이 가격은 단지 참고용이며 절대적이지 않습니다.<br>제품명을 정확히 입력할수록 정확도가 올라갑니다.</p>";
               $("#result").html(txt2 + txt);
            }
            
      }   
      
      $("#clearBtn").click(function()
      {
         $("#result").empty();
      });   
      
      $(".imglink").click(function()
      {
         var value = $(this).val();
               
         var valArr = value.split('/');      
         
         var name = valArr[0];
         var category = valArr[1];
         var maker = valArr[2];
         
         location.href="returnsell2.action?name=" + name + "&maker=" + maker + "&category=" + category + "&realAvgPrice=" + realAvgPrice;
         
        /*  $.post("retunsell.action", {
            name : name
           , category : category
           , maker : maker
           , cfPrice : realAvgPrice
         }, function(data)
         {
            //console.log(data);
            
         }) */
      })
   })   
   
</script>

</head>
<body>

<div style="text-align: center;">
   <p class="title">물품 검색</p>
</div>

<div class="outer" style="text-align: center;">   
      <div>
         <form action="search2.action" method="post" id="form">
         <input type = "text" class="input_text" name="name" id="name" placeholder="물품을 입력하세요"/>
         <button class="btn1" id="loadBtn" style="background-color:#B2D7FC;">검색하기</button>
         <button class="btn1" type="reset" id="clearBtn">지우기</button>
         <button class="btn">찾는 물건 없음</button>
         </form>
         
            <div id="result" style="text-align: center; font-size: 23pt;">
            </div>
         
         
         
         
      </div>
      
   
</div>

</body>
</html>