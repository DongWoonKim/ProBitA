<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<jsp:include page="/side/sideBar.jsp"></jsp:include>
<link rel="stylesheet" href="/Pra01/side/sideBar.css" />

<script src="/Pra01/main/myAjax.js"></script>

</head>

<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" />
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/1.12.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
<link rel="stylesheet" href="css/viewerMain.css" />
<script src="js/viewerMain.js"></script>
<script src="js/memo.js"></script>
<script src="js/wait.js"></script>
<script>
	window.onload = function() {		
		
		var pNumberInput = document.getElementById('pNumberInput');
		
		
		var inputType = document.getElementById('inputType');
		

	
	//		$(function () { $('#listTree').jstree(); });
		
	//		$('#listTree').jstree();
		 
		pNumberInput.addEventListener("keydown", function(event) {
			if(event.keyCode == 13) {
				var info = pNumberInput.value;
				var type = inputType.options[inputType.selectedIndex].value;
				
				searchInfo(info, type);
				pNumberInput.value = ""; 
			}			
		});
		
		
		var compos = document.getElementsByClassName('menuListCompo');
		for(var i=0 ; i<compos.length ; i++) {
			compos[i].addEventListener("mousedown", function(event) {
				
				for(var j=0 ; j<compos.length ; j++) {
					compos[j].style.backgroundColor = "#FFFFFF";
					compos[j].style.color = "#000000";
				}				
				
				this.style.backgroundColor = "#838383";
				this.style.color = "#FFFFFF";
				
			})
		}
		
		var formType01 = document.getElementById('formType01');
		formType01.addEventListener("mousedown", function(event) {
			makeNode();
		})
		
		var formType02 = document.getElementById('formType02');
		formType02.addEventListener("mousedown", function(event) {
			makeNode();
		})
		
		
	}

</script>
<body>
  
<!-- 	hidden info -->
	<input type="hidden" id="hiddenPatId"/>
	<input type="hidden" id="hiddenPatName"/>
	<input type="hidden" id="hiddenPatJumin"/>
 
	<div class="viewerWrap">
		<div class="infoView"> 
			<div id="patientInfo" style="width: 100%; height: 100%;">
				<div id="pNumber" style="width: 15%; height: 100%;">환자번호 : ${patId }</div>
				<div id="pName" style="width: 17%; height: 100%;">이름 : ${patName}</div>
				<div id="pJumin" style="width: 15%; height: 100%;">주민번호 : ${patJumin }</div>
				<div id="userInfo" style="width: 35%; height: 100%; text-align: right;">${userId }</div>
			</div>			
		</div>	
		
		<div class="viewerMenu">
			<div class="pNumberSearch">
				
				<div>
					<select id="inputType" >
						<option value="patId">환자번호
						<option value="patName" >환자이름
					</select>
					<input type="text" id="pNumberInput" size="10"/>
				</div>
				
			</div>
			<div class="menuList">
				<div class="menuListCompo" style="padding-top: 37%;" id="formType01">외<br/>래</div>
				<div class="menuListCompo" style="padding-top: 37%;" id="formType02">입<br/>원</div>
				<div class="menuListCompo" style="padding-top: 37%;">서<br/>식</div>
				<div class="menuListCompo" style="padding-top: 37%;" onclick="memoPop()">메<br/>모</div>
				<div class="menuListCompo" onclick="waitPop()">대<br/>기<br/>환<br/>자</div>
				<div class="menuListCompo">환<br/>자<br/>검<br/>색</div>
			</div>
			<div id="listTree">
			
			</div>			
		</div>
		
		<div class="mainView">
			
		</div>
		
		<div class="viewmemo">
	      	<div></div>
	    </div>
      
      	<div class="waitView">
      		<div class="waitViewList"></div>
      	</div> 
		 
	</div>
</body>
</html>