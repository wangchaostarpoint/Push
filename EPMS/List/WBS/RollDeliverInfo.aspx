<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="RollDeliverInfo.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.WBS.RollDeliverInfo"
    Title="图纸信息" MasterPageFile="~/UI/Master/ObjectList.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="lbtnSave" runat="server" EnableTheming="false" CssClass="subtoolbarlink"
            OnClientClick="return false;">
            <span>
                <img runat="server" id="img2" src="~/Themes/Images/btn_new.gif" alt="保存" height="16" />保存</span>
        </asp:LinkButton>
        <asp:LinkButton runat="server" ID="lbtnBatchModify" CssClass="subtoolbarlink" EnableTheming="false"
            ToolTip="批量修改卷册去向" OnClientClick="return showBatchModify('divBatchModify')">
            <span>
                <img id="img1" runat="server" src="~/Themes/Images/btn_editor.gif" alt="批量修改卷册去向"
                    width="16" height="16" />批量修改卷册去向</span>
        </asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="false"
        ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
        DataKeyNames="WBSID" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工程包" DataField="ProjectPackage" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" ItemStyle-Width="100px" ShowToolTip="true">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="阶段" DataField="PhaseName" ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" ItemStyle-Width="40px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="出版状态" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPublishState" Text='<%# Eval("PublishState")%>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否交付经营部" ItemStyle-Width="40px">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbISDeliverOperation" Text='<%# Eval("ISDeliverOperation")%>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="交付时间">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtFactDeliveryTime" runat="server"
                        readonly="readonly" Value='<%#(string.IsNullOrEmpty(Eval("FactDeliveryTime").ToString())) ? Eval("FactDeliveryTime") : Convert.ToDateTime(Eval("FactDeliveryTime")).ToString("yyyy-MM-dd") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="交付地址">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="tbDeliveryAddress" Width="100px"
                        MaxLength="128" Text='<%# Eval("DeliveryAddress") %>' CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
                    <input type="hidden" runat="server" id="hiWBSID" value='<%#Eval("WBSID") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <div id="divBatchModify" style="display: none" title="批量修改卷册去向">
        <table class="tz-table" width="100%">
            <tr>
                <td class="td-l">交付时间:
                </td>
                <td class="td-m">
                    <zhongsoft:XHtmlInputText runat="server" ID="txtFactDeliveryTime" class="kpms-textbox-date"
                        EnableTheming="false" readonly="readonly" />
                </td>
            </tr>
            <tr>
                <td class="td-l">交付地址:
                </td>
                <td class="td-m">
                    <zhongsoft:LightTextBox runat="server" ID="tbDeliveryAddress" CssClass="kpms-textarea"
                        EnableTheming="false" MaxLength="128" Rows="4" TextMode="MultiLine" />
                </td>
            </tr>
        </table>
    </div>
    <asp:Button runat="server" ID="btnSave" OnClick="btnSave_Click" Style="display: none" />
    <asp:LinkButton runat="server" ID="lbtBatchModify" OnClick="lbtBatchModify_Click" Style="display: none"></asp:LinkButton>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        function initCustomerPlugin() {
            $('#<%=lbtnSave.ClientID %>').bind('click', function () {
                saveDeliverInfo();
            });
            initModifyEvent('divBatchModify');
        }
        function saveDeliverInfo() {
            $('#<%=btnSave.ClientID %>').click();
        }

        //弹出批量修改层
        function showBatchModify(div) {
            var wbsIDs = $("#" + $gridCheckedClientID).val();
            if (wbsIDs.length < 3) {
                alert("请勾选任务信息");
                return false;
            }
            $("#" + div).dialog({ height: 240 });
            $("#" + div).dialog('open');
            $("#" + div).parent().appendTo("#<%=this.Page.Form.ClientID%>");
            return false;
        }

        function initModifyEvent(div) {
            $("#" + div + ":ui-dialog").dialog("destroy");
            $("#" + div).dialog({
                resizable: false,
                autoOpen: false,
                minHeight: 150,
                minWidth: 400,
                modal: true,
                buttons: {
                    "确定": function () {
                        <%=Page.ClientScript.GetPostBackEventReference(this.lbtBatchModify,"")%>;
                        $(this).dialog("close");
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }
            });
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
