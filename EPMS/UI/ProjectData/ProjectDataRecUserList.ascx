<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectDataRecUserList.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.ProjectData.ProjectDataRecUserList" %>
<zhongsoft:LightPowerGridView ID="gvRecUser" runat="server" AllowPaging="true" ShowFooter="false"
    UseDefaultDataSource="true" PageSize="100" AutoGenerateColumns="false" Width="100%"
    DataKeyNames="ProjectDataRecUserID" EmptyDataText="没有人员信息" BindGridViewMethod="UserControl.BindRecUserGridData"
    ShowExport="false" HideFieldOnExport="反馈意见（是否符合要求）,操作" ShowPageSizeChange="true" OnRowCommand="gvRecUser_RowCommand"
    OnRowDataBound="gvRecUser_RowDataBound" OnExport="gvRecUser_Export">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
            <HeaderStyle Width="40px"></HeaderStyle>
            <ItemStyle HorizontalAlign="Center"></ItemStyle>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField HeaderText="专业编号" DataField="SpecialtyCode">
            <HeaderStyle Width="100px"></HeaderStyle>
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="专业名称" DataField="SpecialtyName">
            <HeaderStyle Width="100px"></HeaderStyle>
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="接收人" DataField="RecUserNames">
            <HeaderStyle Width="100px"></HeaderStyle>
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="反馈意见（是否符合要求）">
            <ItemTemplate>
                <table>
                    <tr>
                        <td>
                            <asp:RadioButtonList ID="rdblIsCanRec" runat="server" req="1" RepeatColumns="2" AutoPostBack="True" OnSelectedIndexChanged="rdblIsCanRec_SelectedIndexChanged">
                                <asp:ListItem Text="是" Value="是"></asp:ListItem>
                                <asp:ListItem Text="否" Value="否"></asp:ListItem>
                            </asp:RadioButtonList></td>
                        <td>
                            <zhongsoft:LightTextBox ID="tbOpinion" runat="server" /></td>
                        <td>
                            <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveDate"
                                EnableTheming="false" req="1" class="kpms-textbox-date" readonly="readonly" />
                        </td>
                    </tr>
                </table>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField HeaderText="符合要求" DataField="IsCanRec" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="反馈意见" DataField="Opinion" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="接收时间" DataField="ReceiveDate" DataFormatString="{0:yyyy-MM-dd}" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightButtonField HeaderText="操作" CommandName="DeleteData" ItemStyle-Width="40px">
            <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>

            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
        </zhongsoft:LightButtonField>
    </Columns>

    <PagerStyle HorizontalAlign="Right"></PagerStyle>
</zhongsoft:LightPowerGridView>
