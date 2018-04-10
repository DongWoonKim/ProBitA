<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
				<th>ID</td>
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
			</th>
			</tr>
		</table>
	</form>
</div>
</body>
</html>