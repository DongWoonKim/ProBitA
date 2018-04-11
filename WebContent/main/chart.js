
var d = null; 

var params = '';
myAjax({
	method: "GET",
	url: "../treeMenu.do",
	params:params,
	success:function (data) {	 
		
		d = new dTree('d')
		
		var dtree = document.getElementById('dtree');
		var json = JSON.parse(data); 
		
		for (var i = 0; i < json.length; i++) {
			var id = json[i].id
			var pid = json[i].pid
			var name = json[i].name
			var url = json[i].url
			console.log(id, pid, name, url);
			d.add(id, pid, name, url)
		} 
		var template = ''; 
		template += '<p><a href="javascript: d.openAll();">open all</a> | <a href="javascript: d.closeAll();">close all</a></p>';
		template += d; 
		
		dtree.innerHTML = template;
	}
});