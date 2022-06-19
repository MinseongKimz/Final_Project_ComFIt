<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:forEach var="maker" items="${makerlist }">
	<option value="${maker.pd_maker_id }">${maker.maker_name} </option>
</c:forEach>
