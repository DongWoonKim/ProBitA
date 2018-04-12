<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
table{
width:100%;
}
#leftdiv{
	background-color:red;
	width:45%;
	height:100%;
}
#middlediv{
	background-color:green;
	width:10%;
	height:100%;
}
#rightdiv{
	background-color:yellow;
	width:45%;
	height:100%;
}
</style>
</head>

<body>
<table>
<tr>
	<th colspan="3">1. 왼쪽에 표시된 서식지 목록은 전체 서식지 목록입니다. <br> 2.오른쪽에 표시된 서식지 목록은 사용자가 지정한 서식지목록 입니다. <br> 3. 중간 화살표로 사용자가 원하는 서식지 이동이 가능합니다.<hr></th>
</tr>
<tr>
	<th id="leftdiv">서식지 목록</th>
	<th id="middlediv">-></th>
	<th id="rightdiv">사용자 정의 서식지 목록</th>
</tr>
<tr>
	<td>11</td>
	<td>22</td>
	<td>33</td>
</tr>
</table>
<!-- <div id="leftdiv">hey</div>

<div id="middlediv">~</div>

<div id="rightdiv">what?</div> -->

</body>
</html>