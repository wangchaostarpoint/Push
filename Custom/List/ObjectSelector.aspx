<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="ObjectSelector.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ObjectSelector" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Import Namespace="Zhongsoft.Portal.Custom" %>
<%@ Import Namespace="Zhongsoft.Portal.BDM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <link href="/portal/Themes/Styles/objfilter.css" type="text/css" rel="Stylesheet" />
    <script src="/portal/UI/Script/customer.list.js" type="text/javascript"></script>
    <table>
        <tr>
            <td align="right" style="width: 260px" id="tdfilter">
                <div class="hide-filter" id="hide-filter" style="width: 260px;">
                    <%
                        try
                        {

                            System.Collections.Generic.List<FilterField> fields = this.BdRef.SelectFilterFields;
                            string filterName = string.Empty;
                            foreach (FilterField field in fields)
                            {
                                string fieldName = field.DispCode;
                                string fieldId = BDDataSetFactory.GetDataFieldByDispCode(field.DispCode);
                                if (field.Converter != null)
                                {
                                    filterName += fieldName + ";";
                                    ;
                                    List<Zhongsoft.Framework.KeyValue> items = field.Converter.GetConvertItems();
                    %><span class="filter-block"><span class="filter-block-lb"><%=field.Name%></span> <span>
                        <select style="width: 155px; margin: 3px 0px;" id="<%=fieldId%>" class="kpms-ddl"
                            name="<%=fieldName %>">
                            <%
                                    if (!string.IsNullOrEmpty(field.Converter.SelectTip))
                                    {
                            %>
                            <option value="">
                                <%=field.Converter.SelectTip%></option>
                            <%
                                                            }
                                                            foreach (Zhongsoft.Framework.KeyValue item in items)
                                                            {
                            %>
                            <option value="<%=item.Key%>">
                                <%=item.Value %></option>
                            <%
                                                            }
                            %>
                        </select></span></span>
                    <%
                                }
                                else if (Zhongsoft.Framework.SqlTypeHelper.IsSqlTypeString(field.Type))
                                {
                                    filterName += fieldName + ";";
                    %><span class="filter-block"><span class="filter-block-lb"><%=field.Name%></span> <span>
                        <input type='text' style="width: 152px" id="<%=fieldId %>" class="kpms-textbox" name="<%=fieldName %>" /></span></span>
                    <%}
                                else if (Zhongsoft.Framework.SqlTypeHelper.IsSqlTypeDateTime(field.Type))
                                {
                                    filterName += fieldName + ";";
                    %>
                    <span class="filter-block"><span class="filter-block-lb">
                        <%=field.Name%></span> <span>
                            <input type='text' readonly="readonly" class="kpms-textbox-date" id="<%=fieldId %>_start"
                                name="<%=fieldName %>_start" />
                            <input type='text' readonly="readonly" class="kpms-textbox-date" id="<%=fieldId %>_end"
                                name="<%=fieldName %>_end" />
                        </span></span>
                    <%}
                                else if (Zhongsoft.Framework.SqlTypeHelper.IsSqlTypeFigure(field.Type))
                                {
                                    filterName += fieldName + ";";
                    %>
                    <span class="filter-block"><span class="filter-block-lb">
                        <%=field.Name%></span> <span>
                            <input type='text' class="kpms-textbox" style="width: 70px; text-align: right" id="<%=fieldId %>_start"
                                regex="(^-?[1-9]\d*(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="<%=field.Name %>只能填写数字且最多保留两位小数"
                                name="<%=fieldName %>_start" />
                            <input type='text' class="kpms-textbox" style="width: 70px; text-align: right" id="<%=fieldId %>_end"
                                regex="(^-?[1-9]\d*(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" errmsg="<%=field.Name %>只能填写数字且最多保留两位小数"
                                name="<%=fieldName %>_end" />
                        </span></span>
                    <%}
                            }%>
                    <input type="hidden" name="hiFilterName" value="<%=filterName%>" /><%
                        }
                        catch (Exception ex)
                        {
                            Zhongsoft.Portal.BasePage bizPage = this.Page as Zhongsoft.Portal.BasePage;
                            bizPage.ShowAlertMessage(ex.Message);
                        }
                    %>
                </div>
            </td>
            <td id="showSearch" style="width: 16px; text-align: center; cursor: pointer;">
                <img src="../../Themes/Images/fleximages/ddn.png" />
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView BindJsonClick="true" ID="ReceiveFileList" AllowPaging="true"
        PageSize="10" runat="server" AutoGenerateColumns="false" UseDefaultDataSource="true"
        OnRowCommand="ReceiveFileList_RowCommand" ShowJsonRowColName="true" OnJsonClick="addObject"
        OnRowDataBound="ReceiveFileList_RowDataBound" JsonClickMode="onclick">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiFilterFlag" value="0" />
    <script>

        function initCustomerPlugin() {

            $("#hide-filter").css("top", $("#tdtoolBar").offset().top);
            var $filterFlag = $("#<%=hiFilterFlag.ClientID %>");
            buildFilter($filterFlag);
        }

        $("[content='resetResult']").live("click", function () {
            $("div#hide-filter input").each(function () {
                $(this).val("");
            })
            $("div#hide-filter select").each(function () {
                $(this).val("");
            })
            return true;
        })
    </script>
</asp:Content>
