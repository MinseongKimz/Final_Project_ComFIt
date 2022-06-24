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
<title>comfit, 나만의 컴퓨터</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

   /* div {border: 1px solid black;} */
   .MultiCarousel { float: left; overflow: hidden; padding: 15px; width: 100%; position:relative; }
    .MultiCarousel .MultiCarousel-inner { transition: 1s ease all; float: left; }
    .MultiCarousel .MultiCarousel-inner .item { float: left; }
    .MultiCarousel .MultiCarousel-inner .item > div { text-align: center; padding:10px; margin:10px; background:#f1f1f1; color:#666;}
    .MultiCarousel .leftLst, .MultiCarousel .rightLst { position:absolute; border-radius:50%;top:calc(50% - 20px); }
    .MultiCarousel .leftLst { left:0; }
    .MultiCarousel .rightLst { right:0; }
    
    .MultiCarousel .leftLst.over, .MultiCarousel .rightLst.over { pointer-events: none; background:#ccc; }
   
   .newList > div.card 
   {
      display: inline-block;
      /* float: left; */
      margin: 10px;
   }
   
   .lead
   {
      margin-top: 8px; margin-bottom: 8px;
   }
   
   .card
   {
		width: 16rem;
   }
   .MultiCarousel .MultiCarousel-inner .item .pad15:hover
   {
   		background-color: #A9D0F5;
   		cursor:pointer;
   }
   .MultiCarousel .MultiCarousel-inner .item .pad15:active
   {
   		background-color: #CEECF5;
   		cursor:pointer;
   }

</style>
<script type="text/javascript">

   $(document).ready(function () {
       var itemsMainDiv = ('.MultiCarousel');
       var itemsDiv = ('.MultiCarousel-inner');
       var itemWidth = "";
   
       $('.leftLst, .rightLst').click(function () {
           var condition = $(this).hasClass("leftLst");
           if (condition)
               click(0, this);
           else
               click(1, this)
       });
   
       ResCarouselSize();
   
   
   
   
       $(window).resize(function () {
           ResCarouselSize();
       });
   
       //this function define the size of the items
       function ResCarouselSize() {
           var incno = 0;
           var dataItems = ("data-items");
           var itemClass = ('.item');
           var id = 0;
           var btnParentSb = '';
           var itemsSplit = '';
           var sampwidth = $(itemsMainDiv).width();
           var bodyWidth = $('body').width();
           $(itemsDiv).each(function () {
               id = id + 1;
               var itemNumbers = $(this).find(itemClass).length;
               btnParentSb = $(this).parent().attr(dataItems);
               itemsSplit = btnParentSb.split(',');
               $(this).parent().attr("id", "MultiCarousel" + id);
               if (bodyWidth >= 1200) {
                   incno = itemsSplit[3];
                   itemWidth = sampwidth / incno;
               }
               else if (bodyWidth >= 992) {
                   incno = itemsSplit[2];
                   itemWidth = sampwidth / incno;
               }
               else if (bodyWidth >= 768) {
                   incno = itemsSplit[1];
                   itemWidth = sampwidth / incno;
               }
               else {
                   incno = itemsSplit[0];
                   itemWidth = sampwidth / incno;
               }
               $(this).css({ 'transform': 'translateX(0px)', 'width': itemWidth * itemNumbers });
               $(this).find(itemClass).each(function () {
                   $(this).outerWidth(itemWidth);
               });
   
               $(".leftLst").addClass("over");
               $(".rightLst").removeClass("over");
   
           });
       }
   
   
       //this function used to move the items
       function ResCarousel(e, el, s) {
           var leftBtn = ('.leftLst');
           var rightBtn = ('.rightLst');
           var translateXval = '';
           var divStyle = $(el + ' ' + itemsDiv).css('transform');
           var values = divStyle.match(/-?[\d\.]+/g);
           var xds = Math.abs(values[4]);
           if (e == 0) {
               translateXval = parseInt(xds) - parseInt(itemWidth * s);
               $(el + ' ' + rightBtn).removeClass("over");
   
               if (translateXval <= itemWidth / 2) {
                   translateXval = 0;
                   $(el + ' ' + leftBtn).addClass("over");
               }
           }
           else if (e == 1) {
               var itemsCondition = $(el).find(itemsDiv).width() - $(el).width();
               translateXval = parseInt(xds) + parseInt(itemWidth * s);
               $(el + ' ' + leftBtn).removeClass("over");
   
               if (translateXval >= itemsCondition - itemWidth / 2) {
                   translateXval = itemsCondition;
                   $(el + ' ' + rightBtn).addClass("over");
               }
           }
           $(el + ' ' + itemsDiv).css('transform', 'translateX(' + -translateXval + 'px)');
       }
   
       //It is used to get some elements from btn
       function click(ell, ee) {
           var Parent = "#" + $(ee).parent().attr("id");
           var slide = $(Parent).attr("data-slide");
           ResCarousel(ell, Parent, slide);
       }

      });

</script>
<script type="text/javascript">


	$(document).ready(function()
	{
		$(".hover").hover(function()                
		{                                         
		   //alert("테스트");                       
		   $(this).removeClass("btn-secondary"); 
		   $(this).addClass("btn-primary");      
		}, function()                             
		{                                         
		   $(this).removeClass("btn-primary");   
		   $(this).addClass("btn-secondary");    
		});

      
		$(".item").click(function()
		{
			//alert("카테고리선택");
			//alert($(this).children(".cateItem").val());
		
			location.href = "categorySelect.action?categoryName=" + $(this).children(".cateItem").val();
		});
      
		$("#direAllBtn").click(function()
		{
			// alert("직거래전체보기 클릭");
			location.href = "sortlist.action?sort=4";
			
		});
		
		$("#deliAllBtn").click(function()
		{
			// alert("택배전체보기 클릭");
			location.href = "sortlist.action?sort=5";
		});
	
		
      
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


<!-- 220610 추가한 부분 지워도 됩니다! 큼직하게 이미지 넣는게 밀도있을 것 같아보여서 추가했어요 -->
<!-- <section>
  <div class="position-relative overflow-hidden p-2 p-md-4 m-md-3 text-center ">
    <div class="col-md-10 p-lg-1 mx-auto my-1">
    	<img src="images/bitcoin.jpg" alt="bitcoin" style="width: 100%; height: auto;"/>
    	<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="carousel">
		  <div class="carousel-indicators">
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active" aria-current="true" aria-label="Slide 1"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
		    <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
		  </div>
		  <div class="carousel-inner">
		    <div class="carousel-item active">
		      <img src="images/bitcoin.jpg" class="d-block w-100" alt="bitcoiner">
		    </div>
		    <div class="carousel-item">
		      <img src="images/bitcoin.jpg" class="d-block w-100" alt="bitcoiner">
		    </div>
		    <div class="carousel-item">
		      <img src="images/bitcoin.jpg" class="d-block w-100" alt="bitcoiner">
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
      <h1 class="display-4 fw-normal"></h1>
     
      <p class="lead fw-normal">And an even wittier subheading to boot. Jumpstart your marketing efforts with this example based on Apple’s marketing pages.</p>
      
      <a class="btn btn-outline-secondary" href="#">배너자리입니다</a>
    </div>
    <div class="product-device shadow-sm d-none d-md-block"></div>
    <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
  </div>
</section>   -->
<!-- 220610 추가한 부분 -->  

<!-- 카테고리 -->
<div class="container">
   <div class="row">
      <div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
            <div class="MultiCarousel-inner">
            	<c:forEach var="category" items="${cateList }">
            		<div class="item" >
            			<input class="cateItem" type="hidden" value="${category.category_name }"/>
                    	<div class="pad15 shadow rounded" style="align-items: center;">
                       	 <p class="lead" style="font-size: large; margin-top: 8px; margin-bottom: 8px;">${category.category_name }</p>
                   	    </div>
                	</div>
            	</c:forEach>
            </div>
            <button class="btn btn-primary leftLst"> <i class="bi bi-arrow-left"></i> </button>
            <button class="btn btn-primary rightLst"> <i class="bi bi-arrow-right"></i> </button>
        </div>
   </div>
   <br />
   
   <hr />
   
   <br />
   
   <div class="row">
       
      <!-- 최근 등록 상품 -->
      <div style="font-size: 20pt; font-weight:bold; display: inline-block; width: 1100px;">
         내 주변 상품 직거래
      </div>
         
      <div style="display: inline-block; width: 200px; float: right;">   
         <button type="button" class="btn btn-primary" style="float:right; width: 150px; float: right;"
         id="direAllBtn">전체보기</button>
      </div>
      
      <br /><br />
   
   
       <div class="col-md-12 text-center">
   
         <div class="newList">
         	<c:forEach var="product" items="${pdList }">
         	   <div class="card">
 				<img alt="" src="images/${product.pd_photo }"
						class="card-img-top" style="width: 220px; height: 140px;"> 	   	
              	 <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">${product.pd_title }</h5>
                  <p class="card-text"  style="text-align: center;">${product.price }</p>
                  <a href="pd_detail.action?pd_id=${product.pd_id }" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               	</div>
            </div>		
         	</c:forEach>
         </div><!-- newList.close -->
         <br />   
      </div><!-- col-md-12 text-center.close -->
      
      <hr />
      <br />   
      <!-- 인기 상품 -->
      <div style="font-size: 20pt; font-weight:bold; display: inline-block; width: 1100px;">
         택배거래 상품
      </div>
         
      <div style="display: inline-block; width: 200px; float: right;">   
         <button type="button" class="btn btn-primary" style="float:right; width: 150px; float: right;"
         		id="deliAllBtn">전체보기</button>
      </div>         
      <br /><br />
      
      
      <div class="col-md-12 text-center">
   
         <div class="newList">
           <c:forEach var="product" items="${deli_pdList }">
         	   <div class="card">
            	   <img alt="" src="images/${product.pd_photo }"
						class="card-img-top" style="width: 220px; height: 140px;">
              	 <div class="card-body">
                  <h5 class="card-title" style="text-align: center;">${product.pd_title }</h5>
                  <p class="card-text"  style="text-align: center;">${product.price }</p>
                  <a href="pd_detail.action?pd_id=${product.pd_id }" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
               	</div>
            </div>		
         	</c:forEach>
         </div><!-- newList.close -->
      </div><!-- col-md-12 text-center.close -->
         
   </div><!-- row.close -->           
</div><!-- container.close -->
            
 
<div>
   <c:import url="/WEB-INF/view/user/main/footer.jsp"></c:import>
</div>






</body>
</html>