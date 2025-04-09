<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSVerifyOperator.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.WBSVerifyOperator" %>
<table style="width: 150px; border-spacing: 0px">
    <tr>
        <td>
            <asp:DataList ID="dlWBSOperatorList" runat="server" EnableViewState="true" RepeatDirection="Horizontal"
                RepeatColumns="7" Width="100%" OnItemDataBound="dlWBSOperatorList_ItemDataBound">
                <ItemTemplate>
                    <table style="width: 115px; border-spacing: 0px; border-color: #cbccce; border-style: solid;
                        border-width: 1px;">
                        <tr style="height: 25px;">
                            <td style="width: 100%;">
                                <asp:Label runat="server" ID="lbRoleName" Text='<%# Eval("VerifyRole") %>'></asp:Label>
                            </td>
                        </tr>
                        <tr align="left">
                            <td style="height: 28px; border-color: #cbccce; border-style: solid; border-width: 1px;"
                                runat="server" id="tdtest">
                                <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" IsMutiple="true"
                                    Width="110px" Value='<%#Eval("UserName")%>' SelectPageMode="Dialog" SourceMode="SelectorPage"
                                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                    PageWidth="850" ResultForControls="{'hiOperatorId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                                </zhongsoft:LightObjectSelector>
                                <%--                                <asp:Label runat="server" ID="test" Text='<%# Eval("UserName") %>'></asp:Label>
                                --%>
                                <input type="hidden" runat="server" id="hiOperatorId" value='<%#Eval("UserId")%>' />
                                <input type="hidden" runat="server" id="hiRoleId" value='<%#Eval("RoleId")%>' />
                                <input type="hidden" runat="server" id="hiRoleLevel" value='<%#Eval("RoleLevel")%>' />
                                <input type="hidden" runat="server" id="hiDeptID" value='<%#Eval("DeptID")%>' />
                                <input type="hidden" runat="server" id="hiIsShowChildDept" value='<%#Eval("IsShowChildDept")%>' />
                                <input type="hidden" runat="server" id="hiIsSetUserQualitic" value='<%#Eval("IsSetUserQualitic")%>' />
                                <div runat="server" id="div">
                                </div>
                            </td>
                        </tr>
                    </table>
                </ItemTemplate>
            </asp:DataList>
        </td>
    </tr>
</table>
<asp:Button ID="btnRoleOperatorRefresh" runat="server" Style="display: none" OnClick="btnRoleOperatorRefresh_Click" />
<input type="hidden" runat="server" id="hiSaveOperatorId" />
<input type="hidden" runat="server" id="hiSaveOperatorName" />
<input type="hidden" runat="server" id="hiSaveRoleName" />
<input type="hidden" runat="server" id="hiSaveRoleLevel" />
<script type="text/javascript">
    //查看该人员在所属任务中签署的成品内容
    function showSignProduct(operatorId) {
    }

    function afterSelectRoleOperator(roleName, roleLevel, operatorIds, operatorNames) {
        $("#<%=hiSaveOperatorId.ClientID %>").val($("#" + operatorIds).val());
        $("#<%=hiSaveOperatorName.ClientID %>").val($("#" + operatorNames).val());
        $("#<%=hiSaveRoleName.ClientID %>").val(roleName);
        $("#<%=hiSaveRoleLevel.ClientID %>").val(roleLevel);
        $("#<%=btnRoleOperatorRefresh.ClientID %>").click();
    }

    //查看校审人校审的成品信息
    function viewOperateProduct(obj) {
        var operateUserID = $(obj).attr("operateUserID");
        var json = { operateUserID: operateUserID, productVerifyID: "<%=BizId %>" };
        var url = buildQueryUrl('EPMS/List/Product/OperatorVerifyProductList.aspx', json);
        showDivDialog(url, null, 900, 600, null);
        return false;
    }
</script>
