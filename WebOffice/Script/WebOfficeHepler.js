/****************************************************
*
*		基础信息
*
****************************************************/
var WebOffice1;
var wordpassword = "ZhongSoft@2019";//密码
var fileExt = "";//文件类型
var rooturl = "";
var filedownloadurl = "";//文件读取地址（下载文件、签章）
var fileid = "";
/****************************************************
*
*		页面初始化 
*
****************************************************/
function InitPage() {
    /*初始化信息*/
    WebOffice1 = document.all.WebOffice1;
    WebOffice1.ShowToolBar = false;//隐藏工具栏
    rooturl = RootUrl();
    WebOffice1.OptionFlag |= 128; 
    /*转换文件类型为WebOffice识别的*/
    fileExt = document.all.DocType.value;
    var doctype = "";
    switch (fileExt) {
        case "doc":
        case "docx":
        default:
            doctype = "doc";
            break;
        case "xls":
        case "xlsx":
            doctype = "xls";
            break;
        case "ppt":
            doctype = "ppt";
            break;
        case "wps":
            doctype = "wps";
            break;
    }
    /*****************************************************************/
    // 打开文档
    filedownloadurl = document.all.FileDownLoadUrl.value; //取得打开路径
    fileid = document.all.FileId.value;
    var webUrl = filedownloadurl + "?fileId=" + fileid;
    WebOffice1.LoadOriginalFile(webUrl, doctype);
    CheckActionState(); //获取修订的状态
}

//根据传入的不同值控制不同的按钮显示
function CheckActionState() {
    var RState = document.all.ActionState.value;//获取修订的状态
    switch (RState) {
        case "0":
            //退出修订模式
            ExitRevisions();
            break;
        case "1":
            //自动启用修订模式
            ProtectRevision();
            break;
        case "2":
            //显示接受修订按钮
            var ui = document.getElementById("btn25");
            ui.style.display = "";
            break;
        case "3":
            //显示盖章按钮
            var ui = document.getElementById("btn6");
            ui.style.display = "";
            break;
        case "4":
            //显示盖章按钮
            document.getElementById("btn6").style.display = "";
            document.getElementById("btn25").style.display = "";
            break;
        case "99":
            //只允许查看文档
            ProtectFull(2);
            document.getElementById("btn6").style.display = "none";
            document.getElementById("btn25").style.display = "none";
            document.getElementById("btn4").style.display = "none";//另存为
            document.getElementById("btn5").style.display = "none"; //保存
            break;
    }
}
/****************************************************
*
*		关闭页面时调用此函数，关闭文件 
*
****************************************************/
function window_onunload() {
    try {
        WebOffice1.Close();
    } catch (e) {
        //	alert("异常\r\nError:"+e+"\r\nError Code:"+e.number+"\r\nError Des:"+e.description);
    }
}
/****************************************************
*
*					新建文档
*
****************************************************/
function newDoc() {
    try {
        WebOffice1.LoadOriginalFile("", "doc");
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					打开本地文件
*
/****************************************************/
function docOpen() {
    try {
        WebOffice1.LoadOriginalFile("open", "doc");
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					直接打印
*
****************************************************/
function zhiPrint() {
    try {
        WebOffice1.PrintDoc(0);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}

/****************************************************
*
*					保存文档
*
/****************************************************/
function newSave() {
    try {
        WebOffice1.Save();

        SaveDoc();
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					上传文档
*
/****************************************************/
function SaveDoc() {
    try {
        WebOffice1.HttpInit();
        WebOffice1.HttpAddPostString("FileId", fileid);
        WebOffice1.HttpAddPostCurrFile("docfile", "");
        //strResults用于获得网页提交后的返回数据，可用以调试服务器端代码。
        /**/
        var strSaveUrl = rooturl + "Handler/PostSave.aspx"; //取得保存路径和文件名
        var strResults = WebOffice1.HttpPost(strSaveUrl);
        if (strResults == 'ok') {
            alert('文档保存成功!');
            //WebOffice1.Close();
            //setTimeout('location.reload();', 3000);
        }
        else {
            alert(strResults);
        }
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					另存为文档
*
/****************************************************/
function SaveAsTo() {
    try {
        WebOffice1.ShowDialog(84);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					设置书签
*
/****************************************************/
function addBookmark() {
    try {
        alert("向光标处加入名称为test的书签");
        WebOffice1.SetFieldValue("test", "加入书签test", "::ADDMARK::");
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					套红
*
/****************************************************/
function TaoHong() {
    try {
        var templatepath = rooturl + "Template/公司平行文.doc";

        WebOffice1.SetFieldValue("test", templatepath, "::FILE::");
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					盖章
*
/****************************************************/
function Seal() {
    try {
        var param = new InputParamObject("s");
        var reObj = null;
        reObj = getSignSeal("", param, "");
        if (reObj != null) {
            var pwd = reObj.buildAttrJson("o", "SealPassword");
            var signfileId = reObj.buildAttrJson("o", "FileId");
            var str = prompt("请输入印章使用密码", "请输入密码！");
            if (str == pwd) {
                var url = filedownloadurl + "?fileId=" + signfileId;
                WebOffice1.InSertFile(url, 8); 
            }
            else {
                alert("输入的密码不正确！")
            }
        }
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					全屏
*
/****************************************************/
function bToolBar_FullScreen_onclick() {
    try {
        WebOffice1.FullScreen = true;
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*		设置weboffice自带工具栏显示或隐藏
*
/****************************************************/
function bToolBar_onclick() {
    try {
        WebOffice1.ShowToolBar = false;
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*			
*				设置文档保护
*lType	：
└ 0 ：文档保护，只允许修订
└ 1 ：文档保护，只允许批注
└ 2 ：文档完全保护，不允许任何操作
*
****************************************************/
function ProtectFull(lType) {
    try {
        WebOffice1.ProtectDoc(1, lType, wordpassword);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					解除保护
*
/****************************************************/
function UnProtect() {
    try {
        WebOffice1.ProtectDoc(0, 1, wordpassword);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					修订文档
*
/****************************************************/
function ProtectRevision() {
    try {
        SetUserName();
        WebOffice1.SetTrackRevisions(1)
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					隐藏修订
*
/****************************************************/
function UnShowRevisions() {
    try {
        WebOffice1.ShowRevisions(0);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					显示当前修订
*
/****************************************************/
function ShowRevisions() {
    try {
        WebOffice1.ShowRevisions(1);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					退出修订状态
*
/****************************************************/
function ExitRevisions() {
    try {
        WebOffice1.SetTrackRevisions(0);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					接受当前所有修订
*
/****************************************************/
function AcceptAllRevisions() {
    try {
        WebOffice1.SetTrackRevisions(4);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					拒绝当前所有修订
*
/****************************************************/
function unAcceptAllRevisions() {
    try {
        var vCount = WebOffice1.GetRevCount();
        var strUserName;
        for (var i = 1; i <= vCount; i++) {
            strUserName = WebOffice1.GetRevInfo(i, 0);
            WebOffice1.AcceptRevision(strUserName, 1)
        }
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
/****************************************************
*
*					获取修订相关信息
*
/****************************************************/
function GetRevAllInfo() {
    var vCount = WebOffice1.GetRevCount();
    var vOpt = 0;
    var vDate;
    var content = "";
    for (var i = 1; i <= vCount; i++) {
        vOpt = WebOffice1.GetRevInfo(i, 2);
        switch (vOpt) {
            case "1":
                vOpt = "插入";
                break;
            case "2":
                vOpt = "删除";
                break;
            case "3":
                vOpt = "带格式";
                break;
            default:
                vOpt = "未知操作";
                break;
        }
        vDate = WebOffice1.GetRevInfo(i, 1);
        content += i + "：";
        content += WebOffice1.GetRevInfo(i, 0) + ",";
        content += vDate + " ";
        content += vOpt + "的内容:" + WebOffice1.GetRevInfo(i, 3);
        content += "\r\n";
    }
    if (content.length > 0) { alert(content); }
}
/****************************************************
*
*					设置当前操作用户
*
/****************************************************/
function SetUserName() {
    try {
        var username = document.all.UserName.value;
        if (username == "") {
            alert("用户名不可为空")
            return false;
        }
        WebOffice1.SetCurrUserName(username);
    } catch (e) {
        alert("异常\r\nError:" + e + "\r\nError Code:" + e.number + "\r\nError Des:" + e.description);
    }
}
