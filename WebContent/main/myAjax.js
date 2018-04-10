/**
 * 
 */

function myAjax(options) {
	var httpRequest = null
	
	function getHttpRequest () {
		if(window.XMLHttpRequest) {
			return new XMLHttpRequest();		
		} else if (window.ActiveXObject) {
			return new ActiveXObject("Microsoft.XMLHTTP");
		} else {
			return null;
		}		
	}
	
	function sendProcess (method, url, params) {
		httpRequest = getHttpRequest();
		httpRequest.onreadystatechange = callBackFunction;
		
		var httpMethod = method.toUpperCase();
		if(httpMethod != 'GET' && httpMethod != 'POST')
			httpMethod = 'GET';
		
		var httpParams = "";
		if(params != null && params != ''){		
			for( var key in params) {
				if (httpParams != '') {
					httpParams += '&';
				} 
				httpParams += key + "=" + params[key];
			}		
			
		}
		
		var httpUrl = url;
		if(httpMethod == 'GET' && httpParams != '') {
			httpUrl = url + '?' + httpParams;
		}	
		
		//요청처리
		httpRequest.open(httpMethod, httpUrl, true);
		if(httpMethod == "POST") {
			httpRequest.setRequestHeader('Content-type', 'application/x-www-form-urlencoded');
		}
		httpRequest.send(httpMethod == 'GET' ? null : httpParams);
		
	}
	
	function callBackFunction () {
		if(httpRequest.readyState === 4) {
			if(httpRequest.status === 200) {
				// 응답데이터
				var result = httpRequest.responseText				
				options.success(result)
			}			 
		}	
	}
	
	sendProcess(options.method, options.url, options.params)
}