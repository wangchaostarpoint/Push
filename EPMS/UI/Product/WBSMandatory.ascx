<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSMandatory.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.WBSMandatory" %>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMandatoryList" AllowPaging="True"
    PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="MandatoryTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindMandatoryList">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="规范名称" DataParamFields="MandatoryTemplateID"
            DialogMode="Dialog" EditItemClick="viewMandatoryDetail">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号" ShowToolTip="true"
            Width="100">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="MandatoryContent" HeaderText="强制性条文内容" ShowToolTip="true"
            Width="300">
        </zhongsoft:LightBoundField>
        <%-- <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
            ItemStyle-Width="35px">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="ibtnView" EnableTheming="false">
                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                   onclick="return viewMandatory('<%#Eval("MandatoryTemplateID")%>');" />
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>--%>
    </Columns>
</zhongsoft:LightPowerGridView>
<script type="text/javascript">
    function viewMandatoryDetail(bizId) {
        var json = { actionType: 1, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
        showDivDialog(url, null, 850, 450, null);
    }

</script>
