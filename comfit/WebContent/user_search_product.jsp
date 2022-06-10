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
<link rel="stylesheet" type="text/css" href="css/user_search_product.css">
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
</style>

<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<script type="text/javascript">

	$(function()
	{
		$("#loadBtn").click(function()
		{
			
			var pdname = $("#name").val();
			
			if(pdname == "")
			{
				alert("물건 이름을 써주세요");
				
				return;				
			}
			
			$("form").submit();
			
		})
		
		var result = '${result }';
		
		if(result != null)
		{
			var searchXml = $.parseXML(result);
			//alert(searchXml);
			var txt = "";
			var priceArr; 
			var arr = []; 
			var tprice = 0;  // 검색 결과 나온 물품들의 누적 합 
			
			$(searchXml).find('item').each(function(index) // 각 상품은 <item> 태그로 묶여있다.
			{
				var name = $(this).find('title').text(); // 타이틀 : 물건 이름
				var price = $(this).find('lprice').text();	// lprice : 각 항목의 최저가 → 최고가는 안나오는듯..?
				var image = $(this).find('image').text();	// image : 각 항목의 사진 
				var category1 = $(this).find('category1').text();
				var category2 = $(this).find('category2').text();
				var category3 = $(this).find('category3').text();
				var category4 = $(this).find('category4').text();
				var maker = $(this).find('maker').text();
				
				if (maker!="")
				{
					txt += "<img class='image' style='width: 200px; height:auto;' src='" + image +"' >"+"<p>" + name + " 최소가 : [" + price + "]<br> 카테고리 : "
					  +"/"+ category1 +"/"+ category2 + "/"+category3 +"/["+ maker +"]<input type='checkbox'></p><br>";
				}
				
				arr[index] = Number(price);
				
			});	
			
				
				for (var i = 0; i < arr.length; i++)
					tprice += Number(arr[i]); // 누적 실행
				
				var avgPrice = (tprice/arr.length);  // 누적합 / 물품갯수
				
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
				{
					tprice2 += arr[i]; 
					console.log(tprice2);
					
				}
				
				//console.log(tprice2);
				var realAvgPrice = (tprice2/arr.length) * 0.65;
				
				//alert(avgPrice);
				//alert(realAvgPrice);
				
				if (arr.length==0)
				{
					$("#result").html("<p>검색결과가 없습니다.ㅠ</p>");
				} 
				
				else
				{
					var txt2 = "<p class='price'>추천중고가격은 : " + realAvgPrice + " 입니다</p>" 
					 + "<p class='caption'>이 가격은 단지 참고용이며 절대적이지 않습니다.<br>제품명을 정확히 적으면 정확도가 올라갑니다.</p>";
					$("#result").html(txt2 + txt);
				}
		}	
		
		$("#clearBtn").click(function()
		{
			$("#result").empty();
		});	
					
	})	
	
</script>

</head>
<body>

<div style="text-align: center;">
	<p class="title">물품 검색</p>
</div>

<div class="outer" style="text-align: center;">	
		<div>
			<form action="search.action" method="post" id="form">
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