<%@ Page Language="C#" AutoEventWireup="true" Title="知识推送" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    CodeBehind="C_KonwledgePush.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.C_KonwledgePush" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">当前项目名称/编号</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbCurent" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">当前卷册名称/编号</span>
        <span>
            <zhongsoft:LightTextBox runat="server" ID="tbCurentWbs" CssClass="kpms-textboxsearch"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">历史项目名称/编号</span>
            <span>
                <zhongsoft:LightTextBox runat="server" ID="tbRelate" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">历史卷册名称/编号</span>
                <span>
                    <zhongsoft:LightTextBox runat="server" ID="tbRelateWbs" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></zhongsoft:LightTextBox>
                </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <span class="req-star" style="line-height: 26px;">显示当前人负责卷册，同工程类型——同设计阶段——同卷册编号的历史工程资料数据</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <table class="list" style="width: 100%" cellpadding="0" border="0">
        <tr class="list-header">
            <td colspan="3" id="tdl">
                当前工作
            </td>
            <td colspan="4" id="tdr">
                历史工程资料
            </td>
        </tr>
    </table>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="2" runat="server" ShowPageSizeChange="true"
        OnRowDataBound="gvWBS_RowDataBound" AllowSorting="true" OnSorting="gvWBS_Sorting"
        BindGridViewMethod="BindDataGrid" OnRowCommand="gvWBS_RowCommand" Width="100%">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目" ItemStyle-Width="100px" SortExpression="ProjectCode"
                ItemStyle-Wrap="true">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProj" Text='<%# string.Format("{0}【{1}】",Eval("ProjectName"),Eval("ProjectCode")) %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="工作内容" ItemStyle-Width="100px" SortExpression="WBSCode"
                ItemStyle-Wrap="true">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbWBS" Text='<%# string.Format("{0}【{1}】",Eval("WBSName"),Eval("WBSCode")) %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="历史项目" ItemStyle-Width="200px" SortExpression="OldProjectCode">
                <ItemTemplate>
                    <asp:Label ID="lbPldProj" runat="server" Text='<%#Eval("OldWBSCode")==DBNull.Value? MoreFlag: string.Format("{0}【{1}】",Eval("OldProjectName"),Eval("OldProjectCode"))%>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="历史卷册" ItemStyle-Width="200px" SortExpression="OldWBSCode">
                <ItemTemplate>
                    <%# Eval("OldWBSCode")==DBNull.Value?string.Empty: string.Format("{0}【{1}】", Eval("OldWBSName"), Eval("OldWBSCode"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="OldWBSOwnerName" HeaderText="卷册负责人" SortExpression="OldWBSOwnerName"
                Width="50px" />
            <zhongsoft:LightTemplateField HeaderText="资料信息" ItemStyle-Width="50px">
                <ItemTemplate>
                    <a class="aStyle" onclick="viewProduct('<%#Eval("OldWBSID") %>')">成品</a> <a class="aStyle"
                        onclick="viewConent('<%#Eval("OldWBSID") %>')">互提资料</a> <a class="aStyle" onclick="viewConent('<%#Eval("OldWBSID") %>')">
                            外部资料</a>
                    <input type="hidden" runat="server" id="hiRollID" value='<%#Eval("WBSID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiMoreTempTxt" value="<a class='aStyle' onclick='viewMore({0})' title='默认显示3条相关信息，点击查看更多'>更多</a>" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";
        //        $hideObjIds = "ctl00_btnQuery,ctl00_btnResrt";

        function initPagePlugin() {
            initHeaderWidth();
        }

        //设置标题行宽度
        function initHeaderWidth() {
            var tr = $('#<%=gvWBS.ClientID %> tr:first');
            var lw = 0;
            var rw = 0;
            var cnt = 0;
            tr.children('th').each(function () {
                if (cnt <= 2) {
                    lw += $(this).width();
                    cnt++;
                }
                rw += $(this).width();
            });

            $('#tdl').width(lw - 2 + 'px');
            $('#tdr').width((rw - lw + 2) + 'px');
        }

        //查看更多当前卷册的知识推送信息
        function viewMore(rollId) {
            var json = { RollId: rollId };
            var url = buildQueryUrl("/EPMS/List/WBS/C_KonwledgePush.aspx", json);
            showDivDialog(url, "", 1250, 530);
        }

        //查看成品信息
        function viewProduct(rollId) {
            var url = buildQueryUrl("/EPMS/List/Product/C_ProductList.aspx", { "RollID": rollId, "secid": "B53E6C85-096B-4A6B-98D9-8A78774FC8CC" });
            showDivDialog(url, "", 1250, 530);
        }

        //查看资料信息（卷册档案袋页面）
        function viewConent(rollId) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_MutualFileList.aspx", { "RollID": rollId, "secid": "c344a19b-ed2b-408a-a7b6-e6069f32a96b" });
            showDivDialog(url, "", 1250, 530);
        }

        //查看外部资料
        function viewConent(rollId) {
            var url = buildQueryUrl("/EPMS/List/WBS/C_ExternalFileList.aspx", { "RollID": rollId, "secid": "58799f61-7761-43e8-961f-4ca93fa67039" });
            showDivDialog(url, "", 1250, 530);
        }

    </script>
</asp:Content>
