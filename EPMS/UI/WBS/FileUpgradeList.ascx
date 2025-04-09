<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileUpgradeList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileUpgradeList" %>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
    PageSize="50" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="提资专业">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="接受专业">
            <ItemTemplate>
                <div runat="server" id="divRecSpe" class='autoskip' style='width: 180px'>
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="接受卷册">
            <ItemTemplate>
                <div runat="server" id="divRecRoll" class='autoskip' style='width: 180px'>
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="提交状态" ItemStyle-Width="60px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbState"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <asp:TemplateField HeaderText="继承方式">
            <ItemTemplate>
                <asp:RadioButtonList runat="server" ID="rblInhreit" RepeatDirection="Horizontal"
                    req="1">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiFileId" value='<%#Eval("WBSID") %>' />
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="操作" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
            Visible="false">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnUp" runat="server" EnableTheming="false" Visible="false"
                    ToolTip="升版" OnClientClick="return false">
                    <img alt="img" src="../../Themes/Images/btn_shengban.png" onclick="upgrade('<%#Eval("OrganizationID") %>','<%#Eval("WBSID") %>','0','<%#Eval("ExecSpecialtyID") %>')"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
