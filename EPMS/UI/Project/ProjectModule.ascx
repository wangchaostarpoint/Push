<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectModule.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectModuleList" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>
<tr>
    <%--<td colspan="2" style="height:28px" >        
    </td>--%>
    <td colspan="4" class="flexible">
        项目模块（系统、区域）
    </td>
    <td align="right" colspan="2">
        <asp:Button ID="btnAdd" Text="添加模块" runat="server" OnClientClick="return addModule();"
            DisplayStatus="(3.*)(3.修改项目启动)" OnClick="btnAdd_Click" />
    </td>
</tr>
<tr runat="server" id="trModule" visible="true">
    <td colspan="6">
        <zhongsoft:LightPowerGridView runat="server" ID="gvList" PageSize="100" Width="100%"
            AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ParamProjectModuleID"
            UseDefaultDataSource="true" OnRowDeleting="gvList_RowDeleting" BindGridViewMethod="BindGrid">
            <Columns>
                <asp:TemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                    <ItemTemplate>
                        <%# Container.DataItemIndex+1 %>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:BoundField DataField="OrganizationID" HeaderText="OrganizationID" Visible="false" />
                <asp:BoundField DataField="ParamProjectModuleID" HeaderText="ParamProjectModuleID"
                    Visible="false" />
                <asp:TemplateField HeaderText="模块编号" ItemStyle-Width="20%">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbModuleCode" Text='<%#DataBinder.Eval(Container.DataItem,"ModuleCode") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="模块名称" ItemStyle-Width="30%">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbModuleName" Text='<%#DataBinder.Eval(Container.DataItem,"ModuleName") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="类型">
                    <ItemTemplate>
                        <asp:Label runat="server" ID="lbModuleType" Text='<%#DataBinder.Eval(Container.DataItem,"ModuleType") %>'></asp:Label>
                    </ItemTemplate>
                </asp:TemplateField>
                <asp:TemplateField HeaderText="删除" Visible="false">
                    <ItemStyle HorizontalAlign="Center" Width="60px" />
                    <ItemTemplate>
                        <span id="flag" hasroll="<%# Eval("OrganizationID") %>" hasuser="<%# Eval("ParamProjectModuleID") %>">
                        </span>
                        <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                            CommandName="delete" CausesValidation="false" OnClientClick="return checkBeforeDel(this);"
                            CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ParamProjectModuleID") %>'>
                        </asp:ImageButton>
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>
        </zhongsoft:LightPowerGridView>
    </td>
</tr>
<input runat="server" id="hiProjectId" type="hidden" />
<input runat="server" id="hiXml" type="hidden" />
<script type="text/javascript" language="javascript">
    function addModule() {
        var xml = $("#<%=hiXml.ClientID %>").val();
        var json={ProjectTypeId:<%=ProjectTypeId %>};
        var url = buildQueryUrl("EPMS/Obsolete/ProjectModuleSelector.aspx", json);
        showDivDialog(encodeURI(url), xml, 850, 350, afterParamFilter);
        return false;
    }
    function afterParamFilter(re) {
        var arr = re.split('|');
        $("#<%=hiXml.ClientID %>").val(arr[0]);        
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAdd, "")%>;
        return true;
    }
    function checkBeforeDel(obj) {
        return confirm("您确定要删除吗？");
    }
</script>
