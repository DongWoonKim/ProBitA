<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

[
	<c:forEach items="${prelist}" var="prelist" varStatus="status">
		{"code": "${ prelist.code }", "fullname" : "${prelist.fullname}", "fullcount": "${prelist.fullcount }", "counting":"${prelist.counting}", "daycount":"${prelist.daycount}" }
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
]

 