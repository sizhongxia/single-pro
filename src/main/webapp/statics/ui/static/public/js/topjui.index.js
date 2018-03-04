// 首页加载完后，取消加载中状态
$(window).load(function () {
    $("#loading").fadeOut();
});

// 全屏切换
var isFullScreen = false;
var App = function () {
    var setFullScreen = function () {
        var de = document.documentElement;
        if (de.requestFullscreen) {
            de.requestFullscreen();
        } else if (de.mozRequestFullScreen) {
            de.mozRequestFullScreen();
        } else if (de.webkitRequestFullScreen) {
            de.webkitRequestFullScreen();
        }
        else {
            App.alert({message: "该浏览器不支持全屏！", type: "danger"});
        }
    };

    //退出全屏 判断浏览器种类
    var exitFullScreen = function () {
        // 判断各种浏览器，找到正确的方法
        var exitMethod = document.exitFullscreen || //W3C
            document.mozCancelFullScreen ||    //Chrome等
            document.webkitExitFullscreen || //FireFox
            document.webkitExitFullscreen; //IE11
        if (exitMethod) {
            exitMethod.call(document);
        }
        else if (typeof window.ActiveXObject !== "undefined") {//for Internet Explorer
            var wscript = new ActiveXObject("WScript.Shell");
            if (wscript !== null) {
                wscript.SendKeys("{F11}");
            }
        }
    };

    return {
        init: function () {

        },
        handleFullScreen: function () {
            if (isFullScreen) {
                exitFullScreen();
                isFullScreen = false;
            } else {
                setFullScreen();
                isFullScreen = true;
            }
        }
    };
};

$(function () {

    // 折叠显示左侧菜单
    $(".collapseMenu").on("click", function () {
        var p = $("#index_layout").iLayout("panel", "west")[0].clientWidth;
        if (p > 0) {
            $('#index_layout').iLayout('collapse', 'west');
            $(this).children('span').removeClass('fa-chevron-circle-left').addClass('fa-chevron-circle-right');
        } else {
            $('#index_layout').iLayout('expand', 'west');
            $(this).children('span').removeClass('fa-chevron-circle-right').addClass('fa-chevron-circle-left');
        }
    });

    // 首页tabs选项卡功能
    var index_tabs = $('#index_tabs').iTabs({
        fit: true,
        tools: [{ //返回首页的图标和执行方法
            iconCls: 'fa fa-home',
            handler: function () {
                $('#index_tabs').iTabs('select', 0);
            }
        }, { //刷新页面的图标和执行方法
            iconCls: 'fa fa-refresh',
            handler: function () {
                var refresh_tab = $('#index_tabs').iTabs('getSelected');
                var refresh_iframe = refresh_tab.find('iframe')[0];
                refresh_iframe.contentWindow.location.href = refresh_iframe.src;
                //$('#index_tabs').trigger(TOPJUI.eventType.initUI.base);
                //var index = $('#index_tabs').iTabs('getTabIndex', $('#index_tabs').iTabs('getSelected'));
                //console.log(index);
                //$('#index_tabs').iTabs('getTab', index).iPanel('refresh');
            }
        }, { //关闭当前页的图标和执行方法
            iconCls: 'fa fa-close',
            handler: function () {
                var index = $('#index_tabs').iTabs('getTabIndex', $('#index_tabs').iTabs('getSelected'));
                var tab = $('#index_tabs').iTabs('getTab', index);
                if (tab.iPanel('options').closable) {
                    $('#index_tabs').iTabs('close', index);
                }
            }
        }, { //全部切换的图标和执行方法
            iconCls: 'fa fa-arrows-alt',
            handler: function () {
                App().handleFullScreen();
            }
        }],
        //监听右键事件，创建右键菜单
        onContextMenu: function (e, title, index) {
            e.preventDefault();
            if (index >= 0) {
                $('#mm').iMenu('show', {
                    left: e.pageX, //点击右键处离页面左侧距离
                    top: e.pageY //点击右键处离页面顶部距离
                }).data("tabTitle", title);
            }
        }
    });

    // tab右键菜单
    $("#mm").iMenu({
        onClick: function (item) {
            tabMenuOprate(this, item.name);
        }
    });

    // 初始化accordion
    $("#RightAccordion").iAccordion({
        fit: true,
        border: false
    });

    // 加载应用
    $.ajax({
        url: remoteHost + '/system/apps',
        type: 'get',
        cache: false,
        beforeSend: function () {
            $.iMessager.progress({
                text: '正在加载用户授权应用数据.。。'
            });
        },
        success: function (data, response, status) {
            if (data.statusCode == 200) {
            	var tds = '';
            	data.data.forEach(function(value,index,array){
            		 tds += '<td id="' + value.id + '" title="' + value.name + '" class="topmenu ' + (index == 0 ? 'selected' : '') + ' systemName"><a class="l-btn-text bannerMenu" href="javascript:void(0)"><p><lable class="' + value.icon + '"></lable></p><p><span style="white-space:nowrap;">' + value.name + '</span></p></a></td>';
            	});
            	$("#topmenucontent").html(tds);
            	setTimeout(function(){
            		 // 绑定横向导航菜单点击事件
            	    $(".systemName").on("click", function (e) {
            	        generateMenu($(this).attr("id"), $(this).attr("title"));
            	        $(".systemName").removeClass("selected");
            	        $(this).addClass("selected");
            	    });
            	    // 主页打开初始化时显示第一个系统的菜单（切记要放在上面那个绑定事件之后，不然模拟点击也是无效的）
            	    $('.systemName').eq('0').trigger('click');
            	    
            	    $.iMessager.progress('close');
            	}, 50)
            } else {
        	    $.iMessager.progress('close');
                $.iMessager.alert('操作失败！', '未知错误，请重试！', 'messager-error');
            }
        }
    });
    

    // 显示系统首页
    /*setTimeout(function () {
     var indexTab = [];
     indexTab.iconCls = "icon-house";
     indexTab.text = "系统门户";
     var portal = $.getUrlParam("portal");
     if (portal == "system" || portal == null) portal = "system";
     indexTab.url = "html/portal/index.html";
     indexTab.closable = false;
     indexTab.border = false;
     addTab(indexTab);
     }, 1);*/


	  //修改密码窗口
	  $('#pwdDialog').iDialog({buttons: [{
	      text: '提交修改',
	      iconCls: 'fa fa-save',
	      btnCls: 'topjui-btn-green',
	      handler: function () {
	          if ($('#pwdDialog').form('validate')) {
                  var formData = $("#pwdDialog").serialize();
                  $.ajax({
                      url: remoteHost + '/user/updatePwd',
                      type: 'post',
                      cache: false,
                      data: formData,
                      beforeSend: function () {
                          $.iMessager.progress({
                              text: '正在操作...'
                          });
                      },
                      success: function (data, response, status) {
                          $.iMessager.progress('close');
                          if (data.statusCode == 200) {
                              $.iMessager.show({
                                  title: '提示',
                                  msg: '操作成功'
                              });
                              $("#pwdDialog").iDialog('close').form('reset');
                          } else if (data.statusCode == 0) {
                        	  $.iMessager.show({
                                  title: '提示',
                                  msg: '操作成功，新密码和原密码相同未做修改'
                              });
                              $("#pwdDialog").iDialog('close').form('reset');
                          } else {
                              $.iMessager.alert('操作失败！', data.errMsg , 'messager-error');
                          }
                      }
                  });
	          }
	      }}],
	      onOpen: function () {
	          $(this).panel('refresh');
	      }
	  });
});

// 右键菜单对应操作
function tabMenuOprate(menu, type) {
    var allTabs = $('#index_tabs').iTabs('tabs');
    var allTabtitle = [];
    $.each(allTabs, function (i, n) {
        var opt = $(n).iPanel('options');
        if (opt.closable)
            allTabtitle.push(opt.title);
    });
    var curTabTitle = $(menu).data("tabTitle");
    var curTabIndex = $('#index_tabs').iTabs("getTabIndex", $('#index_tabs').iTabs("getTab", curTabTitle));
    switch (type) {
        case "1"://关闭当前
            if (curTabIndex > 0) {
                $('#index_tabs').iTabs("close", curTabTitle);
                return false;
                break;
            } else {
                $.iMessager.show({
                    title: '操作提示',
                    msg: '首页不允许关闭！'
                });
                break;
            }
        case "2"://全部关闭
            for (var i = 0; i < allTabtitle.length; i++) {
                $('#index_tabs').iTabs('close', allTabtitle[i]);
            }
            break;
        case "3"://除此之外全部关闭
            for (var i = 0; i < allTabtitle.length; i++) {
                if (curTabTitle != allTabtitle[i])
                    $('#index_tabs').iTabs('close', allTabtitle[i]);
            }
            $('#index_tabs').iTabs('select', curTabTitle);
            break;
        case "4"://当前侧面右边
            for (var i = curTabIndex; i < allTabtitle.length; i++) {
                $('#index_tabs').iTabs('close', allTabtitle[i]);
            }
            $('#index_tabs').iTabs('select', curTabTitle);
            break;
        case "5": //当前侧面左边
            for (var i = 0; i < curTabIndex - 1; i++) {
                $('#index_tabs').iTabs('close', allTabtitle[i]);
            }
            $('#index_tabs').iTabs('select', curTabTitle);
            break;
        case "6": //刷新
            var refresh_tab = $('#index_tabs').iTabs('getSelected');
            var refresh_iframe = refresh_tab.find('iframe')[0];
            refresh_iframe.contentWindow.location.href = refresh_iframe.src;
            break;
        case "7": //在新窗口打开
            var refresh_tab = $('#index_tabs').iTabs('getSelected');
            var refresh_iframe = refresh_tab.find('iframe')[0];
            window.open(refresh_iframe.src);
            break;
    }

}

// todo
function findTabElement(target) {
    var $ele = $(target);
    if (!$ele.is("a")) {
        $ele = $ele.parents("a.menu_tab");
    }
    return $ele;
}

// 保存页面id的field
var pageIdField = "data-pageId";

function getPageId(element) {
    if (element instanceof jQuery) {
        return element.attr(pageIdField);
    } else {
        return $(element).attr(pageIdField);
    }
}

function findTabTitle(pageId) {
    var $ele = null;
    $(".page-tabs-content").find("a.menu_tab").each(function () {
        var $a = $(this);
        if ($a.attr(pageIdField) == pageId) {
            $ele = $a;
            return false;//退出循环
        }
    });
    return $ele;
}

function getTabUrlById(pageId) {
    var $iframe = findIframeById(pageId);
    return $iframe[0].contentWindow.location.href;
}

function getTabUrl(element) {
    var pageId = getPageId(element);
    getTabUrlById(pageId);
}

function findTabPanel(pageId) {
    var $ele = null;
    $("#index_tabs").find("div.tab-pane").each(function () {
        var $div = $(this);
        if ($div.attr(pageIdField) == pageId) {
            $ele = $div;
            return false;//退出循环
        }
    });
    return $ele;
}

function findIframeById(pageId) {
    return findTabPanel(pageId).children("iframe");
}

function getActivePageId() {
    var $a = $('.page-tabs-content').find('.active');
    return getPageId($a);
}

//激活Tab,通过id
function activeTabByPageId(pageId) {
    $(".menu_tab").removeClass("active");
    $("#index_tabs").find(".active").removeClass("active");
    //激活TAB
    var $title = findTabTitle(pageId).addClass('active');
    findTabPanel(pageId).addClass("active");
    // scrollToTab($('.menu_tab.active'));
    scrollToTab($title[0]);
}

// 退出系统
function logout() {
    $.iMessager.confirm('提示', '确定要退出吗?', function (r) {
        if (r) {
            $.iMessager.progress({
                text: '正在退出中...'
            });
            setTimeout(function(){
            	window.location.href = remoteHost + '/logout';
            }, 200)
        }
    });
}

// 生成左侧导航菜单
function generateMenu(appId, systemName) {
    if (appId == "") {
        $.iMessager.show({title: '操作提示', msg: '还未设置该系统对应的菜单ID！'});
    } else {
        // $(".webname").children('span').eq(1).html(systemName); //设置显示系统名称标题
        $(".panel-header .panel-title:first").html(systemName);
        // 获取现有的菜单panel，并循环删除
        var allPanel = $("#RightAccordion").iAccordion('panels');
        var size = allPanel.length;
        if (size > 0) {
            for (i = 0; i < size; i++) {
                var index = $("#RightAccordion").iAccordion('getPanelIndex', allPanel[i]);
                $("#RightAccordion").iAccordion('remove', 0);
            }
        }
        // 定义新增菜单panel的数据json地址，并循环添加
        var url = remoteHost + "/system/menus";
        $.get(
            url, {"appId": appId}, // 获取第一层目录
            function (data) {
                if (data.statusCode == -1) {
                	console.error('提示', '菜单:' + systemName + ', ' + data.errMsg);
                } else if (data.statusCode == 200) {
	                $.each(data.data, function (i, e) {// 循环创建手风琴的项
	                    var pid = e.pid;
	                    var isSelected = i == 0 ? true : false; //索引为0的默认展开
	                    $('#RightAccordion').iAccordion('add', {
	                        fit: false,
	                        title: e.text,
	                        content: "<ul id='tree" + e.id + "' ></ul>", //设置一级菜单ul的id值为tree + ‘json中自定义的对应id’
	                        border: false,
	                        selected: isSelected,
	                        iconCls: e.iconCls
	                    });
	                    $.parser.parse();
	                    $.get(url,{menuId: e.id}, function (data) {// 循环创建树的项\
	                    	if(data.statusCode == 200) {
		                        $("#tree" + e.id).tree({
		                            data: data.data,
		                            lines: false,
		                            animate: true,
		                            onClick: function (node) {
		                                if (node.url) {
		                                    addTab(node);
		                                } else {
		                                    if (node.state == "closed") {
		                                        $("#tree" + e.id).tree('expand', node.target);
		                                    } else if (node.state == 'open') {
		                                        $("#tree" + e.id).tree('collapse', node.target);
		                                    }
		                                }
		                            }
		                        });
	                    	} else {
	                        	console.error('提示', '菜单:' + e.text + ', ' + data.errMsg);
	                    	}
	                    }, 'json');
	                });
                }
            }, "json"
        );
    }
}

//打开Tab窗口
function addTab(params) {
    var iframe = '<iframe src="' + params.url + '" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>';
    var t = $('#index_tabs');
    var $selectedTab = t.iTabs('getSelected');
    var selectedTabOpts = $selectedTab.iPanel('options');
    var opts = {
        id: getRandomNumByDef(),
        refererTab: {},
        title: params.text,
        closable: typeof(params.closable) != "undefined" ? params.closable : true,
        iconCls: params.iconCls ? params.iconCls : 'fa fa-file-text-o',
        content: iframe,
        //href: params.url,
        border: params.border || true,
        fit: true
        //cls: 'leftBottomBorder'
    };
    if (t.iTabs('exists', opts.title)) {
        t.iTabs('select', opts.title);
    } else {
        var lastMenuClickTime = $.cookie("menuClickTime");
        var nowTime = new Date().getTime();
        if ((nowTime - lastMenuClickTime) >= 600) {
            $.cookie("menuClickTime", new Date().getTime());
            t.iTabs('add', opts);
        } else {
            $.iMessager.show({
                title: '温馨提示',
                msg: '操作过快，请重新打开' + opts.title + '标签页！'
            });
        }
    }
}

function addParentTab(options) {
    var src, title;
    src = options.href;
    title = options.title;

    var iframe = '<iframe src="' + src + '" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>';
    parent.$('#index_tabs').iTabs("add", {
        title: title,
        content: iframe,
        closable: true,
        iconCls: 'fa fa-th',
        border: true
    });
}


function modifyPwd() {
    $("#pwdDialog").iDialog('open');
};
