<%@ Page Language="C#" AutoEventWireup="true" Title="关联设备模板" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="RelateEuipmentTemplate.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.RelateEuipmentTemplate" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                模板名称
                <zhongsoft:LightTextBox ID="tbName" runat="server" Width="70px"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton runat="server" ID="ibtnOK" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="选择完成" OnClick="ibtnOK_Click">
        <span>
            <img runat="server" id="imgOk" src="~/Themes/Images/btn_finish.gif" alt="选择完成" width="16"
                height="16" />选择完成</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnCancel" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="取消" OnClientClick="return closeWindow();">
        <span>
            <img runat="server" id="imgCancel" src="~/Themes/Images/btn_cancel.gif" alt="取消"
                width="16" height="16" />取消</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <div style="display: none;">
        <asp:LinkButton runat="server" ID="ibtnSelected" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnSelected_Click">
        <span>已选择</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="ibtnSelectTo" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnSelectTo_Click">
        <span>待选择</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="ibtnAll" CssClass="subtoolbarlink" EnableTheming="false"
            OnClick="ibtnAll_Click">
        <span>全部</span>
        </asp:LinkButton>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="100" AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="QuipmentTemplateID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridViewRow">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("QuipmentTemplateID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="QuipmentCode" HeaderText="设备编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QuipmentName" HeaderText="设备名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="UsingRange" HeaderText="适用的范围">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="KKSCode" HeaderText="KKS编码">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function initCustomerPlugin() {
            //隐藏查询工具条
            $('#tbQuery').hide();
        }

    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
