window.openLayer = function(title, url, scroll, end) {
	return layer.open({
		type: 2,
		title: title,
		closeBtn: !0, 
		shade: [0.1],
		area: ['720px', '460px'],
		content: [url, scroll?'yes':'no'],
		end: end || function(){}
	});
}

window.post = function(url, data, sucCallback, errCallback) {
	$.ajax({
		type: 'POST',
		url: url,
		data: data,
		dataType: 'json',
		success: sucCallback || function(){},
		error: errCallback || function(){}
    });
}

window.laydateRender = function(elem, callback) {
	laydate.render({
	  	elem: elem,
		range: true,
		theme: '#393D49',
		done: function(value, date, endDate){
			callback && callback(value);
	  	}
	});
}

window.setCookie = function(name, value) {
	$.cookie(name, value, { expires: 1});
}

window.getCookie = function(name) {
	return $.cookie(name);
}

window.getCookieAndClean = function(name) {
	var value = getCookie(name);
	$.cookie(name, null, { expires: 0});
	return value;
}


