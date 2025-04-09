<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="XFormViewEditor.aspx.cs"
    Title="视图编辑页面" MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.Custom.List.XFormViewEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" EnableTheming="false" CssClass="subtoolbarlink" ID="btnView"
            OnClientClick="return viewForm()" DisplayStatus="(13.*)">
                    <img alt =""  src="../../Themes/Images/btn_search.gif" width="16" height="16"/><span>预览</span>
        </asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
        .editor-right
        {
            overflow: hidden;
        }
    </style>
    <table class="tz-table">
        <tr>
            <td valign="top" id="tdContent" colspan="2">
                <link href="../UI/xform.css" rel="Stylesheet" type="text/css" />
                <link href="../UI/Impromptu.css" rel="Stylesheet" type="text/css" />
                <script src="../UI/Script/xform.js"></script>
                <script src="../UI/Script/jquery-impromptu.4.0.js"></script>
                <!--表单描述信息 -->
                <table class="tz-table">
                    <tr>
                        <td colspan="4" class="tz-title">
                            基本信息
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            视图类型<span class="req-star">*</span>
                        </td>
                        <td class="td-m">
                            <input type="hidden" runat="server" id="hiActionType" />
                            <input type="text" runat="server" id="txtViewType" field="FormViewType" tablename="WorkFlowFormView"
                                readonly="readonly" class="kpms-textbox" />
                        </td>
                        <td class="td-l">
                            流程主题
                        </td>
                        <td class="td-m">
                            <input type="text" runat="server" id="tbObjNameFormat" readonly="readonly" class="kpms-textbox" />
                            <input type="hidden" runat="server" id="hiObjNameFields" />
                            <asp:LinkButton runat="server" ID="btnEditObjName" OnClientClick="editObjName();return false;"> <span>设置</span></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            表单类型<span class="req-star">*</span>
                        </td>
                        <td class="td-m">
                            <asp:DropDownList runat="server" ID="ddlCustomFormType">
                            </asp:DropDownList>
                        </td>
                        <td class="td-l">
                            页面脚本
                        </td>
                        <td class="td-m">
                            <input type="text" runat="server" id="tbScript" readonly="readonly" class="kpms-textbox" />
                            <input type="hidden" runat="server" id="hiScript" />
                            <asp:LinkButton runat="server" ID="btnEditScript" OnClientClick="editScript();return false;"> <span>设置</span></asp:LinkButton>
                        </td>
                    </tr>
                </table>
                <!--控件区域  -->
                <table class="tz-table">
                    <tr>
                        <td class="tz-title" colspan="2">
                            表单设计
                        </td>
                    </tr>
                    <tr class="xform-btnbg">
                        <td align='left' colspan="2">
                            <div class="btnContainer">
                                <a title="table" type='table' class="drag"><span class="table"></span></a><a type='label'
                                    title="label" class="drag"><span class="label"></span></a><a type='textbox' title="textbox"
                                        class="drag"><span class="textbox"></span></a><a title="checkbox" type='checkbox'
                                            class="drag"><span class="checkbox"></span></a><a type='radiobutton' title="radiobutton"
                                                class="drag"><span class="radiobutton"></span></a><a type='dropdownlist' title="dropdownlist"
                                                    class="drag"><span class="dropdownlist"></span></a><a type='hidden' title="hidden"
                                                        class="drag"><span class="hidden"></span></a><a type='selector' title="selector"
                                                            class="drag"><span class="selector"></span></a><a type='gridview' title="gridview"
                                                                class="drag"><span class="gridview"></span></a><a type='filelink' title="filelink"
                                                                    class="drag"><span class="filelink"></span></a>
                            </div>
                        </td>
                    </tr>
                </table>
                <div id="canvas" style="background: #fff; width: 100%; border: #000 1px solid; z-index: 1;
                    max-height: 350px; overflow: auto">
                </div>
                <input type="hidden" runat="server" id="hiFormViewId" field="FormViewId" tablename="WorkFlowFormView" />
                <input type="hidden" runat="server" id="hiFormID" field="FormID" tablename="WorkFlowFormView" />
                <input type="hidden" runat="server" id="hiXml" field="Expression" tablename="WorkFlowFormView" />
                <input type="hidden" runat="server" id="hiEmptyXml" />
                <div id="formSuccess" style="display: none" class="form-save">
                    <span>保存成功！</span>
                </div>
                <script>
                    $(function () {
                        $('.btnContainer').painting($('#canvas'));
                    })


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

                    var formType = "<%=FormType %>";
                    var bizId = "<%=BusinessObjectId %>";
                    var formId = "<%=FormID %>";
                    var formViewType = "<%=FormViewType %>";

                    function initCustomerPlugin() {
                        if ($("#<%=hiXml.ClientID %>").val() == "") {
                            view.loadXML($("#<%=hiEmptyXml.ClientID %>").val());
                        }
                        else {
                            view.loadXML($("#<%=hiXml.ClientID %>").val());
                        }

                        $("#canvas").html($(view.selectSingleNode("//CtrlHtml")).text());

                    }

                    function checkForm() {
                        getViewXml();
                        return true;
                    }

                    function getViewXml() {
                        var xmlstr = $("#<%=hiEmptyXml.ClientID %>").val();
                        view.loadXML(xmlstr);
                        var old = $("#<%=hiEmptyXml.ClientID %>").val();

                        $(view.selectSingleNode("//ObjNameFormat")).text($("#<%=tbObjNameFormat.ClientID %>").val());
                        $(view.selectSingleNode("//ObjNameFields")).text($("#<%=hiObjNameFields.ClientID %>").val());
                        $(view.selectSingleNode("//CustomFormType")).text($("#<%=ddlCustomFormType.ClientID %>").val());
                        $(view.selectSingleNode("//RegisterScript")).text($("#<%= hiScript.ClientID %>").val());

                        var objectlists = $('#canvas [CtrlType]');
                        $('#canvas span').css('border', '');
                        view.createCtrlHtml($('#canvas').html());
                        view.createModifyTime();
                        for (var i = 0; i < objectlists.length; i++) {
                            view.createCtrl(objectlists.eq(i));
                        }
                        $("#<%=hiXml.ClientID %>").val(view.xml());
                    }

                    function saveDivForm() {
                        getViewXml();
                        var type = $("#<%=txtViewType.ClientID %>").val();
                        var expression = $("#<%=hiXml.ClientID %>").val();
                        var actiontype = $("#<%=hiActionType.ClientID %>").val();
                        var formId = $("#<%=hiFormID.ClientID %>").val();
                        $.post("XFormViewEditor.aspx",
                    { asyfunc: "SaveDivForm", FormViewType: type, Expression: expression, BizId: bizId, ActionType: actiontype, FormID: formId },
                    function (res) {
                        if (res != "") {
                            showSaveMsg("保存失败。" + res, 1);
                        }
                        else {
                            showSaveMsg("保存成功。", 0);
                        }
                        $("#<%=hiActionType.ClientID %>").val("Update");
                    })
                    }

                    function viewForm() {
                        var url = buildQueryUrl("sys/WorkFlow/FormDetail.aspx",
                        { actionType: "2",
                            packageName: "<%=PackageName %>",
                            xpdlId: "<%=XPDLID %>",
                            formId: $("#<%=hiFormID.ClientID %>").val(),
                            FormViewType: $("#<%=txtViewType.ClientID %>").val()
                        });
                        showModal(encodeURI(url), "", 1000, 700);
                        return false;
                    }

                    function editObjName() {
                        if ("<%=ActionType %>" == "Create") {
                            alert("请先保存再设置流程主题。");
                            return;
                        }
                        var url = buildQueryUrl("custom/List/XFormObjNameEditor.aspx",
                      { actionType: "3",
                          FormPageId: bizId,
                          FormType: formType,
                          formId: $("#<%=hiFormID.ClientID %>").val(),
                          FormViewType: $("#<%=txtViewType.ClientID %>").val()
                      });
                        var re = showModal(encodeURI(url), null, 600, 300);
                        if (re != undefined && re != null) {
                            $("#<%=tbObjNameFormat.ClientID %>").val(re.split('@|@')[0]);
                            $("#<%=hiObjNameFields.ClientID %>").val(re.split('@|@')[1]);
                        }
                    }

                    function editScript() {
                        if ("<%=ActionType %>" == "Create") {
                            alert("请先保存再设置页面脚本。");
                            return;
                        }
                        var url = buildQueryUrl("custom/List/XFormScriptEditor.aspx",
                      { actionType: "3",
                          FormPageId: bizId,
                          FormType: formType,
                          formId: $("#<%=hiFormID.ClientID %>").val(),
                          FormViewType: $("#<%=txtViewType.ClientID %>").val()
                      });
                        var re = showModal(encodeURI(url), null, 600, 300);
                        if (re != undefined && re != null) {
                           
                            $("#<%=tbScript.ClientID %>").val(decodeURIComponent(re));
                            $("#<%=hiScript.ClientID %>").val(decodeURIComponent(re));
                        }
                    }
                   
                </script>
            </td>
        </tr>
    </table>
</asp:Content>
