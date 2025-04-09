<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SubToolBarNew.ascx.cs"
    Inherits="Zhongsoft.Portal.UI.Controls.SubToolBarNew" %>
<%@ Import Namespace="Zhongsoft.Portal.Custom" %>
<style>
    /*合同详细页面功能区保存、删除等按钮样式*/
    .function
    {
        padding-top: 4px;
        padding-bottom: 4px;
        padding-left: 20px;
    }
    /*功能区按钮外边div样式*/
    .function-btn
    {
        cursor: pointer;
        margin: 0px;
        display: inline-block;
        height: 25px;/*0107修改台帐新建弹出页面图片与文字显示在一行，将height:45px改为25*/
        text-align: center;
        padding-left: 5px;
        padding-right: 5px;
    }
    .function-btn span
    {
        display: inline-block;
        padding: 0px 2px 0px 2px;
        line-height: 16px !important;
        color: #666;
        font-family: "微软雅黑" !important;
    }
    .function-btn img
    {
        margin: 2px 0px 0px 0px;
    }
    a.function-btn:hover
    {
        background: #d5e1f2;
    }
    .divdll{border: #ccc 1px solid;}
    
    .droplist td
    {
        padding-left: 5px;
        padding-right: 5px;
        /*border: #ccc 1px solid;*/
        background: #f0f0f0;
        border:1px solid #f0f0f0;
    }
    .droplist td a:hover
    {
    	border:1px solid #5eb5c9;
    	background:#fafafa;
    	height:24px;
    	line-height:24px;
    }
    .btn-toolmenu2
    {
        height: 26px;
        line-height: 26px;
        text-align: left;
        color: #000;
    }
    
    .labelsyle
    {
        font-family: "微软雅黑";
        line-height: 15px;
    }
    </style>
    <style>
.btn-query[disabled='disabled']
{
  background:#efefef;
}
.btn-query[disabled='disabled'] span
{
  background:#efefef;
  color:Gray;
}

.btn-query[disabled='disabled']:hover
{
  background:#d3d3d3;
}
.btn-query[disabled='disabled']:hover span
{
  background:#d3d3d3;
}

.btn-query[disabled='disabled'] img
{
  background:#efefef;
}


.btn-query[disabled='disabled']:hover img
{
  background:#d3d3d3;
}
</style>

<asp:DataList runat="server" ID="dlListPage" RepeatDirection="Horizontal" OnItemDataBound="dlGroups_ItemDataBound">
    <ItemStyle />
    <ItemTemplate>
        <div id="divGroup" runat="server" visible="false" style=" height:23px; line-height:10px;">
            <asp:DataList runat="server" ID="dlButtons" RepeatDirection="Horizontal" OnItemDataBound="dlButtons_ItemDataBound"
                OnItemCommand="dlButtons_ItemCommand">
                <ItemStyle />
                <ItemTemplate>
                    <asp:LinkButton runat="server" CssClass="btn-query" EnableTheming="false" ID="btn"
                        Visible="false" ToolTip='<%#Eval("Label") %>'>
                        <img runat="server" id="img" alt='<%#Eval("Label") %>' width="16" height="16" visible="false" />
                        <span runat="server" id="span" visible="false"></span>
                    </asp:LinkButton>
                    <img runat="server" id="imgsinge" width="16" height="16" visible="false" />
                    <asp:Label runat="server" ID="labelsinge" Visible="false"></asp:Label>
                    <div id="divGroup" visible="false" runat="server" class="divCreate" style="position: relative;
                        z-index: 100">
                        <div>
                            <asp:LinkButton runat="server" CssClass="btn-query" EnableTheming="false" ID="btngroup"
                                Visible="false" OnClientClick="return false" ToolTip='<%#Eval("Label") %>'>
                                <img runat="server" id="imggroup" alt='<%#Eval("Label") %>' width="16" height="16"
                                    visible="false" />
                                <span runat="server" id="spangroup" visible="false"></span>
                            </asp:LinkButton></div>
                        <div class="divdll" style="display: none; position: absolute; top: 24px">
                            <asp:DataList runat="server" ID="dlButtons" RepeatDirection="Vertical" RepeatColumns="1"
                                OnItemCommand="dlButtons_ItemCommand" OnItemDataBound="dlButtons_ItemDataBound"
                                CellPadding="0" CellSpacing="0" CssClass="droplist">
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn-toolmenu2" EnableTheming="false" ID="btn"
                                        Width="100%" Visible="false" ToolTip='<%#Eval("Label") %>'>
                                        <img runat="server" id="img" alt='<%#Eval("Label") %>' width="16" height="16" visible="false" />
                                        <span runat="server" id="span" visible="false"></span>
                                    </asp:LinkButton>
                                    <img runat="server" id="imgsinge" width="16" height="16" visible="false" />
                                    <asp:Label runat="server" ID="labelsinge" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                    <div id="divButtons" visible="false" runat="server" class="divCreate" style="position: relative;
                        z-index: 100">
                        <div>
                            <asp:LinkButton runat="server" CssClass="btn-query" EnableTheming="false" ID="btnParent"
                                Visible="false" OnClientClick="return false" ToolTip='<%#Eval("Label") %>'>
                                <img runat="server" id="imgParent" alt='<%#Eval("Label") %>' width="16" height="16"
                                    visible="false" />
                                <span runat="server" id="spanParent" visible="false"></span>
                            </asp:LinkButton>
                            <img runat="server" id="imgg" width="16" height="16" visible="false" />
                            <asp:Label runat="server" ID="lbg" Visible="false"></asp:Label></div>
                        <div class="divdll" style="display: none; position: absolute; top: 24px">
                            <asp:DataList runat="server" ID="dlChildButtons" CssClass="droplist" RepeatDirection="Vertical"
                                RepeatColumns="1" OnItemCommand="dlButtons_ItemCommand" OnItemDataBound="dlButtons_ItemDataBound">
                                <ItemStyle Wrap="false" />
                                <ItemTemplate>
                                    <asp:LinkButton runat="server" CssClass="btn-toolmenu2 " EnableTheming="false" ID="btn"
                                        Width="100%" Visible="false" ToolTip='<%#Eval("Label") %>'>
                                        <img runat="server" id="img" alt='<%#Eval("Label") %>' width="16" height="16" visible="false" />
                                        <span runat="server" id="span" visible="false"></span>
                                    </asp:LinkButton>
                                    <img runat="server" id="imgsinge" width="16" height="16" visible="false" />
                                    <asp:Label runat="server" ID="labelsinge" Visible="false"></asp:Label>
                                </ItemTemplate>
                            </asp:DataList>
                        </div>
                    </div>
                </ItemTemplate>
            </asp:DataList>
        </div>
    </ItemTemplate>
</asp:DataList>
<asp:DataList runat="server" ID="dlEditorPage" RepeatDirection="Horizontal" OnItemDataBound="dlGroups_ItemDataBound">
    <ItemStyle BorderWidth="0" BorderColor="" />
    <ItemTemplate>
        <div runat="server" id="divGroup" visible="false">
            <table style="border-right: #d5d6d9 1px solid;">
                <tr>
                    <td>
                        <asp:DataList runat="server" ID="dlButtons" RepeatDirection="Horizontal" OnItemDataBound="dlButtons_ItemDataBound"
                            OnItemCommand="dlButtons_ItemCommand">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" EnableTheming="false" ID="btn" CssClass="function-btn"
                                    Visible="false" ToolTip='<%#Eval("Label") %>'>
                                    <img runat="server" id="img" alt='<%#Eval("Label") %>' visible="false" />
                                    <%--<br />--%><%-- 0107新建弹出页面要求操作的图片与文字在一行显示--%>
                                    <span runat="server" id="span" visible="false"></span>
                                </asp:LinkButton>
                                <img alt="" runat="server" id="imgsinge" visible="false" /> 
                                <asp:Label runat="server" ID="labelsinge" Visible="false"></asp:Label>
                                <div visible="false" id="divGroup" runat="server" class="divCreate" style="position: relative;">
                                    <asp:LinkButton runat="server" EnableTheming="false" ID="btngroup" CssClass="function-btn"
                                        Visible="false" OnClientClick="return false" ToolTip='<%#Eval("Label") %>'>
                                        <img runat="server" id="imggroup" alt='<%#Eval("Label") %>' width="22" height="22"
                                            visible="false" />
                                        <%--<br />--%><%-- 0107新建弹出页面要求操作的图片与文字在一行显示--%>
                                        <span runat="server" id="spangroup" visible="false"></span>
                                    </asp:LinkButton>
                                    <div class="divdll" style="display: none; position: absolute;">
                                        <asp:DataList runat="server" ID="dlButtons" RepeatDirection="Vertical" RepeatColumns="1"
                                            OnItemCommand="dlButtons_ItemCommand" OnItemDataBound="dlButtons_ItemDataBound">
                                            <ItemStyle Wrap="false" />
                                            <ItemTemplate>
                                                <asp:LinkButton runat="server" CssClass="function-btn" EnableTheming="false" ID="btn"
                                                    Visible="false" ToolTip='<%#Eval("Label") %>'>
                                                    <img runat="server" id="img" alt='<%#Eval("Label") %>' visible="false" />
                                                    <span runat="server" id="span" visible="false"></span>
                                                </asp:LinkButton>
                                                <img runat="server" id="imgsinge" visible="false" />
                                                <asp:Label runat="server" ID="labelsinge" Visible="false"></asp:Label>
                                            </ItemTemplate>
                                        </asp:DataList>
                                    </div>
                                </div>
                            </ItemTemplate>
                        </asp:DataList>
                    </td>
                </tr>
                <tr>
                    <td align="center" class="labelsyle">
                        <%#Eval("Label") %>
                    </td>
                </tr>
            </table>
        </div>
    </ItemTemplate>
</asp:DataList>
<input type="hidden" runat="server" id="hiScope" value="EditorPage" />
<input type="hidden" runat="server" id="hiDictId" />
<input type="hidden" runat="server" id="hiIframeRowIds" />
<input type="hidden" runat="server" id="hiIframeParam" />
<input type="hidden" runat="server" id="hiData" />
<script type="text/javascript">

    $(".divCreate").live({ mouseenter: function () {

        $(this).find(".divdll").show();
    },
        mouseleave: function () { $(this).find(".divdll").hide(); }
    });

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
        var $dlButtons = $("#<%=dlEditorPage.ClientID %>,#<%=dlListPage.ClientID %>");
        var $single = $dlButtons.find("[EnableScope='1']");
        var $hasSelect = $dlButtons.find("[EnableScope='2']");

        for (var i = 0; i < $single.length; i++) {//设置不可用时不调用脚本事件
            var btn = $single.eq(i);
            if (btn.attr("hasset") != "1") {
                btn.attr("onclick", "if($(this).attr('disabled')=='disabled') return false;" + btn.attr("onclick"));
                btn.attr("hasset", "1");
            }
        }

        for (var i = 0; i < $hasSelect.length; i++) {//设置不可用时不调用脚本事件
            var btn = $hasSelect.eq(i);
            if (btn.attr("hasset") != "1") {
                btn.attr("onclick", "if($(this).attr('disabled')=='disabled') return false;" + btn.attr("onclick"));
                btn.attr("hasset", "1");
            }
        }

        if (rowIds.length == 0) {
            $single.attr("disabled", "disabled");
            $hasSelect.attr("disabled", "disabled");          
        }
        else if (rowIds.length == 1) {
            $single.removeAttr("disabled");
            $hasSelect.removeAttr("disabled");
        }
        else {
            $single.attr("disabled", "disabled");
            $hasSelect.removeAttr("disabled");
        }

        //        if (rowIds.length == 0) {
        //            $single.closest('td').hide();
        //            $hasSelect.closest('td').hide();
        //        }
        //        else if (rowIds.length == 1) {
        //            $single.closest('td').show();
        //            $hasSelect.closest('td').show();
        //        }
        //        else {
        //            $single.closest('td').hide();
        //            $hasSelect.closest('td').show();
        //        }

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
                    bizId = rowIds[0]
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

        if (url.indexOf("@paramTransferFlag") >= 0) {
            setParamTransfer("<%=ParamTransferFlag%>", $("#<%=hiData.ClientID%>").val());
            url = url.replace("@paramTransferFlag", "<%=ParamTransferFlag%>");
        }

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
