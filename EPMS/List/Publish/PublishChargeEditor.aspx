<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PublishChargeEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.PublishChargeEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/EPMS/UI/Publish/PublishCostInfo.ascx" TagName="PublishCostInfo"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%" runat="server" id="Table1">
        <tr>
            <td class="td-l">
                出版编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtRecordNumber" runat="server" activestatus="(23.*)"
                    TableName="EPMS_PublishConsign" Field="RecordNumber" class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                计费日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtChargeDate" activestatus="(23.*)"
                    EnableTheming="false" class="kpms-textbox-date" readonly="readonly" field="ChargeDate"
                    tablename="EPMS_PublishWork" />
            </td>
             <td class="td-l">
                计费状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblChargeState" runat="server" activestatus="(23.*)" field="ChargeState"
                    tablename="EPMS_PublishWork" RepeatColumns="2" RepeatDirection="Horizontal" />
            </td>
        </tr>
        <tr id="trRele" runat="server" visible="false">
            <td class="td-l">
                合并收费的出版单
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtReleNum" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="RecordNumber"
                    ResultForControls="{'hiRelePublishConsignID':'PublishConsignID'}" EnableTheming="false"
                    SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ConsignInfoSelector.aspx" activestatus="(23.*)"
                    FilterFunction="wbsFilter()"></zhongsoft:LightObjectSelector>
                <input id="hiRelePublishConsignID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
                    field="RelePublishConsignID" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" ShowFooter="true" UseDefaultDataSource="true"
                    PageSize="10" AutoGenerateColumns="false" Width="100%" DataKeyNames="PublishWorkID"
                    OnRowCommand="gvList_RowCommand" EmptyDataText="没有费用项目信息" OnRowDataBound="gvList_RowDataBound"
                    BindGridViewMethod="BindGrid" ShowExport="true">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%#((GridViewRow)Container).DataItemIndex + 1 %>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightBoundField DataField="WorkTypeName" HeaderText="工种类型">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="费用信息">
                            <ItemTemplate>
                                <uc1:PublishCostInfo ID="PublishCostInfo1" runat="server" />
                                <table class="tz-table" width="100%" runat="server" id="Table1">
                                    <tr>
                                        <td class="td-l">
                                            其他费用（元)
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightTextBox ID="tbOtherSum" runat="server" Regex="^([1-9]\d{0,2}|[0])(\.\d{1,2})?$"
                                                errmsg="数量必须填写数字，最多3位整数，2位小数" MaxLength="6" CssClass="kpms-textbox-money" EnableTheming="false"
                                                Text='<%# DataBinder.Eval(Container.DataItem, "OtherSum") %>'>
                                            </zhongsoft:LightTextBox>
                                        </td>
                                         <td class="td-l">
                                            费用说明
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightTextBox runat="server" ID="tbChargeMemo" CssClass="kpms-textbox"
                                                EnableTheming="false" activestatus="(23.*)" maxtext="512"
                                                 Text='<%# DataBinder.Eval(Container.DataItem, "ChargeMemo") %>'>
                                            </zhongsoft:LightTextBox>
                                        </td>
                                    </tr>
                                 
                                </table>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <%-- 主键--%>
    <input id="hiPublishConsignID" type="hidden" tablename="EPMS_PublishConsign" field="PublishConsignID"
        runat="server" />
    <input id="hiChargeSum" type="hidden" tablename="EPMS_PublishConsign" field="ChargeSum"
        runat="server" />
    <input id="hiConsignTypeID" type="hidden" tablename="EPMS_PublishConsign" field="ConsignTypeID"
        runat="server" />
    <input id="hiOrganizationID" type="hidden" runat="server" tablename="EPMS_PublishConsign"
        field="OrganizationID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            $("#<%=gvList.ClientID %>").find("[id$=tbPrice]").live("blur", function () { total($(this)); });
            $("#<%=gvList.ClientID %>").find("[id$=tbAmount]").live("blur", function () { total($(this)); });
        }

        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();
            var consignID = $('#<%=hiConsignTypeID.ClientID %>').val();
            return { OrganizationID: orgId, ConsignTypeID: consignID, IsProcess: 1 };
        }
    </script>
</asp:Content>
