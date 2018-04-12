<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>  
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<link rel="stylesheet" href="/Pra01/side/sideBar.css" />
<link rel="stylesheet" href="/Pra01/main/chart.css" />  
<script src="/Pra01/main/myAjax.js"></script>
<script src="/Pra01/main/canvas.js"></script>
<script src="/Pra01/main/wait.js"></script>
<script src="/Pra01/main/chart.js"></script>
<jsp:include page="/side/sideBar.jsp"></jsp:include>
<script type="text/javascript" src="/Pra01/main/dtree.js"></script>
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<link rel="StyleSheet" href="/Pra01/main/dtree.css" type="text/css" />

<title>Insert title here</title> 
 
<script>
$(document).ready(function(){
	$("#memotoggle").click(function(){
		$("#memo").toggle();
	});
});


var patId;
var patName;
var patJumin;

var formCode;
var memo;

function Request(){
	var requestParam ="";
 
	//getParameter 펑션
	this.getParameter = function(param){
	//현재 주소를 decoding
//  	var url = unescape(location.href); 
 	var url = decodeURI(location.href); 
	console.log(url);
 	//파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
	var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
 
	for(var i = 0 ; i < paramArr.length ; i++){
		  var temp = paramArr[i].split("="); //파라미터 변수명을 담음
		
		  if(temp[0].toUpperCase() == param.toUpperCase()){
		    // 변수명과 일치할 경우 데이터 삽입
		    requestParam = paramArr[i].split("=")[1]; 
		    break;
		  }
		}
		return requestParam;
	}
}

function initCanvas () {
	// canvas
    var cnvs = document.getElementById('canvas');
    // context
    var ctx = canvas.getContext('2d');
    // 픽셀 정리
    ctx.clearRect(0, 0, cnvs.width, cnvs.height);
    // 컨텍스트 리셋
    ctx.beginPath();
    changeMode(4);
}
var arr = [];
window.onload = function() { 
 
	// Request 객체 생성
	var request = new Request(); 
	//환자 번호를 받아옴
	// Request 객체 생성
	var request = new Request();
	// 환자번호 파라미터 값을 얻기
	patId = request.getParameter("patId");
	patName = request.getParameter("patName");
	patJumin = request.getParameter("patJumin");
	
	console.log("patId : " + patId + " patName : " + patName + "patJumin" + patJumin)
	
	var templates = '<div>';
	templates += '<span>환자이름 : </span>';
	templates += patName;
	templates += '<span>생년월일 : </span>';
	templates += patJumin;
	templates += '<span>환자번호 : </span>';
	templates += patId;
	templates += '</div>'; 
	
	document.getElementById('waitingList').innerHTML = templates;
	
	//차트에 글쓰기 -- 캔버스
	picture.canvas = document.getElementById("canvas");	
	picture.context = picture.canvas.getContext("2d");	
	mouseListener();
	
	var chartForm = document.getElementById('chartForm');
	 
	for(var i = 0; i < chartForm.view2.length; i++) {		
		chartForm.view2[i].onclick=function() {
			if(this.value == 1) {
				var thumAjaxImages = document.getElementById('thumAjaxImages');
				thumAjaxImages.innerHTML = "";
			} else if(this.value == 2) {				 
				selectThumImages();
			} 
		}	
	}  
} 
function selectThumImages () {
	var params = '';
	myAjax({
		method:"POST",
		url:"../main.do",
		params:params,
		success: function (data) { 
			var thumAjaxImages = document.getElementById('thumAjaxImages');
					 
			arr = JSON.parse(data);
			
			thumAjaxImages.innerHTML = "";
			for(var i = 0; i < arr.length; i++) {
				var col = document.createElement('div');
				var imgBox = document.createElement('div');
				var img = document.createElement('img');
				 
			 
				col.className = 'col col-md-1-4';
				imgBox.className = 'img-box';
				
				img.src = arr[i].localPath;
				
				
				if(arr[i].localPath!='#') { 
					col.id = arr[i].formCode + arr[i].localPath;
					col.onclick = function () {	 
						var mainView = document.getElementById('mainView');
						var mainImg = document.createElement('img');
						
						formCode = this.id.slice(0,4); //formcode는 반드시 네자리인 경우.. 
						
						initCanvas();
						
						mainView.innerHTML = '';
						
						mainImg.src = this.id.slice(4, this.id.length);
						mainImg.style.width ="210mm";
						mainImg.style.height ="297mm";
						
						mainView.appendChild(mainImg);					
					}
					
					imgBox.appendChild(img);				 
					col.appendChild(imgBox);
					thumAjaxImages.appendChild(col);	 
				}
							
			}
		}
	});
} 

function Request(){
	 var requestParam ="";
	 
	 //getParameter 펑션
	  this.getParameter = function(param){
	  //현재 주소를 decoding
	  var url = unescape(location.href); 
	  //파라미터만 자르고, 다시 &그분자를 잘라서 배열에 넣는다. 
	   var paramArr = (url.substring(url.indexOf("?")+1,url.length)).split("&"); 
	 
	   for(var i = 0 ; i < paramArr.length ; i++){
	     var temp = paramArr[i].split("="); //파라미터 변수명을 담음
	 
	     if(temp[0].toUpperCase() == param.toUpperCase()){
	       // 변수명과 일치할 경우 데이터 삽입
	       requestParam = paramArr[i].split("=")[1]; 
	       break;
	     }
	   }
	   return requestParam;
	 }
	}

</script>
 
</head> 
<body>

	<div class="chartWrap">	
		<div id="chartMenu">		 	 
			<form id="chartForm" class="switch switch-blue">
		      <input type="radio" class="switch-input" name="view2" value="1" id="thumOff" checked>
		      <label for="thumOff" class="switch-label switch-label-off">비활성화</label>
		      <input type="radio" class="switch-input" name="view2" value="2" id="thumOn">
		      <label for="thumOn" class="switch-label switch-label-on">전체조회</label>
		      <span class="switch-selection"></span>
		    </form>
		</div>
		
		<div id="listView">
			<div id="dtree" class="dtree"></div>
		</div>
		
		<div id="thumView">	
			<div class="con">
			  <div id="thumAjaxImages" class="row"></div>			     
			</div>		 
		</div>
		<div id="waitingList">
							 
		</div>
		<div id="editorList">			 
 			<span id="mode"></span>
 			<input type="button" value="pen" onclick="changeMode(0)">
 			<input type="button" value="erase" onclick="changeMode(3)">
 			<input type="button" value="saveImg" onclick="save2()"/>
			<input type="button" value="메모" id="memotoggle" />
			<input type="button" value="상용구" onclick="#" />
			<input type="button" value="서식" onclick="#" />
			<input type="button" value="날짜" onclick="#" /> 			 
		</div>
		<div id="mainView"></div>	
		<canvas id="canvas" width="794" height="1123"></canvas>	
	</div> 
	
	<div id="userName">${userId}</div>
	
	<div id="listView2">
		<div id="listView2button" align="center">
			<span class="wait" onclick="selectPatient()">대기</span> 
			|
			<span class="pre" onclick="selectPre()">처방</span>
			|
			<span class="config" onclick="selectConfig()">설정</span>
		</div>
		<hr>
		<div id="viewList"></div>
	</div>
	<div id="memo" contenteditable="true"></div>
</body> 
</html>