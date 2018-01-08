function openTab(url, title, id) {
	var menuTabs = $(".J_menuTab", parent.document), k = true;
	menuTabs.each(function() {
		if ($(this).data("id") == url) {
			if (!$(this).hasClass("active")) {
				$(this).addClass("active").siblings(".J_menuTab").removeClass(
						"active");
				$(".J_mainContent .J_iframe", parent.document).each(function() {
					if ($(this).data("id") == url) {
						$(this).show().siblings(".J_iframe").hide();
						return false
					}
				})
			}
			k = false;
			return false
		}
	});
	if (k) {
		var p = '<a href="javascript:;" class="active J_menuTab" data-id="'
				+ url + '">' + title
				+ ' <i class="fa fa-times-circle"></i></a>';
		menuTabs.removeClass("active");
		var n = '<iframe class="J_iframe" name="iframe' + id
				+ '" width="100%" height="100%" src="' + url
				+ '" frameborder="0" data-id="' + url + '" seamless></iframe>';
		$(".J_mainContent", parent.document).find("iframe.J_iframe").hide()
				.parents(".J_mainContent").append(n);
		$(".J_menuTabs .page-tabs-content", parent.document).append(p);
		__zx__g($(".J_menuTab.active", parent.document))
	}
}

function __zx__f(l) {
	var k = 0;
	$(l).each(function() {
		k += $(this).outerWidth(true)
	});
	return k
}

function __zx__g(n) {
	var o = __zx__f($(n).prevAll()), q = __zx__f($(n).nextAll());
	var l = __zx__f($(".content-tabs", parent.document).children().not(
			".J_menuTabs"));
	var k = $(".content-tabs", parent.document).outerWidth(true) - l;
	var p = 0;
	if ($(".page-tabs-content", parent.document).outerWidth() < k) {
		p = 0
	} else {
		if (q <= (k - $(n).outerWidth(true) - $(n).next().outerWidth(true))) {
			if ((k - $(n).next().outerWidth(true)) > q) {
				p = o;
				var m = n;
				while ((p - $(m).outerWidth()) > ($(".page-tabs-content",
						parent.document).outerWidth() - k)) {
					p -= $(m).prev().outerWidth();
					m = $(m).prev()
				}
			}
		} else {
			if (o > (k - $(n).outerWidth(true) - $(n).prev().outerWidth(true))) {
				p = o - $(n).prev().outerWidth(true)
			}
		}
	}
	$(".page-tabs-content", parent.document).animate({
		marginLeft : 0 - p + "px"
	}, "fast")
}