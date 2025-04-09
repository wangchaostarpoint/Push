<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InFileReleRoll.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.InFileReleRoll" MasterPageFile="~/UI/Master/ObjectEditor.Master" Title="关联卷册详细" %>

<%@ Register Src="../../UI/WBS/FileReceiveWBSList.ascx" TagName="FileReceiveWBSList"
    TagPrefix="uc2" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <uc2:FileReceiveWBSList ID="fileWBSList" runat="server" WbsType="卷册" />
    <uc2:FileReceiveWBSList ID="AffectedInterface" runat="server" WbsType="接口资料" />
    <%--<uc2:FileReceiveWBSList ID="fileEquip" runat="server" WbsType="设备技术规范书" />--%>

    <span style="float: right;" id="spAddWbs" runat="server" visible="false">
        <asp:LinkButton runat="server" ID="ibtnAddWbs" CssClass="subtoolbarlink" EnableTheming="false" flag="update"
            OnClientClick="return selQuipment();">
            <span>
                <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加设备" width="16"
                    height="16" />添加设备</span>
        </asp:LinkButton></span>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True" PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false" DataKeyNames="EquipmentID" UseDefaultDataSource="true" BindGridViewMethod="BindFile" ShowPager="true" Visible="false" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnEdit" EnableTheming="false" OnClientClick='<%# String.Format("return viewEQDetail(\"{0}\")",Eval("EquipmentID")) %>'>
                        <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_view.gif" /></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="专业" DataField="SpecialtyName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="设备名称" DataField="QuipmentName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="备注" DataField="Memo">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" flag="update"
                        CommandArgument='<%# Eval("EquipmentID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiQuipmentXML" />
    <asp:Button runat="server" ID="btnAddQuipment" OnClick="btnAddQuipment_Click" Visible="false" />
    <script type="text/javascript">
        function viewEQDetail(bizId) {
            var url = buildQueryUrl("/EPMS/List/ProjectData/EquipmentEntityEditor.aspx", { actionType: 1, bizId: bizId });
            showDivDialog(url, null, 800, 500, null);
            return false;
        }

        function selQuipment() {
            var param = new InputParamObject("m");
            var filter = { OrganizationID: '<% =OrganizationID%>' };
            getQuipment('<%=hiQuipmentXML.ClientID %>', param, filter, addQuipment);

            return false;
        }

        function addQuipment() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddQuipment,"")%>;
        }
    </script>
</asp:Content>

