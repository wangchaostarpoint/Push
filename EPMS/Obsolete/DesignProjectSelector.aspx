<%@ Page Title="选择项目" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="DesignProjectSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.DesignProjectSelector" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                项目编号/名称
                <asp:TextBox ID="tbProjectInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                项目负责人工号/名称
                <asp:TextBox ID="tbManagerInfo" runat="server" CssClass="kpms-textboxsearch" Style="width: 80px"
                    MaxLength="10" EnableTheming="false"></asp:TextBox>
                立项时间
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                至
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                <asp:LinkButton runat="server" ID="lbtnMore" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lbtnMore_Click" Visible="false">
                   <span>更多</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td>                
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
                    EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                任务类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlTaskType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
                    EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                项目状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectComleteInfo" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        BindGridViewMethod="DoSelectByFilter" PageSize="7" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" DataKeyNames="OrganizationId" OnRowDataBound="gvList_RowDataBound"
        OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" ItemStyle-Width="80px" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="150px"
                ShowToolTip="true" />
            <zhongsoft:LightBoundField DataField="TaskType" HeaderText="任务类别" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="TaskType" />
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目负责人" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="ManagerUserName" />
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false"
                SortExpression="ProjectState">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" SortExpression="FormDate">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
    </script>
</asp:Content>
