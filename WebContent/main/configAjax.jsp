<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
   request.setCharacterEncoding("utf-8");      
   response.setContentType("text/html; charset=UTF-8"); 
%>
[
	[
	<c:forEach items="${uflist}" var="uflist" varStatus="status">
      {"userid":"${uflist.userid}", "formcode":"${uflist.formcode}", "name":"${uflist.name}" }
      <c:if test="${!status.last}">,</c:if>
	</c:forEach>
	],
	[
	<c:forEach items="${ftlist}" var="ftlist" varStatus="status">
      {"formcode2":"${ftlist.formcode }", "name2":"${ftlist.name }"}
      <c:if test="${!status.last}">,</c:if>
	</c:forEach>
	]
]