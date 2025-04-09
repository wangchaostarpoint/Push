<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MetroHeader.ascx.cs"
    Inherits="Zhongsoft.Portal.Metro.Controls.MetroHeader" %>
<%@ Register Namespace="Zhongsoft.Portal.Metro.Controls" TagPrefix="zs" Assembly="Zhongsoft.Portal" %>
<%@ Import Namespace="EDPortal.EPMS" %>
<script type="text/javascript">
    $(document).ready(function () {
        var screenWidth = window.screen.width;
        if (screenWidth < 1100) {
            $('#bannerleft').css('width', '215px');
        }

        else {
            $('#bannerleft').css('width', '255px');
        }

    })
    function refreshTabBar(metroId, groupId, tileId) {
        var metroId = "<%=MetroId %>"
        setBannerCallback(metroId, '', '');
    }
</script>
<link rel="stylesheet" type="text/css" href="./Themes/custom/styles/list.css" />
<style>
    #banner_img .ad_img {
        position: absolute;
        width: 100%;
        left: 0px;
        top: 8px;
    }

    .mainmenu {
        margin: 10px;
    }

        .mainmenu:after {
            clear: both;
            content: " ";
            display: block;
        }

        .mainmenu li {
            float: left;
            margin-left: 2.5%;
            margin-top: 2.5%;
            width: 30%;
            border-radius: 3px;
            overflow: hidden;
        }

            .mainmenu li a {
                display: block;
                text-align: center;
            }

                .mainmenu li a b {
                    display: block;
                    height: 80px;
                }

                .mainmenu li a img {
                    margin: 15px auto 15px;
                    width: 50px;
                    height: 50px;
                }

                .mainmenu li a span {
                    display: block;
                    height: 30px;
                    line-height: 30px;
                    background-color: #f5fefb;
                    border: 1px solid #dbd7d7;
                    border-top: none;
                    color: #444;
                    font-size: 14px;
                }

                .mainmenu li a:hover {
                    text-decoration: underline;
                }

            .mainmenu li.fir {
                background-color: #84d018;
            }

            .mainmenu li.sec {
                background-color: #14c760;
            }

            .mainmenu li.thi {
                background-color: #f3b613;
            }

            .mainmenu li.fou {
                background-color: #ff8a4a;
            }

            .mainmenu li.fif {
                background-color: #fc5366;
            }

    .logotitle {
        padding-left: 15px;
        width: 300px;
        color: #ffffff;
        font-family: 黑体;
        font-size: 16pt;
        background: #56596a;
        word-break: keep-all;
        white-space: nowrap;
    }
</style>
<table id="tbHeader" runat="server" style="width: 100%; height: 40px; position: fixed; top: 0px; z-index: 2; background: url(./themes/custom/images/topbg1.png) repeat-x;"
    cellpadding="0" cellspacing="0">
    <tr>
        <td colspan="2" class=" logotitle">
            <img alt="" runat="server" id="imgLogo" src="~/Themes/UserImages/logo.png" />&nbsp;<%= EPMSConfig.Instance.PortalTitle%>
        </td>
        <td style="padding-right: 15px; background: #56596a;">
            <div style="height: 40px; line-height: 40px; margin-bottom: 5px;">

                <div class="welcome" style="margin-top: 5px;">
                    <a href="<%=WebAppPath %>/PWS/Index.aspx" target="_blank" style="display:inline;">
                        <span style="padding-left: 7px; color: Blue; font-size: 12px; font-weight: bold"
                            id="span2">企业门户
                        </span>
                    </a>
                    <a href='<%=OriginalOAEntrance %>' target="_blank" style="display:none;">
                        <span style="padding-left: 7px; color: Blue; font-size: 12px; font-weight: bold"
                            id="span1">原OA入口
                        </span>
                    </a>
                    <a href="./Sys/OrgUsers/UserConfigEditor.aspx?actiontype=3" target="_blank" style="display: none;">个人消息配置</a>
                    欢迎您：<%= KPMSUser.Name%>
                    (<%=KPMSUser.LoginId%>)&nbsp;<a id="aPersonalSet" title="个人设置" onclick="showPersonalSet();" style="display: none"><img
                        src="<%=WebAppPath%>/themes/custom/images/setting.png" width="17" height="17"
                        style="margin-bottom: 3px;" /></a>&nbsp;<a>
                            <asp:Label ID="lbUser" runat="server"></asp:Label></a> &nbsp;&nbsp;
                    <asp:Label ID="lbPostTip" runat="server" Text="" Visible="false"></asp:Label><a id="aAddOtherPost"
                        runat="server" onclick="showSetInfo('divAddOtherPost')" visible="false"><span>【<asp:Label ID="lbChangeTip"
                            runat="server" Text="工作台"></asp:Label>】</span></a>
                    <asp:LoginStatus Font-Bold="true" LogoutText="【注销】" ID="LoginStatus"
                        runat="server" OnLoggedOut="LoginStatus_LoggedOut"
                        OnLoggingOut="LoginStatus_LoggingOut" />
                    <a id="aHomePage" title="企业门户" target="_blank" href="#" runat="server">企业门户</a>
                    <asp:LinkButton runat="server" ID="btnSetHomePage" OnClick="btnSetHomePage_Click"
                        Visible="false"></asp:LinkButton>
                    <a id="aSysSetting" title="系统设置" onclick="return openSysSetting();" runat="server"
                        visible="false">系统设置</a>
                </div>
            </div>
        </td>
    </tr>
</table>
<asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Style="display: none"></asp:LinkButton>
<input type="hidden" runat="server" id="hiRole" value="部门负责人,科室负责人" />
<div id="divAddOtherPost" style="display: none" title="工作台">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel2">
        <ContentTemplate>
            <table id="divTable" style="border: solid 1px #b9d1f1; width: 325px">
                <asp:Repeater runat="server" ID="metroRepeater" OnItemDataBound="metroRepeater_ItemDataBound">
                    <ItemTemplate>
                        <tr>
                            <td style="width: 180px;" rowspan="2">
                                <asp:HyperLink runat="server" ID="linkTile">
                                    <asp:Image runat="server" ID="imgIcon" />
                                    <asp:Label ID="lbTitleName" Style="text-decoration: underline; color: Blue" runat="server"
                                        Text='<%#Eval("TILENAME").ToString().Length > 10 ? Eval("TILENAME").ToString().Substring(0, 9) + "..." : Eval("TILENAME")%>'></asp:Label>
                                </asp:HyperLink>&nbsp;
                            </td>
                            <td rowspan="2">
                                <asp:Label ID="lbMemo" runat="server" Text='<%#Eval("Memo").ToString().Length > 25 ? Eval("Memo").ToString().Substring(0, 24) + "..." : Eval("Memo")%>'></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td align="right">
                                <asp:RadioButton runat="server" ID="rdbDefultWorkbench" OnCheckedChanged="rdbDefultWorkbench_checkchanged"
                                    Text="默认" AutoPostBack="True" />
                                <input type="hidden" id="hiRoleName" runat="server" value='<%#Eval("ExtendedAttribute") %>' />
                            </td>
                        </tr>
                    </ItemTemplate>
                </asp:Repeater>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</div>
<script type="text/javascript">
    function initCustomerPlugin() {
        //        $("#aPersonalSet").click(function () {
        //            showPersonalSet();
        //        })
        //        $("#aHomePageSet").click(function () {
        //            setHomePage();
        //        })
    }
    //获取待办
    //function getTodo() {
    //    $.post("/Portal/Sys/Workflow/WorkToDoList.aspx",
    //        { asyfunc: "GetToDoItemsCount" },
    //        function (res) {
    //            if (todo != null) {
    //                //                                alert("又调用了一次，返回结果" + res);
    //                var index = todo.innerHTML.indexOf(flagTodo);
    //                //todo.innerHTML = todo.innerHTML.substring(0, index) + flagTodo + '(<font color="red">' + res + '</font>)';
    //                todo.innerHTML = todo.innerHTML.substring(0, index) + flagTodo + '（' + res + '）';
    //            }
    //        }
    //    );
    //}

    ////获取传阅
    //function getInfo() {
    //    $.post("/Portal/Sys/Workflow/WorkForwardList.aspx",
    //        { asyfunc: "GetForwardItemsCount" },
    //        function (res) {
    //            if (info != null) {
    //                var index = info.innerHTML.indexOf(flagInfo);
    //                info.innerHTML = info.innerHTML.substring(0, index) + flagInfo + '（' + res + '）';
    //            }
    //        }
    //    );
    //}

    function showPersonalSet() {
        var url = "/Custom/List/DashBoard.aspx";
        var json = { listId: "12CFBB7E-56C0-4D70-BC2D-951A4D064A5C", IsShowHeader: 2 };
        url = buildQueryUrl(url, json);
        window.open(url);
    }

    function setHomePage() {
        if (confirm("您确认将当前页面设置为首页？")) {
                <%=Page.GetPostBackEventReference(this.btnSetHomePage,"") %>;
        }
        return false;
    }
    //切换项目角色相关
    $(function () {
        initEvent('divAddOtherPost', 'SaveOtherRolePost');
    });

    //加载div默认事件
    function initEvent(div, funcName) {
        $("#" + div + ":ui-dialog").dialog("destroy");
        $("#" + div).dialog({
            resizable: false,
            autoOpen: false,
            minHeight: 300,
            minWidth: 350,
            modal: true,
            buttons: {
                "确定": function () {
                    var r = updateConfig(div, funcName, true);
                    if (r == false) { return false; }
                    $(this).dialog("close");
                },
                "取消": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //弹出对应层
    function showSetInfo(div) {
        initEvent('divAddOtherPost', 'SaveOtherRolePost');
        $("#" + div).dialog('open');
        $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
            return false;
        }

        function openSysSetting() {
            var url = buildQueryUrl("MetroIndex.aspx", { metroId: '3AB1468F-D158-46D7-BC1F-E0E908D04E09' });
            window.open(url);

            return false;
        }

        //更新
        function updateConfig(div, funcName, isLoad) {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }
</script>
