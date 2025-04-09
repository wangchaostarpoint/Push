<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="DesignFilesList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.DesignFilesList" %>
<table width="100%" style="display: none">
    <tr>
        <td>
            项目编号/名称
            <asp:TextBox ID="tbProjectCodeOrName" runat="server" class="kpms-textboxsearch"></asp:TextBox>
            卷册编号/名称
            <asp:TextBox ID="tbRollCodeOrName" runat="server" class="kpms-textboxsearch"></asp:TextBox>
            资料编号/名称
            <asp:TextBox ID="tbFileCodeOrName" runat="server" class="kpms-textboxsearch"></asp:TextBox>
            &nbsp;&nbsp;&nbsp;
            <asp:LinkButton runat="server" class="searchbtn bluecolor" ID="btnSearch" OnClick="btnSearch_Click">
                      <span content="searchResultf">查找</span>
            </asp:LinkButton>
            &nbsp;
            <asp:LinkButton runat="server" class="searchbtn" ID="btnReset" OnClick="btnReset_Click">
                     <span>重置</span>
            </asp:LinkButton>
        </td>
    </tr>
</table>
<zhongsoft:LightPowerGridView ID="gvFiles" runat="server" AutoGenerateColumns="false"
    UseDefaultDataSource="true" AllowPaging="true" PageSize="10" AllowSorting="true"
    DataKeyNames="FileID" OnRowDataBound="gvFiles_RowDataBound" BindGridViewMethod="UserControl.BindFileList">
    <Columns>
        <asp:BoundField HeaderText="项目编号" DataField="ProjectPhaseCode" />
        <asp:BoundField HeaderText="项目名称" DataField="ProjectPhaseName" />
        <asp:BoundField HeaderText="卷册编号" DataField="RollCode" />
        <asp:BoundField HeaderText="卷册名称" DataField="RollName" />
        <asp:BoundField HeaderText="专业代字/名称" DataField="SpecialtyName" />
        <asp:BoundField HeaderText="资料编号" DataField="FileCode" />
        <asp:BoundField HeaderText="资料名称" DataField="FileName" />
        <asp:BoundField HeaderText="成品等级" DataField="ProductLevelTypeName" />
        <asp:BoundField HeaderText="成品类别" DataField="PorductType" />
        <asp:TemplateField HeaderText="文件名称">
            <ItemTemplate>
                <a runat="server" id="aFileName" style="text-decoration: underline; color: blue;">
                    <%#Eval("FileName")%></a>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Label ID="lblMemo" runat="server" Style="color: Red"></asp:Label>