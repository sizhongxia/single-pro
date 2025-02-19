
function loadGrid(a) {
    "datagrid" == $.cookie("gridType") ? $("#" + $.cookie("gridId")).datagrid("load", {
        advanceFilter: JSON.stringify(a)
    }) : "treegrid" == $.cookie("gridType") && $("#" + $.cookie("gridId")).treegrid("load", {
        advanceFilter: JSON.stringify(a)
    })
}
function subString(a, b, c) {
    return void 0 != a ? a.substring(b, c) : ""
}
function loadMask() {
    var a = '<div id="Loading" class="loading-wrap">';
    a += '<div class="loading-content">',
    a += '<div class="loading-round">',
    a += "</div>",
    a += '<div class="loading-dot">',
    a += "</div>",
    a += "</div>",
    a += "</div>",
    $("body").append(a)
}
function hiddenMask() {
    $("#Loading").fadeOut("normal")
}
function showMask() {
    $("#Loading").fadeIn()
}
function selectAllOptions(a) {
    $(a + " option").attr("selected", !0)
}
function executeCallBackFun(functionStr, options) {
    if (void 0 != functionStr) {
        for (var handlerBeforeArr = functionStr.split("|"), handlerBeforeParamsArr = handlerBeforeArr[1].split(","), handlerBeforeParams = "", h = 0; h < handlerBeforeParamsArr.length; h++) handlerBeforeParams += handlerBeforeParamsArr[h].indexOf("options.") > -1 ? handlerBeforeParamsArr[h] + "," : '"' + handlerBeforeParamsArr[h] + '",';
        eval(handlerBeforeArr[0] + "(" + handlerBeforeParams.substr(0, handlerBeforeParams.length - 1) + ")")
    }
}
function isMultiArr(a) {
    if (!a) return !1;
    for (var b = 0; b < a.length; b++) return a[b] instanceof Array
}
function isMultiObj(a) {
    if (!a) return !1;
    for (var b = 0; b < a.length; b++) return "object" == typeof a[b]
}
function bytesToSize(a, b) {
    if (null == b && (b = 2), 0 === a) return "0 B";
    var c = 1024,
        d = ["B", "KB", "MB", "GB", "TB", "PB", "EB", "ZB", "YB"],
        e = Math.floor(Math.log(a) / Math.log(c));
    return (a / Math.pow(c, e)).toFixed(b) + " " + d[e]
}
function appendUrlParam(a, b) {
    return a.indexOf("?") == -1 ? a + "?" + b : a + "&" + b
}
function appendSourceUrlParam(a) {
    return a.indexOf("?") == -1 ? a + location.search : a + location.search.replace("?", "&")
}
function getCurrentDatetime(a) {
    var b = new Date;
    return timestamp2Datetime(b, a)
}
function timestamp2Datetime(a, b) {
    var c, d = new Date(a),
        e = d.getFullYear(),
        f = d.getMonth() + 1 < 10 ? "0" + (d.getMonth() + 1) : d.getMonth() + 1,
        g = d.getDate() < 10 ? "0" + d.getDate() : d.getDate(),
        h = d.getHours() < 10 ? "0" + d.getHours() : d.getHours(),
        i = d.getMinutes() < 10 ? "0" + d.getMinutes() : d.getMinutes(),
        j = d.getSeconds() < 10 ? "0" + d.getSeconds() : d.getSeconds();
    return c = "YmdHis" == b ? e + "" + f + g + h + i + j : "Y-m-d H:i:s" == b ? e + "-" + f + "-" + g + " " + h + ":" + i + ":" + j : "Y-m-d" == b ? e + "-" + f + "-" + g : e + "-" + f + "-" + g + " " + h + ":" + i
}
function getUrl(a) {
    var b, c = window.location.pathname;
    return b = "controller" == a ? c.substring(0, c.lastIndexOf("/") + 1) : c
}
function getOptionsJson(a) {
    var b = a.data();
    return b = b.options ? 0 == b.options.indexOf("{") ? $.parseJSON(b.options.replace(/'/g, '"')) : strToJson("{" + b.options.replace(/'/g, '"') + "}") : {}
}
function setId(a, b) {
    $(a);
    return void 0 == b.id && (b.id = getRandomNumByDef()),
    a.id = b.id,
    b
}
function convertDateToFullDate(a) {
    return (a < 10 ? "0" : "") + a
}
function isNull(a) {
    return "" == a || void 0 == a || null == a
}
function getSelectedRowJson(a, b) {
    var c = {};
    if (a) for (var d = a.split(","), e = 0; e < d.length; e++) if (d[e].indexOf(":") == -1) c[d[e]] = b[d[e]];
    else {
        var f = d[e].split(":");
        c[f[0]] = b[f[1]]
    }
    return c
}
function setGridQueryParams(a, b, c) {
    var d = $("#" + a.id),
        e = d[a.type]("getSelected");
    if (e) {
            var f = getSelectedRowJson(a.param, e),
                g = {};
            $("#" + c)[b]("options").queryParams = $.extend({}, g, f)
        }
}
function setPanelQueryParams(a, b) {
    var c = $("#" + b.id),
        d = c[b.type]("getSelected");
    return d ? replaceUrlParamValueByBrace(a, d) : a
}
function param2JsonObj(a) {
    var b = {};
    if (a) for (var c = a.split(","), d = 0; d < c.length; d++) if (c[d].indexOf(":") == -1) b[c[d]] = c[d];
    else {
        var e = c[d].split(":");
        b[e[0]] = e[1]
    }
    return b
}
function strToJson(str) {
    var json = eval("(" + str + ")");
    return json
}
function jsonLength(a) {
    var b, c = 0;
    for (b in a) a.hasOwnProperty(b) && c++;
    return c
}
function getTimestamp() {
    return (new Date).getTime()
}
function getRandomNum(a, b) {
    switch (arguments.length) {
    case 1:
        return parseInt(Math.random() * a + 1);
    case 2:
        return parseInt(Math.random() * (b - a + 1) + a);
    default:
        return 0
    }
}
function getRandomNumByDef() {
    return getRandomNum(1e5, 999999)
}
function arrayContain(a, b) {
    for (var c = 0; c < a.length; c++) if (a[c] == b) return !0;
    return !1
}
function getTabWindow() {
    var a = null;
    if (topJUI.config.aloneUse) a = window;
    else {
        var b = parent.$("#index_tabs").tabs("getSelected");
        b && b.find("iframe").length > 0 && (a = b.find("iframe")[0].contentWindow)
    }
    return a
}
function showMask() {
    $('<div class="datagrid-mask"></div>').css({
        display: "block",
        width: "100%",
        height: $(window).height()
    }).appendTo("body"),
    $('<div class="datagrid-mask-msg"></div>').html("正在处理，请稍候...").appendTo("body").css({
        display: "block",
        left: ($(document.body).outerWidth(!0) - 190) / 2,
        top: ($(window).height() - 45) / 2
    })
}
function hideMask() {
    $(".datagrid-mask").remove(),
    $(".datagrid-mask-msg").remove()
}
function addTab(a) {
    var b = '<iframe src="' + a.url + '" scrolling="auto" frameborder="0" style="width:100%;height:100%;"></iframe>',
        c = $("#index_tabs"),
        d = {
            id: Math.random(),
            title: a.text,
            closable: "undefined" == typeof a.closable || a.closable,
            iconCls: a.iconCls ? a.iconCls : "fa fa-page",
            content: b,
            border: a.border || !1,
            fit: !0
        };
    if (c.tabs("exists", d.title)) c.tabs("select", d.title);
    else {
            var e = $.cookie("menuClickTime"),
                f = (new Date).getTime();
            f - e >= 1e3 ? ($.cookie("menuClickTime", (new Date).getTime()), c.tabs("myAdd", d)) : $.messager.show({
                    title: "温馨提示",
                    msg: "操作过快，请稍后重试！"
                })
        }
}
function getSelectedTabOpts(a) {
    var b = a.iTabs("getSelected"),
        c = b.panel("options");
    return c
}
function bindMenuClickEvent(a, b) {
    var c = $(b.extend),
        d = {};
    c.length > 0 && (d = getOptionsJson(c)),
    b = $.extend(!0, d, b);
    var e = {};
    return "openDialog" == b.method ? (e = {}, b.dialog.width = b.dialog.width ? b.dialog.width : 430, b.dialog.height = b.dialog.height ? b.dialog.height : 450, b = $.extend({}, b, e)) : "openTab" == b.method ? (e = {
            iconCls: "fa fa-th"
        }, b = $.extend(e, b)) : "openWindow" == b.method ? (e = {
            iconCls: "fa fa-link"
        }, b = $.extend(b, e)) : "edatagrid" == b.method ? (e = {
            iconCls: "fa fa-plus"
        }, b = $.extend(e, b)) : "doAjax" == b.method || "request" == b.method || ("delete" == b.method ? (e = {
            iconCls: "fa fa-trash"
        }, b = $.extend(b, e)) : "filter" == b.method ? (e = {
            iconCls: "fa fa-filter"
        }, b = $.extend(b, e)) : "search" == b.method ? (e = {
            iconCls: "fa fa-search"
        }, b = $.extend(b, e)) : "export" == b.method ? (e = {
            iconCls: "fa fa-file-excel-o"
        }, b = $.extend(b, e)) : "import" == b.method && (e = {
            iconCls: "fa fa-cloud-upload",
            href: "/system/excel/excelImport"
        }, b = $.extend(b, e))),
    b
}
function openDialogAndloadDataByParentGrid(a) {
    var b = "",
        c = "";
    "object" == typeof a.parentGrid && (b = a.parentGrid.unselectedMsg, c = a.parentGrid.param, "datagrid" == a.parentGrid.type || "treegrid" == a.parentGrid.type);
    var d = getSelectedRowData(a.parentGrid.type, a.parentGrid.id);
    if (!d) return void $.messager.alert(topJUI.language.message.title.operationTips, a.parentGrid.unselectedMsg || topJUI.language.message.msg.selectParentGrid, topJUI.language.message.icon.warning);
    if (!a.dialog.beforeOpenCheckUrl || beforeOpenCheck(replaceUrlParamValueByBrace(a.dialog.beforeOpenCheckUrl, d))) {
            var e = $("#" + a.dialog.id);
            e.iDialog(a.dialog);
            var f = a.dialog.href,
                g = f;
            if (a.dialog.href.indexOf("{") != -1) {
                    if (a.dialog.href.indexOf("{parent.") != -1 && (g = replaceUrlParamValueByBrace(appendSourceUrlParam(f), d, "parent")), g.indexOf("{") != -1) {
                        var h = getSelectedRowData(a.grid.type, a.grid.id);
                        g = replaceUrlParamValueByBrace(appendSourceUrlParam(g), h)
                    }
                    e.iDialog({
                        href: g
                    }),
                    e.iDialog("open")
                } else e.iDialog("open")
        }
}
function openDialogAndloadDataByUrl(a) {
    var b = getSelectedRowData(a.grid.type, a.grid.id);
    if (!b) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectSelfGrid, topJUI.language.message.icon.warning);
    if (!a.dialog.beforeOpenCheckUrl || beforeOpenCheck(replaceUrlParamValueByBrace(a.dialog.beforeOpenCheckUrl, b))) {
        var c = $("#" + a.dialog.id);
        c.iDialog(a.dialog);
        var d = a.dialog.href;
        if (a.dialog.href.indexOf("{") != -1) {
            var e = replaceUrlParamValueByBrace(appendSourceUrlParam(d), b);
            c.dialog({
                href: e
            }),
            c.dialog("open")
        } else c.dialog("open")
    }
}
function dialogHandler(a) {
    "loadData" == a.component ? editHandler(a) : "loadParentData" == a.action ? addChildHandler(a) : addHandler(a)
}
function addHandler(a) {
    var b = (getUrl("controller"), {
        gridId: "datagrid"
    });
    a = $.extend(b, a);
    var c = $("#" + a.dialogId);
    c.dialog({
        iconCls: "fa fa-plus",
        toolbar: "#" + a.dialogId + "-toolbar",
        buttons: "#" + a.dialogId + "-buttons"
    }),
    void 0 != a.dialogHref && c.dialog("refresh", a.dialogHref),
    c.dialog("open")
}
function authCheck(a) {
    if ("" == topJUI.config.authUrl) return !0;
    var b = !1;
    return $.ajax({
        type: "post",
        url: "/system/authAccess/getAuthByRoleIdAndUrl",
        data: {
            url: a
        },
        async: !1,
        success: function (a) {
            if (0 == a) {
                var c = {
                    title: topJUI.language.message.title.operationTips,
                    msg: topJUI.language.message.msg.permissionDenied,
                    icon: topJUI.language.message.icon.warning
                };
                $.messager.alert(c),
                b = !1
            } else b = !0
        }
    }),
    b
}
function beforeOpenCheck(a) {
    var b = !1;
    return $.ajax({
        type: "get",
        url: a,
        async: !1,
        success: function (a) {
            if (a.statusCode == topJUI.config.statusCode.failure) {
                var c = {
                    title: topJUI.language.message.title.operationTips,
                    msg: a.message
                };
                $.messager.alert(c),
                b = !1
            } else b = !0
        }
    }),
    b
}
function addChildHandler(a) {
    var b = $("#" + a.parentGridId).treegrid("getSelected") ? $("#" + a.parentGridId).treegrid("getSelected") : $("#" + a.parentGridId).datagrid("getSelected");
    if (b) {
        var c = getUrl("controller"),
            d = {
                gridId: "datagrid",
                dialogHref: a.dialogHref ? a.dialogHref : c + "edit"
            };
        a = $.extend(d, a);
        var e = $("#" + a.dialogId);
        e.dialog({
                iconCls: "fa fa-plus",
                toolbar: "#" + a.dialogId + "-toolbar",
                buttons: "#" + a.dialogId + "-buttons"
            }),
        void 0 != a.dialogHref && e.dialog("refresh", a.dialogHref),
        e.dialog("open"),
        setTimeout(function () {
                $("#" + a.dialogId + " iframe").each(function (a) {
                    this.contentWindow.document.body.innerHTML = ""
                });
                var c = {};
                if (a.gridParam) for (var d = a.gridParam.split(","), f = 0; f < d.length; f++) c[d[f]] = b[d[f]];
                c.puuid = b.uuid,
                e.form("load", c)
            }, 500)
    } else $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectParentGrid, topJUI.language.message.icon.warning)
}
function editHandler(a) {
    var b = getUrl("controller"),
        c = {
            gridId: "datagrid",
            dialogHref: a.dialogHref ? a.dialogHref : b + "edit",
            dialogUrl: a.dialogUrl ? a.dialogUrl : b + "getDetailByUuid?uuid={uuid}"
        };
    a = $.extend(c, a),
    loadDialogData(a)
}
function getCheckedRowsData(a, b) {
    var c = $("#" + b).treegrid("getChecked");
    return c
}
function uncheckedAlert(a) {
    $.messager.alert(topJUI.language.message.title.operationTips, a.grid.uncheckedMsg, topJUI.language.message.icon.warning)
}
function unselectedAlert(a) {
    $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectSelfGrid, topJUI.language.message.icon.warning)
}
function getSelectedRowData(a, b) {
    return getRowsDataBySelected(a, b, !1)
}
function getSelectedRowsData(a, b) {
    return getRowsDataBySelected(a, b, !0)
}
function getRowsDataBySelected(a, b, c) {
    var d;
    return "datagrid" == a ? d = c ? $("#" + b).datagrid("getSelections") : $("#" + b).datagrid("getSelected") : "treegrid" == a && (d = c ? $("#" + b).treegrid("getSelections") : $("#" + b).treegrid("getSelected")),
    d
}
function getRowsDataBySelected2(a, b) {
    var c, d;
    return "object" == typeof a.parentGrid ? (d = a.parentGrid.id, "datagrid" == a.parentGrid.type ? c = b ? $("#" + d).datagrid("getSelections") : $("#" + d).datagrid("getSelected") : "treegrid" == a.parentGrid.type && (c = b ? $("#" + d).treegrid("getSelections") : $("#" + d).treegrid("getSelected"))) : "object" == typeof a.grid && (d = a.grid.id, "datagrid" == a.grid.type ? c = b ? $("#" + d).datagrid("getSelections") : $("#" + d).datagrid("getSelected") : "treegrid" == a.grid.type && (c = b ? $("#" + d).treegrid("getSelections") : $("#" + d).treegrid("getSelected"))),
    c
}
function refreshGrids(a) {
    if ("object" == typeof a) for (var b = 0; b < a.length; b++) {
        var c = a[b];
        !
        function (a) {
            setTimeout(function () {
                refreshGrid(c.type, c.id, c.clearQueryParams)
            }, 100 * a)
        }(b)
    }
}
function refreshGrid(a, b, c) {
    var d = $("#" + b);
    if ("datagrid" == a) 1 == c && d[a]({
        queryParams: {
            clearQueryParams: ""
        }
    }),
    d[a]("reload");
    else if ("treegrid" == a) for (var e = d[a]("getRoot"), f = d[a]("getData", e), g = 0; g < f.length; g++) d[a]("reload", f[g].id);
    d[a]("unselectAll"),
    d[a]("uncheckAll")
}
function loadGridByQueryParm(a, b, c) {
    "datagrid" == a ? ($("#" + b).datagrid("load", c), $("#" + b).datagrid("unselectAll")) : "treegrid" == a && ($("#" + b).treegrid("load", c), $("#" + b).treegrid("unselectAll"))
}
function doAjaxHandler(a) {
    var b = $.data(a, "menubutton").options,
        c = {
            gridId: "datagrid",
            iconCls: "fa fa-cog",
            confirmMsg: topJUI.language.message.msg.confirmMsg,
            grid: {
                reload: !0,
                uncheckedMsg: topJUI.language.message.msg.checkSelfGrid
            }
        };
    if (b = $.extend(!0, c, b), b.url = appendSourceUrlParam(b.url), b.url.indexOf("{parent") != -1) {
            var d = getSelectedRowData(b.parentGrid.type, b.parentGrid.id);
            if (!d) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectParentGrid, topJUI.language.message.icon.warning);
            b.url = replaceUrlParamValueByBrace(b.url, d, "parent")
        }
    if ("object" == typeof b.grid) {
            var e = $("#" + b.grid.id).iDatagrid("options");
            1 == b.grid.multiCheck || void 0 != b.grid.uncheckedMsg ? $("#" + b.grid.id).iDatagrid("multiCheckedAjax", b) : 0 == e.singleSelect ? $("#" + b.grid.id).iDatagrid("multiSelectedAjax", b) : $("#" + b.grid.id).iDatagrid("singleSelectedAjax", b)
        }
}
function requestHandler(a) {
    var b = $.data(a, "menubutton").options;
    if (b.url = appendSourceUrlParam(b.url), "object" == typeof b.grid) {
        var c = getSelectedRowData(b.grid.type, b.grid.id);
        if (null == c) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectSelfGrid, topJUI.language.message.icon.warning);
        b.newUrl = replaceUrlParamValueByBrace(b.url, c)
    } else b.newUrl = b.url;
    window.location.href = b.newUrl
}
function deleteHandler(a) {
    var b = $.data(a, "menubutton").options,
        c = {
            gridId: "datagrid",
            url: b.url ? appendSourceUrlParam(b.url) : getUrl("controller") + "delete" + location.search
        };
    b = $.extend(c, b);
    var d = getCheckedRowsData(b.grid.type, b.grid.id);
    return 0 == d.length ? void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.checkSelfGrid, topJUI.language.message.icon.warning) : void $.messager.confirm(topJUI.language.message.title.confirmTips, topJUI.language.message.msg.confirmDelete, function (a) {
            a && (b.ajaxData = {
                uuid: getMultiRowsFieldValue(d, "uuid"),
                uuids: getMultiRowsFieldValue(d, "uuid")
            }, doAjax(b) && refreshGrid(b.grid.type, b.grid.id))
        })
}
function filterHandler(a) {
    var b = $.data(a, "menubutton").options;
    if ("object" == typeof b.grid) {
        var c = b.grid.id,
            d = $("#" + c).datagrid("options"),
            e = d.filter ? d.filter : [];
        "datagrid" == b.grid.type ? $(".datagrid-filter-row").length > 0 ? $("#" + c).datagrid("disableFilter") : $("#" + c).datagrid("enableFilter", e) : "treegrid" == b.grid.type && ($(".datagrid-filter-row").length > 0 ? $("#" + c).treegrid("disableFilter") : $("#" + c).treegrid("enableFilter", e))
    }
}
function searchHandler(a) {
    var b = $.data(a, "menubutton").options;
    "object" == typeof b.grid && getColumnsNameAndField(b.grid.type, b.grid.id);
    var c = '<table id="advanceSearchTable" class="editTable">';
    c += "<tr>",
    c += '<td style="font-weight: bold;">字段</td>',
    c += '<td style="font-weight: bold;">条件</td>',
    c += '<td style="font-weight: bold;">数值</td>',
    c += '<td style="font-weight: bold;">操作</td>',
    c += "</tr>",
    c += "<tr>",
    c += '<td><input type="text" class="field" name="field"></td>',
    c += '<td><input type="text" class="op" name="op"></td>',
    c += '<td><input type="text" class="value" name="value"></td>',
    c += '<td><a id="addCondition" href="javascript:void(0)"></a>',
    c += "</td>",
    c += "</tr>",
    c += "</table>";
    var d = {
        dialog: {
            id: "advanceSearchDialog",
            title: "组合查询",
            width: 530,
            height: 300,
            modal: !1,
            collapsible: !0,
            minimizable: !1,
            maximized: !1,
            resizable: !0,
            closed: !1,
            closable: !0,
            zIndex: 10,
            iconCls: "fa fa-search",
            content: c,
            buttons: "#advanceSearchDialog-buttons",
            onOpen: function () {
                $(this).trigger(topJUI.eventType.initUI.advanceSearchForm)
            }
        }
    };
    b = $.extend(d, b);
    var e = '<form id="advanceSearchDialog"></form>';
    e += '<div id="advanceSearchDialog-buttons" style="display:none">',
    e += '<a href="#" id="resetAdvanceSearchForm" data-toggle="topjui-linkbutton" data-options="iconCls:\'icon-reload\',btnCls:\'topjui-btn-green\'">清空</a>',
    e += '<a href="#" id="submitAdvanceSearchForm" data-toggle="topjui-linkbutton" data-options="iconCls:\'icon-search\'">查询</a>',
    e += '<a href="#" id="closeAdvanceSearchDialog" data-toggle="topjui-linkbutton" data-options="btnCls:\'topjui-btn-red\'">关闭</a>',
    e += "</div>",
    $("body").append(e);
    var f = $("#" + b.dialog.id);
    f.dialog(b.dialog),
    $("#resetAdvanceSearchForm").linkbutton({
        iconCls: "fa fa-refresh",
        onClick: function () {
            var a = [];
            loadGrid(a)
        }
    }),
    $("#submitAdvanceSearchForm").linkbutton({
        iconCls: "fa fa-search",
        btnCls: "topjui-btn-orange",
        onClick: function () {
            for (var a = [], c = $("#" + b.dialog.id).serializeArray(), d = c.length / 3, e = 0; e < d; e++) {
                var f = (c[3 * e + 0].name, c[3 * e + 0].value),
                    g = (c[3 * e + 1].name, c[3 * e + 1].value),
                    h = (c[3 * e + 2].name, c[3 * e + 2].value);
                a.push({
                        field: f,
                        op: g,
                        value: h
                    })
            }
            loadGrid(a)
        }
    }),
    $("#closeAdvanceSearchDialog").linkbutton({
        iconCls: "fa fa-close",
        onClick: function () {
            $("#" + b.dialog.id).dialog("close")
        }
    });
    var g = "<tr>";
    g += '<td><input type="text" class="field" name="field"></td>',
    g += '<td><input type="text" class="op" name="op"></td>',
    g += '<td><input type="text" class="value" name="value"></td>',
    g += '<td><a class="deleteCondition" href="javascript:void(0)"></a></td></tr>',
    $("#addCondition").on("click", function () {
        $("#advanceSearchTable").append(g),
        $(this).trigger(topJUI.eventType.initUI.advanceSearchForm)
    })
}
function queryHandler(a) {
    var b = $.data(a, "menubutton").options,
        c = $("#" + b.form.id).serializeObject();
    loadGridByQueryParm(b.grid.type, b.grid.id, c)
}
function importHandler(a) {
    var b = $.data(a, "menubutton").options;
    if ("object" == typeof b.grid) {
        var c = '<table id="importTable" class="editTable">';
        c += "<tr>",
        c += '<td width="450"><input type="text" class="importFilePath" name="filePath"></td>',
        c += '<td width="100"><button type="button" class="layui-btn layui-btn-sm" id="importUpBtn"><i class="layui-icon"></i>上传文件</button></td>',
        c += "</td>",
        c += "</tr>",
        c += "</table>";
        var d = {
            dialog: {
                id: "importDialog",
                title: "数据导入",
                width: 700,
                height: 200,
                modal: !1,
                collapsible: !0,
                minimizable: !1,
                maximized: !1,
                resizable: !0,
                closed: !1,
                closable: !0,
                zIndex: 10,
                iconCls: "fa fa-cloud-upload",
                content: c,
                buttons: "#importDialog-buttons",
                onOpen: function () {}
            }
        };
        b = $.extend(d, b);
        var e = '<form id="importDialog"></form>';
        e += '<div id="importDialog-buttons" style="display:none">',
        e += '<a href="#" id="submitImportForm" data-toggle="topjui-linkbutton" data-options="iconCls:\'fa fa-check-circle\'">开始导入</a>',
        e += '<a href="#" id="closeImportDialog" data-toggle="topjui-linkbutton" data-options="btnCls:\'topjui-btn-red\'">关闭</a>',
        e += "</div>",
        $("body").append(e);
        var f = $("#" + b.dialog.id);
        f.dialog(b.dialog);
        var g = $(".importFilePath");
        g.textbox({
            width: 450,
            readonly: !0
        }),
        layui.use("upload", function () {
            var a = layui.upload;
            a.render({
                elem: "#importUpBtn",
                url: b.uploadUrl,
                accept: "file",
                before: function (a) {
                    layer.load()
                },
                done: function (a, b, c) {
                    a.statusCode == topJUI.config.statusCode.success ? g.textbox("setValue", a.filePath) : layer.msg(a.msg, {
                        icon: 5
                    }),
                    layer.closeAll("loading")
                },
                error: function () {
                    layer.closeAll("loading")
                }
            })
        }),
        $("#submitImportForm").linkbutton({
            iconCls: "fa fa-check-circle",
            btnCls: "topjui-btn-blue",
            onClick: function () {
                var a = $("#" + b.dialog.id).serialize(),
                    c = getColumnsNameAndField(b.grid.type, b.grid.id),
                    d = {};
                d.ajaxData = a + "&colName=" + c.colName + "&fieldName=" + c.fieldName,
                d.url = b.url;
                var e = doAjax(d);
                e.statusCode == topJUI.config.statusCode.success && ($("#" + b.dialog.id).dialog("close"), refreshGrid(b.grid.type, b.grid.id)),
                showMessage(e)
            }
        }),
        $("#closeImportDialog").linkbutton({
            iconCls: "fa fa-close",
            onClick: function () {
                $("#" + b.dialog.id).dialog("close")
            }
        })
    }
}
function uploadHandler(a) {
    var b = $.data(a, "menubutton").options,
        c = getRandomNumByDef();
    
    var fileListGridObj = false;
    if(b && b.grid && b.grid.id) {
    	fileListGridObj = $('#' + b.grid.id);
    }
    	
    if ("object" == typeof b.grid) {
            var d = '<div id="' + c + '-toolbar" style="margin:2px;"><button type="button" class="layui-btn layui-btn-sm layui-btn-normal" id="' + c + '-sf">选择文件</button><button type="button" class="layui-btn layui-btn-sm" id="' + c + '-start" style="margin-left: 5px;"><i class="layui-icon">&#xe652;</i>开始上传</button><button type="button" class="layui-btn layui-btn-sm layui-btn-danger" id="' + c + '-remove" style="margin-left: 5px;"><i class="layui-icon">&#x1007;</i>移除文件</button></div>',
                e = '<form id="' + c + '">' + d + '<table id="' + c + '-dg"></table></form>';
            e += '<div id="' + c + '-buttons" style="display:none">',
            e += '<a href="#" id="' + c + '-close">关闭</a>',
            e += "</div>",
            $("body").append(e);
            var f = {
                    dialog: {
                        id: c,
                        title: "文件上传",
                        width: 900,
                        height: 500,
                        modal: !1,
                        collapsible: !0,
                        minimizable: !1,
                        maximized: !1,
                        resizable: !0,
                        closed: !1,
                        closable: !0,
                        zIndex: 10,
                        iconCls: "fa fa-cloud-upload",
                        buttons: "#" + c + "-buttons",
                        onOpen: function () {}
                    }
                };
            b = $.extend(f, b);
            
            b.dialog.onClose = function () {
            	fileListGridObj.datagrid('reload');
            };
            
            var g = $("#" + c);
            g.dialog(b.dialog),
            upfileGrid = $("#" + c + "-dg").datagrid({
                    fit: !0,
                    fitColumns: !0,
                    rownumbers: !0,
                    nowrap: !0,
                    idField: "fileId",
                    pagination: !1,
                    toolbar: c + "-toolbar",
                    columns: [
                        [{
                            field: "ck",
                            checkbox: !0
                        },
                        {
                            field: "fileName",
                            title: "文件名称",
                            width: 100
                        },
                        {
                            field: "fileSize",
                            title: "文件大小",
                            width: 30
                        },
                        {
                            field: "fileState",
                            title: "上传状态",
                            width: 20
                        }]
                    ]
                }),
            layui.use("upload", function () {
                    var a = (layui.jquery, layui.upload);
                    a.render({
                        elem: "#" + c + "-sf",
                        url: b.uploadUrl || "upload",
                        accept: b.accept || "file",
                        multiple: !0,
                        auto: !1,
                        bindAction: "#" + c + "-start",
                        choose: function (a) {
                            a.preview(function (a, b, c) {
                                var d = bytesToSize(b.size),
                                    e = {
                                        fileName: b.name,
                                        fileSize: d,
                                        fileState: "等待上传"
                                    };
                                upfileGrid.datagrid("insertRow", {
                                        index: 0,
                                        row: e
                                    })
                            })
                        },
                        done: function (a, b, c) {
                            if (a.statusCode != topJUI.config.statusCode.success) this.error(b, c);
                            else for (var d = upfileGrid.datagrid("getRows"), e = 0; e < d.length; e++) upfileGrid.datagrid("updateRow", {
                                index: upfileGrid.datagrid("getRowIndex", d[e]),
                                row: {
                                }
                            }),
                            upfileGrid.datagrid("updateRow", {
                                index: upfileGrid.datagrid("getRowIndex", d[e]),
                                row: {
                                    fileState: "上传成功"
                                }
                            });
                        },
                        error: function (a, b) {
                            this.error(a, b)
                        }
                    })
                });
            var h = function () {
                    for (var a = upfileGrid.datagrid("getSelections"), b = [], c = 0; c < a.length; c++) b.push(a[c]);
                    for (var d = 0; d < b.length; d++) {
                        var e = upfileGrid.datagrid("getRowIndex", b[d]);
                        upfileGrid.datagrid("deleteRow", e)
                    }
                    upfileGrid.datagrid("clearSelections")
                };
            $("#" + c + "-remove").on("click", h),
            $("#" + c + "-close").linkbutton({
                    iconCls: "fa fa-close",
                    btnCls: "topjui-btn-red",
                    onClick: function () {
                        $("#" + c).dialog("close");
                    }
                })
        }
}
function edatagridHandler(a) {
    var b = $.data(a, "menubutton").options;
    "addRow" == b.type && $("#" + b.grid.id).edatagrid("addRow", 0),
    "saveRow" == b.type && $("#" + b.grid.id).edatagrid("saveRow"),
    "cancelRow" == b.type && $("#" + b.grid.id).edatagrid("cancelRow"),
    "destroyRow" == b.type && $("#" + b.grid.id).edatagrid("destroyRow")
}
function getColumnsNameAndField(a, b) {
    var c = [],
        d = [],
        e = [],
        f = [];
    if ("datagrid" == a) {
            c = $("#" + b).datagrid("getColumnFields", !0),
            d = $("#" + b).datagrid("getColumnFields"),
            e = c.concat(d);
            for (var g = 0; g < e.length; g++) {
                var h = $("#" + b).datagrid("getColumnOption", e[g]);
                f.push(h.title)
            }
        } else if ("treegrid" == a) {
            c = $("#" + b).treegrid("getColumnFields", !0),
            d = $("#" + b).treegrid("getColumnFields"),
            e = c.concat(d);
            for (var i = 0; i < e.length; i++) {
                var h = $("#" + b).treegrid("getColumnOption", e[i]);
                f.push(h.title)
            }
        }
    var j = f.join(",").replace(/,操作/g, "").replace(/操作,/g, ""),
        k = e.join(",").replace(/,handle/g, "").replace(/handle,/g, "");
    $.cookie("gridId", b),
    $.cookie("gridType", a),
    $.cookie("colNameStr", j),
    $.cookie("fieldNameStr", k);
    var l = {};
    return l.colName = j,
    l.fieldName = k,
    l
}
function exportHandler(a) {
    var b = $.data(a, "menubutton").options,
        c = getUrl("controller"),
        d = {
            gridId: "datagrid",
            excelTitle: parent.$("#index_tabs").tabs("getSelected").panel("options").title + "_导出数据_" + getCurrentDatetime("YmdHis"),
            url: b.url ? b.url : c + "exportExcel"
        };
    b = $.extend(!0, d, b);
    var e, f, g, h, i, j = [],
        k = [];
    if ("object" == typeof b.grid) if (e = b.grid.id, "datagrid" == b.grid.type) {
            f = $("#" + e).datagrid("getColumnFields", !0),
            g = $("#" + e).datagrid("getColumnFields"),
            h = f.concat(g);
            for (var l = 0; l < h.length; l++) i = $("#" + e).datagrid("getColumnOption", h[l]),
            j.push(i.title),
            1 == i.hidden || 1 == i.checkbox ? k.push(!0) : k.push(!1)
        } else if ("treegrid" == b.grid.type) {
            f = $("#" + e).treegrid("getColumnFields", !0),
            g = $("#" + e).treegrid("getColumnFields"),
            h = f.concat(g);
            for (var m = 0; m < h.length; m++) i = $("#" + e).treegrid("getColumnOption", h[m]),
            j.push(i.title),
            1 == i.hidden || 1 == i.checkbox ? k.push(!0) : k.push(!1)
        }
    for (var n = 0; n < k.length; n++) k[n] && (j.splice(n, 1), h.splice(n, 1), k.splice(n, 1), n--);
    var o = j.join(",").replace(/,操作/g, "").replace(/操作,/g, ""),
        p = h.join(",").replace(/,handle/g, "").replace(/handle,/g, "");
    b.ajaxData = {
            excelTitle: b.excelTitle,
            colName: o,
            fieldName: p
        },
    window.location.href = b.url + "?excelTitle=" + b.excelTitle + "&colName=" + o + "&fieldName=" + p
}
function redoHandler() {
    $(options.gridId).datagrid("rejectChanges"),
    $(options.gridId).datagrid("unselectAll")
}
function doAjax(a) {
    var b = {},
        c = "",
        d = {};
    a = $.extend(d, a);
    JSON.stringify(a.ajaxData);
    return topJUI.config.postJson ? ("object" != typeof a.ajaxData && (a.ajaxData = $.serializeJson(a.ajaxData)), c = "application/json;charset=utf-8") : c = "application/x-www-form-urlencoded;charset=utf-8",
    $.ajax({
            url: a.url,
            type: "post",
            data: a.ajaxData,
            dataType: "json",
            async: !1,
            contentType: c,
            beforeSend: function () {
                $.messager.progress({
                    text: "正在操作..."
                })
            },
            success: function (c, d, e) {
                $.messager.progress("close"),
                refreshGrids(a.reload),
                1 == c.statusCode || 100 == c.statusCode || c.statusCode == topJUI.config.statusCode.success ? (b.statusCode = topJUI.config.statusCode.success, b.title = c.title, b.message = c.message) : 1 == c ? (b.statusCode = topJUI.config.statusCode.success, b.title = topJUI.language.message.title.operationTips, b.message = topJUI.language.message.msg.success) : (b.statusCode = topJUI.config.statusCode.failure, b.title = c.title, b.message = c.message)
            }
        }),
    b
}
function setDialogHrefKeyValue(a, b, c) {
    var d = b.split(","),
        e = c.split(","),
        f = $(a).dialog("options").href,
        g = "";
    for (i = 0; i < d.length; i++) f.indexOf("?") > 0 ? f.indexOf(d[i] + "=" + e[i]) == -1 && (g += "&" + d[i] + "=" + e[i]) : 0 == i ? g = "?" + d[i] + "=" + e[i] : g += "&" + d[i] + "=" + e[i];
    $(a).dialog("options").href = f + g
}
function clearDialogHrefKeyValue(a, b) {
    var c = b.split(","),
        d = $(a).dialog("options").href;
    if (d.indexOf("?") > 0) {
            var e = "",
                f = d.substring(0, d.indexOf("?") + 1),
                g = d.substring(d.indexOf("?") + 1),
                h = g.split("&");
            for (i = 0; i < h.length; i++) for (j = 0; j < c.length; j++) h[i].indexOf(c[j] + "=") >= 0 && h.remove(i);
            1 == h.length ? e = h[0] : h.length > 1 && (e = h.join("&"));
            var k = "";
            k = f + e;
            var l = k.substring(k.length - 1);
            "?" == l && (k = k.substring(0, k.length - 1))
        } else k = d;
    $(a).dialog("options").href = k
}
function msgFn(a) {
    var b = {},
        c = "";
    "object" == typeof a ? (c = a.code, b = {
            title: a.title,
            msg: a.message
        }) : (c = a, b = 1 == a ? {
            title: "温馨提示",
            msg: "操作成功"
        } : {
            title: "温馨提示",
            msg: "操作失败！未知错误，请重试！"
        }),
    !(1 != c && 100 != c && c != topJUI.config.statusCode.success || 1 != c && c != topJUI.config.statusCode.success) ? $.messager.show(b) : $.messager.alert(b)
}
function showMessage(a) {
    var b = {},
        c = "";
    "object" == typeof a ? (c = a.statusCode, void 0 == a.icon && (a.icon = topJUI.language.message.icon.info), b = {
            showType: topJUI.language.message.showType.slide,
            title: a.title,
            msg: a.message,
            icon: a.icon
        }) : (c = a, b = 1 == a ? {
            showType: topJUI.language.message.showType.slide,
            title: topJUI.language.message.title.operationTips,
            msg: topJUI.language.message.msg.success,
            icon: topJUI.language.message.icon.info
        } : {
            showType: topJUI.language.message.showType.slide,
            title: topJUI.language.message.title.operationTips,
            msg: topJUI.language.message.msg.failed,
            icon: topJUI.language.message.icon.error
        }),
    !(1 != c && 100 != c && c != topJUI.config.statusCode.success || 1 != c && c != topJUI.config.statusCode.success) ? (b.timeout = 1e3, $.messager.show(b)) : $.messager.alert(b)
}
function isExistBrace(a) {
    return a.indexOf("{") >= 0
}
function replaceUrlParamValueByBrace(a, b, c) {
    var d = a;
    if (a && a.indexOf("{") >= 0) {
        var e = isMultiObj(b) ? b[0] : b,
            f = isNull(c) ? "" : c + ".",
            g = new RegExp("{" + f + "(.*?)}", "g"),
            h = a.match(g);
        if (h.length > 0) for (var i = 0; i < h.length; i++) {
                var j = h[i].replace("{" + f, "").replace("}", "");
                d = "multiple" == c ? d.replace(h[i], getMultiRowsFieldValue(b, j)) : d.replace(h[i], e[j])
            }
    }
    return d
}
function convertParamValue2Object(a, b, c) {
    var d = a;
    if (a && a.indexOf("{") >= 0) {
        var e = {},
            f = isMultiObj(b) ? b[0] : b,
            g = isNull(c) ? "" : c + ".",
            h = new RegExp("{" + g + "(.*?)}", "g"),
            i = a.match(h);
        if (i.length > 0) for (var j = 0; j < i.length; j++) {
                var k = i[j].replace("{" + g, "").replace("}", "");
                "multiple" == c ? e[k] = d.replace(i[j], getMultiRowsFieldValue(b, k)) : e[k] = d.replace(i[j], f[k])
            }
    }
    return e
}
function convertParamObj2ObjData(a, b) {
    var c, d, e = {};
    for (c in a) d = a[c],
    isMultiObj(b) ? e[c] = getMultiRowsFieldValue(b, d) : topJUI.config.singleQuotesParam ? e[c] = "'" + b[d] + "'" : e[c] = b[d];
    return e
}
function convertParamObj2Serialize(a, b) {
    var c, d, e = "";
    for (c in a) d = a[c],
    e += isMultiObj(b) ? c + "=" + getMultiRowsFieldValue(b, d) + "&" : c + "=" + b[d] + "&";
    return e.substring(0, e.length - 1)
}
function getMultiRowsFieldValue(a, b) {
    for (var c = [], d = 0; d < a.length; d++) topJUI.config.singleQuotesParam ? c.push("'" + a[d][b] + "'") : c.push(a[d][b]);
    return c.join(",")
}
var scripts = document.getElementsByTagName("script"),
    lastScript = scripts[scripts.length - 1],
    scriptSrc = lastScript.src,
    _tjp = scriptSrc.substring(0, scriptSrc.lastIndexOf("/")).replace("js", ""),
    _ctx = _tjp.replace("topjui/", "");
$.getUrlParam = function (a) {
        var b = new RegExp("(^|&)" + a + "=([^&]*)(&|$)"),
            c = window.location.search.substr(1).match(b);
        return null != c ? unescape(c[2]) : null
    },
$.extend({
        getUrlVars: function () {
            for (var a, b = [], c = window.location.href.slice(window.location.href.indexOf("?") + 1).split("&"), d = 0; d < c.length; d++) a = c[d].split("="),
            b.push(a[0]),
            b[a[0]] = a[1];
            return b
        },
        getUrlVar: function (a) {
            return $.getUrlVars()[a]
        },
        serializeJson: function (a) {
            return a = decodeURIComponent(a, !0),
            a = a.replace(/&/g, '","'),
            a = a.replace(/=/g, '":"'),
            a = '{"' + a + '"}'
        }
    }),
$.getUrlStrParam = function (a, b) {
        var c = a.substring(a.indexOf("?")),
            d = new RegExp("(^|&)" + b + "=([^&]*)(&|$)"),
            e = c.substr(1).match(d);
        return null != e ? unescape(e[2]) : null
    },
$.fn.serializeObject = function () {
        var a = {},
            b = this.serializeArray();
        return $.each(b, function () {
                void 0 !== a[this.name] ? (a[this.name].push || (a[this.name] = [a[this.name]]), a[this.name].push(this.value || "")) : a[this.name] = this.value || ""
            }),
        a
    },
Array.prototype.indexOf = function (a) {
        for (var b = 0; b < this.length; b++) if (this[b] == a) return b;
        return -1
    },
Array.prototype.remove = function (a) {
        for (var b = this.indexOf(a); b > -1;) this.splice(b, 1),
        b = this.indexOf(a)
    },
String.prototype.cutStr2Arr = function (a) {
        for (var b = this, c = [], d = Math.ceil(b.length / a), e = 0; e < d; e++) if (b.length >= a) {
            var f = b.substring(0, a);
            c.push(f),
            b = b.substring(a)
        } else b = b,
        c.push(b);
        return c
    },


function (a) {
        a.easyui = {
            indexOfArray: function (a, b, c) {
                for (var d = 0, e = a.length; d < e; d++) if (void 0 == c) {
                    if (a[d] == b) return d
                } else if (a[d][b] == c) return d;
                return -1
            },
            removeArrayItem: function (a, b, c) {
                if ("string" == typeof b) {
                    for (var d = 0, e = a.length; d < e; d++) if (a[d][b] == c) return void a.splice(d, 1)
                } else {
                    var f = this.indexOfArray(a, b);
                    f != -1 && a.splice(f, 1)
                }
            },
            addArrayItem: function (a, b, c) {
                var d = this.indexOfArray(a, b, c ? c[b] : void 0);
                d == -1 ? a.push(c ? c : b) : a[d] = c ? c : b
            },
            getArrayItem: function (a, b, c) {
                var d = this.indexOfArray(a, b, c);
                return d == -1 ? null : a[d]
            },
            forEach: function (a, b, c) {
                for (var d = [], e = 0; e < a.length; e++) d.push(a[e]);
                for (; d.length;) {
                    var f = d.shift();
                    if (0 == c(f)) return;
                    if (b && f.children) for (var e = f.children.length - 1; e >= 0; e--) d.unshift(f.children[e])
                }
            }
        },
        a.parser = {
            auto: !0,
            onComplete: function (a) {},
            plugins: ["draggable", "droppable", "resizable", "pagination", "tooltip", "linkbutton", "menu", "menubutton", "splitbutton", "switchbutton", "progressbar", "tree", "textbox", "passwordbox", "filebox", "combo", "combobox", "combotree", "combogrid", "combotreegrid", "tagbox", "numberbox", "validatebox", "searchbox", "spinner", "numberspinner", "timespinner", "datetimespinner", "calendar", "datebox", "datetimebox", "slider", "layout", "panel", "datagrid", "propertygrid", "treegrid", "datalist", "tabs", "accordion", "window", "dialog", "form"],
            parse: function (b) {
                for (var c = [], d = 0; d < a.parser.plugins.length; d++) {
                    var e = a.parser.plugins[d],
                        f = a(".easyui-" + e, b);
                    f.length && (f[e] ? f.each(function () {
                            a(this)[e](a.data(this, "options") || {})
                        }) : c.push({
                            name: e,
                            jq: f
                        }))
                }
                if (c.length && window.easyloader) {
                    for (var g = [], d = 0; d < c.length; d++) g.push(c[d].name);
                    easyloader.load(g, function () {
                        for (var d = 0; d < c.length; d++) {
                            var e = c[d].name,
                                f = c[d].jq;
                            f.each(function () {
                                    a(this)[e](a.data(this, "options") || {})
                                })
                        }
                        a.parser.onComplete.call(a.parser, b);
                    })
                } else a.parser.onComplete.call(a.parser, b)
            },
            parseValue: function (b, c, d, e) {
                e = e || 0;
                var f = a.trim(String(c || "")),
                    g = f.substr(f.length - 1, 1);
                return "%" == g ? (f = parseFloat(f.substr(0, f.length - 1)), f = b.toLowerCase().indexOf("width") >= 0 ? Math.floor((d.width() - e) * f / 100) : Math.floor((d.height() - e) * f / 100)) : f = parseInt(f) || void 0,
                f
            },
            parseOptions: function (b, c) {
                var d = a(b),
                    e = {},
                    f = a.trim(d.attr("data-options"));
                if (f && ("{" != f.substring(0, 1) && (f = "{" + f + "}"), e = new Function("return " + f)()), a.map(["width", "height", "left", "top", "minWidth", "maxWidth", "minHeight", "maxHeight"], function (c) {
                        var d = a.trim(b.style[c] || "");
                        d && (d.indexOf("%") == -1 && (d = parseInt(d), isNaN(d) && (d = void 0)), e[c] = d)
                    }), c) {
                        for (var g = {}, h = 0; h < c.length; h++) {
                            var i = c[h];
                            if ("string" == typeof i) g[i] = d.attr(i);
                            else for (var j in i) {
                                var k = i[j];
                                "boolean" == k ? g[j] = d.attr(j) ? "true" == d.attr(j) : void 0 : "number" == k && (g[j] = "0" == d.attr(j) ? 0 : parseFloat(d.attr(j)) || void 0)
                            }
                        }
                        a.extend(e, g)
                    }
                return e
            }
        },
        a(function () {
            var b = a('<div style="position:absolute;top:-1000px;width:100px;height:100px;padding:5px"></div>').appendTo("body");
            a._boxModel = 100 != b.outerWidth(),
            b.remove(),
            b = a('<div style="position:fixed"></div>').appendTo("body"),
            a._positionFixed = "fixed" == b.css("position"),
            b.remove(),
            !window.easyloader && a.parser.auto && a.parser.parse()
        }),
        a.fn._outerWidth = function (a) {
            return void 0 == a ? this[0] == window ? this.width() || document.body.clientWidth : this.outerWidth() || 0 : this._size("width", a)
        },
        a.fn._outerHeight = function (a) {
            return void 0 == a ? this[0] == window ? this.height() || document.body.clientHeight : this.outerHeight() || 0 : this._size("height", a)
        },
        a.fn._scrollLeft = function (b) {
            return void 0 == b ? this.scrollLeft() : this.each(function () {
                a(this).scrollLeft(b)
            })
        },
        a.fn._propAttr = a.fn.prop || a.fn.attr,
        a.fn._size = function (b, c) {
            function d(b, c, d) {
                if (!c.length) return !1;
                var e = a(b)[0],
                    f = c[0],
                    g = f.fcount || 0;
                return d ? (e.fitted || (e.fitted = !0, f.fcount = g + 1, a(f).addClass("panel-noscroll"), "BODY" == f.tagName && a("html").addClass("panel-fit")), {
                        width: a(f).width() || 1,
                        height: a(f).height() || 1
                    }) : (e.fitted && (e.fitted = !1, f.fcount = g - 1, 0 == f.fcount && (a(f).removeClass("panel-noscroll"), "BODY" == f.tagName && a("html").removeClass("panel-fit"))), !1)
            }
            function e(b, c, d, e) {
                var f = a(b),
                    g = c,
                    h = g.substr(0, 1).toUpperCase() + g.substr(1),
                    i = a.parser.parseValue("min" + h, e["min" + h], d),
                    j = a.parser.parseValue("max" + h, e["max" + h], d),
                    k = a.parser.parseValue(g, e[g], d),
                    l = String(e[g] || "").indexOf("%") >= 0;
                if (isNaN(k)) f._size(g, ""),
                f._size("min" + h, i),
                f._size("max" + h, j);
                else {
                        var m = Math.min(Math.max(k, i || 0), j || 99999);
                        l || (e[g] = m),
                        f._size("min" + h, ""),
                        f._size("max" + h, ""),
                        f._size(g, m)
                    }
                return l || e.fit
            }
            function f(b, c, d) {
                function e() {
                    return c.toLowerCase().indexOf("width") >= 0 ? f.outerWidth() - f.width() : f.outerHeight() - f.height()
                }
                var f = a(b);
                if (void 0 == d) {
                    if (d = parseInt(b.style[c]), isNaN(d)) return;
                    return a._boxModel && (d += e()),
                    d
                }
                "" === d ? f.css(c, "") : (a._boxModel && (d -= e(), d < 0 && (d = 0)), f.css(c, d + "px"))
            }
            return "string" == typeof b ? "clear" == b ? this.each(function () {
                a(this).css({
                    width: "",
                    minWidth: "",
                    maxWidth: "",
                    height: "",
                    minHeight: "",
                    maxHeight: ""
                })
            }) : "fit" == b ? this.each(function () {
                d(this, "BODY" == this.tagName ? a("body") : a(this).parent(), !0)
            }) : "unfit" == b ? this.each(function () {
                d(this, a(this).parent(), !1)
            }) : void 0 == c ? f(this[0], b) : this.each(function () {
                f(this, b, c)
            }) : this.each(function () {
                c = c || a(this).parent(),
                a.extend(b, d(this, c, b.fit) || {});
                var f = e(this, "width", c, b),
                    g = e(this, "height", c, b);
                f || g ? a(this).addClass("easyui-fluid") : a(this).removeClass("easyui-fluid")
            })
        }
    }(jQuery),


function (a) {
        function b(b) {
            1 == b.touches.length && (g ? (clearTimeout(dblClickTimer), g = !1, e(b, "dblclick")) : (g = !0, dblClickTimer = setTimeout(function () {
                g = !1
            }, 500)), f = setTimeout(function () {
                e(b, "contextmenu", 3)
            }, 1e3), e(b, "mousedown"), (a.fn.draggable.isDragging || a.fn.resizable.isResizing) && b.preventDefault())
        }
        function c(b) {
            1 == b.touches.length && (f && clearTimeout(f), e(b, "mousemove"), (a.fn.draggable.isDragging || a.fn.resizable.isResizing) && b.preventDefault())
        }
        function d(b) {
            f && clearTimeout(f),
            e(b, "mouseup"),
            (a.fn.draggable.isDragging || a.fn.resizable.isResizing) && b.preventDefault()
        }
        function e(b, c, d) {
            var e = new a.Event(c);
            e.pageX = b.changedTouches[0].pageX,
            e.pageY = b.changedTouches[0].pageY,
            e.which = d || 1,
            a(b.target).trigger(e)
        }
        var f = null,
            g = !1;
        document.addEventListener && (document.addEventListener("touchstart", b, !0), document.addEventListener("touchmove", c, !0), document.addEventListener("touchend", d, !0))
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b.data.target, "draggable"),
                d = c.options,
                e = c.proxy,
                f = b.data,
                g = f.startLeft + b.pageX - f.startX,
                h = f.startTop + b.pageY - f.startY;
            e && (e.parent()[0] == document.body ? (g = null != d.deltaX && void 0 != d.deltaX ? b.pageX + d.deltaX : b.pageX - b.data.offsetWidth, h = null != d.deltaY && void 0 != d.deltaY ? b.pageY + d.deltaY : b.pageY - b.data.offsetHeight) : (null != d.deltaX && void 0 != d.deltaX && (g += b.data.offsetWidth + d.deltaX), null != d.deltaY && void 0 != d.deltaY && (h += b.data.offsetHeight + d.deltaY))),
            b.data.parent != document.body && (g += a(b.data.parent).scrollLeft(), h += a(b.data.parent).scrollTop()),
            "h" == d.axis ? f.left = g : "v" == d.axis ? f.top = h : (f.left = g, f.top = h)
        }
        function c(b) {
            var c = a.data(b.data.target, "draggable"),
                d = c.options,
                e = c.proxy;
            e || (e = a(b.data.target)),
            e.css({
                    left: b.data.left,
                    top: b.data.top
                }),
            a("body").css("cursor", d.cursor)
        }
        function d(d) {
            if (!a.fn.draggable.isDragging) return !1;
            var e = a.data(d.data.target, "draggable"),
                f = e.options,
                g = a(".droppable:visible").filter(function () {
                    return d.data.target != this
                }).filter(function () {
                    var b = a.data(this, "droppable").options.accept;
                    return !b || a(b).filter(function () {
                        return this == d.data.target
                    }).length > 0
                });
            e.droppables = g;
            var h = e.proxy;
            return h || (f.proxy ? (h = "clone" == f.proxy ? a(d.data.target).clone().insertAfter(d.data.target) : f.proxy.call(d.data.target, d.data.target), e.proxy = h) : h = a(d.data.target)),
            h.css("position", "absolute"),
            b(d),
            c(d),
            f.onStartDrag.call(d.data.target, d),
            !1
        }
        function e(d) {
            if (!a.fn.draggable.isDragging) return !1;
            var e = a.data(d.data.target, "draggable");
            b(d),
            0 != e.options.onDrag.call(d.data.target, d) && c(d);
            var f = d.data.target;
            return e.droppables.each(function () {
                var b = a(this);
                if (!b.droppable("options").disabled) {
                    var c = b.offset();
                    d.pageX > c.left && d.pageX < c.left + b.outerWidth() && d.pageY > c.top && d.pageY < c.top + b.outerHeight() ? (this.entered || (a(this).trigger("_dragenter", [f]), this.entered = !0), a(this).trigger("_dragover", [f])) : this.entered && (a(this).trigger("_dragleave", [f]), this.entered = !1)
                }
            }),
            !1
        }
        function f(b) {
            function c() {
                h && h.remove(),
                f.proxy = null
            }
            function d() {
                var d = !1;
                return f.droppables.each(function () {
                    var e = a(this);
                    if (!e.droppable("options").disabled) {
                        var f = e.offset();
                        return b.pageX > f.left && b.pageX < f.left + e.outerWidth() && b.pageY > f.top && b.pageY < f.top + e.outerHeight() ? (i.revert && a(b.data.target).css({
                            position: b.data.startPosition,
                            left: b.data.startLeft,
                            top: b.data.startTop
                        }), a(this).trigger("_drop", [b.data.target]), c(), d = !0, this.entered = !1, !1) : void 0
                    }
                }),
                d || i.revert || c(),
                d
            }
            if (!a.fn.draggable.isDragging) return g(),
            !1;
            e(b);
            var f = a.data(b.data.target, "draggable"),
                h = f.proxy,
                i = f.options;
            if (i.revert) if (1 == d()) a(b.data.target).css({
                    position: b.data.startPosition,
                    left: b.data.startLeft,
                    top: b.data.startTop
                });
            else if (h) {
                    var j, k;
                    h.parent()[0] == document.body ? (j = b.data.startX - b.data.offsetWidth, k = b.data.startY - b.data.offsetHeight) : (j = b.data.startLeft, k = b.data.startTop),
                    h.animate({
                        left: j,
                        top: k
                    }, function () {
                        c()
                    })
                } else a(b.data.target).animate({
                    left: b.data.startLeft,
                    top: b.data.startTop
                }, function () {
                    a(b.data.target).css("position", b.data.startPosition)
                });
            else a(b.data.target).css({
                    position: "absolute",
                    left: b.data.left,
                    top: b.data.top
                }),
            d();
            return i.onStopDrag.call(b.data.target, b),
            g(),
            !1
        }
        function g() {
            a.fn.draggable.timer && (clearTimeout(a.fn.draggable.timer), a.fn.draggable.timer = void 0),
            a(document).unbind(".draggable"),
            a.fn.draggable.isDragging = !1,
            setTimeout(function () {
                a("body").css("cursor", "")
            }, 100)
        }
        a.fn.draggable = function (b, c) {
            return "string" == typeof b ? a.fn.draggable.methods[b](this, c) : this.each(function () {
                function c(b) {
                    var c = a.data(b.data.target, "draggable"),
                        d = c.handle,
                        e = a(d).offset(),
                        f = a(d).outerWidth(),
                        g = a(d).outerHeight(),
                        h = b.pageY - e.top,
                        i = e.left + f - b.pageX,
                        j = e.top + g - b.pageY,
                        k = b.pageX - e.left;
                    return Math.min(h, i, j, k) > c.options.edge
                }
                var g, h = a.data(this, "draggable");
                h ? (h.handle.unbind(".draggable"), g = a.extend(h.options, b)) : g = a.extend({}, a.fn.draggable.defaults, a.fn.draggable.parseOptions(this), b || {});
                var i = g.handle ? "string" == typeof g.handle ? a(g.handle, this) : g.handle : a(this);
                return a.data(this, "draggable", {
                    options: g,
                    handle: i
                }),
                g.disabled ? void a(this).css("cursor", "") : void i.unbind(".draggable").bind("mousemove.draggable", {
                    target: this
                }, function (b) {
                    if (!a.fn.draggable.isDragging) {
                        var d = a.data(b.data.target, "draggable").options;
                        c(b) ? a(this).css("cursor", d.cursor) : a(this).css("cursor", "")
                    }
                }).bind("mouseleave.draggable", {
                    target: this
                }, function (b) {
                    a(this).css("cursor", "")
                }).bind("mousedown.draggable", {
                    target: this
                }, function (b) {
                    if (0 != c(b)) {
                        a(this).css("cursor", "");
                        var g = a(b.data.target).position(),
                            h = a(b.data.target).offset(),
                            i = {
                                startPosition: a(b.data.target).css("position"),
                                startLeft: g.left,
                                startTop: g.top,
                                left: g.left,
                                top: g.top,
                                startX: b.pageX,
                                startY: b.pageY,
                                width: a(b.data.target).outerWidth(),
                                height: a(b.data.target).outerHeight(),
                                offsetWidth: b.pageX - h.left,
                                offsetHeight: b.pageY - h.top,
                                target: b.data.target,
                                parent: a(b.data.target).parent()[0]
                            };
                        a.extend(b.data, i);
                        var j = a.data(b.data.target, "draggable").options;
                        if (0 != j.onBeforeDrag.call(b.data.target, b)) return a(document).bind("mousedown.draggable", b.data, d),
                        a(document).bind("mousemove.draggable", b.data, e),
                        a(document).bind("mouseup.draggable", b.data, f),
                        a.fn.draggable.timer = setTimeout(function () {
                                a.fn.draggable.isDragging = !0,
                                d(b)
                            }, j.delay),
                        !1
                    }
                })
            })
        },
        a.fn.draggable.methods = {
            options: function (b) {
                return a.data(b[0], "draggable").options
            },
            proxy: function (b) {
                return a.data(b[0], "draggable").proxy
            },
            enable: function (b) {
                return b.each(function () {
                    a(this).draggable({
                        disabled: !1
                    })
                })
            },
            disable: function (b) {
                return b.each(function () {
                    a(this).draggable({
                        disabled: !0
                    })
                })
            }
        },
        a.fn.draggable.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, ["cursor", "handle", "axis", {
                revert: "boolean",
                deltaX: "number",
                deltaY: "number",
                edge: "number",
                delay: "number"
            }]), {
                disabled: !! c.attr("disabled") || void 0
            })
        },
        a.fn.draggable.defaults = {
            proxy: null,
            revert: !1,
            cursor: "move",
            deltaX: null,
            deltaY: null,
            handle: null,
            disabled: !1,
            edge: 0,
            axis: null,
            delay: 100,
            onBeforeDrag: function (a) {},
            onStartDrag: function (a) {},
            onDrag: function (a) {},
            onStopDrag: function (a) {}
        },
        a.fn.draggable.isDragging = !1
    }(jQuery),


function (a) {
        function b(b) {
            a(b).addClass("droppable"),
            a(b).bind("_dragenter", function (c, d) {
                a.data(b, "droppable").options.onDragEnter.apply(b, [c, d])
            }),
            a(b).bind("_dragleave", function (c, d) {
                a.data(b, "droppable").options.onDragLeave.apply(b, [c, d])
            }),
            a(b).bind("_dragover", function (c, d) {
                a.data(b, "droppable").options.onDragOver.apply(b, [c, d])
            }),
            a(b).bind("_drop", function (c, d) {
                a.data(b, "droppable").options.onDrop.apply(b, [c, d])
            })
        }
        a.fn.droppable = function (c, d) {
            return "string" == typeof c ? a.fn.droppable.methods[c](this, d) : (c = c || {}, this.each(function () {
                var d = a.data(this, "droppable");
                d ? a.extend(d.options, c) : (b(this), a.data(this, "droppable", {
                    options: a.extend({}, a.fn.droppable.defaults, a.fn.droppable.parseOptions(this), c)
                }))
            }))
        },
        a.fn.droppable.methods = {
            options: function (b) {
                return a.data(b[0], "droppable").options
            },
            enable: function (b) {
                return b.each(function () {
                    a(this).droppable({
                        disabled: !1
                    })
                })
            },
            disable: function (b) {
                return b.each(function () {
                    a(this).droppable({
                        disabled: !0
                    })
                })
            }
        },
        a.fn.droppable.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, ["accept"]), {
                disabled: !! c.attr("disabled") || void 0
            })
        },
        a.fn.droppable.defaults = {
            accept: null,
            disabled: !1,
            onDragEnter: function (a, b) {},
            onDragOver: function (a, b) {},
            onDragLeave: function (a, b) {},
            onDrop: function (a, b) {}
        }
    }(jQuery),


function (a) {
        a.fn.resizable = function (b, c) {
            function d(b) {
                var c = b.data,
                    d = a.data(c.target, "resizable").options;
                if (c.dir.indexOf("e") != -1) {
                        var e = c.startWidth + b.pageX - c.startX;
                        e = Math.min(Math.max(e, d.minWidth), d.maxWidth),
                        c.width = e
                    }
                if (c.dir.indexOf("s") != -1) {
                        var f = c.startHeight + b.pageY - c.startY;
                        f = Math.min(Math.max(f, d.minHeight), d.maxHeight),
                        c.height = f
                    }
                if (c.dir.indexOf("w") != -1) {
                        var e = c.startWidth - b.pageX + c.startX;
                        e = Math.min(Math.max(e, d.minWidth), d.maxWidth),
                        c.width = e,
                        c.left = c.startLeft + c.startWidth - c.width
                    }
                if (c.dir.indexOf("n") != -1) {
                        var f = c.startHeight - b.pageY + c.startY;
                        f = Math.min(Math.max(f, d.minHeight), d.maxHeight),
                        c.height = f,
                        c.top = c.startTop + c.startHeight - c.height
                    }
            }
            function e(b) {
                var c = b.data,
                    d = a(c.target);
                d.css({
                        left: c.left,
                        top: c.top
                    }),
                d.outerWidth() != c.width && d._outerWidth(c.width),
                d.outerHeight() != c.height && d._outerHeight(c.height)
            }
            function f(b) {
                return a.fn.resizable.isResizing = !0,
                a.data(b.data.target, "resizable").options.onStartResize.call(b.data.target, b),
                !1
            }
            function g(b) {
                return d(b),
                0 != a.data(b.data.target, "resizable").options.onResize.call(b.data.target, b) && e(b),
                !1
            }
            function h(b) {
                return a.fn.resizable.isResizing = !1,
                d(b, !0),
                e(b),
                a.data(b.data.target, "resizable").options.onStopResize.call(b.data.target, b),
                a(document).unbind(".resizable"),
                a("body").css("cursor", ""),
                !1
            }
            return "string" == typeof b ? a.fn.resizable.methods[b](this, c) : this.each(function () {
                function c(b) {
                    var c = a(b.data.target),
                        e = "",
                        f = c.offset(),
                        g = c.outerWidth(),
                        h = c.outerHeight(),
                        i = d.edge;
                    b.pageY > f.top && b.pageY < f.top + i ? e += "n" : b.pageY < f.top + h && b.pageY > f.top + h - i && (e += "s"),
                    b.pageX > f.left && b.pageX < f.left + i ? e += "w" : b.pageX < f.left + g && b.pageX > f.left + g - i && (e += "e");
                    for (var j = d.handles.split(","), k = 0; k < j.length; k++) {
                            var l = j[k].replace(/(^\s*)|(\s*$)/g, "");
                            if ("all" == l || l == e) return e
                        }
                    return ""
                }
                var d = null,
                    e = a.data(this, "resizable");
                e ? (a(this).unbind(".resizable"), d = a.extend(e.options, b || {})) : (d = a.extend({}, a.fn.resizable.defaults, a.fn.resizable.parseOptions(this), b || {}), a.data(this, "resizable", {
                        options: d
                    })),
                1 != d.disabled && a(this).bind("mousemove.resizable", {
                        target: this
                    }, function (b) {
                        if (!a.fn.resizable.isResizing) {
                            var d = c(b);
                            "" == d ? a(b.data.target).css("cursor", "") : a(b.data.target).css("cursor", d + "-resize")
                        }
                    }).bind("mouseleave.resizable", {
                        target: this
                    }, function (b) {
                        a(b.data.target).css("cursor", "")
                    }).bind("mousedown.resizable", {
                        target: this
                    }, function (b) {
                        function d(c) {
                            var d = parseInt(a(b.data.target).css(c));
                            return isNaN(d) ? 0 : d
                        }
                        var e = c(b);
                        if ("" != e) {
                            var i = {
                                target: b.data.target,
                                dir: e,
                                startLeft: d("left"),
                                startTop: d("top"),
                                left: d("left"),
                                top: d("top"),
                                startX: b.pageX,
                                startY: b.pageY,
                                startWidth: a(b.data.target).outerWidth(),
                                startHeight: a(b.data.target).outerHeight(),
                                width: a(b.data.target).outerWidth(),
                                height: a(b.data.target).outerHeight(),
                                deltaWidth: a(b.data.target).outerWidth() - a(b.data.target).width(),
                                deltaHeight: a(b.data.target).outerHeight() - a(b.data.target).height()
                            };
                            a(document).bind("mousedown.resizable", i, f),
                            a(document).bind("mousemove.resizable", i, g),
                            a(document).bind("mouseup.resizable", i, h),
                            a("body").css("cursor", e + "-resize")
                        }
                    })
            })
        },
        a.fn.resizable.methods = {
            options: function (b) {
                return a.data(b[0], "resizable").options
            },
            enable: function (b) {
                return b.each(function () {
                    a(this).resizable({
                        disabled: !1
                    })
                })
            },
            disable: function (b) {
                return b.each(function () {
                    a(this).resizable({
                        disabled: !0
                    })
                })
            }
        },
        a.fn.resizable.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, ["handles", {
                minWidth: "number",
                minHeight: "number",
                maxWidth: "number",
                maxHeight: "number",
                edge: "number"
            }]), {
                disabled: !! c.attr("disabled") || void 0
            })
        },
        a.fn.resizable.defaults = {
            disabled: !1,
            handles: "n, e, s, w, ne, se, sw, nw, all",
            minWidth: 10,
            minHeight: 10,
            maxWidth: 1e4,
            maxHeight: 1e4,
            edge: 5,
            onStartResize: function (a) {},
            onResize: function (a) {},
            onStopResize: function (a) {}
        },
        a.fn.resizable.isResizing = !1
    }(jQuery),


function (a) {
        function b(b, c) {
            var d = a.data(b, "linkbutton").options;
            if (c && a.extend(d, c), d.width || d.height || d.fit) {
                var e = a(b),
                    f = e.parent(),
                    g = e.is(":visible");
                if (!g) {
                        var h = a('<div style="display:none"></div>').insertBefore(b),
                            i = {
                                position: e.css("position"),
                                display: e.css("display"),
                                left: e.css("left")
                            };
                        e.appendTo("body"),
                        e.css({
                                position: "absolute",
                                display: "inline-block",
                                left: -2e4
                            })
                    }
                e._size(d, f);
                var j = e.find(".l-btn-left");
                j.css("margin-top", 0),
                j.css("margin-top", parseInt((e.height() - j.height()) / 2) + "px"),
                g || (e.insertAfter(h), e.css(i), h.remove())
            }
        }
        function c(b) {
            var c = a.data(b, "linkbutton").options,
                f = a(b).empty(),
                g = c.btnCls ? " " + c.btnCls : "";
            f.addClass("l-btn" + g).removeClass("l-btn-plain l-btn-selected l-btn-plain-selected l-btn-outline"),
            f.removeClass("l-btn-small l-btn-medium l-btn-large").addClass("l-btn-" + c.size),
            c.plain && f.addClass("l-btn-plain"),
            c.outline && f.addClass("l-btn-outline"),
            c.selected && f.addClass(c.plain ? "l-btn-selected l-btn-plain-selected" : "l-btn-selected"),
            f.attr("group", c.group || ""),
            f.attr("id", c.id || "");
            var h = a('<span class="l-btn-left"></span>').appendTo(f);
            c.text ? a('<span class="l-btn-text"></span>').html(c.text).appendTo(h) : a('<span class="l-btn-text l-btn-empty">&nbsp;</span>').appendTo(h),
            c.iconCls && (a('<span class="l-btn-icon">&nbsp;</span>').addClass(c.iconCls).appendTo(h), h.addClass("l-btn-icon-" + c.iconAlign)),
            f.unbind(".linkbutton").bind("focus.linkbutton", function () {
                    c.disabled || a(this).addClass("l-btn-focus")
                }).bind("blur.linkbutton", function () {
                    a(this).removeClass("l-btn-focus")
                }).bind("click.linkbutton", function () {
                    c.disabled || (c.toggle && (c.selected ? a(this).linkbutton("unselect") : a(this).linkbutton("select")), c.onClick.call(this))
                }),
            d(b, c.selected),
            e(b, c.disabled)
        }
        function d(b, c) {
            var d = a.data(b, "linkbutton").options;
            c ? (d.group && a('a.l-btn[group="' + d.group + '"]').each(function () {
                var b = a(this).linkbutton("options");
                b.toggle && (a(this).removeClass("l-btn-selected l-btn-plain-selected"), b.selected = !1)
            }), a(b).addClass(d.plain ? "l-btn-selected l-btn-plain-selected" : "l-btn-selected"), d.selected = !0) : d.group || (a(b).removeClass("l-btn-selected l-btn-plain-selected"), d.selected = !1)
        }
        function e(b, c) {
            var d = a.data(b, "linkbutton"),
                e = d.options;
            if (a(b).removeClass("l-btn-disabled l-btn-plain-disabled"), c) {
                    e.disabled = !0;
                    var f = a(b).attr("href");
                    f && (d.href = f, a(b).attr("href", "javascript:;")),
                    b.onclick && (d.onclick = b.onclick, b.onclick = null),
                    e.plain ? a(b).addClass("l-btn-disabled l-btn-plain-disabled") : a(b).addClass("l-btn-disabled")
                } else e.disabled = !1,
            d.href && a(b).attr("href", d.href),
            d.onclick && (b.onclick = d.onclick)
        }
        a.fn.linkbutton = function (d, e) {
            return "string" == typeof d ? a.fn.linkbutton.methods[d](this, e) : (d = d || {}, this.each(function () {
                var e = a.data(this, "linkbutton");
                e ? a.extend(e.options, d) : (a.data(this, "linkbutton", {
                    options: a.extend({}, a.fn.linkbutton.defaults, a.fn.linkbutton.parseOptions(this), d)
                }), a(this).removeAttr("disabled"), a(this).bind("_resize", function (c, d) {
                    return (a(this).hasClass("easyui-fluid") || d) && b(this),
                    !1
                })),
                c(this),
                b(this)
            }))
        },
        a.fn.linkbutton.methods = {
            options: function (b) {
                return a.data(b[0], "linkbutton").options
            },
            resize: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            enable: function (a) {
                return a.each(function () {
                    e(this, !1)
                })
            },
            disable: function (a) {
                return a.each(function () {
                    e(this, !0)
                })
            },
            select: function (a) {
                return a.each(function () {
                    d(this, !0)
                })
            },
            unselect: function (a) {
                return a.each(function () {
                    d(this, !1)
                })
            }
        },
        a.fn.linkbutton.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, ["id", "iconCls", "iconAlign", "group", "size", "text", {
                plain: "boolean",
                toggle: "boolean",
                selected: "boolean",
                outline: "boolean"
            }]), {
                disabled: !! c.attr("disabled") || void 0,
                text: a.trim(c.html()) || void 0,
                iconCls: c.attr("icon") || c.attr("iconCls")
            })
        },
        a.fn.linkbutton.defaults = {
            id: null,
            disabled: !1,
            toggle: !1,
            selected: !1,
            outline: !1,
            group: null,
            plain: !1,
            text: "",
            iconCls: null,
            iconAlign: "left",
            size: "small",
            onClick: function () {}
        }
    }(jQuery),


function ($) {
        function _ab(_ac) {
            function _b3(a) {
                var b = _ae.nav[a],
                    c = $('<a href="javascript:;"></a>').appendTo(tr);
                return c.wrap("<td></td>"),
                c.linkbutton({
                        iconCls: b.iconCls,
                        plain: !0
                    }).unbind(".pagination").bind("click.pagination", function () {
                        b.handler.call(_ac)
                    }),
                c
            }
            function _b0(a, b) {
                var c = $.inArray(b, a);
                return c >= 0 && a.splice(c, 1),
                a
            }
            var _ad = $.data(_ac, "pagination"),
                _ae = _ad.options,
                bb = _ad.bb = {},
                _af = $(_ac).addClass("pagination").html('<table cellspacing="0" cellpadding="0" border="0"><tr></tr></table>'),
                tr = _af.find("tr"),
                aa = $.extend([], _ae.layout);
            _ae.showPageList || _b0(aa, "list"),
            _ae.showPageInfo || _b0(aa, "info"),
            _ae.showRefresh || _b0(aa, "refresh"),
            "sep" == aa[0] && aa.shift(),
            "sep" == aa[aa.length - 1] && aa.pop();
            for (var _b1 = 0; _b1 < aa.length; _b1++) {
                    var _b2 = aa[_b1];
                    if ("list" == _b2) {
                        var ps = $('<select class="pagination-page-list"></select>');
                        ps.bind("change", function () {
                            _ae.pageSize = parseInt($(this).val()),
                            _ae.onChangePageSize.call(_ac, _ae.pageSize),
                            _b8(_ac, _ae.pageNumber)
                        });
                        for (var i = 0; i < _ae.pageList.length; i++) $("<option></option>").text(_ae.pageList[i]).appendTo(ps);
                        $("<td></td>").append(ps).appendTo(tr)
                    } else "sep" == _b2 ? $('<td><div class="pagination-btn-separator"></div></td>').appendTo(tr) : "first" == _b2 ? bb.first = _b3("first") : "prev" == _b2 ? bb.prev = _b3("prev") : "next" == _b2 ? bb.next = _b3("next") : "last" == _b2 ? bb.last = _b3("last") : "manual" == _b2 ? ($('<span style="padding-left:6px;"></span>').html(_ae.beforePageText).appendTo(tr).wrap("<td></td>"), bb.num = $('<input class="pagination-num" type="text" value="1" size="2">').appendTo(tr).wrap("<td></td>"), bb.num.unbind(".pagination").bind("keydown.pagination", function (a) {
                        if (13 == a.keyCode) {
                            var b = parseInt($(this).val()) || 1;
                            return _b8(_ac, b),
                            !1
                        }
                    }), bb.after = $('<span style="padding-right:6px;"></span>').appendTo(tr).wrap("<td></td>")) : "refresh" == _b2 ? bb.refresh = _b3("refresh") : "links" == _b2 ? $('<td class="pagination-links"></td>').appendTo(tr) : "info" == _b2 && (_b1 == aa.length - 1 ? ($('<div class="pagination-info"></div>').appendTo(_af), $('<div style="clear:both;"></div>').appendTo(_af)) : $('<td><div class="pagination-info"></div></td>').appendTo(tr))
                }
            if (_ae.buttons) if ($('<td><div class="pagination-btn-separator"></div></td>').appendTo(tr), $.isArray(_ae.buttons)) for (var i = 0; i < _ae.buttons.length; i++) {
                    var btn = _ae.buttons[i];
                    if ("-" == btn) $('<td><div class="pagination-btn-separator"></div></td>').appendTo(tr);
                    else {
                        var td = $("<td></td>").appendTo(tr),
                            a = $('<a href="javascript:;"></a>').appendTo(td);
                        a[0].onclick = eval(btn.handler ||
                            function () {}),
                        a.linkbutton($.extend({}, btn, {
                                plain: !0
                            }))
                    }
                } else {
                    var td = $("<td></td>").appendTo(tr);
                    $(_ae.buttons).appendTo(td).show()
                }
        }
        function _b8(a, b) {
            var c = $.data(a, "pagination").options;
            _bc(a, {
                pageNumber: b
            }),
            c.onSelectPage.call(a, c.pageNumber, c.pageSize)
        }
        function _bc(a, b) {
            var c = $.data(a, "pagination"),
                d = c.options,
                e = c.bb;
            $.extend(d, b || {});
            var f = $(a).find("select.pagination-page-list");
            f.length && (f.val(d.pageSize + ""), d.pageSize = parseInt(f.val()));
            var g = Math.ceil(d.total / d.pageSize) || 1;
            d.pageNumber < 1 && (d.pageNumber = 1),
            d.pageNumber > g && (d.pageNumber = g),
            0 == d.total && (d.pageNumber = 0, g = 0),
            e.num && e.num.val(d.pageNumber),
            e.after && e.after.html(d.afterPageText.replace(/{pages}/, g));
            var h = $(a).find("td.pagination-links");
            if (h.length) {
                    h.empty();
                    var i = d.pageNumber - Math.floor(d.links / 2);
                    i < 1 && (i = 1);
                    var j = i + d.links - 1;
                    j > g && (j = g),
                    i = j - d.links + 1,
                    i < 1 && (i = 1);
                    for (var k = i; k <= j; k++) {
                        var l = $('<a class="pagination-link" href="javascript:;"></a>').appendTo(h);
                        l.linkbutton({
                            plain: !0,
                            text: k
                        }),
                        k == d.pageNumber ? l.linkbutton("select") : l.unbind(".pagination").bind("click.pagination", {
                            pageNumber: k
                        }, function (b) {
                            _b8(a, b.data.pageNumber)
                        })
                    }
                }
            var m = d.displayMsg;
            m = m.replace(/{from}/, 0 == d.total ? 0 : d.pageSize * (d.pageNumber - 1) + 1),
            m = m.replace(/{to}/, Math.min(d.pageSize * d.pageNumber, d.total)),
            m = m.replace(/{total}/, d.total),
            $(a).find("div.pagination-info").html(m),
            e.first && e.first.linkbutton({
                    disabled: !d.total || 1 == d.pageNumber
                }),
            e.prev && e.prev.linkbutton({
                    disabled: !d.total || 1 == d.pageNumber
                }),
            e.next && e.next.linkbutton({
                    disabled: d.pageNumber == g
                }),
            e.last && e.last.linkbutton({
                    disabled: d.pageNumber == g
                }),
            _c5(a, d.loading)
        }
        function _c5(a, b) {
            var c = $.data(a, "pagination"),
                d = c.options;
            d.loading = b,
            d.showRefresh && c.bb.refresh && c.bb.refresh.linkbutton({
                    iconCls: d.loading ? "pagination-loading" : "pagination-load"
                })
        }
        $.fn.pagination = function (a, b) {
            return "string" == typeof a ? $.fn.pagination.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b, c = $.data(this, "pagination");
                c ? b = $.extend(c.options, a) : (b = $.extend({}, $.fn.pagination.defaults, $.fn.pagination.parseOptions(this), a), $.data(this, "pagination", {
                    options: b
                })),
                _ab(this),
                _bc(this)
            }))
        },
        $.fn.pagination.methods = {
            options: function (a) {
                return $.data(a[0], "pagination").options
            },
            loading: function (a) {
                return a.each(function () {
                    _c5(this, !0)
                })
            },
            loaded: function (a) {
                return a.each(function () {
                    _c5(this, !1)
                })
            },
            refresh: function (a, b) {
                return a.each(function () {
                    _bc(this, b)
                })
            },
            select: function (a, b) {
                return a.each(function () {
                    _b8(this, b)
                })
            }
        },
        $.fn.pagination.parseOptions = function (_d0) {
            var t = $(_d0);
            return $.extend({}, $.parser.parseOptions(_d0, [{
                total: "number",
                pageSize: "number",
                pageNumber: "number",
                links: "number"
            },
            {
                loading: "boolean",
                showPageList: "boolean",
                showPageInfo: "boolean",
                showRefresh: "boolean"
            }]), {
                pageList: t.attr("pageList") ? eval(t.attr("pageList")) : void 0
            })
        },
        $.fn.pagination.defaults = {
            total: 1,
            pageSize: 10,
            pageNumber: 1,
            pageList: [10, 20, 30, 50],
            loading: !1,
            buttons: null,
            showPageList: !0,
            showPageInfo: !0,
            showRefresh: !0,
            links: 10,
            layout: ["list", "sep", "first", "prev", "sep", "manual", "sep", "next", "last", "sep", "refresh", "info"],
            onSelectPage: function (a, b) {},
            onBeforeRefresh: function (a, b) {},
            onRefresh: function (a, b) {},
            onChangePageSize: function (a) {},
            beforePageText: "Page",
            afterPageText: "of {pages}",
            displayMsg: "Displaying {from} to {to} of {total} items",
            nav: {
                first: {
                    iconCls: "pagination-first",
                    handler: function () {
                        var a = $(this).pagination("options");
                        a.pageNumber > 1 && $(this).pagination("select", 1)
                    }
                },
                prev: {
                    iconCls: "pagination-prev",
                    handler: function () {
                        var a = $(this).pagination("options");
                        a.pageNumber > 1 && $(this).pagination("select", a.pageNumber - 1)
                    }
                },
                next: {
                    iconCls: "pagination-next",
                    handler: function () {
                        var a = $(this).pagination("options"),
                            b = Math.ceil(a.total / a.pageSize);
                        a.pageNumber < b && $(this).pagination("select", a.pageNumber + 1)
                    }
                },
                last: {
                    iconCls: "pagination-last",
                    handler: function () {
                        var a = $(this).pagination("options"),
                            b = Math.ceil(a.total / a.pageSize);
                        a.pageNumber < b && $(this).pagination("select", b)
                    }
                },
                refresh: {
                    iconCls: "pagination-refresh",
                    handler: function () {
                        var a = $(this).pagination("options");
                        0 != a.onBeforeRefresh.call(this, a.pageNumber, a.pageSize) && ($(this).pagination("select", a.pageNumber), a.onRefresh.call(this, a.pageNumber, a.pageSize))
                    }
                }
            }
        }
    }(jQuery),


function (a) {
        function b(b) {
            var c = a(b);
            return c.addClass("tree"),
            c
        }
        function c(b) {
            var c = a.data(b, "tree").options;
            a(b).unbind().bind("mouseover", function (b) {
                var c = a(b.target),
                    d = c.closest("div.tree-node");
                d.length && (d.addClass("tree-node-hover"), c.hasClass("tree-hit") && (c.hasClass("tree-expanded") ? c.addClass("tree-expanded-hover") : c.addClass("tree-collapsed-hover")), b.stopPropagation())
            }).bind("mouseout", function (b) {
                var c = a(b.target),
                    d = c.closest("div.tree-node");
                d.length && (d.removeClass("tree-node-hover"), c.hasClass("tree-hit") && (c.hasClass("tree-expanded") ? c.removeClass("tree-expanded-hover") : c.removeClass("tree-collapsed-hover")), b.stopPropagation())
            }).bind("click", function (d) {
                var e = a(d.target),
                    g = e.closest("div.tree-node");
                if (g.length) {
                        if (e.hasClass("tree-hit")) return q(b, g[0]),
                        !1;
                        if (e.hasClass("tree-checkbox")) return f(b, g[0]),
                        !1;
                        K(b, g[0]),
                        c.onClick.call(b, G(b, g[0])),
                        d.stopPropagation()
                    }
            }).bind("dblclick", function (d) {
                var e = a(d.target).closest("div.tree-node");
                e.length && (K(b, e[0]), c.onDblClick.call(b, G(b, e[0])), d.stopPropagation())
            }).bind("contextmenu", function (d) {
                var e = a(d.target).closest("div.tree-node");
                e.length && (c.onContextMenu.call(b, d, G(b, e[0])), d.stopPropagation())
            })
        }
        function d(b) {
            var c = a.data(b, "tree").options;
            c.dnd = !1;
            var d = a(b).find("div.tree-node");
            d.draggable("disable"),
            d.css("cursor", "pointer")
        }
        function e(b) {
            function c(b, c) {
                return a(b).closest("ul.tree").tree(c ? "pop" : "getData", b)
            }
            function d(b, c) {
                var d = a(b).draggable("proxy").find("span.tree-dnd-icon");
                d.removeClass("tree-dnd-yes tree-dnd-no").addClass(c ? "tree-dnd-yes" : "tree-dnd-no")
            }
            function e(d, e) {
                function f() {
                    var f = c(d, !0);
                    a(b).tree("append", {
                        parent: e,
                        data: [f]
                    }),
                    h.onDrop.call(b, e, f, "append")
                }
                "closed" == G(b, e).state ? o(b, e, function () {
                    f()
                }) : f()
            }
            function f(d, e, f) {
                var g = {};
                "top" == f ? g.before = e : g.after = e;
                var i = c(d, !0);
                g.data = i,
                a(b).tree("insert", g),
                h.onDrop.call(b, e, i, f)
            }
            var g = a.data(b, "tree"),
                h = g.options,
                i = g.tree;
            g.disabledNodes = [],
            h.dnd = !0,
            i.find("div.tree-node").draggable({
                    disabled: !1,
                    revert: !0,
                    cursor: "pointer",
                    proxy: function (b) {
                        var c = a('<div class="tree-node-proxy"></div>').appendTo("body");
                        return c.html('<span class="tree-dnd-icon tree-dnd-no">&nbsp;</span>' + a(b).find(".tree-title").html()),
                        c.hide(),
                        c
                    },
                    deltaX: 15,
                    deltaY: 15,
                    onBeforeDrag: function (c) {
                        if (0 == h.onBeforeDrag.call(b, G(b, this))) return !1;
                        if (a(c.target).hasClass("tree-hit") || a(c.target).hasClass("tree-checkbox")) return !1;
                        if (1 != c.which) return !1;
                        var d = a(this).find("span.tree-indent");
                        d.length && (c.data.offsetWidth -= d.length * d.width())
                    },
                    onStartDrag: function (c) {
                        a(this).next("ul").find("div.tree-node").each(function () {
                            a(this).droppable("disable"),
                            g.disabledNodes.push(this)
                        }),
                        a(this).draggable("proxy").css({
                            left: -1e4,
                            top: -1e4
                        }),
                        h.onStartDrag.call(b, G(b, this));
                        var d = G(b, this);
                        void 0 == d.id && (d.id = "easyui_tree_node_id_temp", y(b, d)),
                        g.draggingNodeId = d.id
                    },
                    onDrag: function (b) {
                        var c = b.pageX,
                            d = b.pageY,
                            e = b.data.startX,
                            f = b.data.startY,
                            g = Math.sqrt((c - e) * (c - e) + (d - f) * (d - f));
                        g > 3 && a(this).draggable("proxy").show(),
                        this.pageY = b.pageY
                    },
                    onStopDrag: function () {
                        for (var c = 0; c < g.disabledNodes.length; c++) a(g.disabledNodes[c]).droppable("enable");
                        g.disabledNodes = [];
                        var d = H(b, g.draggingNodeId);
                        d && "easyui_tree_node_id_temp" == d.id && (d.id = "", y(b, d)),
                        h.onStopDrag.call(b, d)
                    }
                }).droppable({
                    accept: "div.tree-node",
                    onDragEnter: function (e, f) {
                        0 == h.onDragEnter.call(b, this, c(f)) && (d(f, !1), a(this).removeClass("tree-node-append tree-node-top tree-node-bottom"), a(this).droppable("disable"), g.disabledNodes.push(this))
                    },
                    onDragOver: function (e, f) {
                        if (!a(this).droppable("options").disabled) {
                            var i = f.pageY,
                                j = a(this).offset().top,
                                k = j + a(this).outerHeight();
                            d(f, !0),
                            a(this).removeClass("tree-node-append tree-node-top tree-node-bottom"),
                            i > j + (k - j) / 2 ? k - i < 5 ? a(this).addClass("tree-node-bottom") : a(this).addClass("tree-node-append") : i - j < 5 ? a(this).addClass("tree-node-top") : a(this).addClass("tree-node-append"),
                            0 == h.onDragOver.call(b, this, c(f)) && (d(f, !1), a(this).removeClass("tree-node-append tree-node-top tree-node-bottom"), a(this).droppable("disable"), g.disabledNodes.push(this))
                        }
                    },
                    onDragLeave: function (e, f) {
                        d(f, !1),
                        a(this).removeClass("tree-node-append tree-node-top tree-node-bottom"),
                        h.onDragLeave.call(b, this, c(f))
                    },
                    onDrop: function (d, g) {
                        var i, j, k = this;
                        return a(this).hasClass("tree-node-append") ? (i = e, j = "append") : (i = f, j = a(this).hasClass("tree-node-top") ? "top" : "bottom"),
                        0 == h.onBeforeDrop.call(b, k, c(g), j) ? void a(this).removeClass("tree-node-append tree-node-top tree-node-bottom") : (i(g, k, j), void a(this).removeClass("tree-node-append tree-node-top tree-node-bottom"))
                    }
                })
        }
        function f(b, c, d, e) {
            var f = a.data(b, "tree"),
                j = f.options;
            if (j.checkbox) {
                    var k = G(b, c);
                    if (k.checkState) {
                        var l = a(c).find(".tree-checkbox");
                        if (void 0 == d && (l.hasClass("tree-checkbox1") ? d = !1 : l.hasClass("tree-checkbox0") ? d = !0 : (void 0 == k._checked && (k._checked = a(c).find(".tree-checkbox").hasClass("tree-checkbox1")), d = !k._checked)), k._checked = d, d) {
                            if (l.hasClass("tree-checkbox1")) return
                        } else if (l.hasClass("tree-checkbox0")) return;
                        (e || 0 != j.onBeforeCheck.call(b, k, d)) && (j.cascadeCheck ? (g(b, k, d), i(b, k)) : h(b, k, d ? "1" : "0"), e || j.onCheck.call(b, k, d))
                    }
                }
        }
        function g(b, c, d) {
            var e = a.data(b, "tree").options,
                f = d ? 1 : 0;
            if (h(b, c, f), e.deepCheck) a.easyui.forEach(c.children || [], !0, function (a) {
                    h(b, a, f)
                });
            else {
                    var g = [];
                    c.children && c.children.length && g.push(c),
                    a.easyui.forEach(c.children || [], !0, function (a) {
                        a.hidden || (h(b, a, f), a.children && a.children.length && g.push(a))
                    });
                    for (var i = g.length - 1; i >= 0; i--) {
                        var k = g[i];
                        h(b, k, j(k))
                    }
                }
        }
        function h(b, c, d) {
            var e = a.data(b, "tree").options;
            if (c.checkState && void 0 != d && (!c.hidden || e.deepCheck)) {
                var f = a("#" + c.domId).find(".tree-checkbox");
                c.checkState = ["unchecked", "checked", "indeterminate"][d],
                c.checked = "checked" == c.checkState,
                f.removeClass("tree-checkbox0 tree-checkbox1 tree-checkbox2"),
                f.addClass("tree-checkbox" + d)
            }
        }
        function i(b, c) {
            var d = C(b, a("#" + c.domId)[0]);
            d && (h(b, d, j(d)), i(b, d))
        }
        function j(b) {
            var c = 0,
                d = 0,
                e = 0;
            if (a.easyui.forEach(b.children || [], !1, function (a) {
                    a.checkState && (e++, "checked" == a.checkState ? d++ : "unchecked" == a.checkState && c++)
                }), 0 != e) {
                    var f = 0;
                    return f = c == e ? 0 : d == e ? 1 : 2
                }
        }
        function k(b, c) {
            var d = a.data(b, "tree").options;
            if (d.checkbox) {
                var e = a(c),
                    g = e.find(".tree-checkbox"),
                    h = G(b, c);
                if (d.view.hasCheckbox(b, h)) if (g.length || (h.checkState = h.checkState || "unchecked", a('<span class="tree-checkbox"></span>').insertBefore(e.find(".tree-title"))), "checked" == h.checkState) f(b, c, !0, !0);
                else if ("unchecked" == h.checkState) f(b, c, !1, !0);
                else {
                        var k = j(h);
                        0 === k ? f(b, c, !1, !0) : 1 === k && f(b, c, !0, !0)
                    } else g.remove(),
                h.checkState = void 0,
                h.checked = void 0,
                i(b, h)
            }
        }
        function l(b, c, d, g, h) {
            var i = a.data(b, "tree"),
                j = i.options,
                k = a(c).prevAll("div.tree-node:first");
            d = j.loadFilter.call(b, d, k[0]);
            var l = I(b, "domId", k.attr("id"));
            g ? l ? l.children ? l.children = l.children.concat(d) : l.children = d : i.data = i.data.concat(d) : (l ? l.children = d : i.data = d, a(c).empty()),
            j.view.render.call(j.view, b, c, d),
            j.dnd && e(b),
            l && y(b, l);
            for (var n = 0; n < i.tmpIds.length; n++) f(b, a("#" + i.tmpIds[n])[0], !0, !0);
            i.tmpIds = [],
            setTimeout(function () {
                    m(b, b)
                }, 0),
            h || j.onLoadSuccess.call(b, l, d)
        }
        function m(b, c, d) {
            function e(a, b) {
                var c = a.find("span.tree-icon");
                c.prev("span.tree-indent").addClass("tree-join")
            }
            function f(b) {
                var c = b.find("span.tree-indent, span.tree-hit").length;
                b.next().find("div.tree-node").each(function () {
                    a(this).children("span:eq(" + (c - 1) + ")").addClass("tree-line")
                })
            }
            var g = a.data(b, "tree").options;
            if (!g.lines) return void a(b).removeClass("tree-lines");
            if (a(b).addClass("tree-lines"), !d) {
                d = !0,
                a(b).find("span.tree-indent").removeClass("tree-line tree-join tree-joinbottom"),
                a(b).find("div.tree-node").removeClass("tree-node-last tree-root-first tree-root-one");
                var h = a(b).tree("getRoots");
                h.length > 1 ? a(h[0].target).addClass("tree-root-first") : 1 == h.length && a(h[0].target).addClass("tree-root-one")
            }
            a(c).children("li").each(function () {
                var c = a(this).children("div.tree-node"),
                    g = c.next("ul");
                g.length ? (a(this).next().length && f(c), m(b, g, d)) : e(c)
            });
            var i = a(c).children("li:last").children("div.tree-node").addClass("tree-node-last");
            i.children("span.tree-join").removeClass("tree-join").addClass("tree-joinbottom")
        }
        function n(b, c, d, e) {
            var f = a.data(b, "tree").options;
            d = a.extend({}, f.queryParams, d || {});
            var g = null;
            if (b != c) {
                var h = a(c).prev();
                g = G(b, h[0])
            }
            if (0 != f.onBeforeLoad.call(b, g, d)) {
                var i = a(c).prev().children("span.tree-folder");
                i.addClass("tree-loading");
                var j = f.loader.call(b, d, function (a) {
                    i.removeClass("tree-loading"),
                    l(b, c, a),
                    e && e()
                }, function () {
                    i.removeClass("tree-loading"),
                    f.onLoadError.apply(b, arguments),
                    e && e()
                });
                0 == j && i.removeClass("tree-loading")
            }
        }
        function o(b, c, d) {
            var e = a.data(b, "tree").options,
                f = a(c).children("span.tree-hit");
            if (0 != f.length && !f.hasClass("tree-expanded")) {
                    var g = G(b, c);
                    if (0 != e.onBeforeExpand.call(b, g)) {
                        f.removeClass("tree-collapsed tree-collapsed-hover").addClass("tree-expanded"),
                        f.next().addClass("tree-folder-open");
                        var h = a(c).next();
                        if (h.length) e.animate ? h.slideDown("normal", function () {
                            g.state = "open",
                            e.onExpand.call(b, g),
                            d && d()
                        }) : (h.css("display", "block"), g.state = "open", e.onExpand.call(b, g), d && d());
                        else {
                            var i = a('<ul style="display:none"></ul>').insertAfter(c);
                            n(b, i[0], {
                                id: g.id
                            }, function () {
                                i.is(":empty") && i.remove(),
                                e.animate ? i.slideDown("normal", function () {
                                    g.state = "open",
                                    e.onExpand.call(b, g),
                                    d && d()
                                }) : (i.css("display", "block"), g.state = "open", e.onExpand.call(b, g), d && d())
                            })
                        }
                    }
                }
        }
        function p(b, c) {
            var d = a.data(b, "tree").options,
                e = a(c).children("span.tree-hit");
            if (0 != e.length && !e.hasClass("tree-collapsed")) {
                    var f = G(b, c);
                    if (0 != d.onBeforeCollapse.call(b, f)) {
                        e.removeClass("tree-expanded tree-expanded-hover").addClass("tree-collapsed"),
                        e.next().removeClass("tree-folder-open");
                        var g = a(c).next();
                        d.animate ? g.slideUp("normal", function () {
                            f.state = "closed",
                            d.onCollapse.call(b, f)
                        }) : (g.css("display", "none"), f.state = "closed", d.onCollapse.call(b, f))
                    }
                }
        }
        function q(b, c) {
            var d = a(c).children("span.tree-hit");
            0 != d.length && (d.hasClass("tree-expanded") ? p(b, c) : o(b, c))
        }
        function r(a, b) {
            var c = B(a, b);
            b && c.unshift(G(a, b));
            for (var d = 0; d < c.length; d++) o(a, c[d].target)
        }
        function s(a, b) {
            for (var c = [], d = C(a, b); d;) c.unshift(d),
            d = C(a, d.target);
            for (var e = 0; e < c.length; e++) o(a, c[e].target)
        }
        function t(b, c) {
            for (var d = a(b).parent();
            "BODY" != d[0].tagName && "auto" != d.css("overflow-y");) d = d.parent();
            var e = a(c),
                f = e.offset().top;
            if ("BODY" != d[0].tagName) {
                    var g = d.offset().top;
                    f < g ? d.scrollTop(d.scrollTop() + f - g) : f + e.outerHeight() > g + d.outerHeight() - 18 && d.scrollTop(d.scrollTop() + f + e.outerHeight() - g - d.outerHeight() + 18)
                } else d.scrollTop(f)
        }
        function u(a, b) {
            var c = B(a, b);
            b && c.unshift(G(a, b));
            for (var d = 0; d < c.length; d++) p(a, c[d].target)
        }
        function v(b, c) {
            var d = a(c.parent),
                e = c.data;
            if (e && (e = a.isArray(e) ? e : [e], e.length)) {
                    var f;
                    if (0 == d.length) f = a(b);
                    else {
                        if (L(b, d[0])) {
                            var g = d.find("span.tree-icon");
                            g.removeClass("tree-file").addClass("tree-folder tree-folder-open");
                            var h = a('<span class="tree-hit tree-expanded"></span>').insertBefore(g);
                            h.prev().length && h.prev().remove()
                        }
                        f = d.next(),
                        f.length || (f = a("<ul></ul>").insertAfter(d))
                    }
                    l(b, f[0], e, !0, !0)
                }
        }
        function w(b, c) {
            var d = c.before || c.after,
                e = C(b, d),
                f = c.data;
            if (f && (f = a.isArray(f) ? f : [f], f.length)) {
                    v(b, {
                        parent: e ? e.target : null,
                        data: f
                    });
                    for (var g = e ? e.children : a(b).tree("getRoots"), h = 0; h < g.length; h++) if (g[h].domId == a(d).attr("id")) {
                        for (var i = f.length - 1; i >= 0; i--) g.splice(c.before ? h : h + 1, 0, f[i]);
                        g.splice(g.length - f.length, f.length);
                        break
                    }
                    for (var j = a(), h = 0; h < f.length; h++) j = j.add(a("#" + f[h].domId).parent());
                    c.before ? j.insertBefore(a(d).parent()) : j.insertAfter(a(d).parent())
                }
        }
        function x(b, c) {
            function d(c) {
                for (var d = a(c).attr("id"), e = C(b, c), f = e ? e.children : a.data(b, "tree").data, g = 0; g < f.length; g++) if (f[g].domId == d) {
                    f.splice(g, 1);
                    break
                }
                return e
            }
            var e = d(c);
            if (a(c).parent().remove(), e) {
                if (!e.children || !e.children.length) {
                    var f = a(e.target);
                    f.find(".tree-icon").removeClass("tree-folder").addClass("tree-file"),
                    f.find(".tree-hit").remove(),
                    a('<span class="tree-indent"></span>').prependTo(f),
                    f.next().remove()
                }
                y(b, e)
            }
            m(b, b)
        }
        function y(b, c) {
            var d = a.data(b, "tree").options,
                e = a(c.target),
                f = G(b, c.target);
            f.iconCls && e.find(".tree-icon").removeClass(f.iconCls),
            a.extend(f, c),
            e.find(".tree-title").html(d.formatter.call(b, f)),
            f.iconCls && e.find(".tree-icon").addClass(f.iconCls),
            k(b, c.target)
        }
        function z(a, b) {
            if (b) {
                for (var c = C(a, b); c;) b = c.target,
                c = C(a, b);
                return G(a, b)
            }
            var d = A(a);
            return d.length ? d[0] : null
        }
        function A(b) {
            for (var c = a.data(b, "tree").data, d = 0; d < c.length; d++) J(c[d]);
            return c
        }
        function B(b, c) {
            var d = [],
                e = G(b, c),
                f = e ? e.children || [] : a.data(b, "tree").data;
            return a.easyui.forEach(f, !0, function (a) {
                    d.push(J(a))
                }),
            d
        }
        function C(b, c) {
            var d = a(c).closest("ul").prevAll("div.tree-node:first");
            return G(b, d[0])
        }
        function D(b, c) {
            c = c || "checked",
            a.isArray(c) || (c = [c]);
            var d = [];
            return a.easyui.forEach(a.data(b, "tree").data, !0, function (b) {
                b.checkState && a.easyui.indexOfArray(c, b.checkState) != -1 && d.push(J(b))
            }),
            d
        }
        function E(b) {
            var c = a(b).find("div.tree-node-selected");
            return c.length ? G(b, c[0]) : null
        }
        function F(b, c) {
            var d = G(b, c);
            return d && d.children && a.easyui.forEach(d.children, !0, function (a) {
                J(a)
            }),
            d
        }
        function G(b, c) {
            return I(b, "domId", a(c).attr("id"))
        }
        function H(a, b) {
            return I(a, "id", b)
        }
        function I(b, c, d) {
            var e = a.data(b, "tree").data,
                f = null;
            return a.easyui.forEach(e, !0, function (a) {
                    if (a[c] == d) return f = J(a),
                    !1
                }),
            f
        }
        function J(b) {
            return b.target = a("#" + b.domId)[0],
            b
        }
        function K(b, c) {
            var d = a.data(b, "tree").options,
                e = G(b, c);
            0 != d.onBeforeSelect.call(b, e) && (a(b).find("div.tree-node-selected").removeClass("tree-node-selected"), a(c).addClass("tree-node-selected"), d.onSelect.call(b, e))
        }
        function L(b, c) {
            return 0 == a(c).children("span.tree-hit").length
        }
        function M(b, c) {
            var d = a.data(b, "tree").options,
                e = G(b, c);
            if (0 != d.onBeforeEdit.call(b, e)) {
                    a(c).css("position", "relative");
                    var f = a(c).find(".tree-title"),
                        g = f.outerWidth();
                    f.empty();
                    var h = a('<input class="tree-editor">').appendTo(f);
                    h.val(e.text).focus(),
                    h.width(g + 20),
                    h._outerHeight(18),
                    h.bind("click", function (a) {
                            return !1
                        }).bind("mousedown", function (a) {
                            a.stopPropagation()
                        }).bind("mousemove", function (a) {
                            a.stopPropagation()
                        }).bind("keydown", function (a) {
                            return 13 == a.keyCode ? (N(b, c), !1) : 27 == a.keyCode ? (O(b, c), !1) : void 0
                        }).bind("blur", function (a) {
                            a.stopPropagation(),
                            N(b, c)
                        })
                }
        }
        function N(b, c) {
            var d = a.data(b, "tree").options;
            a(c).css("position", "");
            var e = a(c).find("input.tree-editor"),
                f = e.val();
            e.remove();
            var g = G(b, c);
            g.text = f,
            y(b, g),
            d.onAfterEdit.call(b, g)
        }
        function O(b, c) {
            var d = a.data(b, "tree").options;
            a(c).css("position", ""),
            a(c).find("input.tree-editor").remove();
            var e = G(b, c);
            y(b, e),
            d.onCancelEdit.call(b, e)
        }
        function P(b, c) {
            function d(c) {
                for (var d = a(b).tree("getParent", a("#" + c)[0]); d;) a(d.target).removeClass("tree-node-hidden"),
                d.hidden = !1,
                d = a(b).tree("getParent", d.target)
            }
            var e = a.data(b, "tree"),
                f = e.options,
                g = {};
            a.easyui.forEach(e.data, !0, function (d) {
                    f.filter.call(b, c, d) ? (a("#" + d.domId).removeClass("tree-node-hidden"), g[d.domId] = 1, d.hidden = !1) : (a("#" + d.domId).addClass("tree-node-hidden"), d.hidden = !0)
                });
            for (var h in g) d(h)
        }
        a.fn.tree = function (d, e) {
            if ("string" == typeof d) return a.fn.tree.methods[d](this, e);
            var d = d || {};
            return this.each(function () {
                var e, f = a.data(this, "tree");
                if (f) e = a.extend(f.options, d),
                f.options = e;
                else {
                    e = a.extend({}, a.fn.tree.defaults, a.fn.tree.parseOptions(this), d),
                    a.data(this, "tree", {
                        options: e,
                        tree: b(this),
                        data: [],
                        tmpIds: []
                    });
                    var g = a.fn.tree.parseData(this);
                    g.length && l(this, this, g)
                }
                c(this),
                e.data && l(this, this, a.extend(!0, [], e.data)),
                n(this, this)
            })
        },
        a.fn.tree.methods = {
            options: function (b) {
                return a.data(b[0], "tree").options
            },
            loadData: function (a, b) {
                return a.each(function () {
                    l(this, this, b)
                })
            },
            getNode: function (a, b) {
                return G(a[0], b)
            },
            getData: function (a, b) {
                return F(a[0], b)
            },
            reload: function (b, c) {
                return b.each(function () {
                    if (c) {
                        var b = a(c),
                            d = b.children("span.tree-hit");
                        d.removeClass("tree-expanded tree-expanded-hover").addClass("tree-collapsed"),
                        b.next().remove(),
                        o(this, c)
                    } else a(this).empty(),
                    n(this, this)
                })
            },
            getRoot: function (a, b) {
                return z(a[0], b)
            },
            getRoots: function (a) {
                return A(a[0])
            },
            getParent: function (a, b) {
                return C(a[0], b)
            },
            getChildren: function (a, b) {
                return B(a[0], b)
            },
            getChecked: function (a, b) {
                return D(a[0], b)
            },
            getSelected: function (a) {
                return E(a[0])
            },
            isLeaf: function (a, b) {
                return L(a[0], b)
            },
            find: function (a, b) {
                return H(a[0], b)
            },
            select: function (a, b) {
                return a.each(function () {
                    K(this, b)
                })
            },
            check: function (a, b) {
                return a.each(function () {
                    f(this, b, !0)
                })
            },
            uncheck: function (a, b) {
                return a.each(function () {
                    f(this, b, !1)
                })
            },
            collapse: function (a, b) {
                return a.each(function () {
                    p(this, b)
                })
            },
            expand: function (a, b) {
                return a.each(function () {
                    o(this, b)
                })
            },
            collapseAll: function (a, b) {
                return a.each(function () {
                    u(this, b)
                })
            },
            expandAll: function (a, b) {
                return a.each(function () {
                    r(this, b)
                })
            },
            expandTo: function (a, b) {
                return a.each(function () {
                    s(this, b)
                })
            },
            scrollTo: function (a, b) {
                return a.each(function () {
                    t(this, b)
                })
            },
            toggle: function (a, b) {
                return a.each(function () {
                    q(this, b)
                })
            },
            append: function (a, b) {
                return a.each(function () {
                    v(this, b)
                })
            },
            insert: function (a, b) {
                return a.each(function () {
                    w(this, b)
                })
            },
            remove: function (a, b) {
                return a.each(function () {
                    x(this, b)
                })
            },
            pop: function (a, b) {
                var c = a.tree("getData", b);
                return a.tree("remove", b),
                c
            },
            update: function (b, c) {
                return b.each(function () {
                    y(this, a.extend({}, c, {
                        checkState: c.checked ? "checked" : c.checked === !1 ? "unchecked" : void 0
                    }))
                })
            },
            enableDnd: function (a) {
                return a.each(function () {
                    e(this)
                })
            },
            disableDnd: function (a) {
                return a.each(function () {
                    d(this)
                })
            },
            beginEdit: function (a, b) {
                return a.each(function () {
                    M(this, b)
                })
            },
            endEdit: function (a, b) {
                return a.each(function () {
                    N(this, b)
                })
            },
            cancelEdit: function (a, b) {
                return a.each(function () {
                    O(this, b)
                })
            },
            doFilter: function (a, b) {
                return a.each(function () {
                    P(this, b)
                })
            }
        },
        a.fn.tree.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.parser.parseOptions(b, ["url", "method", {
                checkbox: "boolean",
                cascadeCheck: "boolean",
                onlyLeafCheck: "boolean"
            },
            {
                animate: "boolean",
                lines: "boolean",
                dnd: "boolean"
            }]))
        },
        a.fn.tree.parseData = function (b) {
            function c(b, d) {
                d.children("li").each(function () {
                    var d = a(this),
                        e = a.extend({}, a.parser.parseOptions(this, ["id", "iconCls", "state"]), {
                            checked: !! d.attr("checked") || void 0
                        });
                    e.text = d.children("span").html(),
                    e.text || (e.text = d.html());
                    var f = d.children("ul");
                    f.length && (e.children = [], c(e.children, f)),
                    b.push(e)
                })
            }
            var d = [];
            return c(d, a(b)),
            d
        };
        var Q = 1,
            R = {
                render: function (b, c, d) {
                    function e(c, d) {
                        for (var h = [], j = 0; j < d.length; j++) {
                            var k = d[j];
                            "open" != k.state && "closed" != k.state && (k.state = "open"),
                            k.domId = "_easyui_tree_" + Q++,
                            h.push("<li>"),
                            h.push('<div id="' + k.domId + '" class="tree-node">');
                            for (var l = 0; l < c; l++) h.push('<span class="tree-indent"></span>');
                            if ("closed" == k.state ? (h.push('<span class="tree-hit tree-collapsed"></span>'), h.push('<span class="tree-icon tree-folder ' + (k.iconCls ? k.iconCls : "") + '"></span>')) : k.children && k.children.length ? (h.push('<span class="tree-hit tree-expanded"></span>'), h.push('<span class="tree-icon tree-folder tree-folder-open ' + (k.iconCls ? k.iconCls : "") + '"></span>')) : (h.push('<span class="tree-indent"></span>'), h.push('<span class="tree-icon tree-file ' + (k.iconCls ? k.iconCls : "") + '"></span>')), this.hasCheckbox(b, k)) {
                                var m = 0;
                                i && "checked" == i.checkState && g.cascadeCheck ? (m = 1, k.checked = !0) : k.checked && a.easyui.addArrayItem(f.tmpIds, k.domId),
                                k.checkState = m ? "checked" : "unchecked",
                                h.push('<span class="tree-checkbox tree-checkbox' + m + '"></span>')
                            } else k.checkState = void 0,
                            k.checked = void 0;
                            if (h.push('<span class="tree-title">' + g.formatter.call(b, k) + "</span>"), h.push("</div>"), k.children && k.children.length) {
                                var n = e.call(this, c + 1, k.children);
                                h.push('<ul style="display:' + ("closed" == k.state ? "none" : "block") + '">'),
                                h = h.concat(n),
                                h.push("</ul>")
                            }
                            h.push("</li>")
                        }
                        return h
                    }
                    var f = a.data(b, "tree"),
                        g = f.options,
                        h = a(c).prev(".tree-node"),
                        i = h.length ? a(b).tree("getNode", h[0]) : null,
                        j = h.find("span.tree-indent, span.tree-hit").length,
                        k = e.call(this, j, d);
                    a(c).append(k.join(""))
                },
                hasCheckbox: function (b, c) {
                    var d = a.data(b, "tree"),
                        e = d.options;
                    if (e.checkbox) {
                            if (a.isFunction(e.checkbox)) return !!e.checkbox.call(b, c);
                            if (!e.onlyLeafCheck) return !0;
                            if (!("open" != c.state || c.children && c.children.length)) return !0
                        }
                    return !1
                }
            };
        a.fn.tree.defaults = {
                url: null,
                method: "post",
                animate: !1,
                checkbox: !1,
                cascadeCheck: !0,
                onlyLeafCheck: !1,
                lines: !1,
                dnd: !1,
                data: null,
                queryParams: {},
                formatter: function (a) {
                    return a.text
                },
                filter: function (b, c) {
                    var d = [];
                    a.map(a.isArray(b) ? b : [b], function (b) {
                        b = a.trim(b),
                        b && d.push(b)
                    });
                    for (var e = 0; e < d.length; e++) {
                        var f = c.text.toLowerCase().indexOf(d[e].toLowerCase());
                        if (f >= 0) return !0
                    }
                    return !d.length
                },
                loader: function (b, c, d) {
                    var e = a(this).tree("options");
                    return !!e.url && void a.ajax({
                        type: e.method,
                        url: e.url,
                        data: b,
                        dataType: "json",
                        success: function (a) {
                            c(a)
                        },
                        error: function () {
                            d.apply(this, arguments)
                        }
                    })
                },
                loadFilter: function (a, b) {
                    return a
                },
                view: R,
                onBeforeLoad: function (a, b) {},
                onLoadSuccess: function (a, b) {},
                onLoadError: function () {},
                onClick: function (a) {},
                onDblClick: function (a) {},
                onBeforeExpand: function (a) {},
                onExpand: function (a) {},
                onBeforeCollapse: function (a) {},
                onCollapse: function (a) {},
                onBeforeCheck: function (a, b) {},
                onCheck: function (a, b) {},
                onBeforeSelect: function (a) {},
                onSelect: function (a) {},
                onContextMenu: function (a, b) {},
                onBeforeDrag: function (a) {},
                onStartDrag: function (a) {},
                onStopDrag: function (a) {},
                onDragEnter: function (a, b) {},
                onDragOver: function (a, b) {},
                onDragLeave: function (a, b) {},
                onBeforeDrop: function (a, b, c) {},
                onDrop: function (a, b, c) {},
                onBeforeEdit: function (a) {},
                onAfterEdit: function (a) {},
                onCancelEdit: function (a) {}
            }
    }(jQuery),


function (a) {
        function b(b) {
            return a(b).addClass("progressbar"),
            a(b).html('<div class="progressbar-text"></div><div class="progressbar-value"><div class="progressbar-text"></div></div>'),
            a(b).bind("_resize", function (d, e) {
                return (a(this).hasClass("easyui-fluid") || e) && c(b),
                !1
            }),
            a(b)
        }
        function c(b, c) {
            var d = a.data(b, "progressbar").options,
                e = a.data(b, "progressbar").bar;
            c && (d.width = c),
            e._size(d),
            e.find("div.progressbar-text").css("width", e.width()),
            e.find("div.progressbar-text,div.progressbar-value").css({
                    height: e.height() + "px",
                    lineHeight: e.height() + "px"
                })
        }
        a.fn.progressbar = function (d, e) {
            if ("string" == typeof d) {
                var f = a.fn.progressbar.methods[d];
                if (f) return f(this, e)
            }
            return d = d || {},
            this.each(function () {
                var e = a.data(this, "progressbar");
                e ? a.extend(e.options, d) : e = a.data(this, "progressbar", {
                    options: a.extend({}, a.fn.progressbar.defaults, a.fn.progressbar.parseOptions(this), d),
                    bar: b(this)
                }),
                a(this).progressbar("setValue", e.options.value),
                c(this)
            })
        },
        a.fn.progressbar.methods = {
            options: function (b) {
                return a.data(b[0], "progressbar").options
            },
            resize: function (a, b) {
                return a.each(function () {
                    c(this, b)
                })
            },
            getValue: function (b) {
                return a.data(b[0], "progressbar").options.value
            },
            setValue: function (b, c) {
                return c < 0 && (c = 0),
                c > 100 && (c = 100),
                b.each(function () {
                    var b = a.data(this, "progressbar").options,
                        d = b.text.replace(/{value}/, c),
                        e = b.value;
                    b.value = c,
                    a(this).find("div.progressbar-value").width(c + "%"),
                    a(this).find("div.progressbar-text").html(d),
                    e != c && b.onChange.call(this, c, e)
                })
            }
        },
        a.fn.progressbar.parseOptions = function (b) {
            return a.extend({}, a.parser.parseOptions(b, ["width", "height", "text", {
                value: "number"
            }]))
        },
        a.fn.progressbar.defaults = {
            width: "auto",
            height: 22,
            value: 0,
            text: "{value}%",
            onChange: function (a, b) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            a(b).addClass("tooltip-f")
        }
        function c(b) {
            var c = a.data(b, "tooltip").options;
            a(b).unbind(".tooltip").bind(c.showEvent + ".tooltip", function (c) {
                a(b).tooltip("show", c)
            }).bind(c.hideEvent + ".tooltip", function (c) {
                a(b).tooltip("hide", c)
            }).bind("mousemove.tooltip", function (d) {
                c.trackMouse && (c.trackMouseX = d.pageX, c.trackMouseY = d.pageY, a(b).tooltip("reposition"))
            })
        }
        function d(b) {
            var c = a.data(b, "tooltip");
            c.showTimer && (clearTimeout(c.showTimer), c.showTimer = null),
            c.hideTimer && (clearTimeout(c.hideTimer), c.hideTimer = null)
        }
        function e(b) {
            function c(c) {
                e.position = c || "bottom",
                f.removeClass("tooltip-top tooltip-bottom tooltip-left tooltip-right").addClass("tooltip-" + e.position);
                var d, g, h = a.isFunction(e.deltaX) ? e.deltaX.call(b, e.position) : e.deltaX,
                    i = a.isFunction(e.deltaY) ? e.deltaY.call(b, e.position) : e.deltaY;
                if (e.trackMouse) j = a(),
                d = e.trackMouseX + h,
                g = e.trackMouseY + i;
                else {
                        var j = a(b);
                        d = j.offset().left + h,
                        g = j.offset().top + i
                    }
                switch (e.position) {
                    case "right":
                        d += j._outerWidth() + 12 + (e.trackMouse ? 12 : 0),
                        g -= (f._outerHeight() - j._outerHeight()) / 2;
                        break;
                    case "left":
                        d -= f._outerWidth() + 12 + (e.trackMouse ? 12 : 0),
                        g -= (f._outerHeight() - j._outerHeight()) / 2;
                        break;
                    case "top":
                        d -= (f._outerWidth() - j._outerWidth()) / 2,
                        g -= f._outerHeight() + 12 + (e.trackMouse ? 12 : 0);
                        break;
                    case "bottom":
                        d -= (f._outerWidth() - j._outerWidth()) / 2,
                        g += j._outerHeight() + 12 + (e.trackMouse ? 12 : 0)
                    }
                return {
                        left: d,
                        top: g
                    }
            }
            var d = a.data(b, "tooltip");
            if (d && d.tip) {
                var e = d.options,
                    f = d.tip,
                    g = {
                        left: -1e5,
                        top: -1e5
                    };
                if (a(b).is(":visible")) if (g = c(e.position), "top" == e.position && g.top < 0 ? g = c("bottom") : "bottom" == e.position && g.top + f._outerHeight() > a(window)._outerHeight() + a(document).scrollTop() && (g = c("top")), g.left < 0)"left" == e.position ? g = c("right") : (a(b).tooltip("arrow").css("left", f._outerWidth() / 2 + g.left), g.left = 0);
                else if (g.left + f._outerWidth() > a(window)._outerWidth() + a(document)._scrollLeft()) if ("right" == e.position) g = c("left");
                else {
                        var h = g.left;
                        g.left = a(window)._outerWidth() + a(document)._scrollLeft() - f._outerWidth(),
                        a(b).tooltip("arrow").css("left", f._outerWidth() / 2 - (g.left - h))
                    }
                f.css({
                        left: g.left,
                        top: g.top,
                        zIndex: void 0 != e.zIndex ? e.zIndex : a.fn.window ? a.fn.window.defaults.zIndex++ : ""
                    }),
                e.onPosition.call(b, g.left, g.top)
            }
        }
        function f(b, c) {
            var e = a.data(b, "tooltip"),
                f = e.options,
                g = e.tip;
            g || (g = a('<div tabindex="-1" class="tooltip"><div class="tooltip-content"></div><div class="tooltip-arrow-outer"></div><div class="tooltip-arrow"></div></div>').appendTo("body"), e.tip = g, h(b)),
            d(b),
            e.showTimer = setTimeout(function () {
                    a(b).tooltip("reposition"),
                    g.show(),
                    f.onShow.call(b, c);
                    var d = g.children(".tooltip-arrow-outer"),
                        e = g.children(".tooltip-arrow"),
                        h = "border-" + f.position + "-color";
                    d.add(e).css({
                            borderTopColor: "",
                            borderBottomColor: "",
                            borderLeftColor: "",
                            borderRightColor: ""
                        }),
                    d.css(h, g.css(h)),
                    e.css(h, g.css("backgroundColor"))
                }, f.showDelay)
        }
        function g(b, c) {
            var e = a.data(b, "tooltip");
            e && e.tip && (d(b), e.hideTimer = setTimeout(function () {
                e.tip.hide(),
                e.options.onHide.call(b, c)
            }, e.options.hideDelay))
        }
        function h(b, c) {
            var d = a.data(b, "tooltip"),
                e = d.options;
            if (c && (e.content = c), d.tip) {
                    var f = "function" == typeof e.content ? e.content.call(b) : e.content;
                    d.tip.children(".tooltip-content").html(f),
                    e.onUpdate.call(b, f)
                }
        }
        function i(b) {
            var c = a.data(b, "tooltip");
            if (c) {
                d(b);
                var e = c.options;
                c.tip && c.tip.remove(),
                e._title && a(b).attr("title", e._title),
                a.removeData(b, "tooltip"),
                a(b).unbind(".tooltip").removeClass("tooltip-f"),
                e.onDestroy.call(b)
            }
        }
        a.fn.tooltip = function (d, e) {
            return "string" == typeof d ? a.fn.tooltip.methods[d](this, e) : (d = d || {}, this.each(function () {
                var e = a.data(this, "tooltip");
                e ? a.extend(e.options, d) : (a.data(this, "tooltip", {
                    options: a.extend({}, a.fn.tooltip.defaults, a.fn.tooltip.parseOptions(this), d)
                }), b(this)),
                c(this),
                h(this)
            }))
        },
        a.fn.tooltip.methods = {
            options: function (b) {
                return a.data(b[0], "tooltip").options
            },
            tip: function (b) {
                return a.data(b[0], "tooltip").tip
            },
            arrow: function (a) {
                return a.tooltip("tip").children(".tooltip-arrow-outer,.tooltip-arrow")
            },
            show: function (a, b) {
                return a.each(function () {
                    f(this, b)
                })
            },
            hide: function (a, b) {
                return a.each(function () {
                    g(this, b)
                })
            },
            update: function (a, b) {
                return a.each(function () {
                    h(this, b)
                })
            },
            reposition: function (a) {
                return a.each(function () {
                    e(this)
                })
            },
            destroy: function (a) {
                return a.each(function () {
                    i(this)
                })
            }
        },
        a.fn.tooltip.parseOptions = function (b) {
            var c = a(b),
                d = a.extend({}, a.parser.parseOptions(b, ["position", "showEvent", "hideEvent", "content", {
                    trackMouse: "boolean",
                    deltaX: "number",
                    deltaY: "number",
                    showDelay: "number",
                    hideDelay: "number"
                }]), {
                    _title: c.attr("title")
                });
            return c.attr("title", ""),
            d.content || (d.content = d._title),
            d
        },
        a.fn.tooltip.defaults = {
            position: "bottom",
            content: null,
            trackMouse: !1,
            deltaX: 0,
            deltaY: 0,
            showEvent: "mouseenter",
            hideEvent: "mouseleave",
            showDelay: 200,
            hideDelay: 100,
            onShow: function (a) {},
            onHide: function (a) {},
            onUpdate: function (a) {},
            onPosition: function (a, b) {},
            onDestroy: function () {}
        }
    }(jQuery),


function ($) {
        function _210(a) {
            a._remove()
        }
        function _211(a, b) {
            var c = $.data(a, "panel"),
                d = c.options,
                e = c.panel,
                f = e.children(".panel-header"),
                g = e.children(".panel-body"),
                h = e.children(".panel-footer"),
                i = "left" == d.halign || "right" == d.halign;
            if (b && $.extend(d, {
                    width: b.width,
                    height: b.height,
                    minWidth: b.minWidth,
                    maxWidth: b.maxWidth,
                    minHeight: b.minHeight,
                    maxHeight: b.maxHeight,
                    left: b.left,
                    top: b.top
                }), e._size(d), i || f._outerWidth(e.width()), g._outerWidth(e.width()), isNaN(parseInt(d.height))) {
                    g.css("height", "");
                    var j = $.parser.parseValue("minHeight", d.minHeight, e.parent()),
                        k = $.parser.parseValue("maxHeight", d.maxHeight, e.parent()),
                        l = f._outerHeight() + h._outerHeight() + e._outerHeight() - e.height();
                    g._size("minHeight", j ? j - l : ""),
                    g._size("maxHeight", k ? k - l : "")
                } else if (i) {
                    if (d.header) var m = $(d.header)._outerWidth();
                    else {
                        f.css("width", "");
                        var m = f._outerWidth()
                    }
                    var n = f.find(".panel-title");
                    m += Math.min(n._outerWidth(), n._outerHeight());
                    var o = e.height();
                    f._outerWidth(m)._outerHeight(o),
                    n._outerWidth(f.height()),
                    g._outerWidth(e.width() - m - h._outerWidth())._outerHeight(o),
                    h._outerHeight(o),
                    g.css({
                        left: "",
                        right: ""
                    }).css(d.halign, f.position()[d.halign] + m + "px"),
                    d.panelCssWidth = e.css("width"),
                    d.collapsed && e._outerWidth(m + h._outerWidth())
                } else g._outerHeight(e.height() - f._outerHeight() - h._outerHeight());
            e.css({
                    height: i ? void 0 : "",
                    minHeight: "",
                    maxHeight: "",
                    left: d.left,
                    top: d.top
                }),
            d.onResize.apply(a, [d.width, d.height]),
            $(a).panel("doLayout")
        }
        function _21e(a, b) {
            var c = $.data(a, "panel"),
                d = c.options,
                e = c.panel;
            b && (null != b.left && (d.left = b.left), null != b.top && (d.top = b.top)),
            e.css({
                    left: d.left,
                    top: d.top
                }),
            e.find(".tooltip-f").each(function () {
                    $(this).tooltip("reposition")
                }),
            d.onMove.apply(a, [d.left, d.top])
        }
        function _223(a) {
            $(a).addClass("panel-body")._size("clear");
            var b = $('<div class="panel"></div>').insertBefore(a);
            return b[0].appendChild(a),
            b.bind("_resize", function (b, c) {
                return ($(this).hasClass("easyui-fluid") || c) && _211(a),
                !1
            }),
            b
        }
        function _227(_228) {
            function _22b() {
                if (opts.noheader || !opts.title && !opts.header) _210(_22a.children(".panel-header")),
                _22a.children(".panel-body").addClass("panel-body-noheader");
                else {
                    if (opts.header) $(opts.header).addClass("panel-header").prependTo(_22a);
                    else {
                        var _22f = _22a.children(".panel-header");
                        _22f.length || (_22f = $('<div class="panel-header"></div>').prependTo(_22a)),
                        $.isArray(opts.tools) || _22f.find("div.panel-tool .panel-tool-a").appendTo(opts.tools),
                        _22f.empty();
                        var _230 = $('<div class="panel-title"></div>').html(opts.title).appendTo(_22f);
                        opts.iconCls && (_230.addClass("panel-with-icon"), $('<div class="panel-icon"></div>').addClass(opts.iconCls).appendTo(_22f)),
                        "left" != opts.halign && "right" != opts.halign || _230.addClass("panel-title-" + opts.titleDirection);
                        var tool = $('<div class="panel-tool"></div>').appendTo(_22f);
                        tool.bind("click", function (a) {
                            a.stopPropagation()
                        }),
                        opts.tools && ($.isArray(opts.tools) ? $.map(opts.tools, function (t) {
                            _231(tool, t.iconCls, eval(t.handler))
                        }) : $(opts.tools).children().each(function () {
                            $(this).addClass($(this).attr("iconCls")).addClass("panel-tool-a").appendTo(tool)
                        })),
                        opts.collapsible && _231(tool, "panel-tool-collapse", function () {
                            1 == opts.collapsed ? _251(_228, !0) : _242(_228, !0)
                        }),
                        opts.minimizable && _231(tool, "panel-tool-min", function () {
                            _257(_228)
                        }),
                        opts.maximizable && _231(tool, "panel-tool-max", function () {
                            1 == opts.maximized ? _25a(_228) : _241(_228)
                        }),
                        opts.closable && _231(tool, "panel-tool-close", function () {
                            _243(_228)
                        })
                    }
                    _22a.children("div.panel-body").removeClass("panel-body-noheader")
                }
            }
            function _231(a, b, c) {
                var d = $('<a href="javascript:;"></a>').addClass(b).appendTo(a);
                d.bind("click", c)
            }
            function _22c() {
                opts.footer ? ($(opts.footer).addClass("panel-footer").appendTo(_22a), $(_228).addClass("panel-body-nobottom")) : (_22a.children(".panel-footer").remove(), $(_228).removeClass("panel-body-nobottom"))
            }
            var _229 = $.data(_228, "panel"),
                opts = _229.options,
                _22a = _229.panel;
            _22a.css(opts.style),
            _22a.addClass(opts.cls),
            _22a.removeClass("panel-hleft panel-hright").addClass("panel-h" + opts.halign),
            _22b(),
            _22c();
            var _22d = $(_228).panel("header"),
                body = $(_228).panel("body"),
                _22e = $(_228).siblings(".panel-footer");
            opts.border ? (_22d.removeClass("panel-header-noborder"), body.removeClass("panel-body-noborder"), _22e.removeClass("panel-footer-noborder")) : (_22d.addClass("panel-header-noborder"), body.addClass("panel-body-noborder"), _22e.addClass("panel-footer-noborder")),
            _22d.addClass(opts.headerCls),
            body.addClass(opts.bodyCls),
            $(_228).attr("id", opts.id || ""),
            opts.content && ($(_228).panel("clear"), $(_228).html(opts.content), $.parser.parse($(_228)))
        }
        function _233(a, b) {
            var c = $.data(a, "panel"),
                d = c.options;
            if (e && (d.queryParams = b), d.href && (!c.isLoaded || !d.cache)) {
                    var e = $.extend({}, d.queryParams);
                    if (0 == d.onBeforeLoad.call(a, e)) return;
                    c.isLoaded = !1,
                    d.loadingMessage && ($(a).panel("clear"), $(a).html($('<div class="panel-loading"></div>').html(d.loadingMessage))),
                    d.loader.call(a, e, function (b) {
                        var e = d.extractor.call(a, b);
                        $(a).panel("clear"),
                        $(a).html(e),
                        $.parser.parse($(a)),
                        d.onLoad.apply(a, arguments),
                        c.isLoaded = !0
                    }, function () {
                        d.onLoadError.apply(a, arguments)
                    })
                }
        }
        function _239(a) {
            var b = $(a);
            b.find(".combo-f").each(function () {
                $(this).combo("destroy")
            }),
            b.find(".m-btn").each(function () {
                $(this).menubutton("destroy")
            }),
            b.find(".s-btn").each(function () {
                $(this).splitbutton("destroy")
            }),
            b.find(".tooltip-f").each(function () {
                $(this).tooltip("destroy")
            }),
            b.children("div").each(function () {
                $(this)._size("unfit")
            }),
            b.empty()
        }
        function _23b(a) {
            $(a).panel("doLayout", !0)
        }
        function _23d(a, b) {
            function c() {
                d.closed = !1,
                d.minimized = !1;
                var b = e.children(".panel-header").find("a.panel-tool-restore");
                b.length && (d.maximized = !0),
                d.onOpen.call(a),
                1 == d.maximized && (d.maximized = !1, _241(a)),
                1 == d.collapsed && (d.collapsed = !1, _242(a)),
                d.collapsed || (_233(a), _23b(a))
            }
            var d = $.data(a, "panel").options,
                e = $.data(a, "panel").panel;
            if (1 == b || 0 != d.onBeforeOpen.call(a)) if (e.stop(!0, !0), $.isFunction(d.openAnimation)) d.openAnimation.call(a, c);
            else switch (d.openAnimation) {
                case "slide":
                    e.slideDown(d.openDuration, c);
                    break;
                case "fade":
                    e.fadeIn(d.openDuration, c);
                    break;
                case "show":
                    e.show(d.openDuration, c);
                    break;
                default:
                    e.show(),
                    c()
                }
        }
        function _243(a, b) {
            function c() {
                e.closed = !0,
                e.onClose.call(a)
            }
            var d = $.data(a, "panel"),
                e = d.options,
                f = d.panel;
            if (1 == b || 0 != e.onBeforeClose.call(a)) if (f.find(".tooltip-f").each(function () {
                    $(this).tooltip("hide")
                }), f.stop(!0, !0), f._size("unfit"), $.isFunction(e.closeAnimation)) e.closeAnimation.call(a, c);
            else switch (e.closeAnimation) {
                case "slide":
                    f.slideUp(e.closeDuration, c);
                    break;
                case "fade":
                    f.fadeOut(e.closeDuration, c);
                    break;
                case "hide":
                    f.hide(e.closeDuration, c);
                    break;
                default:
                    f.hide(),
                    c()
                }
        }
        function _248(a, b) {
            var c = $.data(a, "panel");
            if(!c) return;
            var d = c.options,
                e = c.panel;
            1 != b && 0 == d.onBeforeDestroy.call(a) || ($(a).panel("clear").panel("clear", "footer"), _210(e), d.onDestroy.call(a))
        }
        function _242(a, b) {
            function c() {
                f.hide(),
                d.collapsed = !0,
                d.onCollapse.call(a)
            }
            var d = $.data(a, "panel").options,
                e = $.data(a, "panel").panel,
                f = e.children(".panel-body"),
                g = e.children(".panel-header"),
                h = g.find("a.panel-tool-collapse");
            1 != d.collapsed && (f.stop(!0, !0), 0 != d.onBeforeCollapse.call(a) && (h.addClass("panel-tool-expand"), 1 == b ? "left" == d.halign || "right" == d.halign ? e.animate({
                    width: g._outerWidth() + e.children(".panel-footer")._outerWidth()
                }, function () {
                    c()
                }) : f.slideUp("normal", function () {
                    c()
                }) : ("left" != d.halign && "right" != d.halign || e._outerWidth(g._outerWidth() + e.children(".panel-footer")._outerWidth()), c())))
        }
        function _251(a, b) {
            function c() {
                f.show(),
                d.collapsed = !1,
                d.onExpand.call(a),
                _233(a),
                _23b(a)
            }
            var d = $.data(a, "panel").options,
                e = $.data(a, "panel").panel,
                f = e.children(".panel-body"),
                g = e.children(".panel-header").find("a.panel-tool-collapse");
            0 != d.collapsed && (f.stop(!0, !0), 0 != d.onBeforeExpand.call(a) && (g.removeClass("panel-tool-expand"), 1 == b ? "left" == d.halign || "right" == d.halign ? (f.show(), e.animate({
                    width: d.panelCssWidth
                }, function () {
                    c()
                })) : f.slideDown("normal", function () {
                    c()
                }) : ("left" != d.halign && "right" != d.halign || e.css("width", d.panelCssWidth), c())))
        }
        function _241(a) {
            var b = $.data(a, "panel").options,
                c = $.data(a, "panel").panel,
                d = c.children(".panel-header").find("a.panel-tool-max");
            1 != b.maximized && (d.addClass("panel-tool-restore"), $.data(a, "panel").original || ($.data(a, "panel").original = {
                    width: b.width,
                    height: b.height,
                    left: b.left,
                    top: b.top,
                    fit: b.fit
                }), b.left = 0, b.top = 0, b.fit = !0, _211(a), b.minimized = !1, b.maximized = !0, b.onMaximize.call(a))
        }
        function _257(a) {
            var b = $.data(a, "panel").options,
                c = $.data(a, "panel").panel;
            c._size("unfit"),
            c.hide(),
            b.minimized = !0,
            b.maximized = !1,
            b.onMinimize.call(a)
        }
        function _25a(a) {
            var b = $.data(a, "panel").options,
                c = $.data(a, "panel").panel,
                d = c.children(".panel-header").find("a.panel-tool-max");
            0 != b.maximized && (c.show(), d.removeClass("panel-tool-restore"), $.extend(b, $.data(a, "panel").original), _211(a), b.minimized = !1, b.maximized = !1, $.data(a, "panel").original = null, b.onRestore.call(a))
        }
        function _25d(a, b) {
            $.data(a, "panel").options.title = b,
            $(a).panel("header").find("div.panel-title").html(b)
        }
        $.fn._remove = function () {
            return this.each(function () {
                $(this).remove();
                try {
                    this.outerHTML = ""
                } catch (a) {}
            })
        };
        var _260 = null;
        $(window).unbind(".panel").bind("resize.panel", function () {
            _260 && clearTimeout(_260),
            _260 = setTimeout(function () {
                var a = $("body.layout");
                a.length ? (a.layout("resize"), $("body").children(".easyui-fluid:visible").each(function () {
                    $(this).triggerHandler("_resize")
                })) : $("body").panel("doLayout"),
                _260 = null
            }, 100)
        }),
        $.fn.panel = function (a, b) {
            return "string" == typeof a ? $.fn.panel.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b, c = $.data(this, "panel");
                c ? (b = $.extend(c.options, a), c.isLoaded = !1) : (b = $.extend({}, $.fn.panel.defaults, $.fn.panel.parseOptions(this), a), $(this).attr("title", ""), c = $.data(this, "panel", {
                    options: b,
                    panel: _223(this),
                    isLoaded: !1
                })),
                _227(this),
                $(this).show(),
                1 == b.doSize && (c.panel.css("display", "block"), _211(this)),
                1 == b.closed || 1 == b.minimized ? c.panel.hide() : _23d(this)
            }))
        },
        $.fn.panel.methods = {
            options: function (a) {
                return $.data(a[0], "panel").options
            },
            panel: function (a) {
                return $.data(a[0], "panel").panel
            },
            header: function (a) {
                return $.data(a[0], "panel").panel.children(".panel-header")
            },
            footer: function (a) {
                return a.panel("panel").children(".panel-footer")
            },
            body: function (a) {
                return $.data(a[0], "panel").panel.children(".panel-body")
            },
            setTitle: function (a, b) {
                return a.each(function () {
                    _25d(this, b)
                })
            },
            open: function (a, b) {
                return a.each(function () {
                    _23d(this, b)
                })
            },
            close: function (a, b) {
                return a.each(function () {
                    _243(this, b)
                })
            },
            destroy: function (a, b) {
                return a.each(function () {
                    _248(this, b)
                })
            },
            clear: function (a, b) {
                return a.each(function () {
                    _239("footer" == b ? $(this).panel("footer") : this)
                })
            },
            refresh: function (a, b) {
                return a.each(function () {
                    var a = $.data(this, "panel");
                    a.isLoaded = !1,
                    b && ("string" == typeof b ? a.options.href = b : a.options.queryParams = b),
                    _233(this)
                })
            },
            resize: function (a, b) {
                return a.each(function () {
                    _211(this, b)
                })
            },
            doLayout: function (a, b) {
                return a.each(function () {
                    function a(a, c) {
                        if (a) {
                            var d = a == $("body")[0],
                                e = $(a).find("div.panel:visible,div.accordion:visible,div.tabs-container:visible,div.layout:visible,.easyui-fluid:visible").filter(function (b, e) {
                                    var f = $(e).parents(".panel-" + c + ":first");
                                    return d ? 0 == f.length : f[0] == a
                                });
                            e.each(function () {
                                    $(this).triggerHandler("_resize", [b || !1])
                                })
                        }
                    }
                    a(this, "body"),
                    a($(this).siblings(".panel-footer")[0], "footer")
                })
            },
            move: function (a, b) {
                return a.each(function () {
                    _21e(this, b)
                })
            },
            maximize: function (a) {
                return a.each(function () {
                    _241(this)
                })
            },
            minimize: function (a) {
                return a.each(function () {
                    _257(this)
                })
            },
            restore: function (a) {
                return a.each(function () {
                    _25a(this)
                })
            },
            collapse: function (a, b) {
                return a.each(function () {
                    _242(this, b)
                })
            },
            expand: function (a, b) {
                return a.each(function () {
                    _251(this, b)
                })
            }
        },
        $.fn.panel.parseOptions = function (a) {
            var b = $(a),
                c = b.children(".panel-header,header"),
                d = b.children(".panel-footer,footer");
            return $.extend({}, $.parser.parseOptions(a, ["id", "width", "height", "left", "top", "title", "iconCls", "cls", "headerCls", "bodyCls", "tools", "href", "method", "header", "footer", "halign", "titleDirection", {
                    cache: "boolean",
                    fit: "boolean",
                    border: "boolean",
                    noheader: "boolean"
                },
                {
                    collapsible: "boolean",
                    minimizable: "boolean",
                    maximizable: "boolean"
                },
                {
                    closable: "boolean",
                    collapsed: "boolean",
                    minimized: "boolean",
                    maximized: "boolean",
                    closed: "boolean"
                },
                "openAnimation", "closeAnimation", {
                    openDuration: "number",
                    closeDuration: "number"
                }]), {
                    loadingMessage: void 0 != b.attr("loadingMessage") ? b.attr("loadingMessage") : void 0,
                    header: c.length ? c.removeClass("panel-header") : void 0,
                    footer: d.length ? d.removeClass("panel-footer") : void 0
                })
        },
        $.fn.panel.defaults = {
            id: null,
            title: null,
            iconCls: null,
            width: "auto",
            height: "auto",
            left: null,
            top: null,
            cls: null,
            headerCls: null,
            bodyCls: null,
            style: {},
            href: null,
            cache: !0,
            fit: !1,
            border: !0,
            doSize: !0,
            noheader: !1,
            content: null,
            halign: "top",
            titleDirection: "down",
            collapsible: !1,
            minimizable: !1,
            maximizable: !1,
            closable: !1,
            collapsed: !1,
            minimized: !1,
            maximized: !1,
            closed: !1,
            openAnimation: !1,
            openDuration: 400,
            closeAnimation: !1,
            closeDuration: 400,
            tools: null,
            footer: null,
            header: null,
            queryParams: {},
            method: "get",
            href: null,
            loadingMessage: "Loading...",
            loader: function (a, b, c) {
                var d = $(this).panel("options");
                return !!d.href && void $.ajax({
                    type: d.method,
                    url: d.href,
                    cache: !1,
                    data: a,
                    dataType: "html",
                    success: function (a) {
                        b(a)
                    },
                    error: function () {
                        c.apply(this, arguments)
                    }
                })
            },
            extractor: function (a) {
                var b = /<body[^>]*>((.|[\n\r])*)<\/body>/im,
                    c = b.exec(a);
                return c ? c[1] : a
            },
            onBeforeLoad: function (a) {},
            onLoad: function () {},
            onLoadError: function () {},
            onBeforeOpen: function () {},
            onOpen: function () {},
            onBeforeClose: function () {},
            onClose: function () {},
            onBeforeDestroy: function () {},
            onDestroy: function () {},
            onResize: function (a, b) {},
            onMove: function (a, b) {},
            onMaximize: function () {},
            onRestore: function () {},
            onMinimize: function () {},
            onBeforeCollapse: function () {},
            onBeforeExpand: function () {},
            onCollapse: function () {},
            onExpand: function () {}
        }
    }(jQuery),


function (a) {
        function b(b, c) {
            var d = a.data(b, "window");
            c && (null != c.left && (d.options.left = c.left), null != c.top && (d.options.top = c.top)),
            a(b).panel("move", d.options),
            d.shadow && d.shadow.css({
                left: d.options.left,
                top: d.options.top
            })
        }
        function c(c, d) {
            var e = a.data(c, "window").options,
                f = a(c).window("panel"),
                g = f._outerWidth();
            if (e.inline) {
                    var h = f.parent();
                    e.left = Math.ceil((h.width() - g) / 2 + h.scrollLeft())
                } else e.left = Math.ceil((a(window)._outerWidth() - g) / 2 + a(document).scrollLeft());
            d && b(c)
        }
        function d(c, d) {
            var e = a.data(c, "window").options,
                f = a(c).window("panel"),
                g = f._outerHeight();
            if (e.inline) {
                    var h = f.parent();
                    e.top = Math.ceil((h.height() - g) / 2 + h.scrollTop())
                } else e.top = Math.ceil((a(window)._outerHeight() - g) / 2 + a(document).scrollTop());
            d && b(c)
        }
        function e(e) {
            var f = a.data(e, "window"),
                g = f.options,
                h = a(e).panel(a.extend({}, f.options, {
                    border: !1,
                    doSize: !0,
                    closed: !0,
                    cls: "window " + (g.border ? "thin" == g.border ? "window-thinborder " : "" : "window-thinborder window-noborder ") + (g.cls || ""),
                    headerCls: "window-header " + (g.headerCls || ""),
                    bodyCls: "window-body " + (g.noheader ? "window-body-noheader " : " ") + (g.bodyCls || ""),
                    onBeforeDestroy: function () {
                        return 0 != g.onBeforeDestroy.call(e) && (f.shadow && f.shadow.remove(), void(f.mask && f.mask.remove()))
                    },
                    onClose: function () {
                        f.shadow && f.shadow.hide(),
                        f.mask && f.mask.hide(),
                        g.onClose.call(e)
                    },
                    onOpen: function () {
                        f.mask && f.mask.css(a.extend({
                            display: "block",
                            zIndex: a.fn.window.defaults.zIndex++
                        }, a.fn.window.getMaskSize(e))),
                        f.shadow && f.shadow.css({
                            display: "block",
                            zIndex: a.fn.window.defaults.zIndex++,
                            left: g.left,
                            top: g.top,
                            width: f.window._outerWidth(),
                            height: f.window._outerHeight()
                        }),
                        f.window.css("z-index", a.fn.window.defaults.zIndex++),
                        g.onOpen.call(e)
                    },
                    onResize: function (b, c) {
                        var d = a(this).panel("options");
                        a.extend(g, {
                            width: d.width,
                            height: d.height,
                            left: d.left,
                            top: d.top
                        }),
                        f.shadow && f.shadow.css({
                            left: g.left,
                            top: g.top,
                            width: f.window._outerWidth(),
                            height: f.window._outerHeight()
                        }),
                        g.onResize.call(e, b, c)
                    },
                    onMinimize: function () {
                        f.shadow && f.shadow.hide(),
                        f.mask && f.mask.hide(),
                        f.options.onMinimize.call(e)
                    },
                    onBeforeCollapse: function () {
                        return 0 != g.onBeforeCollapse.call(e) && void(f.shadow && f.shadow.hide())
                    },
                    onExpand: function () {
                        f.shadow && f.shadow.show(),
                        g.onExpand.call(e)
                    }
                }));
            f.window = h.panel("panel"),
            f.mask && f.mask.remove(),
            g.modal && (f.mask = a('<div class="window-mask" style="display:none"></div>').insertAfter(f.window)),
            f.shadow && f.shadow.remove(),
            g.shadow && (f.shadow = a('<div class="window-shadow" style="display:none"></div>').insertAfter(f.window));
            var i = g.closed;
            null == g.left && c(e),
            null == g.top && d(e),
            b(e),
            i || h.window("open")
        }
        function f(b, c, d, e) {
            var f = this,
                g = a.data(f, "window"),
                h = g.options;
            if (!h.constrain) return {};
            if (a.isFunction(h.constrain)) return h.constrain.call(f, b, c, d, e);
            var i = a(f).window("window"),
                j = h.inline ? i.parent() : a(window);
            return b < 0 && (b = 0),
            c < j.scrollTop() && (c = j.scrollTop()),
            b + d > j.width() && (d == i.outerWidth() ? b = j.width() - d : d = j.width() - b),
            c - j.scrollTop() + e > j.height() && (e == i.outerHeight() ? c = j.height() - e + j.scrollTop() : e = j.height() - c + j.scrollTop()),
            {
                    left: b,
                    top: c,
                    width: d,
                    height: e
                }
        }
        function g(b) {
            function c(b) {
                g.pmask && g.pmask.remove(),
                g.pmask = a('<div class="window-proxy-mask"></div>').insertAfter(g.window),
                g.pmask.css({
                    display: "none",
                    zIndex: a.fn.window.defaults.zIndex++,
                    left: b.data.left,
                    top: b.data.top,
                    width: g.window._outerWidth(),
                    height: g.window._outerHeight()
                }),
                g.proxy && g.proxy.remove(),
                g.proxy = a('<div class="window-proxy"></div>').insertAfter(g.window),
                g.proxy.css({
                    display: "none",
                    zIndex: a.fn.window.defaults.zIndex++,
                    left: b.data.left,
                    top: b.data.top
                }),
                g.proxy._outerWidth(b.data.width)._outerHeight(b.data.height),
                g.proxy.hide(),
                setTimeout(function () {
                    g.pmask && g.pmask.show(),
                    g.proxy && g.proxy.show()
                }, 500)
            }
            function d(c) {
                a.extend(c.data, f.call(b, c.data.left, c.data.top, c.data.width, c.data.height)),
                g.pmask.show(),
                g.proxy.css({
                    display: "block",
                    left: c.data.left,
                    top: c.data.top
                }),
                g.proxy._outerWidth(c.data.width),
                g.proxy._outerHeight(c.data.height)
            }
            function e(c, d) {
                a.extend(c.data, f.call(b, c.data.left, c.data.top, c.data.width + .1, c.data.height + .1)),
                a(b).window(d, c.data),
                g.pmask.remove(),
                g.pmask = null,
                g.proxy.remove(),
                g.proxy = null
            }
            var g = a.data(b, "window");
            g.window.draggable({
                handle: ">div.panel-header>div.panel-title",
                disabled: 0 == g.options.draggable,
                onBeforeDrag: function (b) {
                    g.mask && g.mask.css("z-index", a.fn.window.defaults.zIndex++),
                    g.shadow && g.shadow.css("z-index", a.fn.window.defaults.zIndex++),
                    g.window.css("z-index", a.fn.window.defaults.zIndex++)
                },
                onStartDrag: function (a) {
                    c(a)
                },
                onDrag: function (a) {
                    return d(a),
                    !1
                },
                onStopDrag: function (a) {
                    e(a, "move")
                }
            }),
            g.window.resizable({
                disabled: 0 == g.options.resizable,
                onStartResize: function (a) {
                    c(a)
                },
                onResize: function (a) {
                    return d(a),
                    !1
                },
                onStopResize: function (a) {
                    e(a, "resize")
                }
            })
        }
        a(function () {
            a._positionFixed || a(window).resize(function () {
                a("body>div.window-mask:visible").css({
                    width: "",
                    height: ""
                }),
                setTimeout(function () {
                    a("body>div.window-mask:visible").css(a.fn.window.getMaskSize())
                }, 50)
            })
        }),
        a.fn.window = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.window.methods[b];
                return d ? d(this, c) : this.panel(b, c)
            }
            return b = b || {},
            this.each(function () {
                var c = a.data(this, "window");
                c ? a.extend(c.options, b) : (c = a.data(this, "window", {
                    options: a.extend({}, a.fn.window.defaults, a.fn.window.parseOptions(this), b)
                }), c.options.inline || document.body.appendChild(this)),
                e(this),
                g(this)
            })
        },
        a.fn.window.methods = {
            options: function (b) {
                var c = b.panel("options"),
                    d = a.data(b[0], "window").options;
                return a.extend(d, {
                        closed: c.closed,
                        collapsed: c.collapsed,
                        minimized: c.minimized,
                        maximized: c.maximized
                    })
            },
            window: function (b) {
                return a.data(b[0], "window").window
            },
            move: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            hcenter: function (a) {
                return a.each(function () {
                    c(this, !0)
                })
            },
            vcenter: function (a) {
                return a.each(function () {
                    d(this, !0)
                })
            },
            center: function (a) {
                return a.each(function () {
                    c(this),
                    d(this),
                    b(this)
                })
            }
        },
        a.fn.window.getMaskSize = function (b) {
            var c = a(b).data("window");
            return c && c.options.inline ? {} : a._positionFixed ? {
                position: "fixed"
            } : {
                width: a(document).width(),
                height: a(document).height()
            }
        },
        a.fn.window.parseOptions = function (b) {
            return a.extend({}, a.fn.panel.parseOptions(b), a.parser.parseOptions(b, [{
                draggable: "boolean",
                resizable: "boolean",
                shadow: "boolean",
                modal: "boolean",
                inline: "boolean"
            }]))
        },
        a.fn.window.defaults = a.extend({}, a.fn.panel.defaults, {
            zIndex: 9e3,
            draggable: !0,
            resizable: !0,
            shadow: !0,
            modal: !1,
            border: !0,
            inline: !1,
            title: "New Window",
            collapsible: !0,
            minimizable: !0,
            maximizable: !0,
            closable: !0,
            closed: !1,
            constrain: !1
        })
    }(jQuery),


function ($) {
        function _2a7(_2a8) {
            var opts = $.data(_2a8, "dialog").options;
            opts.inited = !1,
            $(_2a8).window($.extend({}, opts, {
                onResize: function (a, b) {
                    opts.inited && (_2ad(this), opts.onResize.call(this, a, b))
                }
            }));
            var win = $(_2a8).window("window");
            if (opts.toolbar) if ($.isArray(opts.toolbar)) {
                $(_2a8).siblings("div.dialog-toolbar").remove();
                for (var _2a9 = $('<div class="dialog-toolbar"><table cellspacing="0" cellpadding="0"><tr></tr></table></div>').appendTo(win), tr = _2a9.find("tr"), i = 0; i < opts.toolbar.length; i++) {
                    var btn = opts.toolbar[i];
                    if ("-" == btn) $('<td><div class="dialog-tool-separator"></div></td>').appendTo(tr);
                    else {
                        var td = $("<td></td>").appendTo(tr),
                            tool = $('<a href="javascript:;"></a>').appendTo(td);
                        tool[0].onclick = eval(btn.handler ||
                            function () {}),
                        tool.linkbutton($.extend({}, btn, {
                                plain: !0
                            }))
                    }
                }
            } else $(opts.toolbar).addClass("dialog-toolbar").appendTo(win),
            $(opts.toolbar).show();
            else $(_2a8).siblings("div.dialog-toolbar").remove();
            if (opts.buttons) if ($.isArray(opts.buttons)) {
                $(_2a8).siblings("div.dialog-button").remove();
                for (var _2aa = $('<div class="dialog-button"></div>').appendTo(win), i = 0; i < opts.buttons.length; i++) {
                    var p = opts.buttons[i],
                        _2ab = $('<a href="javascript:;"></a>').appendTo(_2aa);
                    p.handler && (_2ab[0].onclick = p.handler),
                    _2ab.linkbutton(p)
                }
            } else $(opts.buttons).addClass("dialog-button").appendTo(win),
            $(opts.buttons).show();
            else $(_2a8).siblings("div.dialog-button").remove();
            opts.inited = !0;
            var _2ac = opts.closed;
            win.show(),
            $(_2a8).window("resize"),
            _2ac && win.hide()
        }
        function _2ad(a, b) {
            var c = $(a),
                d = c.dialog("options"),
                e = d.noheader,
                f = c.siblings(".dialog-toolbar"),
                g = c.siblings(".dialog-button");
            f.insertBefore(a).css({
                    borderTopWidth: e ? 1 : 0,
                    top: e ? f.length : 0
                }),
            g.insertAfter(a),
            f.add(g)._outerWidth(c._outerWidth()).find(".easyui-fluid:visible").each(function () {
                    $(this).triggerHandler("_resize")
                });
            var h = f._outerHeight() + g._outerHeight();
            if (isNaN(parseInt(d.height))) {
                    var i = c._size("min-height");
                    i && c._size("min-height", i - h);
                    var j = c._size("max-height");
                    j && c._size("max-height", j - h)
                } else c._outerHeight(c._outerHeight() - h);
            var k = $.data(a, "window").shadow;
            if (k) {
                    var l = c.panel("panel");
                    k.css({
                        width: l._outerWidth(),
                        height: l._outerHeight()
                    })
                }
        }
        $.fn.dialog = function (a, b) {
            if ("string" == typeof a) {
                var c = $.fn.dialog.methods[a];
                return c ? c(this, b) : this.window(a, b)
            }
            return a = a || {},
            this.each(function () {
                var b = $.data(this, "dialog");
                b ? $.extend(b.options, a) : $.data(this, "dialog", {
                    options: $.extend({}, $.fn.dialog.defaults, $.fn.dialog.parseOptions(this), a)
                }),
                _2a7(this)
            })
        },
        $.fn.dialog.methods = {
            options: function (a) {
                var b = $.data(a[0], "dialog").options,
                    c = a.panel("options");
                return $.extend(b, {
                        width: c.width,
                        height: c.height,
                        left: c.left,
                        top: c.top,
                        closed: c.closed,
                        collapsed: c.collapsed,
                        minimized: c.minimized,
                        maximized: c.maximized
                    }),
                b
            },
            dialog: function (a) {
                return a.window("window")
            }
        },
        $.fn.dialog.parseOptions = function (a) {
            var b = $(a);
            return $.extend({}, $.fn.window.parseOptions(a), $.parser.parseOptions(a, ["toolbar", "buttons"]), {
                toolbar: b.children(".dialog-toolbar").length ? b.children(".dialog-toolbar").removeClass("dialog-toolbar") : void 0,
                buttons: b.children(".dialog-button").length ? b.children(".dialog-button").removeClass("dialog-button") : void 0
            })
        },
        $.fn.dialog.defaults = $.extend({}, $.fn.window.defaults, {
            title: "New Dialog",
            collapsible: !1,
            minimizable: !1,
            maximizable: !1,
            resizable: !1,
            toolbar: null,
            buttons: null
        })
    }(jQuery),


function (a) {
        function b() {
            a(document).unbind(".messager").bind("keydown.messager", function (b) {
                if (27 == b.keyCode) a("body").children("div.messager-window").children("div.messager-body").each(function () {
                    a(this).dialog("close")
                });
                else if (9 == b.keyCode) {
                    var c = a("body").children("div.messager-window");
                    if (!c.length) return;
                    for (var d = c.find(".messager-input,.messager-button .l-btn"), e = 0; e < d.length; e++) if (a(d[e]).is(":focus")) return a(d[e >= d.length - 1 ? 0 : e + 1]).focus(),
                    !1
                } else if (13 == b.keyCode) {
                    var g = a(b.target).closest("input.messager-input");
                    if (g.length) {
                        var h = g.closest(".messager-body");
                        f(h, g.val())
                    }
                }
            })
        }
        function c() {
            a(document).unbind(".messager")
        }
        function d(b) {
            var c = a.extend({}, a.messager.defaults, {
                modal: !1,
                shadow: !1,
                draggable: !1,
                resizable: !1,
                closed: !0,
                style: {
                    left: "",
                    top: "",
                    right: 0,
                    zIndex: a.fn.window.defaults.zIndex++,
                    bottom: -document.body.scrollTop - document.documentElement.scrollTop
                },
                title: "",
                width: 250,
                height: 100,
                minHeight: 0,
                showType: "slide",
                showSpeed: 600,
                content: b.msg,
                timeout: 4e3
            }, b),
                d = a('<div class="messager-body"></div>').appendTo("body");
            return d.dialog(a.extend({}, c, {
                    noheader: !c.title,
                    openAnimation: c.showType,
                    closeAnimation: "show" == c.showType ? "hide" : c.showType,
                    openDuration: c.showSpeed,
                    closeDuration: c.showSpeed,
                    onOpen: function () {
                        function a() {
                            c.timeout > 0 && (c.timer = setTimeout(function () {
                                d.length && d.data("dialog") && d.dialog("close")
                            }, c.timeout))
                        }
                        d.dialog("dialog").hover(function () {
                            c.timer && clearTimeout(c.timer)
                        }, function () {
                            a()
                        }),
                        a(),
                        b.onOpen ? b.onOpen.call(this) : c.onOpen.call(this)
                    },
                    onClose: function () {
                        c.timer && clearTimeout(c.timer),
                        b.onClose ? b.onClose.call(this) : c.onClose.call(this),
                        d.dialog("destroy")
                    }
                })),
            d.dialog("dialog").css(c.style),
            d.dialog("open"),
            d
        }
        function e(d) {
            b();
            var e = a('<div class="messager-body"></div>').appendTo("body");
            e.dialog(a.extend({}, d, {
                noheader: !d.title,
                onClose: function () {
                    c(),
                    d.onClose && d.onClose.call(this),
                    setTimeout(function () {
                        e.dialog("destroy")
                    }, 100)
                }
            }));
            var f = e.dialog("dialog").addClass("messager-window"),
                g = f.find(".dialog-button").addClass("messager-button");
            return g.find("a:first").addClass("topjui-btn-red").find(".l-btn-left").addClass("l-btn-icon-left").append('<span class="l-btn-icon fa fa-check-circle">&nbsp;</span>'),
            g.find("a:eq(1)").addClass("topjui-btn-green").find(".l-btn-left").addClass("l-btn-icon-left").append('<span class="l-btn-icon fa fa-remove">&nbsp;</span>'),
            e
        }
        function f(a, b) {
            a.dialog("close"),
            a.dialog("options").fn(b)
        }
        a.messager = {
            show: function (a) {
                return d(a)
            },
            alert: function (b, c, d, g) {
                var h = "object" == typeof b ? b : {
                    title: b,
                    msg: c,
                    icon: d,
                    fn: g
                },
                    i = h.icon ? "messager-icon " + h.icon : "";
                h = a.extend({}, a.messager.defaults, {
                        content: '<div class="' + i + '"></div><div>' + h.msg + '</div><div style="clear:both;"/>'
                    }, h),
                h.buttons || (h.buttons = [{
                        text: h.ok,
                        onClick: function () {
                            f(j)
                        }
                    }]);
                var j = e(h);
                return j
            },
            confirm: function (b, c, d) {
                var g = "object" == typeof b ? b : {
                    title: b,
                    msg: c,
                    fn: d
                };
                g = a.extend({}, a.messager.defaults, {
                    content: '<div class="messager-icon ' + topJUI.language.message.icon.question + '"></div><div>' + g.msg + '</div><div style="clear:both;"/>'
                }, g),
                g.buttons || (g.buttons = [{
                    text: g.ok,
                    onClick: function () {
                        f(h, !0)
                    }
                },
                {
                    text: g.cancel,
                    onClick: function () {
                        f(h, !1)
                    }
                }]);
                var h = e(g);
                return h
            },
            prompt: function (b, c, d) {
                var g = "object" == typeof b ? b : {
                    title: b,
                    msg: c,
                    fn: d
                };
                g = a.extend({}, a.messager.defaults, {
                    content: '<div class="messager-icon messager-question"></div><div>' + g.msg + '</div><br/><div style="clear:both;"/><div><input class="messager-input" type="text"/></div>'
                }, g),
                g.buttons || (g.buttons = [{
                    text: g.ok,
                    onClick: function () {
                        f(h, h.find(".messager-input").val())
                    }
                },
                {
                    text: g.cancel,
                    onClick: function () {
                        f(h)
                    }
                }]);
                var h = e(g);
                return h.find(".messager-input").focus(),
                h
            },
            progress: function (b) {
                var c = {
                    bar: function () {
                        return a("body>div.messager-window").find("div.messager-p-bar")
                    },
                    close: function () {
                        var b = a("body>div.messager-window>div.messager-body:has(div.messager-progress)");
                        b.length && b.dialog("close")
                    }
                };
                if ("string" == typeof b) {
                    var d = c[b];
                    return d()
                }
                b = b || {};
                var f = a.extend({}, {
                    title: "",
                    minHeight: 0,
                    content: void 0,
                    msg: "",
                    text: void 0,
                    interval: 300
                }, b),
                    g = e(a.extend({}, a.messager.defaults, {
                        content: '<div class="messager-progress"><div class="messager-p-msg">' + f.msg + '</div><div class="messager-p-bar"></div></div>',
                        closable: !1,
                        doSize: !1
                    }, f, {
                        onClose: function () {
                            this.timer && clearInterval(this.timer),
                            b.onClose ? b.onClose.call(this) : a.messager.defaults.onClose.call(this)
                        }
                    })),
                    h = g.find("div.messager-p-bar");
                return h.progressbar({
                        text: f.text
                    }),
                g.dialog("resize"),
                f.interval && (g[0].timer = setInterval(function () {
                        var a = h.progressbar("getValue");
                        a += 10,
                        a > 100 && (a = 0),
                        h.progressbar("setValue", a)
                    }, f.interval)),
                g
            }
        },
        a.messager.defaults = a.extend({}, a.fn.dialog.defaults, {
            ok: "Ok",
            cancel: "Cancel",
            width: 300,
            height: "auto",
            minHeight: 150,
            modal: !0,
            collapsible: !1,
            minimizable: !1,
            maximizable: !1,
            resizable: !1,
            fn: function () {}
        })
    }(jQuery),


function (a) {
        function b(b, c) {
            function d(a, b) {
                for (var c = 0, d = 0; d < g.length; d++) {
                    var e = g[d];
                    if (i) var f = e.panel("header")._outerWidth(j);
                    else var f = e.panel("header")._outerHeight(j);
                    if (e.panel("options").collapsible == a) {
                        var k = isNaN(b) ? void 0 : b + j * f.length;
                        i ? (e.panel("resize", {
                            height: h.height(),
                            width: a ? k : void 0
                        }), c += e.panel("panel")._outerWidth() - j * f.length) : (e.panel("resize", {
                            width: h.width(),
                            height: a ? k : void 0
                        }), c += e.panel("panel").outerHeight() - j * f.length)
                    }
                }
                return c
            }
            var e = a.data(b, "accordion"),
                f = e.options,
                g = e.panels,
                h = a(b),
                i = "left" == f.halign || "right" == f.halign;
            h.children(".panel-last").removeClass("panel-last"),
            h.children(".panel:last").addClass("panel-last"),
            c && a.extend(f, {
                    width: c.width,
                    height: c.height
                }),
            h._size(f);
            var j = 0,
                k = "auto",
                l = h.find(">.panel>.accordion-header");
            l.length && (i ? (a(g[0]).panel("resize", {
                    width: h.width(),
                    height: h.height()
                }), j = a(l[0])._outerWidth()) : j = a(l[0]).css("height", "")._outerHeight()),
            isNaN(parseInt(f.height)) || (k = i ? h.width() - j * l.length : h.height() - j * l.length),
            d(!0, k - d(!1))
        }
        function c(b, c, d, e) {
            for (var f = a.data(b, "accordion").panels, g = [], h = 0; h < f.length; h++) {
                var i = f[h];
                if (c) i.panel("options")[c] == d && g.push(i);
                else if (i[0] == a(d)[0]) return h
            }
            return c ? e ? g : g.length ? g[0] : null : -1
        }
        function d(a) {
            return c(a, "collapsed", !1, !0)
        }
        function e(a) {
            var b = d(a);
            return b.length ? b[0] : null
        }
        function f(a, b) {
            return c(a, null, b)
        }
        function g(b, d) {
            var e = a.data(b, "accordion").panels;
            return "number" == typeof d ? d < 0 || d >= e.length ? null : e[d] : c(b, "title", d)
        }
        function h(b) {
            var c = a.data(b, "accordion").options,
                d = a(b);
            c.border ? d.removeClass("accordion-noborder") : d.addClass("accordion-noborder")
        }
        function i(c) {
            var d = a.data(c, "accordion"),
                e = a(c);
            e.addClass("accordion"),
            d.panels = [],
            e.children("div").each(function () {
                    var b = a.extend({}, a.parser.parseOptions(this), {
                        selected: !! a(this).attr("selected") || void 0
                    }),
                        e = a(this);
                    d.panels.push(e),
                    j(c, e, b)
                }),
            e.bind("_resize", function (d, e) {
                    return (a(this).hasClass("easyui-fluid") || e) && b(c),
                    !1
                })
        }
        function j(b, c, e) {
            function g(a) {
                var c = a.panel("options");
                if (c.collapsible) {
                    var d = f(b, a);
                    c.collapsed ? k(b, d) : l(b, d)
                }
            }
            var h = a.data(b, "accordion").options;
            c.panel(a.extend({}, {
                collapsible: !0,
                minimizable: !1,
                maximizable: !1,
                closable: !1,
                doSize: !1,
                collapsed: !0,
                headerCls: "accordion-header",
                bodyCls: "accordion-body",
                halign: h.halign
            }, e, {
                onBeforeExpand: function () {
                    if (e.onBeforeExpand && 0 == e.onBeforeExpand.call(this)) return !1;
                    if (!h.multiple) for (var c = a.grep(d(b), function (a) {
                        return a.panel("options").collapsible
                    }), g = 0; g < c.length; g++) l(b, f(b, c[g]));
                    var i = a(this).panel("header");
                    i.addClass("accordion-header-selected"),
                    i.find(".accordion-collapse").removeClass("accordion-expand")
                },
                onExpand: function () {
                    a(b).find(">.panel-last>.accordion-header").removeClass("accordion-header-border"),
                    e.onExpand && e.onExpand.call(this),
                    h.onSelect.call(b, a(this).panel("options").title, f(b, this))
                },
                onBeforeCollapse: function () {
                    if (e.onBeforeCollapse && 0 == e.onBeforeCollapse.call(this)) return !1;
                    a(b).find(">.panel-last>.accordion-header").addClass("accordion-header-border");
                    var c = a(this).panel("header");
                    c.removeClass("accordion-header-selected"),
                    c.find(".accordion-collapse").addClass("accordion-expand")
                },
                onCollapse: function () {
                    isNaN(parseInt(h.height)) && a(b).find(">.panel-last>.accordion-header").removeClass("accordion-header-border"),
                    e.onCollapse && e.onCollapse.call(this),
                    h.onUnselect.call(b, a(this).panel("options").title, f(b, this))
                }
            }));
            var i = c.panel("header"),
                j = i.children("div.panel-tool");
            j.children("a.panel-tool-collapse").hide();
            var m = a('<a href="javascript:;"></a>').addClass("accordion-collapse accordion-expand").appendTo(j);
            m.bind("click", function () {
                    return g(c),
                    !1
                }),
            c.panel("options").collapsible ? m.show() : m.hide(),
            "left" != h.halign && "right" != h.halign || m.hide(),
            i.click(function () {
                    return g(c),
                    !1
                })
        }
        function k(b, c) {
            var d = g(b, c);
            if (d) {
                n(b);
                var e = a.data(b, "accordion").options;
                d.panel("expand", e.animate)
            }
        }
        function l(b, c) {
            var d = g(b, c);
            if (d) {
                n(b);
                var e = a.data(b, "accordion").options;
                d.panel("collapse", e.animate)
            }
        }
        function m(b) {
            function d(a) {
                var c = e.animate;
                e.animate = !1,
                k(b, a),
                e.animate = c
            }
            var e = a.data(b, "accordion").options;
            a(b).find(">.panel-last>.accordion-header").addClass("accordion-header-border");
            var g = c(b, "selected", !0);
            d(g ? f(b, g) : e.selected)
        }
        function n(b) {
            for (var c = a.data(b, "accordion").panels, d = 0; d < c.length; d++) c[d].stop(!0, !0)
        }
        function o(c, d) {
            var e = a.data(c, "accordion"),
                f = e.options,
                g = e.panels;
            void 0 == d.selected && (d.selected = !0),
            n(c);
            var h = a("<div></div>").appendTo(c);
            g.push(h),
            j(c, h, d),
            b(c),
            f.onAdd.call(c, d.title, g.length - 1),
            d.selected && k(c, g.length - 1)
        }
        function p(c, d) {
            var h = a.data(c, "accordion"),
                i = h.options,
                j = h.panels;
            n(c);
            var l = g(c, d),
                m = l.panel("options").title,
                o = f(c, l);
            if (l && 0 != i.onBeforeRemove.call(c, m, o)) {
                    if (j.splice(o, 1), l.panel("destroy"), j.length) {
                        b(c);
                        var p = e(c);
                        p || k(c, 0)
                    }
                    i.onRemove.call(c, m, o)
                }
        }
        a.fn.accordion = function (c, d) {
            return "string" == typeof c ? a.fn.accordion.methods[c](this, d) : (c = c || {}, this.each(function () {
                var d = a.data(this, "accordion");
                d ? a.extend(d.options, c) : (a.data(this, "accordion", {
                    options: a.extend({}, a.fn.accordion.defaults, a.fn.accordion.parseOptions(this), c),
                    accordion: a(this).addClass("accordion"),
                    panels: []
                }), i(this)),
                h(this),
                b(this),
                m(this)
            }))
        },
        a.fn.accordion.methods = {
            options: function (b) {
                return a.data(b[0], "accordion").options
            },
            panels: function (b) {
                return a.data(b[0], "accordion").panels
            },
            resize: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            getSelections: function (a) {
                return d(a[0])
            },
            getSelected: function (a) {
                return e(a[0])
            },
            getPanel: function (a, b) {
                return g(a[0], b)
            },
            getPanelIndex: function (a, b) {
                return f(a[0], b)
            },
            select: function (a, b) {
                return a.each(function () {
                    k(this, b)
                })
            },
            unselect: function (a, b) {
                return a.each(function () {
                    l(this, b)
                })
            },
            add: function (a, b) {
                return a.each(function () {
                    o(this, b)
                })
            },
            remove: function (a, b) {
                return a.each(function () {
                    p(this, b)
                })
            }
        },
        a.fn.accordion.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.parser.parseOptions(b, ["width", "height", "halign", {
                fit: "boolean",
                border: "boolean",
                animate: "boolean",
                multiple: "boolean",
                selected: "number"
            }]))
        },
        a.fn.accordion.defaults = {
            width: "auto",
            height: "auto",
            fit: !1,
            border: !0,
            animate: !0,
            multiple: !1,
            selected: 0,
            halign: "top",
            onSelect: function (a, b) {},
            onUnselect: function (a, b) {},
            onAdd: function (a, b) {},
            onBeforeRemove: function (a, b) {},
            onRemove: function (a, b) {}
        }
    }(jQuery),


function ($) {
        function _329(a) {
            var b = 0;
            return $(a).children().each(function () {
                b += $(this).outerWidth(!0)
            }),
            b
        }
        function _32a(a) {
            var b = $.data(a, "tabs").options;
            if ("left" != b.tabPosition && "right" != b.tabPosition && b.showHeader) {
                var c = $(a).children("div.tabs-header"),
                    d = c.children("div.tabs-tool:not(.tabs-tool-hidden)"),
                    e = c.children("div.tabs-scroller-left"),
                    f = c.children("div.tabs-scroller-right"),
                    g = c.children("div.tabs-wrap"),
                    h = c.outerHeight();
                b.plain && (h -= h - c.height()),
                d._outerHeight(h);
                var i = _329(c.find("ul.tabs")),
                    j = c.width() - d._outerWidth();
                i > j ? (e.add(f).show()._outerHeight(h), "left" == b.toolPosition ? (d.css({
                        left: e.outerWidth(),
                        right: ""
                    }), g.css({
                        marginLeft: e.outerWidth() + d._outerWidth(),
                        marginRight: f._outerWidth(),
                        width: j - e.outerWidth() - f.outerWidth()
                    })) : (d.css({
                        left: "",
                        right: f.outerWidth()
                    }), g.css({
                        marginLeft: e.outerWidth(),
                        marginRight: f.outerWidth() + d._outerWidth(),
                        width: j - e.outerWidth() - f.outerWidth()
                    }))) : (e.add(f).hide(), "left" == b.toolPosition ? (d.css({
                        left: 0,
                        right: ""
                    }), g.css({
                        marginLeft: d._outerWidth(),
                        marginRight: 0,
                        width: j
                    })) : (d.css({
                        left: "",
                        right: 0
                    }), g.css({
                        marginLeft: 0,
                        marginRight: d._outerWidth(),
                        width: j
                    })))
            }
        }
        function _332(_333) {
            var opts = $.data(_333, "tabs").options,
                _334 = $(_333).children("div.tabs-header");
            if (opts.tools) if ("string" == typeof opts.tools) $(opts.tools).addClass("tabs-tool").appendTo(_334),
            $(opts.tools).show();
            else {
                    _334.children("div.tabs-tool").remove();
                    for (var _335 = $('<div class="tabs-tool"><table cellspacing="0" cellpadding="0" style="height:100%"><tr></tr></table></div>').appendTo(_334), tr = _335.find("tr"), i = 0; i < opts.tools.length; i++) {
                        var td = $("<td></td>").appendTo(tr),
                            tool = $('<a href="javascript:;"></a>').appendTo(td);
                        tool[0].onclick = eval(opts.tools[i].handler ||
                            function () {}),
                        tool.linkbutton($.extend({}, opts.tools[i], {
                                plain: !0
                            }))
                    }
                } else _334.children("div.tabs-tool").remove()
        }
        function _336(a, b) {
            function c(a, b) {
                var c = a.panel("options"),
                    d = c.tab.find("a.tabs-inner"),
                    b = b ? b : parseInt(c.tabWidth || e.tabWidth || void 0);
                b ? d._outerWidth(b) : d.css("width", ""),
                d._outerHeight(e.tabHeight),
                d.css("lineHeight", d.height() + "px"),
                d.find(".easyui-fluid:visible").triggerHandler("_resize")
            }
            var d = $.data(a, "tabs"),
                e = d.options,
                f = $(a);
            if (e.doSize) {
                    b && $.extend(e, {
                        width: b.width,
                        height: b.height
                    }),
                    f._size(e);
                    var g = f.children("div.tabs-header"),
                        h = f.children("div.tabs-panels"),
                        i = g.find("div.tabs-wrap"),
                        j = i.find(".tabs");
                    if (j.children("li").removeClass("tabs-first tabs-last"), j.children("li:first").addClass("tabs-first"), j.children("li:last").addClass("tabs-last"), "left" == e.tabPosition || "right" == e.tabPosition ? (g._outerWidth(e.showHeader ? e.headerWidth : 0), h._outerWidth(f.width() - g.outerWidth()), g.add(h)._size("height", isNaN(parseInt(e.height)) ? "" : f.height()), i._outerWidth(g.width()), j._outerWidth(i.width()).css("height", "")) : (g.children("div.tabs-scroller-left,div.tabs-scroller-right,div.tabs-tool:not(.tabs-tool-hidden)").css("display", e.showHeader ? "block" : "none"), g._outerWidth(f.width()).css("height", ""), e.showHeader ? (g.css("background-color", ""), i.css("height", "")) : (g.css("background-color", "transparent"), g._outerHeight(0), i._outerHeight(0)), j._outerHeight(e.tabHeight).css("width", ""), j._outerHeight(j.outerHeight() - j.height() - 1 + e.tabHeight).css("width", ""), h._size("height", isNaN(parseInt(e.height)) ? "" : f.height() - g.outerHeight()), h._size("width", f.width())), d.tabs.length) {
                            var k = j.outerWidth(!0) - j.width(),
                                l = j.children("li:first"),
                                m = l.outerWidth(!0) - l.width(),
                                n = g.width() - g.children(".tabs-tool:not(.tabs-tool-hidden)")._outerWidth(),
                                o = Math.floor((n - k - m * d.tabs.length) / d.tabs.length);
                            if ($.map(d.tabs, function (a) {
                                    c(a, e.justified && $.inArray(e.tabPosition, ["top", "bottom"]) >= 0 ? o : void 0)
                                }), e.justified && $.inArray(e.tabPosition, ["top", "bottom"]) >= 0) {
                                    var p = n - k - _329(j);
                                    c(d.tabs[d.tabs.length - 1], o + p)
                                }
                        }
                    _32a(a)
                }
        }
        function _342(a) {
            var b = $.data(a, "tabs").options,
                c = _344(a);
            if (c) {
                    var d = $(a).children("div.tabs-panels"),
                        e = "auto" == b.width ? "auto" : d.width(),
                        f = "auto" == b.height ? "auto" : d.height();
                    c.panel("resize", {
                            width: e,
                            height: f
                        })
                }
        }
        function _348(a) {
            var b = ($.data(a, "tabs").tabs, $(a).addClass("tabs-container")),
                c = $('<div class="tabs-panels"></div>').insertBefore(b);
            b.children("div").each(function () {
                    c[0].appendChild(this)
                }),
            b[0].appendChild(c[0]),
            $('<div class="tabs-header"><div class="tabs-scroller-left"></div><div class="tabs-scroller-right"></div><div class="tabs-wrap"><ul class="tabs"></ul></div></div>').prependTo(a),
            b.children("div.tabs-panels").children("div").each(function (b) {
                    var c = $.extend({}, $.parser.parseOptions(this), {
                        disabled: !! $(this).attr("disabled") || void 0,
                        selected: !! $(this).attr("selected") || void 0
                    });
                    _357(a, c, $(this))
                }),
            b.children("div.tabs-header").find(".tabs-scroller-left, .tabs-scroller-right").hover(function () {
                    $(this).addClass("tabs-scroller-over")
                }, function () {
                    $(this).removeClass("tabs-scroller-over")
                }),
            b.bind("_resize", function (b, c) {
                    return ($(this).hasClass("easyui-fluid") || c) && (_336(a), _342(a)),
                    !1
                })
        }
        function _34c(a) {
            function b(a) {
                var b = 0;
                return a.parent().children("li").each(function (c) {
                    if (a[0] == this) return b = c,
                    !1
                }),
                b
            }
            var c = $.data(a, "tabs"),
                d = c.options;
            $(a).children("div.tabs-header").unbind().bind("click", function (e) {
                    if ($(e.target).hasClass("tabs-scroller-left")) $(a).tabs("scrollBy", -d.scrollIncrement);
                    else {
                        if (!$(e.target).hasClass("tabs-scroller-right")) {
                            var f = $(e.target).closest("li");
                            if (f.hasClass("tabs-disabled")) return !1;
                            var g = $(e.target).closest("a.tabs-close");
                            if (g.length) _370(a, b(f));
                            else if (f.length) {
                                var h = b(f),
                                    i = c.tabs[h].panel("options");
                                i.collapsible ? i.closed ? _367(a, h) : _384(a, h) : _367(a, h)
                            }
                            return !1
                        }
                        $(a).tabs("scrollBy", d.scrollIncrement)
                    }
                }).bind("contextmenu", function (c) {
                    var e = $(c.target).closest("li");
                    e.hasClass("tabs-disabled") || e.length && d.onContextMenu.call(a, c, e.find("span.tabs-title").html(), b(e))
                })
        }
        function _353(a) {
            var b = $.data(a, "tabs").options,
                c = $(a).children("div.tabs-header"),
                d = $(a).children("div.tabs-panels");
            c.removeClass("tabs-header-top tabs-header-bottom tabs-header-left tabs-header-right"),
            d.removeClass("tabs-panels-top tabs-panels-bottom tabs-panels-left tabs-panels-right"),
            "top" == b.tabPosition ? c.insertBefore(d) : "bottom" == b.tabPosition ? (c.insertAfter(d), c.addClass("tabs-header-bottom"), d.addClass("tabs-panels-top")) : "left" == b.tabPosition ? (c.addClass("tabs-header-left"), d.addClass("tabs-panels-right")) : "right" == b.tabPosition && (c.addClass("tabs-header-right"), d.addClass("tabs-panels-left")),
            1 == b.plain ? c.addClass("tabs-header-plain") : c.removeClass("tabs-header-plain"),
            c.removeClass("tabs-header-narrow").addClass(b.narrow ? "tabs-header-narrow" : "");
            var e = c.find(".tabs");
            e.removeClass("tabs-pill").addClass(b.pill ? "tabs-pill" : ""),
            e.removeClass("tabs-narrow").addClass(b.narrow ? "tabs-narrow" : ""),
            e.removeClass("tabs-justified").addClass(b.justified ? "tabs-justified" : ""),
            1 == b.border ? (c.removeClass("tabs-header-noborder"), d.removeClass("tabs-panels-noborder")) : (c.addClass("tabs-header-noborder"), d.addClass("tabs-panels-noborder")),
            b.doSize = !0
        }
        function _357(a, b, c) {
            b = b || {};
            var d = $.data(a, "tabs"),
                e = d.tabs;
                (void 0 == b.index || b.index > e.length) && (b.index = e.length),
            b.index < 0 && (b.index = 0);
            var f = $(a).children("div.tabs-header").find("ul.tabs"),
                g = $(a).children("div.tabs-panels"),
                h = $('<li><a href="javascript:;" class="tabs-inner"><span class="tabs-title"></span><span class="tabs-icon"></span></a></li>');
            c || (c = $("<div></div>")),
            b.index >= e.length ? (h.appendTo(f), c.appendTo(g), e.push(c)) : (h.insertBefore(f.children("li:eq(" + b.index + ")")), c.insertBefore(g.children("div.panel:eq(" + b.index + ")")), e.splice(b.index, 0, c)),
            c.panel($.extend({}, b, {
                    tab: h,
                    border: !1,
                    noheader: !0,
                    closed: !0,
                    doSize: !1,
                    iconCls: b.icon ? b.icon : void 0,
                    onLoad: function () {
                        b.onLoad && b.onLoad.call(this, arguments),
                        d.options.onLoad.call(a, $(this))
                    },
                    onBeforeOpen: function () {
                        if (b.onBeforeOpen && 0 == b.onBeforeOpen.call(this)) return !1;
                        var c = $(a).tabs("getSelected");
                        if (c) {
                            if (c[0] == this) return _342(a),
                            !1;
                            if ($(a).tabs("unselect", _362(a, c)), c = $(a).tabs("getSelected")) return !1
                        }
                        var d = $(this).panel("options");
                        d.tab.addClass("tabs-selected");
                        var e = $(a).find(">div.tabs-header>div.tabs-wrap"),
                            f = d.tab.position().left,
                            g = f + d.tab.outerWidth();
                        if (f < 0 || g > e.width()) {
                                var h = f - (e.width() - d.tab.width()) / 2;
                                $(a).tabs("scrollBy", h)
                            } else $(a).tabs("scrollBy", 0);
                        var i = $(this).panel("panel");
                        i.css("display", "block"),
                        _342(a),
                        i.css("display", "none")
                    },
                    onOpen: function () {
                        b.onOpen && b.onOpen.call(this);
                        var c = $(this).panel("options");
                        d.selectHis.push(c.title),
                        d.options.onSelect.call(a, c.title, _362(a, this))
                    },
                    onBeforeClose: function () {
                        return (!b.onBeforeClose || 0 != b.onBeforeClose.call(this)) && void $(this).panel("options").tab.removeClass("tabs-selected")
                    },
                    onClose: function () {
                        b.onClose && b.onClose.call(this);
                        var c = $(this).panel("options");
                        d.options.onUnselect.call(a, c.title, _362(a, this))
                    }
                })),
            $(a).tabs("update", {
                    tab: c,
                    options: c.panel("options"),
                    type: "header"
                })
        }
        function _363(a, b) {
            var c = $.data(a, "tabs"),
                d = c.options;
            void 0 == b.selected && (b.selected = !0),
            _357(a, b),
            d.onAdd.call(a, b.title, b.index),
            b.selected && _367(a, b.index)
        }
        function _368(a, b) {
            b.type = b.type || "all";
            var c = $.data(a, "tabs").selectHis,
                d = b.tab,
                e = d.panel("options"),
                f = e.title;
            if ($.extend(e, b.options, {
                    iconCls: b.options.icon ? b.options.icon : void 0
                }), "all" != b.type && "body" != b.type || d.panel(), "all" == b.type || "header" == b.type) {
                    var g = e.tab;
                    if (e.header) g.find(".tabs-inner").html($(e.header));
                    else {
                        var h = g.find("span.tabs-title"),
                            i = g.find("span.tabs-icon");
                        if (h.html(e.title), i.attr("class", "tabs-icon"), g.find("a.tabs-close").remove(), e.closable ? (h.addClass("tabs-closable"), $('<a href="javascript:;" class="tabs-close"></a>').appendTo(g)) : h.removeClass("tabs-closable"), e.iconCls ? (h.addClass("tabs-with-icon"), i.addClass(e.iconCls)) : h.removeClass("tabs-with-icon"), e.tools) {
                                var j = g.find("span.tabs-p-tool");
                                if (!j.length) var j = $('<span class="tabs-p-tool"></span>').insertAfter(g.find("a.tabs-inner"));
                                if ($.isArray(e.tools)) {
                                    j.empty();
                                    for (var k = 0; k < e.tools.length; k++) {
                                        var l = $('<a href="javascript:;"></a>').appendTo(j);
                                        l.addClass(e.tools[k].iconCls),
                                        e.tools[k].handler && l.bind("click", {
                                            handler: e.tools[k].handler
                                        }, function (a) {
                                            $(this).parents("li").hasClass("tabs-disabled") || a.data.handler.call(this)
                                        })
                                    }
                                } else $(e.tools).children().appendTo(j);
                                var m = 12 * j.children().length;
                                e.closable ? (m += 8, j.css("right", "")) : (m -= 3, j.css("right", "5px")),
                                h.css("padding-right", m + "px")
                            } else g.find("span.tabs-p-tool").remove(),
                        h.css("padding-right", "")
                    }
                    if (f != e.title) for (var k = 0; k < c.length; k++) c[k] == f && (c[k] = e.title)
                }
            e.disabled ? e.tab.addClass("tabs-disabled") : e.tab.removeClass("tabs-disabled"),
            _336(a),
            $.data(a, "tabs").options.onUpdate.call(a, e.title, _362(a, d))
        }
        function _370(a, b) {
            var c = $.data(a, "tabs").options,
                d = $.data(a, "tabs").tabs,
                e = $.data(a, "tabs").selectHis;
            if (_374(a, b)) {
                    var f = _375(a, b),
                        g = f.panel("options").title,
                        h = _362(a, f);
                    if (0 != c.onBeforeClose.call(a, g, h)) {
                            var f = _375(a, b, !0);
                            f.panel("options").tab.remove(),
                            f.panel("destroy"),
                            c.onClose.call(a, g, h),
                            _336(a);
                            for (var i = 0; i < e.length; i++) e[i] == g && (e.splice(i, 1), i--);
                            var j = e.pop();
                            j ? _367(a, j) : d.length && _367(a, 0)
                        }
                }
        }
        function _375(a, b, c) {
            var d = $.data(a, "tabs").tabs,
                e = null;
            if ("number" == typeof b) b >= 0 && b < d.length && (e = d[b], c && d.splice(b, 1));
            else {
                    for (var f = $("<span></span>"), g = 0; g < d.length; g++) {
                        var h = d[g];
                        if (f.html(h.panel("options").title), f.text() == b) {
                            e = h,
                            c && d.splice(g, 1);
                            break
                        }
                    }
                    f.remove()
                }
            return e
        }
        function _362(a, b) {
            for (var c = $.data(a, "tabs").tabs, d = 0; d < c.length; d++) if (c[d][0] == $(b)[0]) return d;
            return -1
        }
        function _344(a) {
            for (var b = $.data(a, "tabs").tabs, c = 0; c < b.length; c++) {
                var d = b[c];
                if (d.panel("options").tab.hasClass("tabs-selected")) return d
            }
            return null
        }
        function _37e(a) {
            for (var b = $.data(a, "tabs"), c = b.tabs, d = 0; d < c.length; d++) {
                var e = c[d].panel("options");
                if (e.selected && !e.disabled) return void _367(a, d)
            }
            _367(a, b.options.selected)
        }
        function _367(a, b) {
            var c = _375(a, b);
            c && !c.is(":visible") && (_383(a), c.panel("options").disabled || c.panel("open"))
        }
        function _384(a, b) {
            var c = _375(a, b);
            c && c.is(":visible") && (_383(a), c.panel("close"))
        }
        function _383(a) {
            $(a).children("div.tabs-panels").each(function () {
                $(this).stop(!0, !0)
            })
        }
        function _374(a, b) {
            return null != _375(a, b)
        }
        function _38a(a, b) {
            var c = $.data(a, "tabs").options;
            c.showHeader = b,
            $(a).tabs("resize")
        }
        function _38d(a, b) {
            var c = $(a).find(">.tabs-header>.tabs-tool");
            b ? c.removeClass("tabs-tool-hidden").show() : c.addClass("tabs-tool-hidden").hide(),
            $(a).tabs("resize").tabs("scrollBy", 0)
        }
        $.fn.tabs = function (a, b) {
            return "string" == typeof a ? $.fn.tabs.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b = $.data(this, "tabs");
                b ? $.extend(b.options, a) : ($.data(this, "tabs", {
                    options: $.extend({}, $.fn.tabs.defaults, $.fn.tabs.parseOptions(this), a),
                    tabs: [],
                    selectHis: []
                }), _348(this)),
                _332(this),
                _353(this),
                _336(this),
                _34c(this),
                _37e(this)
            }))
        },
        $.fn.tabs.methods = {
            options: function (a) {
                var b = a[0],
                    c = $.data(b, "tabs").options,
                    d = _344(b);
                return c.selected = d ? _362(b, d) : -1,
                c
            },
            tabs: function (a) {
                return $.data(a[0], "tabs").tabs
            },
            resize: function (a, b) {
                return a.each(function () {
                    _336(this, b),
                    _342(this)
                })
            },
            add: function (a, b) {
                return a.each(function () {
                    _363(this, b)
                })
            },
            close: function (a, b) {
                return a.each(function () {
                    _370(this, b)
                })
            },
            getTab: function (a, b) {
                return _375(a[0], b)
            },
            getTabIndex: function (a, b) {
                return _362(a[0], b)
            },
            getSelected: function (a) {
                return _344(a[0])
            },
            select: function (a, b) {
                return a.each(function () {
                    _367(this, b)
                })
            },
            unselect: function (a, b) {
                return a.each(function () {
                    _384(this, b)
                })
            },
            exists: function (a, b) {
                return _374(a[0], b)
            },
            update: function (a, b) {
                return a.each(function () {
                    _368(this, b)
                })
            },
            enableTab: function (a, b) {
                return a.each(function () {
                    var a = $(this).tabs("getTab", b).panel("options");
                    a.tab.removeClass("tabs-disabled"),
                    a.disabled = !1
                })
            },
            disableTab: function (a, b) {
                return a.each(function () {
                    var a = $(this).tabs("getTab", b).panel("options");
                    a.tab.addClass("tabs-disabled"),
                    a.disabled = !0
                })
            },
            showHeader: function (a) {
                return a.each(function () {
                    _38a(this, !0)
                })
            },
            hideHeader: function (a) {
                return a.each(function () {
                    _38a(this, !1)
                })
            },
            showTool: function (a) {
                return a.each(function () {
                    _38d(this, !0)
                })
            },
            hideTool: function (a) {
                return a.each(function () {
                    _38d(this, !1)
                })
            },
            scrollBy: function (a, b) {
                return a.each(function () {
                    function a() {
                        var a = 0,
                            b = d.children("ul");
                        return b.children("li").each(function () {
                                a += $(this).outerWidth(!0)
                            }),
                        a - d.width() + (b.outerWidth() - b.width())
                    }
                    var c = $(this).tabs("options"),
                        d = $(this).find(">div.tabs-header>div.tabs-wrap"),
                        e = Math.min(d._scrollLeft() + b, a());
                    d.animate({
                            scrollLeft: e
                        }, c.scrollDuration)
                })
            }
        },
        $.fn.tabs.parseOptions = function (a) {
            return $.extend({}, $.parser.parseOptions(a, ["tools", "toolPosition", "tabPosition", {
                fit: "boolean",
                border: "boolean",
                plain: "boolean"
            },
            {
                headerWidth: "number",
                tabWidth: "number",
                tabHeight: "number",
                selected: "number"
            },
            {
                showHeader: "boolean",
                justified: "boolean",
                narrow: "boolean",
                pill: "boolean"
            }]))
        },
        $.fn.tabs.defaults = {
            width: "auto",
            height: "auto",
            headerWidth: 150,
            tabWidth: "auto",
            tabHeight: 27,
            selected: 0,
            showHeader: !0,
            plain: !1,
            fit: !1,
            border: !0,
            justified: !1,
            narrow: !1,
            pill: !1,
            tools: null,
            toolPosition: "right",
            tabPosition: "top",
            scrollIncrement: 100,
            scrollDuration: 400,
            onLoad: function (a) {},
            onSelect: function (a, b) {},
            onUnselect: function (a, b) {},
            onBeforeClose: function (a, b) {},
            onClose: function (a, b) {},
            onAdd: function (a, b) {},
            onUpdate: function (a, b) {},
            onContextMenu: function (a, b, c) {}
        }
    }(jQuery),


function (a) {
        function b(b, c) {
            function d(a, b) {
                if (a.length && h(a)) {
                    var c = a.panel("options");
                    a.panel("resize", {
                        width: j.width(),
                        height: c.height
                    });
                    var d = a.panel("panel").outerHeight();
                    a.panel("move", {
                        left: 0,
                        top: "n" == b ? 0 : j.height() - d
                    }),
                    k.height -= d,
                    "n" == b && (k.top += d, !c.split && c.border && k.top--),
                    !c.split && c.border && k.height++
                }
            }
            function e(a, b) {
                if (a.length && h(a)) {
                    var c = a.panel("options");
                    a.panel("resize", {
                        width: c.width,
                        height: k.height
                    });
                    var d = a.panel("panel").outerWidth();
                    a.panel("move", {
                        left: "e" == b ? j.width() - d : 0,
                        top: k.top
                    }),
                    k.width -= d,
                    "w" == b && (k.left += d, !c.split && c.border && k.left--),
                    !c.split && c.border && k.width++
                }
            }
            var f = a.data(b, "layout"),
                g = f.options,
                i = f.panels,
                j = a(b);
            c && a.extend(g, {
                    width: c.width,
                    height: c.height
                }),
            "body" == b.tagName.toLowerCase() ? j._size("fit") : j._size(g);
            var k = {
                    top: 0,
                    left: 0,
                    width: j.width(),
                    height: j.height()
                };
            d(h(i.expandNorth) ? i.expandNorth : i.north, "n"),
            d(h(i.expandSouth) ? i.expandSouth : i.south, "s"),
            e(h(i.expandEast) ? i.expandEast : i.east, "e"),
            e(h(i.expandWest) ? i.expandWest : i.west, "w"),
            i.center.panel("resize", k)
        }
        function c(c) {
            function e(b) {
                var e = a.fn.layout.parsePanelOptions(b);
                "north,south,east,west,center".indexOf(e.region) >= 0 && d(c, e, b)
            }
            var f = a(c);
            f.addClass("layout");
            var g = f.layout("options"),
                h = g.onAdd;
            g.onAdd = function () {},
            f.find(">div,>form>div").each(function () {
                    e(this)
                }),
            g.onAdd = h,
            f.append('<div class="layout-split-proxy-h"></div><div class="layout-split-proxy-v"></div>'),
            f.bind("_resize", function (d, e) {
                    return (a(this).hasClass("easyui-fluid") || e) && b(c),
                    !1
                })
        }
        function d(c, d, e) {
            function g(b) {
                var d = "expand" + l.substring(0, 1).toUpperCase() + l.substring(1),
                    e = i.center,
                    f = "north" == l || "south" == l ? "minHeight" : "minWidth",
                    g = "north" == l || "south" == l ? "maxHeight" : "maxWidth",
                    j = "north" == l || "south" == l ? "_outerHeight" : "_outerWidth",
                    k = a.parser.parseValue(g, i[l].panel("options")[g], a(c)),
                    m = a.parser.parseValue(f, e.panel("options")[f], a(c)),
                    n = e.panel("panel")[j]() - m;
                return n += h(i[d]) ? i[d][j]() - 1 : a(b)[j](),
                n > k && (n = k),
                n
            }
            d.region = d.region || "center";
            var i = a.data(c, "layout").panels,
                j = a(c),
                l = d.region;
            if (!i[l].length) {
                    var m = a(e);
                    m.length || (m = a("<div></div>").appendTo(j));
                    var n = a.extend({}, a.fn.layout.paneldefaults, {
                        width: m.length ? parseInt(m[0].style.width) || m.outerWidth() : "auto",
                        height: m.length ? parseInt(m[0].style.height) || m.outerHeight() : "auto",
                        doSize: !1,
                        collapsible: !0,
                        onOpen: function () {
                            var b = a(this).panel("header").children("div.panel-tool");
                            b.children("a.panel-tool-collapse").hide();
                            var d = {
                                north: "up",
                                south: "down",
                                east: "right",
                                west: "left"
                            };
                            if (d[l]) {
                                var e = "layout-button-" + d[l],
                                    g = b.children("a." + e);
                                g.length || (g = a('<a href="javascript:;"></a>').addClass(e).appendTo(b), g.bind("click", {
                                        dir: l
                                    }, function (a) {
                                        return f(c, a.data.dir),
                                        !1
                                    })),
                                a(this).panel("options").collapsible ? g.show() : g.hide()
                            }
                        }
                    }, d, {
                        cls: (d.cls || "") + " layout-panel layout-panel-" + l,
                        bodyCls: (d.bodyCls || "") + " layout-body"
                    });
                    m.panel(n),
                    i[l] = m;
                    var o = {
                        north: "s",
                        south: "n",
                        east: "w",
                        west: "e"
                    },
                        p = m.panel("panel");
                    m.panel("options").split && p.addClass("layout-split-" + l),
                    p.resizable(a.extend({}, {
                            handles: o[l] || "",
                            disabled: !m.panel("options").split,
                            onStartResize: function (b) {
                                if (k = !0, "north" == l || "south" == l) var d = a(">div.layout-split-proxy-v", c);
                                else var d = a(">div.layout-split-proxy-h", c);
                                var e = {
                                    display: "block"
                                };
                                "north" == l ? (e.top = parseInt(p.css("top")) + p.outerHeight() - d.height(), e.left = parseInt(p.css("left")), e.width = p.outerWidth(), e.height = d.height()) : "south" == l ? (e.top = parseInt(p.css("top")), e.left = parseInt(p.css("left")), e.width = p.outerWidth(), e.height = d.height()) : "east" == l ? (e.top = parseInt(p.css("top")) || 0, e.left = parseInt(p.css("left")) || 0, e.width = d.width(), e.height = p.outerHeight()) : "west" == l && (e.top = parseInt(p.css("top")) || 0, e.left = p.outerWidth() - d.width(), e.width = d.width(), e.height = p.outerHeight()),
                                d.css(e),
                                a('<div class="layout-mask"></div>').css({
                                    left: 0,
                                    top: 0,
                                    width: j.width(),
                                    height: j.height()
                                }).appendTo(j)
                            },
                            onResize: function (b) {
                                if ("north" == l || "south" == l) {
                                    var d = g(this);
                                    a(this).resizable("options").maxHeight = d;
                                    var e = a(">div.layout-split-proxy-v", c),
                                        f = "north" == l ? b.data.height - e.height() : a(c).height() - b.data.height;
                                    e.css("top", f)
                                } else {
                                    var h = g(this);
                                    a(this).resizable("options").maxWidth = h;
                                    var e = a(">div.layout-split-proxy-h", c),
                                        i = "west" == l ? b.data.width - e.width() : a(c).width() - b.data.width;
                                    e.css("left", i)
                                }
                                return !1
                            },
                            onStopResize: function (a) {
                                j.children("div.layout-split-proxy-v,div.layout-split-proxy-h").hide(),
                                m.panel("resize", a.data),
                                b(c),
                                k = !1,
                                j.find(">div.layout-mask").remove()
                            }
                        }, d)),
                    j.layout("options").onAdd.call(c, l)
                }
        }
        function e(b, c) {
            var d = a.data(b, "layout").panels;
            if (d[c].length) {
                d[c].panel("destroy"),
                d[c] = a();
                var e = "expand" + c.substring(0, 1).toUpperCase() + c.substring(1);
                d[e] && (d[e].panel("destroy"), d[e] = void 0),
                a(b).layout("options").onRemove.call(b, c)
            }
        }
        function f(b, c, d) {
            function e(d) {
                var e = {
                    east: "left",
                    west: "right",
                    north: "down",
                    south: "up"
                },
                    f = "north" == m.region || "south" == m.region,
                    h = "layout-button-" + e[d],
                    i = a("<div></div>").appendTo(b);
                if (i.panel(a.extend({}, a.fn.layout.paneldefaults, {
                        cls: "layout-expand layout-expand-" + d,
                        title: "&nbsp;",
                        titleDirection: m.titleDirection,
                        iconCls: m.hideCollapsedContent ? null : m.iconCls,
                        closed: !0,
                        minWidth: 0,
                        minHeight: 0,
                        doSize: !1,
                        region: m.region,
                        collapsedSize: m.collapsedSize,
                        noheader: !f && m.hideExpandTool,
                        tools: f && m.hideExpandTool ? null : [{
                            iconCls: h,
                            handler: function () {
                                return g(b, c),
                                !1
                            }
                        }],
                        onResize: function () {
                            var b = a(this).children(".layout-expand-title");
                            if (b.length) {
                                b._outerWidth(a(this).height());
                                var c = (a(this).width() - Math.min(b._outerWidth(), b._outerHeight())) / 2,
                                    d = Math.max(b._outerWidth(), b._outerHeight());
                                b.hasClass("layout-expand-title-down") && (c += Math.min(b._outerWidth(), b._outerHeight()), d = 0),
                                b.css({
                                        left: c + "px",
                                        top: d + "px"
                                    })
                            }
                        }
                    })), !m.hideCollapsedContent) {
                        var j = "function" == typeof m.collapsedContent ? m.collapsedContent.call(i[0], m.title) : m.collapsedContent;
                        f ? i.panel("setTitle", j) : i.html(j)
                    }
                return i.panel("panel").hover(function () {
                        a(this).addClass("layout-expand-over")
                    }, function () {
                        a(this).removeClass("layout-expand-over")
                    }),
                i
            }
            function i() {
                var d = a(b),
                    e = j.center.panel("options"),
                    f = m.collapsedSize;
                if ("east" == c) {
                        var g = l.panel("panel")._outerWidth(),
                            i = e.width + g - f;
                        return !m.split && m.border || i++,
                        {
                                resizeC: {
                                    width: i
                                },
                                expand: {
                                    left: d.width() - g
                                },
                                expandP: {
                                    top: e.top,
                                    left: d.width() - f,
                                    width: f,
                                    height: e.height
                                },
                                collapse: {
                                    left: d.width(),
                                    top: e.top,
                                    height: e.height
                                }
                            }
                    }
                if ("west" == c) {
                        var g = l.panel("panel")._outerWidth(),
                            i = e.width + g - f;
                        return !m.split && m.border || i++,
                        {
                                resizeC: {
                                    width: i,
                                    left: f - 1
                                },
                                expand: {
                                    left: 0
                                },
                                expandP: {
                                    left: 0,
                                    top: e.top,
                                    width: f,
                                    height: e.height
                                },
                                collapse: {
                                    left: -g,
                                    top: e.top,
                                    height: e.height
                                }
                            }
                    }
                if ("north" == c) {
                        var k = l.panel("panel")._outerHeight(),
                            n = e.height;
                        return h(j.expandNorth) || (n += k - f + (m.split || !m.border ? 1 : 0)),
                        j.east.add(j.west).add(j.expandEast).add(j.expandWest).panel("resize", {
                                top: f - 1,
                                height: n
                            }),
                        {
                                resizeC: {
                                    top: f - 1,
                                    height: n
                                },
                                expand: {
                                    top: 0
                                },
                                expandP: {
                                    top: 0,
                                    left: 0,
                                    width: d.width(),
                                    height: f
                                },
                                collapse: {
                                    top: -k,
                                    width: d.width()
                                }
                            }
                    }
                if ("south" == c) {
                        var k = l.panel("panel")._outerHeight(),
                            n = e.height;
                        return h(j.expandSouth) || (n += k - f + (m.split || !m.border ? 1 : 0)),
                        j.east.add(j.west).add(j.expandEast).add(j.expandWest).panel("resize", {
                                height: n
                            }),
                        {
                                resizeC: {
                                    height: n
                                },
                                expand: {
                                    top: d.height() - k
                                },
                                expandP: {
                                    top: d.height() - f,
                                    left: 0,
                                    width: d.width(),
                                    height: f
                                },
                                collapse: {
                                    top: d.height(),
                                    width: d.width()
                                }
                            }
                    }
            }
            void 0 == d && (d = "normal");
            var j = a.data(b, "layout").panels,
                l = j[c],
                m = l.panel("options");
            if (0 != m.onBeforeCollapse.call(l)) {
                    var n = "expand" + c.substring(0, 1).toUpperCase() + c.substring(1);
                    if (!j[n]) {
                        j[n] = e(c);
                        var o = j[n].panel("panel");
                        m.expandMode ? o.bind("click", function () {
                            if ("dock" == m.expandMode) g(b, c);
                            else {
                                l.panel("expand", !1).panel("open");
                                var d = i();
                                l.panel("resize", d.collapse),
                                l.panel("panel").animate(d.expand, function () {
                                    a(this).unbind(".layout").bind("mouseleave.layout", {
                                        region: c
                                    }, function (c) {
                                        1 != k && (a("body>div.combo-p>div.combo-panel:visible").length || f(b, c.data.region))
                                    }),
                                    a(b).layout("options").onExpand.call(b, c)
                                })
                            }
                            return !1
                        }) : o.css("cursor", "default")
                    }
                    var p = i();
                    h(j[n]) || j.center.panel("resize", p.resizeC),
                    l.panel("panel").animate(p.collapse, d, function () {
                        l.panel("collapse", !1).panel("close"),
                        j[n].panel("open").panel("resize", p.expandP),
                        a(this).unbind(".layout"),
                        a(b).layout("options").onCollapse.call(b, c)
                    })
                }
        }
        function g(c, d) {
            function e() {
                var b = a(c),
                    e = f.center.panel("options");
                return "east" == d && f.expandEast ? {
                        collapse: {
                            left: b.width(),
                            top: e.top,
                            height: e.height
                        },
                        expand: {
                            left: b.width() - g.panel("panel")._outerWidth()
                        }
                    } : "west" == d && f.expandWest ? {
                        collapse: {
                            left: -g.panel("panel")._outerWidth(),
                            top: e.top,
                            height: e.height
                        },
                        expand: {
                            left: 0
                        }
                    } : "north" == d && f.expandNorth ? {
                        collapse: {
                            top: -g.panel("panel")._outerHeight(),
                            width: b.width()
                        },
                        expand: {
                            top: 0
                        }
                    } : "south" == d && f.expandSouth ? {
                        collapse: {
                            top: b.height(),
                            width: b.width()
                        },
                        expand: {
                            top: b.height() - g.panel("panel")._outerHeight()
                        }
                    } : void 0
            }
            var f = a.data(c, "layout").panels,
                g = f[d],
                h = g.panel("options");
            if (0 != h.onBeforeExpand.call(g)) {
                    var i = "expand" + d.substring(0, 1).toUpperCase() + d.substring(1);
                    if (f[i]) {
                        f[i].panel("close"),
                        g.panel("panel").stop(!0, !0),
                        g.panel("expand", !1).panel("open");
                        var j = e();
                        g.panel("resize", j.collapse),
                        g.panel("panel").animate(j.expand, function () {
                            b(c),
                            a(c).layout("options").onExpand.call(c, d)
                        })
                    }
                }
        }
        function h(a) {
            return !!a && ( !! a.length && a.panel("panel").is(":visible"))
        }
        function i(b) {
            function c(a) {
                var c = g[a];
                c.length && c.panel("options").collapsed && f(b, a, 0)
            }
            var d = a.data(b, "layout"),
                e = d.options,
                g = d.panels,
                h = e.onCollapse;
            e.onCollapse = function () {},
            c("east"),
            c("west"),
            c("north"),
            c("south"),
            e.onCollapse = h
        }
        function j(c, d, e) {
            var f = a(c).layout("panel", d);
            f.panel("options").split = e;
            var g = "layout-split-" + d,
                h = f.panel("panel").removeClass(g);
            e && h.addClass(g),
            h.resizable({
                    disabled: !e
                }),
            b(c)
        }
        var k = !1;
        a.fn.layout = function (d, e) {
            return "string" == typeof d ? a.fn.layout.methods[d](this, e) : (d = d || {}, this.each(function () {
                var e = a.data(this, "layout");
                if (e) a.extend(e.options, d);
                else {
                    var f = a.extend({}, a.fn.layout.defaults, a.fn.layout.parseOptions(this), d);
                    a.data(this, "layout", {
                        options: f,
                        panels: {
                            center: a(),
                            north: a(),
                            south: a(),
                            east: a(),
                            west: a()
                        }
                    }),
                    c(this)
                }
                b(this),
                i(this)
            }))
        },
        a.fn.layout.methods = {
            options: function (b) {
                return a.data(b[0], "layout").options
            },
            resize: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            panel: function (b, c) {
                return a.data(b[0], "layout").panels[c]
            },
            collapse: function (a, b) {
                return a.each(function () {
                    f(this, b)
                })
            },
            expand: function (a, b) {
                return a.each(function () {
                    g(this, b)
                })
            },
            add: function (c, e) {
                return c.each(function () {
                    d(this, e),
                    b(this),
                    a(this).layout("panel", e.region).panel("options").collapsed && f(this, e.region, 0)
                })
            },
            remove: function (a, c) {
                return a.each(function () {
                    e(this, c),
                    b(this)
                })
            },
            split: function (a, b) {
                return a.each(function () {
                    j(this, b, !0)
                })
            },
            unsplit: function (a, b) {
                return a.each(function () {
                    j(this, b, !1)
                })
            }
        },
        a.fn.layout.parseOptions = function (b) {
            return a.extend({}, a.parser.parseOptions(b, [{
                fit: "boolean"
            }]))
        },
        a.fn.layout.defaults = {
            fit: !1,
            onExpand: function (a) {},
            onCollapse: function (a) {},
            onAdd: function (a) {},
            onRemove: function (a) {}
        },
        a.fn.layout.parsePanelOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.panel.parseOptions(b), a.parser.parseOptions(b, ["region", {
                split: "boolean",
                collpasedSize: "number",
                minWidth: "number",
                minHeight: "number",
                maxWidth: "number",
                maxHeight: "number"
            }]))
        },
        a.fn.layout.paneldefaults = a.extend({}, a.fn.panel.defaults, {
            region: null,
            split: !1,
            collapsedSize: 28,
            expandMode: "float",
            hideExpandTool: !1,
            hideCollapsedContent: !0,
            collapsedContent: function (b) {
                var c = a(this),
                    d = c.panel("options");
                if ("north" == d.region || "south" == d.region) return b;
                var e = [];
                return d.iconCls && e.push('<div class="panel-icon ' + d.iconCls + '"></div>'),
                e.push('<div class="panel-title layout-expand-title'),
                e.push(" layout-expand-title-" + d.titleDirection),
                e.push(d.iconCls ? " layout-expand-with-icon" : ""),
                e.push('">'),
                e.push(b),
                e.push("</div>"),
                e.join("")
            },
            minWidth: 10,
            minHeight: 10,
            maxWidth: 1e4,
            maxHeight: 1e4
        })
    }(jQuery),


function ($) {
        function init(a) {
            function b(a) {
                var c = [];
                return a.addClass("menu"),
                c.push(a),
                a.hasClass("menu-content") || a.children("div").each(function () {
                    var a = $(this).children("div");
                    if (a.length) {
                        a.appendTo("body"),
                        this.submenu = a;
                        var d = b(a);
                        c = c.concat(d)
                    }
                }),
                c
            }
            var c = $.data(a, "menu").options;
            $(a).addClass("menu-top"),
            c.inline ? $(a).addClass("menu-inline") : $(a).appendTo("body"),
            $(a).bind("_resize", function (b, c) {
                return ($(this).hasClass("easyui-fluid") || c) && $(a).menu("resize", a),
                !1
            });
            for (var d = b($(a)), e = 0; e < d.length; e++) _41d(a, d[e])
        }
        function _41d(a, b) {
            var c = $(b).addClass("menu");
            c.data("menu") || c.data("menu", {
                options: $.parser.parseOptions(c[0], ["width", "height"])
            }),
            c.hasClass("menu-content") || (c.children("div").each(function () {
                _41f(a, this)
            }), $('<div class="menu-line"></div>').prependTo(c)),
            _420(a, c),
            c.hasClass("menu-inline") || c.hide(),
            _421(a, c)
        }
        function _41f(_422, div, _423) {
            var item = $(div),
                _424 = $.extend({}, $.parser.parseOptions(item[0], ["id", "name", "iconCls", "href", {
                    separator: "boolean"
                }]), {
                    disabled: !! item.attr("disabled") || void 0,
                    text: $.trim(item.html()),
                    onclick: item[0].onclick
                }, _423 || {});
            _424.onclick = _424.onclick || _424.handler || null,
            item.data("menuitem", {
                    options: _424
                }),
            _424.separator && item.addClass("menu-sep"),
            item.hasClass("menu-sep") || (item.addClass("menu-item"), item.empty().append($('<div class="menu-text"></div>').html(_424.text)), _424.iconCls && $('<div class="menu-icon"></div>').addClass(_424.iconCls).appendTo(item), _424.id && item.attr("id", _424.id), _424.onclick && ("string" == typeof _424.onclick ? item.attr("onclick", _424.onclick) : item[0].onclick = eval(_424.onclick)), _424.disabled && _425(_422, item[0], !0), item[0].submenu && $('<div class="menu-rightarrow"></div>').appendTo(item))
        }
        function _420(a, b) {
            var c = $.data(a, "menu").options,
                d = b.attr("style") || "",
                e = b.is(":visible");
            b.css({
                    display: "block",
                    left: -1e4,
                    height: "auto",
                    overflow: "hidden"
                }),
            b.find(".menu-item").each(function () {
                    $(this)._outerHeight(c.itemHeight),
                    $(this).find(".menu-text").css({
                        height: c.itemHeight - 2 + "px",
                        lineHeight: c.itemHeight - 2 + "px"
                    })
                }),
            b.removeClass("menu-noline").addClass(c.noline ? "menu-noline" : "");
            var f = b.data("menu").options,
                g = f.width,
                h = f.height;
            isNaN(parseInt(g)) && (g = 0, b.find("div.menu-text").each(function () {
                    g < $(this).outerWidth() && (g = $(this).outerWidth())
                }), g = g ? g + 40 : "");
            var i = b.outerHeight();
            if (isNaN(parseInt(h))) if (h = i, b.hasClass("menu-top") && c.alignTo) {
                    var j = $(c.alignTo),
                        k = j.offset().top - $(document).scrollTop(),
                        l = $(window)._outerHeight() + $(document).scrollTop() - j.offset().top - j._outerHeight();
                    h = Math.min(h, Math.max(k, l))
                } else h > $(window)._outerHeight() && (h = $(window).height());
            b.attr("style", d),
            b.show(),
            b._size($.extend({}, f, {
                    width: g,
                    height: h,
                    minWidth: f.minWidth || c.minWidth,
                    maxWidth: f.maxWidth || c.maxWidth
                })),
            b.find(".easyui-fluid").triggerHandler("_resize", [!0]),
            b.css("overflow", b.outerHeight() < i ? "auto" : "hidden"),
            b.children("div.menu-line")._outerHeight(i - 2),
            e || b.hide()
        }
        function _421(a, b) {
            var c = $.data(a, "menu"),
                d = c.options;
            b.unbind(".menu");
            for (var e in d.events) b.bind(e + ".menu", {
                    target: a
                }, d.events[e])
        }
        function _430(a) {
            var b = a.data.target,
                c = $.data(b, "menu");
            c.timer && (clearTimeout(c.timer), c.timer = null)
        }
        function _433(a) {
            var b = a.data.target,
                c = $.data(b, "menu");
            c.options.hideOnUnhover && (c.timer = setTimeout(function () {
                    _436(b, $(b).hasClass("menu-inline"))
                }, c.options.duration))
        }
        function _437(a) {
            var b = a.data.target,
                c = $(a.target).closest(".menu-item");
            if (c.length) {
                    if (c.siblings().each(function () {
                        this.submenu && _416(this.submenu),
                        $(this).removeClass("menu-active")
                    }), c.addClass("menu-active"), c.hasClass("menu-item-disabled")) return void c.addClass("menu-active-disabled");
                    var d = c[0].submenu;
                    d && $(b).menu("show", {
                        menu: d,
                        parent: c
                    })
                }
        }
        function _43a(a) {
            var b = $(a.target).closest(".menu-item");
            if (b.length) {
                b.removeClass("menu-active menu-active-disabled");
                var c = b[0].submenu;
                c ? a.pageX >= parseInt(c.css("left")) ? b.addClass("menu-active") : _416(c) : b.removeClass("menu-active")
            }
        }
        function _43c(a) {
            var b = a.data.target,
                c = $(a.target).closest(".menu-item");
            if (c.length) {
                    var d = $(b).data("menu").options,
                        e = c.data("menuitem").options;
                    if (e.disabled) return;
                    c[0].submenu || (_436(b, d.inline), e.href && (location.href = e.href)),
                    c.trigger("mouseenter"),
                    d.onClick.call(b, $(b).menu("getItem", c[0]))
                }
        }
        function _436(a, b) {
            var c = $.data(a, "menu");
            return c && $(a).is(":visible") && (_416($(a)), b ? $(a).show() : c.options.onHide.call(a)),
            !1
        }
        function _442(a, b) {
            function c(a, b) {
                return a + g.outerHeight() > $(window)._outerHeight() + $(document).scrollTop() && (a = b ? $(b).offset().top - g._outerHeight() : $(window)._outerHeight() + $(document).scrollTop() - g.outerHeight()),
                a < 0 && (a = 0),
                a
            }
            b = b || {};
            var d, e, f = $.data(a, "menu").options,
                g = $(b.menu || a);
            if ($(a).menu("resize", g[0]), g.hasClass("menu-top")) {
                    if ($.extend(f, b), d = f.left, e = f.top, f.alignTo) {
                        var h = $(f.alignTo);
                        d = h.offset().left,
                        e = h.offset().top + h._outerHeight(),
                        "right" == f.align && (d += h.outerWidth() - g.outerWidth())
                    }
                    d + g.outerWidth() > $(window)._outerWidth() + $(document)._scrollLeft() && (d = $(window)._outerWidth() + $(document).scrollLeft() - g.outerWidth() - 5),
                    d < 0 && (d = 0),
                    e = c(e, f.alignTo)
                } else {
                    var i = b.parent;
                    d = i.offset().left + i.outerWidth() - 2,
                    d + g.outerWidth() + 5 > $(window)._outerWidth() + $(document).scrollLeft() && (d = i.offset().left - g.outerWidth() + 2),
                    e = c(i.offset().top - 3)
                }
            g.css(f.position.call(a, g[0], d, e)),
            g.show(0, function () {
                    g[0].shadow || (g[0].shadow = $('<div class="menu-shadow"></div>').insertAfter(g)),
                    g[0].shadow.css({
                        display: g.hasClass("menu-inline") ? "none" : "block",
                        zIndex: $.fn.menu.defaults.zIndex++,
                        left: g.css("left"),
                        top: g.css("top"),
                        width: g.outerWidth(),
                        height: g.outerHeight()
                    }),
                    g.css("z-index", $.fn.menu.defaults.zIndex++),
                    g.hasClass("menu-top") && f.onShow.call(a)
                })
        }
        function _416(a) {
            function b(a) {
                a.stop(!0, !0),
                a[0].shadow && a[0].shadow.hide(),
                a.hide()
            }
            a && a.length && (b(a), a.find("div.menu-item").each(function () {
                this.submenu && _416(this.submenu),
                $(this).removeClass("menu-active")
            }))
        }
        function _449(a, b) {
            function c(f) {
                f.children("div.menu-item").each(function () {
                    var f = $(a).menu("getItem", this),
                        g = e.empty().html(f.text).text();
                    b == $.trim(g) ? d = f : this.submenu && !d && c(this.submenu)
                })
            }
            var d = null,
                e = $("<div></div>");
            return c($(a)),
            e.remove(),
            d
        }
        function _425(a, b, c) {
            var d = $(b);
            if (d.hasClass("menu-item")) {
                var e = d.data("menuitem").options;
                e.disabled = c,
                c ? (d.addClass("menu-item-disabled"), d[0].onclick = null) : (d.removeClass("menu-item-disabled"), d[0].onclick = e.onclick)
            }
        }
        function _44f(a, b) {
            var c = ($.data(a, "menu").options, $(a));
            if (b.parent) {
                if (!b.parent.submenu) {
                    var d = $("<div></div>").appendTo("body");
                    b.parent.submenu = d,
                    $('<div class="menu-rightarrow"></div>').appendTo(b.parent),
                    _41d(a, d)
                }
                c = b.parent.submenu
            }
            var e = $("<div></div>").appendTo(c);
            _41f(a, e, b)
        }
        function _453(a, b) {
            function c(a) {
                if (a.submenu) {
                    a.submenu.children("div.menu-item").each(function () {
                        c(this)
                    });
                    var b = a.submenu[0].shadow;
                    b && b.remove(),
                    a.submenu.remove()
                }
                $(a).remove()
            }
            c(b)
        }
        function _458(a, b, c) {
            var d = $(b).parent();
            c ? $(b).show() : $(b).hide(),
            _420(a, d)
        }
        function _45c(a) {
            $(a).children("div.menu-item").each(function () {
                _453(a, this)
            }),
            a.shadow && a.shadow.remove(),
            $(a).remove()
        }
        $(function () {
            $(document).unbind(".menu").bind("mousedown.menu", function (a) {
                var b = $(a.target).closest("div.menu,div.combo-p");
                b.length || ($("body>div.menu-top:visible").not(".menu-inline").menu("hide"), _416($("body>div.menu:visible").not(".menu-inline")))
            })
        }),
        $.fn.menu = function (a, b) {
            return "string" == typeof a ? $.fn.menu.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b = $.data(this, "menu");
                b ? $.extend(b.options, a) : (b = $.data(this, "menu", {
                    options: $.extend({}, $.fn.menu.defaults, $.fn.menu.parseOptions(this), a)
                }), init(this)),
                $(this).css({
                    left: b.options.left,
                    top: b.options.top
                })
            }))
        },
        $.fn.menu.methods = {
            options: function (a) {
                return $.data(a[0], "menu").options
            },
            show: function (a, b) {
                return a.each(function () {
                    _442(this, b)
                })
            },
            hide: function (a) {
                return a.each(function () {
                    _436(this)
                })
            },
            destroy: function (a) {
                return a.each(function () {
                    _45c(this)
                })
            },
            setText: function (a, b) {
                return a.each(function () {
                    var a = $(b.target).data("menuitem").options;
                    a.text = b.text,
                    $(b.target).children("div.menu-text").html(b.text)
                })
            },
            setIcon: function (a, b) {
                return a.each(function () {
                    var a = $(b.target).data("menuitem").options;
                    a.iconCls = b.iconCls,
                    $(b.target).children("div.menu-icon").remove(),
                    b.iconCls && $('<div class="menu-icon"></div>').addClass(b.iconCls).appendTo(b.target)
                })
            },
            getItem: function (a, b) {
                var c = $(b).data("menuitem").options;
                return $.extend({}, c, {
                    target: $(b)[0]
                })
            },
            findItem: function (a, b) {
                return _449(a[0], b)
            },
            appendItem: function (a, b) {
                return a.each(function () {
                    _44f(this, b)
                })
            },
            removeItem: function (a, b) {
                return a.each(function () {
                    _453(this, b)
                })
            },
            enableItem: function (a, b) {
                return a.each(function () {
                    _425(this, b, !1)
                })
            },
            disableItem: function (a, b) {
                return a.each(function () {
                    _425(this, b, !0)
                })
            },
            showItem: function (a, b) {
                return a.each(function () {
                    _458(this, b, !0)
                })
            },
            hideItem: function (a, b) {
                return a.each(function () {
                    _458(this, b, !1)
                })
            },
            resize: function (a, b) {
                return a.each(function () {
                    _420(this, $(b ? b : this))
                })
            }
        },
        $.fn.menu.parseOptions = function (a) {
            return $.extend({}, $.parser.parseOptions(a, [{
                minWidth: "number",
                itemHeight: "number",
                duration: "number",
                hideOnUnhover: "boolean"
            },
            {
                fit: "boolean",
                inline: "boolean",
                noline: "boolean"
            }]))
        },
        $.fn.menu.defaults = {
            zIndex: 11e4,
            left: 0,
            top: 0,
            alignTo: null,
            align: "left",
            minWidth: 120,
            itemHeight: 22,
            duration: 100,
            hideOnUnhover: !0,
            inline: !1,
            fit: !1,
            noline: !1,
            events: {
                mouseenter: _430,
                mouseleave: _433,
                mouseover: _437,
                mouseout: _43a,
                click: _43c
            },
            position: function (a, b, c) {
                return {
                    left: b,
                    top: c
                }
            },
            onShow: function () {},
            onHide: function () {},
            onClick: function (a) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "menubutton").options,
                d = a(b);
            if (d.linkbutton(c), c.hasDownArrow) {
                    d.removeClass(c.cls.btn1 + " " + c.cls.btn2).addClass("m-btn"),
                    d.removeClass("m-btn-small m-btn-medium m-btn-large").addClass("m-btn-" + c.size);
                    var e = d.find(".l-btn-left");
                    a("<span></span>").addClass(c.cls.arrow).appendTo(e),
                    a("<span></span>").addClass("m-btn-line").appendTo(e)
                }
            if (a(b).menubutton("resize"), c.menu) {
                    a(c.menu).menu({
                        duration: c.duration
                    });
                    var f = a(c.menu).menu("options"),
                        g = f.onShow,
                        h = f.onHide;
                    a.extend(f, {
                            onShow: function () {
                                var b = a(this).menu("options"),
                                    c = a(b.alignTo),
                                    d = c.menubutton("options");
                                c.addClass(1 == d.plain ? d.cls.btn2 : d.cls.btn1),
                                g.call(this)
                            },
                            onHide: function () {
                                var b = a(this).menu("options"),
                                    c = a(b.alignTo),
                                    d = c.menubutton("options");
                                c.removeClass(1 == d.plain ? d.cls.btn2 : d.cls.btn1),
                                h.call(this)
                            }
                        })
                }
        }
        function c(b) {
            function c() {
                return a(b).linkbutton("options").disabled
            }
            var e = a.data(b, "menubutton").options,
                f = a(b),
                g = f.find("." + e.cls.trigger);
            g.length || (g = f),
            g.unbind(".menubutton");
            var h = null;
            g.bind("click.menubutton", function () {
                    if (!c()) return d(b),
                    !1
                }).bind("mouseenter.menubutton", function () {
                    if (!c()) return h = setTimeout(function () {
                        d(b)
                    }, e.duration),
                    !1
                }).bind("mouseleave.menubutton", function () {
                    h && clearTimeout(h),
                    a(e.menu).triggerHandler("mouseleave")
                })
        }
        function d(b) {
            var c = a(b).menubutton("options");
            if (!c.disabled && c.menu) {
                a("body>div.menu-top").menu("hide");
                var d = a(b),
                    e = a(c.menu);
                e.length && (e.menu("options").alignTo = d, e.menu("show", {
                        alignTo: d,
                        align: c.menuAlign
                    })),
                d.blur()
            }
        }
        a.fn.menubutton = function (d, e) {
            if ("string" == typeof d) {
                var f = a.fn.menubutton.methods[d];
                return f ? f(this, e) : this.linkbutton(d, e)
            }
            return d = d || {},
            this.each(function () {
                var e = a.data(this, "menubutton");
                e ? a.extend(e.options, d) : (a.data(this, "menubutton", {
                    options: a.extend({}, a.fn.menubutton.defaults, a.fn.menubutton.parseOptions(this), d)
                }), a(this).removeAttr("disabled")),
                b(this),
                c(this)
            })
        },
        a.fn.menubutton.methods = {
            options: function (b) {
                var c = b.linkbutton("options");
                return a.extend(a.data(b[0], "menubutton").options, {
                    toggle: c.toggle,
                    selected: c.selected,
                    disabled: c.disabled
                })
            },
            destroy: function (b) {
                return b.each(function () {
                    var b = a(this).menubutton("options");
                    b.menu && a(b.menu).menu("destroy"),
                    a(this).remove()
                })
            }
        },
        a.fn.menubutton.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.linkbutton.parseOptions(b), a.parser.parseOptions(b, ["menu", {
                plain: "boolean",
                hasDownArrow: "boolean",
                duration: "number"
            }]))
        },
        a.fn.menubutton.defaults = a.extend({}, a.fn.linkbutton.defaults, {
            plain: !0,
            hasDownArrow: !0,
            menu: null,
            menuAlign: "left",
            duration: 100,
            cls: {
                btn1: "m-btn-active",
                btn2: "m-btn-plain-active",
                arrow: "m-btn-downarrow",
                trigger: "m-btn"
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "splitbutton").options;
            a(b).menubutton(c),
            a(b).addClass("s-btn")
        }
        a.fn.splitbutton = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.splitbutton.methods[c];
                return e ? e(this, d) : this.menubutton(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "splitbutton");
                d ? a.extend(d.options, c) : (a.data(this, "splitbutton", {
                    options: a.extend({}, a.fn.splitbutton.defaults, a.fn.splitbutton.parseOptions(this), c)
                }), a(this).removeAttr("disabled")),
                b(this)
            })
        },
        a.fn.splitbutton.methods = {
            options: function (b) {
                var c = b.menubutton("options"),
                    d = a.data(b[0], "splitbutton").options;
                return a.extend(d, {
                        disabled: c.disabled,
                        toggle: c.toggle,
                        selected: c.selected
                    }),
                d
            }
        },
        a.fn.splitbutton.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.linkbutton.parseOptions(b), a.parser.parseOptions(b, ["menu", {
                plain: "boolean",
                duration: "number"
            }]))
        },
        a.fn.splitbutton.defaults = a.extend({}, a.fn.linkbutton.defaults, {
            plain: !0,
            menu: null,
            duration: 100,
            cls: {
                btn1: "m-btn-active s-btn-active",
                btn2: "m-btn-plain-active s-btn-plain-active",
                arrow: "m-btn-downarrow",
                trigger: "m-btn-line"
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var d = a('<span class="switchbutton"><span class="switchbutton-inner"><span class="switchbutton-on"></span><span class="switchbutton-handle"></span><span class="switchbutton-off"></span><input class="switchbutton-value" type="checkbox"></span></span>').insertAfter(b),
                e = a(b);
            e.addClass("switchbutton-f").hide();
            var f = e.attr("name");
            return f && (e.removeAttr("name").attr("switchbuttonName", f), d.find(".switchbutton-value").attr("name", f)),
            d.bind("_resize", function (d, e) {
                    return (a(this).hasClass("easyui-fluid") || e) && c(b),
                    !1
                }),
            d
        }
        function c(b, c) {
            var d = a.data(b, "switchbutton"),
                f = d.options,
                g = d.switchbutton;
            c && a.extend(f, c);
            var h = g.is(":visible");
            h || g.appendTo("body"),
            g._size(f);
            var i = g.width(),
                j = g.height(),
                i = g.outerWidth(),
                j = g.outerHeight(),
                k = parseInt(f.handleWidth) || g.height(),
                l = 2 * i - k;
            g.find(".switchbutton-inner").css({
                    width: l + "px",
                    height: j + "px",
                    lineHeight: j + "px"
                }),
            g.find(".switchbutton-handle")._outerWidth(k)._outerHeight(j).css({
                    marginLeft: -k / 2 + "px"
                }),
            g.find(".switchbutton-on").css({
                    width: i - k / 2 + "px",
                    textIndent: (f.reversed ? "" : "-") + k / 2 + "px"
                }),
            g.find(".switchbutton-off").css({
                    width: i - k / 2 + "px",
                    textIndent: (f.reversed ? "-" : "") + k / 2 + "px"
                }),
            f.marginWidth = i - k,
            e(b, f.checked, !1),
            h || g.insertAfter(b)
        }
        function d(b) {
            var c = a.data(b, "switchbutton"),
                d = c.options,
                f = c.switchbutton,
                h = f.find(".switchbutton-inner"),
                i = h.find(".switchbutton-on").html(d.onText),
                j = h.find(".switchbutton-off").html(d.offText),
                k = h.find(".switchbutton-handle").html(d.handleText);
            d.reversed ? (j.prependTo(h), i.insertAfter(k)) : (i.prependTo(h), j.insertAfter(k)),
            f.find(".switchbutton-value")._propAttr("checked", d.checked),
            f.removeClass("switchbutton-disabled").addClass(d.disabled ? "switchbutton-disabled" : ""),
            f.removeClass("switchbutton-reversed").addClass(d.reversed ? "switchbutton-reversed" : ""),
            e(b, d.checked),
            g(b, d.readonly),
            a(b).switchbutton("setValue", d.value)
        }
        function e(b, c, d) {
            var e = a.data(b, "switchbutton"),
                f = e.options;
            f.checked = c;
            var g = e.switchbutton.find(".switchbutton-inner"),
                h = g.find(".switchbutton-on"),
                i = f.reversed ? f.checked ? f.marginWidth : 0 : f.checked ? 0 : f.marginWidth,
                j = h.css("float").toLowerCase(),
                k = {};
            k["margin-" + j] = -i + "px",
            d ? g.animate(k, 200) : g.css(k);
            var l = g.find(".switchbutton-value"),
                m = l.is(":checked");
            a(b).add(l)._propAttr("checked", f.checked),
            m != f.checked && f.onChange.call(b, f.checked)
        }
        function f(b, c) {
            var d = a.data(b, "switchbutton"),
                e = d.options,
                f = d.switchbutton,
                g = f.find(".switchbutton-value");
            c ? (e.disabled = !0, a(b).add(g).attr("disabled", "disabled"), f.addClass("switchbutton-disabled")) : (e.disabled = !1, a(b).add(g).removeAttr("disabled"), f.removeClass("switchbutton-disabled"))
        }
        function g(b, c) {
            var d = a.data(b, "switchbutton"),
                e = d.options;
            e.readonly = void 0 == c || c,
            d.switchbutton.removeClass("switchbutton-readonly").addClass(e.readonly ? "switchbutton-readonly" : "")
        }
        function h(b) {
            var c = a.data(b, "switchbutton"),
                d = c.options;
            c.switchbutton.unbind(".switchbutton").bind("click.switchbutton", function () {
                    d.disabled || d.readonly || e(b, !d.checked, !0)
                })
        }
        a.fn.switchbutton = function (e, f) {
            return "string" == typeof e ? a.fn.switchbutton.methods[e](this, f) : (e = e || {}, this.each(function () {
                var f = a.data(this, "switchbutton");
                f ? a.extend(f.options, e) : f = a.data(this, "switchbutton", {
                    options: a.extend({}, a.fn.switchbutton.defaults, a.fn.switchbutton.parseOptions(this), e),
                    switchbutton: b(this)
                }),
                f.options.originalChecked = f.options.checked,
                d(this),
                c(this),
                h(this)
            }))
        },
        a.fn.switchbutton.methods = {
            options: function (b) {
                var c = b.data("switchbutton");
                return a.extend(c.options, {
                    value: c.switchbutton.find(".switchbutton-value").val()
                })
            },
            resize: function (a, b) {
                return a.each(function () {
                    c(this, b)
                })
            },
            enable: function (a) {
                return a.each(function () {
                    f(this, !1)
                })
            },
            disable: function (a) {
                return a.each(function () {
                    f(this, !0)
                })
            },
            readonly: function (a, b) {
                return a.each(function () {
                    g(this, b)
                })
            },
            check: function (a) {
                return a.each(function () {
                    e(this, !0)
                })
            },
            uncheck: function (a) {
                return a.each(function () {
                    e(this, !1)
                })
            },
            clear: function (a) {
                return a.each(function () {
                    e(this, !1)
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).switchbutton("options");
                    e(this, b.originalChecked)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    a(this).val(c),
                    a.data(this, "switchbutton").switchbutton.find(".switchbutton-value").val(c)
                })
            }
        },
        a.fn.switchbutton.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, ["onText", "offText", "handleText", {
                handleWidth: "number",
                reversed: "boolean"
            }]), {
                value: c.val() || void 0,
                checked: !! c.attr("checked") || void 0,
                disabled: !! c.attr("disabled") || void 0,
                readonly: !! c.attr("readonly") || void 0
            })
        },
        a.fn.switchbutton.defaults = {
            handleWidth: "auto",
            width: 60,
            height: 26,
            checked: !1,
            disabled: !1,
            readonly: !1,
            reversed: !1,
            onText: "ON",
            offText: "OFF",
            handleText: "",
            value: "on",
            onChange: function (a) {}
        }
    }(jQuery),


function ($) {
        function init(a) {
            $(a).addClass("validatebox-text")
        }
        function _4b7(a) {
            var b = $.data(a, "validatebox");
            b.validating = !1,
            b.vtimer && clearTimeout(b.vtimer),
            b.ftimer && clearTimeout(b.ftimer),
            $(a).tooltip("destroy"),
            $(a).unbind(),
            $(a).remove()
        }
        function _4ba(a) {
            var b = $.data(a, "validatebox").options;
            if ($(a).unbind(".validatebox"), !b.novalidate && !b.disabled) for (var c in b.events) $(a).bind(c + ".validatebox", {
                target: a
            }, b.events[c])
        }
        function _4bd(a) {
            var b = a.data.target,
                c = $.data(b, "validatebox"),
                d = c.options;
            $(b).attr("readonly") || (c.validating = !0, c.value = d.val(b), function () {
                    if ($(b).is(":visible") || (c.validating = !1), c.validating) {
                        var a = d.val(b);
                        c.value != a ? (c.value = a, c.vtimer && clearTimeout(c.vtimer), c.vtimer = setTimeout(function () {
                            $(b).validatebox("validate")
                        }, d.delay)) : c.message && d.err(b, c.message),
                        c.ftimer = setTimeout(arguments.callee, d.interval)
                    }
                }())
        }
        function _4c1(a) {
            var b = a.data.target,
                c = $.data(b, "validatebox"),
                d = c.options;
            c.validating = !1,
            c.vtimer && (clearTimeout(c.vtimer), c.vtimer = void 0),
            c.ftimer && (clearTimeout(c.ftimer), c.ftimer = void 0),
            d.validateOnBlur && setTimeout(function () {
                    $(b).validatebox("validate")
                }, 0),
            d.err(b, c.message, "hide")
        }
        function _4c4(a) {
            var b = a.data.target,
                c = $.data(b, "validatebox");
            c.options.err(b, c.message, "show")
        }
        function _4c7(a) {
            var b = a.data.target,
                c = $.data(b, "validatebox");
            c.validating || c.options.err(b, c.message, "hide")
        }
        function _4ca(a, b, c) {
            var d = $.data(a, "validatebox"),
                e = d.options,
                f = $(a);
            "hide" != c && b ? (f.is(":focus") && d.validating || "show" == c) && f.tooltip($.extend({}, e.tipOptions, {
                    content: b,
                    position: e.tipPosition,
                    deltaX: e.deltaX,
                    deltaY: e.deltaY
                })).tooltip("show") : f.tooltip("hide")
        }
        function _4cf(_4d0) {
            function _4d4(a) {
                _4d1.message = a
            }
            function _4d5(_4d6, _4d7) {
                var _4d8 = opts.val(_4d0),
                    _4d9 = /([a-zA-Z_]+)(.*)/.exec(_4d6),
                    rule = opts.rules[_4d9[1]];
                if (rule && _4d8) {
                        var _4da = _4d7 || opts.validParams || eval(_4d9[2]);
                        if (!rule.validator.call(_4d0, _4d8, _4da)) {
                            var _4db = rule.message;
                            if (_4da) for (var i = 0; i < _4da.length; i++) _4db = _4db.replace(new RegExp("\\{" + i + "\\}", "g"), _4da[i]);
                            return _4d4(opts.invalidMessage || _4db),
                            !1
                        }
                    }
                return !0
            }
            function _4d3() {
                if (_4d4(""), !opts._validateOnCreate) return setTimeout(function () {
                    opts._validateOnCreate = !0
                }, 0),
                !0;
                if (opts.novalidate || opts.disabled) return !0;
                if (opts.required && "" == opts.val(_4d0)) return _4d4(opts.missingMessage),
                !1;
                if (opts.validType) if ($.isArray(opts.validType)) {
                    for (var a = 0; a < opts.validType.length; a++) if (!_4d5(opts.validType[a])) return !1
                } else if ("string" == typeof opts.validType) {
                    if (!_4d5(opts.validType)) return !1
                } else for (var b in opts.validType) {
                    var c = opts.validType[b];
                    if (!_4d5(b, c)) return !1
                }
                return !0
            }
            var _4d1 = $.data(_4d0, "validatebox"),
                opts = _4d1.options,
                box = $(_4d0);
            opts.onBeforeValidate.call(_4d0);
            var _4d2 = _4d3();
            return _4d2 ? box.removeClass("validatebox-invalid") : box.addClass("validatebox-invalid"),
            opts.err(_4d0, _4d1.message),
            opts.onValidate.call(_4d0, _4d2),
            _4d2
        }
        function _4de(a, b) {
            var c = $.data(a, "validatebox").options;
            void 0 != b && (c.disabled = b),
            c.disabled ? $(a).addClass("validatebox-disabled").attr("disabled", "disabled") : $(a).removeClass("validatebox-disabled").removeAttr("disabled")
        }
        function _4e1(a, b) {
            var c = $.data(a, "validatebox").options;
            c.readonly = void 0 == b || b,
            c.readonly || !c.editable ? ($(a).triggerHandler("blur.validatebox"), $(a).addClass("validatebox-readonly").attr("readonly", "readonly")) : $(a).removeClass("validatebox-readonly").removeAttr("readonly")
        }
        $.fn.validatebox = function (a, b) {
            return "string" == typeof a ? $.fn.validatebox.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b = $.data(this, "validatebox");
                b ? $.extend(b.options, a) : (init(this), b = $.data(this, "validatebox", {
                    options: $.extend({}, $.fn.validatebox.defaults, $.fn.validatebox.parseOptions(this), a)
                })),
                b.options._validateOnCreate = b.options.validateOnCreate,
                _4de(this, b.options.disabled),
                _4e1(this, b.options.readonly),
                _4ba(this),
                _4cf(this)
            }))
        },
        $.fn.validatebox.methods = {
            options: function (a) {
                return $.data(a[0], "validatebox").options
            },
            destroy: function (a) {
                return a.each(function () {
                    _4b7(this)
                })
            },
            validate: function (a) {
                return a.each(function () {
                    _4cf(this)
                })
            },
            isValid: function (a) {
                return _4cf(a[0])
            },
            enableValidation: function (a) {
                return a.each(function () {
                    $(this).validatebox("options").novalidate = !1,
                    _4ba(this),
                    _4cf(this)
                })
            },
            disableValidation: function (a) {
                return a.each(function () {
                    $(this).validatebox("options").novalidate = !0,
                    _4ba(this),
                    _4cf(this)
                })
            },
            resetValidation: function (a) {
                return a.each(function () {
                    var a = $(this).validatebox("options");
                    a._validateOnCreate = a.validateOnCreate,
                    _4cf(this)
                })
            },
            enable: function (a) {
                return a.each(function () {
                    _4de(this, !1),
                    _4ba(this),
                    _4cf(this)
                })
            },
            disable: function (a) {
                return a.each(function () {
                    _4de(this, !0),
                    _4ba(this),
                    _4cf(this)
                })
            },
            readonly: function (a, b) {
                return a.each(function () {
                    _4e1(this, b),
                    _4ba(this),
                    _4cf(this)
                })
            }
        },
        $.fn.validatebox.parseOptions = function (a) {
            var b = $(a);
            return $.extend({}, $.parser.parseOptions(a, ["validType", "missingMessage", "invalidMessage", "tipPosition", {
                delay: "number",
                interval: "number",
                deltaX: "number"
            },
            {
                editable: "boolean",
                validateOnCreate: "boolean",
                validateOnBlur: "boolean"
            }]), {
                required: !! b.attr("required") || void 0,
                disabled: !! b.attr("disabled") || void 0,
                readonly: !! b.attr("readonly") || void 0,
                novalidate: void 0 != b.attr("novalidate") || void 0
            })
        },
        $.fn.validatebox.defaults = {
            required: !1,
            validType: null,
            validParams: null,
            delay: 200,
            interval: 200,
            missingMessage: "This field is required.",
            invalidMessage: null,
            tipPosition: "right",
            deltaX: 0,
            deltaY: 0,
            novalidate: !1,
            editable: !0,
            disabled: !1,
            readonly: !1,
            validateOnCreate: !0,
            validateOnBlur: !1,
            events: {
                focus: _4bd,
                blur: _4c1,
                mouseenter: _4c4,
                mouseleave: _4c7,
                click: function (a) {
                    var b = $(a.data.target);
                    "checkbox" != b.attr("type") && "radio" != b.attr("type") || b.focus().validatebox("validate")
                }
            },
            val: function (a) {
                return $(a).val()
            },
            err: function (a, b, c) {
                _4ca(a, b, c)
            },
            tipOptions: {
                showEvent: "none",
                hideEvent: "none",
                showDelay: 0,
                hideDelay: 0,
                zIndex: "",
                onShow: function () {
                    $(this).tooltip("tip").css({
                        color: "#000",
                        borderColor: "#CC9933",
                        backgroundColor: "#FFFFCC"
                    })
                },
                onHide: function () {
                    $(this).tooltip("destroy")
                }
            },
            rules: {
                email: {
                    validator: function (a) {
                        return /^((([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+(\.([a-z]|\d|[!#\$%&'\*\+\-\/=\?\^_`{\|}~]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])+)*)|((\x22)((((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(([\x01-\x08\x0b\x0c\x0e-\x1f\x7f]|\x21|[\x23-\x5b]|[\x5d-\x7e]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(\\([\x01-\x09\x0b\x0c\x0d-\x7f]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF]))))*(((\x20|\x09)*(\x0d\x0a))?(\x20|\x09)+)?(\x22)))@((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?$/i.test(a)
                    },
                    message: "Please enter a valid email address."
                },
                url: {
                    validator: function (a) {
                        return /^(https?|ftp):\/\/(((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:)*@)?(((\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5])\.(\d|[1-9]\d|1\d\d|2[0-4]\d|25[0-5]))|((([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|\d|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.)+(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])*([a-z]|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])))\.?)(:\d*)?)(\/((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)+(\/(([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)*)*)?)?(\?((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|[\uE000-\uF8FF]|\/|\?)*)?(\#((([a-z]|\d|-|\.|_|~|[\u00A0-\uD7FF\uF900-\uFDCF\uFDF0-\uFFEF])|(%[\da-f]{2})|[!\$&'\(\)\*\+,;=]|:|@)|\/|\?)*)?$/i.test(a)
                    },
                    message: "Please enter a valid URL."
                },
                length: {
                    validator: function (a, b) {
                        var c = $.trim(a).length;
                        return c >= b[0] && c <= b[1]
                    },
                    message: "Please enter a value between {0} and {1}."
                },
                remote: {
                    validator: function (a, b) {
                        var c = {};
                        c[b[1]] = a;
                        var d = $.ajax({
                            url: b[0],
                            dataType: "json",
                            data: c,
                            async: !1,
                            cache: !1,
                            type: "post"
                        }).responseText;
                        return "true" == d
                    },
                    message: "Please fix this field."
                }
            },
            onBeforeValidate: function () {},
            onValidate: function (a) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            a(b).addClass("textbox-f").hide();
            var c = a('<span class="textbox"><input class="textbox-text" autocomplete="off"><input type="hidden" class="textbox-value"></span>').insertAfter(b),
                d = a(b).attr("name");
            return d && (c.find("input.textbox-value").attr("name", d), a(b).removeAttr("name").attr("textboxName", d)),
            c
        }
        function c(b) {
            var c = a.data(b, "textbox"),
                d = c.options,
                e = c.textbox,
                g = "_easyui_textbox_input" + ++j;
            e.addClass(d.cls),
            e.find(".textbox-text").remove(),
            d.multiline ? a('<textarea id="' + g + '" class="textbox-text" autocomplete="off"></textarea>').prependTo(e) : a('<input id="' + g + '" type="' + d.type + '" class="textbox-text" autocomplete="off">').prependTo(e),
            a("#" + g).attr("tabindex", a(b).attr("tabindex") || "").css("text-align", b.style.textAlign || ""),
            e.find(".textbox-addon").remove();
            var k = d.icons ? a.extend(!0, [], d.icons) : [];
            if (d.iconCls && k.push({
                    iconCls: d.iconCls,
                    disabled: !0
                }), k.length) {
                    var l = a('<span class="textbox-addon"></span>').prependTo(e);
                    l.addClass("textbox-addon-" + d.iconAlign);
                    for (var m = 0; m < k.length; m++) l.append('<a href="javascript:;" class="textbox-icon ' + k[m].iconCls + '" icon-index="' + m + '" tabindex="-1"></a>')
                }
            if (e.find(".textbox-button").remove(), d.buttonText || d.buttonIcon) {
                    var n = a('<a href="javascript:;" class="textbox-button"></a>').prependTo(e);
                    n.addClass("textbox-button-" + d.buttonAlign).linkbutton({
                        text: d.buttonText,
                        iconCls: d.buttonIcon,
                        onClick: function () {
                            var b = a(this).parent().prev();
                            b.textbox("options").onClickButton.call(b[0])
                        }
                    })
                }
            d.label ? "object" == typeof d.label ? (c.label = a(d.label), c.label.attr("for", g)) : (a(c.label).remove(), c.label = a('<label class="textbox-label"></label>').html(d.label), c.label.css("textAlign", d.labelAlign).attr("for", g), "after" == d.labelPosition ? c.label.insertAfter(e) : c.label.insertBefore(b), c.label.removeClass("textbox-label-left textbox-label-right textbox-label-top"), c.label.addClass("textbox-label-" + d.labelPosition)) : a(c.label).remove(),
            f(b),
            h(b, d.disabled),
            i(b, d.readonly)
        }
        function d(b) {
            var c = a.data(b, "textbox"),
                d = c.textbox;
            d.find(".textbox-text").validatebox("destroy"),
            d.remove(),
            a(c.label).remove(),
            a(b).remove()
        }
        function e(b, c) {
            function d(a) {
                return (g.iconAlign == a ? n._outerWidth() : 0) + e(a)
            }
            function e(b) {
                var c = 0;
                return m.filter(".textbox-button-" + b).each(function () {
                    c += "left" == b || "right" == b ? a(this).outerWidth() : a(this).outerHeight()
                }),
                c
            }
            var f = a.data(b, "textbox"),
                g = f.options,
                h = f.textbox,
                i = h.parent();
            if (c && ("object" == typeof c ? a.extend(g, c) : g.width = c), isNaN(parseInt(g.width))) {
                    var j = a(b).clone();
                    j.css("visibility", "hidden"),
                    j.insertAfter(b),
                    g.width = j.outerWidth(),
                    j.remove()
                }
            var k = h.is(":visible");
            k || h.appendTo("body");
            var l = h.find(".textbox-text"),
                m = h.find(".textbox-button"),
                n = h.find(".textbox-addon"),
                o = n.find(".textbox-icon");
            "auto" == g.height && l.css({
                    margin: "",
                    paddingTop: "",
                    paddingBottom: "",
                    height: "",
                    lineHeight: ""
                }),
            h._size(g, i),
            g.label && g.labelPosition && ("top" == g.labelPosition ? (f.label._size({
                    width: "auto" == g.labelWidth ? h.outerWidth() : g.labelWidth
                }, h), "auto" != g.height && h._size("height", h.outerHeight() - f.label.outerHeight())) : (f.label._size({
                    width: g.labelWidth,
                    height: h.outerHeight()
                }, h), g.multiline || f.label.css("lineHeight", f.label.height() + "px"), h._size("width", h.outerWidth() - f.label.outerWidth()))),
            "left" == g.buttonAlign || "right" == g.buttonAlign ? m.linkbutton("resize", {
                    height: h.height()
                }) : m.linkbutton("resize", {
                    width: "100%"
                });
            var p = h.width() - o.length * g.iconWidth - e("left") - e("right"),
                q = "auto" == g.height ? l.outerHeight() : h.height() - e("top") - e("bottom");
            n.css(g.iconAlign, e(g.iconAlign) + "px"),
            n.css("top", e("top") + "px"),
            o.css({
                    width: g.iconWidth + "px",
                    height: q + "px"
                }),
            l.css({
                    paddingLeft: b.style.paddingLeft || "",
                    paddingRight: b.style.paddingRight || "",
                    marginLeft: d("left"),
                    marginRight: d("right"),
                    marginTop: e("top"),
                    marginBottom: e("bottom")
                }),
            g.multiline ? (l.css({
                    paddingTop: b.style.paddingTop || "",
                    paddingBottom: b.style.paddingBottom || ""
                }), l._outerHeight(q)) : l.css({
                    paddingTop: 0,
                    paddingBottom: 0,
                    height: q + "px",
                    lineHeight: q + "px"
                }),
            l._outerWidth(p),
            g.onResizing.call(b, g.width, g.height),
            k || h.insertAfter(b),
            g.onResize.call(b, g.width, g.height)
        }
        function f(b) {
            var c = a(b).textbox("options"),
                d = a(b).textbox("textbox");
            d.validatebox(a.extend({}, c, {
                    deltaX: function (c) {
                        return a(b).textbox("getTipX", c)
                    },
                    deltaY: function (c) {
                        return a(b).textbox("getTipY", c)
                    },
                    onBeforeValidate: function () {
                        c.onBeforeValidate.call(b);
                        var d = a(this);
                        d.is(":focus") || d.val() !== c.value && (c.oldInputValue = d.val(), d.val(c.value))
                    },
                    onValidate: function (d) {
                        var e = a(this);
                        void 0 != c.oldInputValue && (e.val(c.oldInputValue), c.oldInputValue = void 0);
                        var f = e.parent();
                        d ? f.removeClass("textbox-invalid") : f.addClass("textbox-invalid"),
                        c.onValidate.call(b, d)
                    }
                }))
        }
        function g(b) {
            var c = a.data(b, "textbox"),
                d = c.options,
                f = c.textbox,
                g = f.find(".textbox-text");
            if (g.attr("placeholder", d.prompt), g.unbind(".textbox"), a(c.label).unbind(".textbox"), !d.disabled && !d.readonly) {
                    c.label && a(c.label).bind("click.textbox", function (c) {
                        d.hasFocusMe || (g.focus(), a(b).textbox("setSelectionRange", {
                            start: 0,
                            end: g.val().length
                        }))
                    }),
                    g.bind("blur.textbox", function (b) {
                        f.hasClass("textbox-focused") && (d.value = a(this).val(), "" == d.value ? a(this).val(d.prompt).addClass("textbox-prompt") : a(this).removeClass("textbox-prompt"), f.removeClass("textbox-focused"))
                    }).bind("focus.textbox", function (b) {
                        d.hasFocusMe = !0,
                        f.hasClass("textbox-focused") || (a(this).val() != d.value && a(this).val(d.value), a(this).removeClass("textbox-prompt"), f.addClass("textbox-focused"))
                    });
                    for (var h in d.inputEvents) g.bind(h + ".textbox", {
                        target: b
                    }, d.inputEvents[h])
                }
            var i = f.find(".textbox-addon");
            i.unbind().bind("click", {
                    target: b
                }, function (c) {
                    var e = a(c.target).closest("a.textbox-icon:not(.textbox-icon-disabled)");
                    if (e.length) {
                        var f = parseInt(e.attr("icon-index")),
                            g = d.icons[f];
                        g && g.handler && g.handler.call(e[0], c),
                        d.onClickIcon.call(b, f)
                    }
                }),
            i.find(".textbox-icon").each(function (b) {
                    var c = d.icons[b],
                        e = a(this);
                    !c || c.disabled || d.disabled || d.readonly ? e.addClass("textbox-icon-disabled") : e.removeClass("textbox-icon-disabled")
                });
            var j = f.find(".textbox-button");
            j.linkbutton(d.disabled || d.readonly ? "disable" : "enable"),
            f.unbind(".textbox").bind("_resize.textbox", function (c, d) {
                    return (a(this).hasClass("easyui-fluid") || d) && e(b),
                    !1
                })
        }
        function h(b, c) {
            var d = a.data(b, "textbox"),
                e = d.options,
                f = d.textbox,
                g = f.find(".textbox-text"),
                h = a(b).add(f.find(".textbox-value"));
            e.disabled = c,
            e.disabled ? (g.blur(), g.validatebox("disable"), f.addClass("textbox-disabled"), h.attr("disabled", "disabled"), a(d.label).addClass("textbox-label-disabled")) : (g.validatebox("enable"), f.removeClass("textbox-disabled"), h.removeAttr("disabled"), a(d.label).removeClass("textbox-label-disabled"))
        }
        function i(b, c) {
            var d = a.data(b, "textbox"),
                e = d.options,
                f = d.textbox,
                g = f.find(".textbox-text");
            e.readonly = void 0 == c || c,
            e.readonly && g.triggerHandler("blur.textbox"),
            g.validatebox("readonly", e.readonly),
            f.removeClass("textbox-readonly").addClass(e.readonly ? "textbox-readonly" : "")
        }
        var j = 0;
        a.fn.textbox = function (d, f) {
            if ("string" == typeof d) {
                var h = a.fn.textbox.methods[d];
                return h ? h(this, f) : this.each(function () {
                    var b = a(this).textbox("textbox");
                    b.validatebox(d, f)
                })
            }
            return d = d || {},
            this.each(function () {
                var f = a.data(this, "textbox");
                f ? (a.extend(f.options, d), void 0 != d.value && (f.options.originalValue = d.value)) : (f = a.data(this, "textbox", {
                    options: a.extend({}, a.fn.textbox.defaults, a.fn.textbox.parseOptions(this), d),
                    textbox: b(this)
                }), f.options.originalValue = f.options.value),
                c(this),
                g(this),
                f.options.doSize && e(this);
                var h = f.options.value;
                f.options.value = "",
                a(this).textbox("initValue", h)
            })
        },
        a.fn.textbox.methods = {
            options: function (b) {
                return a.data(b[0], "textbox").options
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    var b = a(this);
                    if (!b.data("textbox")) {
                        a(c).data("textbox") || a(c).textbox();
                        var d = a.extend(!0, {}, a(c).textbox("options")),
                            e = b.attr("name") || "";
                        b.addClass("textbox-f").hide(),
                        b.removeAttr("name").attr("textboxName", e);
                        var h = a(c).next().clone().insertAfter(b),
                            i = "_easyui_textbox_input" + ++j;
                        h.find(".textbox-value").attr("name", e),
                        h.find(".textbox-text").attr("id", i);
                        var k = a(a(c).textbox("label")).clone();
                        k.length && (k.attr("for", i), "after" == d.labelPosition ? k.insertAfter(b.next()) : k.insertBefore(b)),
                        a.data(this, "textbox", {
                                options: d,
                                textbox: h,
                                label: k.length ? k : void 0
                            });
                        var l = a(c).textbox("button");
                        l.length && b.textbox("button").linkbutton(a.extend(!0, {}, l.linkbutton("options"))),
                        g(this),
                        f(this)
                    }
                })
            },
            textbox: function (b) {
                return a.data(b[0], "textbox").textbox.find(".textbox-text")
            },
            button: function (b) {
                return a.data(b[0], "textbox").textbox.find(".textbox-button")
            },
            label: function (b) {
                return a.data(b[0], "textbox").label
            },
            destroy: function (a) {
                return a.each(function () {
                    d(this)
                })
            },
            resize: function (a, b) {
                return a.each(function () {
                    e(this, b)
                })
            },
            disable: function (a) {
                return a.each(function () {
                    h(this, !0),
                    g(this)
                })
            },
            enable: function (a) {
                return a.each(function () {
                    h(this, !1),
                    g(this)
                })
            },
            readonly: function (a, b) {
                return a.each(function () {
                    i(this, b),
                    g(this)
                })
            },
            isValid: function (a) {
                return a.textbox("textbox").validatebox("isValid")
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).textbox("setValue", "")
                })
            },
            setText: function (b, c) {
                return b.each(function () {
                    var b = a(this).textbox("options"),
                        d = a(this).textbox("textbox");
                    c = void 0 == c ? "" : String(c),
                    a(this).textbox("getText") != c && d.val(c),
                    b.value = c,
                    d.is(":focus") || (c ? d.removeClass("textbox-prompt") : d.val(b.prompt).addClass("textbox-prompt")),
                    a(this).textbox("validate")
                })
            },
            initValue: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "textbox");
                    a(this).textbox("setText", c),
                    b.textbox.find(".textbox-value").val(c),
                    a(this).val(c)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "textbox").options,
                        d = a(this).textbox("getValue");
                    a(this).textbox("initValue", c),
                    d != c && (b.onChange.call(this, c, d), a(this).closest("form").trigger("_change", [this]))
                })
            },
            getText: function (a) {
                var b = a.textbox("textbox");
                return b.is(":focus") ? b.val() : a.textbox("options").value
            },
            getValue: function (a) {
                return a.data("textbox").textbox.find(".textbox-value").val()
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).textbox("options");
                    a(this).textbox("textbox").val(b.originalValue),
                    a(this).textbox("setValue", b.originalValue)
                })
            },
            getIcon: function (a, b) {
                return a.data("textbox").textbox.find(".textbox-icon:eq(" + b + ")")
            },
            getTipX: function (a, b) {
                var c = a.data("textbox"),
                    d = c.options,
                    e = c.textbox,
                    f = e.find(".textbox-text"),
                    b = b || d.tipPosition,
                    g = e.offset(),
                    h = f.offset(),
                    i = e.outerWidth(),
                    j = f.outerWidth();
                return "right" == b ? i - j - h.left + g.left : "left" == b ? g.left - h.left : (i - j - h.left + g.left) / 2 - (h.left - g.left) / 2
            },
            getTipY: function (a, b) {
                var c = a.data("textbox"),
                    d = c.options,
                    e = c.textbox,
                    f = e.find(".textbox-text"),
                    b = b || d.tipPosition,
                    g = e.offset(),
                    h = f.offset(),
                    i = e.outerHeight(),
                    j = f.outerHeight();
                return "left" == b || "right" == b ? (i - j - h.top + g.top) / 2 - (h.top - g.top) / 2 : "bottom" == b ? i - j - h.top + g.top : g.top - h.top
            },
            getSelectionStart: function (a) {
                return a.textbox("getSelectionRange").start
            },
            getSelectionRange: function (a) {
                var b = a.textbox("textbox")[0],
                    c = 0,
                    d = 0;
                if ("number" == typeof b.selectionStart) c = b.selectionStart,
                d = b.selectionEnd;
                else if (b.createTextRange) {
                        var e = document.selection.createRange(),
                            f = b.createTextRange();
                        f.setEndPoint("EndToStart", e),
                        c = f.text.length,
                        d = c + e.text.length
                    }
                return {
                        start: c,
                        end: d
                    }
            },
            setSelectionRange: function (b, c) {
                return b.each(function () {
                    var b = a(this).textbox("textbox")[0],
                        d = c.start,
                        e = c.end;
                    if (b.setSelectionRange) b.setSelectionRange(d, e);
                    else if (b.createTextRange) {
                            var f = b.createTextRange();
                            f.collapse(),
                            f.moveEnd("character", e),
                            f.moveStart("character", d),
                            f.select()
                        }
                })
            }
        },
        a.fn.textbox.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.fn.validatebox.parseOptions(b), a.parser.parseOptions(b, ["prompt", "iconCls", "iconAlign", "buttonText", "buttonIcon", "buttonAlign", "label", "labelPosition", "labelAlign", {
                multiline: "boolean",
                iconWidth: "number",
                labelWidth: "number"
            }]), {
                value: c.val() || void 0,
                type: c.attr("type") ? c.attr("type") : void 0
            })
        },
        a.fn.textbox.defaults = a.extend({}, a.fn.validatebox.defaults, {
            doSize: !0,
            width: "auto",
            height: "auto",
            cls: null,
            prompt: "",
            value: "",
            type: "text",
            multiline: !1,
            icons: [],
            iconCls: null,
            iconAlign: "right",
            iconWidth: 18,
            buttonText: "",
            buttonIcon: null,
            buttonAlign: "right",
            label: null,
            labelWidth: "auto",
            labelPosition: "before",
            labelAlign: "left",
            inputEvents: {
                blur: function (b) {
                    var c = a(b.data.target),
                        d = c.textbox("options");
                    c.textbox("getValue") != d.value && c.textbox("setValue", d.value)
                },
                keydown: function (b) {
                    if (13 == b.keyCode) {
                        var c = a(b.data.target);
                        c.textbox("setValue", c.textbox("getText"))
                    }
                }
            },
            onChange: function (a, b) {},
            onResizing: function (a, b) {},
            onResize: function (a, b) {},
            onClickButton: function () {},
            onClickIcon: function (a) {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "passwordbox"),
                e = c.options,
                f = a.extend(!0, [], e.icons);
            e.showEye && f.push({
                    iconCls: "passwordbox-open",
                    handler: function (a) {
                        e.revealed = !e.revealed,
                        d(b)
                    }
                }),
            a(b).addClass("passwordbox-f").textbox(a.extend({}, e, {
                    icons: f
                })),
            d(b)
        }
        function c(b, c, d) {
            var e = a(b),
                f = e.passwordbox("options");
            if (f.revealed) return void e.textbox("setValue", c);
            for (var g = unescape(f.passwordChar), h = c.split(""), i = e.passwordbox("getValue").split(""), j = 0; j < h.length; j++) {
                    var k = h[j];
                    k != i[j] && k != g && i.splice(j, 0, k)
                }
            var l = e.passwordbox("getSelectionStart");
            h.length < i.length && i.splice(l, i.length - h.length, "");
            for (var j = 0; j < h.length; j++)(d || j != l - 1) && (h[j] = g);
            e.textbox("setValue", i.join("")),
            e.textbox("setText", h.join("")),
            e.textbox("setSelectionRange", {
                    start: l,
                    end: l
                })
        }
        function d(b, c) {
            var d = a(b),
                e = d.passwordbox("options"),
                f = d.next().find(".passwordbox-open"),
                g = unescape(e.passwordChar);
            c = void 0 == c ? d.textbox("getValue") : c,
            d.textbox("setValue", c),
            d.textbox("setText", e.revealed ? c : c.replace(/./gi, g)),
            e.revealed ? f.addClass("passwordbox-close") : f.removeClass("passwordbox-close")
        }
        function e(b) {
            var d = b.data.target,
                e = a(b.data.target),
                f = e.data("passwordbox"),
                g = e.data("passwordbox").options;
            f.checking = !0,
            f.value = e.passwordbox("getText"),


            function () {
                    if (f.checking) {
                        var a = e.passwordbox("getText");
                        f.value != a && (f.value = a, f.lastTimer && (clearTimeout(f.lastTimer), f.lastTimer = void 0), c(d, a), f.lastTimer = setTimeout(function () {
                            c(d, e.passwordbox("getText"), !0),
                            f.lastTimer = void 0
                        }, g.lastDelay)),
                        setTimeout(arguments.callee, g.checkInterval)
                    }
                }()
        }
        function f(b) {
            var c = b.data.target,
                e = a(c).data("passwordbox");
            e.checking = !1,
            e.lastTimer && (clearTimeout(e.lastTimer), e.lastTimer = void 0),
            d(c)
        }
        a.fn.passwordbox = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.passwordbox.methods[c];
                return e ? e(this, d) : this.textbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "passwordbox");
                d ? a.extend(d.options, c) : d = a.data(this, "passwordbox", {
                    options: a.extend({}, a.fn.passwordbox.defaults, a.fn.passwordbox.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.passwordbox.methods = {
            options: function (b) {
                return a.data(b[0], "passwordbox").options
            },
            setValue: function (a, b) {
                return a.each(function () {
                    d(this, b)
                })
            },
            clear: function (a) {
                return a.each(function () {
                    d(this, "")
                })
            },
            reset: function (b) {
                return b.each(function () {
                    a(this).textbox("reset"),
                    d(this)
                })
            },
            showPassword: function (b) {
                return b.each(function () {
                    var b = a(this).passwordbox("options");
                    b.revealed = !0,
                    d(this)
                })
            },
            hidePassword: function (b) {
                return b.each(function () {
                    var b = a(this).passwordbox("options");
                    b.revealed = !1,
                    d(this)
                })
            }
        },
        a.fn.passwordbox.parseOptions = function (b) {
            return a.extend({}, a.fn.textbox.parseOptions(b), a.parser.parseOptions(b, ["passwordChar", {
                checkInterval: "number",
                lastDelay: "number",
                revealed: "boolean",
                showEye: "boolean"
            }]))
        },
        a.fn.passwordbox.defaults = a.extend({}, a.fn.textbox.defaults, {
            passwordChar: "%u25CF",
            checkInterval: 200,
            lastDelay: 500,
            revealed: !1,
            showEye: !0,
            inputEvents: {
                focus: e,
                blur: f
            },
            val: function (b) {
                return a(b).parent().prev().passwordbox("getValue")
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var e = a.data(b, "filebox"),
                f = e.options;
            f.fileboxId = "filebox_file_id_" + ++d,
            a(b).addClass("filebox-f").textbox(f),
            a(b).textbox("textbox").attr("readonly", "readonly"),
            e.filebox = a(b).next().addClass("filebox");
            var g = c(b),
                h = a(b).filebox("button");
            h.length && (a('<label class="filebox-label" for="' + f.fileboxId + '"></label>').appendTo(h), h.linkbutton("options").disabled ? g.attr("disabled", "disabled") : g.removeAttr("disabled"))
        }
        function c(b) {
            var c = a.data(b, "filebox"),
                d = c.options;
            c.filebox.find(".textbox-value").remove(),
            d.oldValue = "";
            var e = a('<input type="file" class="textbox-value">').appendTo(c.filebox);
            return e.attr("id", d.fileboxId).attr("name", a(b).attr("textboxName") || ""),
            e.attr("accept", d.accept),
            e.attr("capture", d.capture),
            d.multiple && e.attr("multiple", "multiple"),
            e.change(function () {
                    var c = this.value;
                    this.files && (c = a.map(this.files, function (a) {
                        return a.name
                    }).join(d.separator)),
                    a(b).filebox("setText", c),
                    d.onChange.call(b, c, d.oldValue),
                    d.oldValue = c
                }),
            e
        }
        var d = 0;
        a.fn.filebox = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.filebox.methods[c];
                return e ? e(this, d) : this.textbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "filebox");
                d ? a.extend(d.options, c) : a.data(this, "filebox", {
                    options: a.extend({}, a.fn.filebox.defaults, a.fn.filebox.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.filebox.methods = {
            options: function (b) {
                var c = b.textbox("options");
                return a.extend(a.data(b[0], "filebox").options, {
                    width: c.width,
                    value: c.value,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).textbox("clear"),
                    c(this)
                })
            },
            reset: function (b) {
                return b.each(function () {
                    a(this).filebox("clear")
                })
            },
            setValue: function (a) {
                return a
            },
            setValues: function (a) {
                return a
            }
        },
        a.fn.filebox.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.fn.textbox.parseOptions(b), a.parser.parseOptions(b, ["accept", "capture", "separator"]), {
                multiple: !! c.attr("multiple") || void 0
            })
        },
        a.fn.filebox.defaults = a.extend({}, a.fn.textbox.defaults, {
            buttonIcon: null,
            buttonText: "Choose File",
            buttonAlign: "right",
            inputEvents: {},
            accept: "",
            capture: "",
            separator: ",",
            multiple: !1
        })
    }(jQuery),


function ($) {
        function _571(a) {
            function b() {
                if (f.menu) {
                    e.menu = $(f.menu).menu();
                    var a = e.menu.menu("options"),
                        b = a.onClick;
                    a.onClick = function (a) {
                            d(a),
                            b.call(this, a)
                        }
                } else e.menu && e.menu.menu("destroy"),
                e.menu = null
            }
            function c() {
                if (e.menu) {
                    var a = e.menu.children("div.menu-item:first");
                    return e.menu.children("div.menu-item").each(function () {
                        var b = $.extend({}, $.parser.parseOptions(this), {
                            selected: !! $(this).attr("selected") || void 0
                        });
                        if (b.selected) return a = $(this),
                        !1
                    }),
                    e.menu.menu("getItem", a[0])
                }
                return null
            }
            function d(b) {
                b && ($(a).textbox("button").menubutton({
                    text: b.text,
                    iconCls: b.iconCls || null,
                    menu: e.menu,
                    menuAlign: f.buttonAlign,
                    plain: !1
                }), e.searchbox.find("input.textbox-value").attr("name", b.name || b.text), $(a).searchbox("resize"))
            }
            var e = $.data(a, "searchbox"),
                f = e.options,
                g = $.extend(!0, [], f.icons);
            g.push({
                    iconCls: "searchbox-button",
                    handler: function (a) {
                        var b = $(a.data.target),
                            c = b.searchbox("options");
                        c.searcher.call(a.data.target, b.searchbox("getValue"), b.searchbox("getName"))
                    }
                }),
            b();
            var h = c();
            $(a).addClass("searchbox-f").textbox($.extend({}, f, {
                    icons: g,
                    buttonText: h ? h.text : ""
                })),
            $(a).attr("searchboxName", $(a).attr("textboxName")),
            e.searchbox = $(a).next(),
            e.searchbox.addClass("searchbox"),
            d(h)
        }
        $.fn.searchbox = function (a, b) {
            if ("string" == typeof a) {
                var c = $.fn.searchbox.methods[a];
                return c ? c(this, b) : this.textbox(a, b)
            }
            return a = a || {},
            this.each(function () {
                var b = $.data(this, "searchbox");
                b ? $.extend(b.options, a) : $.data(this, "searchbox", {
                    options: $.extend({}, $.fn.searchbox.defaults, $.fn.searchbox.parseOptions(this), a)
                }),
                _571(this)
            })
        },
        $.fn.searchbox.methods = {
            options: function (a) {
                var b = a.textbox("options");
                return $.extend($.data(a[0], "searchbox").options, {
                    width: b.width,
                    value: b.value,
                    originalValue: b.originalValue,
                    disabled: b.disabled,
                    readonly: b.readonly
                })
            },
            menu: function (a) {
                return $.data(a[0], "searchbox").menu
            },
            getName: function (a) {
                return $.data(a[0], "searchbox").searchbox.find("input.textbox-value").attr("name")
            },
            selectName: function (a, b) {
                return a.each(function () {
                    var a = $.data(this, "searchbox").menu;
                    a && a.children("div.menu-item").each(function () {
                        var c = a.menu("getItem", this);
                        if (c.name == b) return $(this).triggerHandler("click"),
                        !1
                    })
                })
            },
            destroy: function (a) {
                return a.each(function () {
                    var a = $(this).searchbox("menu");
                    a && a.menu("destroy"),
                    $(this).textbox("destroy")
                })
            }
        },
        $.fn.searchbox.parseOptions = function (_580) {
            var t = $(_580);
            return $.extend({}, $.fn.textbox.parseOptions(_580), $.parser.parseOptions(_580, ["menu"]), {
                searcher: t.attr("searcher") ? eval(t.attr("searcher")) : void 0
            })
        },
        $.fn.searchbox.defaults = $.extend({}, $.fn.textbox.defaults, {
            inputEvents: $.extend({}, $.fn.textbox.defaults.inputEvents, {
                keydown: function (a) {
                    if (13 == a.keyCode) {
                        a.preventDefault();
                        var b = $(a.data.target),
                            c = b.searchbox("options");
                        return b.searchbox("setValue", $(this).val()),
                        c.searcher.call(a.data.target, b.searchbox("getValue"), b.searchbox("getName")),
                        !1
                    }
                }
            }),
            buttonAlign: "left",
            menu: null,
            searcher: function (a, b) {}
        })
    }(jQuery),


function (a) {
        function b(b, e) {
            var f = a.data(b, "form").options;
            a.extend(f, e || {});
            var g = a.extend({}, f.queryParams);
            if (0 != f.onSubmit.call(b, g)) {
                var h = a(b).find(".textbox-text:focus");
                h.triggerHandler("blur"),
                h.focus();
                var i = null;
                if (f.dirty) {
                    var j = [];
                    a.map(f.dirtyFields, function (b) {
                        a(b).hasClass("textbox-f") ? a(b).next().find(".textbox-value").each(function () {
                            j.push(this)
                        }) : j.push(b)
                    }),
                    i = a(b).find("input[name]:enabled,textarea[name]:enabled,select[name]:enabled").filter(function () {
                        return a.inArray(this, j) == -1
                    }),
                    i.attr("disabled", "disabled")
                }
                f.ajax ? f.iframe ? c(b, g) : void 0 !== window.FormData ? d(b, g) : c(b, g) : a(b).submit(),
                f.dirty && i.removeAttr("disabled")
            }
        }
        function c(b, c) {
            function d(c) {
                var d = a(b);
                g.url && d.attr("action", g.url);
                var f = d.attr("target"),
                    i = d.attr("action");
                d.attr("target", h);
                var j = a();
                try {
                        for (var k in c) {
                            var l = a('<input type="hidden" name="' + k + '">').val(c[k]).appendTo(d);
                            j = j.add(l)
                        }
                        e(),
                        d[0].submit()
                    } finally {
                        d.attr("action", i),
                        f ? d.attr("target", f) : d.removeAttr("target"),
                        j.remove()
                    }
            }
            function e() {
                var b = a("#" + h);
                if (b.length) try {
                    var c = b.contents()[0].readyState;
                    c && "uninitialized" == c.toLowerCase() && setTimeout(e, 100)
                } catch (a) {
                    f()
                }
            }
            function f() {
                var c = a("#" + h);
                if (c.length) {
                    c.unbind();
                    var d = "";
                    try {
                        var e = c.contents().find("body");
                        if (d = e.html(), "" == d && --j) return void setTimeout(f, 100);
                        var i = e.find(">textarea");
                        if (i.length) d = i.val();
                        else {
                            var k = e.find(">pre");
                            k.length && (d = k.html())
                        }
                    } catch (a) {}
                    g.success.call(b, d),
                    setTimeout(function () {
                        c.unbind(),
                        c.remove()
                    }, 100)
                }
            }
            var g = a.data(b, "form").options,
                h = "easyui_frame_" + (new Date).getTime(),
                i = a("<iframe id=" + h + " name=" + h + "></iframe>").appendTo("body");
            i.attr("src", window.ActiveXObject ? "javascript:false" : "about:blank"),
            i.css({
                    position: "absolute",
                    top: -1e3,
                    left: -1e3
                }),
            i.bind("load", f),
            d(c);
            var j = 10
        }
        function d(b, c) {
            var d = a.data(b, "form").options,
                e = new FormData(a(b)[0]);
            for (var f in c) e.append(f, c[f]);
            a.ajax({
                    url: d.url,
                    type: "post",
                    xhr: function () {
                        var c = a.ajaxSettings.xhr();
                        return c.upload && c.upload.addEventListener("progress", function (a) {
                            if (a.lengthComputable) {
                                var c = a.total,
                                    e = a.loaded || a.position,
                                    f = Math.ceil(100 * e / c);
                                d.onProgress.call(b, f)
                            }
                        }, !1),
                        c
                    },
                    data: e,
                    dataType: "html",
                    cache: !1,
                    contentType: !1,
                    processData: !1,
                    complete: function (a) {
                        d.success.call(b, a.responseText)
                    }
                })
        }
        function e(b, c) {
            function d(c) {
                var d = a(b);
                for (var f in c) {
                    var i = c[f];
                    e(f, i) || g(f, i) || (d.find('input[name="' + f + '"]').val(i), d.find('textarea[name="' + f + '"]').val(i), d.find('select[name="' + f + '"]').val(i))
                }
                h.onLoadSuccess.call(b, c),
                d.form("validate")
            }
            function e(c, d) {
                var e = a(b).find('[switchbuttonName="' + c + '"]');
                return e.length ? (e.switchbutton("uncheck"), e.each(function () {
                    f(a(this).switchbutton("options").value, d) && a(this).switchbutton("check")
                }), !0) : (e = a(b).find('input[name="' + c + '"][type=radio], input[name="' + c + '"][type=checkbox]'), !! e.length && (e._propAttr("checked", !1), e.each(function () {
                    f(a(this).val(), d) && (a(this).data("lable").click(), a(this)._propAttr("checked", !0))
                }), !0))
            }
            function f(b, c) {
                return b == String(c) || a.inArray(b, a.isArray(c.split(",")) ? c.split(",") : [c]) >= 0
            }
            function g(c, d) {
                var e = a(b).find('[textboxName="' + c + '"],[sliderName="' + c + '"]');
                if (e.length) for (var f = 0; f < h.fieldTypes.length; f++) {
                    var g = h.fieldTypes[f],
                        i = e.data(g);
                    if (i) return i.options.multiple || i.options.range ? e[g]("setValues", d) : e[g]("setValue", d),
                    !0
                }
                return !1
            }
            var h = a.data(b, "form").options;
            if ("string" == typeof c) {
                var i = {};
                if (0 == h.onBeforeLoad.call(b, i)) return;
                a.ajax({
                    url: c,
                    data: i,
                    dataType: "json",
                    success: function (a) {
                        d(a)
                    },
                    error: function () {
                        h.onLoadError.apply(b, arguments)
                    }
                })
            } else d(c)
        }
        function f(b) {
            a("input,select,textarea", b).each(function () {
                if (!a(this).hasClass("textbox-value")) {
                    var b = this.type,
                        c = this.tagName.toLowerCase();
                    if ("text" == b || "hidden" == b || "password" == b || "textarea" == c) this.value = "";
                    else if ("file" == b) {
                            var d = a(this);
                            if (!d.hasClass("textbox-value")) {
                                var e = d.clone().val("");
                                e.insertAfter(d),
                                d.data("validatebox") ? (d.validatebox("destroy"), e.validatebox()) : d.remove()
                            }
                        } else "checkbox" == b || "radio" == b ? this.checked = !1 : "select" == c && (this.selectedIndex = -1)
                }
            });
            for (var c = a(), d = a(b), e = a.data(b, "form").options, f = 0; f < e.fieldTypes.length; f++) {
                var g = e.fieldTypes[f],
                    h = d.find("." + g + "-f").not(c);
                h.length && h[g] && (h[g]("clear"), c = c.add(h))
            }
            d.form("validate")
        }
        function g(b) {
            b.reset();
            for (var c = a(b), d = a.data(b, "form").options, e = d.fieldTypes.length - 1; e >= 0; e--) {
                var f = d.fieldTypes[e],
                    g = c.find("." + f + "-f");
                g.length && g[f] && g[f]("reset")
            }
            c.form("validate")
        }
        function h(c) {
            var d = a.data(c, "form").options;
            a(c).unbind(".form"),
            d.ajax && a(c).bind("submit.form", function () {
                return setTimeout(function () {
                    b(c, d)
                }, 0),
                !1
            }),
            a(c).bind("_change.form", function (b, c) {
                a.inArray(c, d.dirtyFields) == -1 && d.dirtyFields.push(c),
                d.onChange.call(this, c)
            }).bind("change.form", function (b) {
                var c = b.target;
                a(c).hasClass("textbox-text") || (a.inArray(c, d.dirtyFields) == -1 && d.dirtyFields.push(c), d.onChange.call(this, c))
            }),
            k(c, d.novalidate)
        }
        function i(b, c) {
            c = c || {};
            var d = a.data(b, "form");
            d ? a.extend(d.options, c) : a.data(b, "form", {
                options: a.extend({}, a.fn.form.defaults, a.fn.form.parseOptions(b), c)
            })
        }
        function j(b) {
            if (a.fn.validatebox) {
                var c = a(b);
                c.find(".validatebox-text:not(:disabled)").validatebox("validate");
                var d = c.find(".validatebox-invalid");
                return d.filter(":not(:disabled):first").focus(),
                0 == d.length
            }
            return !0
        }
        function k(b, c) {
            var d = a.data(b, "form").options;
            d.novalidate = c,
            a(b).find(".validatebox-text:not(:disabled)").validatebox(c ? "disableValidation" : "enableValidation")
        }
        a.fn.form = function (b, c) {
            return "string" == typeof b ? (this.each(function () {
                i(this)
            }), a.fn.form.methods[b](this, c)) : this.each(function () {
                i(this, b),
                h(this)
            })
        },
        a.fn.form.methods = {
            options: function (b) {
                return a.data(b[0], "form").options
            },
            submit: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            load: function (a, b) {
                return a.each(function () {
                    e(this, b)
                })
            },
            clear: function (a) {
                return a.each(function () {
                    f(this)
                })
            },
            reset: function (a) {
                return a.each(function () {
                    g(this)
                })
            },
            validate: function (a) {
                return j(a[0])
            },
            disableValidation: function (a) {
                return a.each(function () {
                    k(this, !0)
                })
            },
            enableValidation: function (a) {
                return a.each(function () {
                    k(this, !1)
                })
            },
            resetValidation: function (b) {
                return b.each(function () {
                    a(this).find(".validatebox-text:not(:disabled)").validatebox("resetValidation")
                })
            },
            resetDirty: function (b) {
                return b.each(function () {
                    a(this).form("options").dirtyFields = []
                })
            }
        },
        a.fn.form.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.parser.parseOptions(b, [{
                ajax: "boolean",
                dirty: "boolean"
            }]), {
                url: c.attr("action") ? c.attr("action") : void 0
            })
        },
        a.fn.form.defaults = {
            fieldTypes: ["combobox", "combotree", "combogrid", "combotreegrid", "datetimebox", "datebox", "combo", "datetimespinner", "timespinner", "numberspinner", "spinner", "slider", "searchbox", "numberbox", "passwordbox", "filebox", "textbox", "switchbutton"],
            novalidate: !1,
            ajax: !0,
            iframe: !0,
            dirty: !1,
            dirtyFields: [],
            url: null,
            queryParams: {},
            onSubmit: function (b) {
                return a(this).form("validate")
            },
            onProgress: function (a) {},
            success: function (a) {},
            onBeforeLoad: function (a) {},
            onLoadSuccess: function (a) {},
            onLoadError: function () {},
            onChange: function (a) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "numberbox"),
                d = c.options;
            a(b).addClass("numberbox-f").textbox(d),
            a(b).textbox("textbox").css({
                    imeMode: "disabled"
                }),
            a(b).attr("numberboxName", a(b).attr("textboxName")),
            c.numberbox = a(b).next(),
            c.numberbox.addClass("numberbox");
            var e = d.parser.call(b, d.value),
                f = d.formatter.call(b, e);
            a(b).numberbox("initValue", e).numberbox("setText", f)
        }
        function c(b, c) {
            var d = a.data(b, "numberbox"),
                e = d.options;
            e.value = parseFloat(c);
            var c = e.parser.call(b, c),
                f = e.formatter.call(b, c);
            e.value = c,
            a(b).textbox("setText", f).textbox("setValue", c),
            f = e.formatter.call(b, a(b).textbox("getValue")),
            a(b).textbox("setText", f)
        }
        a.fn.numberbox = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.numberbox.methods[c];
                return e ? e(this, d) : this.textbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "numberbox");
                d ? a.extend(d.options, c) : d = a.data(this, "numberbox", {
                    options: a.extend({}, a.fn.numberbox.defaults, a.fn.numberbox.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.numberbox.methods = {
            options: function (b) {
                var c = b.data("textbox") ? b.textbox("options") : {};
                return a.extend(a.data(b[0], "numberbox").options, {
                    width: c.width,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            fix: function (b) {
                return b.each(function () {
                    var b = a(this).numberbox("options");
                    b.value = null;
                    var c = b.parser.call(this, a(this).numberbox("getText"));
                    a(this).numberbox("setValue", c)
                })
            },
            setValue: function (a, b) {
                return a.each(function () {
                    c(this, b)
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).textbox("clear"),
                    a(this).numberbox("options").value = ""
                })
            },
            reset: function (b) {
                return b.each(function () {
                    a(this).textbox("reset"),
                    a(this).numberbox("setValue", a(this).numberbox("getValue"))
                })
            }
        },
        a.fn.numberbox.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.fn.textbox.parseOptions(b), a.parser.parseOptions(b, ["decimalSeparator", "groupSeparator", "suffix", {
                min: "number",
                max: "number",
                precision: "number"
            }]), {
                prefix: c.attr("prefix") ? c.attr("prefix") : void 0
            })
        },
        a.fn.numberbox.defaults = a.extend({}, a.fn.textbox.defaults, {
            inputEvents: {
                keypress: function (b) {
                    var c = b.data.target,
                        d = a(c).numberbox("options");
                    return d.filter.call(c, b)
                },
                blur: function (b) {
                    a(b.data.target).numberbox("fix")
                },
                keydown: function (b) {
                    13 == b.keyCode && a(b.data.target).numberbox("fix")
                }
            },
            min: null,
            max: null,
            precision: 0,
            decimalSeparator: ".",
            groupSeparator: "",
            prefix: "",
            suffix: "",
            filter: function (b) {
                var c = a(this).numberbox("options"),
                    d = a(this).numberbox("getText");
                if (b.metaKey || b.ctrlKey) return !0;
                if (a.inArray(String(b.which), ["46", "8", "13", "0"]) >= 0) return !0;
                var e = a("<span></span>");
                e.html(String.fromCharCode(b.which));
                var f = e.text();
                return e.remove(),
                !f || ("-" == f || f == c.decimalSeparator ? d.indexOf(f) == -1 : f == c.groupSeparator || "0123456789".indexOf(f) >= 0)
            },
            formatter: function (b) {
                if (!b) return b;
                b += "";
                var c = a(this).numberbox("options"),
                    d = b,
                    e = "",
                    f = b.indexOf(".");
                if (f >= 0 && (d = b.substring(0, f), e = b.substring(f + 1, b.length)), c.groupSeparator) for (var g = /(\d+)(\d{3})/; g.test(d);) d = d.replace(g, "$1" + c.groupSeparator + "$2");
                return e ? c.prefix + d + c.decimalSeparator + e + c.suffix : c.prefix + d + c.suffix
            },
            parser: function (b) {
                b += "";
                var c = a(this).numberbox("options");
                c.prefix && (b = a.trim(b.replace(new RegExp("\\" + a.trim(c.prefix), "g"), ""))),
                c.suffix && (b = a.trim(b.replace(new RegExp("\\" + a.trim(c.suffix), "g"), ""))),
                parseFloat(b) != c.value && (c.groupSeparator && (b = a.trim(b.replace(new RegExp("\\" + c.groupSeparator, "g"), ""))), c.decimalSeparator && (b = a.trim(b.replace(new RegExp("\\" + c.decimalSeparator, "g"), "."))), b = b.replace(/\s/g, ""));
                var d = parseFloat(b).toFixed(c.precision);
                return isNaN(d) ? d = "" : "number" == typeof c.min && d < c.min ? d = c.min.toFixed(c.precision) : "number" == typeof c.max && d > c.max && (d = c.max.toFixed(c.precision)),
                d
            }
        })
    }(jQuery),


function (a) {
        function b(b, c) {
            var d = a.data(b, "calendar").options,
                f = a(b);
            c && a.extend(d, {
                    width: c.width,
                    height: c.height
                }),
            f._size(d, f.parent()),
            f.find(".calendar-body")._outerHeight(f.height() - f.find(".calendar-header")._outerHeight()),
            f.find(".calendar-menu").is(":visible") && e(b)
        }
        function c(c) {
            a(c).addClass("calendar").html('<div class="calendar-header"><div class="calendar-nav calendar-prevmonth"></div><div class="calendar-nav calendar-nextmonth"></div><div class="calendar-nav calendar-prevyear"></div><div class="calendar-nav calendar-nextyear"></div><div class="calendar-title"><span class="calendar-text"></span></div></div><div class="calendar-body"><div class="calendar-menu"><div class="calendar-menu-year-inner"><span class="calendar-nav calendar-menu-prev"></span><span><input class="calendar-menu-year" type="text"></input></span><span class="calendar-nav calendar-menu-next"></span></div><div class="calendar-menu-month-inner"></div></div></div>'),
            a(c).bind("_resize", function (d, e) {
                return (a(this).hasClass("easyui-fluid") || e) && b(c),
                !1
            })
        }
        function d(b) {
            function c(b) {
                var c = a(b).closest(".calendar-day");
                return c.length ? c : a(b)
            }
            function d(c) {
                var d = a(b).find(".calendar-menu"),
                    e = d.find(".calendar-menu-year").val(),
                    f = d.find(".calendar-selected").attr("abbr");
                isNaN(e) || (i.year = parseInt(e), i.month = parseInt(f), g(b)),
                c && d.hide()
            }
            function f(a) {
                i.year += a,
                g(b),
                j.find(".calendar-menu-year").val(i.year)
            }
            function h(a) {
                i.month += a,
                i.month > 12 ? (i.year++, i.month = 1) : i.month < 1 && (i.year--, i.month = 12),
                g(b),
                j.find("td.calendar-selected").removeClass("calendar-selected"),
                j.find("td:eq(" + (i.month - 1) + ")").addClass("calendar-selected")
            }
            var i = a.data(b, "calendar").options,
                j = a(b).find(".calendar-menu");
            j.find(".calendar-menu-year").unbind(".calendar").bind("keypress.calendar", function (a) {
                    13 == a.keyCode && d(!0)
                }),
            a(b).unbind(".calendar").bind("mouseover.calendar", function (a) {
                    var b = c(a.target);
                    (b.hasClass("calendar-nav") || b.hasClass("calendar-text") || b.hasClass("calendar-day") && !b.hasClass("calendar-disabled")) && b.addClass("calendar-nav-hover")
                }).bind("mouseout.calendar", function (a) {
                    var b = c(a.target);
                    (b.hasClass("calendar-nav") || b.hasClass("calendar-text") || b.hasClass("calendar-day") && !b.hasClass("calendar-disabled")) && b.removeClass("calendar-nav-hover")
                }).bind("click.calendar", function (a) {
                    var k = c(a.target);
                    if (k.hasClass("calendar-menu-next") || k.hasClass("calendar-nextyear")) f(1);
                    else if (k.hasClass("calendar-menu-prev") || k.hasClass("calendar-prevyear")) f(-1);
                    else if (k.hasClass("calendar-menu-month")) j.find(".calendar-selected").removeClass("calendar-selected"),
                    k.addClass("calendar-selected"),
                    d(!0);
                    else if (k.hasClass("calendar-prevmonth")) h(-1);
                    else if (k.hasClass("calendar-nextmonth")) h(1);
                    else if (k.hasClass("calendar-text")) j.is(":visible") ? j.hide() : e(b);
                    else if (k.hasClass("calendar-day")) {
                        if (k.hasClass("calendar-disabled")) return;
                        var l = i.current;
                        k.closest("div.calendar-body").find(".calendar-selected").removeClass("calendar-selected"),
                        k.addClass("calendar-selected");
                        var m = k.attr("abbr").split(","),
                            n = parseInt(m[0]),
                            o = parseInt(m[1]),
                            p = parseInt(m[2]);
                        i.current = new Date(n, o - 1, p),
                        i.onSelect.call(b, i.current),
                        l && l.getTime() == i.current.getTime() || i.onChange.call(b, i.current, l),
                        i.year == n && i.month == o || (i.year = n, i.month = o, g(b))
                    }
                })
        }
        function e(b) {
            var c = a.data(b, "calendar").options;
            if (a(b).find(".calendar-menu").show(), a(b).find(".calendar-menu-month-inner").is(":empty")) {
                a(b).find(".calendar-menu-month-inner").empty();
                for (var d = a('<table class="calendar-mtable"></table>').appendTo(a(b).find(".calendar-menu-month-inner")), e = 0, f = 0; f < 3; f++) for (var g = a("<tr></tr>").appendTo(d), h = 0; h < 4; h++) a('<td class="calendar-nav calendar-menu-month"></td>').html(c.months[e++]).attr("abbr", e).appendTo(g)
            }
            var i = a(b).find(".calendar-body"),
                j = a(b).find(".calendar-menu"),
                k = j.find(".calendar-menu-year-inner"),
                l = j.find(".calendar-menu-month-inner");
            k.find("input").val(c.year).focus(),
            l.find("td.calendar-selected").removeClass("calendar-selected"),
            l.find("td:eq(" + (c.month - 1) + ")").addClass("calendar-selected"),
            j._outerWidth(i._outerWidth()),
            j._outerHeight(i._outerHeight()),
            l._outerHeight(j.height() - k._outerHeight())
        }
        function f(b, c, d) {
            for (var e = a.data(b, "calendar").options, f = [], g = new Date(c, d, 0).getDate(), h = 1; h <= g; h++) f.push([c, d, h]);
            for (var i = [], j = [], k = -1; f.length > 0;) {
                var l = f.shift();
                j.push(l);
                var m = new Date(l[0], l[1] - 1, l[2]).getDay();
                k == m ? m = 0 : m == (0 == e.firstDay ? 7 : e.firstDay) - 1 && (i.push(j), j = []),
                k = m
            }
            j.length && i.push(j);
            var n = i[0];
            if (n.length < 7) for (; n.length < 7;) {
                var o = n[0],
                    l = new Date(o[0], o[1] - 1, o[2] - 1);
                n.unshift([l.getFullYear(), l.getMonth() + 1, l.getDate()])
            } else {
                for (var o = n[0], j = [], h = 1; h <= 7; h++) {
                    var l = new Date(o[0], o[1] - 1, o[2] - h);
                    j.unshift([l.getFullYear(), l.getMonth() + 1, l.getDate()])
                }
                i.unshift(j)
            }
            for (var p = i[i.length - 1]; p.length < 7;) {
                var q = p[p.length - 1],
                    l = new Date(q[0], q[1] - 1, q[2] + 1);
                p.push([l.getFullYear(), l.getMonth() + 1, l.getDate()])
            }
            if (i.length < 6) {
                for (var q = p[p.length - 1], j = [], h = 1; h <= 7; h++) {
                    var l = new Date(q[0], q[1] - 1, q[2] + h);
                    j.push([l.getFullYear(), l.getMonth() + 1, l.getDate()])
                }
                i.push(j)
            }
            return i
        }
        function g(b) {
            var c = a.data(b, "calendar").options;
            c.current && !c.validator.call(b, c.current) && (c.current = null);
            var d = new Date,
                e = d.getFullYear() + "," + (d.getMonth() + 1) + "," + d.getDate(),
                g = c.current ? c.current.getFullYear() + "," + (c.current.getMonth() + 1) + "," + c.current.getDate() : "",
                h = 6 - c.firstDay,
                i = h + 1;
            h >= 7 && (h -= 7),
            i >= 7 && (i -= 7),
            a(b).find(".calendar-title span").html(c.months[c.month - 1] + " " + c.year);
            var j = a(b).find("div.calendar-body");
            j.children("table").remove();
            var k = ['<table class="calendar-dtable" cellspacing="0" cellpadding="0" border="0">'];
            k.push("<thead><tr>"),
            c.showWeek && k.push('<th class="calendar-week">' + c.weekNumberHeader + "</th>");
            for (var l = c.firstDay; l < c.weeks.length; l++) k.push("<th>" + c.weeks[l] + "</th>");
            for (var l = 0; l < c.firstDay; l++) k.push("<th>" + c.weeks[l] + "</th>");
            k.push("</tr></thead>"),
            k.push("<tbody>");
            for (var m = f(b, c.year, c.month), l = 0; l < m.length; l++) {
                    var n = m[l],
                        o = "";
                    if (0 == l ? o = "calendar-first" : l == m.length - 1 && (o = "calendar-last"), k.push('<tr class="' + o + '">'), c.showWeek) {
                            var p = c.getWeekNumber(new Date(n[0][0], parseInt(n[0][1]) - 1, n[0][2]));
                            k.push('<td class="calendar-week">' + p + "</td>")
                        }
                    for (var q = 0; q < n.length; q++) {
                            var r = n[q],
                                s = r[0] + "," + r[1] + "," + r[2],
                                t = new Date(r[0], parseInt(r[1]) - 1, r[2]),
                                u = c.formatter.call(b, t),
                                v = c.styler.call(b, t),
                                w = "",
                                x = "";
                            "string" == typeof v ? x = v : v && (w = v.class || "", x = v.style || "");
                            var o = "calendar-day";
                            c.year == r[0] && c.month == r[1] || (o += " calendar-other-month"),
                            s == e && (o += " calendar-today"),
                            s == g && (o += " calendar-selected"),
                            q == h ? o += " calendar-saturday" : q == i && (o += " calendar-sunday"),
                            0 == q ? o += " calendar-first" : q == n.length - 1 && (o += " calendar-last"),
                            o += " " + w,
                            c.validator.call(b, t) || (o += " calendar-disabled"),
                            k.push('<td class="' + o + '" abbr="' + s + '" style="' + x + '">' + u + "</td>")
                        }
                    k.push("</tr>")
                }
            k.push("</tbody>"),
            k.push("</table>"),
            j.append(k.join("")),
            j.children("table.calendar-dtable").prependTo(j),
            c.onNavigate.call(b, c.year, c.month)
        }
        a.fn.calendar = function (e, f) {
            return "string" == typeof e ? a.fn.calendar.methods[e](this, f) : (e = e || {}, this.each(function () {
                var f = a.data(this, "calendar");
                f ? a.extend(f.options, e) : (f = a.data(this, "calendar", {
                    options: a.extend({}, a.fn.calendar.defaults, a.fn.calendar.parseOptions(this), e)
                }), c(this)),
                0 == f.options.border && a(this).addClass("calendar-noborder"),
                b(this),
                d(this),
                g(this),
                a(this).find("div.calendar-menu").hide()
            }))
        },
        a.fn.calendar.methods = {
            options: function (b) {
                return a.data(b[0], "calendar").options
            },
            resize: function (a, c) {
                return a.each(function () {
                    b(this, c)
                })
            },
            moveTo: function (b, c) {
                return b.each(function () {
                    if (!c) {
                        var b = new Date;
                        return void a(this).calendar({
                            year: b.getFullYear(),
                            month: b.getMonth() + 1,
                            current: c
                        })
                    }
                    var d = a(this).calendar("options");
                    if (d.validator.call(this, c)) {
                        var e = d.current;
                        a(this).calendar({
                            year: c.getFullYear(),
                            month: c.getMonth() + 1,
                            current: c
                        }),
                        e && e.getTime() == c.getTime() || d.onChange.call(this, d.current, e)
                    }
                })
            }
        },
        a.fn.calendar.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.parser.parseOptions(b, ["weekNumberHeader", {
                firstDay: "number",
                fit: "boolean",
                border: "boolean",
                showWeek: "boolean"
            }]))
        },
        a.fn.calendar.defaults = {
            width: 180,
            height: 180,
            fit: !1,
            border: !0,
            showWeek: !1,
            firstDay: 0,
            weeks: ["S", "M", "T", "W", "T", "F", "S"],
            months: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec"],
            year: (new Date).getFullYear(),
            month: (new Date).getMonth() + 1,
            current: function () {
                var a = new Date;
                return new Date(a.getFullYear(), a.getMonth(), a.getDate())
            }(),
            weekNumberHeader: "",
            getWeekNumber: function (a) {
                var b = new Date(a.getTime());
                b.setDate(b.getDate() + 4 - (b.getDay() || 7));
                var c = b.getTime();
                return b.setMonth(0),
                b.setDate(1),
                Math.floor(Math.round((c - b) / 864e5) / 7) + 1
            },
            formatter: function (a) {
                return a.getDate()
            },
            styler: function (a) {
                return ""
            },
            validator: function (a) {
                return !0
            },
            onSelect: function (a) {},
            onChange: function (a, b) {},
            onNavigate: function (a, b) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            var d = a.data(b, "spinner"),
                e = d.options,
                f = a.extend(!0, [], e.icons);
            if ("left" == e.spinAlign || "right" == e.spinAlign) {
                    e.spinArrow = !0,
                    e.iconAlign = e.spinAlign;
                    var g = {
                        iconCls: "spinner-arrow",
                        handler: function (b) {
                            var d = a(b.target).closest(".spinner-arrow-up,.spinner-arrow-down");
                            c(b.data.target, d.hasClass("spinner-arrow-down"))
                        }
                    };
                    "left" == e.spinAlign ? f.unshift(g) : f.push(g)
                } else e.spinArrow = !1,
            "vertical" == e.spinAlign ? ("top" != e.buttonAlign && (e.buttonAlign = "bottom"), e.clsLeft = "textbox-button-bottom", e.clsRight = "textbox-button-top") : (e.clsLeft = "textbox-button-left", e.clsRight = "textbox-button-right");
            if (a(b).addClass("spinner-f").textbox(a.extend({}, e, {
                    icons: f,
                    doSize: !1,
                    onResize: function (b, c) {
                        if (!e.spinArrow) {
                            var d = a(this).next(),
                                f = d.find(".textbox-button:not(.spinner-button)");
                            if (f.length) {
                                    var g = f.outerWidth(),
                                        h = f.outerHeight(),
                                        i = d.find(".spinner-button." + e.clsLeft),
                                        j = d.find(".spinner-button." + e.clsRight);
                                    "right" == e.buttonAlign ? j.css("marginRight", g + "px") : "left" == e.buttonAlign ? i.css("marginLeft", g + "px") : "top" == e.buttonAlign ? j.css("marginTop", h + "px") : i.css("marginBottom", h + "px")
                                }
                        }
                        e.onResize.call(this, b, c)
                    }
                })), a(b).attr("spinnerName", a(b).attr("textboxName")), d.spinner = a(b).next(), d.spinner.addClass("spinner"), e.spinArrow) {
                    var h = d.spinner.find(".spinner-arrow");
                    h.append('<a href="javascript:;" class="spinner-arrow-up" tabindex="-1"></a>'),
                    h.append('<a href="javascript:;" class="spinner-arrow-down" tabindex="-1"></a>')
                } else {
                    var i = a('<a href="javascript:;" class="textbox-button spinner-button"></a>').addClass(e.clsLeft).appendTo(d.spinner),
                        j = a('<a href="javascript:;" class="textbox-button spinner-button"></a>').addClass(e.clsRight).appendTo(d.spinner);
                    i.linkbutton({
                            iconCls: e.reversed ? "spinner-button-up" : "spinner-button-down",
                            onClick: function () {
                                c(b, !e.reversed)
                            }
                        }),
                    j.linkbutton({
                            iconCls: e.reversed ? "spinner-button-down" : "spinner-button-up",
                            onClick: function () {
                                c(b, e.reversed)
                            }
                        }),
                    e.disabled && a(b).spinner("disable"),
                    e.readonly && a(b).spinner("readonly")
                }
            a(b).spinner("resize")
        }
        function c(b, c) {
            var d = a(b).spinner("options");
            d.spin.call(b, c),
            d[c ? "onSpinDown" : "onSpinUp"].call(b),
            a(b).spinner("validate")
        }
        a.fn.spinner = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.spinner.methods[c];
                return e ? e(this, d) : this.textbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "spinner");
                d ? a.extend(d.options, c) : d = a.data(this, "spinner", {
                    options: a.extend({}, a.fn.spinner.defaults, a.fn.spinner.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.spinner.methods = {
            options: function (b) {
                var c = b.textbox("options");
                return a.extend(a.data(b[0], "spinner").options, {
                    width: c.width,
                    value: c.value,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            }
        },
        a.fn.spinner.parseOptions = function (b) {
            return a.extend({}, a.fn.textbox.parseOptions(b), a.parser.parseOptions(b, ["min", "max", "spinAlign", {
                increment: "number",
                reversed: "boolean"
            }]))
        },
        a.fn.spinner.defaults = a.extend({}, a.fn.textbox.defaults, {
            min: null,
            max: null,
            increment: 1,
            spinAlign: "right",
            reversed: !1,
            spin: function (a) {},
            onSpinUp: function () {},
            onSpinDown: function () {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            a(b).addClass("numberspinner-f");
            var c = a.data(b, "numberspinner").options;
            a(b).numberbox(a.extend({}, c, {
                doSize: !1
            })).spinner(c),
            a(b).numberbox("setValue", c.value)
        }
        function c(b, c) {
            var d = a.data(b, "numberspinner").options,
                e = parseFloat(a(b).numberbox("getValue") || d.value) || 0;
            c ? e -= d.increment : e += d.increment,
            a(b).numberbox("setValue", e)
        }
        a.fn.numberspinner = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.numberspinner.methods[c];
                return e ? e(this, d) : this.numberbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "numberspinner");
                d ? a.extend(d.options, c) : a.data(this, "numberspinner", {
                    options: a.extend({}, a.fn.numberspinner.defaults, a.fn.numberspinner.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.numberspinner.methods = {
            options: function (b) {
                var c = b.numberbox("options");
                return a.extend(a.data(b[0], "numberspinner").options, {
                    width: c.width,
                    value: c.value,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            }
        },
        a.fn.numberspinner.parseOptions = function (b) {
            return a.extend({}, a.fn.spinner.parseOptions(b), a.fn.numberbox.parseOptions(b), {})
        },
        a.fn.numberspinner.defaults = a.extend({}, a.fn.spinner.defaults, a.fn.numberbox.defaults, {
            spin: function (a) {
                c(this, a)
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "timespinner").options;
            a(b).addClass("timespinner-f").spinner(c);
            var d = c.formatter.call(b, c.parser.call(b, c.value));
            a(b).timespinner("initValue", d)
        }
        function c(b) {
            for (var c = b.data.target, e = a.data(c, "timespinner").options, f = a(c).timespinner("getSelectionStart"), g = 0; g < e.selections.length; g++) {
                var h = e.selections[g];
                if (f >= h[0] && f <= h[1]) return void d(c, g)
            }
        }
        function d(b, c) {
            var d = a.data(b, "timespinner").options;
            void 0 != c && (d.highlight = c);
            var e = d.selections[d.highlight];
            if (e) {
                var f = a(b).timespinner("textbox");
                a(b).timespinner("setSelectionRange", {
                    start: e[0],
                    end: e[1]
                }),
                f.focus()
            }
        }
        function e(b, c) {
            var d = a.data(b, "timespinner").options,
                c = d.parser.call(b, c),
                e = d.formatter.call(b, c);
            a(b).spinner("setValue", e)
        }
        function f(b, c) {
            var e = a.data(b, "timespinner").options,
                f = a(b).timespinner("getValue"),
                g = e.selections[e.highlight],
                h = f.substring(0, g[0]),
                i = f.substring(g[0], g[1]),
                j = f.substring(g[1]),
                k = h + ((parseInt(i, 10) || 0) + e.increment * (c ? -1 : 1)) + j;
            a(b).timespinner("setValue", k),
            d(b)
        }
        a.fn.timespinner = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.timespinner.methods[c];
                return e ? e(this, d) : this.spinner(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "timespinner");
                d ? a.extend(d.options, c) : a.data(this, "timespinner", {
                    options: a.extend({}, a.fn.timespinner.defaults, a.fn.timespinner.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.timespinner.methods = {
            options: function (b) {
                var c = b.data("spinner") ? b.spinner("options") : {};
                return a.extend(a.data(b[0], "timespinner").options, {
                    width: c.width,
                    value: c.value,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            setValue: function (a, b) {
                return a.each(function () {
                    e(this, b)
                })
            },
            getHours: function (b) {
                var c = a.data(b[0], "timespinner").options,
                    d = b.timespinner("getValue").split(c.separator);
                return parseInt(d[0], 10)
            },
            getMinutes: function (b) {
                var c = a.data(b[0], "timespinner").options,
                    d = b.timespinner("getValue").split(c.separator);
                return parseInt(d[1], 10)
            },
            getSeconds: function (b) {
                var c = a.data(b[0], "timespinner").options,
                    d = b.timespinner("getValue").split(c.separator);
                return parseInt(d[2], 10) || 0
            }
        },
        a.fn.timespinner.parseOptions = function (b) {
            return a.extend({}, a.fn.spinner.parseOptions(b), a.parser.parseOptions(b, ["separator", {
                showSeconds: "boolean",
                highlight: "number"
            }]))
        },
        a.fn.timespinner.defaults = a.extend({}, a.fn.spinner.defaults, {
            inputEvents: a.extend({}, a.fn.spinner.defaults.inputEvents, {
                click: function (a) {
                    c.call(this, a)
                },
                blur: function (b) {
                    var c = a(b.data.target);
                    c.timespinner("setValue", c.timespinner("getText"))
                },
                keydown: function (b) {
                    if (13 == b.keyCode) {
                        var c = a(b.data.target);
                        c.timespinner("setValue", c.timespinner("getText"))
                    }
                }
            }),
            formatter: function (b) {
                function c(a) {
                    return (a < 10 ? "0" : "") + a
                }
                if (!b) return "";
                var d = a(this).timespinner("options"),
                    e = [c(b.getHours()), c(b.getMinutes())];
                return d.showSeconds && e.push(c(b.getSeconds())),
                e.join(d.separator)
            },
            parser: function (b) {
                function c(a) {
                    if (!a) return null;
                    var b = a.split(d.separator);
                    return new Date(1900, 0, 0, parseInt(b[0], 10) || 0, parseInt(b[1], 10) || 0, parseInt(b[2], 10) || 0)
                }
                var d = a(this).timespinner("options"),
                    e = c(b);
                if (e) {
                        var f = c(d.min),
                            g = c(d.max);
                        f && f > e && (e = f),
                        g && g < e && (e = g)
                    }
                return e
            },
            selections: [
                [0, 2],
                [3, 5],
                [6, 8]
            ],
            separator: ":",
            showSeconds: !1,
            highlight: 0,
            spin: function (a) {
                f(this, a)
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "datetimespinner").options;
            a(b).addClass("datetimespinner-f").timespinner(c)
        }
        a.fn.datetimespinner = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.datetimespinner.methods[c];
                return e ? e(this, d) : this.timespinner(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "datetimespinner");
                d ? a.extend(d.options, c) : a.data(this, "datetimespinner", {
                    options: a.extend({}, a.fn.datetimespinner.defaults, a.fn.datetimespinner.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.datetimespinner.methods = {
            options: function (b) {
                var c = b.timespinner("options");
                return a.extend(a.data(b[0], "datetimespinner").options, {
                    width: c.width,
                    value: c.value,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            }
        },
        a.fn.datetimespinner.parseOptions = function (b) {
            return a.extend({}, a.fn.timespinner.parseOptions(b), a.parser.parseOptions(b, []))
        },
        a.fn.datetimespinner.defaults = a.extend({}, a.fn.timespinner.defaults, {
            formatter: function (b) {
                return b ? a.fn.datebox.defaults.formatter.call(this, b) + " " + a.fn.timespinner.defaults.formatter.call(this, b) : ""
            },
            parser: function (b) {
                if (b = a.trim(b), !b) return null;
                var c = b.split(" "),
                    d = a.fn.datebox.defaults.parser.call(this, c[0]);
                if (c.length < 2) return d;
                var e = a.fn.timespinner.defaults.parser.call(this, c[1]);
                return new Date(d.getFullYear(), d.getMonth(), d.getDate(), e.getHours(), e.getMinutes(), e.getSeconds())
            },
            selections: [
                [0, 2],
                [3, 5],
                [6, 10],
                [11, 13],
                [14, 16],
                [17, 19]
            ]
        })
    }(jQuery),


function ($) {
        function _646(a, b) {
            return $.easyui.indexOfArray(a, b)
        }
        function _647(a, b, c) {
            $.easyui.removeArrayItem(a, b, c)
        }
        function _648(a, b, c) {
            $.easyui.addArrayItem(a, b, c)
        }
        function _649(a, b) {
            return $.data(a, "treegrid") ? b.slice(1) : b
        }
        function _64b(a) {
            var b = $.data(a, "datagrid"),
                c = b.options,
                d = b.panel,
                e = b.dc,
                f = null;
            c.sharedStyleSheet ? f = "boolean" == typeof c.sharedStyleSheet ? "head" : c.sharedStyleSheet : (f = d.closest("div.datagrid-view"), f.length || (f = e.view));
            var g = $(f),
                h = $.data(g[0], "ss");
            return h || (h = $.data(g[0], "ss", {
                    cache: {},
                    dirty: []
                })),
            {
                    add: function (a) {
                        for (var b = ['<style type="text/css" easyui="true">'], c = 0; c < a.length; c++) h.cache[a[c][0]] = {
                            width: a[c][1]
                        };
                        var d = 0;
                        for (var e in h.cache) {
                            var f = h.cache[e];
                            f.index = d++,
                            b.push(e + "{width:" + f.width + "}")
                        }
                        b.push("</style>"),
                        $(b.join("\n")).appendTo(g),
                        g.children("style[easyui]:not(:last)").remove()
                    },
                    getRule: function (a) {
                        var b = g.children("style[easyui]:last")[0],
                            c = b.styleSheet ? b.styleSheet : b.sheet || document.styleSheets[document.styleSheets.length - 1],
                            d = c.cssRules || c.rules;
                        return d[a]
                    },
                    set: function (a, b) {
                        var c = h.cache[a];
                        if (c) {
                            c.width = b;
                            var d = this.getRule(c.index);
                            d && (d.style.width = b)
                        }
                    },
                    remove: function (a) {
                        var b = [];
                        for (var c in h.cache) c.indexOf(a) == -1 && b.push([c, h.cache[c].width]);
                        h.cache = {},
                        this.add(b)
                    },
                    dirty: function (a) {
                        a && h.dirty.push(a)
                    },
                    clean: function () {
                        for (var a = 0; a < h.dirty.length; a++) this.remove(h.dirty[a]);
                        h.dirty = []
                    }
                }
        }
        function _65a(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = c.panel;
            if (b && $.extend(d, b), 1 == d.fit) {
                    var f = e.panel("panel").parent();
                    d.width = f.width(),
                    d.height = f.height()
                }
            e.panel("resize", d)
        }
        function _65f(a) {
            var b = $.data(a, "datagrid"),
                c = b.options,
                d = b.dc,
                e = b.panel,
                f = e.width(),
                g = e.height(),
                h = d.view,
                i = d.view1,
                j = d.view2,
                k = i.children("div.datagrid-header"),
                l = j.children("div.datagrid-header"),
                m = k.find("table"),
                n = l.find("table");
            h.width(f);
            var o = k.children("div.datagrid-header-inner").show();
            i.width(o.find("table").width()),
            c.showHeader || o.hide(),
            j.width(f - i._outerWidth()),
            i.children()._outerWidth(i.width()),
            j.children()._outerWidth(j.width());
            var p = k.add(l).add(m).add(n);
            p.css("height", "");
            var q = Math.max(m.height(), n.height());
            p._outerHeight(q),
            h.children(".datagrid-empty").css("top", q + "px"),
            d.body1.add(d.body2).children("table.datagrid-btable-frozen").css({
                    position: "absolute",
                    top: d.header2._outerHeight()
                });
            var r = d.body2.children("table.datagrid-btable-frozen")._outerHeight(),
                s = r + l._outerHeight() + j.children(".datagrid-footer")._outerHeight();
            e.children(":not(.datagrid-view,.datagrid-mask,.datagrid-mask-msg)").each(function () {
                    s += $(this)._outerHeight()
                });
            var t = e.outerHeight() - e.height(),
                u = e._size("minHeight") || "",
                v = e._size("maxHeight") || "";
            i.add(j).children("div.datagrid-body").css({
                    marginTop: r,
                    height: isNaN(parseInt(c.height)) ? "" : g - s,
                    minHeight: u ? u - t - s : "",
                    maxHeight: v ? v - t - s : ""
                }),
            h.height(j.height())
        }
        function _670(a, b, c) {
            function d(a, b) {
                for (var c = 0; c < b.length; c++) {
                    var d = $(a[c]),
                        e = $(b[c]);
                    d.css("height", ""),
                    e.css("height", "");
                    var f = Math.max(d.height(), e.height());
                    d.css("height", f),
                    e.css("height", f)
                }
            }
            function e(a) {
                var b = 0,
                    c = 0;
                return $(a).children().each(function () {
                        var a = $(this);
                        a.is(":visible") && (c += a._outerHeight(), b < a._outerWidth() && (b = a._outerWidth()))
                    }),
                {
                        width: b,
                        height: c
                    }
            }
            var f = ($.data(a, "datagrid").data.rows, $.data(a, "datagrid").options),
                g = $.data(a, "datagrid").dc;
            if (!g.body1.is(":empty") && (!f.nowrap || f.autoRowHeight || c)) if (void 0 != b) {
                    var h = f.finder.getTr(a, b, "body", 1),
                        i = f.finder.getTr(a, b, "body", 2);
                    d(h, i)
                } else {
                    var h = f.finder.getTr(a, 0, "allbody", 1),
                        i = f.finder.getTr(a, 0, "allbody", 2);
                    if (d(h, i), f.showFooter) {
                            var h = f.finder.getTr(a, 0, "allfooter", 1),
                                i = f.finder.getTr(a, 0, "allfooter", 2);
                            d(h, i)
                        }
                }
            if (_65f(a), "auto" == f.height) {
                    var j = g.body1.parent(),
                        k = g.body2,
                        l = e(k),
                        m = l.height;
                    l.width > k.width() && (m += 18),
                    m -= parseInt(k.css("marginTop")) || 0,
                    j.height(m),
                    k.height(m),
                    g.view.height(g.view2.height())
                }
            g.body2.triggerHandler("scroll")
        }
        function _67d(a, b) {
            function c(c) {
                var d = c ? 1 : 2,
                    g = e.finder.getTr(a, b, "body", d);
                    (c ? f.body1 : f.body2).children("table.datagrid-btable-frozen").append(g)
            }
            var d = $.data(a, "datagrid"),
                e = d.options,
                f = d.dc;
            f.body2.children("table.datagrid-btable-frozen").length || f.body1.add(f.body2).prepend('<table class="datagrid-btable datagrid-btable-frozen" cellspacing="0" cellpadding="0"></table>'),
            c(!0),
            c(!1),
            _65f(a)
        }
        function _684(_685, _686) {
            function _687() {
                var _688 = [],
                    _689 = [];
                return $(_685).children("thead").each(function () {
                        var opt = $.parser.parseOptions(this, [{
                            frozen: "boolean"
                        }]);
                        $(this).find("tr").each(function () {
                            var cols = [];
                            $(this).find("th").each(function () {
                                var th = $(this),
                                    col = $.extend({}, $.parser.parseOptions(this, ["id", "field", "align", "halign", "order", "width", {
                                        sortable: "boolean",
                                        checkbox: "boolean",
                                        resizable: "boolean",
                                        fixed: "boolean"
                                    },
                                    {
                                        rowspan: "number",
                                        colspan: "number"
                                    }]), {
                                        title: th.html() || void 0,
                                        hidden: !! th.attr("hidden") || void 0,
                                        formatter: th.attr("formatter") ? eval(th.attr("formatter")) : void 0,
                                        styler: th.attr("styler") ? eval(th.attr("styler")) : void 0,
                                        sorter: th.attr("sorter") ? eval(th.attr("sorter")) : void 0
                                    });
                                if (col.width && String(col.width).indexOf("%") == -1 && (col.width = parseInt(col.width)), th.attr("editor")) {
                                        var s = $.trim(th.attr("editor"));
                                        "{" == s.substr(0, 1) ? col.editor = eval("(" + s + ")") : col.editor = s
                                    }
                                cols.push(col)
                            }),
                            opt.frozen ? _688.push(cols) : _689.push(cols)
                        })
                    }),
                [_688, _689]
            }
            var _68a = $('<div class="datagrid-wrap"><div class="datagrid-view"><div class="datagrid-view1"><div class="datagrid-header"><div class="datagrid-header-inner"></div></div><div class="datagrid-body"><div class="datagrid-body-inner"></div></div><div class="datagrid-footer"><div class="datagrid-footer-inner"></div></div></div><div class="datagrid-view2"><div class="datagrid-header"><div class="datagrid-header-inner"></div></div><div class="datagrid-body"></div><div class="datagrid-footer"><div class="datagrid-footer-inner"></div></div></div></div></div>').insertAfter(_685);
            _68a.panel({
                doSize: !1,
                cls: "datagrid"
            }),
            $(_685).addClass("datagrid-f").hide().appendTo(_68a.children("div.datagrid-view"));
            var cc = _687(),
                view = _68a.children("div.datagrid-view"),
                _68b = view.children("div.datagrid-view1"),
                _68c = view.children("div.datagrid-view2");
            return {
                    panel: _68a,
                    frozenColumns: cc[0],
                    columns: cc[1],
                    dc: {
                        view: view,
                        view1: _68b,
                        view2: _68c,
                        header1: _68b.children("div.datagrid-header").children("div.datagrid-header-inner"),
                        header2: _68c.children("div.datagrid-header").children("div.datagrid-header-inner"),
                        body1: _68b.children("div.datagrid-body").children("div.datagrid-body-inner"),
                        body2: _68c.children("div.datagrid-body"),
                        footer1: _68b.children("div.datagrid-footer").children("div.datagrid-footer-inner"),
                        footer2: _68c.children("div.datagrid-footer").children("div.datagrid-footer-inner")
                    }
                }
        }
        function _68d(_68e) {
            function _693(a, b, c) {
                if (b) {
                    $(a).show(),
                    $(a).empty();
                    var d = $('<div class="datagrid-cell" style="position:absolute;left:-99999px"></div>').appendTo("body");
                    d._outerWidth(99);
                    var e = 100 - parseInt(d[0].style.width);
                    d.remove();
                    var f = [],
                        g = [],
                        h = [];
                    opts.sortName && (f = opts.sortName.split(","), g = opts.sortOrder.split(","));
                    for (var i = $('<table class="datagrid-htable" border="0" cellspacing="0" cellpadding="0"><tbody></tbody></table>').appendTo(a), j = 0; j < b.length; j++) for (var k = $('<tr class="datagrid-header-row"></tr>').appendTo($("tbody", i)), l = b[j], m = 0; m < l.length; m++) {
                            var n = l[m],
                                o = "";
                            n.rowspan && (o += 'rowspan="' + n.rowspan + '" '),
                            n.colspan && (o += 'colspan="' + n.colspan + '" ', n.id || (n.id = ["datagrid-td-group" + _645, j, m].join("-"))),
                            n.id && (o += 'id="' + n.id + '"');
                            var p = $("<td " + o + "></td>").appendTo(k);
                            if (n.checkbox) p.attr("field", n.field),
                            $('<div class="datagrid-header-check"></div>').html('<input type="checkbox"/>').appendTo(p);
                            else if (n.field) {
                                    p.attr("field", n.field),
                                    p.append('<div class="datagrid-cell"><span></span><span class="datagrid-sort-icon"></span></div>'),
                                    p.find("span:first").html(n.title);
                                    var q = p.find("div.datagrid-cell"),
                                        r = _646(f, n.field);
                                    if (r >= 0 && q.addClass("datagrid-sort-" + g[r]), n.sortable && q.addClass("datagrid-sort"), 0 == n.resizable && q.attr("resizable", "false"), n.width) {
                                            var s = $.parser.parseValue("width", n.width, dc.view, opts.scrollbarSize + (opts.rownumbers ? opts.rownumberWidth : 0));
                                            n.deltaWidth = e,
                                            n.boxWidth = s - e
                                        } else n.auto = !0;
                                    q.css("text-align", n.halign || n.align || ""),
                                    n.cellClass = _68f.cellClassPrefix + "-" + n.field.replace(/[\.|\s]/g, "-"),
                                    q.addClass(n.cellClass)
                                } else $('<div class="datagrid-cell-group"></div>').html(n.title).appendTo(p);
                            n.hidden && (p.hide(), h.push(n.field))
                        }
                    if (c && opts.rownumbers) {
                            var p = $('<td rowspan="' + opts.frozenColumns.length + '"><div class="datagrid-header-rownumber"></div></td>');
                            0 == $("tr", i).length ? p.wrap('<tr class="datagrid-header-row"></tr>').parent().appendTo($("tbody", i)) : p.prependTo($("tr:first", i))
                        }
                    for (var j = 0; j < h.length; j++) _6e1(_68e, h[j], -1)
                }
            }
            function _694() {
                for (var a = [
                    [".datagrid-header-rownumber", opts.rownumberWidth - 1 + "px"],
                    [".datagrid-cell-rownumber", opts.rownumberWidth - 1 + "px"]
                ], b = _6a2(_68e, !0).concat(_6a2(_68e)), c = 0; c < b.length; c++) {
                    var d = _6a3(_68e, b[c]);
                    d && !d.checkbox && a.push(["." + d.cellClass, d.boxWidth ? d.boxWidth + "px" : "auto"])
                }
                _68f.ss.add(a),
                _68f.ss.dirty(_68f.cellSelectorPrefix),
                _68f.cellSelectorPrefix = "." + _68f.cellClassPrefix
            }
            var _68f = $.data(_68e, "datagrid"),
                opts = _68f.options,
                dc = _68f.dc,
                _690 = _68f.panel;
            if (_68f.ss = $(_68e).datagrid("createStyleSheet"), _690.panel($.extend({}, opts, {
                    id: null,
                    doSize: !1,
                    onResize: function (a, b) {
                        $.data(_68e, "datagrid") && (_65f(_68e), $(_68e).datagrid("fitColumns"), opts.onResize.call(_690, a, b))
                    },
                    onExpand: function () {
                        $.data(_68e, "datagrid") && ($(_68e).datagrid("fixRowHeight").datagrid("fitColumns"), opts.onExpand.call(_690))
                    }
                })), _68f.rowIdPrefix = "datagrid-row-r" + ++_645, _68f.cellClassPrefix = "datagrid-cell-c" + _645, _693(dc.header1, opts.frozenColumns, !0), _693(dc.header2, opts.columns, !1), _694(), dc.header1.add(dc.header2).css("display", opts.showHeader ? "block" : "none"), dc.footer1.add(dc.footer2).css("display", opts.showFooter ? "block" : "none"), opts.toolbar) if ($.isArray(opts.toolbar)) {
                    $("div.datagrid-toolbar", _690).remove();
                    for (var tb = $('<div class="datagrid-toolbar"><table cellspacing="0" cellpadding="0"><tr></tr></table></div>').prependTo(_690), tr = tb.find("tr"), i = 0; i < opts.toolbar.length; i++) {
                        var btn = opts.toolbar[i];
                        if ("-" == btn) $('<td><div class="datagrid-btn-separator"></div></td>').appendTo(tr);
                        else {
                            var td = $("<td></td>").appendTo(tr),
                                tool = $('<a href="javascript:;"></a>').appendTo(td);
                            tool[0].onclick = eval(btn.handler ||
                                function () {}),
                            tool.linkbutton($.extend({}, btn, {
                                    plain: !0
                                }))
                        }
                    }
                } else $(opts.toolbar).addClass("datagrid-toolbar").prependTo(_690),
            $(opts.toolbar).show();
            else $("div.datagrid-toolbar", _690).remove();
            if ($("div.datagrid-pager", _690).remove(), opts.pagination) {
                    var _695 = $('<div class="datagrid-pager"></div>');
                    if ("bottom" == opts.pagePosition) _695.appendTo(_690);
                    else if ("top" == opts.pagePosition) _695.addClass("datagrid-pager-top").prependTo(_690);
                    else {
                        var ptop = $('<div class="datagrid-pager datagrid-pager-top"></div>').prependTo(_690);
                        _695.appendTo(_690),
                        _695 = _695.add(ptop)
                    }
                    _695.pagination({
                        total: 0,
                        pageNumber: opts.pageNumber,
                        pageSize: opts.pageSize,
                        pageList: opts.pageList,
                        onSelectPage: function (a, b) {
                            opts.pageNumber = a || 1,
                            opts.pageSize = b,
                            _695.pagination("refresh", {
                                pageNumber: a,
                                pageSize: b
                            }),
                            _6df(_68e)
                        }
                    }),
                    opts.pageSize = _695.pagination("options").pageSize
                }
        }
        function _6a4(a) {
            var b = $.data(a, "datagrid"),
                c = b.panel,
                d = b.options,
                e = b.dc,
                f = e.header1.add(e.header2);
            f.unbind(".datagrid");
            for (var g in d.headerEvents) f.bind(g + ".datagrid", d.headerEvents[g]);
            var h = f.find("div.datagrid-cell"),
                i = "right" == d.resizeHandle ? "e" : "left" == d.resizeHandle ? "w" : "e,w";
            h.each(function () {
                    $(this).resizable({
                        handles: i,
                        disabled: !! $(this).attr("resizable") && "false" == $(this).attr("resizable"),
                        minWidth: 25,
                        onStartResize: function (a) {
                            b.resizing = !0,
                            f.css("cursor", $("body").css("cursor")),
                            b.proxy || (b.proxy = $('<div class="datagrid-resize-proxy"></div>').appendTo(e.view)),
                            b.proxy.css({
                                left: a.pageX - $(c).offset().left - 1,
                                display: "none"
                            }),
                            setTimeout(function () {
                                b.proxy && b.proxy.show()
                            }, 500)
                        },
                        onResize: function (a) {
                            return b.proxy.css({
                                left: a.pageX - $(c).offset().left - 1,
                                display: "block"
                            }),
                            !1
                        },
                        onStopResize: function (c) {
                            f.css("cursor", ""),
                            $(this).css("height", "");
                            var e = $(this).parent().attr("field"),
                                g = _6a3(a, e);
                            g.width = $(this)._outerWidth(),
                            g.boxWidth = g.width - g.deltaWidth,
                            g.auto = void 0,
                            $(this).css("width", ""),
                            $(a).datagrid("fixColumnSize", e),
                            b.proxy.remove(),
                            b.proxy = null,
                            $(this).parents("div:first.datagrid-header").parent().hasClass("datagrid-view1") && _65f(a),
                            $(a).datagrid("fitColumns"),
                            d.onResizeColumn.call(a, e, g.width),
                            setTimeout(function () {
                                    b.resizing = !1
                                }, 0)
                        }
                    })
                });
            var j = e.body1.add(e.body2);
            j.unbind();
            for (var g in d.rowEvents) j.bind(g, d.rowEvents[g]);
            e.body1.bind("mousewheel DOMMouseScroll", function (a) {
                    a.preventDefault();
                    var b = a.originalEvent || window.event,
                        c = b.wheelDelta || b.detail * -1;
                    "deltaY" in b && (c = b.deltaY * -1);
                    var d = $(a.target).closest("div.datagrid-view").children(".datagrid-f"),
                        e = d.data("datagrid").dc;
                    e.body2.scrollTop(e.body2.scrollTop() - c)
                }),
            e.body2.bind("scroll", function () {
                    var a = e.view1.children("div.datagrid-body");
                    a.scrollTop($(this).scrollTop());
                    var b = e.body1.children(":first"),
                        c = e.body2.children(":first");
                    if (b.length && c.length) {
                            var d = b.offset().top,
                                f = c.offset().top;
                            d != f && a.scrollTop(a.scrollTop() + d - f)
                        }
                    e.view2.children("div.datagrid-header,div.datagrid-footer")._scrollLeft($(this)._scrollLeft()),
                    e.body2.children("table.datagrid-btable-frozen").css("left", -$(this)._scrollLeft())
                })
        }
        function _6ae(a) {
            return function (b) {
                var c = $(b.target).closest("td[field]");
                if (c.length) {
                    var d = _6b1(c);
                    !$(d).data("datagrid").resizing && a ? c.addClass("datagrid-header-over") : c.removeClass("datagrid-header-over")
                }
            }
        }
        function _6b2(a) {
            var b = _6b1(a.target),
                c = $(b).datagrid("options"),
                d = $(a.target).closest("input[type=checkbox]");
            if (d.length) {
                    if (c.singleSelect && c.selectOnCheck) return !1;
                    d.is(":checked") ? _6b4(b) : _6b5(b),
                    a.stopPropagation()
                } else {
                    var e = $(a.target).closest(".datagrid-cell");
                    if (e.length) {
                        var f = e.offset().left + 5,
                            g = e.offset().left + e._outerWidth() - 5;
                        a.pageX < g && a.pageX > f && _6b6(b, e.parent().attr("field"))
                    }
                }
        }
        function _6b7(a) {
            var b = _6b1(a.target),
                c = $(b).datagrid("options"),
                d = $(a.target).closest(".datagrid-cell");
            if (d.length) {
                    var e = d.offset().left + 5,
                        f = d.offset().left + d._outerWidth() - 5,
                        g = "right" == c.resizeHandle ? a.pageX > f : "left" == c.resizeHandle ? a.pageX < e : a.pageX < e || a.pageX > f;
                    if (g) {
                            var h = d.parent().attr("field"),
                                i = _6a3(b, h);
                            if (0 == i.resizable) return;
                            $(b).datagrid("autoSizeColumn", h),
                            i.auto = !1
                        }
                }
        }
        function _6ba(a) {
            var b = _6b1(a.target),
                c = $(b).datagrid("options"),
                d = $(a.target).closest("td[field]");
            c.onHeaderContextMenu.call(b, a, d.attr("field"))
        }
        function _6bc(a) {
            return function (b) {
                var c = _6be(b.target);
                if (c) {
                    var d = _6b1(c);
                    if (!$.data(d, "datagrid").resizing) {
                        var e = _6c1(c);
                        if (a) _6c2(d, e);
                        else {
                            var f = $.data(d, "datagrid").options;
                            f.finder.getTr(d, e).removeClass("datagrid-row-over")
                        }
                    }
                }
            }
        }
        function _6c3(a) {
            var b = _6be(a.target);
            if (b) {
                var c = _6b1(b),
                    d = $.data(c, "datagrid").options,
                    e = _6c1(b),
                    f = $(a.target);
                if (f.parent().hasClass("datagrid-cell-check")) d.singleSelect && d.selectOnCheck ? (f._propAttr("checked", !f.is(":checked")), _6c6(c, e)) : f.is(":checked") ? (f._propAttr("checked", !1), _6c6(c, e)) : (f._propAttr("checked", !0), _6c7(c, e));
                else {
                        var g = d.finder.getRow(c, e),
                            h = f.closest("td[field]", b);
                        if (h.length) {
                                var i = h.attr("field");
                                d.onClickCell.call(c, e, i, g[i])
                            }
                        if (1 == d.singleSelect) _6c9(c, e);
                        else if (d.ctrlSelect) if (a.metaKey || a.ctrlKey) b.hasClass("datagrid-row-selected") ? _6ca(c, e) : _6c9(c, e);
                        else if (a.shiftKey) {
                                $(c).datagrid("clearSelections");
                                for (var j = Math.min(d.lastSelectedIndex || 0, e), k = Math.max(d.lastSelectedIndex || 0, e), l = j; l <= k; l++) _6c9(c, l)
                            } else $(c).datagrid("clearSelections"),
                        _6c9(c, e),
                        d.lastSelectedIndex = e;
                        else b.hasClass("datagrid-row-selected") ? _6ca(c, e) : _6c9(c, e);
                        d.onClickRow.apply(c, _649(c, [e, g]))
                    }
            }
        }
        function _6cd(a) {
            var b = _6be(a.target);
            if (b) {
                var c = _6b1(b),
                    d = $.data(c, "datagrid").options,
                    e = _6c1(b),
                    f = d.finder.getRow(c, e),
                    g = $(a.target).closest("td[field]", b);
                if (g.length) {
                        var h = g.attr("field");
                        d.onDblClickCell.call(c, e, h, f[h])
                    }
                d.onDblClickRow.apply(c, _649(c, [e, f]))
            }
        }
        function _6d1(a) {
            var b = _6be(a.target);
            if (b) {
                var c = _6b1(b),
                    d = $.data(c, "datagrid").options,
                    e = _6c1(b),
                    f = d.finder.getRow(c, e);
                d.onRowContextMenu.call(c, a, e, f)
            } else {
                var g = _6be(a.target, ".datagrid-body");
                if (g) {
                    var c = _6b1(g),
                        d = $.data(c, "datagrid").options;
                    d.onRowContextMenu.call(c, a, -1, null)
                }
            }
        }
        function _6b1(a) {
            return $(a).closest("div.datagrid-view").children(".datagrid-f")[0]
        }
        function _6be(a, b) {
            var c = $(a).closest(b || "tr.datagrid-row");
            return c.length && c.parent().length ? c : void 0
        }
        function _6c1(a) {
            return a.attr("datagrid-row-index") ? parseInt(a.attr("datagrid-row-index")) : a.attr("node-id")
        }
        function _6b6(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options;
            b = b || {};
            var e = {
                    sortName: d.sortName,
                    sortOrder: d.sortOrder
                };
            "object" == typeof b && $.extend(e, b);
            var f = [],
                g = [];
            if (e.sortName && (f = e.sortName.split(","), g = e.sortOrder.split(",")), "string" == typeof b) {
                    var h = b,
                        i = _6a3(a, h);
                    if (!i.sortable || c.resizing) return;
                    var j = i.order || "asc",
                        k = _646(f, h);
                    if (k >= 0) {
                            var l = "asc" == g[k] ? "desc" : "asc";
                            d.multiSort && l == j ? (f.splice(k, 1), g.splice(k, 1)) : g[k] = l
                        } else d.multiSort ? (f.push(h), g.push(j)) : (f = [h], g = [j]);
                    e.sortName = f.join(","),
                    e.sortOrder = g.join(",")
                }
            if (0 != d.onBeforeSortColumn.call(a, e.sortName, e.sortOrder)) {
                    $.extend(d, e);
                    var m = c.dc,
                        n = m.header1.add(m.header2);
                    n.find("div.datagrid-cell").removeClass("datagrid-sort-asc datagrid-sort-desc");
                    for (var o = 0; o < f.length; o++) {
                            var i = _6a3(a, f[o]);
                            n.find("div." + i.cellClass).addClass("datagrid-sort-" + g[o])
                        }
                    d.remoteSort ? _6df(a) : _6e0(a, $(a).datagrid("getData")),
                    d.onSortColumn.call(a, d.sortName, d.sortOrder)
                }
        }
        function _6e1(a, b, c) {
            function d(d) {
                var e = _6e7(a, d);
                if (e.length) {
                    var f = e[e.length - 1],
                        g = _646(f, b);
                    if (g >= 0) for (var h = 0; h < e.length - 1; h++) {
                            var i = $("#" + e[h][g]),
                                j = parseInt(i.attr("colspan") || 1) + (c || 0);
                            i.attr("colspan", j),
                            j ? i.show() : i.hide()
                        }
                }
            }
            d(!0),
            d(!1)
        }
        function _6ec(a) {
            function b() {
                if (g.fitColumns) {
                    f.leftWidth || (f.leftWidth = 0);
                    for (var b = 0, c = [], d = _6a2(a, !1), h = 0; h < d.length; h++) {
                        var j = _6a3(a, d[h]);
                        e(j) && (b += j.width, c.push({
                            field: j.field,
                            col: j,
                            addingWidth: 0
                        }))
                    }
                    if (b) {
                        c[c.length - 1].addingWidth -= f.leftWidth;
                        var k = i.children("div.datagrid-header-inner").show(),
                            l = i.width() - i.find("table").width() - g.scrollbarSize + f.leftWidth,
                            m = l / b;
                        g.showHeader || k.hide();
                        for (var h = 0; h < c.length; h++) {
                                var n = c[h],
                                    o = parseInt(n.col.width * m);
                                n.addingWidth += o,
                                l -= o
                            }
                        c[c.length - 1].addingWidth += l;
                        for (var h = 0; h < c.length; h++) {
                                var n = c[h];
                                n.col.boxWidth + n.addingWidth > 0 && (n.col.boxWidth += n.addingWidth, n.col.width += n.addingWidth)
                            }
                        f.leftWidth = l,
                        $(a).datagrid("fixColumnSize")
                    }
                }
            }
            function c() {
                var b = !1,
                    c = _6a2(a, !0).concat(_6a2(a, !1));
                $.map(c, function (c) {
                        var d = _6a3(a, c);
                        if (String(d.width || "").indexOf("%") >= 0) {
                            var e = $.parser.parseValue("width", d.width, h.view, g.scrollbarSize + (g.rownumbers ? g.rownumberWidth : 0)) - d.deltaWidth;
                            e > 0 && (d.boxWidth = e, b = !0)
                        }
                    }),
                b && $(a).datagrid("fixColumnSize")
            }
            function d(b) {
                var c = h.header1.add(h.header2).find(".datagrid-cell-group");
                c.length && (c.each(function () {
                    $(this)._outerWidth(b ? $(this).parent().width() : 10)
                }), b && _65f(a))
            }
            function e(a) {
                return !(String(a.width || "").indexOf("%") >= 0) && (!(a.hidden || a.checkbox || a.auto || a.fixed) || void 0)
            }
            var f = $.data(a, "datagrid"),
                g = f.options,
                h = f.dc,
                i = h.view2.children("div.datagrid-header");
            h.body2.css("overflow-x", ""),
            d(),
            c(),
            b(),
            d(!0),
            i.width() >= i.find("table").width() && h.body2.css("overflow-x", "hidden")
        }
        function _6fe(a, b) {
            function c(b) {
                function c(c) {
                    function f(a) {
                        return a.is(":visible") ? a._outerWidth() : g.html(a.html())._outerWidth()
                    }
                    var h = 0;
                    return "header" == c ? h = f(d) : e.finder.getTr(a, 0, c).find('td[field="' + b + '"] div.datagrid-cell').each(function () {
                        var a = f($(this));
                        h < a && (h = a)
                    }),
                    h
                }
                var d = f.view.find('div.datagrid-header td[field="' + b + '"] div.datagrid-cell');
                d.css("width", "");
                var h = $(a).datagrid("getColumnOption", b);
                h.width = void 0,
                h.boxWidth = void 0,
                h.auto = !0,
                $(a).datagrid("fixColumnSize", b);
                var i = Math.max(c("header"), c("allbody"), c("allfooter")) + 1;
                d._outerWidth(i - 1),
                h.width = i,
                h.boxWidth = parseInt(d[0].style.width),
                h.deltaWidth = i - h.boxWidth,
                d.css("width", ""),
                $(a).datagrid("fixColumnSize", b),
                e.onResizeColumn.call(a, b, h.width)
            }
            var d = $.data(a, "datagrid"),
                e = d.options,
                f = d.dc,
                g = $('<div class="datagrid-cell" style="position:absolute;left:-9999px"></div>').appendTo("body");
            if (b) c(b),
            $(a).datagrid("fitColumns");
            else {
                    for (var h = !1, i = _6a2(a, !0).concat(_6a2(a, !1)), j = 0; j < i.length; j++) {
                        var b = i[j],
                            k = _6a3(a, b);
                        k.auto && (c(b), h = !0)
                    }
                    h && $(a).datagrid("fitColumns")
                }
            g.remove()
        }
        function _70a(a, b) {
            function c(b) {
                var c = _6a3(a, b);
                c.cellClass && d.ss.set("." + c.cellClass, c.boxWidth ? c.boxWidth + "px" : "auto")
            }
            var d = $.data(a, "datagrid"),
                e = (d.options, d.dc),
                f = e.view.find("table.datagrid-btable,table.datagrid-ftable");
            if (f.css("table-layout", "fixed"), b) c(b);
            else for (var g = _6a2(a, !0).concat(_6a2(a, !1)), h = 0; h < g.length; h++) c(g[h]);
            f.css("table-layout", ""),
            _70f(a),
            _670(a),
            _710(a)
        }
        function _70f(a, b) {
            var c = $.data(a, "datagrid").dc;
            b = b || c.view.find("td.datagrid-td-merged"),
            b.each(function () {
                var b = $(this),
                    c = b.attr("colspan") || 1;
                if (c > 1) {
                        for (var d = _6a3(a, b.attr("field")), e = d.boxWidth + d.deltaWidth - 1, f = 1; f < c; f++) b = b.next(),
                        d = _6a3(a, b.attr("field")),
                        e += d.boxWidth + d.deltaWidth;
                        $(this).children("div.datagrid-cell")._outerWidth(e)
                    }
            })
        }
        function _710(a) {
            var b = $.data(a, "datagrid").dc;
            b.view.find("div.datagrid-editable").each(function () {
                var b = $(this),
                    c = b.parent().attr("field"),
                    d = $(a).datagrid("getColumnOption", c);
                b._outerWidth(d.boxWidth + d.deltaWidth - 1);
                var e = $.data(this, "datagrid.editor");
                e.actions.resize && e.actions.resize(e.target, b.width())
            })
        }
        function _6a3(a, b) {
            function c(a) {
                if (a) for (var c = 0; c < a.length; c++) for (var d = a[c], e = 0; e < d.length; e++) {
                    var f = d[e];
                    if (f.field == b) return f
                }
                return null
            }
            var d = $.data(a, "datagrid").options,
                e = c(d.columns);
            return e || (e = c(d.frozenColumns)),
            e
        }
        function _6e7(a, b) {
            function c() {
                var a = 0;
                return $.map(f[0] || [], function (b) {
                    a += b.colspan || 1
                }),
                a
            }
            function d(a) {
                for (var b = 0; b < a.length; b++) if (void 0 == a[b]) return b;
                return -1
            }
            for (var e = $.data(a, "datagrid").options, f = b ? e.frozenColumns : e.columns, g = [], h = c(), i = 0; i < f.length; i++) g[i] = new Array(h);
            for (var j = 0; j < f.length; j++) $.map(f[j], function (a) {
                var b = d(g[j]);
                if (b >= 0) for (var c = a.field || a.id || "", e = 0; e < (a.colspan || 1); e++) {
                    for (var f = 0; f < (a.rowspan || 1); f++) g[j + f][b] = c;
                    b++
                }
            });
            return g
        }
        function _6a2(a, b) {
            var c = _6e7(a, b);
            return c.length ? c[c.length - 1] : c
        }
        function _6e0(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = c.dc;
            if (b = d.loadFilter.call(a, b), $.isArray(b) && (b = {
                    total: b.length,
                    rows: b
                }), b.total = parseInt(b.total), c.data = b, b.footer && (c.footer = b.footer), !d.remoteSort && d.sortName) {
                    var f = d.sortName.split(","),
                        g = d.sortOrder.split(",");
                    b.rows.sort(function (b, c) {
                            for (var d = 0, e = 0; e < f.length; e++) {
                                var h = f[e],
                                    i = g[e],
                                    j = _6a3(a, h),
                                    k = j.sorter ||
                                function (a, b) {
                                        return a == b ? 0 : a > b ? 1 : -1
                                    };
                                if (d = k(b[h], c[h]) * ("asc" == i ? 1 : -1), 0 != d) return d
                            }
                            return d
                        })
                }
            d.view.onBeforeRender && d.view.onBeforeRender.call(d.view, a, b.rows),
            d.view.render.call(d.view, a, e.body2, !1),
            d.view.render.call(d.view, a, e.body1, !0),
            d.showFooter && (d.view.renderFooter.call(d.view, a, e.footer2, !1), d.view.renderFooter.call(d.view, a, e.footer1, !0)),
            d.view.onAfterRender && d.view.onAfterRender.call(d.view, a),
            c.ss.clean();
            var h = $(a).datagrid("getPager");
            if (h.length) {
                    var i = h.pagination("options");
                    i.total != b.total && (h.pagination("refresh", {
                        total: b.total
                    }), d.pageNumber != i.pageNumber && i.pageNumber > 0 && (d.pageNumber = i.pageNumber, _6df(a)))
                }
            _670(a),
            e.body2.triggerHandler("scroll"),
            $(a).datagrid("setSelectionState"),
            $(a).datagrid("autoSizeColumn"),
            d.onLoadSuccess.call(a, b)
        }
        function _72d(a) {
            function b(a, b) {
                for (var c = 0; c < a.length; c++) if (a[c][d.idField] == b[d.idField]) return a[c] = b,
                !0;
                return !1
            }
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = c.dc;
            if (e.header1.add(e.header2).find("input[type=checkbox]")._propAttr("checked", !1), d.idField) {
                    var f = !! $.data(a, "treegrid"),
                        g = d.onSelect,
                        h = d.onCheck;
                    d.onSelect = d.onCheck = function () {};
                    for (var i = d.finder.getRows(a), j = 0; j < i.length; j++) {
                            var k = i[j],
                                l = f ? k[d.idField] : $(a).datagrid("getRowIndex", k[d.idField]);
                            b(c.selectedRows, k) && _6c9(a, l, !0, !0),
                            b(c.checkedRows, k) && _6c6(a, l, !0)
                        }
                    d.onSelect = g,
                    d.onCheck = h
                }
        }
        function _735(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = c.data.rows;
            if ("object" == typeof b) return _646(e, b);
            for (var f = 0; f < e.length; f++) if (e[f][d.idField] == b) return f;
            return -1
        }
        function _738(a) {
            var b = $.data(a, "datagrid"),
                c = b.options;
            b.data;
            if (c.idField) return b.selectedRows;
            var d = [];
            return c.finder.getTr(a, "", "selected", 2).each(function () {
                    d.push(c.finder.getRow(a, $(this)))
                }),
            d
        }
        function _73b(a) {
            var b = $.data(a, "datagrid"),
                c = b.options;
            if (c.idField) return b.checkedRows;
            var d = [];
            return c.finder.getTr(a, "", "checked", 2).each(function () {
                    d.push(c.finder.getRow(a, $(this)))
                }),
            d
        }
        function _73e(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.dc,
                e = c.options,
                f = e.finder.getTr(a, b);
            if (f.length) {
                    if (f.closest("table").hasClass("datagrid-btable-frozen")) return;
                    var g = d.view2.children("div.datagrid-header")._outerHeight(),
                        h = d.body2,
                        i = e.scrollbarSize;
                    h[0].offsetHeight && h[0].clientHeight && h[0].offsetHeight <= h[0].clientHeight && (i = 0);
                    var j = h.outerHeight(!0) - h.outerHeight(),
                        k = f.position().top - g - j;
                    k < 0 ? h.scrollTop(h.scrollTop() + k) : k + f._outerHeight() > h.height() - i && h.scrollTop(h.scrollTop() + k + f._outerHeight() - h.height() + i)
                }
        }
        function _6c2(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options;
            d.finder.getTr(a, c.highlightIndex).removeClass("datagrid-row-over"),
            d.finder.getTr(a, b).addClass("datagrid-row-over"),
            c.highlightIndex = b
        }
        function _6c9(a, b, c, d) {
            var e = $.data(a, "datagrid"),
                f = e.options,
                g = f.finder.getRow(a, b);
            g && 0 != f.onBeforeSelect.apply(a, _649(a, [b, g])) && (f.singleSelect && (_74e(a, !0), e.selectedRows = []), !c && f.checkOnSelect && _6c6(a, b, !0), f.idField && _648(e.selectedRows, f.idField, g), f.finder.getTr(a, b).addClass("datagrid-row-selected"), f.onSelect.apply(a, _649(a, [b, g])), !d && f.scrollOnSelect && _73e(a, b))
        }
        function _6ca(a, b, c) {
            var d = $.data(a, "datagrid"),
                e = (d.dc, d.options),
                f = e.finder.getRow(a, b);
            f && 0 != e.onBeforeUnselect.apply(a, _649(a, [b, f])) && (!c && e.checkOnSelect && _6c7(a, b, !0), e.finder.getTr(a, b).removeClass("datagrid-row-selected"), e.idField && _647(d.selectedRows, e.idField, f[e.idField]), e.onUnselect.apply(a, _649(a, [b, f])))
        }
        function _753(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = d.finder.getRows(a),
                f = $.data(a, "datagrid").selectedRows;
            if (!b && d.checkOnSelect && _6b4(a, !0), d.finder.getTr(a, "", "allbody").addClass("datagrid-row-selected"), d.idField) for (var g = 0; g < e.length; g++) _648(f, d.idField, e[g]);
            d.onSelectAll.call(a, e)
        }
        function _74e(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = d.finder.getRows(a),
                f = $.data(a, "datagrid").selectedRows;
            if (!b && d.checkOnSelect && _6b5(a, !0), d.finder.getTr(a, "", "selected").removeClass("datagrid-row-selected"), d.idField) for (var g = 0; g < e.length; g++) _647(f, d.idField, e[g][d.idField]);
            d.onUnselectAll.call(a, e)
        }
        function _6c6(a, b, c) {
            var d = $.data(a, "datagrid"),
                e = d.options,
                f = e.finder.getRow(a, b);
            if (f && 0 != e.onBeforeCheck.apply(a, _649(a, [b, f]))) {
                    e.singleSelect && e.selectOnCheck && (_6b5(a, !0), d.checkedRows = []),
                    !c && e.selectOnCheck && _6c9(a, b, !0);
                    var g = e.finder.getTr(a, b).addClass("datagrid-row-checked");
                    if (g.find("div.datagrid-cell-check input[type=checkbox]")._propAttr("checked", !0), g = e.finder.getTr(a, "", "checked", 2), g.length == e.finder.getRows(a).length) {
                        var h = d.dc;
                        h.header1.add(h.header2).find("input[type=checkbox]")._propAttr("checked", !0)
                    }
                    e.idField && _648(d.checkedRows, e.idField, f),
                    e.onCheck.apply(a, _649(a, [b, f]))
                }
        }
        function _6c7(a, b, c) {
            var d = $.data(a, "datagrid"),
                e = d.options,
                f = e.finder.getRow(a, b);
            if (f && 0 != e.onBeforeUncheck.apply(a, _649(a, [b, f]))) {
                    !c && e.selectOnCheck && _6ca(a, b, !0);
                    var g = e.finder.getTr(a, b).removeClass("datagrid-row-checked");
                    g.find("div.datagrid-cell-check input[type=checkbox]")._propAttr("checked", !1);
                    var h = d.dc,
                        i = h.header1.add(h.header2);
                    i.find("input[type=checkbox]")._propAttr("checked", !1),
                    e.idField && _647(d.checkedRows, e.idField, f[e.idField]),
                    e.onUncheck.apply(a, _649(a, [b, f]))
                }
        }
        function _6b4(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = d.finder.getRows(a);
            !b && d.selectOnCheck && _753(a, !0);
            var f = c.dc,
                g = f.header1.add(f.header2).find("input[type=checkbox]"),
                h = d.finder.getTr(a, "", "allbody").addClass("datagrid-row-checked").find("div.datagrid-cell-check input[type=checkbox]");
            if (g.add(h)._propAttr("checked", !0), d.idField) for (var i = 0; i < e.length; i++) _648(c.checkedRows, d.idField, e[i]);
            d.onCheckAll.call(a, e)
        }
        function _6b5(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = d.finder.getRows(a);
            !b && d.selectOnCheck && _74e(a, !0);
            var f = c.dc,
                g = f.header1.add(f.header2).find("input[type=checkbox]"),
                h = d.finder.getTr(a, "", "checked").removeClass("datagrid-row-checked").find("div.datagrid-cell-check input[type=checkbox]");
            if (g.add(h)._propAttr("checked", !1), d.idField) for (var i = 0; i < e.length; i++) _647(c.checkedRows, d.idField, e[i][d.idField]);
            d.onUncheckAll.call(a, e)
        }
        function _76d(a, b) {
            var c = $.data(a, "datagrid").options,
                d = c.finder.getTr(a, b),
                e = c.finder.getRow(a, b);
            d.hasClass("datagrid-row-editing") || 0 != c.onBeforeEdit.apply(a, _649(a, [b, e])) && (d.addClass("datagrid-row-editing"), _770(a, b), _710(a), d.find("div.datagrid-editable").each(function () {
                    var a = $(this).parent().attr("field"),
                        b = $.data(this, "datagrid.editor");
                    b.actions.setValue(b.target, e[a])
                }), _772(a, b), c.onBeginEdit.apply(a, _649(a, [b, e])))
        }
        function _773(a, b, c) {
            var d = $.data(a, "datagrid"),
                e = d.options,
                f = d.updatedRows,
                g = d.insertedRows,
                h = e.finder.getTr(a, b),
                i = e.finder.getRow(a, b);
            if (h.hasClass("datagrid-row-editing")) {
                    if (!c) {
                        if (!_772(a, b)) return;
                        var j = !1,
                            k = {};
                        h.find("div.datagrid-editable").each(function () {
                                var a = $(this).parent().attr("field"),
                                    b = $.data(this, "datagrid.editor"),
                                    c = $(b.target),
                                    d = c.data("textbox") ? c.textbox("textbox") : c;
                                d.is(":focus") && d.triggerHandler("blur");
                                var e = b.actions.getValue(b.target);
                                i[a] !== e && (i[a] = e, j = !0, k[a] = e)
                            }),
                        j && _646(g, i) == -1 && _646(f, i) == -1 && f.push(i),
                        e.onEndEdit.apply(a, _649(a, [b, i, k]))
                    }
                    h.removeClass("datagrid-row-editing"),
                    _77f(a, b),
                    $(a).datagrid("refreshRow", b),
                    c ? e.onCancelEdit.apply(a, _649(a, [b, i])) : e.onAfterEdit.apply(a, _649(a, [b, i, k]))
                }
        }
        function _780(a, b) {
            var c = $.data(a, "datagrid").options,
                d = c.finder.getTr(a, b),
                e = [];
            return d.children("td").each(function () {
                    var a = $(this).find("div.datagrid-editable");
                    if (a.length) {
                        var b = $.data(a[0], "datagrid.editor");
                        e.push(b)
                    }
                }),
            e
        }
        function _784(a, b) {
            for (var c = _780(a, void 0 != b.index ? b.index : b.id), d = 0; d < c.length; d++) if (c[d].field == b.field) return c[d];
            return null
        }
        function _770(a, b) {
            var c = $.data(a, "datagrid").options,
                d = c.finder.getTr(a, b);
            d.children("td").each(function () {
                    var b = $(this).find("div.datagrid-cell"),
                        d = $(this).attr("field"),
                        e = _6a3(a, d);
                    if (e && e.editor) {
                            var f, g;
                            "string" == typeof e.editor ? f = e.editor : (f = e.editor.type, g = e.editor.options);
                            var h = c.editors[f];
                            if (h) {
                                var i = b.html(),
                                    j = b._outerWidth();
                                b.addClass("datagrid-editable"),
                                b._outerWidth(j),
                                b.html('<table border="0" cellspacing="0" cellpadding="1"><tr><td></td></tr></table>'),
                                b.children("table").bind("click dblclick contextmenu", function (a) {
                                        a.stopPropagation()
                                    }),
                                $.data(b[0], "datagrid.editor", {
                                        actions: h,
                                        target: h.init(b.find("td"), $.extend({
                                            height: c.editorHeight
                                        }, g)),
                                        field: d,
                                        type: f,
                                        oldHtml: i
                                    })
                            }
                        }
                }),
            _670(a, b, !0)
        }
        function _77f(a, b) {
            var c = $.data(a, "datagrid").options,
                d = c.finder.getTr(a, b);
            d.children("td").each(function () {
                    var a = $(this).find("div.datagrid-editable");
                    if (a.length) {
                        var b = $.data(a[0], "datagrid.editor");
                        b.actions.destroy && b.actions.destroy(b.target),
                        a.html(b.oldHtml),
                        $.removeData(a[0], "datagrid.editor"),
                        a.removeClass("datagrid-editable"),
                        a.css("width", "")
                    }
                })
        }
        function _772(a, b) {
            var c = $.data(a, "datagrid").options.finder.getTr(a, b);
            if (!c.hasClass("datagrid-row-editing")) return !0;
            var d = c.find(".validatebox-text");
            d.validatebox("validate"),
            d.trigger("mouseleave");
            var e = c.find(".validatebox-invalid");
            return 0 == e.length
        }
        function _795(a, b) {
            var c = $.data(a, "datagrid").insertedRows,
                d = $.data(a, "datagrid").deletedRows,
                e = $.data(a, "datagrid").updatedRows;
            if (!b) {
                    var f = [];
                    return f = f.concat(c),
                    f = f.concat(d),
                    f = f.concat(e)
                }
            return "inserted" == b ? c : "deleted" == b ? d : "updated" == b ? e : []
        }
        function _79b(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = c.data,
                f = c.insertedRows,
                g = c.deletedRows;
            $(a).datagrid("cancelEdit", b);
            var h = d.finder.getRow(a, b);
            _646(f, h) >= 0 ? _647(f, h) : g.push(h),
            _647(c.selectedRows, d.idField, h[d.idField]),
            _647(c.checkedRows, d.idField, h[d.idField]),
            d.view.deleteRow.call(d.view, a, b),
            "auto" == d.height && _670(a),
            $(a).datagrid("getPager").pagination("refresh", {
                    total: e.total
                })
        }
        function _7a1(a, b) {
            var c = $.data(a, "datagrid").data,
                d = $.data(a, "datagrid").options.view,
                e = $.data(a, "datagrid").insertedRows;
            d.insertRow.call(d, a, b.index, b.row),
            e.push(b.row),
            $(a).datagrid("getPager").pagination("refresh", {
                    total: c.total
                })
        }
        function _7a5(a, b) {
            var c = $.data(a, "datagrid").data,
                d = $.data(a, "datagrid").options.view,
                e = $.data(a, "datagrid").insertedRows;
            d.insertRow.call(d, a, null, b),
            e.push(b),
            $(a).datagrid("getPager").pagination("refresh", {
                    total: c.total
                })
        }
        function _7a8(a, b) {
            var c = $.data(a, "datagrid"),
                d = c.options,
                e = d.finder.getRow(a, b.index),
                f = !1;
            b.row = b.row || {};
            for (var g in b.row) if (e[g] !== b.row[g]) {
                    f = !0;
                    break
                }
            f && (_646(c.insertedRows, e) == -1 && _646(c.updatedRows, e) == -1 && c.updatedRows.push(e), d.view.updateRow.call(d.view, a, b.index, b.row))
        }
        function _7ae(a) {
            for (var b = $.data(a, "datagrid"), c = b.data, d = c.rows, e = [], f = 0; f < d.length; f++) e.push($.extend({}, d[f]));
            b.originalRows = e,
            b.updatedRows = [],
            b.insertedRows = [],
            b.deletedRows = []
        }
        function _7b2(a) {
            for (var b = $.data(a, "datagrid").data, c = !0, d = 0, e = b.rows.length; d < e; d++) _772(a, d) ? $(a).datagrid("endEdit", d) : c = !1;
            c && _7ae(a)
        }
        function _7b4(a) {
            function b(a) {
                for (var b = [], c = 0; c < a.length; c++) b.push(a[c][e.idField]);
                return b
            }
            function c(b, c) {
                for (var d = 0; d < b.length; d++) {
                    var e = _735(a, b[d]);
                    e >= 0 && ("s" == c ? _6c9 : _6c6)(a, e, !0)
                }
            }
            for (var d = $.data(a, "datagrid"), e = d.options, f = d.originalRows, g = d.insertedRows, h = d.deletedRows, i = d.selectedRows, j = d.checkedRows, k = d.data, l = 0; l < k.rows.length; l++) $(a).datagrid("cancelEdit", l);
            var m = b(i),
                n = b(j);
            i.splice(0, i.length),
            j.splice(0, j.length),
            k.total += h.length - g.length,
            k.rows = f,
            _6e0(a, k),
            c(m, "s"),
            c(n, "c"),
            _7ae(a)
        }
        function _6df(a, b, c) {
            var d = $.data(a, "datagrid").options;
            b && (d.queryParams = b);
            var e = $.extend({}, d.queryParams);
            if (d.pagination && $.extend(e, {
                page: d.pageNumber || 1,
                rows: d.pageSize
            }), d.sortName && $.extend(e, {
                sort: d.sortName,
                order: d.sortOrder
            }), 0 != d.onBeforeLoad.call(a, e)) {
                $(a).datagrid("loading");
                var f = d.loader.call(a, e, function (b) {
                    $(a).datagrid("loaded"),
                    $(a).datagrid("loadData", b),
                    c && c()
                }, function () {
                    $(a).datagrid("loaded"),
                    d.onLoadError.apply(a, arguments)
                });
                0 == f && $(a).datagrid("loaded")
            }
        }
        function _7c6(a, b) {
            function c(a, b) {
                for (var c = 0; c < b; c++) a.hide(),
                a = a.next()
            }
            var d = $.data(a, "datagrid").options;
            if (b.type = b.type || "body", b.rowspan = b.rowspan || 1, b.colspan = b.colspan || 1, 1 != b.rowspan || 1 != b.colspan) {
                var e = d.finder.getTr(a, void 0 != b.index ? b.index : b.id, b.type);
                if (e.length) {
                    var f = e.find('td[field="' + b.field + '"]');
                    f.attr("rowspan", b.rowspan).attr("colspan", b.colspan),
                    f.addClass("datagrid-td-merged"),
                    c(f.next(), b.colspan - 1);
                    for (var g = 1; g < b.rowspan && (e = e.next(), e.length); g++) c(e.find('td[field="' + b.field + '"]'), b.colspan);
                    _70f(a, f)
                }
            }
        }
        function _7cf(a) {
            function b(a) {
                function b(b) {
                    return void 0 != $.data($(b)[0], a)
                }
                return {
                    init: function (b, c) {
                        var d = $('<input type="text" class="datagrid-editable-input">').appendTo(b);
                        return d[a] && "text" != a ? d[a](c) : d
                    },
                    destroy: function (c) {
                        b(c, a) && $(c)[a]("destroy")
                    },
                    getValue: function (c) {
                        if (b(c, a)) {
                            var d = $(c)[a]("options");
                            return d.multiple ? $(c)[a]("getValues").join(d.separator) : $(c)[a]("getValue")
                        }
                        return $(c).val()
                    },
                    setValue: function (c, d) {
                        if (b(c, a)) {
                            var e = $(c)[a]("options");
                            e.multiple ? d ? $(c)[a]("setValues", d.split(e.separator)) : $(c)[a]("clear") : $(c)[a]("setValue", d)
                        } else $(c).val(d)
                    },
                    resize: function (c, d) {
                        b(c, a) ? $(c)[a]("resize", d) : $(c)._size({
                            width: d,
                            height: $.fn.datagrid.defaults.editorHeight
                        })
                    }
                }
            }
            var c = {};
            return $.map(a, function (a) {
                c[a] = b(a)
            }),
            c
        }
        var _645 = 0;
        $.fn.datagrid = function (a, b) {
            return "string" == typeof a ? $.fn.datagrid.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b, c = $.data(this, "datagrid");
                if (c) b = $.extend(c.options, a),
                c.options = b;
                else {
                    b = $.extend({}, $.extend({}, $.fn.datagrid.defaults, {
                        queryParams: {}
                    }), $.fn.datagrid.parseOptions(this), a),
                    $(this).css("width", "").css("height", "");
                    var d = _684(this, b.rownumbers);
                    b.columns || (b.columns = d.columns),
                    b.frozenColumns || (b.frozenColumns = d.frozenColumns),
                    b.columns = $.extend(!0, [], b.columns),
                    b.frozenColumns = $.extend(!0, [], b.frozenColumns),
                    b.view = $.extend({}, b.view),
                    $.data(this, "datagrid", {
                        options: b,
                        panel: d.panel,
                        dc: d.dc,
                        ss: null,
                        selectedRows: [],
                        checkedRows: [],
                        data: {
                            total: 0,
                            rows: []
                        },
                        originalRows: [],
                        updatedRows: [],
                        insertedRows: [],
                        deletedRows: []
                    })
                }
                if (_68d(this), _6a4(this), _65a(this), b.data) $(this).datagrid("loadData", b.data);
                else {
                    var e = $.fn.datagrid.parseData(this);
                    e.total > 0 ? $(this).datagrid("loadData", e) : (b.view.setEmptyMsg(this), $(this).datagrid("autoSizeColumn"))
                }
                _6df(this)
            }))
        };
        var _7dd = $.extend({}, _7cf(["text", "textbox", "passwordbox", "filebox", "numberbox", "numberspinner", "combobox", "combotree", "combogrid", "combotreegrid", "datebox", "datetimebox", "timespinner", "datetimespinner"]), {
            textarea: {
                init: function (a, b) {
                    var c = $('<textarea class="datagrid-editable-input"></textarea>').appendTo(a);
                    return c.css("vertical-align", "middle")._outerHeight(b.height),
                    c
                },
                getValue: function (a) {
                    return $(a).val()
                },
                setValue: function (a, b) {
                    $(a).val(b)
                },
                resize: function (a, b) {
                    $(a)._outerWidth(b)
                }
            },
            checkbox: {
                init: function (a, b) {
                    var c = $('<input type="checkbox">').appendTo(a);
                    return c.val(b.on),
                    c.attr("offval", b.off),
                    c
                },
                getValue: function (a) {
                    return $(a).is(":checked") ? $(a).val() : $(a).attr("offval")
                },
                setValue: function (a, b) {
                    var c = !1;
                    $(a).val() == b && (c = !0),
                    $(a)._propAttr("checked", c)
                }
            },
            validatebox: {
                init: function (a, b) {
                    var c = $('<input type="text" class="datagrid-editable-input">').appendTo(a);
                    return c.validatebox(b),
                    c
                },
                destroy: function (a) {
                    $(a).validatebox("destroy")
                },
                getValue: function (a) {
                    return $(a).val()
                },
                setValue: function (a, b) {
                    $(a).val(b)
                },
                resize: function (a, b) {
                    $(a)._outerWidth(b)._outerHeight($.fn.datagrid.defaults.editorHeight)
                }
            }
        });
        $.fn.datagrid.methods = {
            options: function (a) {
                var b = $.data(a[0], "datagrid").options,
                    c = $.data(a[0], "datagrid").panel.panel("options"),
                    d = $.extend(b, {
                        width: c.width,
                        height: c.height,
                        closed: c.closed,
                        collapsed: c.collapsed,
                        minimized: c.minimized,
                        maximized: c.maximized
                    });
                return d
            },
            setSelectionState: function (a) {
                return a.each(function () {
                    _72d(this)
                })
            },
            createStyleSheet: function (a) {
                return _64b(a[0])
            },
            getPanel: function (a) {
                return $.data(a[0], "datagrid").panel
            },
            getPager: function (a) {
                return $.data(a[0], "datagrid").panel.children("div.datagrid-pager")
            },
            getColumnFields: function (a, b) {
                return _6a2(a[0], b)
            },
            getColumnOption: function (a, b) {
                return _6a3(a[0], b)
            },
            resize: function (a, b) {
                return a.each(function () {
                    _65a(this, b)
                })
            },
            load: function (a, b) {
                return a.each(function () {
                    var a = $(this).datagrid("options");
                    "string" == typeof b && (a.url = b, b = null),
                    a.pageNumber = 1;
                    var c = $(this).datagrid("getPager");
                    c.pagination("refresh", {
                        pageNumber: 1
                    }),
                    _6df(this, b)
                })
            },
            reload: function (a, b) {
                return a.each(function () {
                    var a = $(this).datagrid("options");
                    "string" == typeof b && (a.url = b, b = null),
                    _6df(this, b)
                })
            },
            reloadFooter: function (a, b) {
                return a.each(function () {
                    var a = $.data(this, "datagrid").options,
                        c = $.data(this, "datagrid").dc;
                    b && ($.data(this, "datagrid").footer = b),
                    a.showFooter && (a.view.renderFooter.call(a.view, this, c.footer2, !1), a.view.renderFooter.call(a.view, this, c.footer1, !0), a.view.onAfterRender && a.view.onAfterRender.call(a.view, this), $(this).datagrid("fixRowHeight"))
                })
            },
            loading: function (a) {
                return a.each(function () {
                    var a = $.data(this, "datagrid").options;
                    if ($(this).datagrid("getPager").pagination("loading"), a.loadMsg) {
                        var b = $(this).datagrid("getPanel");
                        if (!b.children("div.datagrid-mask").length) {
                            $('<div class="datagrid-mask" style="display:block"></div>').appendTo(b);
                            var c = $('<div class="datagrid-mask-msg" style="display:block;left:50%"></div>').html(a.loadMsg).appendTo(b);
                            c._outerHeight(40),
                            c.css({
                                marginLeft: -c.outerWidth() / 2,
                                lineHeight: c.height() + "px"
                            })
                        }
                    }
                })
            },
            loaded: function (a) {
                return a.each(function () {
                    $(this).datagrid("getPager").pagination("loaded");
                    var a = $(this).datagrid("getPanel");
                    a.children("div.datagrid-mask-msg").remove(),
                    a.children("div.datagrid-mask").remove()
                })
            },
            fitColumns: function (a) {
                return a.each(function () {
                    _6ec(this)
                })
            },
            fixColumnSize: function (a, b) {
                return a.each(function () {
                    _70a(this, b)
                })
            },
            fixRowHeight: function (a, b) {
                return a.each(function () {
                    _670(this, b)
                })
            },
            freezeRow: function (a, b) {
                return a.each(function () {
                    _67d(this, b)
                })
            },
            autoSizeColumn: function (a, b) {
                return a.each(function () {
                    _6fe(this, b)
                })
            },
            loadData: function (a, b) {
                return a.each(function () {
                    _6e0(this, b),
                    _7ae(this)
                })
            },
            getData: function (a) {
                return $.data(a[0], "datagrid").data
            },
            getRows: function (a) {
                return $.data(a[0], "datagrid").data.rows
            },
            getFooterRows: function (a) {
                return $.data(a[0], "datagrid").footer
            },
            getRowIndex: function (a, b) {
                return _735(a[0], b)
            },
            getChecked: function (a) {
                return _73b(a[0])
            },
            getSelected: function (a) {
                var b = _738(a[0]);
                return b.length > 0 ? b[0] : null
            },
            getSelections: function (a) {
                return _738(a[0])
            },
            clearSelections: function (a) {
                return a.each(function () {
                    var a = $.data(this, "datagrid"),
                        b = a.selectedRows,
                        c = a.checkedRows;
                    b.splice(0, b.length),
                    _74e(this),
                    a.options.checkOnSelect && c.splice(0, c.length)
                })
            },
            clearChecked: function (a) {
                return a.each(function () {
                    var a = $.data(this, "datagrid"),
                        b = a.selectedRows,
                        c = a.checkedRows;
                    c.splice(0, c.length),
                    _6b5(this),
                    a.options.selectOnCheck && b.splice(0, b.length)
                })
            },
            scrollTo: function (a, b) {
                return a.each(function () {
                    _73e(this, b)
                })
            },
            highlightRow: function (a, b) {
                return a.each(function () {
                    _6c2(this, b),
                    _73e(this, b)
                })
            },
            selectAll: function (a) {
                return a.each(function () {
                    _753(this)
                })
            },
            unselectAll: function (a) {
                return a.each(function () {
                    _74e(this)
                })
            },
            selectRow: function (a, b) {
                return a.each(function () {
                    _6c9(this, b)
                })
            },
            selectRecord: function (a, b) {
                return a.each(function () {
                    var a = $.data(this, "datagrid").options;
                    if (a.idField) {
                        var c = _735(this, b);
                        c >= 0 && $(this).datagrid("selectRow", c)
                    }
                })
            },
            unselectRow: function (a, b) {
                return a.each(function () {
                    _6ca(this, b)
                })
            },
            checkRow: function (a, b) {
                return a.each(function () {
                    _6c6(this, b)
                })
            },
            uncheckRow: function (a, b) {
                return a.each(function () {
                    _6c7(this, b)
                })
            },
            checkAll: function (a) {
                return a.each(function () {
                    _6b4(this)
                })
            },
            uncheckAll: function (a) {
                return a.each(function () {
                    _6b5(this)
                })
            },
            beginEdit: function (a, b) {
                return a.each(function () {
                    _76d(this, b)
                })
            },
            endEdit: function (a, b) {
                return a.each(function () {
                    _773(this, b, !1)
                })
            },
            cancelEdit: function (a, b) {
                return a.each(function () {
                    _773(this, b, !0)
                })
            },
            getEditors: function (a, b) {
                return _780(a[0], b)
            },
            getEditor: function (a, b) {
                return _784(a[0], b)
            },
            refreshRow: function (a, b) {
                return a.each(function () {
                    var a = $.data(this, "datagrid").options;
                    a.view.refreshRow.call(a.view, this, b)
                })
            },
            validateRow: function (a, b) {
                return _772(a[0], b)
            },
            updateRow: function (a, b) {
                return a.each(function () {
                    _7a8(this, b)
                })
            },
            appendRow: function (a, b) {
                return a.each(function () {
                    _7a5(this, b)
                })
            },
            insertRow: function (a, b) {
                return a.each(function () {
                    _7a1(this, b)
                })
            },
            deleteRow: function (a, b) {
                return a.each(function () {
                    _79b(this, b)
                })
            },
            getChanges: function (a, b) {
                return _795(a[0], b)
            },
            acceptChanges: function (a) {
                return a.each(function () {
                    _7b2(this)
                })
            },
            rejectChanges: function (a) {
                return a.each(function () {
                    _7b4(this)
                })
            },
            mergeCells: function (a, b) {
                return a.each(function () {
                    _7c6(this, b)
                })
            },
            showColumn: function (a, b) {
                return a.each(function () {
                    var a = $(this).datagrid("getColumnOption", b);
                    a.hidden && (a.hidden = !1, $(this).datagrid("getPanel").find('td[field="' + b + '"]').show(), _6e1(this, b, 1), $(this).datagrid("fitColumns"))
                })
            },
            hideColumn: function (a, b) {
                return a.each(function () {
                    var a = $(this).datagrid("getColumnOption", b);
                    a.hidden || (a.hidden = !0, $(this).datagrid("getPanel").find('td[field="' + b + '"]').hide(), _6e1(this, b, -1), $(this).datagrid("fitColumns"))
                })
            },
            sort: function (a, b) {
                return a.each(function () {
                    _6b6(this, b)
                })
            },
            gotoPage: function (a, b) {
                return a.each(function () {
                    var a, c, d = this;
                    "object" == typeof b ? (a = b.page, c = b.callback) : a = b,
                    $(d).datagrid("options").pageNumber = a,
                    $(d).datagrid("getPager").pagination("refresh", {
                        pageNumber: a
                    }),
                    _6df(d, null, function () {
                        c && c.call(d, a)
                    })
                })
            }
        },
        $.fn.datagrid.parseOptions = function (_823) {
            var t = $(_823);
            return $.extend({}, $.fn.panel.parseOptions(_823), $.parser.parseOptions(_823, ["url", "toolbar", "idField", "sortName", "sortOrder", "pagePosition", "resizeHandle", {
                sharedStyleSheet: "boolean",
                fitColumns: "boolean",
                autoRowHeight: "boolean",
                striped: "boolean",
                nowrap: "boolean"
            },
            {
                rownumbers: "boolean",
                singleSelect: "boolean",
                ctrlSelect: "boolean",
                checkOnSelect: "boolean",
                selectOnCheck: "boolean"
            },
            {
                pagination: "boolean",
                pageSize: "number",
                pageNumber: "number"
            },
            {
                multiSort: "boolean",
                remoteSort: "boolean",
                showHeader: "boolean",
                showFooter: "boolean"
            },
            {
                scrollbarSize: "number",
                scrollOnSelect: "boolean"
            }]), {
                pageList: t.attr("pageList") ? eval(t.attr("pageList")) : void 0,
                loadMsg: void 0 != t.attr("loadMsg") ? t.attr("loadMsg") : void 0,
                rowStyler: t.attr("rowStyler") ? eval(t.attr("rowStyler")) : void 0
            })
        },
        $.fn.datagrid.parseData = function (a) {
            var b = $(a),
                c = {
                    total: 0,
                    rows: []
                },
                d = b.datagrid("getColumnFields", !0).concat(b.datagrid("getColumnFields", !1));
            return b.find("tbody tr").each(function () {
                    c.total++;
                    var a = {};
                    $.extend(a, $.parser.parseOptions(this, ["iconCls", "state"]));
                    for (var b = 0; b < d.length; b++) a[d[b]] = $(this).find("td:eq(" + b + ")").html();
                    c.rows.push(a)
                }),
            c
        };
        var _826 = {
            render: function (a, b, c) {
                var d = $(a).datagrid("getRows");
                $(b).html(this.renderTable(a, 0, d, c))
            },
            renderFooter: function (a, b, c) {
                for (var d = ($.data(a, "datagrid").options, $.data(a, "datagrid").footer || []), e = $(a).datagrid("getColumnFields", c), f = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'], g = 0; g < d.length; g++) f.push('<tr class="datagrid-row" datagrid-row-index="' + g + '">'),
                f.push(this.renderRow.call(this, a, e, c, g, d[g])),
                f.push("</tr>");
                f.push("</tbody></table>"),
                $(b).html(f.join(""))
            },
            renderTable: function (a, b, c, d) {
                var e = $.data(a, "datagrid"),
                    f = e.options;
                if (c == undefined || (d && !(f.rownumbers || f.frozenColumns && f.frozenColumns.length))) return "";
                for (var g = $(a).datagrid("getColumnFields", d), h = ['<table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody>'], i = 0; i < c.length; i++) {
                        var j = c[i],
                            k = f.rowStyler ? f.rowStyler.call(a, b, j) : "",
                            l = this.getStyleValue(k),
                            m = 'class="datagrid-row ' + (b % 2 && f.striped ? "datagrid-row-alt " : " ") + l.c + '"',
                            n = l.s ? 'style="' + l.s + '"' : "",
                            o = e.rowIdPrefix + "-" + (d ? 1 : 2) + "-" + b;
                        h.push('<tr id="' + o + '" datagrid-row-index="' + b + '" ' + m + " " + n + ">"),
                        h.push(this.renderRow.call(this, a, g, d, b, j)),
                        h.push("</tr>"),
                        b++
                    }
                return h.push("</tbody></table>"),
                h.join("")
            },
            renderRow: function (a, b, c, d, e) {
                var f = $.data(a, "datagrid").options,
                    g = [];
                if (c && f.rownumbers) {
                        var h = d + 1;
                        f.pagination && (h += (f.pageNumber - 1) * f.pageSize),
                        g.push('<td class="datagrid-td-rownumber"><div class="datagrid-cell-rownumber">' + h + "</div></td>")
                    }
                for (var i = 0; i < b.length; i++) {
                        var j = b[i],
                            k = $(a).datagrid("getColumnOption", j);
                        if (k) {
                                var l = e[j],
                                    m = k.styler ? k.styler.call(a, l, e, d) || "" : "",
                                    n = this.getStyleValue(m),
                                    o = n.c ? 'class="' + n.c + '"' : "",
                                    p = k.hidden ? 'style="display:none;' + n.s + '"' : n.s ? 'style="' + n.s + '"' : "";
                                g.push('<td field="' + j + '" ' + o + " " + p + ">");
                                var p = "";
                                k.checkbox || (k.align && (p += "text-align:" + k.align + ";"), f.nowrap ? f.autoRowHeight && (p += "height:auto;") : p += "white-space:normal;height:auto;"),
                                g.push('<div style="' + p + '" '),
                                g.push(k.checkbox ? 'class="datagrid-cell-check"' : 'class="datagrid-cell ' + k.cellClass + '"'),
                                g.push(">"),
                                k.checkbox ? (g.push('<input type="checkbox" ' + (e.checked ? 'checked="checked"' : "")), g.push(' name="' + j + '" value="' + (void 0 != l ? l : "") + '">')) : k.formatter ? g.push(k.formatter(l, e, d)) : g.push(l),
                                g.push("</div>"),
                                g.push("</td>")
                            }
                    }
                return g.join("")
            },
            getStyleValue: function (a) {
                var b = "",
                    c = "";
                return "string" == typeof a ? c = a : a && (b = a.class || "", c = a.style || ""),
                {
                        c: b,
                        s: c
                    }
            },
            refreshRow: function (a, b) {
                this.updateRow.call(this, a, b, {})
            },
            updateRow: function (a, b, c) {
                function d(b) {
                    var c = f.rowStyler ? f.rowStyler.call(a, b, g) : "";
                    return this.getStyleValue(c)
                }
                function e(c) {
                    var d = f.finder.getTr(a, b, "body", c ? 1 : 2);
                    if (d.length) {
                        var e = $(a).datagrid("getColumnFields", c),
                            h = d.find("div.datagrid-cell-check input[type=checkbox]").is(":checked");
                        d.html(this.renderRow.call(this, a, e, c, b, g));
                        var k = (d.hasClass("datagrid-row-checked") ? " datagrid-row-checked" : "") + (d.hasClass("datagrid-row-selected") ? " datagrid-row-selected" : "");
                        d.attr("style", i).attr("class", j + k),
                        h && d.find("div.datagrid-cell-check input[type=checkbox]")._propAttr("checked", !0)
                    }
                }
                var f = $.data(a, "datagrid").options,
                    g = f.finder.getRow(a, b);
                $.extend(g, c);
                var h = d.call(this, b),
                    i = h.s,
                    j = "datagrid-row " + (b % 2 && f.striped ? "datagrid-row-alt " : " ") + h.c;
                e.call(this, !0),
                e.call(this, !1),
                $(a).datagrid("fixRowHeight", b)
            },
            insertRow: function (a, b, c) {
                function d(c) {
                    for (var d = c ? 1 : 2, e = i.rows.length - 1; e >= b; e--) {
                        var h = g.finder.getTr(a, e, "body", d);
                        if (h.attr("datagrid-row-index", e + 1), h.attr("id", f.rowIdPrefix + "-" + d + "-" + (e + 1)), c && g.rownumbers) {
                            var j = e + 2;
                            g.pagination && (j += (g.pageNumber - 1) * g.pageSize),
                            h.find("div.datagrid-cell-rownumber").html(j)
                        }
                        g.striped && h.removeClass("datagrid-row-alt").addClass((e + 1) % 2 ? "datagrid-row-alt" : "")
                    }
                }
                function e(c) {
                    var d = c ? 1 : 2,
                        e = ($(a).datagrid("getColumnFields", c), f.rowIdPrefix + "-" + d + "-" + b),
                        j = '<tr id="' + e + '" class="datagrid-row" datagrid-row-index="' + b + '"></tr>';
                    if (b >= i.rows.length) if (i.rows.length) g.finder.getTr(a, "", "last", d).after(j);
                    else {
                            var k = c ? h.body1 : h.body2;
                            k.html('<table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody>' + j + "</tbody></table>")
                        } else g.finder.getTr(a, b + 1, "body", d).before(j)
                }
                var f = $.data(a, "datagrid"),
                    g = f.options,
                    h = f.dc,
                    i = f.data;
                void 0 != b && null != b || (b = i.rows.length),
                b > i.rows.length && (b = i.rows.length),
                d.call(this, !0),
                d.call(this, !1),
                e.call(this, !0),
                e.call(this, !1),
                i.total += 1,
                i.rows.splice(b, 0, c),
                this.setEmptyMsg(a),
                this.refreshRow.call(this, a, b)
            },
            deleteRow: function (a, b) {
                function c(c) {
                    for (var g = c ? 1 : 2, h = b + 1; h < f.rows.length; h++) {
                        var i = e.finder.getTr(a, h, "body", g);
                        if (i.attr("datagrid-row-index", h - 1), i.attr("id", d.rowIdPrefix + "-" + g + "-" + (h - 1)), c && e.rownumbers) {
                            var j = h;
                            e.pagination && (j += (e.pageNumber - 1) * e.pageSize),
                            i.find("div.datagrid-cell-rownumber").html(j)
                        }
                        e.striped && i.removeClass("datagrid-row-alt").addClass((h - 1) % 2 ? "datagrid-row-alt" : "")
                    }
                }
                var d = $.data(a, "datagrid"),
                    e = d.options,
                    f = d.data;
                e.finder.getTr(a, b).remove(),
                c.call(this, !0),
                c.call(this, !1),
                f.total -= 1,
                f.rows.splice(b, 1),
                this.setEmptyMsg(a)
            },
            onBeforeRender: function (a, b) {},
            onAfterRender: function (a) {
                var b = $.data(a, "datagrid"),
                    c = b.options;
                if (c.showFooter) {
                        var d = $(a).datagrid("getPanel").find("div.datagrid-footer");
                        d.find("div.datagrid-cell-rownumber,div.datagrid-cell-check").css("visibility", "hidden")
                    }
                this.setEmptyMsg(a)
            },
            setEmptyMsg: function (a) {
            
                var b = $.data(a, "datagrid"),
                    c = b.options;
                    
               if(c.finder.getRows(a) == undefined) return;
                    
                var d = 0 == c.finder.getRows(a).length;
                    
            
                if (d && this.renderEmptyRow(a), c.emptyMsg && (b.dc.view.children(".datagrid-empty").remove(), d)) {
                        var e = b.dc.header2.parent().outerHeight(),
                            f = $('<div class="datagrid-empty"></div>').appendTo(b.dc.view);
                        f.html(c.emptyMsg).css("top", e + "px")
                    }
            },
            renderEmptyRow: function (a) {
                var b = $.map($(a).datagrid("getColumnFields"), function (b) {
                    return $(a).datagrid("getColumnOption", b)
                });
                $.map(b, function (a) {
                    a.formatter1 = a.formatter,
                    a.styler1 = a.styler,
                    a.formatter = a.styler = void 0
                });
                var c = $.data(a, "datagrid").dc.body2;
                c.html(this.renderTable(a, 0, [{}], !1)),
                c.find("tbody *").css({
                    height: 1,
                    borderColor: "transparent",
                    background: "transparent"
                });
                var d = c.find(".datagrid-row");
                d.removeClass("datagrid-row").removeAttr("datagrid-row-index"),
                d.find(".datagrid-cell,.datagrid-cell-check").empty(),
                $.map(b, function (a) {
                    a.formatter = a.formatter1,
                    a.styler = a.styler1,
                    a.formatter1 = a.styler1 = void 0
                })
            }
        };
        $.fn.datagrid.defaults = $.extend({}, $.fn.panel.defaults, {
            sharedStyleSheet: !1,
            frozenColumns: void 0,
            columns: void 0,
            fitColumns: !1,
            resizeHandle: "right",
            autoRowHeight: !0,
            toolbar: null,
            striped: !1,
            method: "post",
            nowrap: !0,
            idField: null,
            url: null,
            data: null,
            loadMsg: "Processing, please wait ...",
            emptyMsg: "",
            rownumbers: !1,
            singleSelect: !1,
            ctrlSelect: !1,
            selectOnCheck: !0,
            checkOnSelect: !0,
            pagination: !1,
            pagePosition: "bottom",
            pageNumber: 1,
            pageSize: 10,
            pageList: [10, 20, 30, 40, 50],
            queryParams: {},
            sortName: null,
            sortOrder: "asc",
            multiSort: !1,
            remoteSort: !0,
            showHeader: !0,
            showFooter: !1,
            scrollOnSelect: !0,
            scrollbarSize: 18,
            rownumberWidth: 30,
            editorHeight: 24,
            headerEvents: {
                mouseover: _6ae(!0),
                mouseout: _6ae(!1),
                click: _6b2,
                dblclick: _6b7,
                contextmenu: _6ba
            },
            rowEvents: {
                mouseover: _6bc(!0),
                mouseout: _6bc(!1),
                click: _6c3,
                dblclick: _6cd,
                contextmenu: _6d1
            },
            rowStyler: function (a, b) {},
            loader: function (a, b, c) {
                var d = $(this).datagrid("options");
                return !!d.url && void $.ajax({
                    type: d.method,
                    url: d.url,
                    data: a,
                    dataType: "json",
                    success: function (a) {
                        b(a)
                    },
                    error: function () {
                        c.apply(this, arguments)
                    }
                })
            },
            loadFilter: function (a) {
                return a
            },
            editors: _7dd,
            finder: {
                getTr: function (a, b, c, d) {
                    c = c || "body",
                    d = d || 0;
                    var e = $.data(a, "datagrid"),
                        f = e.dc,
                        g = e.options;
                    if (0 == d) {
                            var h = g.finder.getTr(a, b, c, 1),
                                i = g.finder.getTr(a, b, c, 2);
                            return h.add(i)
                        }
                    if ("body" == c) {
                            var j = $("#" + e.rowIdPrefix + "-" + d + "-" + b);
                            return j.length || (j = (1 == d ? f.body1 : f.body2).find(">table>tbody>tr[datagrid-row-index=" + b + "]")),
                            j
                        }
                    return "footer" == c ? (1 == d ? f.footer1 : f.footer2).find(">table>tbody>tr[datagrid-row-index=" + b + "]") : "selected" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr.datagrid-row-selected") : "highlight" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr.datagrid-row-over") : "checked" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr.datagrid-row-checked") : "editing" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr.datagrid-row-editing") : "last" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr[datagrid-row-index]:last") : "allbody" == c ? (1 == d ? f.body1 : f.body2).find(">table>tbody>tr[datagrid-row-index]") : "allfooter" == c ? (1 == d ? f.footer1 : f.footer2).find(">table>tbody>tr[datagrid-row-index]") : void 0
                },
                getRow: function (a, b) {
                    var c = "object" == typeof b ? b.attr("datagrid-row-index") : b;
                    return $.data(a, "datagrid").data.rows[parseInt(c)]
                },
                getRows: function (a) {
                    return $(a).datagrid("getRows")
                }
            },
            view: _826,
            onBeforeLoad: function (a) {},
            onLoadSuccess: function () {},
            onLoadError: function () {},
            onClickRow: function (a, b) {},
            onDblClickRow: function (a, b) {},
            onClickCell: function (a, b, c) {},
            onDblClickCell: function (a, b, c) {},
            onBeforeSortColumn: function (a, b) {},
            onSortColumn: function (a, b) {},
            onResizeColumn: function (a, b) {},
            onBeforeSelect: function (a, b) {},
            onSelect: function (a, b) {},
            onBeforeUnselect: function (a, b) {},
            onUnselect: function (a, b) {},
            onSelectAll: function (a) {},
            onUnselectAll: function (a) {},
            onBeforeCheck: function (a, b) {},
            onCheck: function (a, b) {},
            onBeforeUncheck: function (a, b) {},
            onUncheck: function (a, b) {},
            onCheckAll: function (a) {},
            onUncheckAll: function (a) {},
            onBeforeEdit: function (a, b) {},
            onBeginEdit: function (a, b) {},
            onEndEdit: function (a, b, c) {},
            onAfterEdit: function (a, b, c) {},
            onCancelEdit: function (a, b) {},
            onHeaderContextMenu: function (a, b) {},
            onRowContextMenu: function (a, b, c) {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            var e = (a.data(b, "propertygrid"), a.data(b, "propertygrid").options);
            a(b).datagrid(a.extend({}, e, {
                cls: "propertygrid",
                view: e.showGroup ? e.groupView : e.view,
                onBeforeEdit: function (c, d) {
                    if (0 == e.onBeforeEdit.call(b, c, d)) return !1;
                    var f = a(this),
                        d = f.datagrid("getRows")[c],
                        g = f.datagrid("getColumnOption", "value");
                    g.editor = d.editor
                },
                onClickCell: function (f, g, h) {
                    if (d != this && (c(d), d = this), e.editIndex != f) {
                        c(d),
                        a(this).datagrid("beginEdit", f);
                        var i = a(this).datagrid("getEditor", {
                            index: f,
                            field: g
                        });
                        if (i || (i = a(this).datagrid("getEditor", {
                            index: f,
                            field: "value"
                        })), i) {
                            var j = a(i.target),
                                k = j.data("textbox") ? j.textbox("textbox") : j;
                            k.focus(),
                            e.editIndex = f
                        }
                    }
                    e.onClickCell.call(b, f, g, h)
                },
                loadFilter: function (a) {
                    return c(this),
                    e.loadFilter.call(this, a)
                }
            }))
        }
        function c(b) {
            var c = a(b);
            if (c.length) {
                var d = a.data(b, "propertygrid").options;
                d.finder.getTr(b, null, "editing").each(function () {
                    var b = parseInt(a(this).attr("datagrid-row-index"));
                    c.datagrid("validateRow", b) ? c.datagrid("endEdit", b) : c.datagrid("cancelEdit", b)
                }),
                d.editIndex = void 0
            }
        }
        var d;
        a(document).unbind(".propertygrid").bind("mousedown.propertygrid", function (b) {
            var e = a(b.target).closest("div.datagrid-view,div.combo-panel");
            e.length || (c(d), d = void 0)
        }),
        a.fn.propertygrid = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.propertygrid.methods[c];
                return e ? e(this, d) : this.datagrid(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "propertygrid");
                if (d) a.extend(d.options, c);
                else {
                    var e = a.extend({}, a.fn.propertygrid.defaults, a.fn.propertygrid.parseOptions(this), c);
                    e.frozenColumns = a.extend(!0, [], e.frozenColumns),
                    e.columns = a.extend(!0, [], e.columns),
                    a.data(this, "propertygrid", {
                        options: e
                    })
                }
                b(this)
            })
        },
        a.fn.propertygrid.methods = {
            options: function (b) {
                return a.data(b[0], "propertygrid").options
            }
        },
        a.fn.propertygrid.parseOptions = function (b) {
            return a.extend({}, a.fn.datagrid.parseOptions(b), a.parser.parseOptions(b, [{
                showGroup: "boolean"
            }]))
        };
        var e = a.extend({}, a.fn.datagrid.defaults.view, {
            render: function (b, c, d) {
                for (var e = [], f = this.groups, g = 0; g < f.length; g++) e.push(this.renderGroup.call(this, b, g, f[g], d));
                a(c).html(e.join(""))
            },
            renderGroup: function (b, c, d, e) {
                var f = a.data(b, "datagrid"),
                    g = f.options,
                    h = a(b).datagrid("getColumnFields", e),
                    i = [];
                i.push('<div class="datagrid-group" group-index=' + c + ">"),
                (e && (g.rownumbers || g.frozenColumns.length) || !e && !g.rownumbers && !g.frozenColumns.length) && (i.push('<span class="datagrid-group-expander">'), i.push('<span class="datagrid-row-expander datagrid-row-collapse">&nbsp;</span>'), i.push("</span>")),
                e || (i.push('<span class="datagrid-group-title">'), i.push(g.groupFormatter.call(b, d.value, d.rows)), i.push("</span>")),
                i.push("</div>"),
                i.push('<table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody>');
                for (var j = d.startIndex, k = 0; k < d.rows.length; k++) {
                        var l = g.rowStyler ? g.rowStyler.call(b, j, d.rows[k]) : "",
                            m = "",
                            n = "";
                        "string" == typeof l ? n = l : l && (m = l.class || "", n = l.style || "");
                        var o = 'class="datagrid-row ' + (j % 2 && g.striped ? "datagrid-row-alt " : " ") + m + '"',
                            p = n ? 'style="' + n + '"' : "",
                            q = f.rowIdPrefix + "-" + (e ? 1 : 2) + "-" + j;
                        i.push('<tr id="' + q + '" datagrid-row-index="' + j + '" ' + o + " " + p + ">"),
                        i.push(this.renderRow.call(this, b, h, e, j, d.rows[k])),
                        i.push("</tr>"),
                        j++
                    }
                return i.push("</tbody></table>"),
                i.join("")
            },
            bindEvents: function (b) {
                var c = a.data(b, "datagrid"),
                    d = c.dc,
                    e = d.body1.add(d.body2),
                    f = (a.data(e[0], "events") || a._data(e[0], "events")).click[0].handler;
                e.unbind("click").bind("click", function (c) {
                        var d = a(c.target),
                            e = d.closest("span.datagrid-row-expander");
                        if (e.length) {
                                var g = e.closest("div.datagrid-group").attr("group-index");
                                e.hasClass("datagrid-row-collapse") ? a(b).datagrid("collapseGroup", g) : a(b).datagrid("expandGroup", g)
                            } else f(c);
                        c.stopPropagation()
                    })
            },
            onBeforeRender: function (b, c) {
                function d(a) {
                    for (var b = 0; b < h.length; b++) {
                        var c = h[b];
                        if (c.value == a) return c
                    }
                    return null
                }
                function e() {
                    a("#datagrid-group-style").length || a("head").append('<style id="datagrid-group-style">.datagrid-group{height:' + g.groupHeight + "px;overflow:hidden;font-weight:bold;border-bottom:1px solid #ccc;}.datagrid-group-title,.datagrid-group-expander{display:inline-block;vertical-align:bottom;height:100%;line-height:" + g.groupHeight + "px;padding:0 4px;}.datagrid-group-expander{width:" + g.expanderWidth + "px;text-align:center;padding:0}.datagrid-row-expander{margin:" + Math.floor((g.groupHeight - 16) / 2) + "px 0;display:inline-block;width:16px;height:16px;cursor:pointer}</style>")
                }
                var f = a.data(b, "datagrid"),
                    g = f.options;
                e();
                for (var h = [], i = 0; i < c.length; i++) {
                        var j = c[i],
                            k = d(j[g.groupField]);
                        k ? k.rows.push(j) : (k = {
                                value: j[g.groupField],
                                rows: [j]
                            }, h.push(k))
                    }
                for (var l = 0, m = [], i = 0; i < h.length; i++) {
                        var k = h[i];
                        k.startIndex = l,
                        l += k.rows.length,
                        m = m.concat(k.rows)
                    }
                f.data.rows = m,
                this.groups = h;
                var n = this;
                setTimeout(function () {
                        n.bindEvents(b)
                    }, 0)
            }
        });
        a.extend(a.fn.datagrid.methods, {
            groups: function (a) {
                return a.datagrid("options").view.groups
            },
            expandGroup: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "datagrid").dc.view,
                        d = b.find(void 0 != c ? 'div.datagrid-group[group-index="' + c + '"]' : "div.datagrid-group"),
                        e = d.find("span.datagrid-row-expander");
                    e.hasClass("datagrid-row-expand") && (e.removeClass("datagrid-row-expand").addClass("datagrid-row-collapse"), d.next("table").show()),
                    a(this).datagrid("fixRowHeight")
                })
            },
            collapseGroup: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "datagrid").dc.view,
                        d = b.find(void 0 != c ? 'div.datagrid-group[group-index="' + c + '"]' : "div.datagrid-group"),
                        e = d.find("span.datagrid-row-expander");
                    e.hasClass("datagrid-row-collapse") && (e.removeClass("datagrid-row-collapse").addClass("datagrid-row-expand"), d.next("table").hide()),
                    a(this).datagrid("fixRowHeight")
                })
            }
        }),
        a.extend(e, {
            refreshGroupTitle: function (b, c) {
                var d = a.data(b, "datagrid"),
                    e = d.options,
                    f = d.dc,
                    g = this.groups[c],
                    h = f.body2.children("div.datagrid-group[group-index=" + c + "]").find("span.datagrid-group-title");
                h.html(e.groupFormatter.call(b, g.value, g.rows))
            },
            insertRow: function (b, c, d) {
                function e(a, c) {
                    var d = c ? 1 : 2,
                        e = h.finder.getTr(b, a - 1, "body", d),
                        f = h.finder.getTr(b, a, "body", d);
                    f.insertAfter(e)
                }
                var f, g = a.data(b, "datagrid"),
                    h = g.options,
                    i = g.dc,
                    j = null;
                if (!g.data.rows.length) return void a(b).datagrid("loadData", [d]);
                for (var k = 0; k < this.groups.length; k++) if (this.groups[k].value == d[h.groupField]) {
                        j = this.groups[k],
                        f = k;
                        break
                    }
                j ? (void 0 != c && null != c || (c = g.data.rows.length), c < j.startIndex ? c = j.startIndex : c > j.startIndex + j.rows.length && (c = j.startIndex + j.rows.length), a.fn.datagrid.defaults.view.insertRow.call(this, b, c, d), c >= j.startIndex + j.rows.length && (e(c, !0), e(c, !1)), j.rows.splice(c - j.startIndex, 0, d)) : (j = {
                        value: d[h.groupField],
                        rows: [d],
                        startIndex: g.data.rows.length
                    }, f = this.groups.length, i.body1.append(this.renderGroup.call(this, b, f, j, !0)), i.body2.append(this.renderGroup.call(this, b, f, j, !1)), this.groups.push(j), g.data.rows.push(d)),
                this.refreshGroupTitle(b, f)
            },
            updateRow: function (b, c, d) {
                var e = a.data(b, "datagrid").options;
                a.fn.datagrid.defaults.view.updateRow.call(this, b, c, d);
                var f = e.finder.getTr(b, c, "body", 2).closest("table.datagrid-btable"),
                    g = parseInt(f.prev().attr("group-index"));
                this.refreshGroupTitle(b, g)
            },
            deleteRow: function (b, c) {
                var d = a.data(b, "datagrid"),
                    e = d.options,
                    f = d.dc,
                    g = f.body1.add(f.body2),
                    h = e.finder.getTr(b, c, "body", 2).closest("table.datagrid-btable"),
                    i = parseInt(h.prev().attr("group-index"));
                a.fn.datagrid.defaults.view.deleteRow.call(this, b, c);
                var j = this.groups[i];
                if (j.rows.length > 1) j.rows.splice(c - j.startIndex, 1),
                this.refreshGroupTitle(b, i);
                else {
                        g.children("div.datagrid-group[group-index=" + i + "]").remove();
                        for (var k = i + 1; k < this.groups.length; k++) g.children("div.datagrid-group[group-index=" + k + "]").attr("group-index", k - 1);
                        this.groups.splice(i, 1)
                    }
                for (var c = 0, k = 0; k < this.groups.length; k++) {
                        var j = this.groups[k];
                        j.startIndex = c,
                        c += j.rows.length
                    }
            }
        }),
        a.fn.propertygrid.defaults = a.extend({}, a.fn.datagrid.defaults, {
            groupHeight: 21,
            expanderWidth: 16,
            singleSelect: !0,
            remoteSort: !1,
            fitColumns: !0,
            loadMsg: "",
            frozenColumns: [
                [{
                    field: "f",
                    width: 16,
                    resizable: !1
                }]
            ],
            columns: [
                [{
                    field: "name",
                    title: "Name",
                    width: 100,
                    sortable: !0
                },
                {
                    field: "value",
                    title: "Value",
                    width: 100,
                    resizable: !1
                }]
            ],
            showGroup: !1,
            groupView: e,
            groupField: "group",
            groupFormatter: function (a, b) {
                return a
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var d = a.data(b, "treegrid"),
                e = d.options;
            a(b).datagrid(a.extend({}, e, {
                    url: null,
                    data: null,
                    loader: function () {
                        return !1
                    },
                    onBeforeLoad: function () {
                        return !1
                    },
                    onLoadSuccess: function () {},
                    onResizeColumn: function (a, d) {
                        c(b),
                        e.onResizeColumn.call(b, a, d)
                    },
                    onBeforeSortColumn: function (a, c) {
                        if (0 == e.onBeforeSortColumn.call(b, a, c)) return !1
                    },
                    onSortColumn: function (c, d) {
                        if (e.sortName = c, e.sortOrder = d, e.remoteSort) p(b);
                        else {
                            var f = a(b).treegrid("getData");
                            o(b, null, f)
                        }
                        e.onSortColumn.call(b, c, d)
                    },
                    onClickCell: function (a, c) {
                        e.onClickCell.call(b, c, v(b, a))
                    },
                    onDblClickCell: function (a, c) {
                        e.onDblClickCell.call(b, c, v(b, a))
                    },
                    onRowContextMenu: function (a, c) {
                        e.onContextMenu.call(b, a, v(b, c))
                    }
                }));
            var f = a.data(b, "datagrid").options;
            if (e.columns = f.columns, e.frozenColumns = f.frozenColumns, d.dc = a.data(b, "datagrid").dc, e.pagination) {
                    var g = a(b).datagrid("getPager");
                    g.pagination({
                        pageNumber: e.pageNumber,
                        pageSize: e.pageSize,
                        pageList: e.pageList,
                        onSelectPage: function (a, c) {
                            e.pageNumber = a,
                            e.pageSize = c,
                            p(b)
                        }
                    }),
                    e.pageSize = g.pagination("options").pageSize
                }
        }
        function c(b, c) {
            function d(a) {
                var c = e.finder.getTr(b, a, "body", 1),
                    d = e.finder.getTr(b, a, "body", 2);
                c.css("height", ""),
                d.css("height", "");
                var f = Math.max(c.height(), d.height());
                c.css("height", f),
                d.css("height", f)
            }
            var e = a.data(b, "datagrid").options,
                f = a.data(b, "datagrid").dc;
            if (!f.body1.is(":empty") && (!e.nowrap || e.autoRowHeight) && void 0 != c) for (var g = t(b, c), h = 0; h < g.length; h++) d(g[h][e.idField]);
            a(b).datagrid("fixRowHeight", c)
        }
        function d(b) {
            var c = a.data(b, "datagrid").dc,
                d = a.data(b, "treegrid").options;
            d.rownumbers && c.body1.find("div.datagrid-cell-rownumber").each(function (b) {
                    a(this).html(b + 1)
                })
        }
        function e(b) {
            return function (c) {
                a.fn.datagrid.defaults.rowEvents[b ? "mouseover" : "mouseout"](c);
                var d = a(c.target),
                    e = b ? "addClass" : "removeClass";
                d.hasClass("tree-hit") && (d.hasClass("tree-expanded") ? d[e]("tree-expanded-hover") : d[e]("tree-collapsed-hover"))
            }
        }
        function f(b) {
            var c = a(b.target),
                d = c.closest("tr.datagrid-row");
            if (d.length && d.parent().length) {
                    var e = d.attr("node-id"),
                        f = g(d);
                    if (c.hasClass("tree-hit")) y(f, e);
                    else if (c.hasClass("tree-checkbox")) h(f, e);
                    else {
                            var i = a(f).datagrid("options");
                            if (c.parent().hasClass("datagrid-cell-check") || i.singleSelect || !b.shiftKey) a.fn.datagrid.defaults.rowEvents.click(b);
                            else {
                                var j = a(f).treegrid("getChildren"),
                                    k = a.easyui.indexOfArray(j, i.idField, i.lastSelectedIndex),
                                    l = a.easyui.indexOfArray(j, i.idField, e),
                                    m = Math.min(Math.max(k, 0), l),
                                    n = Math.max(k, l),
                                    o = j[l],
                                    p = c.closest("td[field]", d);
                                if (p.length) {
                                        var q = p.attr("field");
                                        i.onClickCell.call(f, e, q, o[q])
                                    }
                                a(f).treegrid("clearSelections");
                                for (var r = m; r <= n; r++) a(f).treegrid("selectRow", j[r][i.idField]);
                                i.onClickRow.call(f, o)
                            }
                        }
                }
        }
        function g(b) {
            return a(b).closest("div.datagrid-view").children(".datagrid-f")[0]
        }
        function h(b, c, d, e) {
            var f = a.data(b, "treegrid"),
                g = (f.checkedRows, f.options);
            if (g.checkbox) {
                    var h = v(b, c);
                    if (h.checkState) {
                        var l = g.finder.getTr(b, c),
                            m = l.find(".tree-checkbox");
                        if (void 0 == d && (m.hasClass("tree-checkbox1") ? d = !1 : m.hasClass("tree-checkbox0") ? d = !0 : (void 0 == h._checked && (h._checked = m.hasClass("tree-checkbox1")), d = !h._checked)), h._checked = d, d) {
                                if (m.hasClass("tree-checkbox1")) return
                            } else if (m.hasClass("tree-checkbox0")) return;
                            (e || 0 != g.onBeforeCheckNode.call(b, h, d)) && (g.cascadeCheck ? (j(b, h, d), k(b, h)) : i(b, h, d ? "1" : "0"), e || g.onCheckNode.call(b, h, d))
                    }
                }
        }
        function i(b, c, d) {
            var e = a.data(b, "treegrid"),
                f = e.checkedRows,
                g = e.options;
            if (c.checkState && void 0 != d) {
                    var h = g.finder.getTr(b, c[g.idField]),
                        i = h.find(".tree-checkbox");
                    i.length && (c.checkState = ["unchecked", "checked", "indeterminate"][d], c.checked = "checked" == c.checkState, i.removeClass("tree-checkbox0 tree-checkbox1 tree-checkbox2"), i.addClass("tree-checkbox" + d), 0 == d ? a.easyui.removeArrayItem(f, g.idField, c[g.idField]) : a.easyui.addArrayItem(f, g.idField, c))
                }
        }
        function j(b, c, d) {
            var e = d ? 1 : 0;
            i(b, c, e),
            a.easyui.forEach(c.children || [], !0, function (a) {
                i(b, a, e)
            })
        }
        function k(b, c) {
            var d = a.data(b, "treegrid").options,
                e = s(b, c[d.idField]);
            e && (i(b, e, l(e)), k(b, e))
        }
        function l(b) {
            var c = 0,
                d = 0,
                e = 0;
            if (a.easyui.forEach(b.children || [], !1, function (a) {
                    a.checkState && (c++, "checked" == a.checkState ? e++ : "unchecked" == a.checkState && d++)
                }), 0 != c) {
                    var f = 0;
                    return f = d == c ? 0 : e == c ? 1 : 2
                }
        }
        function m(b, c) {
            var d = a.data(b, "treegrid").options;
            if (d.checkbox) {
                var e = v(b, c),
                    f = d.finder.getTr(b, c),
                    g = f.find(".tree-checkbox");
                if (d.view.hasCheckbox(b, e)) if (g.length || (e.checkState = e.checkState || "unchecked", a('<span class="tree-checkbox"></span>').insertBefore(f.find(".tree-title"))), "checked" == e.checkState) h(b, c, !0, !0);
                else if ("unchecked" == e.checkState) h(b, c, !1, !0);
                else {
                        var i = l(e);
                        0 === i ? h(b, c, !1, !0) : 1 === i && h(b, c, !0, !0)
                    } else g.remove(),
                e.checkState = void 0,
                e.checked = void 0,
                k(b, e)
            }
        }
        function n(b, c) {
            function d(b, c) {
                a('<tr class="treegrid-tr-tree"><td style="border:0px" colspan="' + c + '"><div></div></td></tr>').insertAfter(b)
            }
            var e = a.data(b, "treegrid").options,
                f = e.finder.getTr(b, c, "body", 1),
                g = e.finder.getTr(b, c, "body", 2),
                h = a(b).datagrid("getColumnFields", !0).length + (e.rownumbers ? 1 : 0),
                i = a(b).datagrid("getColumnFields", !1).length;
            d(f, h),
            d(g, i)
        }
        function o(b, e, f, g, h) {
            var i = a.data(b, "treegrid"),
                j = i.options,
                k = i.dc;
            f = j.loadFilter.call(b, f, e);
            var l = v(b, e);
            if (l) {
                    var m = j.finder.getTr(b, e, "body", 1),
                        n = j.finder.getTr(b, e, "body", 2),
                        o = m.next("tr.treegrid-tr-tree").children("td").children("div"),
                        p = n.next("tr.treegrid-tr-tree").children("td").children("div");
                    g || (l.children = [])
                } else {
                    var o = k.body1,
                        p = k.body2;
                    g || (i.data = [])
                }
            if (g || (o.empty(), p.empty()), j.view.onBeforeRender && j.view.onBeforeRender.call(j.view, b, e, f), j.view.render.call(j.view, b, o, !0), j.view.render.call(j.view, b, p, !1), j.showFooter && (j.view.renderFooter.call(j.view, b, k.footer1, !0), j.view.renderFooter.call(j.view, b, k.footer2, !1)), j.view.onAfterRender && j.view.onAfterRender.call(j.view, b), !e && j.pagination) {
                    var q = a.data(b, "treegrid").total,
                        r = a(b).datagrid("getPager");
                    r.pagination("options").total != q && r.pagination({
                            total: q
                        })
                }
            c(b),
            d(b),
            a(b).treegrid("showLines"),
            a(b).treegrid("setSelectionState"),
            a(b).treegrid("autoSizeColumn"),
            h || j.onLoadSuccess.call(b, l, f)
        }
        function p(b, c, d, e, f) {
            var g = a.data(b, "treegrid").options,
                h = a(b).datagrid("getPanel").find("div.datagrid-body");
            void 0 == c && g.queryParams && (g.queryParams.id = void 0),
            d && (g.queryParams = d);
            var i = a.extend({}, g.queryParams);
            g.pagination && a.extend(i, {
                    page: g.pageNumber,
                    rows: g.pageSize
                }),
            g.sortName && a.extend(i, {
                    sort: g.sortName,
                    order: g.sortOrder
                });
            var j = v(b, c);
            if (0 != g.onBeforeLoad.call(b, j, i)) {
                    var k = h.find('tr[node-id="' + c + '"] span.tree-folder');
                    k.addClass("tree-loading"),
                    a(b).treegrid("loading");
                    var l = g.loader.call(b, i, function (d) {
                        k.removeClass("tree-loading"),
                        a(b).treegrid("loaded"),
                        o(b, c, d, e),
                        f && f()
                    }, function () {
                        k.removeClass("tree-loading"),
                        a(b).treegrid("loaded"),
                        g.onLoadError.apply(b, arguments),
                        f && f()
                    });
                    0 == l && (k.removeClass("tree-loading"), a(b).treegrid("loaded"))
                }
        }
        function q(a) {
            var b = r(a);
            return b.length ? b[0] : null
        }
        function r(b) {
            return a.data(b, "treegrid").data
        }
        function s(a, b) {
            var c = v(a, b);
            return c._parentId ? v(a, c._parentId) : null
        }
        function t(b, c) {
            var d = a.data(b, "treegrid").data;
            if (c) {
                var e = v(b, c);
                d = e ? e.children || [] : []
            }
            var f = [];
            return a.easyui.forEach(d, !0, function (a) {
                f.push(a)
            }),
            f
        }
        function u(b, c) {
            var d = a.data(b, "treegrid").options,
                e = d.finder.getTr(b, c),
                f = e.children('td[field="' + d.treeField + '"]');
            return f.find("span.tree-indent,span.tree-hit").length
        }
        function v(b, c) {
            var d = a.data(b, "treegrid"),
                e = d.options,
                f = null;
            return a.easyui.forEach(d.data, !0, function (a) {
                    if (a[e.idField] == c) return f = a,
                    !1
                }),
            f
        }
        function w(b, d) {
            var e = a.data(b, "treegrid").options,
                f = v(b, d),
                g = e.finder.getTr(b, d),
                h = g.find("span.tree-hit");
            if (0 != h.length && !h.hasClass("tree-collapsed") && 0 != e.onBeforeCollapse.call(b, f)) {
                    h.removeClass("tree-expanded tree-expanded-hover").addClass("tree-collapsed"),
                    h.next().removeClass("tree-folder-open"),
                    f.state = "closed",
                    g = g.next("tr.treegrid-tr-tree");
                    var i = g.children("td").children("div");
                    e.animate ? i.slideUp("normal", function () {
                        a(b).treegrid("autoSizeColumn"),
                        c(b, d),
                        e.onCollapse.call(b, f)
                    }) : (i.hide(), a(b).treegrid("autoSizeColumn"), c(b, d), e.onCollapse.call(b, f))
                }
        }
        function x(b, d) {
            function e(e) {
                i.state = "open",
                f.animate ? e.slideDown("normal", function () {
                    a(b).treegrid("autoSizeColumn"),
                    c(b, d),
                    f.onExpand.call(b, i)
                }) : (e.show(), a(b).treegrid("autoSizeColumn"), c(b, d), f.onExpand.call(b, i))
            }
            var f = a.data(b, "treegrid").options,
                g = f.finder.getTr(b, d),
                h = g.find("span.tree-hit"),
                i = v(b, d);
            if (0 != h.length && !h.hasClass("tree-expanded") && 0 != f.onBeforeExpand.call(b, i)) {
                    h.removeClass("tree-collapsed tree-collapsed-hover").addClass("tree-expanded"),
                    h.next().addClass("tree-folder-open");
                    var j = g.next("tr.treegrid-tr-tree");
                    if (j.length) {
                        var k = j.children("td").children("div");
                        e(k)
                    } else {
                        n(b, i[f.idField]);
                        var j = g.next("tr.treegrid-tr-tree"),
                            k = j.children("td").children("div");
                        k.hide();
                        var l = a.extend({}, f.queryParams || {});
                        l.id = i[f.idField],
                        p(b, i[f.idField], l, !0, function () {
                                k.is(":empty") ? j.remove() : e(k)
                            })
                    }
                }
        }
        function y(b, c) {
            var d = a.data(b, "treegrid").options,
                e = d.finder.getTr(b, c),
                f = e.find("span.tree-hit");
            f.hasClass("tree-expanded") ? w(b, c) : x(b, c)
        }
        function z(b, c) {
            var d = a.data(b, "treegrid").options,
                e = t(b, c);
            c && e.unshift(v(b, c));
            for (var f = 0; f < e.length; f++) w(b, e[f][d.idField])
        }
        function A(b, c) {
            var d = a.data(b, "treegrid").options,
                e = t(b, c);
            c && e.unshift(v(b, c));
            for (var f = 0; f < e.length; f++) x(b, e[f][d.idField])
        }
        function B(b, c) {
            for (var d = a.data(b, "treegrid").options, e = [], f = s(b, c); f;) {
                var g = f[d.idField];
                e.unshift(g),
                f = s(b, g)
            }
            for (var h = 0; h < e.length; h++) x(b, e[h])
        }
        function C(b, c) {
            var d = a.data(b, "treegrid"),
                e = d.options;
            if (c.parent) {
                    var f = e.finder.getTr(b, c.parent);
                    0 == f.next("tr.treegrid-tr-tree").length && n(b, c.parent);
                    var g = f.children('td[field="' + e.treeField + '"]').children("div.datagrid-cell"),
                        h = g.children("span.tree-icon");
                    if (h.hasClass("tree-file")) {
                            h.removeClass("tree-file").addClass("tree-folder tree-folder-open");
                            var i = a('<span class="tree-hit tree-expanded"></span>').insertBefore(h);
                            i.prev().length && i.prev().remove()
                        }
                }
            o(b, c.parent, c.data, d.data.length > 0, !0)
        }
        function D(b, c) {
            function e(a) {
                var d = a ? 1 : 2,
                    e = g.finder.getTr(b, c.data[g.idField], "body", d),
                    h = e.closest("table.datagrid-btable");
                e = e.parent().children();
                var i = g.finder.getTr(b, f, "body", d);
                if (c.before) e.insertBefore(i);
                else {
                        var j = i.next("tr.treegrid-tr-tree");
                        e.insertAfter(j.length ? j : i)
                    }
                h.remove()
            }
            var f = c.before || c.after,
                g = a.data(b, "treegrid").options,
                h = s(b, f);
            C(b, {
                    parent: h ? h[g.idField] : null,
                    data: [c.data]
                });
            for (var i = h ? h.children : a(b).treegrid("getRoots"), j = 0; j < i.length; j++) if (i[j][g.idField] == f) {
                    var k = i[i.length - 1];
                    i.splice(c.before ? j : j + 1, 0, k),
                    i.splice(i.length - 1, 1);
                    break
                }
            e(!0),
            e(!1),
            d(b),
            a(b).treegrid("showLines")
        }
        function E(b, c) {
            var e = a.data(b, "treegrid"),
                f = e.options,
                g = s(b, c);
            a(b).datagrid("deleteRow", c),
            a.easyui.removeArrayItem(e.checkedRows, f.idField, c),
            d(b),
            g && m(b, g[f.idField]),
            e.total -= 1,
            a(b).datagrid("getPager").pagination("refresh", {
                    total: e.total
                }),
            a(b).treegrid("showLines")
        }
        function F(b) {
            function c(b) {
                if (a.map(b, function (a) {
                    if (a.children && a.children.length) c(a.children);
                    else {
                        var b = e(a);
                        b.find(".tree-icon").prev().addClass("tree-join")
                    }
                }), b.length) {
                    var d = e(b[b.length - 1]);
                    d.addClass("tree-node-last"),
                    d.find(".tree-join").removeClass("tree-join").addClass("tree-joinbottom")
                }
            }
            function d(c) {
                a.map(c, function (a) {
                    a.children && a.children.length && d(a.children)
                });
                for (var e = 0; e < c.length - 1; e++) {
                    var h = c[e],
                        i = f.treegrid("getLevel", h[g.idField]),
                        j = g.finder.getTr(b, h[g.idField]),
                        k = j.next().find('tr.datagrid-row td[field="' + g.treeField + '"] div.datagrid-cell');
                    k.find("span:eq(" + (i - 1) + ")").addClass("tree-line")
                }
            }
            function e(a) {
                var c = g.finder.getTr(b, a[g.idField]),
                    d = c.find('td[field="' + g.treeField + '"] div.datagrid-cell');
                return d
            }
            var f = a(b),
                g = f.treegrid("options");
            if (!g.lines) return void f.treegrid("getPanel").removeClass("tree-lines");
            f.treegrid("getPanel").addClass("tree-lines"),
            f.treegrid("getPanel").find("span.tree-indent").removeClass("tree-line tree-join tree-joinbottom"),
            f.treegrid("getPanel").find("div.datagrid-cell").removeClass("tree-node-last tree-root-first tree-root-one");
            var h = f.treegrid("getRoots");
            h.length > 1 ? e(h[0]).addClass("tree-root-first") : 1 == h.length && e(h[0]).addClass("tree-root-one"),
            c(h),
            d(h)
        }
        a.fn.treegrid = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.treegrid.methods[c];
                return e ? e(this, d) : this.datagrid(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "treegrid");
                d ? a.extend(d.options, c) : d = a.data(this, "treegrid", {
                    options: a.extend({}, a.fn.treegrid.defaults, a.fn.treegrid.parseOptions(this), c),
                    data: [],
                    checkedRows: [],
                    tmpIds: []
                }),
                b(this),
                d.options.data && a(this).treegrid("loadData", d.options.data),
                p(this)
            })
        },
        a.fn.treegrid.methods = {
            options: function (b) {
                return a.data(b[0], "treegrid").options
            },
            resize: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("resize", c)
                })
            },
            fixRowHeight: function (a, b) {
                return a.each(function () {
                    c(this, b)
                })
            },
            loadData: function (a, b) {
                return a.each(function () {
                    o(this, b.parent, b)
                })
            },
            load: function (b, c) {
                return b.each(function () {
                    a(this).treegrid("options").pageNumber = 1,
                    a(this).treegrid("getPager").pagination({
                        pageNumber: 1
                    }),
                    a(this).treegrid("reload", c)
                })
            },
            reload: function (b, c) {
                return b.each(function () {
                    var b = a(this).treegrid("options"),
                        d = {};
                    if ("object" == typeof c ? d = c : (d = a.extend({}, b.queryParams), d.id = c), d.id) {
                            var e = a(this).treegrid("find", d.id);
                            e && e.children && e.children.splice(0, e.children.length),
                            b.queryParams = d;
                            var f = b.finder.getTr(this, d.id);
                            f.next("tr.treegrid-tr-tree").remove(),
                            f.find("span.tree-hit").removeClass("tree-expanded tree-expanded-hover").addClass("tree-collapsed"),
                            x(this, d.id)
                        } else p(this, null, d)
                })
            },
            reloadFooter: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "treegrid").options,
                        d = a.data(this, "datagrid").dc;
                    c && (a.data(this, "treegrid").footer = c),
                    b.showFooter && (b.view.renderFooter.call(b.view, this, d.footer1, !0), b.view.renderFooter.call(b.view, this, d.footer2, !1), b.view.onAfterRender && b.view.onAfterRender.call(b.view, this), a(this).treegrid("fixRowHeight"))
                })
            },
            getData: function (b) {
                return a.data(b[0], "treegrid").data
            },
            getFooterRows: function (b) {
                return a.data(b[0], "treegrid").footer
            },
            getRoot: function (a) {
                return q(a[0])
            },
            getRoots: function (a) {
                return r(a[0])
            },
            getParent: function (a, b) {
                return s(a[0], b)
            },
            getChildren: function (a, b) {
                return t(a[0], b)
            },
            getLevel: function (a, b) {
                return u(a[0], b)
            },
            find: function (a, b) {
                return v(a[0], b)
            },
            isLeaf: function (b, c) {
                var d = a.data(b[0], "treegrid").options,
                    e = d.finder.getTr(b[0], c),
                    f = e.find("span.tree-hit");
                return 0 == f.length
            },
            select: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("selectRow", c)
                })
            },
            unselect: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("unselectRow", c)
                })
            },
            collapse: function (a, b) {
                return a.each(function () {
                    w(this, b)
                })
            },
            expand: function (a, b) {
                return a.each(function () {
                    x(this, b)
                })
            },
            toggle: function (a, b) {
                return a.each(function () {
                    y(this, b)
                })
            },
            collapseAll: function (a, b) {
                return a.each(function () {
                    z(this, b)
                })
            },
            expandAll: function (a, b) {
                return a.each(function () {
                    A(this, b)
                })
            },
            expandTo: function (a, b) {
                return a.each(function () {
                    B(this, b)
                })
            },
            append: function (a, b) {
                return a.each(function () {
                    C(this, b)
                })
            },
            insert: function (a, b) {
                return a.each(function () {
                    D(this, b)
                })
            },
            remove: function (a, b) {
                return a.each(function () {
                    E(this, b)
                })
            },
            pop: function (a, b) {
                var c = a.treegrid("find", b);
                return a.treegrid("remove", b),
                c
            },
            refresh: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "treegrid").options;
                    b.view.refreshRow.call(b.view, this, c)
                })
            },
            update: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "treegrid").options,
                        d = c.row;
                    b.view.updateRow.call(b.view, this, c.id, d),
                    void 0 != d.checked && (d = v(this, c.id), a.extend(d, {
                            checkState: d.checked ? "checked" : d.checked === !1 ? "unchecked" : void 0
                        }), m(this, c.id))
                })
            },
            beginEdit: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("beginEdit", c),
                    a(this).treegrid("fixRowHeight", c)
                })
            },
            endEdit: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("endEdit", c)
                })
            },
            cancelEdit: function (b, c) {
                return b.each(function () {
                    a(this).datagrid("cancelEdit", c)
                })
            },
            showLines: function (a) {
                return a.each(function () {
                    F(this)
                })
            },
            setSelectionState: function (b) {
                return b.each(function () {
                    a(this).datagrid("setSelectionState");
                    for (var b = a(this).data("treegrid"), c = 0; c < b.tmpIds.length; c++) h(this, b.tmpIds[c], !0, !0);
                    b.tmpIds = []
                })
            },
            getCheckedNodes: function (b, c) {
                c = c || "checked";
                var d = [];
                return a.easyui.forEach(b.data("treegrid").checkedRows, !1, function (a) {
                    a.checkState == c && d.push(a)
                }),
                d
            },
            checkNode: function (a, b) {
                return a.each(function () {
                    h(this, b, !0)
                })
            },
            uncheckNode: function (a, b) {
                return a.each(function () {
                    h(this, b, !1)
                })
            },
            clearChecked: function (b) {
                return b.each(function () {
                    var b = this,
                        c = a(b).treegrid("options");
                    a(b).datagrid("clearChecked"),
                    a.map(a(b).treegrid("getCheckedNodes"), function (a) {
                            h(b, a[c.idField], !1, !0)
                        })
                })
            }
        },
        a.fn.treegrid.parseOptions = function (b) {
            return a.extend({}, a.fn.datagrid.parseOptions(b), a.parser.parseOptions(b, ["treeField", {
                checkbox: "boolean",
                cascadeCheck: "boolean",
                onlyLeafCheck: "boolean"
            },
            {
                animate: "boolean"
            }]))
        };
        var G = a.extend({}, a.fn.datagrid.defaults.view, {
            render: function (b, c, d) {
                function e(c, d, j) {
                    for (var k = a(b).treegrid("getParent", j[0][f.idField]), l = (k ? k.children.length : a(b).treegrid("getRoots").length) - j.length, m = ['<table class="datagrid-btable" cellspacing="0" cellpadding="0" border="0"><tbody>'], n = 0; n < j.length; n++) {
                        var o = j[n];
                        "open" != o.state && "closed" != o.state && (o.state = "open");
                        var p = f.rowStyler ? f.rowStyler.call(b, o) : "",
                            q = this.getStyleValue(p),
                            r = 'class="datagrid-row ' + (l++ % 2 && f.striped ? "datagrid-row-alt " : " ") + q.c + '"',
                            s = q.s ? 'style="' + q.s + '"' : "",
                            t = h + "-" + (c ? 1 : 2) + "-" + o[f.idField];
                        if (m.push('<tr id="' + t + '" node-id="' + o[f.idField] + '" ' + r + " " + s + ">"), m = m.concat(i.renderRow.call(i, b, g, c, d, o)), m.push("</tr>"), o.children && o.children.length) {
                                var u = e.call(this, c, d + 1, o.children),
                                    v = "closed" == o.state ? "none" : "block";
                                m.push('<tr class="treegrid-tr-tree"><td style="border:0px" colspan=' + (g.length + (f.rownumbers ? 1 : 0)) + '><div style="display:' + v + '">'),
                                m = m.concat(u),
                                m.push("</div></td></tr>")
                            }
                    }
                    return m.push("</tbody></table>"),
                    m
                }
                var f = a.data(b, "treegrid").options,
                    g = a(b).datagrid("getColumnFields", d),
                    h = a.data(b, "datagrid").rowIdPrefix;
                if (!d || f.rownumbers || f.frozenColumns && f.frozenColumns.length) {
                        var i = this;
                        if (this.treeNodes && this.treeNodes.length) {
                            var j = e.call(this, d, this.treeLevel, this.treeNodes);
                            a(c).append(j.join(""))
                        }
                    }
            },
            renderFooter: function (b, c, d) {
                for (var e = a.data(b, "treegrid").options, f = a.data(b, "treegrid").footer || [], g = a(b).datagrid("getColumnFields", d), h = ['<table class="datagrid-ftable" cellspacing="0" cellpadding="0" border="0"><tbody>'], i = 0; i < f.length; i++) {
                    var j = f[i];
                    j[e.idField] = j[e.idField] || "foot-row-id" + i,
                    h.push('<tr class="datagrid-row" node-id="' + j[e.idField] + '">'),
                    h.push(this.renderRow.call(this, b, g, d, 0, j)),
                    h.push("</tr>")
                }
                h.push("</tbody></table>"),
                a(c).html(h.join(""))
            },
            renderRow: function (b, c, d, e, f) {
                var g = a.data(b, "treegrid"),
                    h = g.options,
                    i = [];
                d && h.rownumbers && i.push('<td class="datagrid-td-rownumber"><div class="datagrid-cell-rownumber">0</div></td>');
                for (var j = 0; j < c.length; j++) {
                        var k = c[j],
                            l = a(b).datagrid("getColumnOption", k);
                        if (l) {
                                var m = l.styler ? l.styler(f[k], f) || "" : "",
                                    n = this.getStyleValue(m),
                                    o = n.c ? 'class="' + n.c + '"' : "",
                                    p = l.hidden ? 'style="display:none;' + n.s + '"' : n.s ? 'style="' + n.s + '"' : "";
                                i.push('<td field="' + k + '" ' + o + " " + p + ">");
                                var p = "";
                                if (l.checkbox || (l.align && (p += "text-align:" + l.align + ";"), h.nowrap ? h.autoRowHeight && (p += "height:auto;") : p += "white-space:normal;height:auto;"), i.push('<div style="' + p + '" '), l.checkbox ? i.push('class="datagrid-cell-check ') : i.push('class="datagrid-cell ' + l.cellClass), i.push('">'), l.checkbox) f.checked ? i.push('<input type="checkbox" checked="checked"') : i.push('<input type="checkbox"'),
                                i.push(' name="' + k + '" value="' + (void 0 != f[k] ? f[k] : "") + '">');
                                else {
                                        var q = null;
                                        if (q = l.formatter ? l.formatter(f[k], f) : f[k], k == h.treeField) {
                                            for (var r = 0; r < e; r++) i.push('<span class="tree-indent"></span>');
                                            if ("closed" == f.state ? (i.push('<span class="tree-hit tree-collapsed"></span>'), i.push('<span class="tree-icon tree-folder ' + (f.iconCls ? f.iconCls : "") + '"></span>')) : f.children && f.children.length ? (i.push('<span class="tree-hit tree-expanded"></span>'), i.push('<span class="tree-icon tree-folder tree-folder-open ' + (f.iconCls ? f.iconCls : "") + '"></span>')) : (i.push('<span class="tree-indent"></span>'), i.push('<span class="tree-icon tree-file ' + (f.iconCls ? f.iconCls : "") + '"></span>')), this.hasCheckbox(b, f)) {
                                                var s = 0,
                                                    t = a.easyui.getArrayItem(g.checkedRows, h.idField, f[h.idField]);
                                                if (t) s = "checked" == t.checkState ? 1 : 2,
                                                f.checkState = t.checkState,
                                                f.checked = t.checked,
                                                a.easyui.addArrayItem(g.checkedRows, h.idField, f);
                                                else {
                                                        var u = a.easyui.getArrayItem(g.checkedRows, h.idField, f._parentId);
                                                        u && "checked" == u.checkState && h.cascadeCheck ? (s = 1, f.checked = !0, a.easyui.addArrayItem(g.checkedRows, h.idField, f)) : f.checked && a.easyui.addArrayItem(g.tmpIds, f[h.idField]),
                                                        f.checkState = s ? "checked" : "unchecked"
                                                    }
                                                i.push('<span class="tree-checkbox tree-checkbox' + s + '"></span>')
                                            } else f.checkState = void 0,
                                            f.checked = void 0;
                                            i.push('<span class="tree-title">' + q + "</span>")
                                        } else i.push(q)
                                    }
                                i.push("</div>"),
                                i.push("</td>")
                            }
                    }
                return i.join("")
            },
            hasCheckbox: function (b, c) {
                var d = a.data(b, "treegrid").options;
                if (d.checkbox) {
                    if (a.isFunction(d.checkbox)) return !!d.checkbox.call(b, c);
                    if (!d.onlyLeafCheck) return !0;
                    if (!("open" != c.state || c.children && c.children.length)) return !0
                }
                return !1
            },
            refreshRow: function (a, b) {
                this.updateRow.call(this, a, b, {})
            },
            updateRow: function (b, c, d) {
                function e(d) {
                    var e = a(b).treegrid("getColumnFields", d),
                        l = f.finder.getTr(b, c, "body", d ? 1 : 2),
                        m = l.find("div.datagrid-cell-rownumber").html(),
                        n = l.find("div.datagrid-cell-check input[type=checkbox]").is(":checked");
                    l.html(this.renderRow(b, e, d, h, g)),
                    l.attr("style", i || ""),
                    l.find("div.datagrid-cell-rownumber").html(m),
                    n && l.find("div.datagrid-cell-check input[type=checkbox]")._propAttr("checked", !0),
                    k != c && (l.attr("id", j + "-" + (d ? 1 : 2) + "-" + k), l.attr("node-id", k))
                }
                var f = a.data(b, "treegrid").options,
                    g = a(b).treegrid("find", c);
                a.extend(g, d);
                var h = a(b).treegrid("getLevel", c) - 1,
                    i = f.rowStyler ? f.rowStyler.call(b, g) : "",
                    j = a.data(b, "datagrid").rowIdPrefix,
                    k = g[f.idField];
                e.call(this, !0),
                e.call(this, !1),
                a(b).treegrid("fixRowHeight", c)
            },
            deleteRow: function (b, c) {
                function d(c) {
                    var d, f = a(b).treegrid("getParent", c);
                    d = f ? f.children : a(b).treegrid("getData");
                    for (var g = 0; g < d.length; g++) if (d[g][e.idField] == c) {
                        d.splice(g, 1);
                        break
                    }
                    return f
                }
                var e = a.data(b, "treegrid").options,
                    f = e.finder.getTr(b, c);
                f.next("tr.treegrid-tr-tree").remove(),
                f.remove();
                var g = d(c);
                if (g && 0 == g.children.length) {
                        f = e.finder.getTr(b, g[e.idField]),
                        f.next("tr.treegrid-tr-tree").remove();
                        var h = f.children('td[field="' + e.treeField + '"]').children("div.datagrid-cell");
                        h.find(".tree-icon").removeClass("tree-folder").addClass("tree-file"),
                        h.find(".tree-hit").remove(),
                        a('<span class="tree-indent"></span>').prependTo(h)
                    }
                this.setEmptyMsg(b)
            },
            onBeforeRender: function (b, c, d) {
                function e(a, b) {
                    for (var c = 0; c < a.length; c++) {
                        var d = a[c];
                        d._parentId = b,
                        d.children && d.children.length && e(d.children, d[g.idField])
                    }
                }
                if (a.isArray(c) && (d = {
                    total: c.length,
                    rows: c
                }, c = null), !d) return !1;
                var f = a.data(b, "treegrid"),
                    g = f.options;
                void 0 == d.length ? (d.footer && (f.footer = d.footer), d.total && (f.total = d.total), d = this.transfer(b, c, d.rows)) : e(d, c),
                this.sort(b, d),
                this.treeNodes = d,
                this.treeLevel = a(b).treegrid("getLevel", c);
                var h = v(b, c);
                h ? h.children ? h.children = h.children.concat(d) : h.children = d : f.data = f.data.concat(d)
            },
            sort: function (b, c) {
                function d(c) {
                    c.sort(function (c, d) {
                        for (var e = 0, h = 0; h < f.length; h++) {
                            var i = f[h],
                                j = g[h],
                                k = a(b).treegrid("getColumnOption", i),
                                l = k.sorter ||
                            function (a, b) {
                                    return a == b ? 0 : a > b ? 1 : -1
                                };
                            if (e = l(c[i], d[i]) * ("asc" == j ? 1 : -1), 0 != e) return e
                        }
                        return e
                    });
                    for (var e = 0; e < c.length; e++) {
                        var h = c[e].children;
                        h && h.length && d(h)
                    }
                }
                var e = a.data(b, "treegrid").options;
                if (!e.remoteSort && e.sortName) {
                    var f = e.sortName.split(","),
                        g = e.sortOrder.split(",");
                    d(c)
                }
            },
            transfer: function (b, c, d) {
                function e(a, b) {
                    for (var c = [], d = 0; d < b.length; d++) {
                        var e = b[d];
                        e._parentId == a && (c.push(e), b.splice(d, 1), d--)
                    }
                    return c
                }
                for (var f = a.data(b, "treegrid").options, g = a.extend([], d), h = e(c, g), i = a.extend([], h); i.length;) {
                    var j = i.shift(),
                        k = e(j[f.idField], g);
                    k.length && (j.children ? j.children = j.children.concat(k) : j.children = k, i = i.concat(k))
                }
                return h
            }
        });
        a.fn.treegrid.defaults = a.extend({}, a.fn.datagrid.defaults, {
            treeField: null,
            checkbox: !1,
            cascadeCheck: !0,
            onlyLeafCheck: !1,
            lines: !1,
            animate: !1,
            singleSelect: !0,
            view: G,
            rowEvents: a.extend({}, a.fn.datagrid.defaults.rowEvents, {
                mouseover: e(!0),
                mouseout: e(!1),
                click: f
            }),
            loader: function (b, c, d) {
                var e = a(this).treegrid("options");
                return !!e.url && void a.ajax({
                    type: e.method,
                    url: e.url,
                    data: b,
                    dataType: "json",
                    success: function (a) {
                        c(a)
                    },
                    error: function () {
                        d.apply(this, arguments)
                    }
                })
            },
            loadFilter: function (a, b) {
                return a
            },
            finder: {
                getTr: function (b, c, d, e) {
                    d = d || "body",
                    e = e || 0;
                    var f = a.data(b, "datagrid").dc;
                    if (0 == e) {
                        var g = a.data(b, "treegrid").options,
                            h = g.finder.getTr(b, c, d, 1),
                            i = g.finder.getTr(b, c, d, 2);
                        return h.add(i)
                    }
                    if ("body" == d) {
                        var j = a("#" + a.data(b, "datagrid").rowIdPrefix + "-" + e + "-" + c);
                        return j.length || (j = (1 == e ? f.body1 : f.body2).find('tr[node-id="' + c + '"]')),
                        j
                    }
                    return "footer" == d ? (1 == e ? f.footer1 : f.footer2).find('tr[node-id="' + c + '"]') : "selected" == d ? (1 == e ? f.body1 : f.body2).find("tr.datagrid-row-selected") : "highlight" == d ? (1 == e ? f.body1 : f.body2).find("tr.datagrid-row-over") : "checked" == d ? (1 == e ? f.body1 : f.body2).find("tr.datagrid-row-checked") : "last" == d ? (1 == e ? f.body1 : f.body2).find("tr:last[node-id]") : "allbody" == d ? (1 == e ? f.body1 : f.body2).find("tr[node-id]") : "allfooter" == d ? (1 == e ? f.footer1 : f.footer2).find("tr[node-id]") : void 0
                },
                getRow: function (b, c) {
                    var d = "object" == typeof c ? c.attr("node-id") : c;
                    return a(b).treegrid("find", d)
                },
                getRows: function (b) {
                    return a(b).treegrid("getChildren")
                }
            },
            onBeforeLoad: function (a, b) {},
            onLoadSuccess: function (a, b) {},
            onLoadError: function () {},
            onBeforeCollapse: function (a) {},
            onCollapse: function (a) {},
            onBeforeExpand: function (a) {},
            onExpand: function (a) {},
            onClickRow: function (a) {},
            onDblClickRow: function (a) {},
            onClickCell: function (a, b) {},
            onDblClickCell: function (a, b) {},
            onContextMenu: function (a, b) {},
            onBeforeEdit: function (a) {},
            onAfterEdit: function (a, b) {},
            onCancelEdit: function (a) {},
            onBeforeCheckNode: function (a, b) {},
            onCheckNode: function (a, b) {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "datalist").options;
            a(b).datagrid(a.extend({}, c, {
                cls: "datalist" + (c.lines ? " datalist-lines" : ""),
                frozenColumns: c.frozenColumns && c.frozenColumns.length ? c.frozenColumns : c.checkbox ? [
                    [{
                        field: "_ck",
                        checkbox: !0
                    }]
                ] : void 0,
                columns: c.columns && c.columns.length ? c.columns : [
                    [{
                        field: c.textField,
                        width: "100%",
                        formatter: function (a, b, d) {
                            return c.textFormatter ? c.textFormatter(a, b, d) : a
                        }
                    }]
                ]
            }))
        }
        var c = a.extend({}, a.fn.datagrid.defaults.view, {
            render: function (b, c, d) {
                var e = a.data(b, "datagrid"),
                    f = e.options;
                if (f.groupField) {
                        var g = this.groupRows(b, e.data.rows);
                        this.groups = g.groups,
                        e.data.rows = g.rows;
                        for (var h = [], i = 0; i < g.groups.length; i++) h.push(this.renderGroup.call(this, b, i, g.groups[i], d));
                        a(c).html(h.join(""))
                    } else a(c).html(this.renderTable(b, 0, e.data.rows, d))
            },
            renderGroup: function (b, c, d, e) {
                var f = a.data(b, "datagrid"),
                    g = f.options,
                    h = (a(b).datagrid("getColumnFields", e), []);
                return h.push('<div class="datagrid-group" group-index=' + c + ">"),
                e || (h.push('<span class="datagrid-group-title">'), h.push(g.groupFormatter.call(b, d.value, d.rows)), h.push("</span>")),
                h.push("</div>"),
                h.push(this.renderTable(b, d.startIndex, d.rows, e)),
                h.join("")
            },
            groupRows: function (b, c) {
                function d(a) {
                    for (var b = 0; b < g.length; b++) {
                        var c = g[b];
                        if (c.value == a) return c
                    }
                    return null
                }
                for (var e = a.data(b, "datagrid"), f = e.options, g = [], h = 0; h < c.length; h++) {
                    var i = c[h],
                        j = d(i[f.groupField]);
                    j ? j.rows.push(i) : (j = {
                            value: i[f.groupField],
                            rows: [i]
                        }, g.push(j))
                }
                for (var k = 0, c = [], h = 0; h < g.length; h++) {
                    var j = g[h];
                    j.startIndex = k,
                    k += j.rows.length,
                    c = c.concat(j.rows)
                }
                return {
                    groups: g,
                    rows: c
                }
            }
        });
        a.fn.datalist = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.datalist.methods[c];
                return e ? e(this, d) : this.datagrid(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "datalist");
                if (d) a.extend(d.options, c);
                else {
                    var e = a.extend({}, a.fn.datalist.defaults, a.fn.datalist.parseOptions(this), c);
                    e.columns = a.extend(!0, [], e.columns),
                    d = a.data(this, "datalist", {
                        options: e
                    })
                }
                if (b(this), !d.options.data) {
                    var f = a.fn.datalist.parseData(this);
                    f.total && a(this).datalist("loadData", f)
                }
            })
        },
        a.fn.datalist.methods = {
            options: function (b) {
                return a.data(b[0], "datalist").options
            }
        },
        a.fn.datalist.parseOptions = function (b) {
            return a.extend({}, a.fn.datagrid.parseOptions(b), a.parser.parseOptions(b, ["valueField", "textField", "groupField", {
                checkbox: "boolean",
                lines: "boolean"
            }]))
        },
        a.fn.datalist.parseData = function (b) {
            var c = a.data(b, "datalist").options,
                d = {
                    total: 0,
                    rows: []
                };
            return a(b).children().each(function () {
                    var b = a.parser.parseOptions(this, ["value", "group"]),
                        e = {},
                        f = a(this).html();
                    e[c.valueField] = void 0 != b.value ? b.value : f,
                    e[c.textField] = f,
                    c.groupField && (e[c.groupField] = b.group),
                    d.total++,
                    d.rows.push(e)
                }),
            d
        },
        a.fn.datalist.defaults = a.extend({}, a.fn.datagrid.defaults, {
            fitColumns: !0,
            singleSelect: !0,
            showHeader: !1,
            checkbox: !1,
            lines: !1,
            valueField: "value",
            textField: "text",
            groupField: "",
            view: c,
            textFormatter: function (a, b) {
                return a
            },
            groupFormatter: function (a, b) {
                return a
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "combo"),
                f = c.options;
            c.panel || (c.panel = a('<div class="combo-panel"></div>').appendTo("body"), c.panel.panel({
                    minWidth: f.panelMinWidth,
                    maxWidth: f.panelMaxWidth,
                    minHeight: f.panelMinHeight,
                    maxHeight: f.panelMaxHeight,
                    doSize: !1,
                    closed: !0,
                    cls: "combo-p",
                    style: {
                        position: "absolute",
                        zIndex: 10
                    },
                    onOpen: function () {
                        var b = a(this).panel("options").comboTarget,
                            c = a.data(b, "combo");
                        c && c.options.onShowPanel.call(b)
                    },
                    onBeforeClose: function () {
                        e(a(this).parent())
                    },
                    onClose: function () {
                        var b = a(this).panel("options").comboTarget,
                            c = a(b).data("combo");
                        c && c.options.onHidePanel.call(b)
                    }
                }));
            var g = a.extend(!0, [], f.icons);
            f.hasDownArrow && g.push({
                    iconCls: "combo-arrow",
                    handler: function (a) {
                        d(a.data.target)
                    }
                }),
            a(b).addClass("combo-f").textbox(a.extend({}, f, {
                    icons: g,
                    onChange: function () {}
                })),
            a(b).attr("comboName", a(b).attr("textboxName")),
            c.combo = a(b).next(),
            c.combo.addClass("combo")
        }
        function c(b) {
            var c = a.data(b, "combo"),
                d = c.options,
                e = c.panel;
            e.is(":visible") && e.panel("close"),
            d.cloned || e.panel("destroy"),
            a(b).textbox("destroy")
        }
        function d(b) {
            var c = a.data(b, "combo").panel;
            if (c.is(":visible")) {
                var d = c.combo("combo");
                i(d),
                d != b && a(b).combo("showPanel")
            } else {
                var e = a(b).closest("div.combo-p").children(".combo-panel");
                a("div.combo-panel:visible").not(c).not(e).panel("close"),
                a(b).combo("showPanel")
            }
            a(b).combo("textbox").focus()
        }
        function e(b) {
            a(b).find(".combo-f").each(function () {
                var b = a(this).combo("panel");
                b.is(":visible") && b.panel("close")
            })
        }
        function f(b) {
            var c = b.data.target,
                e = a.data(c, "combo"),
                f = e.options;
            if (f.editable) {
                    var g = a(c).closest("div.combo-p").children(".combo-panel");
                    a("div.combo-panel:visible").not(g).each(function () {
                        var b = a(this).combo("combo");
                        b != c && i(b)
                    })
                } else d(c)
        }
        function g(b) {
            var c = b.data.target,
                d = a(c),
                e = d.data("combo"),
                f = d.combo("options");
            switch (e.panel.panel("options").comboTarget = c, b.keyCode) {
                case 38:
                    f.keyHandler.up.call(c, b);
                    break;
                case 40:
                    f.keyHandler.down.call(c, b);
                    break;
                case 37:
                    f.keyHandler.left.call(c, b);
                    break;
                case 39:
                    f.keyHandler.right.call(c, b);
                    break;
                case 13:
                    return b.preventDefault(),
                    f.keyHandler.enter.call(c, b),
                    !1;
                case 9:
                case 27:
                    i(c);
                    break;
                default:
                    f.editable && (e.timer && clearTimeout(e.timer), e.timer = setTimeout(function () {
                        var a = d.combo("getText");
                        e.previousText != a && (e.previousText = a, d.combo("showPanel"), f.keyHandler.query.call(c, a, b), d.combo("validate"))
                    }, f.delay))
                }
        }
        function h(b) {
            function c() {
                var b = f.offset().left;
                return "right" == h.panelAlign && (b += f._outerWidth() - g._outerWidth()),
                b + g._outerWidth() > a(window)._outerWidth() + a(document).scrollLeft() && (b = a(window)._outerWidth() + a(document).scrollLeft() - g._outerWidth()),
                b < 0 && (b = 0),
                b
            }
            function d() {
                var b = f.offset().top + f._outerHeight();
                return b + g._outerHeight() > a(window)._outerHeight() + a(document).scrollTop() && (b = f.offset().top - g._outerHeight()),
                b < a(document).scrollTop() && (b = f.offset().top + f._outerHeight()),
                b
            }
            var e = a.data(b, "combo"),
                f = e.combo,
                g = e.panel,
                h = a(b).combo("options"),
                i = g.panel("options");
            i.comboTarget = b,
            i.closed && (g.panel("panel").show().css({
                    zIndex: a.fn.menu ? a.fn.menu.defaults.zIndex++ : a.fn.window ? a.fn.window.defaults.zIndex++ : 99,
                    left: -999999
                }), g.panel("resize", {
                    width: h.panelWidth ? h.panelWidth : f._outerWidth(),
                    height: h.panelHeight
                }), g.panel("panel").hide(), g.panel("open")),


            function () {
                    i.comboTarget == b && g.is(":visible") && (g.panel("move", {
                        left: c(),
                        top: d()
                    }), setTimeout(arguments.callee, 200))
                }()
        }
        function i(b) {
            var c = a.data(b, "combo").panel;
            c.panel("close")
        }
        function j(b, c) {
            var d = a.data(b, "combo"),
                e = a(b).textbox("getText");
            e != c && a(b).textbox("setText", c),
            d.previousText = c
        }
        function k(b) {
            var c = a.data(b, "combo"),
                d = c.options,
                e = a(b).next(),
                f = [];
            return e.find(".textbox-value").each(function () {
                    f.push(a(this).val())
                }),
            d.multivalue ? f : f.length ? f[0].split(d.separator) : f
        }
        function l(b, c) {
            function d(c) {
                var d = a(b).attr("textboxName") || "",
                    e = a('<input type="hidden" class="textbox-value">').appendTo(f);
                e.attr("name", d),
                g.disabled && e.attr("disabled", "disabled"),
                e.val(c)
            }
            var e = a.data(b, "combo"),
                f = e.combo,
                g = a(b).combo("options");
            a.isArray(c) || (c = c.split(g.separator));
            var h = k(b);
            if (f.find(".textbox-value").remove(), c.length) if (g.multivalue) for (var i = 0; i < c.length; i++) d(c[i]);
            else d(c.join(g.separator));
            var j = function () {
                    if (h.length != c.length) return !0;
                    for (var a = 0; a < c.length; a++) if (c[a] != h[a]) return !0;
                    return !1
                }();
            j && (a(b).val(c.join(g.separator)), g.multiple ? g.onChange.call(b, c, h) : g.onChange.call(b, c[0], h[0]), a(b).closest("form").trigger("_change", [b]))
        }
        function m(a) {
            var b = k(a);
            return b[0]
        }
        function n(a, b) {
            l(a, [b])
        }
        function o(b) {
            var c = a.data(b, "combo").options,
                d = c.onChange;
            c.onChange = function () {},
            c.multiple ? l(b, c.value ? c.value : []) : n(b, c.value),
            c.onChange = d
        }
        a(function () {
            a(document).unbind(".combo").bind("mousedown.combo mousewheel.combo", function (b) {
                var c = a(b.target).closest("span.combo,div.combo-p,div.menu");
                return c.length ? void e(c) : void a("body>div.combo-p>div.combo-panel:visible").panel("close")
            })
        }),
        a.fn.combo = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.combo.methods[c];
                return e ? e(this, d) : this.textbox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "combo");
                d ? (a.extend(d.options, c), void 0 != c.value && (d.options.originalValue = c.value)) : (d = a.data(this, "combo", {
                    options: a.extend({}, a.fn.combo.defaults, a.fn.combo.parseOptions(this), c),
                    previousText: ""
                }), d.options.originalValue = d.options.value),
                b(this),
                o(this)
            })
        },
        a.fn.combo.methods = {
            options: function (b) {
                var c = b.textbox("options");
                return a.extend(a.data(b[0], "combo").options, {
                    width: c.width,
                    height: c.height,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    a(this).textbox("cloneFrom", c),
                    a.data(this, "combo", {
                        options: a.extend(!0, {
                            cloned: !0
                        }, a(c).combo("options")),
                        combo: a(this).next(),
                        panel: a(c).combo("panel")
                    }),
                    a(this).addClass("combo-f").attr("comboName", a(this).attr("textboxName"))
                })
            },
            combo: function (a) {
                return a.closest(".combo-panel").panel("options").comboTarget
            },
            panel: function (b) {
                return a.data(b[0], "combo").panel
            },
            destroy: function (a) {
                return a.each(function () {
                    c(this)
                })
            },
            showPanel: function (a) {
                return a.each(function () {
                    h(this)
                })
            },
            hidePanel: function (a) {
                return a.each(function () {
                    i(this)
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).textbox("setText", "");
                    var b = a.data(this, "combo").options;
                    b.multiple ? a(this).combo("setValues", []) : a(this).combo("setValue", "")
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a.data(this, "combo").options;
                    b.multiple ? a(this).combo("setValues", b.originalValue) : a(this).combo("setValue", b.originalValue)
                })
            },
            setText: function (a, b) {
                return a.each(function () {
                    j(this, b)
                })
            },
            getValues: function (a) {
                return k(a[0])
            },
            setValues: function (a, b) {
                return a.each(function () {
                    l(this, b)
                })
            },
            getValue: function (a) {
                return m(a[0])
            },
            setValue: function (a, b) {
                return a.each(function () {
                    n(this, b)
                })
            }
        },
        a.fn.combo.parseOptions = function (b) {
            var c = a(b);
            return a.extend({}, a.fn.textbox.parseOptions(b), a.parser.parseOptions(b, ["separator", "panelAlign", {
                panelWidth: "number",
                hasDownArrow: "boolean",
                delay: "number",
                reversed: "boolean",
                multivalue: "boolean",
                selectOnNavigation: "boolean"
            },
            {
                panelMinWidth: "number",
                panelMaxWidth: "number",
                panelMinHeight: "number",
                panelMaxHeight: "number"
            }]), {
                panelHeight: "auto" == c.attr("panelHeight") ? "auto" : parseInt(c.attr("panelHeight")) || void 0,
                multiple: !! c.attr("multiple") || void 0
            })
        },
        a.fn.combo.defaults = a.extend({}, a.fn.textbox.defaults, {
            inputEvents: {
                click: f,
                keydown: g,
                paste: g,
                drop: g
            },
            panelWidth: null,
            panelHeight: 200,
            panelMinWidth: null,
            panelMaxWidth: null,
            panelMinHeight: null,
            panelMaxHeight: null,
            panelAlign: "left",
            reversed: !1,
            multiple: !1,
            multivalue: !0,
            selectOnNavigation: !0,
            separator: ",",
            hasDownArrow: !0,
            delay: 200,
            keyHandler: {
                up: function (a) {},
                down: function (a) {},
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {},
                query: function (a, b) {}
            },
            onShowPanel: function () {},
            onHidePanel: function () {},
            onChange: function (a, b) {}
        })
    }(jQuery),


function (a) {
        function b(b, c) {
            var d = a.data(b, "combobox");
            return a.easyui.indexOfArray(d.data, d.options.valueField, c)
        }
        function c(b, c) {
            var d = a.data(b, "combobox").options,
                e = a(b).combo("panel"),
                f = d.finder.getEl(b, c);
            if (f.length) if (f.position().top <= 0) {
                    var g = e.scrollTop() + f.position().top;
                    e.scrollTop(g)
                } else if (f.position().top + f.outerHeight() > e.height()) {
                    var g = e.scrollTop() + f.position().top + f.outerHeight() - e.height();
                    e.scrollTop(g)
                }
            e.triggerHandler("scroll")
        }
        function d(b, c) {
            var d = a.data(b, "combobox").options,
                f = a(b).combobox("panel"),
                g = f.children("div.combobox-item-hover");
            g.length || (g = f.children("div.combobox-item-selected")),
            g.removeClass("combobox-item-hover");
            var h = "div.combobox-item:visible:not(.combobox-item-disabled):first",
                i = "div.combobox-item:visible:not(.combobox-item-disabled):last";
            if (g.length ? "next" == c ? (g = g.nextAll(h), g.length || (g = f.children(h))) : (g = g.prevAll(h), g.length || (g = f.children(i))) : g = f.children("next" == c ? h : i), g.length) {
                    g.addClass("combobox-item-hover");
                    var j = d.finder.getRow(b, g);
                    j && (a(b).combobox("scrollTo", j[d.valueField]), d.selectOnNavigation && e(b, j[d.valueField]))
                }
        }
        function e(b, c, d) {
            var e = a.data(b, "combobox").options,
                f = a(b).combo("getValues");
            a.inArray(c + "", f) == -1 && (e.multiple ? f.push(c) : f = [c], g(b, f, d))
        }
        function f(b, c) {
            var d = (a.data(b, "combobox").options, a(b).combo("getValues")),
                e = a.inArray(c + "", d);
            e >= 0 && (d.splice(e, 1), g(b, d))
        }
        function g(b, c, d) {
            var e = a.data(b, "combobox").options,
                f = a(b).combo("panel");
            a.isArray(c) || (c = c.split(e.separator)),
            e.multiple || (c = c.length ? [c[0]] : [""]);
            var g = a(b).combo("getValues");
            f.is(":visible") && f.find(".combobox-item-selected").each(function () {
                    var c = e.finder.getRow(b, a(this));
                    c && a.easyui.indexOfArray(g, c[e.valueField]) == -1 && a(this).removeClass("combobox-item-selected")
                }),
            a.map(g, function (d) {
                    if (a.easyui.indexOfArray(c, d) == -1) {
                        var f = e.finder.getEl(b, d);
                        f.hasClass("combobox-item-selected") && (f.removeClass("combobox-item-selected"), e.onUnselect.call(b, e.finder.getRow(b, d)))
                    }
                });
            for (var h = null, i = [], j = [], k = 0; k < c.length; k++) {
                    var l = c[k],
                        m = l,
                        n = e.finder.getRow(b, l);
                    if (n) {
                            m = n[e.textField],
                            h = n;
                            var o = e.finder.getEl(b, l);
                            o.hasClass("combobox-item-selected") || (o.addClass("combobox-item-selected"), e.onSelect.call(b, n))
                        }
                    i.push(l),
                    j.push(m)
                }
            if (d || a(b).combo("setText", j.join(e.separator)), e.showItemIcon) {
                    var p = a(b).combobox("textbox");
                    p.removeClass("textbox-bgicon " + e.textboxIconCls),
                    h && h.iconCls && (p.addClass("textbox-bgicon " + h.iconCls), e.textboxIconCls = h.iconCls)
                }
            a(b).combo("setValues", i),
            f.triggerHandler("scroll")
        }
        function h(b, c, d) {
            var e = a.data(b, "combobox"),
                f = e.options;
            e.data = f.loadFilter.call(b, c),
            f.view.render.call(f.view, b, a(b).combo("panel"), e.data);
            var h = a(b).combobox("getValues");
            a.easyui.forEach(e.data, !1, function (b) {
                    b.selected && a.easyui.addArrayItem(h, b[f.valueField] + "")
                }),
            f.multiple ? g(b, h, d) : g(b, h.length ? [h[h.length - 1]] : [], d),
            f.onLoadSuccess.call(b, c)
        }
        function i(b, c, d, e) {
            var f = a.data(b, "combobox").options;
            c && (f.url = c),
            d = a.extend({}, f.queryParams, d || {}),
            0 != f.onBeforeLoad.call(b, d) && f.loader.call(b, d, function (a) {
                h(b, a, e)
            }, function () {
                f.onLoadError.apply(this, arguments)
            })
        }
        function j(b, c) {
            function d(a) {
                h.reversed ? j.addClass("combobox-item-hover") : g(b, h.multiple ? c ? a : [] : a, !0)
            }
            var f = a.data(b, "combobox"),
                h = f.options,
                j = a(),
                k = h.multiple ? c.split(h.separator) : [c];
            if ("remote" == h.mode) d(k),
            i(b, null, {
                    q: c
                }, !0);
            else {
                    var l = a(b).combo("panel");
                    l.find(".combobox-item-hover").removeClass("combobox-item-hover"),
                    l.find(".combobox-item,.combobox-group").hide();
                    var m = f.data,
                        n = [];
                    a.map(k, function (c) {
                            c = a.trim(c);
                            var d = c,
                                f = void 0;
                            j = a();
                            for (var g = 0; g < m.length; g++) {
                                    var i = m[g];
                                    if (h.filter.call(b, c, i)) {
                                        var k = i[h.valueField],
                                            l = i[h.textField],
                                            o = i[h.groupField],
                                            p = h.finder.getEl(b, k).show();
                                        l.toLowerCase() == c.toLowerCase() && (d = k, h.reversed ? j = p : e(b, k, !0)),
                                        h.groupField && f != o && (h.finder.getGroupEl(b, o).show(), f = o)
                                    }
                                }
                            n.push(d)
                        }),
                    d(n)
                }
        }
        function k(c) {
            var d = a(c),
                e = d.combobox("options"),
                f = d.combobox("panel"),
                g = f.children("div.combobox-item-hover");
            if (g.length) {
                    g.removeClass("combobox-item-hover");
                    var h = e.finder.getRow(c, g),
                        i = h[e.valueField];
                    e.multiple && g.hasClass("combobox-item-selected") ? d.combobox("unselect", i) : d.combobox("select", i)
                }
            var j = [];
            a.map(d.combobox("getValues"), function (a) {
                    b(c, a) >= 0 && j.push(a)
                }),
            d.combobox("setValues", j),
            e.multiple || d.combobox("hidePanel")
        }
        function l(b) {
            var c = a.data(b, "combobox"),
                d = c.options;
            a(b).addClass("combobox-f"),
            a(b).combo(a.extend({}, d, {
                    onShowPanel: function () {
                        a(this).combo("panel").find("div.combobox-item:hidden,div.combobox-group:hidden").show(),
                        g(this, a(this).combobox("getValues"), !0),
                        a(this).combobox("scrollTo", a(this).combobox("getValue")),
                        d.onShowPanel.call(this)
                    }
                }));
            var e = a(b).combo("panel");
            e.unbind(".combobox");
            for (var f in d.panelEvents) e.bind(f + ".combobox", {
                    target: b
                }, d.panelEvents[f])
        }
        function m(b) {
            a(this).children("div.combobox-item-hover").removeClass("combobox-item-hover");
            var c = a(b.target).closest("div.combobox-item");
            c.hasClass("combobox-item-disabled") || c.addClass("combobox-item-hover"),
            b.stopPropagation()
        }
        function n(b) {
            a(b.target).closest("div.combobox-item").removeClass("combobox-item-hover"),
            b.stopPropagation()
        }
        function o(b) {
            var c = a(this).panel("options").comboTarget;
            if (c) {
                var d = a(c).combobox("options"),
                    g = a(b.target).closest("div.combobox-item");
                if (g.length && !g.hasClass("combobox-item-disabled")) {
                        var h = d.finder.getRow(c, g);
                        if (h) {
                            d.blurTimer && (clearTimeout(d.blurTimer), d.blurTimer = null),
                            d.onClick.call(c, h);
                            var i = h[d.valueField];
                            d.multiple ? g.hasClass("combobox-item-selected") ? f(c, i) : e(c, i) : a(c).combobox("setValue", i).combobox("hidePanel"),
                            b.stopPropagation()
                        }
                    }
            }
        }
        function p(b) {
            var c = a(this).panel("options").comboTarget;
            if (c) {
                var d = a(c).combobox("options");
                if ("sticky" == d.groupPosition) {
                    var e = a(this).children(".combobox-stick");
                    e.length || (e = a('<div class="combobox-stick"></div>').appendTo(this)),
                    e.hide();
                    var f = a(c).data("combobox");
                    a(this).children(".combobox-group:visible").each(function () {
                        var b = a(this),
                            g = d.finder.getGroup(c, b),
                            h = f.data[g.startIndex + g.count - 1],
                            i = d.finder.getEl(c, h[d.valueField]);
                        if (b.position().top < 0 && i.position().top > 0) return e.show().html(b.html()),
                        !1
                    })
                }
            }
        }
        a.fn.combobox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.combobox.methods[b];
                return d ? d(this, c) : this.combo(b, c)
            }
            return b = b || {},
            this.each(function () {
                var c = a.data(this, "combobox");
                if (c ? a.extend(c.options, b) : c = a.data(this, "combobox", {
                    options: a.extend({}, a.fn.combobox.defaults, a.fn.combobox.parseOptions(this), b),
                    data: []
                }), l(this), c.options.data) h(this, c.options.data);
                else {
                    var d = a.fn.combobox.parseData(this);
                    d.length && h(this, d)
                }
                i(this)
            })
        },
        a.fn.combobox.methods = {
            options: function (b) {
                var c = b.combo("options");
                return a.extend(a.data(b[0], "combobox").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    a(this).combo("cloneFrom", c),
                    a.data(this, "combobox", a(c).data("combobox")),
                    a(this).addClass("combobox-f").attr("comboboxName", a(this).attr("textboxName"))
                })
            },
            getData: function (b) {
                return a.data(b[0], "combobox").data
            },
            setValues: function (a, b) {
                return a.each(function () {
                    g(this, b)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    g(this, a.isArray(c) ? c : [c])
                })
            },
            clear: function (a) {
                return a.each(function () {
                    g(this, [])
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).combobox("options");
                    b.multiple ? a(this).combobox("setValues", b.originalValue) : a(this).combobox("setValue", b.originalValue)
                })
            },
            loadData: function (a, b) {
                return a.each(function () {
                    h(this, b)
                })
            },
            reload: function (b, c) {
                return b.each(function () {
                    if ("string" == typeof c) i(this, c);
                    else {
                        if (c) {
                            var b = a(this).combobox("options");
                            b.queryParams = c
                        }
                        i(this)
                    }
                })
            },
            select: function (a, b) {
                return a.each(function () {
                    e(this, b)
                })
            },
            unselect: function (a, b) {
                return a.each(function () {
                    f(this, b)
                })
            },
            scrollTo: function (a, b) {
                return a.each(function () {
                    c(this, b)
                })
            }
        },
        a.fn.combobox.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.combo.parseOptions(b), a.parser.parseOptions(b, ["valueField", "textField", "groupField", "groupPosition", "mode", "method", "url", {
                showItemIcon: "boolean",
                limitToList: "boolean"
            }]))
        },
        a.fn.combobox.parseData = function (b) {
            function c(b, c) {
                var f = a(b),
                    g = {};
                g[e.valueField] = void 0 != f.attr("value") ? f.attr("value") : f.text(),
                g[e.textField] = f.text(),
                g.selected = f.is(":selected"),
                g.disabled = f.is(":disabled"),
                c && (e.groupField = e.groupField || "group", g[e.groupField] = c),
                d.push(g)
            }
            var d = [],
                e = a(b).combobox("options");
            return a(b).children().each(function () {
                    if ("optgroup" == this.tagName.toLowerCase()) {
                        var b = a(this).attr("label");
                        a(this).children().each(function () {
                            c(this, b)
                        })
                    } else c(this)
                }),
            d
        };
        var q = 0,
            r = {
                render: function (b, c, d) {
                    var e = a.data(b, "combobox"),
                        f = e.options;
                    q++,
                    e.itemIdPrefix = "_easyui_combobox_i" + q,
                    e.groupIdPrefix = "_easyui_combobox_g" + q,
                    e.groups = [];
                    for (var g = [], h = void 0, i = 0; i < d.length; i++) {
                            var j = d[i],
                                k = (j[f.valueField] + "", j[f.textField]),
                                l = j[f.groupField];
                                
                            l ? h != l ? (h = l, e.groups.push({
                                    value: l,
                                    startIndex: i,
                                    count: 1
                                }), g.push('<div id="' + (e.groupIdPrefix + "_" + (e.groups.length - 1)) + '" class="combobox-group">'), g.push(f.groupFormatter ? f.groupFormatter.call(b, l) : l), g.push("</div>")) : e.groups[e.groups.length - 1].count++ : h = void 0;
                            var m = "combobox-item" + (j.disabled ? " combobox-item-disabled" : "") + (l ? " combobox-gitem" : "");
                            g.push('<div id="' + (e.itemIdPrefix + "_" + i) + '" class="' + m + '" style="word-break: keep-all">'),
                            f.showItemIcon && j.iconCls && g.push('<span class="combobox-icon ' + j.iconCls + '"></span>'),
                            g.push(f.formatter ? f.formatter.call(b, j) : k),
                            g.push("</div>")
                        }
                    a(c).html(g.join(""))
                }
            };
        a.fn.combobox.defaults = a.extend({}, a.fn.combo.defaults, {
                valueField: "value",
                textField: "text",
                groupPosition: "static",
                groupField: null,
                groupFormatter: function (a) {
                    return a
                },
                mode: "local",
                method: "post",
                url: null,
                data: null,
                queryParams: {},
                showItemIcon: !1,
                limitToList: !1,
                view: r,
                keyHandler: {
                    up: function (a) {
                        d(this, "prev"),
                        a.preventDefault()
                    },
                    down: function (a) {
                        d(this, "next"),
                        a.preventDefault()
                    },
                    left: function (a) {},
                    right: function (a) {},
                    enter: function (a) {
                        k(this)
                    },
                    query: function (a, b) {
                        j(this, a)
                    }
                },
                inputEvents: a.extend({}, a.fn.combo.defaults.inputEvents, {
                    blur: function (b) {
                        var c = b.data.target,
                            d = a(c).combobox("options");
                            (d.reversed || d.limitToList) && (d.blurTimer && clearTimeout(d.blurTimer), d.blurTimer = setTimeout(function () {
                                var b = a(c).parent().length;
                                b && (d.reversed ? a(c).combobox("setValues", a(c).combobox("getValues")) : d.limitToList && k(c), d.blurTimer = null)
                            }, 50))
                    }
                }),
                panelEvents: {
                    mouseover: m,
                    mouseout: n,
                    click: o,
                    scroll: p
                },
                filter: function (b, c) {
                    var d = a(this).combobox("options");
                    return c[d.textField].toLowerCase().indexOf(b.toLowerCase()) >= 0
                },
                formatter: function (b) {
                    var c = a(this).combobox("options");
                    return b[c.textField]
                },
                loader: function (b, c, d) {
                    var e = a(this).combobox("options");
                    return !!e.url && void a.ajax({
                        type: e.method,
                        url: e.url,
                        data: b,
                        dataType: "json",
                        success: function (a) {
                            c(a)
                        },
                        error: function () {
                            d.apply(this, arguments)
                        }
                    })
                },
                loadFilter: function (a) {
                    return a
                },
                finder: {
                    getEl: function (c, d) {
                        var e = b(c, d),
                            f = a.data(c, "combobox").itemIdPrefix + "_" + e;
                        return a("#" + f)
                    },
                    getGroupEl: function (b, c) {
                        var d = a.data(b, "combobox"),
                            e = a.easyui.indexOfArray(d.groups, "value", c),
                            f = d.groupIdPrefix + "_" + e;
                        return a("#" + f)
                    },
                    getGroup: function (b, c) {
                        var d = a.data(b, "combobox"),
                            e = c.attr("id").substr(d.groupIdPrefix.length + 1);
                        return d.groups[parseInt(e)]
                    },
                    getRow: function (c, d) {
                        var e = a.data(c, "combobox"),
                            f = d instanceof a ? d.attr("id").substr(e.itemIdPrefix.length + 1) : b(c, d);
                        return e.data[parseInt(f)]
                    }
                },
                onBeforeLoad: function (a) {},
                onLoadSuccess: function (a) {},
                onLoadError: function () {},
                onSelect: function (a) {},
                onUnselect: function (a) {},
                onClick: function (a) {}
            })
    }(jQuery),


function (a) {
        function b(b) {
            var e = a.data(b, "combotree"),
                f = e.options,
                g = e.tree;
            a(b).addClass("combotree-f"),
            a(b).combo(a.extend({}, f, {
                    onShowPanel: function () {
                        f.editable && g.tree("doFilter", ""),
                        f.onShowPanel.call(this)
                    }
                }));
            var h = a(b).combo("panel");
            g || (g = a("<ul></ul>").appendTo(h), e.tree = g),
            g.tree(a.extend({}, f, {
                    checkbox: f.multiple,
                    onLoadSuccess: function (c, h) {
                        var i = a(b).combotree("getValues");
                        f.multiple && a.map(g.tree("getChecked"), function (b) {
                            a.easyui.addArrayItem(i, b.id)
                        }),
                        d(b, i, e.remainText),
                        f.onLoadSuccess.call(this, c, h)
                    },
                    onClick: function (d) {
                        f.multiple ? a(this).tree(d.checked ? "uncheck" : "check", d.target) : a(b).combo("hidePanel"),
                        e.remainText = !1,
                        c(b),
                        f.onClick.call(this, d)
                    },
                    onCheck: function (a, d) {
                        e.remainText = !1,
                        c(b),
                        f.onCheck.call(this, a, d)
                    }
                }))
        }
        function c(b) {
            var c = a.data(b, "combotree"),
                e = c.options,
                f = c.tree,
                g = [];
            if (e.multiple) g = a.map(f.tree("getChecked"), function (a) {
                    return a.id
                });
            else {
                    var h = f.tree("getSelected");
                    h && g.push(h.id)
                }
            g = g.concat(e.unselectedValues),
            d(b, g, c.remainText)
        }
        function d(b, c, d) {
            function e(b, c) {
                var d = a.easyui.getArrayItem(c, "id", b);
                return d ? f(d) : void 0
            }
            function f(a) {
                return a[h.textField || ""] || a.text
            }
            var g = a.data(b, "combotree"),
                h = g.options,
                i = g.tree,
                j = i.tree("options"),
                k = j.onBeforeCheck,
                l = j.onCheck,
                m = j.onSelect;
            j.onBeforeCheck = j.onCheck = j.onSelect = function () {},
            a.isArray(c) || (c = c.split(h.separator)),
            h.multiple || (c = c.length ? [c[0]] : [""]);
            var n = a.map(c, function (a) {
                    return String(a)
                });
            i.find("div.tree-node-selected").removeClass("tree-node-selected"),
            a.map(i.tree("getChecked"), function (b) {
                    a.inArray(String(b.id), n) == -1 && i.tree("uncheck", b.target)
                });
            var o = [];
            if (h.unselectedValues = [], a.map(n, function (a) {
                    var b = i.tree("find", a);
                    b ? (i.tree("check", b.target).tree("select", b.target), o.push(f(b))) : (o.push(e(a, h.mappingRows) || a), h.unselectedValues.push(a))
                }), h.multiple && a.map(i.tree("getChecked"), function (b) {
                    var c = String(b.id);
                    a.inArray(c, n) == -1 && (n.push(c), o.push(f(b)))
                }), j.onBeforeCheck = k, j.onCheck = l, j.onSelect = m, !d) {
                    var p = o.join(h.separator);
                    a(b).combo("getText") != p && a(b).combo("setText", p)
                }
            a(b).combo("setValues", n)
        }
        function e(b, c) {
            var d = a.data(b, "combotree"),
                e = d.options,
                f = d.tree;
            d.remainText = !0,
            f.tree("doFilter", e.multiple ? c.split(e.separator) : c)
        }
        function f(b) {
            var c = a.data(b, "combotree");
            c.remainText = !1,
            a(b).combotree("setValues", a(b).combotree("getValues")),
            a(b).combotree("hidePanel")
        }
        a.fn.combotree = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.combotree.methods[c];
                return e ? e(this, d) : this.combo(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "combotree");
                d ? a.extend(d.options, c) : a.data(this, "combotree", {
                    options: a.extend({}, a.fn.combotree.defaults, a.fn.combotree.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.combotree.methods = {
            options: function (b) {
                var c = b.combo("options");
                return a.extend(a.data(b[0], "combotree").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            clone: function (b, c) {
                var d = b.combo("clone", c);
                return d.data("combotree", {
                    options: a.extend(!0, {}, b.combotree("options")),
                    tree: b.combotree("tree")
                }),
                d
            },
            tree: function (b) {
                return a.data(b[0], "combotree").tree
            },
            loadData: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "combotree").options;
                    b.data = c;
                    var d = a.data(this, "combotree").tree;
                    d.tree("loadData", c)
                })
            },
            reload: function (b, c) {
                return b.each(function () {
                    var b = a.data(this, "combotree").options,
                        d = a.data(this, "combotree").tree;
                    c && (b.url = c),
                    d.tree({
                            url: b.url
                        })
                })
            },
            setValues: function (b, c) {
                return b.each(function () {
                    var b = a(this).combotree("options");
                    a.isArray(c) && (c = a.map(c, function (c) {
                        return c && "object" == typeof c ? (a.easyui.addArrayItem(b.mappingRows, "id", c), c.id) : c
                    })),
                    d(this, c)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    a(this).combotree("setValues", a.isArray(c) ? c : [c])
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).combotree("setValues", [])
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).combotree("options");
                    b.multiple ? a(this).combotree("setValues", b.originalValue) : a(this).combotree("setValue", b.originalValue)
                })
            }
        },
        a.fn.combotree.parseOptions = function (b) {
            return a.extend({}, a.fn.combo.parseOptions(b), a.fn.tree.parseOptions(b))
        },
        a.fn.combotree.defaults = a.extend({}, a.fn.combo.defaults, a.fn.tree.defaults, {
            editable: !1,
            textField: null,
            unselectedValues: [],
            mappingRows: [],
            keyHandler: {
                up: function (a) {},
                down: function (a) {},
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {
                    f(this)
                },
                query: function (a, b) {
                    e(this, a)
                }
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            function c(c) {
                return a(c).closest(".combo-panel").panel("options").comboTarget || b
            }
            function e(b) {
                var e = c(this),
                    f = a(e).data("combogrid"),
                    g = f.options,
                    h = a(e).combo("getValues");
                d(e, h, f.remainText),
                g.onLoadSuccess.call(this, b)
            }
            function f(b, d) {
                var e = c(this),
                    f = a(e).data("combogrid"),
                    g = f.options;
                f.remainText = !1,
                h.call(this),
                g.multiple || a(e).combo("hidePanel"),
                g.onClickRow.call(this, b, d)
            }
            function g(b) {
                return function (d, e) {
                    var f = c(this),
                        g = a(f).combogrid("options");
                    "onUnselectAll" == b ? g.multiple && h.call(this) : h.call(this),
                    g[b].call(this, d, e)
                }
            }
            function h() {
                var b = a(this),
                    e = c(b),
                    f = a(e).data("combogrid"),
                    g = f.options,
                    h = a.map(b.datagrid("getSelections"), function (a) {
                        return a[g.idField]
                    });
                h = h.concat(g.unselectedValues),
                d(e, h, f.remainText)
            }
            var i = a.data(b, "combogrid"),
                j = i.options,
                k = i.grid;
            a(b).addClass("combogrid-f").combo(a.extend({}, j, {
                    onShowPanel: function () {
                        d(this, a(this).combogrid("getValues"), !0);
                        var b = a(this).combogrid("panel"),
                            c = b.outerHeight() - b.height(),
                            e = b._size("minHeight"),
                            f = b._size("maxHeight"),
                            g = a(this).combogrid("grid");
                        g.datagrid("resize", {
                                width: "100%",
                                height: isNaN(parseInt(j.panelHeight)) ? "auto" : "100%",
                                minHeight: e ? e - c : "",
                                maxHeight: f ? f - c : ""
                            });
                        var h = g.datagrid("getSelected");
                        h && g.datagrid("scrollTo", g.datagrid("getRowIndex", h)),
                        j.onShowPanel.call(this)
                    }
                }));
            var l = a(b).combo("panel");
            k || (k = a("<table></table>").appendTo(l), i.grid = k),
            k.datagrid(a.extend({}, j, {
                    border: !1,
                    singleSelect: !j.multiple,
                    onLoadSuccess: e,
                    onClickRow: f,
                    onSelect: g("onSelect"),
                    onUnselect: g("onUnselect"),
                    onSelectAll: g("onSelectAll"),
                    onUnselectAll: g("onUnselectAll")
                }))
        }
        function c(b, c) {
            var d = a.data(b, "combogrid"),
                e = d.options,
                f = d.grid,
                g = f.datagrid("getRows").length;
            if (g) {
                    var h = e.finder.getTr(f[0], null, "highlight");
                    h.length || (h = e.finder.getTr(f[0], null, "selected"));
                    var i;
                    if (h.length) {
                        var i = parseInt(h.attr("datagrid-row-index"));
                        i += "next" == c ? 1 : -1,
                        i < 0 && (i = g - 1),
                        i >= g && (i = 0)
                    } else i = "next" == c ? 0 : g - 1;
                    f.datagrid("highlightRow", i),
                    e.selectOnNavigation && (d.remainText = !1, f.datagrid("selectRow", i))
                }
        }
        function d(b, c, d) {
            function e(b, c) {
                var d = a.easyui.getArrayItem(c, g.idField, b);
                return d ? d[g.textField] : void 0
            }
            var f = a.data(b, "combogrid"),
                g = f.options,
                h = f.grid,
                i = a(b).combo("getValues"),
                j = a(b).combo("options"),
                k = j.onChange;
            j.onChange = function () {};
            var l = h.datagrid("options"),
                m = l.onSelect,
                n = l.onUnselectAll;
            l.onSelect = l.onUnselectAll = function () {},
            a.isArray(c) || (c = c.split(g.separator)),
            g.multiple || (c = c.length ? [c[0]] : [""]);
            var o = a.map(c, function (a) {
                    return String(a)
                });
            o = a.grep(o, function (b, c) {
                    return c === a.inArray(b, o)
                });
            var p = a.grep(h.datagrid("getSelections"), function (b, c) {
                    return a.inArray(String(b[g.idField]), o) >= 0
                });
            h.datagrid("clearSelections"),
            h.data("datagrid").selectedRows = p;
            var q = [];
            if (g.unselectedValues = [], a.map(o, function (a) {
                    var b = h.datagrid("getRowIndex", a);
                    b >= 0 ? h.datagrid("selectRow", b) : g.unselectedValues.push(a),
                    q.push(e(a, h.datagrid("getRows")) || e(a, p) || e(a, g.mappingRows) || a)
                }), a(b).combo("setValues", i), j.onChange = k, l.onSelect = m, l.onUnselectAll = n, !d) {
                    var r = q.join(g.separator);
                    a(b).combo("getText") != r && a(b).combo("setText", r)
                }
            a(b).combo("setValues", c)
        }
        function e(b, c) {
            function e(a, b) {
                for (var c = 0; c < a.length; c++) {
                    var d = a[c];
                    if ((d[h.textField] || "").toLowerCase() == b.toLowerCase()) return l.push(d[h.idField]),
                    c
                }
                return -1
            }
            function f(a) {
                h.reversed || d(b, a, !0)
            }
            var g = a.data(b, "combogrid"),
                h = g.options,
                i = g.grid;
            g.remainText = !0;
            var j = h.multiple ? c.split(h.separator) : [c];
            if (j = a.grep(j, function (b) {
                    return "" != a.trim(b)
                }), "remote" == h.mode) f(j),
            i.datagrid("load", a.extend({}, h.queryParams, {
                    q: c
                }));
            else {
                    i.datagrid("highlightRow", -1);
                    var k = i.datagrid("getRows"),
                        l = [];
                    a.map(j, function (c) {
                            c = a.trim(c);
                            e(h.mappingRows, c),
                            e(i.datagrid("getSelections"), c);
                            var d = e(k, c);
                            d >= 0 ? h.reversed && i.datagrid("highlightRow", d) : a.map(k, function (a, d) {
                                h.filter.call(b, c, a) && i.datagrid("highlightRow", d)
                            })
                        }),
                    f(l)
                }
        }
        function f(b) {
            var c = a.data(b, "combogrid"),
                d = c.options,
                e = c.grid,
                f = d.finder.getTr(e[0], null, "highlight");
            if (c.remainText = !1, f.length) {
                    var g = parseInt(f.attr("datagrid-row-index"));
                    d.multiple && f.hasClass("datagrid-row-selected") ? e.datagrid("unselectRow", g) : e.datagrid("selectRow", g)
                }
            var h = [];
            a.map(e.datagrid("getSelections"), function (a) {
                    h.push(a[d.idField])
                }),
            a.map(d.unselectedValues, function (b) {
                    a.easyui.indexOfArray(d.mappingRows, d.idField, b) >= 0 && a.easyui.addArrayItem(h, b)
                }),
            a(b).combogrid("setValues", h),
            d.multiple || a(b).combogrid("hidePanel")
        }
        a.fn.combogrid = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.combogrid.methods[c];
                return e ? e(this, d) : this.combo(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "combogrid");
                d ? a.extend(d.options, c) : d = a.data(this, "combogrid", {
                    options: a.extend({}, a.fn.combogrid.defaults, a.fn.combogrid.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.combogrid.methods = {
            options: function (b) {
                var c = b.combo("options");
                return a.extend(a.data(b[0], "combogrid").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    a(this).combo("cloneFrom", c),
                    a.data(this, "combogrid", {
                        options: a.extend(!0, {
                            cloned: !0
                        }, a(c).combogrid("options")),
                        combo: a(this).next(),
                        panel: a(c).combo("panel"),
                        grid: a(c).combogrid("grid")
                    })
                })
            },
            grid: function (b) {
                return a.data(b[0], "combogrid").grid
            },
            setValues: function (b, c) {
                return b.each(function () {
                    var b = a(this).combogrid("options");
                    a.isArray(c) && (c = a.map(c, function (c) {
                        return c && "object" == typeof c ? (a.easyui.addArrayItem(b.mappingRows, b.idField, c), c[b.idField]) : c
                    })),
                    d(this, c)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    a(this).combogrid("setValues", a.isArray(c) ? c : [c])
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).combogrid("setValues", [])
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).combogrid("options");
                    b.multiple ? a(this).combogrid("setValues", b.originalValue) : a(this).combogrid("setValue", b.originalValue)
                })
            }
        },
        a.fn.combogrid.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.combo.parseOptions(b), a.fn.datagrid.parseOptions(b), a.parser.parseOptions(b, ["idField", "textField", "mode"]))
        },
        a.fn.combogrid.defaults = a.extend({}, a.fn.combo.defaults, a.fn.datagrid.defaults, {
            loadMsg: null,
            idField: null,
            textField: null,
            unselectedValues: [],
            mappingRows: [],
            mode: "local",
            keyHandler: {
                up: function (a) {
                    c(this, "prev"),
                    a.preventDefault()
                },
                down: function (a) {
                    c(this, "next"),
                    a.preventDefault()
                },
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {
                    f(this)
                },
                query: function (a, b) {
                    e(this, a)
                }
            },
            inputEvents: a.extend({}, a.fn.combo.defaults.inputEvents, {
                blur: function (b) {
                    var c = b.data.target,
                        d = a(c).combogrid("options");
                    d.reversed && a(c).combogrid("setValues", a(c).combogrid("getValues"))
                }
            }),
            filter: function (b, c) {
                var d = a(this).combogrid("options");
                return (c[d.textField] || "").toLowerCase().indexOf(b.toLowerCase()) >= 0
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            var e = a.data(b, "combotreegrid"),
                f = e.options;
            if (a(b).addClass("combotreegrid-f").combo(a.extend({}, f, {
                    onShowPanel: function () {
                        var b = a(this).combotreegrid("panel"),
                            c = b.outerHeight() - b.height(),
                            d = b._size("minHeight"),
                            e = b._size("maxHeight"),
                            g = a(this).combotreegrid("grid");
                        g.treegrid("resize", {
                                width: "100%",
                                height: isNaN(parseInt(f.panelHeight)) ? "auto" : "100%",
                                minHeight: d ? d - c : "",
                                maxHeight: e ? e - c : ""
                            });
                        var h = g.treegrid("getSelected");
                        h && g.treegrid("scrollTo", h[f.idField]),
                        f.onShowPanel.call(this)
                    }
                })), !e.grid) {
                    var g = a(b).combo("panel");
                    e.grid = a("<table></table>").appendTo(g)
                }
            e.grid.treegrid(a.extend({}, f, {
                    border: !1,
                    checkbox: f.multiple,
                    onLoadSuccess: function (c, g) {
                        var h = a(b).combotreegrid("getValues");
                        f.multiple && a.map(a(this).treegrid("getCheckedNodes"), function (b) {
                            a.easyui.addArrayItem(h, b[f.idField])
                        }),
                        d(b, h),
                        f.onLoadSuccess.call(this, c, g),
                        e.remainText = !1
                    },
                    onClickRow: function (d) {
                        f.multiple ? (a(this).treegrid(d.checked ? "uncheckNode" : "checkNode", d[f.idField]), a(this).treegrid("unselect", d[f.idField])) : a(b).combo("hidePanel"),
                        c(b),
                        f.onClickRow.call(this, d)
                    },
                    onCheckNode: function (a, d) {
                        c(b),
                        f.onCheckNode.call(this, a, d)
                    }
                }))
        }
        function c(b) {
            var c = a.data(b, "combotreegrid"),
                e = c.options,
                f = c.grid,
                g = [];
            if (e.multiple) g = a.map(f.treegrid("getCheckedNodes"), function (a) {
                    return a[e.idField]
                });
            else {
                    var h = f.treegrid("getSelected");
                    h && g.push(h[e.idField])
                }
            g = g.concat(e.unselectedValues),
            d(b, g)
        }
        function d(b, c) {
            function d(b, c) {
                var d = a.easyui.getArrayItem(c, g.idField, b);
                return d ? e(d) : void 0
            }
            function e(a) {
                return a[g.textField || ""] || a[g.treeField]
            }
            var f = a.data(b, "combotreegrid"),
                g = f.options,
                h = f.grid;
            a.isArray(c) || (c = c.split(g.separator)),
            g.multiple || (c = c.length ? [c[0]] : [""]);
            var i = a.map(c, function (a) {
                    return String(a)
                });
            i = a.grep(i, function (b, c) {
                    return c === a.inArray(b, i)
                });
            var j = h.treegrid("getSelected");
            j && h.treegrid("unselect", j[g.idField]),
            a.map(h.treegrid("getCheckedNodes"), function (b) {
                    a.inArray(String(b[g.idField]), i) == -1 && h.treegrid("uncheckNode", b[g.idField])
                });
            var k = [];
            if (g.unselectedValues = [], a.map(i, function (a) {
                    var b = h.treegrid("find", a);
                    b ? (g.multiple ? h.treegrid("checkNode", a) : h.treegrid("select", a), k.push(e(b))) : (k.push(d(a, g.mappingRows) || a), g.unselectedValues.push(a))
                }), g.multiple && a.map(h.treegrid("getCheckedNodes"), function (b) {
                    var c = String(b[g.idField]);
                    a.inArray(c, i) == -1 && (i.push(c), k.push(e(b)))
                }), !f.remainText) {
                    var l = k.join(g.separator);
                    a(b).combo("getText") != l && a(b).combo("setText", l)
                }
            a(b).combo("setValues", i)
        }
        function e(b, c) {
            var e = a.data(b, "combotreegrid"),
                f = e.options,
                g = e.grid;
            if (e.remainText = !0, g.treegrid("clearSelections").treegrid("clearChecked").treegrid("highlightRow", -1), "remote" == f.mode) a(b).combotreegrid("clear"),
            g.treegrid("load", a.extend({}, f.queryParams, {
                    q: c
                }));
            else if (c) {
                    var h = g.treegrid("getData"),
                        i = [],
                        j = f.multiple ? c.split(f.separator) : [c];
                    a.map(j, function (c) {
                            if (c = a.trim(c)) {
                                var d = void 0;
                                a.easyui.forEach(h, !0, function (a) {
                                    return c.toLowerCase() == String(a[f.treeField]).toLowerCase() ? (d = a[f.idField], !1) : f.filter.call(b, c, a) ? (g.treegrid("expandTo", a[f.idField]), g.treegrid("highlightRow", a[f.idField]), !1) : void 0
                                }),
                                void 0 == d && a.easyui.forEach(f.mappingRows, !1, function (a) {
                                    if (c.toLowerCase() == String(a[f.treeField])) return d = a[f.idField],
                                    !1
                                }),
                                void 0 != d && i.push(d)
                            }
                        }),
                    d(b, i),
                    e.remainText = !1
                }
        }
        function f(a) {
            c(a)
        }
        a.fn.combotreegrid = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.combotreegrid.methods[c];
                return e ? e(this, d) : this.combo(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "combotreegrid");
                d ? a.extend(d.options, c) : d = a.data(this, "combotreegrid", {
                    options: a.extend({}, a.fn.combotreegrid.defaults, a.fn.combotreegrid.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.combotreegrid.methods = {
            options: function (b) {
                var c = b.combo("options");
                return a.extend(a.data(b[0], "combotreegrid").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            grid: function (b) {
                return a.data(b[0], "combotreegrid").grid
            },
            setValues: function (b, c) {
                return b.each(function () {
                    var b = a(this).combotreegrid("options");
                    a.isArray(c) && (c = a.map(c, function (c) {
                        return c && "object" == typeof c ? (a.easyui.addArrayItem(b.mappingRows, b.idField, c), c[b.idField]) : c
                    })),
                    d(this, c)
                })
            },
            setValue: function (b, c) {
                return b.each(function () {
                    a(this).combotreegrid("setValues", a.isArray(c) ? c : [c])
                })
            },
            clear: function (b) {
                return b.each(function () {
                    a(this).combotreegrid("setValues", [])
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).combotreegrid("options");
                    b.multiple ? a(this).combotreegrid("setValues", b.originalValue) : a(this).combotreegrid("setValue", b.originalValue)
                })
            }
        },
        a.fn.combotreegrid.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.combo.parseOptions(b), a.fn.treegrid.parseOptions(b), a.parser.parseOptions(b, ["mode", {
                limitToGrid: "boolean"
            }]))
        },
        a.fn.combotreegrid.defaults = a.extend({}, a.fn.combo.defaults, a.fn.treegrid.defaults, {
            editable: !1,
            singleSelect: !0,
            limitToGrid: !1,
            unselectedValues: [],
            mappingRows: [],
            mode: "local",
            textField: null,
            keyHandler: {
                up: function (a) {},
                down: function (a) {},
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {
                    f(this)
                },
                query: function (a, b) {
                    e(this, a)
                }
            },
            inputEvents: a.extend({}, a.fn.combo.defaults.inputEvents, {
                blur: function (b) {
                    var c = b.data.target,
                        d = a(c).combotreegrid("options");
                    d.limitToGrid && f(c)
                }
            }),
            filter: function (b, c) {
                var d = a(this).combotreegrid("options");
                return (c[d.treeField] || "").toLowerCase().indexOf(b.toLowerCase()) >= 0
            }
        })
    }(jQuery),


function (a) {
        function b(b) {
            function d() {
                a(b).next().find(".tagbox-label").remove();
                var d = a(b).tagbox("textbox");
                a.map(a(b).tagbox("getValues"), function (c, e) {
                    var f = g.finder.getRow(b, c),
                        h = g.tagFormatter.call(b, c, f),
                        i = {},
                        j = g.tagStyler.call(b, c, f) || "";
                    i = "string" == typeof j ? {
                            s: j
                        } : {
                            c: j.class || "",
                            s: j.style || ""
                        };
                    var k = a('<span class="tagbox-label"></span>').insertBefore(d).html(h);
                    k.attr("tagbox-index", e),
                    k.attr("style", i.s).addClass(i.c),
                    a('<a href="javascript:;" class="tagbox-remove"></a>').appendTo(k)
                }),
                c(b),
                a(b).combobox("setText", "")
            }
            var f = a.data(b, "tagbox"),
                g = f.options;
            a(b).addClass("tagbox-f").combobox(a.extend({}, g, {
                    cls: "tagbox",
                    reversed: !0,
                    onChange: function (c, e) {
                        d(),
                        a(this).combobox("hidePanel"),
                        g.onChange.call(b, c, e)
                    },
                    onResizing: function (d, f) {
                        var h = a(this).combobox("textbox"),
                            i = a(this).data("textbox").textbox;
                        i.css({
                                height: "",
                                paddingLeft: h.css("marginLeft"),
                                paddingRight: h.css("marginRight")
                            }),
                        h.css("margin", 0),
                        i._size({
                                width: g.width
                            }, a(this).parent()),
                        e(b),
                        c(this),
                        g.onResizing.call(b, d, f)
                    },
                    onLoadSuccess: function (a) {
                        d(),
                        g.onLoadSuccess.call(b, a)
                    }
                })),
            d(),
            e(b)
        }
        function c(b, c) {
            var d = a(b).next(),
                e = c ? a(c) : d.find(".tagbox-label");
            if (e.length) {
                    var f = a(b).tagbox("textbox"),
                        g = a(e[0]),
                        h = g.outerHeight(!0) - g.outerHeight(),
                        i = f.outerHeight() - 2 * h;
                    e.css({
                            height: i + "px",
                            lineHeight: i + "px"
                        });
                    var j = d.find(".textbox-addon").css("height", "100%");
                    j.find(".textbox-icon").css("height", "100%"),
                    d.find(".textbox-button").linkbutton("resize", {
                            height: "100%"
                        })
                }
        }
        function d(b) {
            var c = a(b).next();
            c.unbind(".tagbox").bind("click.tagbox", function (c) {
                var d = a(b).tagbox("options");
                if (!d.disabled && !d.readonly) {
                    if (a(c.target).hasClass("tagbox-remove")) {
                        var e = parseInt(a(c.target).parent().attr("tagbox-index")),
                            f = a(b).tagbox("getValues");
                        if (0 == d.onBeforeRemoveTag.call(b, f[e])) return;
                        d.onRemoveTag.call(b, f[e]),
                        f.splice(e, 1),
                        a(b).tagbox("setValues", f)
                    } else {
                        var g = a(c.target).closest(".tagbox-label");
                        if (g.length) {
                            var e = parseInt(g.attr("tagbox-index")),
                                f = a(b).tagbox("getValues");
                            d.onClickTag.call(b, f[e])
                        }
                    }
                    a(this).find(".textbox-text").focus()
                }
            }).bind("keyup.tagbox", function (a) {
                e(b)
            }).bind("mouseover.tagbox", function (b) {
                a(b.target).closest(".textbox-button,.textbox-addon,.tagbox-label").length ? a(this).triggerHandler("mouseleave") : a(this).find(".textbox-text").triggerHandler("mouseenter")
            }).bind("mouseleave.tagbox", function (b) {
                a(this).find(".textbox-text").triggerHandler("mouseleave")
            })
        }
        function e(b) {
            function c(a) {
                var b = a.replace(/&/g, "&amp;").replace(/\s/g, " ").replace(/</g, "&lt;").replace(/>/g, "&gt;");
                return g.html(b),
                g.outerWidth()
            }
            var d = a(b).tagbox("options"),
                e = a(b).tagbox("textbox"),
                f = a(b).next(),
                g = a("<span></span>").appendTo("body");
            g.attr("style", e.attr("style")),
            g.css({
                    position: "absolute",
                    top: -9999,
                    left: -9999,
                    width: "auto",
                    fontFamily: e.css("fontFamily"),
                    fontSize: e.css("fontSize"),
                    fontWeight: e.css("fontWeight"),
                    whiteSpace: "nowrap"
                });
            var h = c(e.val()),
                i = c(d.prompt || "");
            g.remove();
            var j = Math.min(Math.max(h, i) + 20, f.width());
            e._outerWidth(j),
            f.find(".textbox-button").linkbutton("resize", {
                    height: "100%"
                })
        }
        function f(b) {
            var c = a(b),
                d = c.tagbox("options");
            if (d.limitToList) {
                    var e = c.tagbox("panel"),
                        f = e.children("div.combobox-item-hover");
                    if (f.length) {
                            f.removeClass("combobox-item-hover");
                            var g = d.finder.getRow(b, f),
                                h = g[d.valueField];
                            a(b).tagbox(f.hasClass("combobox-item-selected") ? "unselect" : "select", h)
                        }
                    a(b).tagbox("hidePanel")
                } else {
                    var i = a.trim(a(b).tagbox("getText"));
                    if ("" !== i) {
                        var j = a(b).tagbox("getValues");
                        j.push(i),
                        a(b).tagbox("setValues", j)
                    }
                }
        }
        function g(b, c) {
            a(b).combobox("setText", ""),
            e(b),
            a(b).combobox("setValues", c),
            a(b).combobox("setText", ""),
            a(b).tagbox("validate")
        }
        a.fn.tagbox = function (c, e) {
            if ("string" == typeof c) {
                var f = a.fn.tagbox.methods[c];
                return f ? f(this, e) : this.combobox(c, e)
            }
            return c = c || {},
            this.each(function () {
                var e = a.data(this, "tagbox");
                e ? a.extend(e.options, c) : a.data(this, "tagbox", {
                    options: a.extend({}, a.fn.tagbox.defaults, a.fn.tagbox.parseOptions(this), c)
                }),
                b(this),
                d(this)
            })
        },
        a.fn.tagbox.methods = {
            options: function (b) {
                var c = b.combobox("options");
                return a.extend(a.data(b[0], "tagbox").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            setValues: function (a, b) {
                return a.each(function () {
                    g(this, b)
                })
            }
        },
        a.fn.tagbox.parseOptions = function (b) {
            return a.extend({}, a.fn.combobox.parseOptions(b), a.parser.parseOptions(b, []))
        },
        a.fn.tagbox.defaults = a.extend({}, a.fn.combobox.defaults, {
            hasDownArrow: !1,
            multiple: !0,
            reversed: !0,
            selectOnNavigation: !1,
            tipOptions: a.extend({}, a.fn.textbox.defaults.tipOptions, {
                showDelay: 200
            }),
            val: function (b) {
                var c = a(b).parent().prev().tagbox("getValues");
                return a(b).is(":focus") && c.push(a(b).val()),
                c.join(",")
            },
            inputEvents: a.extend({}, a.fn.combo.defaults.inputEvents, {
                blur: function (b) {
                    var c = b.data.target,
                        d = a(c).tagbox("options");
                    d.limitToList && f(c)
                }
            }),
            keyHandler: a.extend({}, a.fn.combobox.defaults.keyHandler, {
                enter: function (a) {
                    f(this)
                },
                query: function (b, c) {
                    var d = a(this).tagbox("options");
                    d.limitToList ? a.fn.combobox.defaults.keyHandler.query.call(this, b, c) : a(this).combobox("hidePanel")
                }
            }),
            tagFormatter: function (b, c) {
                var d = a(this).tagbox("options");
                return c ? c[d.textField] : b
            },
            tagStyler: function (a, b) {
                return ""
            },
            onClickTag: function (a) {},
            onBeforeRemoveTag: function (a) {},
            onRemoveTag: function (a) {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            function c(b) {
                var c = a(b).datebox("options"),
                    d = a(b).combo("panel");
                d.unbind(".datebox").bind("click.datebox", function (d) {
                        if (a(d.target).hasClass("datebox-button-a")) {
                            var e = parseInt(a(d.target).attr("datebox-button-index"));
                            c.buttons[e].handler.call(d.target, b)
                        }
                    })
            }
            function d(b) {
                var c = a(b).combo("panel");
                if (!c.children("div.datebox-button").length) {
                    for (var d = a('<div class="datebox-button"><table cellspacing="0" cellpadding="0" style="width:100%"><tr></tr></table></div>').appendTo(c), e = d.find("tr"), f = 0; f < h.buttons.length; f++) {
                        var g = a("<td></td>").appendTo(e),
                            i = h.buttons[f],
                            j = a('<a class="datebox-button-a" href="javascript:;"></a>').html(a.isFunction(i.text) ? i.text(b) : i.text).appendTo(g);
                        j.attr("datebox-button-index", f)
                    }
                    e.find("td").css("width", 100 / h.buttons.length + "%")
                }
            }
            function f(b) {
                var c = a(b).combo("panel"),
                    d = c.children("div.datebox-calendar-inner");
                if (c.children()._outerWidth(c.width()), g.calendar.appendTo(d), g.calendar[0].target = b, "auto" != h.panelHeight) {
                        var e = c.height();
                        c.children().not(d).each(function () {
                            e -= a(this).outerHeight()
                        }),
                        d._outerHeight(e)
                    }
                g.calendar.calendar("resize")
            }
            var g = a.data(b, "datebox"),
                h = g.options;
            if (a(b).addClass("datebox-f").combo(a.extend({}, h, {
                    onShowPanel: function () {
                        c(this),
                        d(this),
                        f(this),
                        e(this, a(this).datebox("getText"), !0),
                        h.onShowPanel.call(this)
                    }
                })), !g.calendar) {
                    var i = a(b).combo("panel").css("overflow", "hidden");
                    i.panel("options").onBeforeDestroy = function () {
                        var b = a(this).find(".calendar-shared");
                        b.length && b.insertBefore(b[0].pholder)
                    };
                    var j = a('<div class="datebox-calendar-inner"></div>').prependTo(i);
                    if (h.sharedCalendar) {
                        var k = a(h.sharedCalendar);
                        k[0].pholder || (k[0].pholder = a('<div class="calendar-pholder" style="display:none"></div>').insertAfter(k)),
                        k.addClass("calendar-shared").appendTo(j),
                        k.hasClass("calendar") || k.calendar(),
                        g.calendar = k
                    } else g.calendar = a("<div></div>").appendTo(j).calendar();
                    a.extend(g.calendar.calendar("options"), {
                        fit: !0,
                        border: !1,
                        onSelect: function (b) {
                            var c = this.target,
                                d = a(c).datebox("options");
                            e(c, d.formatter.call(c, b)),
                            a(c).combo("hidePanel"),
                            d.onSelect.call(c, b)
                        }
                    })
                }
            a(b).combo("textbox").parent().addClass("datebox"),
            a(b).datebox("initValue", h.value)
        }
        function c(a, b) {
            e(a, b, !0)
        }
        function d(b) {
            var c = a.data(b, "datebox"),
                d = c.options,
                f = c.calendar.calendar("options").current;
            f && (e(b, d.formatter.call(b, f)), a(b).combo("hidePanel"))
        }
        function e(b, c, d) {
            var e = a.data(b, "datebox"),
                f = e.options,
                g = e.calendar;
            g.calendar("moveTo", f.parser.call(b, c)),
            d ? a(b).combo("setValue", c) : (c && (c = f.formatter.call(b, g.calendar("options").current)), a(b).combo("setText", c).combo("setValue", c))
        }
        a.fn.datebox = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.datebox.methods[c];
                return e ? e(this, d) : this.combo(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "datebox");
                d ? a.extend(d.options, c) : a.data(this, "datebox", {
                    options: a.extend({}, a.fn.datebox.defaults, a.fn.datebox.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.datebox.methods = {
            options: function (b) {
                var c = b.combo("options");
                return a.extend(a.data(b[0], "datebox").options, {
                    width: c.width,
                    height: c.height,
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    a(this).combo("cloneFrom", c),
                    a.data(this, "datebox", {
                        options: a.extend(!0, {}, a(c).datebox("options")),
                        calendar: a(c).datebox("calendar")
                    }),
                    a(this).addClass("datebox-f")
                })
            },
            calendar: function (b) {
                return a.data(b[0], "datebox").calendar
            },
            initValue: function (b, c) {
                return b.each(function () {
                    var b = a(this).datebox("options"),
                        c = b.value;
                    c && (c = b.formatter.call(this, b.parser.call(this, c))),
                    a(this).combo("initValue", c).combo("setText", c)
                })
            },
            setValue: function (a, b) {
                return a.each(function () {
                    e(this, b)
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).datebox("options");
                    a(this).datebox("setValue", b.originalValue)
                })
            }
        },
        a.fn.datebox.parseOptions = function (b) {
            return a.extend({}, a.fn.combo.parseOptions(b), a.parser.parseOptions(b, ["sharedCalendar"]))
        },
        a.fn.datebox.defaults = a.extend({}, a.fn.combo.defaults, {
            panelWidth: 180,
            panelHeight: "auto",
            sharedCalendar: null,
            keyHandler: {
                up: function (a) {},
                down: function (a) {},
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {
                    d(this)
                },
                query: function (a, b) {
                    c(this, a)
                }
            },
            currentText: "Today",
            closeText: "Close",
            okText: "Ok",
            buttons: [{
                text: function (b) {
                    return a(b).datebox("options").currentText
                },
                handler: function (b) {
                    var c = new Date;
                    a(b).datebox("calendar").calendar({
                        year: c.getFullYear(),
                        month: c.getMonth() + 1,
                        current: new Date(c.getFullYear(), c.getMonth(), c.getDate())
                    }),
                    d(b)
                }
            },
            {
                text: function (b) {
                    return a(b).datebox("options").closeText
                },
                handler: function (b) {
                    a(this).closest("div.combo-panel").panel("close")
                }
            }],
            formatter: function (a) {
                var b = a.getFullYear(),
                    c = a.getMonth() + 1,
                    d = a.getDate();
                return (c < 10 ? "0" + c : c) + "/" + (d < 10 ? "0" + d : d) + "/" + b
            },
            parser: function (a) {
                if (!a) return new Date;
                var b = a.split("/"),
                    c = parseInt(b[0], 10),
                    d = parseInt(b[1], 10),
                    e = parseInt(b[2], 10);
                return isNaN(e) || isNaN(c) || isNaN(d) ? new Date : new Date(e, c - 1, d)
            },
            onSelect: function (a) {}
        })
    }(jQuery),


function (a) {
        function b(b) {
            var c = a.data(b, "datetimebox"),
                d = c.options;
            if (a(b).datebox(a.extend({}, d, {
                    onShowPanel: function () {
                        var b = a(this).datetimebox("getValue");
                        f(this, b, !0),
                        d.onShowPanel.call(this)
                    },
                    formatter: a.fn.datebox.defaults.formatter,
                    parser: a.fn.datebox.defaults.parser
                })), a(b).removeClass("datebox-f").addClass("datetimebox-f"), a(b).datebox("calendar").calendar({
                    onSelect: function (a) {
                        d.onSelect.call(this.target, a)
                    }
                }), !c.spinner) {
                    var e = a(b).datebox("panel"),
                        g = a('<div style="padding:2px"><input></div>').insertAfter(e.children("div.datebox-calendar-inner"));
                    c.spinner = g.children("input")
                }
            c.spinner.timespinner({
                    width: d.spinnerWidth,
                    showSeconds: d.showSeconds,
                    separator: d.timeSeparator
                }),
            a(b).datetimebox("initValue", d.value)
        }
        function c(b) {
            var c = a(b).datetimebox("calendar"),
                d = a(b).datetimebox("spinner"),
                e = c.calendar("options").current;
            return new Date(e.getFullYear(), e.getMonth(), e.getDate(), d.timespinner("getHours"), d.timespinner("getMinutes"), d.timespinner("getSeconds"))
        }
        function d(a, b) {
            f(a, b, !0)
        }
        function e(b) {
            var d = a.data(b, "datetimebox").options,
                e = c(b);
            f(b, d.formatter.call(b, e)),
            a(b).combo("hidePanel")
        }
        function f(b, c, d) {
            function e(c) {
                function d(a) {
                    return (a < 10 ? "0" : "") + a
                }
                var e = [d(c.getHours()), d(c.getMinutes())];
                return f.showSeconds && e.push(d(c.getSeconds())),
                e.join(a(b).datetimebox("spinner").timespinner("options").separator)
            }
            var f = a.data(b, "datetimebox").options;
            if (a(b).combo("setValue", c), !d) if (c) {
                var g = f.parser.call(b, c);
                a(b).combo("setText", f.formatter.call(b, g)),
                a(b).combo("setValue", f.formatter.call(b, g))
            } else a(b).combo("setText", c);
            var g = f.parser.call(b, c);
            a(b).datetimebox("calendar").calendar("moveTo", g),
            a(b).datetimebox("spinner").timespinner("setValue", e(g))
        }
        a.fn.datetimebox = function (c, d) {
            if ("string" == typeof c) {
                var e = a.fn.datetimebox.methods[c];
                return e ? e(this, d) : this.datebox(c, d)
            }
            return c = c || {},
            this.each(function () {
                var d = a.data(this, "datetimebox");
                d ? a.extend(d.options, c) : a.data(this, "datetimebox", {
                    options: a.extend({}, a.fn.datetimebox.defaults, a.fn.datetimebox.parseOptions(this), c)
                }),
                b(this)
            })
        },
        a.fn.datetimebox.methods = {
            options: function (b) {
                var c = b.datebox("options");
                return a.extend(a.data(b[0], "datetimebox").options, {
                    originalValue: c.originalValue,
                    disabled: c.disabled,
                    readonly: c.readonly
                })
            },
            cloneFrom: function (b, c) {
                return b.each(function () {
                    a(this).datebox("cloneFrom", c),
                    a.data(this, "datetimebox", {
                        options: a.extend(!0, {}, a(c).datetimebox("options")),
                        spinner: a(c).datetimebox("spinner")
                    }),
                    a(this).removeClass("datebox-f").addClass("datetimebox-f")
                })
            },
            spinner: function (b) {
                return a.data(b[0], "datetimebox").spinner
            },
            initValue: function (b, c) {
                return b.each(function () {
                    var b = a(this).datetimebox("options"),
                        c = b.value;
                    c && (c = b.formatter.call(this, b.parser.call(this, c))),
                    a(this).combo("initValue", c).combo("setText", c)
                })
            },
            setValue: function (a, b) {
                return a.each(function () {
                    f(this, b)
                })
            },
            reset: function (b) {
                return b.each(function () {
                    var b = a(this).datetimebox("options");
                    a(this).datetimebox("setValue", b.originalValue)
                })
            }
        },
        a.fn.datetimebox.parseOptions = function (b) {
            a(b);
            return a.extend({}, a.fn.datebox.parseOptions(b), a.parser.parseOptions(b, ["timeSeparator", "spinnerWidth", {
                showSeconds: "boolean"
            }]))
        },
        a.fn.datetimebox.defaults = a.extend({}, a.fn.datebox.defaults, {
            spinnerWidth: "100%",
            showSeconds: !0,
            timeSeparator: ":",
            keyHandler: {
                up: function (a) {},
                down: function (a) {},
                left: function (a) {},
                right: function (a) {},
                enter: function (a) {
                    e(this)
                },
                query: function (a, b) {
                    d(this, a)
                }
            },
            buttons: [{
                text: function (b) {
                    return a(b).datetimebox("options").currentText
                },
                handler: function (b) {
                    var c = a(b).datetimebox("options");
                    f(b, c.formatter.call(b, new Date)),
                    a(b).datetimebox("hidePanel")
                }
            },
            {
                text: function (b) {
                    return a(b).datetimebox("options").okText
                },
                handler: function (a) {
                    e(a)
                }
            },
            {
                text: function (b) {
                    return a(b).datetimebox("options").closeText
                },
                handler: function (b) {
                    a(b).datetimebox("hidePanel")
                }
            }],
            formatter: function (b) {
                function c(a) {
                    return (a < 10 ? "0" : "") + a
                }
                var d = b.getHours(),
                    e = b.getMinutes(),
                    f = b.getSeconds(),
                    g = a(this).datetimebox("spinner").timespinner("options").separator,
                    h = a.fn.datebox.defaults.formatter(b) + " " + c(d) + g + c(e);
                return a(this).datetimebox("options").showSeconds && (h += g + c(f)),
                h
            },
            parser: function (b) {
                if ("" == a.trim(b)) return new Date;
                var c = b.split(" "),
                    d = a.fn.datebox.defaults.parser(c[0]);
                if (c.length < 2) return d;
                var e = a(this).datetimebox("spinner").timespinner("options").separator,
                    f = c[1].split(e),
                    g = parseInt(f[0], 10) || 0,
                    h = parseInt(f[1], 10) || 0,
                    i = parseInt(f[2], 10) || 0;
                return new Date(d.getFullYear(), d.getMonth(), d.getDate(), g, h, i)
            }
        })
    }(jQuery),


function ($) {
        function init(a) {
            var b = $('<div class="slider"><div class="slider-inner"><a href="javascript:;" class="slider-handle"></a><span class="slider-tip"></span></div><div class="slider-rule"></div><div class="slider-rulelabel"></div><div style="clear:both"></div><input type="hidden" class="slider-value"></div>').insertAfter(a),
                c = $(a);
            c.addClass("slider-f").hide();
            var d = c.attr("name");
            return d && (b.find("input.slider-value").attr("name", d), c.removeAttr("name").attr("sliderName", d)),
            b.bind("_resize", function (b, c) {
                    return ($(this).hasClass("easyui-fluid") || c) && _bd5(a),
                    !1
                }),
            b
        }
        function _bd5(a, b) {
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider;
            b && (b.width && (d.width = b.width), b.height && (d.height = b.height)),
            e._size(d),
            "h" == d.mode ? (e.css("height", ""), e.children("div").css("height", "")) : (e.css("width", ""), e.children("div").css("width", ""), e.children("div.slider-rule,div.slider-rulelabel,div.slider-inner")._outerHeight(e._outerHeight())),
            _bda(a)
        }
        function _bdb(a) {
            function b(a) {
                var b = e.find("div.slider-rule"),
                    c = e.find("div.slider-rulelabel");
                b.empty(),
                c.empty();
                for (var f = 0; f < a.length; f++) {
                        var g = 100 * f / (a.length - 1) + "%",
                            h = $("<span></span>").appendTo(b);
                        h.css("h" == d.mode ? "left" : "top", g),
                        "|" != a[f] && (h = $("<span></span>").appendTo(c), h.html(a[f]), "h" == d.mode ? h.css({
                                left: g,
                                marginLeft: -Math.round(h.outerWidth() / 2)
                            }) : h.css({
                                top: g,
                                marginTop: -Math.round(h.outerHeight() / 2)
                            }))
                    }
            }
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider,
                f = "h" == d.mode ? d.rule : d.rule.slice(0).reverse();
            d.reversed && (f = f.slice(0).reverse()),
            b(f)
        }
        function _be2(a) {
            function b(b, c) {
                var e = _beb(a, b),
                    f = Math.abs(e % d.step);
                if (f < d.step / 2 ? e -= f : e = e - f + d.step, d.range) {
                        var g = d.value[0],
                            h = d.value[1],
                            i = parseFloat((g + h) / 2);
                        if (c) {
                                var j = $(c).nextAll(".slider-handle").length > 0;
                                e <= h && j ? g = e : e >= g && !j && (h = e)
                            } else e < g ? g = e : e > h ? h = e : e < i ? g = e : h = e;
                        $(a).slider("setValues", [g, h])
                    } else $(a).slider("setValue", e)
            }
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider;
            e.removeClass("slider-h slider-v slider-disabled"),
            e.addClass("h" == d.mode ? "slider-h" : "slider-v"),
            e.addClass(d.disabled ? "slider-disabled" : "");
            var f = e.find(".slider-inner");
            f.html('<a href="javascript:;" class="slider-handle"></a><span class="slider-tip"></span>'),
            d.range && f.append('<a href="javascript:;" class="slider-handle"></a><span class="slider-tip"></span>'),
            e.find("a.slider-handle").draggable({
                    axis: d.mode,
                    cursor: "pointer",
                    disabled: d.disabled,
                    onDrag: function (a) {
                        var c = a.data.left,
                            f = e.width();
                        return "h" != d.mode && (c = a.data.top, f = e.height()),
                        !(c < 0 || c > f) && (b(c, this), !1)
                    },
                    onStartDrag: function () {
                        c.isDragging = !0,
                        d.onSlideStart.call(a, d.value)
                    },
                    onStopDrag: function (e) {
                        b("h" == d.mode ? e.data.left : e.data.top, this),
                        d.onSlideEnd.call(a, d.value),
                        d.onComplete.call(a, d.value),
                        c.isDragging = !1
                    }
                }),
            e.find("div.slider-inner").unbind(".slider").bind("mousedown.slider", function (e) {
                    if (!c.isDragging && !d.disabled) {
                        var f = $(this).offset();
                        b("h" == d.mode ? e.pageX - f.left : e.pageY - f.top),
                        d.onComplete.call(a, d.value)
                    }
                })
        }
        function _bed(a, b) {
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider,
                f = $.isArray(d.value) ? d.value : [d.value],
                g = [];
            $.isArray(b) || (b = $.map(String(b).split(d.separator), function (a) {
                    return parseFloat(a)
                })),
            e.find(".slider-value").remove();
            for (var h = $(a).attr("sliderName") || "", i = 0; i < b.length; i++) {
                    var j = b[i];
                    j < d.min && (j = d.min),
                    j > d.max && (j = d.max);
                    var k = $('<input type="hidden" class="slider-value">').appendTo(e);
                    k.attr("name", h),
                    k.val(j),
                    g.push(j);
                    var l = e.find(".slider-handle:eq(" + i + ")"),
                        m = l.next(),
                        n = _bf7(a, j);
                    if (d.showTip ? (m.show(), m.html(d.tipFormatter.call(a, j))) : m.hide(), "h" == d.mode) {
                            var o = "left:" + n + "px;";
                            l.attr("style", o),
                            m.attr("style", o + "margin-left:" + -Math.round(m.outerWidth() / 2) + "px")
                        } else {
                            var o = "top:" + n + "px;";
                            l.attr("style", o),
                            m.attr("style", o + "margin-left:" + -Math.round(m.outerWidth()) + "px")
                        }
                }
            d.value = d.range ? g : g[0],
            $(a).val(d.range ? g.join(d.separator) : g[0]),
            f.join(",") != g.join(",") && d.onChange.call(a, d.value, d.range ? f : f[0])
        }
        function _bda(a) {
            var b = $.data(a, "slider").options,
                c = b.onChange;
            b.onChange = function () {},
            _bed(a, b.value),
            b.onChange = c
        }
        function _bf7(a, b) {
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider,
                f = "h" == d.mode ? e.width() : e.height(),
                g = d.converter.toPosition.call(a, b, f);
            return "v" == d.mode && (g = e.height() - g),
            d.reversed && (g = f - g),
            g.toFixed(0)
        }
        function _beb(a, b) {
            var c = $.data(a, "slider"),
                d = c.options,
                e = c.slider,
                f = "h" == d.mode ? e.width() : e.height(),
                b = "h" == d.mode ? d.reversed ? f - b : b : d.reversed ? b : f - b,
                g = d.converter.toValue.call(a, b, f);
            return g.toFixed(0)
        }
        $.fn.slider = function (a, b) {
            return "string" == typeof a ? $.fn.slider.methods[a](this, b) : (a = a || {}, this.each(function () {
                var b = $.data(this, "slider");
                b ? $.extend(b.options, a) : (b = $.data(this, "slider", {
                    options: $.extend({}, $.fn.slider.defaults, $.fn.slider.parseOptions(this), a),
                    slider: init(this)
                }), $(this).removeAttr("disabled"));
                var c = b.options;
                c.min = parseFloat(c.min),
                c.max = parseFloat(c.max),
                c.range ? ($.isArray(c.value) || (c.value = $.map(String(c.value).split(c.separator), function (a) {
                    return parseFloat(a)
                })), c.value.length < 2 && c.value.push(c.max)) : c.value = parseFloat(c.value),
                c.step = parseFloat(c.step),
                c.originalValue = c.value,
                _be2(this),
                _bdb(this),
                _bd5(this)
            }))
        },
        $.fn.slider.methods = {
            options: function (a) {
                return $.data(a[0], "slider").options
            },
            destroy: function (a) {
                return a.each(function () {
                    $.data(this, "slider").slider.remove(),
                    $(this).remove()
                })
            },
            resize: function (a, b) {
                return a.each(function () {
                    _bd5(this, b)
                })
            },
            getValue: function (a) {
                return a.slider("options").value
            },
            getValues: function (a) {
                return a.slider("options").value
            },
            setValue: function (a, b) {
                return a.each(function () {
                    _bed(this, [b])
                })
            },
            setValues: function (a, b) {
                return a.each(function () {
                    _bed(this, b)
                })
            },
            clear: function (a) {
                return a.each(function () {
                    var a = $(this).slider("options");
                    _bed(this, a.range ? [a.min, a.max] : [a.min])
                })
            },
            reset: function (a) {
                return a.each(function () {
                    var a = $(this).slider("options");
                    $(this).slider(a.range ? "setValues" : "setValue", a.originalValue)
                })
            },
            enable: function (a) {
                return a.each(function () {
                    $.data(this, "slider").options.disabled = !1,
                    _be2(this)
                })
            },
            disable: function (a) {
                return a.each(function () {
                    $.data(this, "slider").options.disabled = !0,
                    _be2(this)
                })
            }
        },
        $.fn.slider.parseOptions = function (_c08) {
            var t = $(_c08);
            return $.extend({}, $.parser.parseOptions(_c08, ["width", "height", "mode", {
                reversed: "boolean",
                showTip: "boolean",
                range: "boolean",
                min: "number",
                max: "number",
                step: "number"
            }]), {
                value: t.val() || void 0,
                disabled: !! t.attr("disabled") || void 0,
                rule: t.attr("rule") ? eval(t.attr("rule")) : void 0
            })
        },
        $.fn.slider.defaults = {
            width: "auto",
            height: "auto",
            mode: "h",
            reversed: !1,
            showTip: !1,
            disabled: !1,
            range: !1,
            value: 0,
            separator: ",",
            min: 0,
            max: 100,
            step: 1,
            rule: [],
            tipFormatter: function (a) {
                return a
            },
            converter: {
                toPosition: function (a, b) {
                    var c = $(this).slider("options");
                    return (a - c.min) / (c.max - c.min) * b
                },
                toValue: function (a, b) {
                    var c = $(this).slider("options");
                    return c.min + (c.max - c.min) * (a / b)
                }
            },
            onChange: function (a, b) {},
            onSlideStart: function (a) {},
            onSlideEnd: function (a) {},
            onComplete: function (a) {}
        }
    }(jQuery),


function (a) {
        function b(b) {
            return a(b).data("treegrid") ? "treegrid" : "datagrid"
        }
        function c(b, c) {
            function d(b) {
                var c = 0;
                return a(b).children(":visible").each(function () {
                    c += a(this)._outerWidth()
                }),
                c
            }
            var e = !1,
                f = a(b),
                g = f.datagrid("getPanel").find("div.datagrid-header"),
                h = g.find(".datagrid-header-row:not(.datagrid-filter-row)"),
                i = c ? g.find('.datagrid-filter[name="' + c + '"]') : g.find(".datagrid-filter");
            i.each(function () {
                    var b = a(this).attr("name"),
                        c = f.datagrid("getColumnOption", b),
                        g = a(this).closest("div.datagrid-filter-c"),
                        i = g.find("a.datagrid-filter-btn"),
                        j = h.find('td[field="' + b + '"] .datagrid-cell'),
                        k = j._outerWidth();
                    k != d(g) && this.filter.resize(this, k - i._outerWidth()),
                    g.width() > c.boxWidth + c.deltaWidth - 1 && (c.boxWidth = g.width() - c.deltaWidth + 1, c.width = c.boxWidth + c.deltaWidth, e = !0)
                }),
            e && a(b).datagrid("fixColumnSize")
        }
        function d(b, c) {
            var d = a(b).datagrid("getPanel").find("div.datagrid-header");
            return d.find('tr.datagrid-filter-row td[field="' + c + '"] .datagrid-filter')
        }
        function e(c, d) {
            for (var e = b(c), f = a(c)[e]("options").filterRules, g = 0; g < f.length; g++) if (f[g].field == d) return g;
            return -1
        }
        function f(c, d) {
            var f = b(c),
                g = a(c)[f]("options").filterRules,
                h = e(c, d);
            return h >= 0 ? g[h] : null
        }
        function g(c, f) {
            var g = b(c),
                i = a(c)[g]("options"),
                j = i.filterRules;
            if ("nofilter" == f.op) h(c, f.field);
            else {
                    var k = e(c, f.field);
                    k >= 0 ? a.extend(j[k], f) : j.push(f)
                }
            var l = d(c, f.field);
            if (l.length) {
                    "nofilter" != f.op && l[0].filter.setValue(l, f.value);
                    var m = l[0].menu;
                    if (m) {
                        m.find("." + i.filterMenuIconCls).removeClass(i.filterMenuIconCls);
                        var n = m.menu("findItem", i.operators[f.op].text);
                        m.menu("setIcon", {
                            target: n.target,
                            iconCls: i.filterMenuIconCls
                        })
                    }
                }
        }
        function h(c, f) {
            function g(a) {
                for (var b = 0; b < a.length; b++) {
                    var e = d(c, a[b]);
                    if (e.length) {
                        e[0].filter.setValue(e, "");
                        var f = e[0].menu;
                        f && f.find("." + j.filterMenuIconCls).removeClass(j.filterMenuIconCls)
                    }
                }
            }
            var h = b(c),
                i = a(c),
                j = i[h]("options");
            if (f) {
                    var k = e(c, f);
                    k >= 0 && j.filterRules.splice(k, 1),
                    g([f])
                } else {
                    j.filterRules = [];
                    var l = i.datagrid("getColumnFields", !0).concat(i.datagrid("getColumnFields"));
                    g(l)
                }
        }
        function i(c) {
            var d = b(c),
                e = a.data(c, d),
                f = e.options;
            f.remoteFilter ? a(c)[d]("load") : (a(c)[d]("getPager").pagination("refresh", {
                    pageNumber: 1
                }), a(c)[d]("options").pageNumber = 1, a(c)[d]("loadData", e.filterSource || e.data))
        }
        function j(b, c, d) {
            var e = a(b).treegrid("options");
            if (!c || !c.length) return [];
            var f = [];
            return a.map(c, function (a) {
                a._parentId = d,
                f.push(a),
                f = f.concat(j(b, a.children, a[e.idField]))
            }),
            a.map(f, function (a) {
                a.children = void 0
            }),
            f
        }
        function k(c, d) {
            var e = this,
                f = b(e),
                g = a.data(e, f),
                h = g.options;
            if ("datagrid" == f && a.isArray(c)) c = {
                    total: c.length,
                    rows: c
                };
            else if ("treegrid" == f && a.isArray(c)) {
                    var i = j(e, c, d);
                    c = {
                        total: i.length,
                        rows: i
                    }
                }
            if (!h.remoteFilter) {
                    if (g.filterSource) {
                        if (h.isSorting) h.isSorting = void 0;
                        else if ("datagrid" == f) g.filterSource = c;
                        else if (g.filterSource.total += c.length, g.filterSource.rows = g.filterSource.rows.concat(c.rows), d) return h.filterMatcher.call(e, c)
                    } else g.filterSource = c;
                    if (!h.remoteSort && h.sortName) {
                        var k = h.sortName.split(","),
                            l = h.sortOrder.split(","),
                            m = a(e);
                        g.filterSource.rows.sort(function (a, b) {
                                for (var c = 0, d = 0; d < k.length; d++) {
                                    var e = k[d],
                                        f = l[d],
                                        g = m.datagrid("getColumnOption", e),
                                        h = g.sorter ||
                                    function (a, b) {
                                            return a == b ? 0 : a > b ? 1 : -1
                                        };
                                    if (c = h(a[e], b[e]) * ("asc" == f ? 1 : -1), 0 != c) return c
                                }
                                return c
                            })
                    }
                    if (c = h.filterMatcher.call(e, {
                        total: g.filterSource.total,
                        rows: g.filterSource.rows
                    }), h.pagination) {
                        var m = a(e),
                            n = m[f]("getPager");
                        if (n.pagination({
                                onSelectPage: function (a, b) {
                                    h.pageNumber = a,
                                    h.pageSize = b,
                                    n.pagination("refresh", {
                                        pageNumber: a,
                                        pageSize: b
                                    }),
                                    m[f]("loadData", g.filterSource)
                                },
                                onBeforeRefresh: function () {
                                    return m[f]("reload"),
                                    !1
                                }
                            }), "datagrid" == f) {
                                var o = (h.pageNumber - 1) * parseInt(h.pageSize),
                                    p = o + parseInt(h.pageSize);
                                c.rows = c.rows.slice(o, p)
                            } else {
                                var q = [],
                                    r = [];
                                a.map(c.rows, function (a) {
                                        a._parentId ? r.push(a) : q.push(a)
                                    }),
                                c.total = q.length;
                                var o = (h.pageNumber - 1) * parseInt(h.pageSize),
                                    p = o + parseInt(h.pageSize);
                                c.rows = q.slice(o, p).concat(r)
                            }
                    }
                    a.map(c.rows, function (a) {
                        a.children = void 0
                    })
                }
            return c
        }
        function l(d, e) {
            function f() {
                a("#datagrid-filter-style").length || a("head").append('<style id="datagrid-filter-style">a.datagrid-filter-btn{display:inline-block;width:18px;height:22px;margin:8px 0 0 8px;vertical-align:middle;cursor:pointer;opacity:0.6;filter:alpha(opacity=60);}a:hover.datagrid-filter-btn{opacity:1;filter:alpha(opacity=100);}.datagrid-filter-row .textbox,.datagrid-filter-row .textbox .textbox-text{-moz-border-radius:0;-webkit-border-radius:0;border-radius:0;}.datagrid-filter-row input{margin:0;-moz-border-radius:0;-webkit-border-radius:0;border-radius:0;}.datagrid-filter-cache{position:absolute;width:10px;height:10px;left:-99999px;}</style>')
            }
            function h(b) {
                var e = n.dc,
                    f = a(d).datagrid("getColumnFields", b);
                b && o.rownumbers && f.unshift("_");
                var g = (b ? e.header1 : e.header2).find("table.datagrid-htable");
                g.find(".datagrid-filter").each(function () {
                        this.filter.destroy && this.filter.destroy(this),
                        this.menu && a(this.menu).menu("destroy")
                    }),
                g.find("tr.datagrid-filter-row").remove();
                var h = a('<tr class="datagrid-header-row datagrid-filter-row"></tr>');
                "bottom" == o.filterPosition ? h.appendTo(g.find("tbody")) : h.prependTo(g.find("tbody")),
                o.showFilterBar || h.hide();
                for (var i = 0; i < f.length; i++) {
                        var k = f[i],
                            p = a(d).datagrid("getColumnOption", k),
                            q = a("<td></td>").attr("field", k).appendTo(h);
                        if (p && p.hidden && q.hide(), "_" != k && (!p || !p.checkbox && !p.expander)) {
                                var r = l(k);
                                r ? a(d)[m]("destroyFilter", k) : r = a.extend({}, {
                                    field: k,
                                    type: o.defaultFilterType,
                                    options: o.defaultFilterOptions
                                });
                                var s = o.filterCache[k];
                                if (s) s.appendTo(q);
                                else {
                                    s = a('<div class="datagrid-filter-c"></div>').appendTo(q);
                                    var t = o.filters[r.type],
                                        u = t.init(s, r.options || {});
                                    u.addClass("datagrid-filter").attr("name", k),
                                    u[0].filter = t,
                                    u[0].menu = j(s, r.op),
                                    r.options ? r.options.onInit && r.options.onInit.call(u[0], d) : o.defaultFilterOptions.onInit.call(u[0], d),
                                    o.filterCache[k] = s,
                                    c(d, k)
                                }
                            }
                    }
            }
            function j(b, c) {
                if (!c) return null;
                var e = a('<a class="datagrid-filter-btn">&nbsp;</a>').addClass(o.filterBtnIconCls);
                "right" == o.filterBtnPosition ? e.appendTo(b) : e.prependTo(b);
                var f = a("<div></div>").appendTo("body");
                return a.map(["nofilter"].concat(c), function (b) {
                    var c = o.operators[b];
                    c && a("<div></div>").attr("name", b).html(c.text).appendTo(f)
                }),
                f.menu({
                    alignTo: e,
                    onClick: function (b) {
                        var c = a(this).menu("options").alignTo,
                            e = c.closest("td[field]"),
                            f = e.attr("field"),
                            h = e.find(".datagrid-filter"),
                            j = h[0].filter.getValue(h);
                        0 != o.onClickMenu.call(d, b, c, f) && (g(d, {
                                field: f,
                                op: b.name,
                                value: j
                            }), i(d))
                    }
                }),
                e[0].menu = f,
                e.bind("click", {
                    menu: f
                }, function (b) {
                    return a(this.menu).menu("show"),
                    !1
                }),
                f
            }
            function l(a) {
                for (var b = 0; b < e.length; b++) {
                    var c = e[b];
                    if (c.field == a) return c
                }
                return null
            }
            e = e || [];
            var m = b(d),
                n = a.data(d, m),
                o = n.options;
            o.filterRules.length || (o.filterRules = []),
            o.filterCache = o.filterCache || {};
            var p = a.data(d, "datagrid").options,
                q = p.onResize;
            p.onResize = function (a, b) {
                    c(d),
                    q.call(this, a, b)
                };
            var r = p.onBeforeSortColumn;
            p.onBeforeSortColumn = function (a, b) {
                    var c = r.call(this, a, b);
                    return 0 != c && (o.isSorting = !0),
                    c
                };
            var s = o.onResizeColumn;
            o.onResizeColumn = function (b, e) {
                    var f = a(this).datagrid("getPanel").find(".datagrid-header .datagrid-filter-c");
                    f.hide(),
                    a(d).datagrid("fitColumns"),
                    o.fitColumns ? c(d) : c(d, b),
                    f.show(),
                    s.call(d, b, e)
                };
            var t = o.onBeforeLoad;
            o.onBeforeLoad = function (a, b) {
                    a && (a.filterRules = o.filterStringify(o.filterRules)),
                    b && (b.filterRules = o.filterStringify(o.filterRules));
                    var c = t.call(this, a, b);
                    if (0 != c) if ("datagrid" == m) n.filterSource = null;
                    else if ("treegrid" == m && n.filterSource) if (a) {
                        for (var d = a[o.idField], e = n.filterSource.rows || [], f = 0; f < e.length; f++) if (d == e[f]._parentId) return !1
                    } else n.filterSource = null;
                    return c
                },
            o.loadFilter = function (a, b) {
                    var c = o.oldLoadFilter.call(this, a, b);
                    return k.call(this, c, b)
                },
            f(),
            h(!0),
            h(),
            o.fitColumns && setTimeout(function () {
                    c(d)
                }, 0),
            a.map(o.filterRules, function (a) {
                    g(d, a)
                })
        }
        var m = a.fn.datagrid.methods.autoSizeColumn,
            n = a.fn.datagrid.methods.loadData,
            o = a.fn.datagrid.methods.appendRow,
            p = a.fn.datagrid.methods.deleteRow;
        a.extend(a.fn.datagrid.methods, {
                autoSizeColumn: function (b, d) {
                    return b.each(function () {
                        var b = a(this).datagrid("getPanel").find(".datagrid-header .datagrid-filter-c");
                        b.hide(),
                        m.call(a.fn.datagrid.methods, a(this), d),
                        b.show(),
                        c(this, d)
                    })
                },
                loadData: function (b, c) {
                    return b.each(function () {
                        a.data(this, "datagrid").filterSource = null
                    }),
                    n.call(a.fn.datagrid.methods, b, c)
                },
                appendRow: function (b, c) {
                    var d = o.call(a.fn.datagrid.methods, b, c);
                    return b.each(function () {
                        var b = a(this).data("datagrid");
                        b.filterSource && (b.filterSource.total++, b.filterSource.rows != b.data.rows && b.filterSource.rows.push(c))
                    }),
                    d
                },
                deleteRow: function (b, c) {
                    return b.each(function () {
                        var b = a(this).data("datagrid"),
                            d = b.options;
                        if (b.filterSource && d.idField) if (b.filterSource.rows == b.data.rows) b.filterSource.total--;
                        else for (var e = 0; e < b.filterSource.rows.length; e++) {
                                var f = b.filterSource.rows[e];
                                if (f[d.idField] == b.data.rows[c][d.idField]) {
                                    b.filterSource.rows.splice(e, 1),
                                    b.filterSource.total--;
                                    break
                                }
                            }
                    }),
                    p.call(a.fn.datagrid.methods, b, c)
                }
            });
        var q = a.fn.treegrid.methods.loadData,
            r = a.fn.treegrid.methods.append,
            s = a.fn.treegrid.methods.insert,
            t = a.fn.treegrid.methods.remove;
        a.extend(a.fn.treegrid.methods, {
                loadData: function (b, c) {
                    return b.each(function () {
                        a.data(this, "treegrid").filterSource = null
                    }),
                    q.call(a.fn.treegrid.methods, b, c)
                },
                append: function (b, c) {
                    return b.each(function () {
                        var b = a(this).data("treegrid"),
                            d = b.options;
                        if (d.oldLoadFilter) {
                                var e = j(this, c.data, c.parent);
                                b.filterSource.total += e.length,
                                b.filterSource.rows = b.filterSource.rows.concat(e),
                                a(this).treegrid("loadData", b.filterSource)
                            } else r(a(this), c)
                    })
                },
                insert: function (b, c) {
                    return b.each(function () {
                        function b(a) {
                            for (var b = d.filterSource.rows, c = 0; c < b.length; c++) if (b[c][e.idField] == a) return c;
                            return -1
                        }
                        var d = a(this).data("treegrid"),
                            e = d.options;
                        if (e.oldLoadFilter) {
                                var f = (c.before || c.after, b(c.before || c.after)),
                                    g = f >= 0 ? d.filterSource.rows[f]._parentId : null,
                                    h = j(this, [c.data], g),
                                    i = d.filterSource.rows.splice(0, f >= 0 ? c.before ? f : f + 1 : d.filterSource.rows.length);
                                i = i.concat(h),
                                i = i.concat(d.filterSource.rows),
                                d.filterSource.total += h.length,
                                d.filterSource.rows = i,
                                a(this).treegrid("loadData", d.filterSource)
                            } else s(a(this), c)
                    })
                },
                remove: function (b, c) {
                    return b.each(function () {
                        var b = a(this).data("treegrid");
                        if (b.filterSource) for (var d = b.options, e = b.filterSource.rows, f = 0; f < e.length; f++) if (e[f][d.idField] == c) {
                            e.splice(f, 1),
                            b.filterSource.total--;
                            break
                        }
                    }),
                    t(b, c)
                }
            });
        var u = {
                filterMenuIconCls: "icon-ok",
                filterBtnIconCls: "icon-filter",
                filterBtnPosition: "right",
                filterPosition: "bottom",
                remoteFilter: !1,
                showFilterBar: !0,
                filterDelay: 400,
                filterRules: [],
                filterMatchingType: "all",
                filterMatcher: function (c) {
                    function d(a, b) {
                        var c = i.filterRules;
                        if (!c.length) return !0;
                        for (var d = 0; d < c.length; d++) {
                            var e = c[d],
                                f = a[e.field],
                                h = g.datagrid("getColumnOption", e.field);
                            h && h.formatter && (f = h.formatter(a[e.field], a, b)),
                            void 0 == f && (f = "");
                            var j = i.operators[e.op],
                                k = j.isMatch(f, e.value);
                            if ("any" == i.filterMatchingType) {
                                    if (k) return !0
                                } else if (!k) return !1
                        }
                        return "all" == i.filterMatchingType
                    }
                    function e(a, b) {
                        for (var c = 0; c < a.length; c++) {
                            var d = a[c];
                            if (d[i.idField] == b) return d
                        }
                        return null
                    }
                    var f = b(this),
                        g = a(this),
                        h = a.data(this, f),
                        i = h.options;
                    if (i.filterRules.length) {
                            var j = [];
                            if ("treegrid" == f) {
                                var k = {};
                                a.map(c.rows, function (a) {
                                    if (d(a, a[i.idField])) for (k[a[i.idField]] = a, a = e(c.rows, a._parentId); a;) k[a[i.idField]] = a,
                                    a = e(c.rows, a._parentId)
                                });
                                for (var l in k) j.push(k[l])
                            } else for (var m = 0; m < c.rows.length; m++) {
                                var n = c.rows[m];
                                d(n, m) && j.push(n)
                            }
                            c = {
                                total: c.total - (c.rows.length - j.length),
                                rows: j
                            }
                        }
                    return c
                },
                defaultFilterType: "text",
                defaultFilterOperator: "contains",
                defaultFilterOptions: {
                    onInit: function (c) {
                        function d() {
                            var b = a(c)[e]("getFilterRule", g),
                                d = h.val();
                            "" != d ? (b && b.value != d || !b) && (a(c)[e]("addFilterRule", {
                                    field: g,
                                    op: f.defaultFilterOperator,
                                    value: d
                                }), a(c)[e]("doFilter")) : b && (a(c)[e]("removeFilterRule", g), a(c)[e]("doFilter"))
                        }
                        var e = b(c),
                            f = a(c)[e]("options"),
                            g = a(this).attr("name"),
                            h = a(this);
                        h.data("textbox") && (h = h.textbox("textbox")),
                        h.unbind(".filter").bind("keydown.filter", function (b) {
                                a(this);
                                this.timer && clearTimeout(this.timer),
                                13 == b.keyCode ? d() : this.timer = setTimeout(function () {
                                    d()
                                }, f.filterDelay)
                            })
                    }
                },
                filterStringify: function (a) {
                    return JSON.stringify(a)
                },
                onClickMenu: function (a, b) {}
            };
        a.extend(a.fn.datagrid.defaults, u),
        a.extend(a.fn.treegrid.defaults, u),
        a.fn.datagrid.defaults.filters = a.extend({}, a.fn.datagrid.defaults.editors, {
                label: {
                    init: function (b, c) {
                        return a("<span></span>").appendTo(b)
                    },
                    getValue: function (b) {
                        return a(b).html()
                    },
                    setValue: function (b, c) {
                        a(b).html(c)
                    },
                    resize: function (b, c) {
                        a(b)._outerWidth(c)._outerHeight(22)
                    }
                }
            }),
        a.fn.treegrid.defaults.filters = a.fn.datagrid.defaults.filters,
        a.fn.datagrid.defaults.operators = {
                nofilter: {
                    text: "No Filter"
                },
                contains: {
                    text: "Contains",
                    isMatch: function (a, b) {
                        return a = String(a),
                        b = String(b),
                        a.toLowerCase().indexOf(b.toLowerCase()) >= 0
                    }
                },
                equal: {
                    text: "Equal",
                    isMatch: function (a, b) {
                        return a == b
                    }
                },
                notequal: {
                    text: "Not Equal",
                    isMatch: function (a, b) {
                        return a != b
                    }
                },
                beginwith: {
                    text: "Begin With",
                    isMatch: function (a, b) {
                        return a = String(a),
                        b = String(b),
                        0 == a.toLowerCase().indexOf(b.toLowerCase())
                    }
                },
                endwith: {
                    text: "End With",
                    isMatch: function (a, b) {
                        return a = String(a),
                        b = String(b),
                        a.toLowerCase().indexOf(b.toLowerCase(), a.length - b.length) !== -1
                    }
                },
                less: {
                    text: "Less",
                    isMatch: function (a, b) {
                        return a < b
                    }
                },
                lessorequal: {
                    text: "Less Or Equal",
                    isMatch: function (a, b) {
                        return a <= b
                    }
                },
                greater: {
                    text: "Greater",
                    isMatch: function (a, b) {
                        return a > b
                    }
                },
                greaterorequal: {
                    text: "Greater Or Equal",
                    isMatch: function (a, b) {
                        return a >= b
                    }
                }
            },
        a.fn.treegrid.defaults.operators = a.fn.datagrid.defaults.operators,
        a.extend(a.fn.datagrid.methods, {
                enableFilter: function (c, d) {
                    return c.each(function () {
                        var c = b(this),
                            e = a.data(this, c).options;
                        if (e.oldLoadFilter) {
                                if (!d) return;
                                a(this)[c]("disableFilter")
                            }
                        e.oldLoadFilter = e.loadFilter,
                        l(this, d),
                        a(this)[c]("resize"),
                        e.filterRules.length && (e.remoteFilter ? i(this) : e.data && i(this))
                    })
                },
                disableFilter: function (c) {
                    return c.each(function () {
                        var c = b(this),
                            d = a.data(this, c),
                            e = d.options,
                            f = a(this).data("datagrid").dc,
                            g = f.view.children(".datagrid-filter-cache");
                        g.length || (g = a('<div class="datagrid-filter-cache"></div>').appendTo(f.view));
                        for (var h in e.filterCache) a(e.filterCache[h]).appendTo(g);
                        var i = d.data;
                        d.filterSource && (i = d.filterSource, a.map(i.rows, function (a) {
                                a.children = void 0
                            })),
                        a(this)[c]({
                                data: i,
                                loadFilter: e.oldLoadFilter || void 0,
                                oldLoadFilter: null
                            })
                    })
                },
                destroyFilter: function (c, d) {
                    return c.each(function () {
                        function c(b) {
                            var c = a(g.filterCache[b]),
                                d = c.find(".datagrid-filter");
                            if (d.length) {
                                    var e = d[0].filter;
                                    e.destroy && e.destroy(d[0])
                                }
                            c.find(".datagrid-filter-btn").each(function () {
                                    a(this.menu).menu("destroy")
                                }),
                            c.remove(),
                            g.filterCache[b] = void 0
                        }
                        var e = b(this),
                            f = a.data(this, e),
                            g = f.options;
                        if (d) c(d);
                        else {
                                for (var h in g.filterCache) c(h);
                                a(this).datagrid("getPanel").find(".datagrid-header .datagrid-filter-row").remove(),
                                a(this).data("datagrid").dc.view.children(".datagrid-filter-cache").remove(),
                                g.filterCache = {},
                                a(this)[e]("resize"),
                                a(this)[e]("disableFilter")
                            }
                    })
                },
                getFilterRule: function (a, b) {
                    return f(a[0], b)
                },
                addFilterRule: function (a, b) {
                    return a.each(function () {
                        g(this, b)
                    })
                },
                removeFilterRule: function (a, b) {
                    return a.each(function () {
                        h(this, b)
                    })
                },
                doFilter: function (a) {
                    return a.each(function () {
                        i(this)
                    })
                },
                getFilterComponent: function (a, b) {
                    return d(a[0], b)
                },
                resizeFilter: function (a, b) {
                    return a.each(function () {
                        c(this, b)
                    })
                }
            })
    }(jQuery),


function (a) {
        a.iParser = {
            auto: !0,
            onComplete: function (a) {},
            plugins: ["draggable", "droppable", "resizable", "pagination", "tooltip", "linkbutton", "menu", "menubutton", "splitbutton", "switchbutton", "progressbar", "tree", "textbox", "passwordbox", "filebox", "combo", "combobox", "combotree", "combogrid", "combotreegrid", "tagbox", "numberbox", "validatebox", "searchbox", "spinner", "numberspinner", "timespinner", "datetimespinner", "calendar", "datebox", "datetimebox", "slider", "layout", "panel", "datagrid23", "propertygrid", "treegrid", "datalist", "tabs23", "accordion", "window", "dialog", "form"],
            parse: function (b) {
                for (var c = [], d = 0; d < a.iParser.plugins.length; d++) {
                    var e = a.iParser.plugins[d],
                        f = a('[data-toggle="topjui-' + e + '"]', b);
                    e = "i" + e.substr(0, 1).toUpperCase() + e.substr(1),
                    f.length && (f[e] ? f.each(function () {
                            a(this)[e](a.data(this, "options") || {})
                        }) : c.push({
                            name: e,
                            jq: f
                        }))
                }
                if (c.length && window.easyloader) {
                    for (var g = [], d = 0; d < c.length; d++) g.push(c[d].name);
                    easyloader.load(g, function () {
                        for (var d = 0; d < c.length; d++) {
                            var e = c[d].name,
                                f = c[d].jq;
                            f.each(function () {
                                    a(this)[e](a.data(this, "options") || {})
                                })
                        }
                        a.iParser.onComplete.call(a.iParser, b)
                    })
                } else a.iParser.onComplete.call(a.iParser, b)
            }
        },
        a(function () {
            a.iParser.parse()
        })
    }(jQuery),


function (a) {
        a.fn.iAccordion = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iAccordion.methods[b];
                return d ? d(this, c) : this.accordion(b, c)
            }
            this.each(function () {
                b = a.fn.iAccordion.parseOptions(this, b),
                a(this).accordion(b)
            })
        },
        a.fn.iAccordion.methods = {},
        a.fn.iAccordion.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.accordion.parseOptions(b), a.fn.iAccordion.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iAccordion.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iAutocomplete = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iAutocomplete.methods[b];
                return d ? d(this, c) : this.combobox(b, c)
            }
            this.each(function () {
                b = a.fn.iAutocomplete.parseOptions(this, b),
                b.initUrl = b.url,
                a(this).combobox(b)
            })
        },
        a.fn.iAutocomplete.methods = {},
        a.fn.iAutocomplete.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combobox.parseOptions(b), a.fn.iAutocomplete.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iAutocomplete.defaults = {
            id: this.selector,
            url: "",
            width: 450,
            panelHeight: 250,
            fieldId: "userNameId",
            required: !1,
            formatter: "",
            onLoadSuccess: function (a, b) {
                setTimeout(function () {}, 400)
            },
            onShowPanel: function () {},
            onChange: function (b, c) {
                var d = a(this).iCombobox("options"),
                    e = a("#" + d.id);
                null == b && (b = e.iCombobox("getValue"));
                var f = d.initUrl.match(/{([\s\S]*?)}/g),
                    g = "";
                if (f.length > 0) for (var h = 0; h < f.length; h++) g = d.initUrl.replace(f[h], encodeURI(encodeURI(b)));
                e.iCombobox("reload", g)
            },
            onSelect: function (b) {
                var c = a(this).iCombobox("options");
                a("#" + c.id);
                if (a(this).iCombobox("hidePanel"), c.param) {
                    var d = a(this).closest("form"),
                        e = getSelectedRowJson(c.param, b);
                    a("#" + d.attr("id")).form("load", e)
                }
                setTimeout(function () {}, 200)
            },
            onUnselect: function (b) {
                var c = a(this).iCombobox("options");
                a("#" + c.id);
                setTimeout(function () {}, 200)
            },
            onHidePanel: function () {
                var b = a(this).iCombobox("options"),
                    c = a("#" + b.id);
                if (b.textField != b.valueField) {
                        c.combobox("getText"),
                        c.combobox("getValue")
                    }
            }
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("autocomplete")
    }(jQuery),


function (a) {
        a.fn.iCalendar = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCalendar.methods[b];
                return d ? d(this, c) : this.calendar(b, c)
            }
            this.each(function () {
                b = a.fn.iCalendar.parseOptions(this, b),
                a(this).calendar(b)
            })
        },
        a.fn.iCalendar.methods = {},
        a.fn.iCalendar.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.calendar.parseOptions(b), a.fn.iCalendar.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCalendar.defaults = {}
    }(jQuery),


function (a) {
        function b(b) {
            var c = a(b),
                e = c.children("input[type=checkbox]");
            e.each(function () {
                    var b = a(this),
                        c = a("<span/>").css(d.span),
                        e = a("<label/>").css(d.label),
                        f = a("<a/>").data("lable", e).css(d.checkbox).text(" "),
                        g = b.data("lable", e).attr("label");
                    b.hide(),
                    b.after(e.text(g)),
                    b.wrap(c),
                    b.before(f),
                    b.prop("checked") && f.css("background-position", "0 0"),
                    e.click(function () {
                            !
                            function (a, b) {
                                a.prop("checked", !a.prop("checked"));
                                var c = "-32px";
                                a.prop("checked") && (c = "0"),
                                b.css("background-position", c + " 0")
                            }(b, f)
                        }),
                    f.click(function () {
                            a(this).data("lable").click()
                        })
                })
        }
        function c(b, c, d) {
            var e = b.find("input[value=" + c + "]");
            e.length && e.prop("checked", d).each(function () {
                a(this).data("lable").click()
            })
        }
        var d = {
            checkbox: {
                cursor: "pointer",
                background: "transparent url('" + _tjp + "image/checkbox.png') no-repeat -32px 0",
                verticalAlign: "middle",
                height: "16px",
                width: "16px",
                display: "block"
            },
            span: {
                float: "left",
                display: "block",
                margin: "9px 4px 7px 4px"
            },
            label: {
                marginTop: "9px",
                marginRight: "8px",
                marginBottom: "9px",
                display: "block",
                float: "left",
                fontSize: "12px",
                cursor: "pointer"
            }
        };
        a.fn.iCheckbox = function (c, d) {
            return "string" == typeof c ? a.fn.iCheckbox.methods[c](this, d) : (c = c || {}, this.each(function () {
                if (a.data(this, "checkbox")) {
                    var d = a.data(this, "checkbox").options;
                    a.data(this, "checkbox", {
                        options: a.extend({}, d, c)
                    })
                } else a.data(this, "checkbox", {
                    options: a.extend({}, a.fn.iCheckbox.defaults, c)
                }),
                b(this)
            }))
        },
        a.fn.iCheckbox.methods = {
            getValue: function (a) {
                var b = a.find("input:checked"),
                    c = {};
                return b.each(function () {
                        var a = c[this.name];
                        return a ? (a.sort || (c[this.name] = [a]), void c[this.name].push(this.value)) : void(c[this.name] = this.value)
                    }),
                c
            },
            check: function (b, d) {
                d && "object" != typeof d ? c(b, d) : d.sort && a.each(d, function () {
                    c(b, this)
                })
            },
            unCheck: function (b, d) {
                d && "object" != typeof d ? c(b, d, !0) : d.sort && a.each(d, function () {
                    c(b, this, !0)
                })
            },
            checkAll: function (b) {
                b.find("input").prop("checked", !1).each(function () {
                    a(this).data("lable").click()
                })
            },
            unCheckAll: function (b) {
                b.find("input").prop("checked", !0).each(function () {
                    a(this).data("lable").click()
                })
            }
        },
        a.fn.iCheckbox.defaults = {
            style: d
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("checkbox")
    }(jQuery),


function (a) {
        a.fn.iCombo = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCombo.methods[b];
                return d ? d(this, c) : this.combo(b, c)
            }
            this.each(function () {
                b = a.fn.iCombo.parseOptions(this, b),
                a(this).combo(b)
            })
        },
        a.fn.iCombo.methods = {},
        a.fn.iCombo.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combo.parseOptions(b), a.fn.iCombo.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCombo.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iCombobox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCombobox.methods[b];
                return d ? d(this, c) : this.combobox(b, c)
            }
            this.each(function () {
                b = a.fn.iCombobox.parseOptions(this, b),
                a(this).combobox(b)
            })
        },
        a.fn.iCombobox.methods = {},
        a.fn.iCombobox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combobox.parseOptions(b), a.fn.iCombobox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCombobox.defaults = {
            width: 153,
            panelHeight: "auto",
            editable: !1,
            onShowPanel: function () {
                var b = a(this).iCombobox("options");
                if (null != b.url && b.url.indexOf("{") >= 0) {
                    var c = a(this).closest("form").serializeObject();
                    a("#" + b.id).combobox("reload", replaceUrlParamValueByBrace(b.url, c))
                }
            },
            onChange: function (b, c) {
                var d = a(this).iCombobox("options");
                if ("object" == typeof d.childCombobox) {
                    var e = d.childCombobox,
                        f = a("#" + e.id);
                    if (f.combobox("setText", ""), f.combobox("setValue", ""), e.url) {
                            var g = e.url.replace("{parentValue}", b);
                            f.combobox("reload", g)
                        }
                }
            },
            onSelect: function (b) {
                var c = a(this).iCombobox("options");
                if (c.param) {
                    var d = a(this).closest("form"),
                        e = getSelectedRowJson(c.param, b);
                    a("#" + d.attr("id")).form("load", e)
                }
            }
        }
    }(jQuery),


function (a) {
        a.fn.iCombogrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCombogrid.methods[b];
                return d ? d(this, c) : this.combogrid(b, c)
            }
            this.each(function () {
                b = a.fn.iCombogrid.parseOptions(this, b),
                a(this).combogrid(b)
            })
        },
        a.fn.iCombogrid.methods = {},
        a.fn.iCombogrid.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combogrid.parseOptions(b), a.fn.iCombogrid.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCombogrid.defaults = {
            id: this.selector,
            width: 153,
            mode: "remote",
            editable: !1,
            onChange: function (b, c) {
                var d = a(this).iCombogrid("options"),
                    e = a("#" + d.id);
                e.combogrid("grid").datagrid("load", {
                        q: b
                    }),
                e.combogrid("grid").datagrid("selectRecord", b)
            },
            onLoadSuccess: function (a) {},
            onSelect: function (b, c) {
                var d = a(this).iDatagrid("options"),
                    e = a("#" + d.id);
                if (d.param) {
                        var f = e.closest("form"),
                            g = getSelectedRowJson(d.param, c);
                        a("#" + f.attr("id")).form("load", g),
                        e.iCombogrid("textbox").focus()
                    }
            }
        }
    }(jQuery),


function (a) {
        function b(b, c) {
            var d = a("#" + c.id),
                e = b.iTree("getSelected"),
                f = {
                    id: d.combotree("getValue")
                };
            if (void 0 == e && "" != f.id) {
                    var g;
                    a.ajax({
                        type: "POST",
                        url: replaceUrlParamValueByBrace(c.getFatherIdsUrl, f),
                        success: function (a) {
                            var b = a.split(",");
                            for (i = b.length - 1; i >= 0; i--) g = d.combotree("tree").iTree("find", b[i].replace(/'/g, "")),
                            g && d.combotree("tree").iTree("expand", g.target)
                        }
                    }),
                    void 0 != f.id && d.combotree("setValue", f.id)
                }
        }
        a.fn.iCombotree = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCombotree.methods[b];
                return d ? d(this, c) : this.combotree(b, c)
            }
            this.each(function () {
                b = a.fn.iCombotree.parseOptions(this, b),
                a(this).combotree(b)
            })
        },
        a.fn.iCombotree.methods = {},
        a.fn.iCombotree.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combotree.parseOptions(b), a.fn.iCombotree.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCombotree.defaults = {
            id: this.selector,
            expandUrl: "",
            getFatherIdsUrl: "",
            width: 153,
            animate: !0,
            expandAll: !1,
            onBeforeExpand: function (b, c) {
                var d = a(this).iTree("options");
                a(this).iTree("options").url = replaceUrlParamValueByBrace(d.expandUrl, b)
            },
            onLoadSuccess: function (c, d) {
                var e = a(this).iTree("options"),
                    f = a("#" + e.id),
                    g = f.combotree("tree");
                g.iTree("expand", g.iTree("getRoot").target),
                e.expandAll && g.iTree("expandAll"),
                e.getFatherIdsUrl && setTimeout(function () {
                        b(g, e)
                    }, 100)
            },
            onSelect: function (b) {
                var c = a(this).iTree("options"),
                    d = a("#" + c.id),
                    e = d.closest("form");
                if (c.param) {
                        var f = getSelectedRowJson(c.param, b);
                        a("#" + e.attr("id")).form("load", f)
                    }
                "object" == typeof c.backfill && a.getJSON(replaceUrlParamValueByBrace(c.backfill.url, b), {}, function (b) {
                        a("#" + e.attr("id")).form("load", b)
                    })
            },
            onShowPanel: function () {},
            onBeforeSelect: function (b) {
                var c = a(this).iTree("options");
                if (c.onlyLeafCheck) {
                    var d = a(this).iTree("isLeaf", b.target);
                    if (!d) return a.messager.alert("提示操作！", "请展开选择子节点！", "warning"),
                    !1
                }
            }
        }
    }(jQuery),


function (a) {
        a.fn.iCombotreegrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iCombotreegrid.methods[b];
                return d ? d(this, c) : this.combotreegrid(b, c)
            }
            this.each(function () {
                b = a.fn.iCombotreegrid.parseOptions(this, b),
                a(this).combotreegrid(b)
            })
        },
        a.fn.iCombotreegrid.methods = {},
        a.fn.iCombotreegrid.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.combotreegrid.parseOptions(b), a.fn.iCombotreegrid.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iCombotreegrid.defaults = {
            width: 153,
            panelWidth: 450,
            animate: !0,
            onBeforeExpand: function (b, c) {
                var d = a(this).iTreegrid("options"),
                    e = a("#" + d.id),
                    f = e.combotreegrid("grid");
                f.treegrid("options").url = replaceUrlParamValueByBrace(d.expandUrl, b)
            },
            onChange: function (a, b) {},
            onLoadSuccess: function (b, c) {
                var d = a(this).iTreegrid("options"),
                    e = a("#" + d.id),
                    f = e.combotreegrid("grid");
                f.treegrid("expand", f.treegrid("getRoot").id),
                d.expandAll && f.treegrid("expandAll"),
                d.getFatherIdsUrl && setTimeout(function () {
                        var b = f.treegrid("getSelected"),
                            c = {
                                id: e.combotreegrid("getValue")
                            };
                        if (null == b && "" != c.id) {
                                var g;
                                a.ajax({
                                    type: "POST",
                                    url: replaceUrlParamValueByBrace(d.getFatherIdsUrl, c),
                                    success: function (a) {
                                        for (var b = a.split(","), c = b.length - 1; c >= 0; c--) g = f.treegrid("find", b[c].replace(/'/g, "")),
                                        g && f.treegrid("expand", g.id)
                                    }
                                }),
                                void 0 != c.id && e.combotreegrid("setValue", c.id)
                            }
                    }, 100)
            },
            onSelect: function (b, c) {
                var d = a(this).iTreegrid("options"),
                    e = a("#" + d.id);
                if (d.param) {
                        var f = e.closest("form"),
                            g = getSelectedRowJson(d.param, c);
                        a("#" + f.attr("id")).form("load", g),
                        e.combotreegrid("textbox").focus()
                    }
            }
        }
    }(jQuery);
var openDialog = function (a) {
        var b = $.data(a, "menubutton").options;
        b.dialog.mbId = b.id,
        $("#" + b.dialog.id).iDialog("createDialog", b.dialog);
        var c = b.dialog,
            d = b.parentGrid;
        if ("object" == typeof d) openDialogAndloadDataByParentGrid(b);
        else if (c.url) openDialogAndloadDataByUrl(b);
        else {
                if ("undefined" != c.onBeforeOpen && executeCallBackFun(c.onBeforeOpen, b), "object" == typeof b.grid && void 0 != b.grid.uncheckedMsg) {
                    var e = getCheckedRowsData(b.grid.type, b.grid.id);
                    if (0 == e.length) return void uncheckedAlert(b)
                }
                b.href = appendSourceUrlParam(c.href);
                var f = $("#" + c.id);
                if (f.iDialog(b.dialog), b.dialog.href.indexOf("{") != -1) {
                    var g = getSelectedRowData(b.grid.type, b.grid.id),
                        h = replaceUrlParamValueByBrace(appendSourceUrlParam(c.href), g);
                    f.iDialog({
                            href: h
                        }),
                    f.iDialog("open")
                } else f.iDialog("open")
            }
    },
    addParentTab = function (a) {
        var b, c, d = $.data(a, "menubutton").options,
            e = d.tab;
        if ("object" == typeof d.grid) {
                var f = d.grid;
                if (1 == f.checkboxSelect) {
                    var g = getCheckedRowsData(f.type, f.id);
                    if (0 == g.length) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.checkSelfGrid, topJUI.language.message.icon.warning);
                    b = g[0].UUID ? e.href.indexOf("?") >= 0 ? e.href + "&UUID=" + getMultiRowsFieldValue(g, "UUID") : e.href + "?UUID=" + getMultiRowsFieldValue(g, "UUID") : e.href.indexOf("?") >= 0 ? e.href + "&uuid=" + getMultiRowsFieldValue(g, "uuid") : e.href + "?uuid=" + getMultiRowsFieldValue(g, "uuid")
                } else if (isExistBrace(e.href)) {
                    var h = getSelectedRowData(f.type, f.id);
                    if (!h) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectSelfGrid, topJUI.language.message.icon.warning);
                    b = replaceUrlParamValueByBrace(e.href, h)
                } else b = e.href
            } else b = e.href;
        c = e.title;
        var i = '<iframe src="' + b + '" frameborder="0" style="border:0;width:100%;height:100%;"></iframe>',
            j = parent.$("#index_tabs"),
            k = getSelectedTabOpts(j);
        j.iTabs("add", {
                id: getRandomNumByDef(),
                refererTab: {
                    id: k.id
                },
                title: c,
                content: i,
                closable: !0,
                iconCls: d.iconCls
            })
    },
    openWindow = function (a) {
        var b, c = $.data(a, "menubutton").options;
        if ("object" == typeof c.grid) if (1 == c.grid.checkboxSelect) {
            var d = getCheckedRowsData(c.grid.type, c.grid.id);
            if (0 == d.length) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.checkSelfGrid, topJUI.language.message.icon.warning);
            b = replaceUrlParamValueByBrace(c.href, d, "multiple")
        } else {
            var e = getSelectedRowData(c.grid.type, c.grid.id);
            if (!e) return void $.messager.alert(topJUI.language.message.title.operationTips, topJUI.language.message.msg.selectSelfGrid, topJUI.language.message.icon.warning);
            b = replaceUrlParamValueByBrace(c.href, e)
        } else b = c.href;
        window.open(b)
    };
$.fn.serializeObject = function () {
        var a = {},
            b = this.serializeArray();
        return $.each(b, function () {
                void 0 !== a[this.name] ? (a[this.name].push || (a[this.name] = [a[this.name]]), a[this.name].push(this.value || "")) : a[this.name] = this.value || ""
            }),
        a
    };
var defaultConfig = {
        version: "v2.1.1_release",
        config: {
            pkName: "uuid",
            singleQuotesParam: !1,
            datagrid: {
                size: "rows",
                page: "page",
                rows: "rows",
                total: "total"
            },
            postJson: !0,
            statusCode: {
                success: 200,
                failure: 300
            }
        },
        language: {
            message: {
                showType: {
                    slide: "slide",
                    fade: "fade",
                    show: "show"
                },
                title: {
                    operationTips: "操作提示",
                    confirmTips: "确认提示"
                },
                msg: {
                    success: "操作成功",
                    failed: "操作失败",
                    error: "未知错误",
                    checkSelfGrid: "请先勾选要操作的数据前的复选框",
                    selectSelfGrid: "请先选中要操作的数据",
                    selectParentGrid: "请先选中主表中要操作的一条数据",
                    permissionDenied: "对不起，你没有操作权限",
                    confirmDelete: "你确定要删除所选的数据吗？"
                },
                icon: {
                    error: "messager-error",
                    question: "messager-question",
                    info: "messager-info",
                    warning: "messager-warning"
                }
            }
        },
        eventType: {
            initUI: {
                base: "topjui.initUI.base",
                dialog: "topjui.initUI.dialog",
                base2: "topjui.initUI.base2",
                echarts: "topjui.initUI.echarts",
                form: "topjui.initUI.form",
                advanceSearchForm: "topjui.initUI.advanceSearchForm",
                importExcelForm: "topjui.initUI.importExcelForm"
            },
            beforeInitUI: "topjui.beforeInitUI",
            afterInitUI: "topjui.afterInitUI",
            ajaxStatus: "topjui.ajaxStatus",
            resizeGrid: "topjui.resizeGrid",
            beforeAjaxLoad: "topjui.beforeAjaxLoad",
            beforeLoadNavtab: "topjui.beforeLoadNavtab",
            beforeLoadDialog: "topjui.beforeLoadDialog",
            afterLoadNavtab: "topjui.afterLoadNavtab",
            afterLoadDialog: "topjui.afterLoadDialog",
            beforeCloseNavtab: "topjui.beforeCloseNavtab",
            beforeCloseDialog: "topjui.beforeCloseDialog",
            afterCloseNavtab: "topjui.afterCloseNavtab",
            afterCloseDialog: "topjui.afterCloseDialog"
        },
        l: ""
    };
!
function (a) {
        function b(b, c) {
            b.preventDefault();
            var d = a(this),
                e = this.headerContextMenu,
                f = "tree-checkbox1",
                g = "tree-checkbox0";
            if (!e) {
                    for (var h = a('<div style="width:150px;"></div>').appendTo("body"), i = d.datagrid("getColumnFields"), j = 0; j < i.length; j++) {
                        var k = d.datagrid("getColumnOption", i[j]);
                        k.hidden ? a('<div iconCls="' + g + '" field="' + i[j] + '"/>').html(k.title).appendTo(h) : a('<div iconCls="' + f + '" field="' + i[j] + '"/>').html(k.title).appendTo(h)
                    }
                    e = this.headerContextMenu = h.menu({
                        onClick: function (b) {
                            var c = a(b.target).attr("field");
                            b.iconCls == f ? (d.datagrid("hideColumn", c), a(this).menu("setIcon", {
                                target: b.target,
                                iconCls: g
                            })) : (d.datagrid("showColumn", c), a(this).menu("setIcon", {
                                target: b.target,
                                iconCls: f
                            })),
                            e.menu("show")
                        }
                    })
                }
            e.menu("show", {
                    left: b.pageX,
                    top: b.pageY
                })
        }
        a.fn.iDatagrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iDatagrid.methods[b];
                return d ? d(this, c) : this.datagrid(b, c)
            }
            this.each(function () {
                b = a.fn.iDatagrid.parseOptions(this, b),
                b.toolbar = "#" + b.id + "-toolbar",
                a(this).datagrid(b)
            })
        },
        a.fn.iDatagrid.methods = {
            createGridHeaderContextMenu: b,
            singleSelectedAjax: function (b, c) {
                var d = getSelectedRowData(c.grid.type, c.grid.id);
                return null == d ? void unselectedAlert(c) : (c.url = replaceUrlParamValueByBrace(c.url, d), void a.messager.confirm(topJUI.language.message.title.confirmTips, c.confirmMsg, function (a) {
                    if (a) {
                        var b = doAjax(c);
                        b.statusCode == topJUI.config.statusCode.success && refreshGrid(c.grid.type, c.grid.id),
                        showMessage(b)
                    }
                }))
            },
            multiSelectedAjax: function (b, c) {
                var d = getSelectedRowsData(c.grid.type, c.grid.id);
                return 0 == d.length ? void unselectedAlert(c) : void a.messager.confirm(topJUI.language.message.title.confirmTips, c.confirmMsg, function (a) {
                    if (a) {
                        var b;
                        b = void 0 == c.grid.param ? topJUI.config.pkName + ":" + topJUI.config.pkName : c.grid.param;
                        var e = param2JsonObj(b);
                        c.ajaxData = convertParamObj2ObjData(e, d);
                        var f = doAjax(c);
                        f.statusCode == topJUI.config.statusCode.success && refreshGrid(c.grid.type, c.grid.id),
                        showMessage(f)
                    }
                })
            },
            multiCheckedAjax: function (b, c) {
                var d = getCheckedRowsData(c.grid.type, c.grid.id);
                return 0 == d.length ? void uncheckedAlert(c) : void a.messager.confirm(topJUI.language.message.title.confirmTips, c.confirmMsg, function (a) {
                    if (a) {
                        void 0 == c.grid.param && (c.grid.param = topJUI.config.pkName + ":" + topJUI.config.pkName),
                        c.ajaxData = convertParamObj2Serialize(param2JsonObj(c.grid.param), d);
                        var b = doAjax(c);
                        b.statusCode == topJUI.config.statusCode.success && c.grid.reload && refreshGrid(c.grid.type, c.grid.id),
                        showMessage(b)
                    }
                })
            },
            doCellTip: function (b, c) {
                function d(b, c, d) {
                    "" != a(c).text() && b.tooltip.text(a(c).text()).css({
                        top: d.pageY + 10 + "px",
                        left: d.pageX + 20 + "px",
                        "z-index": a.fn.window.defaults.zIndex,
                        display: "block"
                    })
                }
                return b.each(function () {
                    var b = a(this),
                        e = a(this).data("datagrid");
                    if (!e.tooltip) {
                            var f = b.datagrid("getPanel").panel("panel"),
                                g = {
                                    border: "1px solid #333",
                                    padding: "2px",
                                    color: "#333",
                                    background: "#f7f5d1",
                                    position: "absolute",
                                    "max-width": "800px",
                                    "border-radius": "4px",
                                    "-moz-border-radius": "4px",
                                    "-webkit-border-radius": "4px",
                                    display: "none"
                                },
                                h = a('<div id="celltip"></div>').appendTo("body");
                            h.css(a.extend({}, g, c.cls)),
                            e.tooltip = h,
                            f.find(".datagrid-body").each(function () {
                                    var b = a(this).find("> div.datagrid-body-inner").length ? a(this).find("> div.datagrid-body-inner")[0] : this;
                                    a(b).undelegate("td", "mouseover").undelegate("td", "mouseout").undelegate("td", "mousemove").delegate("td", {
                                        mouseover: function (a) {
                                            if (c.delay) {
                                                e.tipDelayTime && clearTimeout(e.tipDelayTime);
                                                var b = this;
                                                e.tipDelayTime = setTimeout(function () {
                                                    d(e, b, a)
                                                }, c.delay)
                                            } else d(e, this, a)
                                        },
                                        mouseout: function (a) {
                                            e.tipDelayTime && clearTimeout(e.tipDelayTime),
                                            e.tooltip.css({
                                                display: "none"
                                            })
                                        },
                                        mousemove: function (a) {
                                            var b = this;
                                            e.tipDelayTime ? (clearTimeout(e.tipDelayTime), e.tipDelayTime = setTimeout(function () {
                                                d(e, b, a)
                                            }, c.delay)) : d(e, b, a)
                                        }
                                    })
                                })
                        }
                })
            },
            cancelCellTip: function (b) {
                return b.each(function () {
                    var b = a(this).data("datagrid");
                    if (b.tooltip) {
                        b.tooltip.remove(),
                        b.tooltip = null;
                        var c = a(this).datagrid("getPanel").panel("panel");
                        c.find(".datagrid-body").undelegate("td", "mouseover").undelegate("td", "mouseout").undelegate("td", "mousemove")
                    }
                    b.tipDelayTime && (clearTimeout(b.tipDelayTime), b.tipDelayTime = null)
                })
            },
            fixRownumber: function (b) {
                return b.each(function () {
                    var b = a(this).datagrid("getPanel"),
                        c = a(".datagrid-cell-rownumber", b).last().clone();
                    c.css({
                            position: "absolute",
                            left: -1e3
                        }).appendTo("body");
                    var d = c.width("auto").width();
                    d > 25 ? (a(".datagrid-header-rownumber,.datagrid-cell-rownumber", b).width(d + 5), a(this).datagrid("resize"), c.remove(), c = null) : a(".datagrid-header-rownumber,.datagrid-cell-rownumber", b).removeAttr("style")
                })
            }
        },
        a.fn.iDatagrid.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.datagrid.parseOptions(b), a.fn.iDatagrid.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iDatagrid.defaults = {
            id: this.selector,
            width: "100%",
            height: "100%",
            fit: !0,
            border: !1,
            striped: !0,
            singleSelect: !0,
            toolbar: this.selector + "-toolbar",
            rownumbers: !0,
            pagination: !0,
            pageSize: 20,
            checkOnSelect: !1,
            selectOnCheck: !1,
            kindEditor: [],
            filterBtnIconCls: "fa fa-filter",
            initCreate: !0,
            onBeforeLoad: function (a) {
                return "page" != topJUI.config.datagrid.page && (a[topJUI.config.datagrid.page] = a.page, delete a.page),
                "rows" != topJUI.config.datagrid.size && (a[topJUI.config.datagrid.size] = a.rows, delete a.rows),
                !0
            },
            loadFilter: function (a) {
                var b = {};
                return b.total = a[topJUI.config.datagrid.total],
                b.rows = a[topJUI.config.datagrid.rows],
                b
            },
            onLoadSuccess: function () {
                var b = a(this).iDatagrid("options");
                if (a(this).iDatagrid("doCellTip", {
                    cls: {},
                    delay: 500
                }), a(this).iDatagrid("fixRownumber"), "object" == typeof b.childGrid) for (var c = b.childGrid.grids, d = 0; d < c.length; d++) {
                    var e = c[d].syncReload;
                    if (e) {
                        var f = a("#" + c[d].id);
                        "datagrid" == c[d].type ? f.datagrid("load") : "treegrid" == c[d].type && f.treegrid("load")
                    }
                }
            },
            onClickRow: function (b, c) {
                var d = a(this).iDatagrid("options");
                if ("object" == typeof d.childGrid) {
                    var e = {};
                    e = getSelectedRowJson(d.childGrid.param, c);
                    for (var f = d.childGrid.grids, g = 0; g < f.length; g++)!
                    function (b) {
                        setTimeout(function () {
                            var c = a("#" + f[b].id);
                            if ("datagrid" == f[b].type) {
                                var d = c.datagrid("options").queryParams;
                                c.datagrid("options").queryParams = a.extend({}, d, e),
                                c.datagrid("load")
                            } else if ("treegrid" == f[b].type) {
                                var d = c.treegrid("options").queryParams;
                                c.treegrid("options").queryParams = a.extend({}, d, e),
                                c.treegrid("load")
                            } else if ("panel" == f[b].type) {
                                var g = replaceUrlParamValueByBrace(f[b].href, e);
                                c.panel("refresh", g)
                            }
                        }, 100 * b)
                    }(g)
                }
                if ("object" == typeof d.childTabs) for (var h = d.childTabs, g = 0; g < h.length; g++) {
                    var i = a("#" + h[g].id),
                        j = i.tabs("options"),
                        k = i.tabs("getSelected"),
                        l = k.panel("options");
                    if (null != l.href || null != l.iframeHref) {
                            null != l.href && (l.tempHref = l.href, l.iframeHref = l.href, l.href = null),
                            "object" == typeof j.parentGrid && (l.iframeHref = setPanelQueryParams(l.tempHref, j.parentGrid));
                            var m = '<iframe src="' + l.iframeHref + '" scrolling="auto" frameborder="0" style="width:100%;height:99.5%;"></iframe>';
                            k.panel({
                                content: m
                            })
                        } else "object" == typeof l.dgOpts && ("object" == typeof j.parentGrid && setGridQueryParams(j.parentGrid, "datagrid", l.dgOpts.id), a("#" + l.dgOpts.id).datagrid("reload"))
                }
            },
            onHeaderContextMenu: b
        }
    }(jQuery),
topJUI = $.extend(!0, defaultConfig, myConfig),


function (a) {
        a.fn.iDatebox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iDatebox.methods[b];
                return d ? d(this, c) : this.datebox(b, c)
            }
            this.each(function () {
                b = a.fn.iDatebox.parseOptions(this, b);
                var c = a.extend([], a.fn.datebox.defaults.buttons);
                c.splice(1, 0, {
                    text: "清空",
                    handler: function (b) {
                        a("#" + b.id).datebox("setValue", ""),
                        a("#" + b.id).datebox("hidePanel")
                    }
                }),
                b.buttons = c,
                a(this).datebox(b)
            })
        },
        a.fn.iDatebox.methods = {},
        a.fn.iDatebox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.datebox.parseOptions(b), a.fn.iDatebox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iDatebox.defaults = {
            editable: !1,
            value: "",
            width: 153,
            panelWidth: 220,
            panelHeight: 240,
            formatter: function (b) {
                var c = a(this).iDatebox("options"),
                    d = b.getFullYear(),
                    e = b.getMonth() + 1,
                    f = b.getDate();
                return "YYYY" == c.pattern ? d : "YYYY-mm" == c.pattern ? d + "-" + convertDateToFullDate(e) : d + "-" + convertDateToFullDate(e) + "-" + convertDateToFullDate(f)
            },
            parser: function (a) {
                var b = Date.parse(a);
                return isNaN(b) ? new Date : new Date(b)
            },
            onSelect: function (a) {}
        }
    }(jQuery),


function (a) {
        a.fn.iDatetimebox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iDatetimebox.methods[b];
                return d ? d(this, c) : this.datetimebox(b, c)
            }
            this.each(function () {
                b = a.fn.iDatetimebox.parseOptions(this, b);
                var c = a.extend([], a.fn.datetimebox.defaults.buttons);
                c.splice(2, 0, {
                    text: "清空",
                    handler: function (b) {
                        a("#" + b.id).datetimebox("setValue", ""),
                        a("#" + b.id).datetimebox("hidePanel")
                    }
                }),
                b.buttons = c,
                a(this).datetimebox(b)
            })
        },
        a.fn.iDatetimebox.methods = {},
        a.fn.iDatetimebox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.datetimebox.parseOptions(b), a.fn.iDatetimebox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iDatetimebox.defaults = {
            editable: !1,
            width: 153,
            panelWidth: 220,
            panelHeight: 240
        }
    }(jQuery),


function (a) {
        a.fn.iDatetimespinner = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iDatetimespinner.methods[b];
                return d ? d(this, c) : this.datetimespinner(b, c)
            }
            this.each(function () {
                b = a.fn.iDatetimespinner.parseOptions(this, b),
                a(this).datetimespinner(b)
            })
        },
        a.fn.iDatetimespinner.methods = {},
        a.fn.iDatetimespinner.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.datetimespinner.parseOptions(b), a.fn.iDatetimespinner.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iDatetimespinner.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iDialog = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iDialog.methods[b];
                return d ? d(this, c) : this.dialog(b, c)
            }
            this.each(function () {
                b = a.fn.iDialog.parseOptions(this, b),
                b.href && (b.href = b.href + location.search),
                b.toolbar || (b.toolbar = "#" + b.id + "-toolbar"),
                b.buttons || (b.buttons = "#" + b.id + "-buttons"),
                b.top = .5 * a(document.body).height() - .5 * b.height,
                b.left = .5 * a(document.body).width() - .5 * b.width,
                a(this).dialog(b)
            })
        },
        a.fn.iDialog.methods = {
            createDialog: function (b, c) {
                if (0 == a("#" + c.id).length) {
                    void 0 == c.id && (c.id = getRandomNumByDef());
                    var d = 0 == c.form ? "div" : "form",
                        e = "<" + d + ' id="' + c.id + '"></' + d + ">",
                        f = "",
                        g = [];
                    if ("object" == typeof c.buttonsGroup) {
                            var h = c.buttonsGroup;
                            a.each(h, function (a, b) {
                                b.handler || (b.handler = "ajaxForm"),
                                void 0 == b.id && g.push(getRandomNumByDef()),
                                f += '<a id="' + g[a] + '" href="#" data-options="mbId:\'' + c.mbId + "',dialogId:'" + c.id + "'\">" + b.text + "</a>"
                            })
                        }
                    if (a("body").append(e + '<div id="' + c.id + '-buttons" style="display:none">' + f + '<a href="#" class="closeDialog" onclick="javascript:$(\'#' + c.id + "').dialog('close')\">关闭</a></div>"), "object" == typeof c.buttonsGroup) {
                            var i = c.buttonsGroup;
                            a.each(i, function (b, c) {
                                a("#" + g[b]).iLinkbutton(c)
                            })
                        }
                    a(".closeDialog").iLinkbutton({
                            iconCls: "fa fa-close",
                            btnCls: "topjui-btn-normal",
                            text: "关闭"
                        })
                }
            }
        },
        a.fn.iDialog.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.dialog.parseOptions(b), a.fn.iDialog.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iDialog.defaults = {
            id: this.selector,
            width: 520,
            height: 320,
            title: "新增/编辑",
            modal: !0,
            closed: !0,
            iconCls: "fa fa-windows",
            collapsible: !1,
            maximizable: !1,
            minimizable: !1,
            maximized: !1,
            resizable: !1,
            openAnimation: "show",
            openDuration: 100,
            closeAnimation: "show",
            closeDuration: 400,
            zIndex: 10,
            postfix: "Edit",
            combotreeFields: "",
            refreshTreeId: "",
            onBeforeLoad: function () {},
            onBeforeOpen: function () {},
            onLoad: function () {
                var b = a(this).iDialog("options");
                if (a.iParser.parse(a("#" + b.id)), b.mbId) {
                    var c = a("#" + b.id),
                        d = a("#" + b.mbId).iMenubutton("options");
                    if (a.messager.progress("close"), a(this).dialog("center"), void 0 != b.url) {
                            var e = getSelectedRowData(d.grid.type, d.grid.id),
                                f = replaceUrlParamValueByBrace(b.url, e);
                            a.getJSON(f, function (d) {
                                    if (c.form("load", d), "string" == typeof b.editor || "object" == typeof b.editor) {
                                        if ("string" == typeof b.editor) {
                                            var e = [],
                                                f = [];
                                            e = b.editor.replace(/'/g, '"').split(",");
                                            for (var g = 0; g < e.length; g++) f.push(strToJson(e[g]))
                                        } else f = b.editor;
                                        for (var g = 0; g < f.length; g++) {
                                            var h = f[g].type,
                                                i = f[g].id,
                                                j = f[g].field;
                                            "kindeditor" == h ? a("iframe").each(function (a) {
                                                    this.contentWindow.document.body.innerHTML = html_decode(d[j])
                                                }) : UE.getEditor(i).ready(function () {
                                                    UE.getEditor(i).setContent(d[j])
                                                })
                                        }
                                    }
                                })
                        }
                    if ("object" == typeof d.parentGrid) {
                            var g = getSelectedRowData(d.parentGrid.type, d.parentGrid.id),
                                h = getSelectedRowJson(d.parentGrid.param, g);
                            c.form("load", h)
                        }
                }
            },
            onClose: function () {
                a(this).form("clear")
            }
        }
    }(jQuery),


function (a) {
        a.fn.iEcharts = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iEcharts.methods[b];
                return d ? d(this, c) : this.validatebox(b, c)
            }
            this.each(function () {
                b = a.fn.iEcharts.parseOptions(this, b);
                var c = document.getElementById(b.id);
                a("#" + b.id).css({
                    width: b.width,
                    height: b.height
                });
                var d = echarts.init(c);
                d.setOption({}),
                a.ajax({
                    url: b.url,
                    type: "post",
                    dataType: "json",
                    success: function (a, b, c) {
                        d.setOption(a)
                    },
                    error: function (b) {
                        a.iMessager.alert("提示信息", "获取图表数据失败!", "messager-error"),
                        d.hideLoading()
                    }
                })
            })
        },
        a.fn.iEcharts.methods = {},
        a.fn.iEcharts.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.iEcharts.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iEcharts.defaults = {},
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("echarts")
    }(jQuery),


function (a) {
        function b(b, c) {
            b.preventDefault();
            var d = a(this),
                e = this.headerContextMenu,
                f = "tree-checkbox1",
                g = "tree-checkbox0";
            if (!e) {
                    for (var h = a('<div style="width:150px;"></div>').appendTo("body"), i = d.datagrid("getColumnFields"), j = 0; j < i.length; j++) {
                        var k = d.datagrid("getColumnOption", i[j]);
                        k.hidden ? a('<div iconCls="' + g + '" field="' + i[j] + '"/>').html(k.title).appendTo(h) : a('<div iconCls="' + f + '" field="' + i[j] + '"/>').html(k.title).appendTo(h)
                    }
                    e = this.headerContextMenu = h.menu({
                        onClick: function (b) {
                            var c = a(b.target).attr("field");
                            b.iconCls == f ? (d.datagrid("hideColumn", c), a(this).menu("setIcon", {
                                target: b.target,
                                iconCls: g
                            })) : (d.datagrid("showColumn", c), a(this).menu("setIcon", {
                                target: b.target,
                                iconCls: f
                            })),
                            e.menu("show")
                        }
                    })
                }
            e.menu("show", {
                    left: b.pageX,
                    top: b.pageY
                })
        }
        a.fn.datagrid.defaults.onHeaderContextMenu = b,
        a.fn.treegrid.defaults.onHeaderContextMenu = b,
        a.fn.iEdatagrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iEdatagrid.methods[b];
                return d ? d(this, c) : this.edatagrid(b, c)
            }
            this.each(function () {
                b = a.fn.iEdatagrid.parseOptions(this, b),
                b.url = appendSourceUrlParam(b.url),
                b.toolbar = "#" + b.id + "-toolbar",
                a(this).edatagrid(b)
            })
        },
        a.fn.iEdatagrid.methods = {},
        a.fn.iEdatagrid.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.edatagrid.parseOptions(b), a.fn.iEdatagrid.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iEdatagrid.defaults = {
            id: this.selector,
            width: "100%",
            height: "100%",
            fit: !0,
            fitColumns: !1,
            border: !1,
            striped: !0,
            rownumbers: !0,
            pagination: !0,
            pageSize: 20,
            editable: !0,
            checkOnSelect: !1,
            selectOnCheck: !1,
            kindEditor: [],
            filterBtnIconCls: "fa fa-filter",
            remoteFilter: !0,
            onBeforeLoad: function (a) {},
            onLoadSuccess: function () {},
            onClickRow: function (b, c) {
                var d = a(this).iEdatagrid("options");
                if ("object" == typeof d.childGrid) {
                    var e = {};
                    e = getSelectedRowJson(d.childGrid.param, c);
                    for (var f = d.childGrid.grids, g = 0; g < f.length; g++)!
                    function (b) {
                        setTimeout(function () {
                            var c = a("#" + f[b].id);
                            if ("datagrid" == f[b].type) {
                                var d = c.datagrid("options").queryParams;
                                c.datagrid("options").queryParams = a.extend({}, d, e),
                                c.datagrid("load")
                            } else if ("treegrid" == f[b].type) {
                                var d = c.treegrid("options").queryParams;
                                c.treegrid("options").queryParams = a.extend({}, d, e);
                                c.treegrid("load")
                            } else if ("panel" == f[b].type) {
                                var g = replaceUrlParamValueByBrace(f[b].href, e);
                                c.panel("refresh", g)
                            }
                        }, 100 * b)
                    }(g)
                }
            }
        }
    }(jQuery),


function (a) {
        function b() {
            h = a.grep(h, function (a) {
                return a.length && a.data("edatagrid")
            })
        }
        function c(c) {
            b(),
            a.map(h, function (b) {
                b[0] != a(c)[0] && b.edatagrid("saveRow")
            }),
            b()
        }
        function d(c) {
            b();
            for (var d = 0; d < h.length; d++) if (a(h[d])[0] == a(c)[0]) return;
            h.push(a(c))
        }
        function e(c) {
            b(),
            h = a.grep(h, function (b) {
                return a(b)[0] != a(c)[0]
            })
        }
        function f(b) {
            var c = a.data(b, "edatagrid").options;
            a(b).datagrid(a.extend({}, c, {
                onDblClickCell: function (d, e, f) {
                    c.editing && (a(this).edatagrid("editRow", d), g(b, e)),
                    c.onDblClickCell && c.onDblClickCell.call(b, d, e, f)
                },
                onClickCell: function (d, e, f) {
                    c.editing && c.editIndex >= 0 && (a(this).edatagrid("editRow", d), g(b, e)),
                    c.onClickCell && c.onClickCell.call(b, d, e, f)
                },
                onBeforeEdit: function (e, f) {
                    return (!c.onBeforeEdit || 0 != c.onBeforeEdit.call(b, e, f)) && (c.autoSave && d(this), void(c.originalRow = a.extend(!0, [], f)))
                },
                onAfterEdit: function (d, f) {
                    e(this),
                    c.editIndex = -1;
                    var g = f.isNewRecord ? c.saveUrl : c.updateUrl;
                    if (g) {
                        for (var h = !1, i = a(this).edatagrid("getColumnFields", !0).concat(a(this).edatagrid("getColumnFields")), j = 0; j < i.length; j++) {
                            var k = i[j],
                                l = a(this).edatagrid("getColumnOption", k);
                            if (l.editor && c.originalRow[k] != f[k]) {
                                    h = !0;
                                    break
                                }
                        }
                        h ? a.post(g, f, function (e) {
                            if (e.isError) return a(b).edatagrid("cancelRow", d),
                            a(b).edatagrid("selectRow", d),
                            a(b).edatagrid("editRow", d),
                            void c.onError.call(b, d, e);
                            if (e.isNewRecord = null, a(b).datagrid("updateRow", {
                                index: d,
                                row: e
                            }), c.tree) {
                                var g = f[c.idField || "id"],
                                    h = a(c.tree),
                                    i = h.tree("find", g);
                                if (i) i.text = f[c.treeTextField],
                                h.tree("update", i);
                                else {
                                        var j = h.tree("find", f[c.treeParentField]);
                                        h.tree("append", {
                                            parent: j ? j.target : null,
                                            data: [{
                                                id: g,
                                                text: f[c.treeTextField]
                                            }]
                                        })
                                    }
                            }
                            c.onSuccess.call(b, d, f),
                            c.onSave.call(b, d, f)
                        }, "json") : c.onSave.call(b, d, f)
                    } else c.onSave.call(b, d, f);
                    c.onAfterEdit && c.onAfterEdit.call(b, d, f)
                },
                onCancelEdit: function (d, f) {
                    e(this),
                    c.editIndex = -1,
                    f.isNewRecord && a(this).datagrid("deleteRow", d),
                    c.onCancelEdit && c.onCancelEdit.call(b, d, f)
                },
                onBeforeLoad: function (d) {
                    if (0 == c.onBeforeLoad.call(b, d)) return !1;
                    if (a(this).edatagrid("cancelRow"), c.tree) {
                        var e = a(c.tree).tree("getSelected");
                        d[c.treeParentField] = e ? e.id : void 0
                    }
                }
            })),
            c.tree && a(c.tree).tree({
                url: c.treeUrl,
                onClick: function (c) {
                    a(b).datagrid("load")
                },
                onDrop: function (d, e, f) {
                    var g = a(this).tree("getNode", d).id;
                    a.ajax({
                        url: c.treeDndUrl,
                        type: "post",
                        data: {
                            id: e.id,
                            targetId: g,
                            point: f
                        },
                        dataType: "json",
                        success: function () {
                            a(b).datagrid("load")
                        }
                    })
                }
            })
        }
        function g(b, c) {
            var d, e = a(b).edatagrid("options"),
                f = a(b).datagrid("getEditor", {
                    index: e.editIndex,
                    field: c
                });
            if (f) d = f.target;
            else {
                    var g = a(b).datagrid("getEditors", e.editIndex);
                    g.length && (d = g[0].target)
                }
            d && (a(d).hasClass("textbox-f") ? a(d).textbox("textbox").focus() : a(d).focus())
        }
        var h = [];
        a(function () {
            a(document).unbind(".edatagrid").bind("mousedown.edatagrid", function (b) {
                var d = a(b.target).closest("div.datagrid-view,div.combo-panel,div.window,div.window-mask");
                return d.length ? void(d.hasClass("datagrid-view") && c(d.children("table"))) : void c()
            })
        }),
        a.fn.edatagrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.edatagrid.methods[b];
                return d ? d(this, c) : this.datagrid(b, c)
            }
            return b = b || {},
            this.each(function () {
                var c = a.data(this, "edatagrid");
                c ? a.extend(c.options, b) : a.data(this, "edatagrid", {
                    options: a.extend({}, a.fn.edatagrid.defaults, a.fn.edatagrid.parseOptions(this), b)
                }),
                f(this)
            })
        },
        a.fn.edatagrid.parseOptions = function (b) {
            return a.extend({}, a.fn.datagrid.parseOptions(b), {})
        },
        a.fn.edatagrid.methods = {
            options: function (b) {
                var c = a.data(b[0], "edatagrid").options;
                return c
            },
            loadData: function (b, c) {
                return b.each(function () {
                    a(this).edatagrid("cancelRow"),
                    a(this).datagrid("loadData", c)
                })
            },
            enableEditing: function (b) {
                return b.each(function () {
                    var b = a.data(this, "edatagrid").options;
                    b.editing = !0
                })
            },
            disableEditing: function (b) {
                return b.each(function () {
                    var b = a.data(this, "edatagrid").options;
                    b.editing = !1
                })
            },
            isEditing: function (b, c) {
                var d = a.data(b[0], "edatagrid").options,
                    e = d.finder.getTr(b[0], c);
                return e.length && e.hasClass("datagrid-row-editing")
            },
            editRow: function (b, c) {
                return b.each(function () {
                    var b = a(this),
                        d = a.data(this, "edatagrid").options,
                        e = d.editIndex;
                    if (e != c) if (b.datagrid("validateRow", e)) {
                            if (e >= 0 && 0 == d.onBeforeSave.call(this, e)) return void setTimeout(function () {
                                b.datagrid("selectRow", e)
                            }, 0);
                            if (b.datagrid("endEdit", e), b.datagrid("beginEdit", c), !b.edatagrid("isEditing", c)) return;
                            d.editIndex = c,
                            g(this);
                            var f = b.datagrid("getRows");
                            d.onEdit.call(this, c, f[c])
                        } else setTimeout(function () {
                            b.datagrid("selectRow", e)
                        }, 0)
                })
            },
            addRow: function (b, c) {
                return b.each(function () {
                    function b(a, b) {
                        void 0 == a ? (d.datagrid("appendRow", b), e.editIndex = f.length - 1) : (d.datagrid("insertRow", {
                            index: a,
                            row: b
                        }), e.editIndex = a)
                    }
                    var d = a(this),
                        e = a.data(this, "edatagrid").options;
                    if (e.editIndex >= 0) {
                            if (!d.datagrid("validateRow", e.editIndex)) return void d.datagrid("selectRow", e.editIndex);
                            if (0 == e.onBeforeSave.call(this, e.editIndex)) return void setTimeout(function () {
                                d.datagrid("selectRow", e.editIndex)
                            }, 0);
                            d.datagrid("endEdit", e.editIndex)
                        }
                    var f = d.datagrid("getRows");
                    if ("object" == typeof c ? b(c.index, a.extend(c.row, {
                            isNewRecord: !0
                        })) : b(c, {
                            isNewRecord: !0
                        }), d.datagrid("beginEdit", e.editIndex), d.datagrid("selectRow", e.editIndex), e.tree) {
                            var g = a(e.tree).tree("getSelected");
                            f[e.editIndex][e.treeParentField] = g ? g.id : 0
                        }
                    e.onAdd.call(this, e.editIndex, f[e.editIndex])
                })
            },
            saveRow: function (b) {
                return b.each(function () {
                    var b = a(this),
                        c = a.data(this, "edatagrid").options;
                    if (c.editIndex >= 0) {
                            if (0 == c.onBeforeSave.call(this, c.editIndex)) return void setTimeout(function () {
                                b.datagrid("selectRow", c.editIndex)
                            }, 0);
                            a(this).datagrid("endEdit", c.editIndex)
                        }
                })
            },
            cancelRow: function (b) {
                return b.each(function () {
                    var b = a.data(this, "edatagrid").options;
                    b.editIndex >= 0 && a(this).datagrid("cancelEdit", b.editIndex)
                })
            },
            destroyRow: function (b, c) {
                return b.each(function () {
                    function b(b) {
                        var c = d.datagrid("getRowIndex", b);
                        if (c != -1) if (b.isNewRecord) d.datagrid("cancelEdit", c);
                        else if (e.destroyUrl) {
                            var f = b[e.idField || "id"];
                            a.post(e.destroyUrl, {
                                id: f
                            }, function (c) {
                                var g = d.datagrid("getRowIndex", f);
                                if (c.isError) return d.datagrid("selectRow", g),
                                void e.onError.call(d[0], g, c);
                                if (e.tree) {
                                    d.datagrid("reload");
                                    var h = a(e.tree),
                                        i = h.tree("find", f);
                                    i && h.tree("remove", i.target)
                                } else d.datagrid("cancelEdit", g),
                                d.datagrid("deleteRow", g);
                                e.onDestroy.call(d[0], g, b);
                                var j = d.datagrid("getPager");
                                j.length && !d.datagrid("getRows").length && (d.datagrid("options").pageNumber = j.pagination("options").pageNumber, d.datagrid("reload"))
                            }, "json")
                        } else d.datagrid("cancelEdit", c),
                        d.datagrid("deleteRow", c),
                        e.onDestroy.call(d[0], c, b)
                    }
                    var d = a(this),
                        e = a.data(this, "edatagrid").options,
                        f = [];
                    if (void 0 == c) f = d.datagrid("getSelections");
                    else for (var g = a.isArray(c) ? c : [c], h = 0; h < g.length; h++) {
                            var i = e.finder.getRow(this, g[h]);
                            i && f.push(i)
                        }
                    return f.length ? void a.messager.confirm(e.destroyMsg.confirm.title, e.destroyMsg.confirm.msg, function (a) {
                            if (a) {
                                for (var c = 0; c < f.length; c++) b(f[c]);
                                d.datagrid("clearSelections")
                            }
                        }) : void a.messager.show({
                            title: e.destroyMsg.norecord.title,
                            msg: e.destroyMsg.norecord.msg
                        })
                })
            }
        },
        a.fn.edatagrid.defaults = a.extend({}, a.fn.datagrid.defaults, {
            singleSelect: !0,
            editing: !0,
            editIndex: -1,
            destroyMsg: {
                norecord: {
                    title: "Warning",
                    msg: "No record is selected."
                },
                confirm: {
                    title: "Confirm",
                    msg: "Are you sure you want to delete?"
                }
            },
            autoSave: !1,
            url: null,
            saveUrl: null,
            updateUrl: null,
            destroyUrl: null,
            tree: null,
            treeUrl: null,
            treeDndUrl: null,
            treeTextField: "name",
            treeParentField: "parentId",
            onAdd: function (a, b) {},
            onEdit: function (a, b) {},
            onBeforeSave: function (a) {},
            onSave: function (a, b) {},
            onSuccess: function (a, b) {},
            onDestroy: function (a, b) {},
            onError: function (a, b) {}
        }),
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("edatagrid")
    }(jQuery),


function (a) {
        a.fn.iFilebox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iFilebox.methods[b];
                return d ? d(this, c) : this.filebox(b, c)
            }
            this.each(function () {
                b = a.fn.iFilebox.parseOptions(this, b),
                a(this).filebox(b)
            })
        },
        a.fn.iFilebox.methods = {},
        a.fn.iFilebox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.filebox.parseOptions(b), a.fn.iFilebox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iFilebox.defaults = {
            width: 450,
            buttonText: "选择"
        }
    }(jQuery),


function (a) {
        a.fn.iForm = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iForm.methods[b];
                return d ? d(this, c) : this.form(b, c)
            }
            this.each(function () {
                b = a.fn.iForm.parseOptions(this, b),
                a(this).form(b)
            })
        },
        a.fn.iForm.methods = {},
        a.fn.iForm.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.form.parseOptions(b), a.fn.iForm.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iForm.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iLayout = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iLayout.methods[b];
                return d ? d(this, c) : this.layout(b, c)
            }
            this.each(function () {
                b = a.fn.iLayout.parseOptions(this, b),
                a(this).layout(b)
            })
        },
        a.fn.iLayout.methods = {},
        a.fn.iLayout.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.layout.parseOptions(b), a.fn.iLayout.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iLayout.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iLinkbutton = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iLinkbutton.methods[b];
                return d ? d(this, c) : this.linkbutton(b, c)
            }
            this.each(function () {
                b = a.fn.iLinkbutton.parseOptions(this, b),
                b.text = "" == b.text ? a(this).text() : b.text,
                a(this).linkbutton(b)
            })
        },
        a.fn.iLinkbutton.methods = {},
        a.fn.iLinkbutton.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.linkbutton.parseOptions(b), a.fn.iLinkbutton.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iLinkbutton.defaults = {
            iconCls: "fa fa-cog",
            btnCls: "topjui-btn-green",
            onClick: function () {
                var b = a(this).iLinkbutton("options");
                if ("object" == typeof b.form) {
                    var c = b.form;
                    "submit" == c.method ? a("#" + c.id).form("submit", {
                        url: c.url,
                        onSubmit: function () {
                            var b = a(this).form("validate");
                            return b || a.messager.progress("close"),
                            b
                        },
                        success: function (c) {
                            var c = strToJson(c);
                            if (c.statusCode == topJUI.config.statusCode.success) {
                                a.messager.progress("close");
                                var d = parent.$("#index_tabs"),
                                    e = getSelectedTabOpts(d);
                                if (b.form.refreshCurrentTab) {
                                        var f = parent.$("#" + e.id),
                                            g = f.find("iframe")[0];
                                        g.contentWindow.location.href = g.src
                                    }
                                if (b.form.refreshRefererTab) {
                                        var f = parent.$("#" + e.refererTab.id),
                                            g = f.find("iframe")[0];
                                        g.contentWindow.location.href = g.src
                                    }
                            }
                        }
                    }) : "reset" == c.method ? a("#" + c.id).form("reset") : "clear" == c.method && a("#" + c.id).form("clear")
                }
                if ("ajaxForm" == b.handler || "multiAjaxForm" == b.handler) {
                    "undefined" != b.handlerBefore && executeCallBackFun(b.handlerBefore);
                    var d = a("#" + b.mbId).menubutton("options"),
                        e = d.grid;
                    d.dialog;
                    if (a("#" + b.dialogId).form("validate")) {
                            if (b.ajaxData = a("#" + b.dialogId).serialize(), "multiAjaxForm" == b.handler) {
                                var f = getCheckedRowsData(e.type, e.id);
                                void 0 == e.param && (e.param = topJUI.config.pkName + ":" + topJUI.config.pkName),
                                b.ajaxData += "&" + convertParamObj2Serialize(param2JsonObj(e.param), f)
                            }
                            var g = doAjax(b);
                            if (g.statusCode == topJUI.config.statusCode.success) {
                                if (a("#" + b.dialogId).dialog("close"), "object" == typeof e) if ("datagrid" == e.type) a("#" + e.id).datagrid("reload");
                                else if ("treegrid" == e.type) {
                                    var h = getSelectedRowData(e.type, e.id);
                                    null == h ? a("#" + e.id).treegrid("reload") : a("#" + e.id).treegrid("reload", h[e.parentIdField])
                                }
                                refreshGrids(b.reload)
                            }
                            showMessage(g)
                        }
                }
            }
        }
    }(jQuery),


function (a) {
        a.fn.iMenu = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iMenu.methods[b];
                return d ? d(this, c) : this.menu(b, c)
            }
            this.each(function () {
                b = a.fn.iMenu.parseOptions(this, b),
                a(this).menu(b)
            })
        },
        a.fn.iMenu.methods = {},
        a.fn.iMenu.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.menu.parseOptions(b), a.fn.iMenu.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iMenu.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iMenubutton = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iMenubutton.methods[b];
                return d ? d(this, c) : this.menubutton(b, c)
            }
            this.each(function () {
                b = a.fn.iMenubutton.parseOptions(this, b),
                b = bindMenuClickEvent(a(this), b),
                b.text = "" == b.text ? a(this).text() : b.text,
                a(this).menubutton(b)
            })
        },
        a.fn.iMenubutton.methods = {
            openDialog: function (a) {
                return a.each(function () {
                    openDialog(this)
                })
            },
            openTab: function (a) {
                return a.each(function () {
                    addParentTab(this)
                })
            },
            openWindow: function (a) {
                return a.each(function () {
                    openWindow(this)
                })
            },
            doAjax: function (a) {
                return a.each(function () {
                    doAjaxHandler(this)
                })
            },
            request: function (a) {
                return a.each(function () {
                    requestHandler(this)
                })
            },
            delete: function (a) {
                return a.each(function () {
                    deleteHandler(this)
                })
            },
            filter: function (a) {
                return a.each(function () {
                    filterHandler(this)
                })
            },
            search: function (a) {
                return a.each(function () {
                    searchHandler(this)
                })
            },
            query: function (a) {
                return a.each(function () {
                    queryHandler(this)
                })
            },
            export: function (a) {
                return a.each(function () {
                    exportHandler(this)
                })
            },
            import: function (a) {
                return a.each(function () {
                    importHandler(this)
                })
            },
            upload: function (a) {
                return a.each(function () {
                    uploadHandler(this)
                })
            },
            edatagrid: function (a) {
                return a.each(function () {
                    edatagridHandler(this)
                })
            }
        },
        a.fn.iMenubutton.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.menubutton.parseOptions(b), a.fn.iMenubutton.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iMenubutton.defaults = {
            plain: !0,
            iconCls: "fa fa-cog",
            hasDownArrow: !1,
            onClick: function () {
                var b = a(this).iMenubutton("options");
                b.method && a(this).iMenubutton(b.method)
            }
        }
    }(jQuery),


function (a) {
        a.fn.iMessager = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iMessager.methods[b];
                return d ? d(this, c) : this.messager(b, c)
            }
            this.each(function () {
                b = a.fn.iMessager.parseOptions(this, b),
                a(this).messager(b)
            })
        },
        a.fn.iMessager.methods = {},
        a.iMessager = {
            show: function (b) {
                return a.messager.show(b)
            },
            alert: function (b, c, d, e) {
                return a.messager.alert(b, c, d, e)
            },
            confirm: function (b, c, d) {
                return a.messager.confirm(b, c, d)
            },
            prompt: function (b, c, d) {
                return a.messager.prompt(b, c, d)
            },
            progress: function (b) {
                return a.messager.progress(b)
            }
        },
        a.fn.iMessager.parseOptions = function (b, c) {
            return a.extend({}, a.fn.messager.parseOptions(b), a.fn.iMessager.defaults, a.parser.parseOptions(b), setId(b, c))
        },
        a.fn.iMessager.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iNumberbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iNumberbox.methods[b];
                return d ? d(this, c) : this.numberbox(b, c)
            }
            this.each(function () {
                b = a.fn.iNumberbox.parseOptions(this, b),
                a(this).numberbox(b)
            })
        },
        a.fn.iNumberbox.methods = {},
        a.fn.iNumberbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.numberbox.parseOptions(b), a.fn.iNumberbox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iNumberbox.defaults = {
            width: 153,
            groupSeparator: ","
        }
    }(jQuery),


function (a) {
        a.fn.iNumberspinner = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iNumberspinner.methods[b];
                return d ? d(this, c) : this.numberspinner(b, c)
            }
            this.each(function () {
                b = a.fn.iNumberspinner.parseOptions(this, b),
                "currentYear" == b.defaultValueType ? (b.value = currentYear, b.min = 1900, b.max = 2200) : "currentSeason" == b.defaultValueType ? (1 == currentMonth || 2 == currentMonth || 3 == currentMonth ? b.value = 1 : 4 == currentMonth || 5 == currentMonth || 6 == currentMonth ? b.value = 2 : 7 == currentMonth || 8 == currentMonth || 9 == currentMonth ? b.value = 3 : 10 != currentMonth && 11 != currentMonth && 12 != currentMonth || (b.value = 4), b.min = 1, b.max = 4) : "currentMonth" == b.defaultValueType ? (b.value = currentMonth, b.min = 1, b.max = 12) : "currentDay" == b.defaultValueType ? (b.value = currentDay, b.min = 1, b.max = 31) : "currentHour" == b.defaultValueType && (b.value = currentHour, b.min = 0, b.max = 24),
                a(this).numberspinner(b)
            })
        },
        a.fn.iNumberspinner.methods = {},
        a.fn.iNumberspinner.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.numberspinner.parseOptions(b), a.fn.iNumberspinner.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iNumberspinner.defaults = {
            width: 153,
            defaultValueType: ""
        }
    }(jQuery),


function (a) {
        a.fn.iPanel = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iPanel.methods[b];
                return d ? d(this, c) : this.panel(b, c)
            }
            this.each(function () {
                b = a.fn.iPanel.parseOptions(this, b),
                a(this).panel(b)
            })
        },
        a.fn.iPanel.methods = {},
        a.fn.iPanel.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.panel.parseOptions(b), a.fn.iPanel.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iPanel.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iPasswordbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iPasswordbox.methods[b];
                return d ? d(this, c) : this.passwordbox(b, c)
            }
            this.each(function () {
                b = a.fn.iPasswordbox.parseOptions(this, b),
                a(this).passwordbox(b)
            })
        },
        a.fn.iPasswordbox.methods = {},
        a.fn.iPasswordbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.passwordbox.parseOptions(b), a.fn.iPasswordbox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iPasswordbox.defaults = {}
    }(jQuery),
+
function (a) {
        "use strict";
        a(document).on(topJUI.eventType.initUI.base, function (b, c) {
            a('[data-toggle="topjui-datagrid"]', c).each(function (b) {
                var c = a(this),
                    d = getOptionsJson(c),
                    e = {
                        initCreate: !0
                    };
                if (d = a.extend(e, d), d.initCreate) {
                        var f = c.find("thead:first")[0];
                        if (a(f).attr("frozen")) {
                            var f = [];
                            c.find("thead:first th").each(function (a) {
                                f.push(strToJson("{" + this.getAttribute("data-options") + "}"))
                            }),
                            d.frozenColumns = [f];
                            var g = [];
                            c.find("thead:eq(1) th").each(function (a) {
                                g.push(strToJson("{" + this.getAttribute("data-options") + "}"))
                            })
                        } else {
                            var g = [];
                            c.find("thead th").each(function (a) {
                                g.push(strToJson("{" + this.getAttribute("data-options") + "}"))
                            })
                        }
                        d.columns = [g];
                        c.iDatagrid(d)
                    }
            }),
            a('[data-toggle="topjui-tabs"]', c).each(function () {
                var b = a(this),
                    c = getOptionsJson(b);
                b.attr("id", c.id),
                a("#" + c.id).iTabs(c)
            })
        }),
        a(document).on(topJUI.eventType.initUI.advanceSearchForm, function (b, c) {
            for (var d = a.cookie("fieldNameStr").split(","), e = a.cookie("colNameStr").split(","), f = [], g = 0; g < e.length; g++) f.push({
                value: d[g],
                text: e[g]
            });
            a(".field:last").iCombobox({
                textField: "text",
                valueField: "value",
                data: f,
                editable: !1,
                width: 140
            }),
            a(".op:last").iCombobox({
                textField: "text",
                valueField: "value",
                data: [{
                    text: "包含",
                    value: "contains",
                    selected: !0
                },
                {
                    text: "等于",
                    value: "equal"
                },
                {
                    text: "不等于",
                    value: "notequal"
                },
                {
                    text: "大于",
                    value: "greater"
                },
                {
                    text: "大于或等于",
                    value: "greaterorequal"
                },
                {
                    text: "小于",
                    value: "less"
                },
                {
                    text: "小于或等于",
                    value: "lessorequal"
                },
                {
                    text: "以...开头",
                    value: "beginwith"
                },
                {
                    text: "以...结尾",
                    value: "endwith"
                }],
                width: 120,
                panelHeight: 220,
                editable: !1
            }),
            a(".value:last").iTextbox({}),
            a(".lb:last").iCombobox({
                textField: "text",
                valueField: "value",
                data: [{
                    text: "无",
                    value: "",
                    selected: !0
                },
                {
                    text: "(",
                    value: "("
                }],
                width: 45,
                panelHeight: 70,
                editable: !1
            }),
            a(".rb:last").iCombobox({
                textField: "text",
                valueField: "value",
                data: [{
                    text: "无",
                    value: "",
                    selected: !0
                },
                {
                    text: ")",
                    value: ")"
                }],
                width: 45,
                panelHeight: 70,
                editable: !1
            }),
            a(".join:last").iCombobox({
                textField: "text",
                valueField: "value",
                data: [{
                    text: "并且",
                    value: "and",
                    selected: !0
                },
                {
                    text: "或者",
                    value: "or"
                }],
                width: 70,
                panelHeight: 70,
                editable: !1
            }),
            a("#addCondition").menubutton({
                iconCls: "fa fa-plus",
                hasDownArrow: !1
            }),
            a(".deleteCondition:last").menubutton({
                iconCls: "fa fa-minus",
                hasDownArrow: !1
            }),
            a(".deleteCondition:last").on("click", function () {
                var b = a(".deleteCondition").index(this) + 2;
                a("#advanceSearchTable tr:eq(" + b + ")").remove()
            })
        }),
        a(document).on(topJUI.eventType.initUI.importExcelForm, function (b, c) {
            setTimeout(function () {
                for (var b = a.cookie("fieldNameStr"), c = b.split(","), d = "", e = 0; e < c.length; e++) d += e == c.length - 1 ? "'{" + e + "}'" : "'{" + e + "}',";
                var f = "INSERT INTO {table} (" + b + ") VALUES (" + d + ")";
                a("#importExcelSql").textbox("setValue", f)
            }, 1e3)
        })
    }(jQuery),
$(function () {
        $(this).trigger(topJUI.eventType.initUI.base, $(document)),
        setTimeout(function () {
            $("#importExcelDialog").dialog({
                width: 650,
                height: 200,
                title: "高级查询",
                modal: !1,
                collapsible: !0,
                minimizable: !1,
                maximized: !1,
                resizable: !0,
                closed: !0,
                iconCls: "icon-find",
                href: "/system/excel/excelImport",
                zIndex: 10,
                buttons: "#importExcelDialog-buttons",
                onLoad: function () {
                    $(this).trigger(topJUI.eventType.initUI.importExcelForm)
                }
            })
        }, 1e3),
        $("#submitImportExcelForm").on("click", function () {
            var a = $("#importExcelDialog").serializeArray();
            $.ajax({
                type: "POST",
                url: getUrl("controller") + "importExcel",
                data: a,
                dataType: "json",
                success: function (a) {
                    showMessage({
                        statusCode: a.statusCode,
                        title: a.title,
                        message: a.message
                    }),
                    $("#importExcelDialog").dialog("close").form("reset"),
                    refreshGrid($.cookie("gridType"), $.cookie("gridId"))
                },
                error: function (a) {
                    showMessage({
                        statusCode: topJUI.config.statusCode.failure,
                        title: topJUI.message.title.operationTips,
                        message: a
                    })
                }
            })
        })
    }),


function (a) {
        function b(b) {
            var d = a(b),
                e = d.children("input[type=radio]"),
                f = "";
            e.each(function () {
                    var b = a(this),
                        d = a("<span/>").css(c.span),
                        g = a("<label/>").css(c.label),
                        h = a("<a/>").data("lable", g).addClass("RadioA").css(c.radio).text(" "),
                        i = b.data("lable", g).attr("label");
                    b.hide(),
                    b.after(g.text(i)),
                    b.wrap(d),
                    b.before(h),
                    b.prop("checked") && (f = h),
                    g.click(function () {
                            !
                            function (b) {
                                b.prop("checked", !0),
                                e.each(function () {
                                    var b = a(this),
                                        c = "-32px";
                                    b.prop("checked") && (c = "0"),
                                    b.prev().css("background-position", c + " 0")
                                })
                            }(b)
                        }),
                    h.click(function () {
                            a(this).data("lable").click()
                        })
                }),
            f.css("background-position", "0 0")
        }
        var c = {
            radio: {
                cursor: "pointer",
                background: "transparent url('" + _tjp + "image/radiobox.png') no-repeat -32px 0",
                verticalAlign: "middle",
                height: "16px",
                width: "16px",
                display: "block"
            },
            span: {
                float: "left",
                display: "block",
                margin: "9px 4px 7px 4px"
            },
            label: {
                marginTop: "9px",
                marginRight: "8px",
                marginBottom: "9px",
                display: "block",
                float: "left",
                fontSize: "12px",
                cursor: "pointer"
            }
        };
        a.fn.iRadio = function (c, d) {
            return "string" == typeof c ? a.fn.iRadio.methods[c](this, d) : (c = c || {}, this.each(function () {
                if (a.data(this, "radio")) {
                    var d = a.data(this, "radio").options;
                    a.data(this, "radio", {
                        options: a.extend({}, d, c)
                    })
                } else a.data(this, "radio", {
                    options: a.extend({}, a.fn.iRadio.defaults, c)
                }),
                b(this)
            }))
        },
        a.fn.iRadio.methods = {
            getValue: function (a) {
                var b = a.find("input:checked"),
                    c = {};
                return b.length && (c[b[0].name] = b[0].value),
                c
            },
            check: function (a, b) {
                if (b && "object" != typeof b) {
                    var c = a.find("input[value=" + b + "]");
                    c.prop("checked", !1).data("lable").click()
                }
            }
        },
        a.fn.iRadio.defaults = {
            style: c
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("radio")
    }(jQuery),


function (a) {
        a.fn.iSearchbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iSearchbox.methods[b];
                return d ? d(this, c) : this.searchbox(b, c)
            }
            this.each(function () {
                b = a.fn.iSearchbox.parseOptions(this, b),
                a(this).searchbox(b)
            })
        },
        a.fn.iSearchbox.methods = {},
        a.fn.iSearchbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.searchbox.parseOptions(b), a.fn.iSearchbox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iSearchbox.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iSlider = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iSlider.methods[b];
                return d ? d(this, c) : this.slider(b, c)
            }
            this.each(function () {
                b = a.fn.iSlider.parseOptions(this, b),
                a(this).slider(b)
            })
        },
        a.fn.iSlider.methods = {},
        a.fn.iSlider.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.slider.parseOptions(b), a.fn.iSlider.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iSlider.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iSpinner = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iSpinner.methods[b];
                return d ? d(this, c) : this.spinner(b, c)
            }
            this.each(function () {
                b = a.fn.iSpinner.parseOptions(this, b),
                a(this).spinner(b)
            })
        },
        a.fn.iSpinner.methods = {},
        a.fn.iSpinner.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.spinner.parseOptions(b), a.fn.iSpinner.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iSpinner.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iSplitbutton = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iSplitbutton.methods[b];
                return d ? d(this, c) : this.splitbutton(b, c)
            }
            this.each(function () {
                b = a.fn.iSplitbutton.parseOptions(this, b),
                a(this).splitbutton(b)
            })
        },
        a.fn.iSplitbutton.methods = {},
        a.fn.iSplitbutton.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.splitbutton.parseOptions(b), a.fn.iSplitbutton.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iSplitbutton.defaults = {}
    }(jQuery),


function (a) {
        a.fn.iSwitchbutton = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iSwitchbutton.methods[b];
                return d ? d(this, c) : this.switchbutton(b, c)
            }
            this.each(function () {
                b = a.fn.iSwitchbutton.parseOptions(this, b),
                a(this).switchbutton(b)
            })
        },
        a.fn.iSwitchbutton.methods = {},
        a.fn.iSwitchbutton.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.switchbutton.parseOptions(b), a.fn.iSwitchbutton.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iSwitchbutton.defaults = {
            width: 153,
            value: "1"
        }
    }(jQuery),


function (a) {
        a.fn.iTabs = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTabs.methods[b];
                return d ? d(this, c) : this.tabs(b, c)
            }
            this.each(function () {
                b = a.fn.iTabs.parseOptions(this, b),
                a(this).tabs(b)
            })
        },
        a.extend(a.fn.tabs.methods, {}),
        a.fn.iTabs.methods = {
            myAdd: function (b, c) {
                return b.each(function () {
                    a(this).tabs("add", c)
                })
            },
            bindDblclick: function (b, c) {
                return b.each(function () {
                    var b = this;
                    a(this).children("div.tabs-header").find("ul.tabs").undelegate("li", "dblclick.tabs").delegate("li", "dblclick.tabs", function (d) {
                        if (c && "function" == typeof c) {
                            var e = a(this).text(),
                                f = a(b).tabs("getTabIndex", a(b).tabs("getTab", e));
                            c(f, e)
                        }
                    })
                })
            },
            unbindDblclick: function (b) {
                return b.each(function () {
                    a(this).children("div.tabs-header").find("ul.tabs").undelegate("li", "dblclick.tabs")
                })
            }
        },
        a.fn.iTabs.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.tabs.parseOptions(b), a.fn.iTabs.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iTabs.defaults = {
            refererTab: "",
            closable: !0,
            border: !0,
            fit: !0,
            initShow: !1,
            onSelect: function (b, c) {
                var d = a(this).iTabs("options"),
                    e = (d.tab, d.parentGrid),
                    f = a("#" + d.id).tabs("getTab", c),
                    g = f.panel("options");
                if (null != g.href || null != g.iframeHref) {
                        if (null != g.href && (g.tempHref = g.href, g.iframeHref = g.href, g.href = null), "object" == typeof e && (g.iframeHref = setPanelQueryParams(g.tempHref, e)), g.iframeHref.indexOf("{") == -1) {
                            var h = '<iframe src="' + g.iframeHref + '" scrolling="auto" frameborder="0" style="width:100%;height:99.5%;"></iframe>';
                            f.panel({
                                content: h
                            })
                        }
                    } else {
                        var i = a("#" + g.id).children('[data-toggle="topjui-datagrid"]');
                        i.length > 0 ? a("#" + g.id).children('[data-toggle="topjui-datagrid"]').each(function (b) {
                            var c = a(this),
                                d = getOptionsJson(c),
                                f = d.url;
                            d.url = "",
                            a(this).iDatagrid(d);
                            a("#" + d.id);
                            "object" == typeof e && setGridQueryParams(e, "datagrid", d.id),
                            a(this).iDatagrid("options").url = f,
                            a(this).iDatagrid("load"),
                            g.dgOpts = d
                        }) : "object" == typeof g.dgOpts && ("object" == typeof e && setGridQueryParams(e, "datagrid", g.dgOpts.id), a("#" + g.dgOpts.id).datagrid("reload")),
                        a("#" + g.id).children('[data-toggle="topjui-form"]').each(function (b) {
                            a(this).removeClass("hidden"),
                            a(g.footer).removeClass("hidden")
                        })
                    }
            },
            onLoad: function (a) {},
            onBeforeLoad: function () {},
            onLoad: function () {},
            onOpen: function () {}
        }
    }(jQuery),


function (a) {
        a.fn.iTagbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTagbox.methods[b];
                return d ? d(this, c) : this.tagbox(b, c)
            }
            this.each(function () {
                b = a.fn.iTagbox.parseOptions(this, b),
                a(this).tagbox(b)
            })
        },
        a.fn.iTagbox.methods = {},
        a.fn.iTagbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.tagbox.parseOptions(b), a.fn.iTagbox.defaults, a.parser.parseOptions(b, ["id", "label", "value"]), c);
            return setId(b, d)
        },
        a.fn.iTagbox.defaults = {
            width: 450
        }
    }(jQuery),


function (a) {
        a.fn.iTextarea = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTextarea.methods[b];
                return d ? d(this, c) : this.textbox(b, c)
            }
            this.each(function () {
                b = a.fn.iTextarea.parseOptions(this, b),
                a(this).textbox(b)
            })
        },
        a.fn.iTextarea.methods = {},
        a.fn.iTextarea.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.textbox.parseOptions(b), a.fn.iTextarea.defaults, a.parser.parseOptions(b, ["id", "value"]), c);
            return setId(b, d)
        },
        a.fn.iTextarea.defaults = {
            multiline: !0,
            width: 450,
            height: 66
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("textarea")
    }(jQuery),


function (a) {
        a.fn.iTextbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTextbox.methods[b];
                return d ? d(this, c) : this.textbox(b, c)
            }
            this.each(function () {
                b = a.fn.iTextbox.parseOptions(this, b),
                a(this).textbox(b)
            })
        },
        a.fn.iTextbox.methods = {},
        a.fn.iTextbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.textbox.parseOptions(b), a.fn.iTextbox.defaults, a.parser.parseOptions(b, ["id", "value"]), c);
            return setId(b, d)
        },
        a.fn.iTextbox.defaults = {
            width: 153
        }
    }(jQuery),


function (a) {
        a.fn.iTimeaxis = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTimeaxis.methods[b];
                return d ? d(this, c) : this.validatebox(b, c)
            }
            this.each(function () {
                b = a.fn.iTimeaxis.parseOptions(this, b),
                a(this).addClass("topjui-timeaxis-container"),
                a(this).append('<div class="wrapper"><div class="light"><i></i></div><div class="topjui-timeaxis-main"><h1 class="title">' + b.title + "</h1></div></div>");
                for (var c = 0; c < b.list.length; c++) {
                    a(".topjui-timeaxis-main").append('<div class="year year' + c + '"></div>'),
                    a(".year" + c).append('<h2><a href="#">' + b.list[c].year + "<i></i></a></h2>"),
                    a(".year" + c).append('<div class="list"><ul class="ul' + c + '"></ul></div>');
                    for (var d = 0; d < b.list[c].list.length; d++) {
                        var e = b.list[c].list[d].highlight ? " highlight" : "";
                        a(".year .ul" + c).append('<li class="cls' + e + '"><p class="date">' + b.list[c].list[d].date + '</p><p class="intro">' + b.list[c].list[d].intro + '</p><p class="version">' + b.list[c].list[d].version + '</p><div class="more more' + c + d + '"></div></li>');
                        for (var f = 0; f < b.list[c].list[d].more.length; f++) a("ul .more" + c + d).append("<p>" + b.list[c].list[d].more[f] + "</p>")
                    }
                }
            }),
            a(function () {
                a(".topjui-timeaxis-main .year .list").each(function (b, c) {
                    var d = a(c),
                        e = d.find("ul");
                    d.height(e.outerHeight()),
                    e.css("position", "absolute")
                }),
                a(".topjui-timeaxis-main .year>h2>a").click(function (b) {
                    b.preventDefault(),
                    a(this).parents(".year").toggleClass("close-year")
                })
            })
        },
        a.fn.iTimeaxis.methods = {},
        a.fn.iTimeaxis.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.iTimeaxis.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iTimeaxis.defaults = {},
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("timeaxis")
    }(jQuery),


function (a) {
        a.fn.iTimespinner = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTimespinner.methods[b];
                return d ? d(this, c) : this.timespinner(b, c)
            }
            this.each(function () {
                b = a.fn.iTimespinner.parseOptions(this, b),
                a(this).timespinner(b)
            })
        },
        a.fn.iTimespinner.methods = {},
        a.fn.iTimespinner.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.timespinner.parseOptions(b), a.fn.iTimespinner.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iTimespinner.defaults = {}
    }(jQuery),
$(function () {}),


function (a) {
        a.fn.iTree = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTree.methods[b];
                return d ? d(this, c) : this.tree(b, c)
            }
            this.each(function () {
                b = a.fn.iTree.parseOptions(this, b),
                a(this).tree(b)
            })
        },
        a.fn.iTree.methods = {},
        a.fn.iTree.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.tree.parseOptions(b), a.fn.iTree.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iTree.defaults = {
            id: this.selector,
            expandUrl: "",
            animate: !0
        }
    }(jQuery),


function (a) {
        a.fn.iTreegrid = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iTreegrid.methods[b];
                return d ? d(this, c) : this.treegrid(b, c)
            }
            this.each(function () {
                b = a.fn.iTreegrid.parseOptions(this, b),
                b.toolbar = "#" + b.id + "-toolbar",
                b.url = appendSourceUrlParam(b.url),
                a(this).treegrid(b)
            })
        },
        a.fn.iTreegrid.methods = {
            cascadeCheck: function (b, c) {
                function d(b, c, e, f) {
                    var g = a(b.selector).treegrid("getParent", c);
                    if (g) {
                        var h = g[e];
                        f ? a(b.selector).treegrid("select", h) : a(b.selector).treegrid("unselect", h),
                        d(b, h, e, f)
                    }
                }
                function e(b, c, d, f, g) {
                    !g && f && a(b).treegrid("expand", c);
                    for (var h = a(b).treegrid("getChildren", c), i = 0; i < h.length; i++) {
                        var j = h[i][d];
                        g ? a(b).treegrid("select", j) : a(b).treegrid("unselect", j),
                        e(b, j, d, f, g)
                    }
                }
                var f = a.data(b[0], "treegrid").options;
                if (!f.singleSelect) {
                    for (var g = f.idField, h = !1, i = a(b.selector).treegrid("getSelections"), j = 0; j < i.length; j++) i[j][g] == c.id && (h = !0);
                    d(b, c.id, g, h),
                    e(b, c.id, g, c.deepCascade, h)
                }
            }
        },
        a.fn.iTreegrid.parseOptions = function (b, c) {
           var c = a.extend({}, a.parser.parseOptions(b, ["id"]), c);
            if (!c.toolbar) {
                var d = "" == b.id ? c.id : b.id;
                c.toolbar = "#" + d + "-toolbar"
            }
            var e = a.extend({}, a.fn.treegrid.parseOptions(b), a.fn.iTreegrid.defaults, c);
            return e.initUrl = e.url,
            setId(b, e)
        },
        a.fn.iTreegrid.defaults = {
            beforeExpandUrl: "",
            idField: "id",
            treeField: "text",
            fit: !0,
            border: !1,
            singleSelect: !1,
            expandRoot: !0,
            expandAll: !1,
            pageSize: 20,
            animate: !0,
            onBeforeLoad: function (a) {},
            onBeforeExpand: function (b) {
                var c = a(this).iTreegrid("options");
                a(this).iTreegrid("options").url = replaceUrlParamValueByBrace(c.expandUrl, b)
            },
            onExpand: function (a) {},
            onLoadSuccess: function () {
                var b = a(this).iTreegrid("options");
                if (b.expandAll && a("#" + b.id).iTreegrid("expandAll"), b.expandRoot) {
                    var c = a("#" + b.id).iTreegrid("getRoot");
                    c && a("#" + b.id).iTreegrid("expand", c[b.idField])
                }
                a(this).iTreegrid("options").url = topJUI.config.appendRefererParam ? appendSourceUrlParam(b.initUrl) : b.initUrl
            },
            onContextMenu: function (b, c) {
                a(this).iTreegrid("options")
            },
            onClickRow: function (b) {
                var c = a(this).iTreegrid("options");
                
                if (a("#" + c.id).iTreegrid("cascadeCheck", {
                    id: b.id,
                    deepCascade: !0
                }), "object" == typeof c.childGrid) {
                    var d = {};
                    d = getSelectedRowJson(c.childGrid.param, b);
                    for (var e = c.childGrid.grids, f = 0; f < e.length; f++) {
                        var g = a("#" + e[f].id);
                        if ("datagrid" == e[f].type) {
                            var h = g.datagrid("options").queryParams;
                            g.iDatagrid("options").queryParams = a.extend({}, h, d),
                            g.iDatagrid("load")
                        } else if ("treegrid" == e[f].type) {
                            var h = g.treegrid("options").queryParams;
                            a("#" + e[f].id).iTreegrid("options").queryParams = a.extend({}, h, d),
                        	a("#" + e[f].id).iTreegrid("load");
                        } else if ("panel" == e[f].type) {
                            var i = replaceUrlParamValueByBrace(e[f].href, b);
                            g.panel("refresh", i)
                        }
                    }
                }
                if ("object" == typeof c.childTab) for (var j = c.childTab, f = 0; f < j.length; f++) {
                    var k = a("#" + j[f].id),
                        l = k.tabs("options"),
                        m = k.tabs("getSelected"),
                        n = m.panel("options");
                    if (null != n.href || null != n.iframeHref) {
                            void 0 != n.href && (n.iframeHref = n.href, n.href = null);
                            var o = '<iframe src="' + n.iframeHref + '" scrolling="auto" frameborder="0" style="width:100%;height:99.5%;"></iframe>';
                            m.panel({
                                content: o
                            })
                        } else "object" == typeof n.dgOpts && ("object" == typeof l.parentGrid && setGridQueryParams(l.parentGrid, "datagrid", n.dgOpts.id), a("#" + n.dgOpts.id).datagrid("reload"))
                }
            },
            onHeaderContextMenu: a.fn.iDatagrid.methods.createGridHeaderContextMenu
        }
    }(jQuery),


function (a) {
        a.fn.iUeditor = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iUeditor.methods[b];
                return d ? d(this, c) : this.textbox(b, c)
            }
            this.each(function () {
                b = a.fn.iUeditor.parseOptions(this, b),
                UE.delEditor(b.id);
                var c = [
                    ["fullscreen", "source", "|", "undo", "redo", "|", "bold", "italic", "underline", "fontborder", "strikethrough", "superscript", "subscript", "removeformat", "|", "formatmatch", "autotypeset", "blockquote", "pasteplain", "|", "forecolor", "backcolor", "insertorderedlist", "insertunorderedlist", "lineheight", "|", "horizontal", "spechars", "map", "paragraph", "fontfamily", "fontsize", "insertcode", "|", "indent", "justifyleft", "justifycenter", "justifyright", "justifyjustify", "|", "link", "unlink", "|", "emotion", "attachment", "simpleupload", "insertimage", "|", "preview"]
                ],
                    d = [
                        ["fullscreen", "source", "undo", "redo", "bold", "italic", "underline", "fontborder", "strikethrough", "superscript", "subscript", "insertunorderedlist", "insertorderedlist", "justifyleft", "justifycenter", "justifyright", "justifyjustify", "removeformat", "simpleupload", "snapscreen", "emotion", "attachment", "link", "unlink", "indent", "lineheight", "autotypeset"]
                ];
                UE.getEditor(b.id, {
                        toolbars: "simple" == b.mode ? d : c,
                        initialFrameWidth: 700,
                        initialFrameHeight: b.height,
                        autoHeightEnabled: !0,
                        autoFloatEnabled: !0,
                        readonly: !! b.readonly
                    })
            })
        },
        a.fn.iUeditor.methods = {},
        a.fn.iUeditor.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.textbox.parseOptions(b), a.fn.iUeditor.defaults, a.parser.parseOptions(b, ["id", "value"]), c);
            return setId(b, d)
        },
        a.fn.iUeditor.defaults = {
            height: 300
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("ueditor")
    }(jQuery),


function (a) {
        a.fn.iUploadbox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iUploadbox.methods[b];
                return d ? d(this, c) : this.textbox(b, c)
            }
            this.each(function () {
                b = a.fn.iUploadbox.parseOptions(this, b),
                0 == a("#" + b.id + "-btn").length && (a("body").append('<button type="button" class="layui-btn" id="' + b.id + '-btn" style="display: none;">上传图片</button>'), layui.use("upload", function () {
                    var a = layui.jquery,
                        c = layui.upload;
                    c.render({
                            elem: "#" + b.id + "-btn",
                            url: b.uploadUrl,
                            accept: b.accept,
                            before: function (a) {
                                layer.load()
                            },
                            done: function (c, d, e) {
                                c.statusCode == topJUI.config.statusCode.success ? a("#" + b.id).textbox("setValue", c.filePath) : layer.msg(c.msg, {
                                    icon: 5
                                }),
                                layer.closeAll("loading")
                            },
                            error: function () {
                                layer.closeAll("loading")
                            }
                        })
                })),
                b.onClickButton = function () {
                    a("#" + b.id + "-btn").trigger("click")
                },
                a(this).textbox(b)
            })
        },
        a.fn.iUploadbox.methods = {},
        a.fn.iUploadbox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.textbox.parseOptions(b), a.fn.iUploadbox.defaults, a.parser.parseOptions(b, ["id", "value"]), c);
            return setId(b, d)
        },
        a.fn.iUploadbox.defaults = {
            width: 450,
            buttonText: "选择图片",
            accept: "images",
            buttonIcon: "fa fa-cloud-upload"
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("uploadbox")
    }(jQuery),


function (a) {
        a.fn.iUploader = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iUploader.methods[b];
                return d ? d(this, c) : this.textbox(b, c)
            }
            this.each(function () {
                b = a.fn.iUploader.parseOptions(this, b),
                a(this).menubutton(b);
                var c, d, e, f = "pending",
                    g = 0,
                    h = !1,
                    i = '<div id="uploaderDialog"><div id="upfileGrid-toolbar" data-options="border:false"><div style="float: left;margin-right:5px;"><div id="chooseFile">选择文件</div></div><a id="startUpload" style="margin-right:5px;">开始上传</a><a id="removeFile">移除文件</a></div><table id="upfileGrid"></table></div>';
                a("body").append(i + '<div id="uploaderDialog-buttons" style="display:none"><a href="#" id="closeUploaderDialog">关闭</a></div>'),
                d = a("#upfileGrid").datagrid({
                        fit: !0,
                        fitColumns: !0,
                        rownumbers: !0,
                        nowrap: !0,
                        animate: !1,
                        border: !1,
                        singleSelect: !1,
                        idField: "fileId",
                        pagination: !1,
                        toolbar: "#upfileGrid-toolbar",
                        columns: [
                            [{
                                field: "ck",
                                checkbox: !0
                            },
                            {
                                field: "fileId",
                                title: "fileId",
                                hidden: !0
                            },
                            {
                                field: "fileName",
                                title: "文件名称",
                                width: 100
                            },
                            {
                                field: "fileSize",
                                title: "文件大小",
                                width: 30
                            },
                            {
                                field: "validateMd5",
                                title: "文件验证",
                                width: 20
                            },
                            {
                                field: "progress",
                                title: "上传进度",
                                width: 180,
                                fixed: !0,
                                formatter: function (a, b) {
                                    var c = '<div class="easyui-progressbar progressbar" style="width: 165px; height: 20px;" value="' + a + '" text="' + a + '%"><div class="progressbar-text" style="width: 165px; height: 20px; line-height: 20px;">' + a + '%</div><div class="progressbar-value" style="width: ' + a + '%; height: 20px; line-height: 20px;"><div class="progressbar-text" style="width: 165px; height: 20px; line-height: 20px;">' + a + "%</div></div></div>";
                                    return c
                                }
                            },
                            {
                                field: "fileState",
                                title: "上传状态",
                                width: 20
                            }]
                        ]
                    }),
                WebUploader.Uploader.register({
                        "before-send-file": "beforeSendFile"
                    }, {
                        beforeSendFile: function (b) {
                            var e = new a.Deferred;
                            return (new WebUploader.Uploader).md5File(b, 0, 10485760).progress(function (a) {
                                d.datagrid("updateRow", {
                                    index: d.datagrid("getRowIndex", b.id),
                                    row: {
                                        validateMd5: 100 * a + "%"
                                    }
                                })
                            }).then(function (f) {
                                a.ajax({
                                    type: "POST",
                                    url: "/system/attachment/md5Validate",
                                    data: {
                                        type: "md5Check",
                                        md5: f
                                    },
                                    cache: !1,
                                    timeout: 3e3,
                                    dataType: "json"
                                }).then(function (g, h, i) {
                                    g.isHave ? (e.reject(), c.skipFile(b), d.datagrid("updateRow", {
                                        index: d.datagrid("getRowIndex", b.id),
                                        row: {
                                            fileState: "秒传",
                                            progress: 100
                                        }
                                    })) : (a.extend(c.options.formData, {
                                        md5: f
                                    }), e.resolve())
                                }, function (a, b, c) {
                                    e.resolve()
                                })
                            }),
                            a.when(e)
                        }
                    }),
                c = WebUploader.create({
                        resize: !1,
                        swf: _tjp + "/plugins/webuploader/js/Uploader.swf",
                        server: "/system/attachment/upload",
                        pick: "#chooseFile",
                        fileSingleSizeLimit: 104857600,
                        accept: [{
                            title: "file",
                            extensions: "doc,docx,pdf,xls,xlsx,ppt,pptx,gif,jpg,jpeg,bmp,png,rar,zip",
                            mimeTypes: "application/msword,application/vnd.openxmlformats-officedocument.wordprocessingml.document,application/pdf,application/vnd.ms-excel,application/vnd.openxmlformats-officedocument.spreadsheetml.sheet,application/vnd.ms-powerpoint,application/vnd.openxmlformats-officedocument.presentationml.presentation,image/jpg,image/jpeg,image/png,image/gif,application/x-rar,application/zip"
                        }]
                    }),
                c.on("fileQueued", function (a) {
                        var b = bytesToSize(a.size),
                            c = {
                                fileId: a.id,
                                fileName: a.name,
                                fileSize: b,
                                validateMd5: "0%",
                                progress: 0,
                                fileState: "等待上传"
                            };
                        d.datagrid("insertRow", {
                                index: 0,
                                row: c
                            })
                    }),
                c.on("uploadProgress", function (a, b) {
                        d.datagrid("updateRow", {
                            index: d.datagrid("getRowIndex", a.id),
                            row: {
                                progress: (100 * b).toFixed(2)
                            }
                        })
                    }),
                c.on("uploadSuccess", function (b) {
                        for (var c = d.datagrid("getRows"), e = 0; e < c.length; e++) c[e].fileId == b.id && (a('input[type="checkbox"]')[e + 1].disabled = !0);
                        a("#removeFile").linkbutton("disable"),
                        d.datagrid("updateRow", {
                            index: d.datagrid("getRowIndex", b.id),
                            row: {
                                fileState: "上传成功"
                            }
                        }),
                        h = !0
                    }),
                c.on("uploadError", function (a) {
                        d.datagrid("updateRow", {
                            index: d.datagrid("getRowIndex", a.id),
                            row: {
                                fileState: "上传失败"
                            }
                        })
                    }),
                c.on("uploadComplete", function (a) {}),
                c.on("uploadFinished", function () {
                        a("#attachmentDg").datagrid("reload")
                    }),
                c.on("error", function (a) {
                        "F_EXCEED_SIZE" == a ? tim.parentAlert("error", "上传的单个文件不能大于" + g + "。<br>操作无法进行,如有需求请联系管理员", "error") : "Q_TYPE_DENIED" == a && tim.parentAlert("error", "不允许上传此类文件!。<br>操作无法进行,如有需求请联系管理员", "error")
                    });
                var j = function () {
                        for (var a = d.datagrid("getSelections"), b = [], e = 0; e < a.length; e++) b.push(a[e]);
                        for (var f = 0; f < b.length; f++) {
                            var g = d.datagrid("getRowIndex", b[f]);
                            c.removeFile(b[f].fileId, !0),
                            d.datagrid("deleteRow", g)
                        }
                        d.datagrid("clearSelections")
                    },
                    k = function (b, c) {
                        return b.getFiles().length <= 0 ? void a.messager.alert("提示", "没有上传的文件!", "error") : void("uploading" === f ? b.stop() : (b.option("formData", {
                            puuid: c.uuid
                        }), b.upload()))
                    };
                a(this).on("click", function () {
                        if ("object" == typeof b.parentGrid && (e = getSelectedRowData(b.parentGrid.type, b.parentGrid.id), !e)) return void a.messager.alert(topJUI.language.message.title.operationTips, b.parentGrid.unselectedMsg || topJUI.language.message.msg.selectParentGrid, topJUI.language.message.icon.warning);
                        var f = d.datagrid("getRows");
                        f.length > 0 && (d.datagrid("selectAll"), j());
                        var g = a("#uploaderDialog"),
                            h = {
                                iconCls: "fa fa-plus",
                                parentGridUnselectedMsg: "请先选中一条主表数据！",
                                dialog: {
                                    title: "文件上传",
                                    width: 900,
                                    height: 500,
                                    maximized: !1,
                                    maximizable: !0,
                                    iconCls: "fa fa-cloud-upload",
                                    buttons: "#uploaderDialog-buttons"
                                }
                            };
                        b = a.extend(h, b),
                        g.dialog(b.dialog),
                        g.dialog("open"),
                        a("#startUpload").linkbutton({
                                iconCls: "fa fa-play-circle",
                                btnCls: "topjui-btn-green",
                                height: 36,
                                onClick: function () {
                                    k(c, e)
                                }
                            }),
                        a("#removeFile").linkbutton({
                                iconCls: "fa fa-remove",
                                btnCls: "topjui-btn-red",
                                height: 36,
                                onClick: j
                            }),
                        a("#closeUploaderDialog").linkbutton({
                                iconCls: "fa fa-remove",
                                btnCls: "topjui-btn-red",
                                onClick: function () {
                                    g.dialog("close")
                                }
                            })
                    })
            })
        },
        a.fn.iUploader.methods = {},
        a.fn.iUploader.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.textbox.parseOptions(b), a.fn.iUploader.defaults, a.parser.parseOptions(b, ["id", "value"]), c);
            return setId(b, d)
        },
        a.fn.iUploader.defaults = {
            hasDownArrow: !1
        },
        a.iParser && a.iParser.plugins && a.iParser.plugins.push("uploader")
    }(jQuery),


function (a) {
        a.fn.iValidatebox = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iValidatebox.methods[b];
                return d ? d(this, c) : this.validatebox(b, c)
            }
            this.each(function () {
                b = a.fn.iValidatebox.parseOptions(this, b),
                a(this).validatebox(b)
            })
        },
        a.fn.iValidatebox.methods = {},
        a.fn.iValidatebox.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.validatebox.parseOptions(b), a.fn.iValidatebox.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iValidatebox.defaults = {},
        a.extend(a.fn.validatebox.defaults.rules, {
            equals: {
                validator: function (b, c) {
                    return b == a(c[0]).val()
                },
                message: "两次输入的内容不一致"
            },
            cellphone: {
                validator: function (a, b) {
                    return /^1[3-8]+\d{9}$/.test(a)
                },
                message: "请输入有效的手机号码"
            },
            telephone: {
                validator: function (a, b) {
                    return /(^(0[0-9]{2,3}\-)?([2-9][0-9]{6,7})+(\-[0-9]{1,4})?$)|(^((\d3)|(\d{3}\-))?(1[358]\d{9})$)/.test(a)
                },
                message: "请输入有效的电话号码"
            },
            maxLength: {
                validator: function (a, b) {
                    return a.length < b[0]
                },
                message: "输入内容长度必须小于{0}"
            },
            minLength: {
                validator: function (a, b) {
                    return a.length > b[0]
                },
                message: "输入内容长度必须大于{0}"
            },
            idCard: {
                validator: function (a) {
                    return /^(^[1-9]\d{7}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])\d{3}$)|(^[1-9]\d{5}[1-9]\d{3}((0\d)|(1[0-2]))(([0|1|2]\d)|3[0-1])((\d{4})|\d{3}[Xx])$)$/.test(a)
                },
                message: "请输入正确的身份证号"
            },
            postcode: {
                validator: function (a) {
                    return /^[1-9]\d{5}(?!\d)$/.test(a)
                },
                message: "请输入正确的邮政编码"
            },
            date: {
                validator: function (a) {
                    return /^[1-2][0-9][0-9][0-9]-[0-1]{0,1}[0-9]-[0-3]{0,1}[0-9]$/.test(a)
                },
                message: "请输入正确的日期"
            },
            alphaDash: {
                validator: function (a) {
                    return /^[\w-]+$/.test(a)
                },
                message: "输入内容只能是数字、字母、下划线或横线"
            },
            alphaNum: {
                validator: function (a) {
                    return /^[a-z0-9]+$/i.test(a)
                },
                message: "输入内容只能是数字和字母"
            },
            number: {
                validator: function (a) {
                    return /^\d+$/.test(a)
                },
                message: "输入内容只能是数字"
            }
        })
    }(jQuery),


function (a) {
        a.fn.iWindow = function (b, c) {
            if ("string" == typeof b) {
                var d = a.fn.iWindow.methods[b];
                return d ? d(this, c) : this.window(b, c)
            }
            this.each(function () {
                b = a.fn.iWindow.parseOptions(this, b),
                a(this).window(b)
            })
        },
        a.fn.iWindow.methods = {},
        a.fn.iWindow.parseOptions = function (b, c) {
            var d = a.extend({}, a.fn.window.parseOptions(b), a.fn.iWindow.defaults, a.parser.parseOptions(b, ["id"]), c);
            return setId(b, d)
        },
        a.fn.iWindow.defaults = {}
    }(jQuery);