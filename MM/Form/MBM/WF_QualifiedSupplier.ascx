<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_QualifiedSupplier.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MBM.WF_QualifiedSupplier" %>

<script type="text/javascript">
    function ChooseSupplyEntity() {
        var param = new InputParamObject("m");
        getDivSupplier("<%=hiXml.ClientID %>", param, "SupplierType:0", resetSupplyList);

        return false;
    }

    //新建、编辑申请设备弹出层callback方法
    function resetSupplyList() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnChooseSupply,"") %>

    }

    function KPMSCheckSubmit() {
        if ($readyFormSend) {
            var list = $("#<%=gridView.ClientID %>");
            if (list[0].rows.length < 2) {
                alert("请选择供方！");
                return false;
            }
        }
        return true;
    }
</script>

<table id="Table1" class="tz-table" width="100%">
    <tr>
        <td colspan="6" class="td-m" align="center">
            <b>供方列表</b>
        </td>
    </tr>
    <tr>
        <td colspan="6" class="td-m" align="right">
            <asp:Button ID="btnChooseSupply" runat="server" OnClientClick="return ChooseSupplyEntity()" class="btn"
                Text="选择供方" OnClick="btnChooseSupply_Click" ActiveStatus="(23.填写合格供方清单)(23.修改合格供方清单)"
                displaystatus="(23.填写合格供方清单)(23.修改合格供方清单)" />

        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gridView" AutoGenerateColumns="False"
                AllowPaging="true" Width="100%" OnRowCommand="gridView_RowCommand" OnRowDataBound="gridView_RowDataBound"
                UseDefaultDataSource="true" OnRowDeleting="gridView_RowDeleting" DataKeyNames="SupplyEntityListID">
                <Columns>
                    <asp:BoundField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center" />
                    <asp:BoundField DataField="SupplyEntityName" HeaderText="供方名称" />
                    <zhongsoft:LightBoundField DataField="CONTACTER" HeaderText="联系人" Width="70" />
                    <zhongsoft:LightBoundField DataField="TELEPHONE" HeaderText="联系电话" Width="100" />
                    <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnView" EnableTheming="false">
                        <img alt="" src ="<%=WebAppPath%>/Themes/Images/btn_chakan.gif" onclick="return viewItem('<%#Eval("SupplyEntityID")%>')"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:ImageButton ID="imgDel" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif"
                                CommandName="delete" ToolTip="删除" OnClientClick="return window.confirm('您确定删除吗？')" />
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
            <input type="hidden" runat="server" id="hiSupplyXml" />
        </td>
    </tr>
    <tr>
        <td class="td-m" colspan="6">编制人&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
            <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtDrawUserName" field="DrawUserName" tablename="MM_SupplyEntityInventoryForm"
                class="kpms-textbox" style="width: 130px" readonly="readonly" activestatus="(23.填写合格供方清单)(23.修改合格供方清单)" />
            <input type="hidden" id="hiDrawUserID" name="DrawUserID" runat="server" field="DrawUserID"
                tablename="MM_SupplyEntityInventoryForm" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiMMSupplyEntityInventoryID" field="MMSupplyEntityInventoryID"
    tablename="MM_SupplyEntityInventoryForm" />
<input type="hidden" runat="server" id="hiFormType" field="FormType"
    tablename="MM_SupplyEntityInventoryForm" />
<input type="hidden" runat="server" id="hiXml" />
<script type="text/javascript">
    function viewItem(id) {
        var param = { actionType: 1, bizID: id };
        var url = buildQueryUrl("/MM/List/CRM/SupplyEditor.aspx", param);
        showDivDialog(url, "", 800, 500, null);
        return false;
    }
</script>