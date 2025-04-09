<%@ Page Title="ѡ����Ŀ" Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ProjectEntitySelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectEntitySelector" %>

<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table style="width: 100%;">
        <tr>
            <td colspan="2">��Ŀ���/����
                <asp:TextBox ID="tbProjectInfo" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                ���ܹ���/����
                <asp:TextBox ID="tbManagerInfo" runat="server" CssClass="kpms-textboxsearch" Style="width: 80px"
                    MaxLength="10" EnableTheming="false"></asp:TextBox>
                ����ʱ��
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtStartDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                ��
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtEndDate" readonly="readonly"
                    class="kpms-textbox-comparedate" compare="1" />
                <asp:LinkButton runat="server" ID="lbtnMore" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="lbtnMore_Click" Visible="false">
                   <span>����</span>
                </asp:LinkButton>
            </td>
        </tr>
        <tr>
            <td style="white-space: nowrap;">��Ŀ����
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                ��Ŀ�׶�
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhase" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                ��Ŀ״̬
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectComleteInfo" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>

                <span class="req-star" style="display: none">Ĭ��<%=DefaultProjState %>����Ŀ��<asp:Label ID="lbMas" runat="server"
                    Text="��ʾ������Ŀѡ��ȫ������ѯ"> </asp:Label>
                </span><a href="#" class="aStyle" onclick="addProject()" style="display: none">��Ŀ̨��</a>
            </td>
            <td>
                <asp:RadioButtonList runat="server" ID="rblProjClass" RepeatDirection="Horizontal">
                    <asp:ListItem runat="server" Text="ȫ��" Value="ȫ����Ŀ" Selected="True" />
                    <asp:ListItem runat="server" Text="�ҵ���Ŀ" Value="�ҵ���Ŀ" />
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td colspan="2">
                <span style="display: none;">�����ȼ�</span>
                <zhongsoft:LightDropDownList ID="ddlCapacityLevel" runat="server" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                <span style="display: none;">��ѹ�ȼ�</span>
                <zhongsoft:LightDropDownList ID="ddlCapacityLevel2" runat="server" class="kpms-ddlsearch" EnableTheming="false" Visible="false">
                </zhongsoft:LightDropDownList>
                <span style="display: none;">�����ȼ�</span><asp:CheckBox ID="cbxCY" runat="server" Visible="false" />
                <input runat="server" id="hiProjectCYFlag" type="hidden" value="����" />
                <span style="display: none;">�����ȼ�</span><asp:CheckBox ID="cbxZY" runat="server" Visible="false" />
                <input runat="server" id="hiProjectZYFlag" type="hidden" value="��Ҫ" />
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
            <zhongsoft:LightBoundField HeaderText="��Ŀ���" DataField="ProjectCode" ItemStyle-Width="100px" />
            <zhongsoft:LightBoundField HeaderText="��Ŀ����" DataField="ProjectName" ItemStyle-Width="250px"
                ShowToolTip="true" Width="250px" />
            <zhongsoft:LightBoundField DataField="ProjectType" HeaderText="��Ŀ���" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="ProjectTypeName" />
            <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="��Ŀ����" ItemStyle-Width="100px"
                HtmlEncode="false" SortExpression="ManagerUserName" />
            <zhongsoft:LightBoundField DataField="ProjectState" HeaderText="��Ŀ״̬" HtmlEncode="false"
                SortExpression="ProjectState">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FormDate" HeaderText="��������" HtmlEncode="false"
                DataFormatString="{0:yyyy-MM-dd}" SortExpression="FormDate">
                <ItemStyle Width="60px" />
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="��ƽ׶�" ItemStyle-Width="70px"
                HtmlEncode="false" SortExpression="PhaseName" />
            <zhongsoft:LightBoundField DataField="ProjectScale" HeaderText="��ƹ�ģ" ItemStyle-Width="80px"
                HtmlEncode="false" SortExpression="ProjectScale" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="CustomerID" HeaderText="ҵ������" HtmlEncode="false"
                ItemStyle-Width="150px" SortExpression="CustomerID" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectNature" HeaderText="��Ŀ����" HtmlEncode="false"
                SortExpression="ProjectNature" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectPLACE" HeaderText="��Ŀ�ص�" HtmlEncode="false"
                SortExpression="ProjectPLACE" Visible="false" ShowToolTip="True" />
            <zhongsoft:LightBoundField DataField="ProjectArchivesNo" HeaderText="����" HtmlEncode="false"
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

        //�Ƿ�����ʾ
        if ('<%=IsEnterShow %>' == '1') {
            $EnterShow = true;
        }
    </script>
</asp:Content>