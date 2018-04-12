<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
</head>
<style>

	#result {
		overflow-y: scroll;
		width: 500px;
		height: 500px;
	}
	
	.header {
		 width: 100%;
		 height: 30px;
		 background-color: #7AC3CC;
		 border: 1px solid #000000;
		 box-sizing: border-box;
	}
	
	.header div {
		text-align: center;
		display: inline-block;
		padding: 3px; 3px;
		box-sizing: border-box;
	}
	
	.content {
		width: 100%;
		height: 30px;
		border-bottom: 1px solid #000000;
		box-sizing: border-box;
	}
	
	.id, .name {
		width: 120px;
		display: inline-block;
		box-sizing: border-box;
		text-align: center;
		padding: 3px; 3px;
	}
	
	.jumin {
		width: 220px;
		display: inline-block;
		box-sizing: border-box;
		text-align: center;
		padding: 3px; 3px;
	}
	
	.content:hover {
		background-color: #000000;
		color: #FFFFFF;
	}

</style>

<script>
	window.onload = function() {
		var parent = window.opener;
		var result = document.getElementById('result');
		for(var i=0; i<arr.length; i++) {			
			var content = document.createElement('div');
			var id = document.createElement('div');
			var name = document.createElement('div');
			var jumin = document.createElement('div');
			var hiddenInfo = document.createElement('input');
			
			content.className = "content";
			id.className = "id";
			name.className = "name";
			jumin.className = "jumin";
			hiddenInfo.type = "hidden";
			
			id.innerHTML = arr[i].patId;
			name.innerHTML = arr[i].patName;
			jumin.innerHTML = arr[i].patJumin.slice(0,6) + "-" + arr[i].patJumin.slice(6,arr[i].patJumin.length);
			hiddenInfo.value = arr[i].patJumin;
			
			content.appendChild(id);
			content.appendChild(name);
			content.appendChild(jumin);
			content.appendChild(hiddenInfo);
			
			console.log(content);
			
			result.appendChild(content);
		}
		
		var contents = document.getElementsByClassName('content');
		
		for(var i=0; i<contents.length; i++) {
			contents[i].addEventListener('dblclick', function() {
				parent.document.getElementById('pNumber').innerHTML = "환자번호 : " + this.children[0].innerHTML;
				parent.document.getElementById('pName').innerHTML = "이름 : " + this.children[1].innerHTML;
				parent.document.getElementById('pJumin').innerHTML = "주민번호 : " + this.children[2].innerHTML;
				window.close();
			})
		}
	}

</script>
<body>
	<div id="result">
		<div class="header">
			<div style="width: 120px;">환자번호</div>
			<div style="width: 120px;">이 름</div>
			<div style="width: 220px;">주민등록번호</div>
		</div>
			
	
	</div>
</body>
</html>