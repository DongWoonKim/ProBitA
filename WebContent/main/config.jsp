<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>Insert title here</title>
<style>
#configList {
	overflow-y: scroll;
	width: 600px;
	height: 100%;
}
#allconfigList {
	overflow-y: scroll;
	width: 600px;
	height: 100%;
}
#infoList {
	background-color:yellow;
	width: 600px;
	height: 100%;
}
.config {
	width: 100%;
	height: 30px;
	background-color: #7AC3CC;
	border: 1px solid #000000;
	box-sizing: border-box;
}  
 
.config div {
	text-align: center;
	display: inline-block;
	padding: 3px; 3px;
	box-sizing: border-box;
}
.allconfig {
	width: 100%;
	height: 30px;
	background-color: #7AC3CC;
	border: 1px solid #000000;
	box-sizing: border-box;
}  
 
.allconfig div {
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
   .content2 {
      width: 100%;
      height: 30px;
      border-bottom: 1px solid #000000;
      box-sizing: border-box;
   }   
   .formcode, .name {
      width: 250px;
      display: inline-block;
      box-sizing: border-box;
      text-align: center;
      padding: 3px; 3px;
   }
   .formcode2, .name2 {
      width: 250px;
      display: inline-block;
      box-sizing: border-box;
      text-align: center;
      padding: 3px; 3px;
   }
   .content:hover {
      background-color: #000000;
      color: #FFFFFF;
   }
   .content2:hover {
      background-color: #000000;
      color: #FFFFFF;
   }
</style>

<script>
window.onload = function() {
	
	console.log(arr);
    var parent = window.opener;
    var allconfigList = document.getElementById('allconfigList');
    var configList = document.getElementById('configList');
    for(var i=0; i<arr[0].length; i++) {         
       var content = document.createElement('div');
       var formcode = document.createElement('div');
       var name = document.createElement('div');
       
       content.className = "content";
       content.style="background-color:gray;"
       formcode.className = "formcode";
       name.className = "name";
       
       formcode.innerHTML = arr[0][i].formcode;
       name.innerHTML = arr[0][i].name;
       
       content.appendChild(formcode);
       content.appendChild(name);
       
       console.log(content);
       
       configList.appendChild(content);
       
       
    }

   var allconfigList = document.getElementById('allconfigList');
    for(var j=0; j<arr[1].length; j++){
    	var content2 = document.createElement('div');
        var formcode2 = document.createElement('div');
        var name2 = document.createElement('div');
        
        content2.className = "content2";
        formcode2.className = "formcode2";
        name2.className = "name2";
        
        formcode2.innerHTML = arr[1][j].formcode2;
        name2.innerHTML = arr[1][j].name2;
        
        content2.appendChild(formcode2);
        content2.appendChild(name2);
        
        console.log(content2);
        
        allconfigList.appendChild(content2);
        
    }
     
 }
</script>
</head>

<body>

<div id="infoList">
<br> 1. 상단에 표시된 서식지 목록은 사용자가 지정한 서식지목록 입니다. <br> 2. 하단에 표시된 서식지 목록은 전체 서식지목록 입니다. <br> 3. 서식지 이동이 가능합니다.<br><br>
</div>
<div id="configList">
	<div class="config">
		<div style="width: 220px;">formcode</div>
		<div style="width: 120px;"> ~ </div>
		<div style="width: 220px;">name</div>
	</div>
</div>
<div id="allconfigList">
	<div class="allconfig">
		<div style="width: 220px;">formcode2</div>
		<div style="width: 120px;"> ~ </div>
		<div style="width: 220px;">name2</div>
	</div>
</div>
</body>
</html>