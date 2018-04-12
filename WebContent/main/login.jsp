<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
body{
background-color:#7AC3CC;
}
.button{
	background-color: #555555;
	color: white;
	border: none;
	padding: 10px 20px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 10px;
	float:center;
	margin-left:50%;
}
.main{
	margin-top:20%;
}
</style>
</head>
<body>
<div class="main">
	<form name="mainform" method="post" action="../login.do">
		<table align="center">
			<tr>
				<th>ID</th>
				<td><input type="text" name="userid"/></td>
			</tr>
			<tr>
				<th>PW</th>
				<td><input type="text" name="passwd"/></td>
			</tr>
			<tr>
			<th>
			<td>
				<input class="button" type="submit" value="로그인" />
			</td>			 
			</tr>
		</table>
	</form>
</div>
</body>
</html>