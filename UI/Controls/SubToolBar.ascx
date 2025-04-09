<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubToolBar.ascx.cs"
    Inherits="Zhongsoft.Portal.UI.Controls.SubToolBar" %>
<%@ Import Namespace="Zhongsoft.Portal.Custom" %>
<asp:DataList runat="server" ID="dlButtons" RepeatDirection="Horizontal" OnItemDataBound="dlButtons_ItemDataBound">
    <ItemTemplate>
        <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btn"
            CommandName='<%#Eval("Command") %>' ToolTip='<%#Eval("Label") %>'>
            <span>
                <img runat="server" id="img" alt='<%#Eval("Label") %>' width="16" height="16" /><%#Eval("Label") %></span>
        </asp:LinkButton>
    </ItemTemplate>
</asp:DataList>
<input type="hidden" runat="server" id="hiScope" value="EditorPage" />
<input type="hidden" runat="server" id="hiDictId" />
<input type="hidden" runat="server" id="hiIframeRowIds" />
<input type="hidden" runat="server" id="hiIframeParam" />
<style>
.subtoolbarlink[disabled='disabled']
{
  color : Gray;	
}
.subtoolbarlink[disabled='disabled']:hover
{
  background:#d3d3d3;
}
.subtoolbarlink[disabled='disabled']:hover span
{
  background:#d3d3d3;
}
</style>
<script type="text/javascript">
    //工具条类型
    var $toolBarScope = "<%=Scope %>";
    var $listScope = "<%=ActionScope.ListPage %>";
    var $editorScope = "<%=ActionScope.EditorPage %>";

    function getGirdParam(rowIds, param) {
        if (rowIds != null) {
            $("#<%=hiIframeRowIds.ClientID%>").val(JSON.stringify(rowIds));

        }
        if (param != null) {
            $("#<%=hiIframeParam.ClientID%>").val(JSON.stringify(param));
        }
        if (typeof (customSetEnableScope) == "function") {
            customSetEnableScope(rowIds);
        }
        else {
            setEnableScope();
        }
        return false;
    }
    function setEnableScope() {
        var ids = $("#<%=hiIframeRowIds.ClientID%>").val();
        var rowIds = new Array();
        if (ids != "") {
            rowIds = jQuery.parseJSON(ids);
        }
        var $dlButtons = $("#<%=dlButtons.ClientID %>");
        var $single = $dlButtons.find("[EnableScope='1']");
        var $hasSelect = $dlButtons.find("[EnableScope='2']");
        for (var i = 0; i < $single.length; i++) {//设置不可用时不调用脚本事件
            var btn = $single.eq(i);
            if (btn.attr("hasset") != "1") {
                //Todo
                //btn.attr("onclick", "if($(this).attr('disabled')=='disabled') return false;" + btn.attr("onclick"));
                btn.attr("hasset", "1");
            }
        }

        for (var i = 0; i < $hasSelect.length; i++) {//设置不可用时不调用脚本事件
            var btn = $hasSelect.eq(i);
            if (btn.attr("hasset") != "1") {
                //Todo
                //btn.attr("onclick", "if($(this).attr('disabled')=='disabled') return false;" + btn.attr("onclick"));
                btn.attr("hasset", "1");
            }
        }

        if (rowIds.length == 0) {
            $single.attr("disabled", "disabled");
            $hasSelect.attr("disabled", "disabled");
            // $single.hide();
            // $hasSelect.hide();
        }
        else if (rowIds.length == 1) {
            $single.removeAttr("disabled");
            $hasSelect.removeAttr("disabled");
            //  $single.show('slide');
            //  $hasSelect.show('slide');
        }
        else {
            $single.attr("disabled", "disabled");

            $hasSelect.removeAttr("disabled");
            //  $single.hide();
            // $hasSelect.show('slide');
        }
    }


    function openDialog(url, actionType, param, isModal, width, height, sysAction, pageId) {
        var ids = $("#<%=hiIframeRowIds.ClientID%>").val();
        var otherparam = $("#<%=hiIframeParam.ClientID%>").val();
        var bizId = "";
        if (url.indexOf('?') < 0) {
            url += "?";
        }
        var isSys = parseBool(sysAction);
        if ($toolBarScope == $listScope) {
            if (actionType == "2") {
                url += "actionType=" + actionType;
            }
            else if (ids != "" && actionType != "2") {
                var rowIds = jQuery.parseJSON(ids);
                if (rowIds.length > 0) {
                    bizId = rowIds[0];
                    if (isSys) {
                        if (actionType != "") {
                            url += "actionType=" + actionType;
                        }
                        url += "&bizId=" + bizId;
                    }
                }
            }
            else if (actionType != "" && isSys) {
                url += "actionType=" + actionType;
            }
        }
        else if ($toolBarScope == $editorScope) {
            bizId = '<%=Request["bizId"] %>';
        }

        if (isSys && typeof (beforeDialog) == "function") {
            return beforeDialog(actionType, bizId);
        }

        if (param != "") {
            url += param;
        }
        if (pageId != "") {
            url += "&secid=" + pageId;
        }
        url = url.replace("@bizId", bizId);
        if (otherparam != "") {
            var otherPs = jQuery.parseJSON(otherparam);
            for (var key in otherPs) {
                url += "&" + key + "=" + otherPs[key];
            }
        }
        if (parseBool(isModal)) {
            if ($toolBarScope == $listScope) {
                showDivDialog(encodeURI(url), "", width, height, rebindGridData);
            }
            else {
                showDivDialog(encodeURI(url), "", width, height, null);
            }
            //            if (checkReturn(showModal(encodeURI(url), "", width, height))) {
            //                if ($toolBarScope == $listScope) {
            //                    if (typeof (rebindGridData) == "function") {
            //                        rebindGridData();
            //                    }
            //                }
            //            }
        }
        else {
            if (window.open(encodeURI(url), "") != undefined) {
                if ($toolBarScope == $listScope) {
                    if (typeof (rebindGridData) == "function") {
                        rebindGridData();
                    }
                }
            }
        }
        return false;
    }
</script>
