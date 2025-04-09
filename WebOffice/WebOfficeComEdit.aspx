<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WebOfficeComEdit.aspx.cs" Inherits="Zhongsoft.Portal.WebOffice.WebOfficeComEdit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>在线编辑</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" />
    <%--<meta content="MSHTML 6.00.2900.5921" name="GENERATOR" />--%>
    <script src="Script/WebOfficeHepler.js" type="text/javascript"></script>
    <script src="Script/Common.js" type="text/javascript"></script>
    <script src="Script/jquery-1.7.2.min.js" type="text/javascript"></script>
    <link href="Script/style.css" rel="stylesheet" />
    <!-- --------------------=== 调用Weboffice初始化方法 ===--------------------- -->
    <script language="javascript" event="NotifyCtrlReady" for="WebOffice1" type="text/javascript">
        /****************************************************
        *	在装载完Weboffice(执行<object>...</object>)
        *	控件后执行 "WebOffice1_NotifyCtrlReady"方法
        ****************************************************/
        WebOffice1_NotifyCtrlReady()
    </script>

    <script language="javascript" type="text/javascript">
        /****************************************************
        *		控件初始化WebOffice方法
        ****************************************************/
        function WebOffice1_NotifyCtrlReady() {
            InitPage();
        }
    </script>
</head>
<body onunload="return window_onunload()">
    <center>
        <div style="width: 100%; height: 100%;" align="center"> 
            <input type="hidden" runat="server" id="FileId" />
            <input type="hidden" runat="server" id="UserName" />
            <input type="hidden" runat="server" id="DocType" />
            <input type="hidden" runat="server" id="FileDownLoadUrl" />
             <input type="hidden" runat="server" id="ActionState" />
            <form runat="server">
                <table style="width: 100%; height: 100%;">
                    <tbody>
                        <tr>
                            <td id="tbMenu" runat="server" valign="top" width="200px" style="background-color: #324252 !important;">
                                <div>
                                    <ul class="menu">
                                        <li class="list active">
                                            <a>常用操作</a>
                                            <ul class="items active">
                                                <%--<li><a id="btn1" onclick="newDoc()">新建文档</a></li>--%>
                                                <li><a id="btn2" onclick="return docOpen()" style="display:none;">打开本地文件</a></li>
                                                <li><a id="btn3" onclick="zhiPrint()">打印</a></li>
                                                <li><a id="btn4" onclick="SaveAsTo()">另存为</a></li>
                                                <li><a id="btn5" onclick="newSave()">保存</a></li>
                                               <%-- <li><a onclick="return addBookmark()">设置书签</a></li>
                                                <li><a onclick="return TaoHong()">套红</a></li>--%>
                                                <li><a id="btn6" onclick="return Seal()" style="display:none;">盖章</a></li>
                                                <%--<li><a id="btn7" onclick="return ProtectFull()">保护文档</a></li>--%>
                                                <li><a id="btn8" onclick="return UnProtect()" style="display:none;">解除保护</a></li>
                                                   <li><a id="btn25" onclick="return AcceptAllRevisions()" style="display:none;">接受所有修订</a></li>
                                                  <li><a onclick="return bToolBar_FullScreen_onclick()">全屏</a></li>
                                            </ul>
                                        </li>
                                        <li class="list active">
                                           <%-- <a>修订操作</a>--%>
                                            <ul class="items active">
                                                <li><a id="btn21" onclick="return ProtectRevision()" style="display:none;">修订文档</a></li>
                                                <li><a id="btn22" onclick="return ExitRevisions()" style="display:none;">退出修订</a></li>
                                                <li><a id="btn23" onclick="return ShowRevisions()" style="display:none;">显示修订</a></li>
                                                <li><a id="btn24" onclick="return UnShowRevisions()" style="display:none;">隐藏修订</a></li> 
                                                <li><a id="btn26" onclick="return unAcceptAllRevisions()" style="display:none;">拒绝所有修订</a></li>
                                                <li><a id="btn27" onclick="return GetRevAllInfo()" style="display:none;">获取修订信息</a></li>
                                            </ul>
                                        </li>
                                        <li class="list active">
                                        <%--    <a>其它</a>--%>
                                            <ul class="items active">
                                              
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </td>
                            <td runat="server" valign="top">
                                <!-- -----------------------------== 装载weboffice控件 ==--------------------------------- -->
                                <object id="WebOffice1" style="width: 100%; height: 768px" classid="clsid:E77E049B-23FC-4DB8-B756-60529A35FAD5" codebase="Download/WebOffice.cab#version=7,0,1,8"></object>
                                <!-- --------------------------------== 结束装载控件 ==----------------------------------- -->
                            </td>
                        </tr>
                    </tbody>
                </table>
            </form>
        </div>
    </center>
</body>
</html>
