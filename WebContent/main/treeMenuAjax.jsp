<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%
	request.setCharacterEncoding("utf-8");		
	response.setContentType("text/html; charset=UTF-8"); 
%>
[	
    <c:forEach items="${list}" var="list" varStatus="status">
		{ "id" : ${list.pathid}, "pid" : ${list.pathport}, "name" : "${list.formcodename}", "url" : "${list.localpath}" }
		<c:if test="${!status.last}">,</c:if>
	</c:forEach>	
]
 