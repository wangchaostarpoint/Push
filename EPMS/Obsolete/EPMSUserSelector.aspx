<%@ Page Language="C#" AutoEventWireup="true" Title="选择人员" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="EPMSUserSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.EPMSUserSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td nowrap>
                项目资格
                <zhongsoft:LightDropDownList ID="ddlUserQualitic" runat="server" Width="120px">
                </zhongsoft:LightDropDownList>
                人员
                <zhongsoft:LightTextBox ID="tbUserInfo" runat="server" Width="80px" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
                项目
                <zhongsoft:LightTextBox ID="tbProjInfo" runat="server" Width="80px" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiProjId" />
                <input type="hidden" runat="server" id="hiShowMore" value="0" />
                部门
                <zhongsoft:LightDropDownList ID="ddlDept" runat="server" Width="120px">
                </zhongsoft:LightDropDownList>
                <asp:LinkButton runat="server" ID="lbtnMore" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lbtnMore_Click" Visible="false">
                     <span>更多人员</span>
                </asp:LinkButton>
                <a class="subtoolbarlink" id="btnMoreParts" title="在全院人员中搜索" style="display: none">
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
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter"
        OnJsonClick="addObject" JsonClickMode="onclick" DataKeyNames="UserId" ShowJsonRowColName="true"
        OnRowDataBound="gvList_RowDataBound" ShowPageSizeChange="true" PageSize="9">
        <Columns>
            <zhongsoft:LightBoundField DataField="UserId" HeaderText="ID" Visible="false" />
            <zhongsoft:LightTemplateField HeaderText="提示" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbIsNeedException" Text="【破格】" ForeColor="Red" ToolTip="需破格"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="LoginID" HeaderText="工号" />
            <zhongsoft:LightBoundField DataField="UserName" HeaderText="姓名" />
            <zhongsoft:LightBoundField DataField="OrganizationName" HeaderText="部门">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="资格信息">
                <ItemTemplate>
                    <div style="word-break: break-all !important; white-space: normal !important; width: 220px;">
                        <asp:Label runat="server" ID="lbQualification"></asp:Label>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <HeaderTemplate>
                    工作负荷<asp:LinkButton ID="lkbView" runat="server" EnableTheming="false" ForeColor="Blue">[查看]</asp:LinkButton>
                </HeaderTemplate>
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbMyWork"></asp:Label>
                    <a onclick="viewCurrWork('<%#Eval("UserId") %>')" title="">
                        <img id="imgCurrWork" flag="currWork" userid='<%#Eval("UserId")%>' src="<%=WebAppPath %>/Themes/Images/loadGreen.png" alt="查看" />
                    </a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" id="hiShowViewInfo" runat="server" value="0" />
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

            });

            initUserTaskCnt();

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

        //加载列表查看按钮Title信息
        function setTitle(obj, userID) {
            var title = $(obj).find("#imgCurrWork").attr("title");

            if (title == "" || title == undefined) {
                //更具UserID异步加载当前人对应的所负担任务（状态为正在进行）的总数
                $.post("<%=WebAppPath %>" + "/EPMS/List/OBS/CurrentTaskDetailList.aspx",
                 { asyfunc: "GetUserTaskMassage", struserID: userID },
                 function (res) {
                     $(obj).find("#imgCurrWork").attr("title", res);
                 }
                );
            }
        }

        //初始化人员任务数量信息
        function initUserTaskCnt() {
            var userIds = '';
            $('#<%=gvList.ClientID%> [flag="currWork"]').each(function () {
                var userId = $(this).attr('userid');
                userIds += userId + ',';
            });
            userIds = userIds.substring(0, userIds.length - 1);

            $.post("<%=WebAppPath %>" + "/EPMS/List/OBS/CurrentTaskDetailList.aspx",
                { asyfunc: "GetUserTaskCnt", struserID: userIds },
                function (res) {
                    var task = eval(res);
                    var len = task.length;

                    $('#<%=gvList.ClientID%> [flag="currWork"]').each(function () {
                        var userId = $(this).attr('userid');
                        for (var i = 0; i < len; i++) {
                            var t = task[i];
                            if (t.id == userId) {
                                var cnt = t.value;
                                var color = ''
                                if (cnt < 10) {
                                    color = 'green';
                                }
                                else if (cnt >= 10 && cnt < 20) {
                                    color = 'yellow';
                                }
                                else if (cnt >= 20) {
                                    color = 'red';
                                }

                                var imgUrl = '/Themes/Images/load' + color + '.png';
                                imgUrl = buildQueryUrl(imgUrl, null);
                                //根据负荷数量，设置不同颜色图标
                                $(this).attr('src', imgUrl);

                                break;
                            }
                        }
                    });
                }
            );
        }

    </script>
</asp:Content>
