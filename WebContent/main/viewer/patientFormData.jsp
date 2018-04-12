<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");		
	response.setContentType("text/html; charset=UTF-8"); 
%>
[
	<c:forEach items="${ clinics }" var="item" varStatus="status">
		{"id" : "${ item.name }", "parent" : "#", "text" : "${ item.name }"},
	</c:forEach>
	<c:forEach items="${ indates }" var="item" varStatus="status">
		{"id": "${ item.indate }", "parent" : "${ item.name }", "text" : "${ item.indate }"},
	</c:forEach>
		<c:forEach items="${ forms }" var="item" varStatus="status">
		{"id": "${ item.formname }", "parent" : "${ item.indate }", "text" : "${ item.formname }"}
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
]
 