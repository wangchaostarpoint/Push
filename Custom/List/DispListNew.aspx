<%@ Page Language="C#" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master"
    AutoEventWireup="true" CodeBehind="DispListNew.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DispListNew" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Import Namespace="Zhongsoft.Portal.BDM" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
<style>
html{ overflow:hidden;}
</style>
    <zhongsoft:LightPowerGridView AllowSorting="true" ShowPageSizeChange="true" UseAjaxMode="False"
        OnPageSizeChanged="gvList_Changed" AllowPaging="true" ID="LightPowerGridView"
        ShowExport="true" runat="server" OnRowCommand="GridViewTemplate_OnRowCommand"
        OnRowDataBound="GridViewTemplate_RowDataBound" BindGridViewMethod="BindDataGrid">
        <Columns>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <zhongsoft:TreeGridView AllowSorting="true" ShowPageSizeChange="true" UseAjaxMode="False"
        OnPageSizeChanged="gvList_Changed" AllowPaging="true" ID="TreeGridView" ShowExport="true"
        runat="server" OnRowCommand="GridViewTemplate_OnRowCommand" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="GridViewTemplate_RowDataBound">
        <Columns>
        </Columns>
    </zhongsoft:TreeGridView>
    <asp:Panel runat="server" ID="pnDescription">
    </asp:Panel>
    <script>
        $gridCheckedClientID = "<%=this.GridViewList.CheckedClientID %>";
        function openCustomerDialog(actionType, bizId, url, mode, width, height, param) {
            if (param != "") {
                if (url.indexOf('?') == -1) {
                    url += "?";
                }
                url = url + "&" + param;
            }
            var url = buildBizUrl(actionType, bizId, url, null);
            switch (actionType) {
                case "1":
                    if (mode == "Modal") {
                        showModal(encodeURI(url), "", width, height);
                    }
                    else if (mode == "Dialog") {
                        showDivDialog(encodeURI(url), null, width, height, rebindGridData);
                    }
                    else {
                        window.open(encodeURI(url), "");
                    }
                    break;
                case "3":
                case "2":
                    if (mode == "Modal") {
                        if (checkReturn(showModal(encodeURI(url), "", width, height))) {
                            if (typeof (rebindGridData) == "function") {
                                rebindGridData();
                            }
                        }
                    }
                    else if (mode == "Dialog") {
                        showDivDialog(encodeURI(url), null, width, height, rebindGridData);
                    }
                    else {
                        if (checkReturn(window.open(encodeURI(url), ""))) {
                            if (typeof (rebindGridData) == "function") {
                                rebindGridData();
                            }
                        }
                    }
                    break;
            }
            return false;
        }
        function openActionDialog(url, mode, param, pageid, width, height) {
            if (url != "") {
                url = buildQueryUrl(url, null);
            }
            else if (pageid != "") {
                var paramJson = getPageIdUrlJson(pageid);
                if (paramJson != null && paramJson) {
                    url = buildQueryUrl(paramJson.Url, { secid: paramJson.SecId });
                }
            }
            if (url == "") {
                return false;
            }
            if (param != "") {
                if (url.indexOf('?') == -1) {
                    url += "?";
                }
                url = url + "&" + param;
            }
            if (mode == "Modal") {
                return checkReturn(showModal(encodeURI(url), "", width, height));
            }
            else if (mode == "Iframe" || mode == "Dialog") {
                showDivDialog(encodeURI(url), null, width, height, rebindGridData);
            }
            else {
                window.open(encodeURI(url), "");
            }
            return false;
        }

     
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
