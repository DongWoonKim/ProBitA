<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   request.setCharacterEncoding("utf-8");      
   response.setContentType("text/html; charset=UTF-8"); 
%>
[
	<c:forEach items="${ cplist }" var="cplist" varStatus="status">
		{"memo" : "${cplist.memo}"}
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
]