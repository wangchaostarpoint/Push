<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSQualityEvaluation.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.WBSQualityEvaluation" %>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvEvaluationList" AllowPaging="false"
    PageSize="100" AutoGenerateColumns="false" ShowExport="false" AllowSorting="true"
    EmptyDataText="没有校审结论信息" DataKeyNames="QualityEvaluationID" UseDefaultDataSource="true"
    BindGridViewMethod="BindGrid" OnRowDataBound="gvEvaluationList_RowDataBound">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="RoleName" HeaderText="评定角色" />
        <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="评定岗位" Visible="false" />
        <zhongsoft:LightTemplateField HeaderText="校审结论" Visible="false">
            <ItemTemplate>
                <zhongsoft:LightTextBox ID="tbEvaluationComment" runat="server" TextMode="MultiLine"
                    Text='<%#Eval("EvaluationComment")%>' Enabled="false" CssClass="kpms-textarea"
                    EnableTheming="false" maxtext="256" Height="10px"></zhongsoft:LightTextBox>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="质量等级<span class='req-star'>*</span>" Visible="false">
            <ItemTemplate>
                <asp:RadioButtonList ID="rblEvaluationLevel" runat="server" RepeatDirection="Horizontal"
                    Enabled="false" CssClass="kpms-radio" req="1">
                </asp:RadioButtonList>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="强条满足情况<span class='req-star'>*</span>">
            <ItemTemplate>
                <asp:RadioButtonList ID="rblEvaluationStrongArticle" runat="server" RepeatDirection="Horizontal"
                    Enabled="false" CssClass="kpms-radio" req="1">
                </asp:RadioButtonList>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="工作质量、环境、职业健康安全评定<span class='req-star'>*</span>">
            <ItemTemplate>
                <asp:RadioButtonList ID="rblEvaluationHealthSafety" runat="server" RepeatDirection="Horizontal"
                    Enabled="false" CssClass="kpms-radio" req="1">
                </asp:RadioButtonList>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="评定人" />
    </Columns>
</zhongsoft:LightPowerGridView>
<script type="text/javascript">

</script>
