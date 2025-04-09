<%@ Page Title="选择传阅人员" Language="C#" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    AutoEventWireup="true" CodeBehind="FormForward.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.FormForward" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%--<asp:Content ID="toolTip" ContentPlaceHolderID="toolTip" runat="server">
    输入您的搜索条件，点击“查找”按钮搜索，在结果中点击用户进行选择。点击“确定”按钮完成传阅。
</asp:Content>--%>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <link rel='stylesheet' type='text/css' href='../../Themes/Styles/zTreeStyle.css' />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/form.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/formsender.css" />
    <link rel="stylesheet" type="text/css" href="../../Themes/Styles/common2.css" />
    <table>
        <tr>
            <td nowrap>
                搜索
                <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" Width="120px" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
                <%--  <zhongsoft:DropCheckBoxList runat="server" ID="ddlUserGroup" TitleName="分组" SearchBtnId="listGrid$btnList"
                    Style="text-align: left; margin-left: 8px" RepeatColumns="2" RepeatDirection="Horizontal"
                    ListWidth="380px" />--%>
                <asp:CheckBox runat="server" ID="cbAll" Text="传阅所有查询结果" OnCheckedChanged="cbAll_CheckedChanged"
                    AutoPostBack="true" />
                <input type="hidden" runat="server" id="hiCondition" />
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
    <%--    <asp:LinkButton runat="server" ID="btnList" Style="display: none" OnClick="btnSearch_Click"></asp:LinkButton>
    --%>
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="UsersList" AllowPaging="true"
        JsonClickMode="onclick" PageSize="9" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" OnRowCommand="UsersList_RowCommand" OnJsonClick="addObject">
        <Columns>
            <asp:BoundField DataField="LoginId" HeaderText="工号">
                <ItemStyle Width="15%" />
            </asp:BoundField>
            <asp:BoundField DataField="UserName" HeaderText="姓名">
                <ItemStyle Width="30%" />
            </asp:BoundField>
            <asp:BoundField DataField="OrganizationName" HeaderText="部门">
                <ItemStyle Width="55%" />
            </asp:BoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        var $partsMoreLoaded;
        function initCustomerPlugin() {
            $partsMoreLoaded = false;
            initPartsMore();
            $("#<%=this.tbUserInfo.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',user'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbUserInfo.ClientID %>").attr("value", ui.item.value);
                        if (typeof (rebindSelectorList) == "function") {
                            rebindSelectorList();
                        }
                    }
                }
            });

            $("#<%=cbAll.ClientID %>").live("change", function () { isCheckAll(); });
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
        }

        function beforeFinishSelect() {
            if ($("#<%=cbAll.ClientID %>").attr("checked")) {
                return confirm("确定传阅给所有查询到的人员？");
            }
            return true;
        }

        function isCheckAll() {

            if ($("#<%=cbAll.ClientID %>").attr("checked") == "checked") {
                //全选
                return true;
            } else {
                $("#objContainer").empty();
                outputObj.removeAllParam();
                $outHiParam.val(outputObj.xmlObj.xml());

                return false;
            }
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
