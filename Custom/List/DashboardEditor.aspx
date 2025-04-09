<%@ Page Title="仪表板设置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="DashboardEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.DashboardEditor" %>

<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton ID="btnSave" runat="server" EnableTheming="false" OnClientClick="btnSave(0);return false;"
            DisplayStatus="(23.*)" CssClass="subtoolbarlink">
            <span><img src="../../Themes/Images/btn_save.gif" height="16" width="16" />保存</span></asp:LinkButton>
        <asp:LinkButton ID="btnClose" runat="server" EnableTheming="false" OnClientClick="window.close();return false;"
            CssClass="subtoolbarlink">
            <span><img src="../../Themes/Images/btn_close.gif" height="16" width="16" />关闭</span></asp:LinkButton></div>
    <div class="subtoolbarbg" id="divView">
        <asp:LinkButton ID="btnTemplate" runat="server" EnableTheming="false" OnClientClick="return setTemplate();"
            CssClass="subtoolbarlink">
                    <span>布局</span></asp:LinkButton>
        <asp:LinkButton ID="btnView" runat="server" EnableTheming="false" OnClientClick="btnSave(1);return false;"
            OnClick="btnView_Click" CssClass="subtoolbarlink">
                     <span><img src="../../Themes/Images//btn_finish.gif" height="16" width="16" />完成</span></asp:LinkButton>
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
    <link href="../UI/Impromptu.css" rel="Stylesheet" type="text/css" />
    <script src="../UI/Script/xform.js"></script>
    <script src="../UI/Script/jquery-impromptu.4.0.js"></script>
    <link href="../UI/dashboard.css" rel="Stylesheet" type="text/css" />
    <table class="tz-table">
        <tr>
            <td class="td-l">
                名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbName" field="ViewName" tablename="BD_View"
                    MaxLength="50" req="1" Width="250px"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiListCode" />
                <zhongsoft:LightTextBox runat="server" ID="tbCodePrefix" Width="120px" ReadOnly="true"
                    req="1"></zhongsoft:LightTextBox>
                <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="120px" DataType="EnNumStr"
                    MaxLength="20" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                公用<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList ID="rblIsPublic" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal"
                    field="IsPublic" tablename="BD_View">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                默认视图<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList ID="rblIsDefault" runat="server" RepeatDirection="Horizontal"
                    field="IsDefaultView" tablename="BD_View">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <table width="100%">
        <tr>
            <td valign="top" align="center" style="width: 80%;">
                显示部件
            </td>
            <td valign="top" align="center" style="width: 20%;">
                备选部件
            </td>
        </tr>
    </table>
    <div style="width: 100%">
        <div id="canvas" style="background: #fff; margin: 0 auto; width: 80%; border: #bfc2c9 1px solid;
            z-index: 1; float: left;">
        </div>
        <div id="containDiv" class="containDiv" style="background: #fff; margin-left: 2px;
            min-height: 400px; width: 18%; border: #bfc2c9 1px solid; z-index: 1; float: left;">
            <div class="topDiv" flag="topDiv">
                <a class="topA"><span>添加部件</span></a>
            </div>
        </div>
    </div>
    <table width="98%" class="tableRelation">
        <tr>
            <td style="width: 120px">
                <asp:LinkButton runat="server" ID="btnAddRelation" OnClientClick="return addRelation();"><span>添加部件关联</span></asp:LinkButton>
            </td>
            <td>
                <div id="relation" style="background: #fff; min-height: 30px; width: 100%; border: #b6b5b5 1px solid;
                    white-space: nowrap; z-index: 1">
                </div>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiEmptyXml" />
    <input type="hidden" runat="server" id="hiXml" field="Expression" tablename="BD_VIEW" />
    <input type="hidden" runat="server" id="hiFlag" />
    <input type="hidden" runat="server" id="hiSelectTemplate" />
    <div id="formSuccess" style="display: none" class="form-save">
        <span>保存成功！</span>
    </div>
    <script>
        function initCustomerPlugin() {
            if ($("#<%=hiFlag.ClientID %>").val() == "0" && parseBool("<%=IsBaseView%>")) {
                $("#<%=btnView.ClientID %>").hide();
                $("#<%=btnTemplate.ClientID %>").show();
            }
            else {
                $("#<%=btnView.ClientID %>").show();
                $("#<%=btnTemplate.ClientID %>").hide();
            }

            $('#templateTabs').tabs();
            var xml = $("#<%=hiXml.ClientID %>").val();
            if (xml != "") {
                var view = new dashboardView();
                view.xmlDoc.loadXML(xml);
                $("#canvas").html($(view.xmlDoc.selectSingleNode("//Html")).text());
                $("#relation").html($(view.xmlDoc.selectSingleNode("//RelationHtml")).text());
                $("#containDiv").html($(view.xmlDoc.selectSingleNode("//ContainHtml")).text());
            }
            setSortable();
        }

        $(document).ready(function () {
            if (!parseBool("<%=IsPostBack %>") && "<%=ActionType %>" == "Create" && parseBool("<%=IsBaseView%>")) {
                $("#canvas").html($("#<%=hiSelectTemplate.ClientID %>").val());
                setSortable();
            }
        })

        function setSortable() {
            $(".connectDiv,.containDiv").sortable({
                start: function (event, ui) { $(".del").remove(); $(".acl").remove(); ui.item.css("width", "180px"); },
                items: "div:not(.topDiv)",
                connectWith: ".connectDiv,.containDiv",
                placeholder: "placeholder",
                cursorAt: { left: 10 },
                stop: function (event, ui) {
                    var $delElement = $('<a class="del"><span title="删除"></span></a>');
                    var $aclElement = $('<a class="acl"><span title="权限"></span></a>');
                    var p = $(ui.item).offset();
                    var x = p.left;
                    var y = p.top - 20;
                    if (y > 0) {
                        $('body').append($delElement);
                        $delElement.css({ left: x + $(ui.item).width() - 24, top: y });
                        $('body').append($aclElement);
                        $aclElement.css({ left: x + $(ui.item).width() - 50, top: y });
                    }
                }
            })
        }

        function showSaveMsg(message, i) {
            if (i == "0") {
                $('#formSuccess').css('background', '#ffe156');
            }
            else {
                $('#formSuccess').css({ background: '#e94545', color: '#fff' });
            }
            $('#formSuccess').css({ left: ($(window).width() - $('#formSuccess').width()) / 2 });
            $('#formSuccess span').html(message);
            $('#formSuccess').animate({ opacity: 'show' }, 500).animate({ opacity: 1 }, 700).animate({ opacity: 'hide' }, 500);
        }

        $(".editor-right").scroll(function () {
            if ($('.del').length > 0) {
                var p = $("[IsSelect='1']").offset();
                var x = p.left;
                var y = p.top - 20;
                if (y > 0) {
                    $('.del').css({ left: x + $("[IsSelect='1']") - 24, top: y });
                    $('.acl').css({ left: x + $("[IsSelect='1']") - 50, top: y });
                }
            }
        });

        function addRelation() {
            var json = { DashboardId: "<%=BusinessObjectId %>" };
            var url = buildBizUrl(2, "", "Custom/List/DashboardRelationEditor.aspx", json);
            var re = showModal(encodeURI(url), null, 600, 300);
            if (re != undefined) {
                $("#relation").append(buildRelation(re, false));
                saveDashboard();
            }
            return false
        }

        function buildRelation(jsonStr, select) {
            var json = jQuery.parseJSON(jsonStr);
            var cs = "relationDiv";
            if (select) {
                cs = "selectRelationDiv";
            }
            var $relation = $("<div flag='relationDiv' class='" + cs + "' relationid='" + json["RelationId"] + "' triggerid='" + json["TriggerId"] +
                              "' targetid='" + json["TargetId"] + "' paramrule=\"" + json["ParamRule"] + "\">"
                               + "<table><tr><td>" + json["TriggerName"] + "-->" + json["TargetName"] + "</td></tr></table></div>");
            return $relation
        }

        $("[flag='relationDiv']").live("mousedown", function (e) {
            $(".selectCtrlDiv").removeClass("selectCtrlDiv").addClass("ctrlDiv").removeAttr('IsSelect');
            $(".selectRelationDiv").removeClass("selectRelationDiv").addClass("relationDiv").removeAttr('IsSelect');
            $(this).removeClass("relationDiv").addClass("selectRelationDiv").attr('IsSelect', '1');
            $(".acl").remove();
            addDel(e);
        });

        function addAcl(e) {
            $(".acl").remove();
            if ($(e.target).closest('div').html() != null) {
                var $aclElement = $('<a class="acl"><span title="权限"></span></a>');
                var p = $(e.target).closest('div').offset();
                var x = p.left;
                var y = p.top - 20;
                if (y > 0) {
                    $('body').append($aclElement);
                    $aclElement.css({ left: x + $(e.target).closest('div').width() - 50, top: y });
                }
            }
        }

        $(".acl").live("click", function () {
            var webpartid = $("[IsSelect='1']").attr("webpartid");
            var webpartname = $("[IsSelect='1']").attr("webpartname");
            var url = buildQueryUrl("sys/Acl/AclMgr.aspx", { secObjId: webpartid, secObjName: encodeURI(webpartname), ObjSecurityType: "<%=ObjectSecurityType.WebPart %>" });
            showModal(url, null, 980, 590);
        })

        function addDel(e) {
            $(".del").remove();
            if ($(e.target).closest('div').html() != null) {
                var $delElement = $('<a class="del"><span title="删除"></span></a>');
                var p = $(e.target).closest('div').offset();
                var x = p.left;
                var y = p.top - 20;
                if (y > 0) {
                    $('body').append($delElement);
                    $delElement.css({ left: x + $(e.target).closest('div').width() - 24, top: y });
                }
            }
        }

        $(".del").live("click", function () {
            if (confirm("确定删除？")) {
                var webpartid = $("[IsSelect='1']").attr("webpartid");
                if (webpartid != undefined) {
                    $.post("DashboardEditor.aspx",
                    {
                        asyfunc: "DeleteAcl", objectid: webpartid
                    },
                    function (res) {
                        if (res != "") {
                            showSaveMsg(res, "1");
                        }
                        else {
                            $("[IsSelect='1']").remove();
                            $(".acl").remove();
                            $(".del").remove();
                            saveDashboard(false);
                        }
                    })
                }
                else {
                    $("[IsSelect='1']").remove();
                    $(".acl").remove();
                    $(".del").remove();
                    saveDashboard(false);
                }
            }
        })

        $("[flag='relationDiv']").live("dblclick", function () {
            var url = buildBizUrl(3, $(this).attr("relationid"), "Custom/list/DashboardRelationEditor.aspx", { DashboardId: "<%=BusinessObjectId %>" });
            var re = showModal(url, null, 600, 300);
            if (re != null) {
                var $relation = buildRelation(re, true); ;
                $(this).replaceWith($relation);
                saveDashboard();
            }
            return false;
        });

        function setTemplate() {
            var tempurl = buildQueryUrl("Custom/List/DashboardTemplate.aspx", { IsChange: "1" });
            var re = showModal(tempurl, "", 800, 500);
            if (re != null) {
                $("#canvas").html(re);
            }
            return false;
        }

        function buildCtrl(jsonStr, select) {
            var json = jQuery.parseJSON(jsonStr);
            var $ctrl;
            var cs = "ctrlDiv";
            if (select) {
                cs = "selectCtrlDiv";
            }
            $ctrl = $("<div flag='ctrlDiv' class='" + cs + "' webpartid='" + json["WebPartId"] + "' key='" + json["Key"] + "' webpartname='"
                                 + json["WebPartName"] + "' listname='" + json["ListName"] + "' listid='" + json["ListId"] + "' loadmode='" + json["LoadMode"]+ "' openmode='" + json["OpenMode"]
                                 + "' url='" + json["Url"] + "' type='" + json["Type"] + "' title='双击编辑部件' titlename='" + json["Title"]
                                 + "' showtitle='" + json["ShowTitle"] + "' showtoolbar='" + json["ShowToolbar"] + "' ispublic='" + json["IsPublic"]
                                 + "' param=\"" + json["Param"] + "\" icon='" + json["Icon"] + "' height='" + json["Height"] + "' width='" + json["Width"]
                                 + "' viewId='" + json["ViewId"] + "' showtabtitle='" + json["ShowTabTitle"] + "' tabicon='" + json["TabIcon"]
                                 + "' memo='" + json["Memo"] + "'><table width='100%'><tbody><tr >"
                                 + "<td style='border:none;height: 24px;text-align:center'>" + json["WebPartName"] + "</td></tr><tr class='trHide'>"
                                 + "<td style='border:none;height: 24px;text-align:center'>" + json["Url"] + "</td></tr><tr class='trHide'>"
                                 + "<td style='border:none;height: 24px'></td></tr><tr class='trHide'>"
                                 + "<td style='border:none;height: 24px'></td></tr></tbody></table></div>");
            return $ctrl;
        }

        var $thisTopDiv;
        $("[flag='topDiv']").live("click", function () {
            $thisTopDiv=$(this);
            var url = buildBizUrl(2, "", "Custom/list/DashboardCtrlEditor.aspx", { DashboardId: "<%=BusinessObjectId %>" });            
            showDivDialog(url, null, 700, 500,callTopback);
            return false;
        });

        function callTopback(re){
            if (re != null) {
                var $ctrl = buildCtrl(re, false); ;
                $thisTopDiv.parent("div").append($ctrl);
                saveDashboard();
            }
            return false;
        }


        $("[flag='ctrlDiv']").live("mousedown", function (e) {
            $(".selectCtrlDiv").removeClass("selectCtrlDiv").addClass("ctrlDiv").removeAttr('IsSelect');
            $(".selectRelationDiv").removeClass("selectRelationDiv").addClass("relationDiv").removeAttr('IsSelect');
            $(this).removeClass("ctrlDiv").addClass("selectCtrlDiv").attr('IsSelect', '1');
            addAcl(e);
            addDel(e);
        });

        var $thisDiv;
        $("[flag='ctrlDiv']").live("dblclick", function () {
            $thisDiv=$(this);
            var url = buildBizUrl(3, $(this).attr("webpartid"), "Custom/list/DashboardCtrlEditor.aspx", { DashboardId: "<%=BusinessObjectId %>" });
            showDivDialog(url, null, 700, 500,callback);
            return false;
        });
                
        function callback(re){
            if (re != null) {
                var $ctrl = buildCtrl(re, true); ;
                $thisDiv.replaceWith($ctrl);
                saveDashboard();
            }
        }

        $(document).keydown(function (event) {
            if (event.keyCode == 46) {
                var el = window.event.srcElement;
                if ($("[IsSelect='1']").length > 0 && el.tagName != "INPUT") {
                    if (confirm("确定删除？")) {
                        $("[IsSelect='1']").remove();
                        $(".del").remove();
                        $(".acl").remove();
                    }
                }
            }
        });

        function btnSave(transfer) {
            if (!checkReqField()) {
                return false;
            }
            saveDashboard(transfer);
        }

        //transfer为true则跳转页面到预览页面
        function saveDashboard(transfer) {
            $('.del').remove();
            $('.acl').remove();

            var emptyXml = $("#<%=hiEmptyXml.ClientID %>").val();

            var view = new dashboardView();
            view.xmlDoc.loadXML(emptyXml);
            var code = $("#<%=tbCodePrefix.ClientID%>").val() + $("#<%=tbCode.ClientID%>").val();
            var name = $("#<%=tbName.ClientID%>").val();
            $(".selectCtrlDiv").removeClass("selectCtrlDiv").addClass("ctrlDiv").removeAttr('IsSelect');
            $(".selectRelationDiv").removeClass("selectRelationDiv").addClass("relationDiv").removeAttr('IsSelect');
            $(view.xmlDoc.selectSingleNode("//Html")).text($("#canvas").html());
            $(view.xmlDoc.selectSingleNode("//ListId")).text("<%=ListId %>");
            $(view.xmlDoc.selectSingleNode("//ViewId")).text("<%=BusinessObjectId %>");
            $(view.xmlDoc.selectSingleNode("//ViewName")).text(name);
            $(view.xmlDoc.selectSingleNode("//RelationHtml")).text($("#relation").html());
            $(view.xmlDoc.selectSingleNode("//ContainHtml")).text($("#containDiv").html());
            var $template = $("#canvas").find("table");
            view.createTemplate($template);

            var ctrls = $("#canvas  [flag = 'ctrlDiv']");
            for (var i = 0; i < ctrls.length; i++) {
                view.createCtrl(ctrls.eq(i), true);
            }

            var noselctrls = $(".containDiv [flag = 'ctrlDiv']");
            for (var i = 0; i < noselctrls.length; i++) {
                view.createCtrl(noselctrls.eq(i), false);
            }

            var relations = $("[flag = 'relationDiv']");
            for (var i = 0; i < relations.length; i++) {
                view.createRelation(relations.eq(i));
            }

            $.post("DashboardEditor.aspx",
                    { asyfunc: "SaveDashboard", isbaseview: "<%=IsBaseView %>", listId: "<%=ListId%>", viewid: "<%=BusinessObjectId %>",
                        listcode: code, listname: name, xml: view.xmlDoc.xml(),
                        ispublic: $("#<%=rblIsPublic.ClientID %>").find(":checked").val(), isdefaultview: $("#<%=rblIsDefault.ClientID %>").find(":checked").val()
                    },
                    function (res) {
                        if (res != "") {
                            showSaveMsg(res, "1");
                        }
                        else {

                            $("#<%=btnView.ClientID %>").show();
                            $("#<%=btnTemplate.ClientID %>").hide();
                            parent.returnValue = "isSave";
                            if (transfer == 1) {
                                  <%=Page.GetPostBackEventReference(this.btnView,"") %>;
                            }
                            else {
                                showSaveMsg("保存成功", "0");
                            }
                        }
                    })
        }

        function dashboardView() {
            this.xmlDoc = new KPMSXml();
        }

        dashboardView.prototype.createRelation = function (ctrl) {
            var relations = this.xmlDoc.selectSingleNode("//Relations");
            var node = this.xmlDoc.createElement("WebPartRelation");

            var relationid = this.xmlDoc.createElement("RelationId");
            $(relationid).text(ctrl.attr("relationid"));
            node.appendChild(relationid);

            var triggerid = this.xmlDoc.createElement("TriggerId");
            $(triggerid).text(ctrl.attr("triggerid"));
            node.appendChild(triggerid);

            var targetid = this.xmlDoc.createElement("TargetId");
            $(targetid).text(ctrl.attr("targetid"));
            node.appendChild(targetid);

            var paramrule = this.xmlDoc.createElement("ParamRule");
            $(paramrule).text(ctrl.attr("paramrule"));
            node.appendChild(paramrule);

            relations.appendChild(node);
        }

        dashboardView.prototype.createCtrl = function (ctrl, inTemplate) {
            var ctrls = this.xmlDoc.selectSingleNode("//WebParts");

            var node = this.xmlDoc.createElement("WebPart");

            var isIntemplate = this.xmlDoc.createElement("InTemplate");
            $(isIntemplate).text(inTemplate ? "1" : "0");
            node.appendChild(isIntemplate);

            var trpos = this.xmlDoc.createElement("Trpos");
            var tdpos = this.xmlDoc.createElement("Tdpos");

            $(trpos).text(ctrl.closest("tr").index());
            $(tdpos).text(ctrl.closest("td").index());

            node.appendChild(trpos);
            node.appendChild(tdpos);

            var type = ctrl.attr("type");
            var typenode = this.xmlDoc.createElement("Type");
            $(typenode).text(type);
            
            var loadmode = ctrl.attr("loadmode");
            if (loadmode != undefined && loadmode != "undefined"&& loadmode != "") {
                var loadmodeNode = this.xmlDoc.createElement("LoadMode");
                $(loadmodeNode).text(loadmode);
                node.appendChild(loadmodeNode);
            }

            var openmode = ctrl.attr("openmode");
            if (openmode != undefined && openmode != "undefined"&& openmode != "") {
                var openmodeNode = this.xmlDoc.createElement("OpenMode");
                $(openmodeNode).text(openmode);
                node.appendChild(openmodeNode);
            }

            var webpartId = this.xmlDoc.createElement("WebPartId");
            $(webpartId).text(ctrl.attr("webpartid"));

            var webpartName = this.xmlDoc.createElement("WebPartName");
            $(webpartName).text(ctrl.attr("webpartname"));

            var param = this.xmlDoc.createElement("Param");
            $(param).text(ctrl.attr("param"));


            var height = this.xmlDoc.createElement("Height");
            $(height).text(ctrl.attr("height"));

            var width = this.xmlDoc.createElement("Width");
            $(width).text(ctrl.attr("width"));

            var key = this.xmlDoc.createElement("Key");
            $(key).text(ctrl.attr("key"));

            node.appendChild(typenode);
            node.appendChild(webpartId);
            node.appendChild(webpartName);
            node.appendChild(param);

            node.appendChild(height);
            node.appendChild(width);
            node.appendChild(key);

            if (ctrl.attr("listId") != "") {
                var listId = this.xmlDoc.createElement("ListId");
                $(listId).text(ctrl.attr("listId"));
                node.appendChild(listId);
            }

            if (ctrl.attr("viewId") != "") {
                var viewId = this.xmlDoc.createElement("ViewId");
                $(viewId).text(ctrl.attr("viewId"));
                node.appendChild(viewId);
            }

            var listName = this.xmlDoc.createElement("ListName");
            $(listName).text(ctrl.attr("listname"));
            node.appendChild(listName);

            var url = this.xmlDoc.createElement("Url");
            $(url).text(ctrl.attr("url"));
            node.appendChild(url);

            var showtitle = this.xmlDoc.createElement("ShowTitle");
            $(showtitle).text(parseBool(ctrl.attr("showtitle")) ? "true" : "false");

            var icon = this.xmlDoc.createElement("Icon");
            $(icon).text(ctrl.attr("icon"));


            var showtabtitle = this.xmlDoc.createElement("ShowTabTitle");
            $(showtabtitle).text(parseBool(ctrl.attr("showtabtitle")) ? "true" : "false");

            var tabicon = this.xmlDoc.createElement("TabIcon");
            $(tabicon).text(ctrl.attr("tabicon"));

            var showtoolbar = this.xmlDoc.createElement("ShowToolbar");
            $(showtoolbar).text(parseBool(ctrl.attr("showtoolbar")) ? "true" : "false");

            var ispublic = this.xmlDoc.createElement("IsPublic");
            $(ispublic).text(ctrl.attr("ispublic"));

            var memo = this.xmlDoc.createElement("Memo");
            $(memo).text(ctrl.attr("memo"));

            node.appendChild(showtitle);
            node.appendChild(icon);
            node.appendChild(showtabtitle);
            node.appendChild(tabicon);
            node.appendChild(showtoolbar);
            node.appendChild(ispublic);
            node.appendChild(memo);

            ctrls.appendChild(node);
        }

        dashboardView.prototype.createTemplate = function (ctrl) {
            //var template = this.xmlDoc.selectSingleNode("//Template");

            $(this.xmlDoc.selectSingleNode("//Template//Row")).text(ctrl.attr("row"));
            $(this.xmlDoc.selectSingleNode("//Template//Col")).text(ctrl.attr("col"));

            //获取table的RowSpan和ColSpan信息
            var nodeSpans = this.xmlDoc.selectSingleNode("//Spans");
            var nodeSizes = this.xmlDoc.selectSingleNode("//ColSizes");
            var arrangements = this.xmlDoc.selectSingleNode("//Arrangements");

            var trs = ctrl.children('tbody').children('tr');
            for (var i = 0; i < trs.length; i++) {

                var tds = trs.eq(i).children('td');

                for (var j = 0; j < tds.length; j++) {
                    if ((tds.eq(j).attr('rowSpan') != undefined && tds.eq(j).attr('rowSpan') != 1)
            || (tds.eq(j).attr('colSpan') != undefined && tds.eq(j).attr('colSpan') != 1)) {
                        var nodeSpan = this.xmlDoc.createElement("Span");
                        var nodetr = this.xmlDoc.createElement("Tr");
                        $(nodetr).text(i);
                        nodeSpan.appendChild(nodetr);

                        var nodetd = this.xmlDoc.createElement("Td");
                        $(nodetd).text(j);
                        nodeSpan.appendChild(nodetd);

                        if (tds.eq(j).attr('rowSpan') != undefined) {
                            var noderowspan = this.xmlDoc.createElement("RowSpan");
                            $(noderowspan).text(tds.eq(j).attr('rowSpan'));
                            nodeSpan.appendChild(noderowspan);
                        }

                        if (tds.eq(j).attr('colSpan') != undefined) {
                            var nodecolspan = this.xmlDoc.createElement("ColSpan");
                            $(nodecolspan).text(tds.eq(j).attr('colSpan'));
                            nodeSpan.appendChild(nodecolspan);
                        }

                        nodeSpans.appendChild(nodeSpan);
                    }


                    if ((tds.eq(j).attr('width') != undefined && tds.eq(j).attr('width') != "") ||
                        (tds.eq(j).attr('height') != undefined && tds.eq(j).attr('height') != "")) {
                        var nodeSize = this.xmlDoc.createElement("ColSize");

                        var nodetr = this.xmlDoc.createElement("Tr");
                        $(nodetr).text(i);
                        nodeSize.appendChild(nodetr);

                        var nodetd = this.xmlDoc.createElement("Td");
                        $(nodetd).text(j);
                        nodeSize.appendChild(nodetd);

                        if (tds.eq(j).attr('width') != undefined) {
                            var nodeWidth = this.xmlDoc.createElement("Width");
                            $(nodeWidth).text(tds.eq(j).attr('width'));
                            nodeSize.appendChild(nodeWidth);
                        }

                        if (tds.eq(j).attr('height') != undefined) {
                            var nodeHeight = this.xmlDoc.createElement("Height");
                            $(nodeHeight).text(tds.eq(j).attr('height'));
                            nodeSize.appendChild(nodeHeight);
                        }
                        nodeSizes.appendChild(nodeSize);
                    }

                    if (tds.eq(j).attr('arrange') != undefined && tds.eq(j).attr('arrange') != "") {
                        var arrangement = this.xmlDoc.createElement("Arrangement");

                        var nodetr = this.xmlDoc.createElement("Tr");
                        $(nodetr).text(i);
                        arrangement.appendChild(nodetr);

                        var nodetd = this.xmlDoc.createElement("Td");
                        $(nodetd).text(j);
                        arrangement.appendChild(nodetd);

                        var nodeArrange = this.xmlDoc.createElement("Arrange");
                        $(nodeArrange).text(tds.eq(j).attr('arrange'));
                        arrangement.appendChild(nodeArrange);

                        arrangements.appendChild(arrangement);
                    }
                }
            }

        }

    </script>
</asp:Content>
