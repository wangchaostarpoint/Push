<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="XChartPage.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XChartPage"
    ValidateRequest="false" %>

<%@ Import Namespace="Zhongsoft.Portal.Custom" %>
<%@ Import Namespace="Zhongsoft.Framework" %>
<%@ Import Namespace="Zhongsoft.Portal" %>
<%@ Import Namespace="Zhongsoft.Portal.BDM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <style>
        body
        {
            min-width: 300px !important;
        }
    </style>
    <% 
        //仪表板隐藏模板页工具条
        if (Request["ShowToolbar"] == "0")
        {
    %>
    <style>
        #trleader
        {
            display: none;
        }
        #divToolBtn
        {
            display: none;
        }
    </style>
    <%
        } //仪表板隐藏模板页工具条-end
    %>
    <table width="100%">
        <tr>
            <td align="right">
                <table width="280">
                    <tr>
                        <td align="right">
                            <div class="hide-filter" id="hide-filter" style="width: 260px; position: absolute;">
                                <%
                                    try
                                    {
                                        List<FilterField> fields = ChartView.SelectFilterFields;
                                        string filterName = string.Empty;
                                        foreach (FilterField field in fields)
                                        {

                                            string fieldName = field.DispCode;
                                            string fieldId = BDDataSetFactory.GetDataFieldByDispCode(field.DispCode);

                                            if (field.Converter != null)
                                            {
                                                filterName += fieldName + ";";
                                                ;
                                                List<KeyValue> items = field.Converter.GetConvertItems();
                                %><span class="filter-block"><span class="filter-block-lb"><%=field.Name%></span> <span>
                                    <select style="width: 152px; margin: 3px 0px;" id="<%=fieldId%>" class="kpms-ddl"
                                        name="<%=fieldName %>">
                                        <%
                                                if (!string.IsNullOrEmpty(field.Converter.SelectTip))
                                                {
                                        %>
                                        <option value="">
                                            <%=field.Converter.SelectTip%></option>
                                        <%
                                                }
                                                foreach (KeyValue item in items)
                                                {
                                        %>
                                        <option value="<%=item.Key%>">
                                            <%=item.Value%></option>
                                        <%
                                                }
                                        %>
                                    </select></span></span>
                                <%
                                            }
                                            else if (SqlTypeHelper.IsSqlTypeString(field.Type))
                                            {
                                                filterName += fieldName + ";";
                                %><span class="filter-block"><span class="filter-block-lb"><%=field.Name%></span> <span>
                                    <input type='text' style="width: 152px" id="<%=fieldId %>" class="kpms-textbox" name="<%=fieldName %>" /></span></span>
                                <%}
                                            else if (SqlTypeHelper.IsSqlTypeDateTime(field.Type))
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
                                            else if (SqlTypeHelper.IsSqlTypeFigure(field.Type))
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
                                        BasePage bizPage = this.Page as BasePage;
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
            </td>
            <td style="width: 140px;">
                <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click">
                      <span>查询</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="btnResrt" OnClick="btnReset_Click" content="resetResult">
                    <span>重置</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <input type="hidden" runat="server" id="hiFilterFlag" value="0" />
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:EChart runat="server" ID="echart" MainTitle="主标题" SubText="副标题" Width="850px"
        Theme="Dark" TitleXAlign="Center" TitleYAlign="Top" ToolboxXAlign="Right" ToolboxYAlign="Top"
        LegendXAlign="Right" LegendYAlign="Center" Height="400px" LegendOrient="Vertical"
        ClientClickFunction="sendDashboardParam">
    </zhongsoft:EChart>
    <input runat="server" id="hiActionDialogParam" type="hidden" />
    <input runat="server" id="hiActionDialogUrl" type="hidden" />
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
    <link href="../../Themes/Styles/custom.css" rel="stylesheet" type="text/css" />
    <link href="../../Themes/Styles/easyui.css" rel="stylesheet" type="text/css" />
    <link href="../../Themes/Styles/objectlist.css" rel="stylesheet" type="text/css" />
    <link href="../../Themes/Styles/objfilter.css" rel="stylesheet" type="text/css" />
    <script src="../../UI/Script/customer.list.js" type="text/javascript"></script>
    <script>
        //调用仪表板web部件联动函数
        function sendDashboardParam(seriesName, category, value) {
            if (parseBool('<%=Request["IsDashboardTrigger"] %>')) {
                window.parent.setChartWebPartParam(self.frameElement.id, seriesName, category, value);
            }
            var url = $("#<%=hiActionDialogUrl.ClientID %>").val();

            if (url != "") {
                var param = $("#<%=hiActionDialogParam.ClientID %>").val();
                url = buildQueryUrl(url, null);

                var rule = param;
                var regex = /ChartParams!\w+.Value/g;
                var matchs = rule.match(regex);
                for (var i = 0; i < matchs.length; i++) {
                    var key = matchs[i].replace("ChartParams!", "").replace(".Value", "");
                    var paramValue = "";
                    switch (key) {
                        case "SeriesName":
                            paramValue = encodeURI(seriesName);
                            break;
                        case "Category":
                            paramValue = encodeURI(category);
                            break;
                        case "Value":
                            paramValue = value;
                            break;
                    }
                    rule = rule.replace("'+", "").replace("+'", "");
                    rule = rule.replace("'", "");
                    rule = rule.replace(matchs[i], paramValue);
                }
                window.open(url + rule);
            }
        }
        //重置按钮清空过滤条件
        $("[content='resetResult']").live("click", function () {
            $("div#hide-filter input").each(function () {
                $(this).val("");
            })
            $("div#hide-filter select").each(function () {
                $(this).val("");
            })
            return true;
        })
        function initCustomerPlugin() {
            var filterFlag = $("#<%=hiFilterFlag.ClientID %>");
            buildMenu();
            buildFilter(filterFlag);
        }
    </script>
</asp:Content>
