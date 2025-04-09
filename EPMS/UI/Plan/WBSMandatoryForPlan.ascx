<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSMandatoryForPlan.ascx.cs" 
Inherits="Zhongsoft.Portal.EPMS.UI.Plan.WBSMandatoryForPlan" %>

<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMandatoryList" AllowPaging="True"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="MandatoryTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
    OnRowDataBound="gvWBSMandatory_RowDataBound">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
            </zhongsoft:LightTemplateField>
              <zhongsoft:LightTemplateField HeaderText="专业名称" HeaderStyle-Width="50">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSpecialty"></asp:Label>
                            </ItemTemplate>
            </zhongsoft:LightTemplateField>
         <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" ShowToolTip="true" Width="50">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="规范名称" DataParamFields="MandatoryTemplateID"
            DialogMode="Dialog" EditItemClick="viewMandatoryDetail">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号" ShowToolTip="true"
            Width="80">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="MandatoryContent" HeaderText="强制性条文内容" ShowToolTip="true"
            Width="300">
        </zhongsoft:LightBoundField>
    </Columns>
</zhongsoft:LightPowerGridView>
<script type="text/javascript">
    function viewMandatoryDetail(bizId) {
        var json = { actionType: 1, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
        showDivDialog(url, null, 850, 450, null);
    }

</script>
