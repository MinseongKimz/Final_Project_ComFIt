<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인화면</title>
<link rel="stylesheet" href="css/main.css" type="text/css">
<script type="text/javascript" src="http://code.jquery.com/jquery.min.js"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.1/font/bootstrap-icons.css">
<style type="text/css">

	/* div {border: 1px solid black;} */
	.MultiCarousel { float: left; overflow: hidden; padding: 15px; width: 100%; position:relative; }
    .MultiCarousel .MultiCarousel-inner { transition: 1s ease all; float: left; }
    .MultiCarousel .MultiCarousel-inner .item { float: left;}
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
		$(".btn").hover(function()                
		{                                         
			//alert("테스트");                       
			                                      
			$(this).removeClass("btn-secondary"); 
			$(this).addClass("btn-primary");      
		}, function()                             
		{                                         
			$(this).removeClass("btn-primary");   
			$(this).addClass("btn-secondary");    
		});
	})

		


</script>


</head>

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
<br /><br /><br />


<!-- 카테고리 -->
<div class="container">
	<div class="row">
		<div class="MultiCarousel" data-items="1,3,5,6" data-slide="1" id="MultiCarousel"  data-interval="1000">
            <div class="MultiCarousel-inner">
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead" style="vertical-align: middle;">그래픽카드</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">CPU</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">HDD</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">모니터</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">오디오</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">주변기기</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">메모리</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">키보드</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">메인보드</p>
                    </div>
                </div>
                <div class="item">
                    <div class="pad15 shadow">
                        <p class="lead">케이스</p>
                    </div>
                </div>
                
            </div>
            <button class="btn btn-primary leftLst"></button>
            <button class="btn btn-primary rightLst"></button>
        </div>
	</div>
	<br />
	
	<hr />
	
	<br />
	
	<div class="row">
	    
		<!-- 최근 등록 상품 -->
		<div style="font-size: 20pt; font-weight:bold; display: inline-block; width: 1100px;">
			최근 등록 상품
		</div>
			
		<div style="display: inline-block; width: 200px; float: right;">	
			<button type="button" class="btn btn-primary" style="float:right; width: 150px; float: right;">전체보기</button>
		</div>
		
		<br /><br />
	
	
	    <div class="col-md-12 text-center">
	
			<div class="newList">
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				
				
			</div>
			<br />	
		</div>
		<hr />
		<br />	
		<!-- 인기 상품 -->
		<div style="font-size: 20pt; font-weight:bold; display: inline-block; width: 1100px;">
			인기 상품
		</div>
			
		<div style="display: inline-block; width: 200px; float: right;">	
			<button type="button" class="btn btn-primary" style="float:right; width: 150px; float: right;">전체보기</button>
		</div>			
		<br /><br />
		
		
		<div class="col-md-12 text-center">
	
			<div class="newList">
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				<div class="card" style="width: 10rem;">
					<img src="images/ssd.jpg" class="card-img-top">
					<div class="card-body">
						<h5 class="card-title" style="text-align: center;">SSD</h5>
						<p class="card-text"  style="text-align: center;">120,000</p>
						<a href="#" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
					</div>
				</div>
				
				
			</div>
								
		</div>
			
	</div>	        
</div>

				
			
	









<br /><br /><br /><br /><br /><br /><br />

















</body>
</html>