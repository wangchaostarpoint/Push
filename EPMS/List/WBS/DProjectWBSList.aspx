<%@ Page Title="卷册执行情况" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="DProjectWBSList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.DProjectWBSList" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="WBSID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="校审单" HeaderStyle-Width="60px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsVerifyInfo" runat="server" EnableTheming="false" ForeColor="Blue"
                        CommandName="VerifyInfo" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span> <img alt="查看" src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" SortExpression="WBSCode"
                HeaderStyle-Width="60px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="卷册名称">
                <ItemTemplate>
                    <asp:LinkButton ID="lkbWbsInfo" runat="server" OnClientClick='<%# String.Format("return openWBSDetail(\"{0}\")", Eval("WBSID")) %>'
                        EnableTheming="false" ForeColor="Blue"><span><%#Eval("WBSName")%></span></asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="RollType" HeaderText="卷册类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSFlag" HeaderText="卷册标识">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSState" HeaderText="卷册状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划设计开始时间" DataField="PlanStartTime" SortExpression="PlanStartTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际开始时间" DataField="FactStartTime" SortExpression="FactStartTime"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="计划室交出时间" DataField="PlanRecheckTime1" SortExpression="PlanRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际室交出时间" DataField="FactRecheckTime1" SortExpression="FactRecheckTime1"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="实际部交出时间" DataField="FactRecheckTime2" SortExpression="FactRecheckTime2"
                DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function openWBSDetail(wbsid) {
            var url = buildQueryUrl("/EPMS/List/WBS/WBSEditor.aspx", { actionType: 1, bizid: wbsid });
            showDivDialog(url, null, 1000, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
