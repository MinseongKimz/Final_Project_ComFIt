<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="product" items="${scrollList }">
        	   <div class="card">
           	     <img alt="" src="images/${product.pd_photo }"
				class="card-img-top" style="width: 220px; height: 140px;">
             	 <div class="card-body">
                 <h5 class="card-title" style="text-align: center;">${product.pd_title }</h5>
                 <p class="card-text"  style="text-align: center;">${product.pd_price }</p>
                 <p class="card-text"  style="text-align: center;">${product.system }</p>
                 <c:if test="${product.status }!= '입찰중' || '입찰받는중' || '제안받는중'">
                 	<p class="card-text"  style="text-align: center;">거래완료상품</p>
                 </c:if>
                 <a href="pd_detail.action?pd_id=${product.pd_id }" class="btn btn-secondary hover" style="margin: auto; display: block;">상세페이지</a>
                 <input class="rn" type="hidden" data-bno="${product.rn}">
                 </div>
         	   </div>
</c:forEach>