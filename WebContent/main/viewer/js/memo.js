/**
 * 
 */

function memoPop() {

	   $(document).ready(function(){
			$(".viewmemo").toggle();
			document.getElementsByClassName('viewmemo')[0].innerHTML='';
		});
	   
	   var text = document.getElementById('pNumber').innerHTML;
	   var patId = text.slice(7,text.length);
	   console.log(patId);
	    
	   var params={"patId" : patId};
	   myAjax({
	         method:"POST",
	         url:"../../memo.do",
	         params:params,
	         success: function (data) { 
	                   
	            var arr = JSON.parse(data);
	            //viewmemo.innerHTML="";
	            for(var i=0; i<arr.length; i++){
	            	document.getElementsByClassName('viewmemo')[0].innerHTML += arr[i].memo;
					document.getElementsByClassName('viewmemo')[0].innerHTML += '<br>';
	            }
	            
	            console.log(arr);
	         }
	   }); 
   }