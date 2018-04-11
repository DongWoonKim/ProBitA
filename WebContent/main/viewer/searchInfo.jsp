<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
	request.setCharacterEncoding("utf-8");		
	response.setContentType("text/html; charset=UTF-8"); 
%>
[
	<c:forEach items="${ patient }" var="patient" varStatus="status">
		{"patId" : "${ patient.patid }", "patName" : "${ patient.name }", "patJumin" : "${ patient.juminno }"}
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
]
