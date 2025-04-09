<%@ Page Language="C#" AutoEventWireup="true" Title="资料信息" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="FileOfSpecialtyList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.FileOfSpecialtyList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <asp:DataList runat="server" ID="dlWBS" OnItemDataBound="dlWBS_ItemDataBound" Width="100%">
        <ItemTemplate>
            <!-- 折叠-->
            <span flag="wbsSpan" id="spanTitle" style="cursor: pointer;">
                <img src="../../Themes/Images/TreeImages/minus.gif" />
                部门：<%#Eval("DeptName")%>专业：<%#Eval("SpecialtyName")%>
                &nbsp;&nbsp; 提出资料（<asp:Label runat="server" ID="lbOutFile" Text="0"></asp:Label>）项，
                接受资料（<asp:Label runat="server" ID="lbInFile" Text="0"></asp:Label>）项， 外部资料（<asp:Label
                    runat="server" ID="lbExteral" Text="0"></asp:Label>）项</span>
            <div flag="wbsDiv" id="divWbs">
                <p>
                    模板中有<a class="aStyle" flag="outFileTemp" speid='<%#Eval("ParamSpecialtyID") %>'>提出资料（<asp:Label
                        runat="server" ID="lbTempOutFile" Text="0"></asp:Label>）供选择</a>，<a class="aStyle"
                            flag="inFileTemp" speid='<%#Eval("ParamSpecialtyID") %>'>接受资料（
                            <asp:Label runat="server" ID="lbTempInFile" Text="0"></asp:Label>）供选择</a>，<a class="aStyle"
                                flag="externalTemp" speid='<%#Eval("ParamSpecialtyID") %>'>外部资料（
                                <asp:Label runat="server" ID="lbTempExteral" Text="0"></asp:Label>）供选择</a>&nbsp;
                    <!-- 不可以添加服务器控件，否则翻页后无法显示-->
                    <a class="subtoolbarlink" flag="selectOutFile" speid='<%#Eval("ParamSpecialtyID") %>'>
                        <span>
                            <img runat="server" id="imgSelect" src="~/Themes/Images/look-up.gif" alt="选择历史项目提出资料"
                                width="16" height="16" />选择历史项目提出资料</span></a> <a class="subtoolbarlink" flag="addOutFile"
                                    speid='<%#Eval("ParamSpecialtyID") %>' deptid='<%#Eval("DeptID")%>'><span>
                                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新建提出资料" width="16"
                                            height="16" />新建提出资料</span></a><a class="subtoolbarlink" flag="selectExternal" speid='<%#Eval("ParamSpecialtyID") %>'><span>
                                                <img runat="server" id="img1" src="~/Themes/Images/look-up.gif" alt="选择历史项目外部资料"
                                                    width="16" height="16" />选择历史项目外部资料</span></a> <a class="subtoolbarlink" flag="addExternal"
                                                        speid='<%#Eval("ParamSpecialtyID") %>' deptid='<%#Eval("DeptID")%>'><span>
                                                            <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="新建外部资料" width="16"
                                                                height="16" />新建外部资料</span></a>
                    <input type="hidden" runat="server" id="hiSpeId" value='<%#Eval("ParamSpecialtyID") %>' />
                </p>
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
                    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="FileItemID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
                    <Columns>
                        <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
                        </zhongsoft:LightCheckField>
                        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="任务编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="任务名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileItemCode" HeaderText="资料项编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileItemName" HeaderText="资料项名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileType" HeaderText="资料类别">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileImportance" HeaderText="资料重要性">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileNature" HeaderText="资料性质">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileForm" HeaderText="资料形式">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="FileSource" HeaderText="资料来源">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DelayDays" HeaderText="延迟（开工起）" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="所属专业">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongModule" HeaderText="所属模块（系统、区域）">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </div>
        </ItemTemplate>
    </asp:DataList>
    <asp:Button runat="server" ID="btnBindFile" OnClick="btnBindFile_Click" Visible="false" />
    <script type="text/javascript">

        function initWBSGenerate() {

            //todo初始化各专业wbs列表的显隐

            //控制显隐
            var $WbsSpan = $('[flag="wbsSpan"]');

            var wbsSpanLen = $WbsSpan.length;
            if (wbsSpanLen > 0) {
                for (var i = 0; i < wbsSpanLen; i++) {
                    $WbsSpan.eq(i).bind('click', function () {
                        //查找当前元素的下一个元素
                        var wbsDiv = $(this).next('[flag="wbsDiv"]');
                        //wbsDiv.slideToggle();导致hidden判断不起作用
                        //控制列表显隐、图片切换
                        if (wbsDiv.is(':hidden')) {
                            wbsDiv.show();
                            $(this).children('img').attr('src', '../../Themes/Images/TreeImages/minus.gif');
                        }
                        else {
                            wbsDiv.hide();
                            $(this).children('img').attr('src', '../../Themes/Images/TreeImages/plus.gif');
                        }
                    });
                }
            }

            //选择提出资料模板
            $('[flag="outFileTemp"]').each(function () {
                var speId = $(this).attr('speId');
                $(this).bind('click', function () {
                    outFileTemp(speId);
                });
            });

            //选择外部资料模板
            $('[flag="externalTemp"]').each(function () {
                var speId = $(this).attr('speId');
                $(this).bind('click', function () {
                    externalTemp(speId);
                });
            });

            //新建提出资料
            $('[flag="addOutFile"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    addOutFile(speId, deptId);
                });
            });

            //新建外部资料
            $('[flag="addExternal"]').each(function () {
                var speId = $(this).attr('speId');
                var deptId = $(this).attr('deptId');
                $(this).bind('click', function () {
                    addExternal(speId, deptId);
                });
            });

            //选择历史项目提出资料
            $('[flag="selectOutFile"]').each(function () {
                var speId = $(this).attr('speId');
                $(this).bind('click', function () {
                    selectOutFile(speId);
                });
            });

            //选择历史项目外部资料
            $('[flag="selectExternal"]').each(function () {
                var speId = $(this).attr('speId');
                $(this).bind('click', function () {
                    selectExternal(speId);
                });
            });
        }

        //新建资料
        function addFile(speId, deptId, fileType) {
            var json = { actionType: 2, OrganizationID: '<%=OrganizationID %>', ExecSpecialtyID: speId, DeptID: deptId, FileType: fileType };
            var url = buildQueryUrl('/EPMS/List/WBS/FileEditor.aspx', json);
            showDivDialog(url, "", 1050, 600, bindFile);
            return false;
        }

        //新建提出资料
        function addOutFile(speId, deptId) {
            addFile(speId, deptId, 0)
        }

        //新建外部资料
        function addExternal(speId, deptId) {
            addFile(speId, deptId, 1)
        }

        //资料详细
        function fileItem(actionType, bizId) {
            var json = { actionType: actionType, bizId: bizId, FileType: '' };
            var url = buildQueryUrl('/EPMS/List/WBS/WBSDetailEditor.aspx', json);
            var callBack = null;
            if (actionType == '3') {
                callBack = bindFile;
            }
            showDivDialog(url, "", 1050, 600, bindFile);
            return false;
        }

        //选择资料模板
        function fileTemp(speId, fileType) {
            var json = { OrganizationID: '<%=OrganizationID %>', SpecialtyID: speId, ProjectTemplateID: '<%=ProjectTemplateID %>', FileType: fileType };
            var url = buildQueryUrl('/EPMS/List/Sys/RelateWBSTemplate.aspx', json);
            showDivDialog(url, "", 1050, 600, bindFile);
            return false;
        }

        //选择提出资料模板
        function outFileTemp(speId) {
            fileTemp(speId, 0)
        }

        //选择外部资料模板
        function externalTemp(speId) {
            fileTemp(speId, 1)
        }

        //选择历史项目资料
        function selectFile(speId, fileType) {
            var json = { OrganizationID: '<%=OrganizationID %>', SpecialtyID: speId, FileType: fileType };
            var url = buildQueryUrl('/EPMS/Obsolete/OldProjectWBSSelector.aspx', json);
            showDivDialog(url, "", 1050, 600, bindFile);
            return false;
        }

        //选择历史项目提出资料
        function selectOutFile(speId) {
            selectFile(speId, 0)
        }

        //选择历史项目外部资料
        function selectExternal(speId) {
            selectFile(speId, 1)
        }

        //绑定资料列表
        function bindFile() {
            //<%=Page.ClientScript.GetPostBackEventReference(this.btnBindFile,"")%>;
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
