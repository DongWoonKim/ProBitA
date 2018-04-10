<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
[
	[
	<c:forEach items="${plist}" var="plist" varStatus="status">
		{"pname": "${plist.name}"}
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
	],
	[
	<c:forEach items="${wlist}" var="wlist" varStatus="status">
		{"name": "${ wlist.name }", "localpath" : "${wlist.localpath}"}
		<c:if test="${ !status.last }">
		,
		</c:if>
	</c:forEach>
	]
]

 