<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="MetroWorkToDo.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.Metro.MetroWorkToDo" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <script src="/Portal/themes/script/jquery-1.4.3.min.js"></script>
    <link href="../../themes/custom/styles/jquery-ui-1.10.4.custom.css" rel="stylesheet"
        type="text/css" />
    <style type="text/css">
        html
        {
            overflow-x: hidden;
        }
        .wp-list-header
        {
            background: #557dba;
            height: 30px;
            line-height: 30px;
            font-size: 14px;
            width: 100%;
            display: inline-block;
            display: block;
            border-radius: 4px;
            -webkit-transition: all .2s ease-in-out;
            transition: all .2s ease-in-out;
        }
        .wp-list-header span
        {
            color: #edf4ff;
            font-weight: bold;
            padding-left: 10px;
        }
        .list td
        {
            border: none !important;
        }
        .list-footer
        {
            border: none !important;
        }
        
        
        .list-odd
        {
            background: transparent !important;
        }
        .list-even
        {
            background: transparent !important;
        }
        .list-footer
        {
            background: transparent !important;
        }
    </style>
    <style type="text/css">
<!--
.con {height:380px;padding-top:15px; margin-bottom: 18px; }
#tags {padding-right:0px; padding-left:0px; padding-bottom:0px; margin: 0px 0px 5px 0px;  padding-top:0px; height: 26px; border-bottom:#ccc 1px solid;}
#tags li { display:block; position:relative; float:left; margin-bottom:-1px;  list-style-type:none; height: 26px; /*border:#ddd 1px solid;*/ }
#tags li a {padding-right: 10px; padding-left: 10px;  float:left; color: #005772; line-height:25px;height: 26px; border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-left-radius:0;border-bottom-right-radius:0; }
#tags li.selectTag {  position: relative; height: 26px; background:#fafafa; border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-left-radius:0;border-bottom-right-radius:0; /*border-bottom:#e2fafd 1px solid; font-weight:bold;*/}
#tags li.selectTag A { color: #555; /*LINE-HEIGHT: 22px; HEIGHT: 22px;*/ border-top-left-radius:4px;border-top-right-radius:4px;border-bottom-left-radius:0;border-bottom-right-radius:0; border-top:1px solid #ddd; border-right:1px solid #ddd;border-left:1px solid #ddd;border-bottom:1px solid transparent; }
.tagContent { display: none;  width:100%; text-align:left; clear:both; padding-top:8px;}
#tagContent div.selectTag {display: block}
.list td{word-break:normal!important;white-space:normal!important;}

-->
</style>
    <script type="text/javascript">
        function selectTag(showContent, selfObj) {
            // 操作标签
            var tag = document.getElementById("tags").getElementsByTagName("li");
            var taglength = tag.length;
            for (i = 0; i < taglength; i++) {
                tag[i].className = "";
            }
            selfObj.parentNode.className = "selectTag";
            // 操作内容
            for (i = 0; j = document.getElementById("tagContent" + i); i++) {
                j.style.display = "none";
            }
            document.getElementById(showContent).style.display = "block";
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div class="con">
        <ul id="tags">
            <li class="selectTag"><a onclick="selectTag('tagContent0',this)" href="javascript:void(0)"
                onfocus="this.blur()">待办流程</a></li>
            <li><a onclick="selectTag('tagContent1',this)" href="javascript:void(0)" onfocus="this.blur()">
                待办任务</a> </li>
            <li><a onclick="selectTag('tagContent2',this)" href="javascript:void(0)" onfocus="this.blur()">
                提醒</a> </li>
        </ul>
        <div id="tagContent">
            <div class="tagContent selectTag" id="tagContent0">
                <div style="width: 100%;">
                    <table>
                        <tr>
                            <td nowrap="nowrap" height="35px;">
                                &nbsp;&nbsp;关键字
                                <asp:TextBox MaxLength="20" ID="tbTitle" ToolTip="请输入主题" runat="server" Width="80px"></asp:TextBox>
                            </td>
                            <td nowrap="nowrap" class="">
                                <asp:Button ID="btnSearch" class="btn-search" runat="server" Text="查找" OnClick="btnSearch_Click" />
                                <asp:Button ID="btnReset" runat="server" class="btn1" Text="重置" OnClick="btnReset_Click"
                                    EnableTheming="false" />
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="padding-left: 5px;">
                    <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="5" ID="ToDoList" runat="server"
                        BindGridViewMethod="BindToDoList">
                        <Columns>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="../../Themes/Images/flow_t.gif" title="流转过程" alt="流转过程">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# FlowState(Eval("ProcessStatus").ToString(),
                      Eval("ProcessInstanceId").ToString(), 
                     Eval("packageName").ToString(), 
                     Eval("processId").ToString(), 
                      Eval("ActivityInstanceId").ToString(),
                    Eval("ActivityName").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="/Portal/Themes/Images/readtype_t.gif" title="阅读信息" alt="阅读信息">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# ReadState(Eval("ReadDateTime").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField>
                                <HeaderTemplate>
                                    <img src="/Portal/Themes/Images/othertype_t.gif" title="委托信息" alt="委托信息">
                                </HeaderTemplate>
                                <ItemTemplate>
                                    <%# GetConsign(Eval("partId").ToString(),Eval("partName").ToString())%>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="事项主题">
                                <ItemTemplate>
                                    <%#GetToDoItem(  
                                                Eval("FormID").ToString(),
                                                Eval( "ActivityInstanceId").ToString(),
                                                Eval("ProcessInstanceId").ToString(),
                                                Eval("ProcessInstanceName").ToString(),
                                                Eval("ActivityName").ToString(),
                                                Eval("ReadDateTime").ToString(),
                                                Eval("AlertTimes").ToString(),
                                                Eval("PartId").ToString(),
                                                Eval("PriorityLevel").ToString())
                                    %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="ProcessName" HeaderText="表单类型" />
                            <asp:TemplateField HeaderText="工作发送人">
                                <ItemTemplate>
                                    <span actid='<%#Eval("ActivityInstanceId") %>'></span>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="发起人" Visible="false">
                                <ItemTemplate>
                                    <div tip="1" class='autoskip' title='<%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]'>
                                        <%#Eval("CreatorName")%>&nbsp;[<%#Eval("CreatorOrganizationName")%>]</div>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="接收时间">
                                <ItemTemplate>
                                    <%#GetReceiveDate(DateTime.Parse(Eval("ReceiveDateTime").ToString()))%>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                    <asp:HiddenField ID="hiFormTypeId" runat="server" />
                    <input type="hidden" runat="server" id="hiUserId" />
                    <script language="javascript">
                        function setId(proid) {
                            $("#<%=hiFormTypeId.ClientID %>").attr("value", proid);
                        }
                        function initCustomerPlugin() {

                            <%--$("#<%=this.tbCreateUser.ClientID %>").autocomplete({
                                source: function (request, response) {
                                    $.getJSON("JsonSelectorHandler.ashx", {
                                        term: request.term + ',user'
                                    }, response);
                                },
                                minLength: 1,
                                select: function (event, ui) {
                                    if (ui.item) {
                                        $("#<%=hiUserId.ClientID %>").attr("value", ui.item.id);
                                    }
                                }
                            });--%>
                            getTaskSender();
                        }
                        try {
                            window.parent.frames["workMenu"].GetTodo();
                        } catch (e) { }
                        function getTaskSender() {
                            var $ids = "";
                            $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                                $ids += $(this).attr("actId") + "|";
                            });
                            $.post("MetroWorkToDo.aspx",
                 { asyfunc: "GetTaskSender", prcId: $ids },
                 function (res) {
                     var $l = eval('(' + res + ')');
                     $("#<%=ToDoList.ClientID %> span[actId]").each(function () {
                         var $actid = $(this).attr("actId");
                         for (var i = 0; i < $l.length; i++) {
                             var $id = $l[i][0];
                             var $un = $l[i][1];
                             var $on = $l[i][2];
                             if ($actid == $id) {
                                 if ($un == "")
                                     $(this).html("系统自动发送");
                                 else {
                                     var t = $un + "&nbsp;[" + $on + "]";
                                     $(this).html("<div tip='1' style='width:80px' class='autoskip' title='" + t + "'>" + t + "</div>");
                                 }
                             }
                         }
                     });
                 }
                );
                        }
                    </script>
                    <%--<table class="list" style="width: 98%!important; margin-left: 10px!important; border: none!important;">
                        <tr class="list-odd">
                            <td width="100px">
                                预算编制
                            </td>
                            <td>
                                <a href="#">勘测设计外委费预算表</a>
                            </td>
                            <td width="120px">
                                胡娜娜[市场部]
                            </td>
                            <td width="120px">
                                09:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                预算编制
                            </td>
                            <td>
                                <a href="#">部门成本预算表</a>
                            </td>
                            <td width="120px">
                                胡娜娜[市场部]
                            </td>
                            <td width="120px">
                                11:05
                            </td>
                        </tr>
                        <tr class="list-footer">
                            <td colspan="4">
                                总记录数：10 第1/1页
                            </td>
                        </tr>
                    </table>--%>
                </div>
            </div>
            <div class="tagContent selectTag" id="tagContent1" style="display: none;">
                <div style="width: 100%;">
                    <table>
                        <tr>
                            <td nowrap="nowrap" height="35px;">
                                &nbsp;&nbsp;关键字
                                <input type="text" value="" style="width: 80px" />
                            </td>
                            <td nowrap="nowrap" class="">
                                <a class="btn-search" href="#">查找</a> <a class="btn-reset" href="#">重置</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;">
                    <table class="list" style="width: 98%!important; margin-left: 10px!important; border: none!important;">
                        <tr class="list-odd">
                            <td>
                                预算编制
                            </td>
                            <td>
                                <a href="#">勘测设计外委费预算表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                09:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                预算编制
                            </td>
                            <td>
                                <a href="#">部门成本预算表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                11:05
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                预算审批
                            </td>
                            <td>
                                <a href="#">资产购置预算表</a>
                            </td>
                            <td>
                                封一航[院长工作部]
                            </td>
                            <td>
                                昨天 15:34
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                预算审批
                            </td>
                            <td>
                                <a href="#">计算机设备、软件购置预算表 </a>
                            </td>
                            <td>
                                李玉欣[信息部]
                            </td>
                            <td>
                                昨天 11:18
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                预算调整
                            </td>
                            <td>
                                <a href="#">年中部门差旅费预算调整 </a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                计划填报
                            </td>
                            <td>
                                <a href="#">市场跟踪计划表 </a>
                            </td>
                            <td>
                                李玉欣[信息部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                计划审批
                            </td>
                            <td>
                                <a href="#">市场跟踪计划表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                新建合同
                            </td>
                            <td>
                                <a href="#">国电南方公司广州超高压局工程 </a>
                            </td>
                            <td>
                                李玉欣[信息部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-footer">
                            <td colspan="4">
                                总记录数：8 第1/1页
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
            <div class="tagContent selectTag" id="tagContent2" style="display: none;">
                <div style="width: 100%;">
                    <table>
                        <tr>
                            <td nowrap="nowrap" height="35px;">
                                &nbsp;&nbsp;关键字
                                <input type="text" value="" style="width: 80px" />
                            </td>
                            <td nowrap="nowrap" class="">
                                <a class="btn-search" href="#">查找</a> <a class="btn-reset" href="#">重置</a>
                            </td>
                        </tr>
                    </table>
                </div>
                <div style="width: 100%;">
                    <table class="list" style="width: 98%!important; margin-left: 10px!important; border: none!important;">
                        <tr class="list-odd">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">勘测设计外委费预算表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                09:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">部门成本预算表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                11:05
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">资产购置预算表</a>
                            </td>
                            <td>
                                封一航[院长工作部]
                            </td>
                            <td>
                                昨天 15:34
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">计算机设备、软件购置预算表 </a>
                            </td>
                            <td>
                                李玉欣[信息部]
                            </td>
                            <td>
                                昨天 11:18
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">年中部门差旅费预算调整 </a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td width="120px">
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">市场跟踪计划表 </a>
                            </td>
                            <td width="120px">
                                李玉欣[信息部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">市场跟踪计划表</a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-even">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">国电南方公司广州超高压局工程 </a>
                            </td>
                            <td>
                                李玉欣[信息部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-odd">
                            <td>
                                提醒
                            </td>
                            <td>
                                <a href="#">国电南方公司广州超高压局工程 </a>
                            </td>
                            <td>
                                胡娜娜[市场部]
                            </td>
                            <td>
                                14-08-19 11:18
                            </td>
                        </tr>
                        <tr class="list-footer">
                            <td colspan="4">
                                总记录数：9 第1/1页
                            </td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
    </form>
</body>
</html>
