<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectSpecialty.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectSpecialtyList" %>
<table class="tz-table">
    <tr>
        <td colspan="4" class="flexible" onclick="openDetail('<%=trDept.ClientID %>')">
            项目专业&nbsp;<img src="<%=WebAppPath %>/Themes/Images/lright.png" />
        </td>
        <td align="right" colspan="2">
            <asp:Button ID="btnAddSpecialty" Text="添加专业" runat="server" OnClientClick="return addSpecialty();"
                DisplayStatus="(3.*)(3.修改项目启动)" OnClick="btnAddSpecialty_Click" />
            <input type="hidden" runat="server" id="hiSpecialtys" value="<root></root>" />
        </td>
    </tr>
    <tr runat="server" id="trDept" visible="true">
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gridView" PageSize="100" Width="100%"
                UseDefaultDataSource="true" AutoGenerateColumns="false" AllowSorting="true" OnRowDataBound="gridView_RowDataBound"
                DataKeyNames="ProjectSpecialtyID" OnRowDeleting="gridView_RowDeleting" BindGridViewMethod="BindGrid">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                            <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ProjectSpecialtyID") %>' />
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:BoundField DataField="ParamSpecialtyID" HeaderText="ParamSpecialtyID" Visible="false" />
                    <asp:TemplateField HeaderText="专业代字" ItemStyle-Width="20%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbSpecialtyCode" Text='<%#DataBinder.Eval(Container.DataItem,"SpecialtyCode") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="专业名称" ItemStyle-Width="30%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbSpecialtyName" Text='<%#DataBinder.Eval(Container.DataItem,"SpecialtyName") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="所属部门">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlDept" runat="server">
                            </zhongsoft:LightDropDownList>
                            <asp:Label ID="lbDept" runat="server" Text="" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="删除" Visible="false">
                        <ItemStyle HorizontalAlign="Center" Width="60px" />
                        <ItemTemplate>
                            <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                CommandName="delete" CausesValidation="false" OnClientClick="return checkBeforeDel(this);"
                                CommandArgument='<%#DataBinder.Eval(Container.DataItem,"ProjectSpecialtyID") %>'>
                            </asp:ImageButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input runat="server" id="hiProjectId" type="hidden" />
<input runat="server" id="hiXml" type="hidden" />
<input runat="server" id="hiZHSpeCode" type="hidden" value="A" />
<input runat="server" id="hiZHSpeName" type="hidden" value="综合" />
<!----项目类型--->
<input runat="server" id="hiParamProjectTypeID" type="hidden" />
<script type="text/javascript" language="javascript">
    //添加专业
    function addSpecialty() {       
        var projectTypeId = $('#<%=hiParamProjectTypeID.ClientID %>').val();
        var param = new InputParamObject("m");
        var josn = { ParamProjectTypeID: projectTypeId, SelectForOrg: '1'};
        getDivSpecialty("<%=hiXml.ClientID %>", param, josn, afterAddSpecialty);
        return false;
    }
    
    function afterAddSpecialty(re) {
        //$("#<%=hiXml.ClientID %>").val(re);
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddSpecialty, "")%>;
        return false;
    }

    function checkBeforeDel(obj) {
        return confirm("您确定要删除此专业吗？");
    }
</script>
