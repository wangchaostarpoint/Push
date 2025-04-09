<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="选择人员" CodeBehind="UserSelectorJson.aspx.cs" Inherits="Zhongsoft.Portal.Sys.OrgUsers.UserSelectorJson" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content3" ContentPlaceHolderID="toolTip" runat="server">
    <%--在搜索文本框中填写人员相关信息可以快速找到你要选择的人员。--%>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <link rel='stylesheet' type='text/css' href='../../Themes/Styles/zTreeStyle.css' />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/formsender.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/common2.css" />
    <table>
        <tr>
            <td nowrap>
                搜索：人员
                <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" Width="80px" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
                项目
                <zhongsoft:LightTextBox ID="tbProjInfo" runat="server" Width="120px" CssClass="kpms-textboxsearch"
                    EnableTheming="false" Visible="true"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiProjId" />
                部门
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="120px" AutoPostBack="True"
                    OnSelectedIndexChanged="ddlDept_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
                <a class="subtoolbarlink" id="btnMoreParts" title="在全院人员中搜索">
                    <img src="../../Themes/Images/selectmore.gif" /><span>更多人员</span></a>&nbsp;&nbsp;
                <div class="form-selectpeople" runat="server" id="formSelectp1">
                    <div class="selectp-header">
                        <span style="float: left;">选择人员</span><span id='closePartMore' class="closethis ui-icon ui-icon-close"></span></div>
                    <table class="selectp-content">
                        <tr>
                            <td id="part" style="width: 196px;">
                                <ul id="selectp-part" class="ztree selectp-part">
                                </ul>
                            </td>
                            <td id="close-part" class="close-part">
                                <span>
                                    <img src="../../Themes/Images/close-part.gif" /></span>
                            </td>
                            <td class="selectp-list">
                                <input class="selectp-key" id="txtPartFilter" type="text" value="请输入关键字" />
                                <div class="person-list" style="height: 223px; text-align: left" id="morePartsList">
                                </div>
                                <div class="person-list-page">
                                    <%-- <img src="../../Themes/Images/btn_prei.gif" /><img src="../../Themes/Images/btn_next.gif" />--%></div>
                            </td>
                        </tr>
                    </table>
                </div>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="UsersList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="UsersList_RowCommand" OnJsonClick="addObject" JsonClickMode="onclick"
        ShowJsonRowColName="true">
        <Columns>
            <asp:BoundField DataField="LoginId" HeaderText="工号" HeaderStyle-Width="50px" />
            <asp:BoundField DataField="UserName" HeaderText="姓名" HeaderStyle-Width="70px"></asp:BoundField>
            <asp:BoundField DataField="DeptName" HeaderText="部门" HeaderStyle-Width="100px"></asp:BoundField>
            <asp:BoundField DataField="SUBDEPTNAME" HeaderText="科室" HeaderStyle-Width="120px">
            </asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        var $partsMoreLoaded;
        function initCustomerPlugin() {
            $partsMoreLoaded = false;
            initPartsMore();
            $("#<%=this.tbUserInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user4Code'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbUserInfo.ClientID %>").attr("value", ui.item.value.substring(0, ui.item.value.indexOf('[')));
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });

            //项目下拉选择
            $("#<%=this.tbProjInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',proj'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $('#<%=hiProjId.ClientID %>').val(ui.item.id);
                        $('#<%=tbProjInfo.ClientID %>').val(ui.item.value.substring(0, ui.item.value.indexOf(',')));
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });

            $('#close-part').toggle(function () {
                $('#part').css('display', 'none');
                $('[id$=formSelectp1]').css("width", "165px");
                $(this).find('img').attr('src', '../../Themes/Images/open-part.gif');
            }, function () {
                $('#part').css('display', '');
                $('[id$=formSelectp1]').css('width', '361px');
                $(this).find('img').attr('src', '../../Themes/Images/close-part.gif');
            })

            $('.selectp-key').focus(function () {
                if ($(this).val() == '请输入关键字') {
                    $(this).val('');
                    $(this).css('color', '#000');
                }
            }).blur(function () {
                if ($(this).val() == '') {
                    $(this).val('请输入关键字');
                    $(this).css('color', '#ccc');
                }
            })
            //关闭更多人员框
            $('#closePartMore').click(function () {
                $('[id$=formSelectp1]').hide();

            })
            //是否显示更多按钮
            if ("<%=ShowMore %>" == "0") {
                $("#btnMoreParts").hide();
            }
        }

        function viewCurrWork(userId) {
            var url = buildQueryUrl("/EPMS/List/OBS/CurrentTaskDetailList.aspx", { secid: "c3455630-e393-4f75-b471-0e9151c39a6b", IsDashboard: "1", ShowToolbar: "1", userId: userId });
            showDivDialog(url, null, 1000, 600, '');
            return false;
        }
        function initPartsMore() {
            $('#btnMoreParts').click(function () {
                if (!$partsMoreLoaded) {
                    $partsMoreLoaded = true;
                    $('head').append("<script src='" + $appCtx.appPath + "/UI/script/jquery.ztree.core-3.5.js'><\/script>");
                    buildUnitTree(); buildSelectorUserList("", "userforselector");
                    $("#txtPartFilter").keyup(function () {
                        buildSelectorUserList($(this).val(), "userforselector");
                    });
                }
                //控制更多人员框显示的位置
                $('[id$=formSelectp1]').css({ top: $(this).offset().top + 28, left: $(this).offset().left - 140 }).toggle('slide');
            });
        }
        //创建左侧部门树结构
        var $treeUnitItems;
        function buildUnitTree() {
            $.post("JsonSelectorHandler.ashx",
             { term: "|" + "<%=KPMSUser.UserId %>" + ",groupandunit_tree," },
                function (res) {
                    $treeUnitItems = res;
                    $('[id$=formSelectp1]').css('width', '361px');
                    $('[id$=formSelectp1]').draggable({ handle: ".selectp-header" });
                    $.fn.zTree.init($("#selectp-part"), { view: { showIcon: false }, callback: { onClick: unitTreeClick} }, $treeUnitItems);
                }, "json"
            );
        }
        function unitTreeClick(event, treeId, treeNode) {
            var key = treeNode.id.split('|');
            //第一位是部门ID或者分组ID
            var grouporUnitId = key[0];
            if (key[1] != undefined && key[1] != "") {
                //第二位是人员ID
                buildSelectorUserList(treeNode.id, "group_userforselector");
            }
            else
                buildSelectorUserList(treeNode.id, "unit_userforselector");
        }
        //拼凑右侧人员信息
        function buildSelectorUserList(f, type) {
            $("#morePartsList").html("");
            $.post("JsonSelectorHandler.ashx",
                { term: f + "," + type },
                    function (res) {
                        for (var i = 0; i < res.length; i++) {
                            var split = res[i].value.split(',');
                            var userJson = res[i].id;
                            var pUserName = split[0];
                            var pLoginId = split[1];
                            var p = $("<div class='xpdl-widget-part'  userJson=" + userJson + " pname=" + pUserName + " >" + pUserName + "<font style='font-weight: normal'>[" + pLoginId + "]</font></div>");
                            p.appendTo("#morePartsList");
                            p.click(function () {
                                //点击将人员加入选定信息框
                                addObject(JSON.parse($(this).attr("userJson")));
                            }).hover(function () {
                                $(this).addClass('ui-state-default');
                            }, function () {
                                $(this).removeClass('ui-state-default');
                            });
                        }

                    }, "json"
                );
        }

    
    </script>
</asp:Content>
