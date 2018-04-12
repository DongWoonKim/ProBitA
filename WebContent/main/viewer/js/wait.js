/**
 * 
 */
function waitPop() {
	   $(document).ready(function(){
			$(".waitView").toggle();
		});

	   var params='';
		myAjax({
			method:"POST",
			url:"../../wait.do",
			params:params,
			success:function(data){
				
				arr1=JSON.parse(data);		
				console.log(arr1);
				
				document.getElementsByClassName('waitViewList')[0].innerHTML='';
				waitViewList.innerHTML="";
				
				for(var i=0; i<arr1[0].length; i++){
					document.getElementsByClassName('waitViewList')[0].innerHTML += arr1[0][i].pname;
					document.getElementsByClassName('waitViewList')[0].innerHTML += '<br>';
				}
			}	
		});
   }