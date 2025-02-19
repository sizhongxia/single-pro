var remoteHost = "http://admin.ihavevip.com";
var myConfig = {
    config: {
        pkName: 'id', //数据表主键名
        singleQuotesParam: false, //是否对批量提交表格选中记录的参数值使用单引号，默认为false，true:'123','456'，false:123,456
        aloneUse: false,
        datagrid: {
            size: 'rows', //提交到后台的每页显示多少条记录
            page: 'page', //提交到后台的显示第几页的数据
            rows: 'rows', //后台返回的数据行对象参数名
            total: 'total' //后台返回的总记录数参数名
        },
        postJson: false,
        statusCode: {
            success: 200, //执行成功返回状态码
            failure: -1 //执行失败返回状态码
        }
    },
    language: {
        message: {
            title: {
                operationTips: "操作提示",
                confirmTips: "确认提示"
            },
            msg: {
                success: "操作成功",
                failed: "操作失败",
                error: "未知错误",
                checkSelfGrid: "请先勾选中要操作的数据前的复选框",
                selectSelfGrid: "请先选中要操作的数据",
                selectParentGrid: "请先选中主表中要操作的一条数据",
                permissionDenied: "对不起，你没有操作权限",
                confirmDelete: "你确定要删除所选的数据吗？",
                confirmMsg: "确定要执行该操作吗？"
            }
        }
    }
}