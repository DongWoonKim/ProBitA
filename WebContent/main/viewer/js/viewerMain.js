/**
 * 
 */

	
function searchInfo (info, type) {
	var params = {"info" : info, "type" : type};
	myAjax({
		method:"POST",
		url:"../../searchInfo.do",
		params:params,
		success: function (data) { 						 
			arr = JSON.parse(data);
			
			if(arr.length >=2 ) {					
				var popup = window.open("http://localhost:8080/Pra01/main/viewer/searchResult.jsp", "popup", "location=no, width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes");
				popup.arr = arr;
				
			} else {
				document.getElementById('pNumber').innerHTML = "환자번호 : " + arr[0].patId;
				document.getElementById('pName').innerHTML = "이름 : " + arr[0].patName;
				document.getElementById('pJumin').innerHTML = "주민번호 : " + arr[0].patJumin.slice(0,6) + "-" + arr[0].patJumin.slice(6,arr[0].patJumin.length);
				
				document.getElementById('hiddenPatId').value = arr[0].patId;
				document.getElementById('hiddenPatName').value = arr[0].patName;
				document.getElementById('hiddenPatJumin').value = arr[0].patJumin.slice(0,6) + "-" + arr[0].patJumin.slice(6,arr[0].patJumin.length);
				
			}
			
			
		}
	
	});
}

function makeNode() {
	
	
}