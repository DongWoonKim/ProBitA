/**
 * 
 */

var httpRequest = null;
function getHttpRequest () {
	if(window.ActiveXObject) {
		return new ActiveXObject("Microsoft.XMLHTTP");
	} else if (window.XMLHttpRequest) {
		return new XMLHttpRequest();
	} else {
		return null;
	}		
}

function sendProcess (method, url, params, callback) {
	
	httpRequest = getHttpRequest();
	httpRequest.onreadystatechange = callback;
	
	httpMethod = method.toUpperCase();
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
	
	httpUrl = url;
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