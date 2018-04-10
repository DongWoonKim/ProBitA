/**
 * wait
 */
var flag=false;

var arr = [];
var arr1= [];
var arr2= [];

 	 
	window.setInterval(function() {
		if(flag) {
			selectPatient();
		}
	}, 3000)

	function selectConfig(){
		window.open("http://localhost:8080/Pra01/main/config.jsp", "location=no","width=500, height=500, toolbar=no, menubar=no, scrollbars=no, resizable=yes" );  

	}
	function selectPatient() {		 
		var params='';
		flag = true;
		myAjax({
			method:"POST",
			url:"../wait.do",
			params:params,
			success:function(data){
				var viewList=document.getElementById('viewList');
				var waitingList=document.getElementById('waitingList');
				
				arr1=JSON.parse(data);			 
				
				viewList.innerHTML = "";
				//mainView.innerHTML = '';
				
				for(var i=0; i<arr1[0].length; i++) {
//					 <input type="text" name="" size="40" value="테두리 0px 로 설정" style="border: 0px;">
					var dd=document.createElement('input'); 
					dd.className="patientList";
					//dd.type="button";
					dd.type="text";
					dd.value=arr1[0][i].pname;				
					dd.style="background-color:transparent; display:inline-block; border:0px; font-size:20px; width:100%; padding:0px 10px 10px 10px ";
					dd.id= i;
						
					
					viewList.appendChild(dd);
						
					dd.onclick=function(){
						
						//viewList.removeChild(dd);
						waitingList.innerHTML=""; 
						mainView.innerHTML = '';
						
						var idx = this.id;
						waitingList.innerHTML = "";
						for(var j=0 ; j<arr1[1].length ; j++) {							
							if(arr1[0][idx].pname == arr1[1][j].name) {
								console.log(j);													
								var eqname = document.createElement('input');
								eqname.type = "button";
								eqname.id =  arr1[1][j].localpath;
								
								var eqsrc = arr1[1][j].localpath;
								eqsrc = eqsrc.replace("Pra01/images/","");
								eqsrc = eqsrc.replace(".jpg","");
								eqsrc = eqsrc.replace(".png","");
								eqname.value= eqsrc;
									
								waitingList.appendChild(eqname);
								
								eqname.onclick=function(){
									var mainView = document.getElementById('mainView');
	 								var mainImg = document.createElement('img');
									
	 								mainView.innerHTML = '';
									
	 								mainImg.src = this.id;
	 								mainImg.style.width ="210mm";
	 								mainImg.style.height ="297mm";
									
	 								mainView.appendChild(mainImg); 
								}
							}
						}
					}
				}
			}
		});
	}

	function selectPre() {
		var params='';
		flag = false;
		myAjax({
			method:"POST",
			url:"../pre.do",
			params:params,
			success:function(data){
				var viewList=document.getElementById('viewList');
				var waitingList=document.getElementById('waitingList');
				
				arr2=JSON.parse(data);
				console.log(arr2);
				
				viewList.innerHTML = "";
				waitingList.innerHTML="";
				mainView.innerHTML ="";
				
				for(var i=0; i<arr2.length; i++){
					mainView.innerHTML = '';
					var maindiv=document.createElement('input');
					var listdiv2=document.createElement('input');
					maindiv.type="button";
					maindiv.id=arr2[i].code+arr2[i].fullname+arr2[i].fullcount+arr2[i].counting+arr2[i].daycount;
					
					var mdvalue=arr2[i].code+arr2[i].fullname+arr2[i].fullcount+arr2[i].counting+arr2[i].daycount;
					mdvalue=mdvalue.replace(arr2[i].fullname,"");
					mdvalue=mdvalue.replace(arr2[i].fullcount,"");
					mdvalue=mdvalue.replace(arr2[i].counting,"");
					mdvalue=mdvalue.replace(arr2[i].daycount,"");
					
					maindiv.value=mdvalue;
					
					waitingList.appendChild(maindiv); 
					
					
					maindiv.onclick=function(){
						
						
						var mainView = document.getElementById('mainView');
						var listdiv=document.createElement('input');
						
						mainView.innerHTML = '';
						
						listdiv.type="text";
						listdiv.value=this.id; 

						
						mainView.appendChild(listdiv); 
					}
					
				} 
			}
		});
	} 
 


