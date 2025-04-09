<%@ Page Title="选择项目" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ProjectEntitySelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectEntitySelector" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table style="width: 100%;">
        <tr>
            <td colspan="2">项目编号/名称
                <asp:TextBox ID="tbProjectInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                设总工号/名称
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
            <td style="white-space: nowrap;">项目类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                项目阶段
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                项目状态
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectComleteInfo" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>

                <span class="req-star" style="display: none">默认<%=DefaultProjState %>的项目，<asp:Label ID="lbMas" runat="server"
                    Text="显示所有项目选择“全部”查询"> </asp:Label>
                </span><a href="#" class="aStyle" onclick="addProject()" style="display: none">项目台账</a>
            </td>
            <td>
                <asp:RadioButtonList runat="server" ID="rblProjClass" RepeatDirection="Horizontal">
                    <asp:ListItem runat="server" Text="全部" Value="全部项目" Selected="True" />
                    <asp:ListItem runat="server" Text="我的项目" Value="我的项目" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="2">
                <span style="display: none;">容量等级</span>
                <zhongsoft:LightDropDownList ID="ddlCapacityLevel" runat="server" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                <span style="display: none;">电压等级</span>
                <zhongsoft:LightDropDownList ID="ddlCapacityLevel2" runat="server" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                <span style="display: none;">容量等级</span><asp:CheckBox ID="cbxCY" runat="server" Visible="false" />
                <input runat="server" id="hiProjectCYFlag" type="hidden" value="创优" />
                <span style="display: none;">容量等级</span><asp:CheckBox ID="cbxZY" runat="server" Visible="false" />
                <input runat="server" id="hiProjectZYFlag" type="hidden" value="重要" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="gvList" AllowPaging="true"
        BindGridViewMethod="DoSelectByFilter" PageSize="8" runat="server" AutoGenerateColumns="false"
        UseDefaultDataSource="true" DataKeyNames="OrganizationId" OnRowDataBound="gvList_RowDataBound"
        OnJsonClick="addObject" JsonClickMode="onclick" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" ItemStyle-Width="100px" />
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="250px"
                ShowToolTip="true" Width="250px" />
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="项目类别" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="ProjectTypeName" />
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="ManagerUserName" />
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="项目状态" HtmlEncode="false"
                SortExpression="ProjectState">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="立项日期" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" SortExpression="FormDate">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段" ItemStyle-Width="70px"
                HtmlEncode="false" SortExpression="PhaseName" />
            <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="设计规模" ItemStyle-Width="80px"
                HtmlEncode="false" SortExpression="ProjectScale" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="CustomerID" HeaderText="业主名称" HtmlEncode="false"
                ItemStyle-Width="150px" SortExpression="CustomerID" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectNature" HeaderText="项目性质" HtmlEncode="false"
                SortExpression="ProjectNature" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectPLACE" HeaderText="项目地点" HtmlEncode="false"
                SortExpression="ProjectPLACE" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectArchivesNo" HeaderText="档号" HtmlEncode="false"
                SortExpression="ProjectArchivesNo" ShowToolTip="True" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        function addProject() {
            var url = "/Custom/LIST/Dashboard.aspx";
            var json = { ListId: 'd7cc7a08-99c0-4a22-92d8-eada93d8661b', ViewId: '7d52eac5-47ad-4bc8-83db-ee38eb663af9', secid: '69F4A8A4-F441-4AE6-86C0-42CE6A14BCEA', BusinessPlate: '1', IsDashboard: '1', ShowToolbar: '1', IsShowHeader: '1' };
            url = buildQueryUrl(url, json);
            window.open(url);
            //showDivDialog(url, "", 1000, 600);
            return false;
        }

        //是否换行显示
        if ('<%=IsEnterShow %>' == '1') {
            $EnterShow = true;
        }
    </script>
</asp:Content>