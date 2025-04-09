<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjPlanBookList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjPlanBookList" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="项目策划书" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <zhongsoft:LightTextBox runat="server" ID="tbProjectName" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvProjPlanFileList" AllowPaging="true" runat="server"
        AutoGenerateColumns="false" UseDefaultDataSource="true" BindGridViewMethod="BindProjPlanInfo"
        OnRowDataBound="gvProjPlanFileList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" />
            <zhongsoft:LightBoundField DataField="VersionNum" HeaderText="版本" />
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="编制日期" />
            <zhongsoft:LightTemplateField HeaderText="下载">
                <ItemTemplate>
                    <a runat="server" id="aFileName" title='<%# Eval("ProjectName") %>' class="form-fujiana">
                        <%# Eval("ProjectName")%>
                    </a>
                    <input type="hidden" runat="server" id="hiBookFiledId" value='<%#Eval("BookFiledId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="套用策划书">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnUse" OnClick="lbtnUse_Click" CommandArgument='<%#Eval("BookFiledId") %>'>
                    <span>套用</span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>

    <script>
        function closeExpWindow() {
            parent.returnValue = 'OK';
            closeWindow();
            return false;
        }
    </script>
</asp:Content>
