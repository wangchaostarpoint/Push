<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductSignList.aspx.cs"
    Title="成品会签" MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductSignList" %>

<%@ Register Src="../../UI/Product/ProductSelect.ascx" TagName="ProductSelect" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td valign="top" style="width: 200px; height: 100%;">
                <uc1:ProductSelect ID="ProductSelect" runat="server" />
            </td>
            <td valign="top">
                <table style="width: 100%">
                    <tr>
                        <td valign="top" align="right">
                            <asp:Button ID="btnAddSpecialty" Text="添加专业" runat="server" class="kpms-buttonfree"
                                OnClientClick="return addSpecialty();" OnClick="btnAddSpecialty_Click" ToolTip="添加成品会签专业" />
                            <asp:Button ID="btnAddSignOperator" Text="添加会签人" runat="server" class="kpms-buttonfree"
                                OnClientClick="return addSignOperator();" OnClick="btnAddSignOperator_Click"
                                ToolTip="添加成品会签人" />
                        </td>
                    </tr>
                    <tr>
                        <td valign="top">
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
                                AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" UseDefaultDataSource="true"
                                BindGridViewMethod="BindGrid" OnRowCommand="gvList_RowCommand" DataKeyNames="ProductID"
                                OnRowDataBound="gvList_RowDataBound">
                                <Columns>
                                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightTemplateField HeaderText="会签信息">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSignInfo" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该会签成品吗？">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input runat="server" id="hiSignXml" type="hidden" />
    <asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
        OnClick="btnProductRefresh_Click" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
       //添加会签专业
    function addSpecialty() {
        var xml = $("#<%=hiSignXml.ClientID %>").val();
        var json= {ActionFlag : '1',SelectFlag:'1',OrganizationID:'<%=OrganizationID %>'};
        var url = buildQueryUrl("EPMS/Obsolete/SpeSelector.aspx", json);
        showDivDialog(encodeURI(url), xml, 850, 600, afterAddSpecialty);
        return false;
    }
    function afterAddSpecialty(re) {
        $("#<%=hiSignXml.ClientID %>").val(re);        
        <%=this.Page.ClientScript.GetPostBackEventReference(this.btnAddSpecialty, "")%>;
        return false;
    }

       //添加会签人员
    function addSignOperator() {
        var param = new InputParamObject("m");
        getDivUsersNew("<%=hiSignXml.ClientID %>",param,'',afterAddSignOperator);
        return false;
    }
    function afterAddSignOperator(re) { 
        <%=this.Page.ClientScript.GetPostBackEventReference(this.btnAddSignOperator, "")%>;
        return false;
    }

    $("[name='fileCheck']>:checkbox").click(function () {
            $("#<%=btnProductRefresh.ClientID %>").click();
        });
       
    </script>
</asp:Content>
