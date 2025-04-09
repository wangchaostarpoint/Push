<%@ Page Title="控件属性设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XFormCtrlEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormCtrlEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <table width="100%">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div id="templateTabs">
                    <ul>
                        <li><a href='#control' id='acontrol'>控件属性</a></li>
                        <li><a href='#form' id='aform'>流程配置</a></li>
                    </ul>
                    <div id="control">
                        <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td colspan="4" class="tz-title">
                                            基本属性
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            控件ID
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" readonly="readonly" id="tbID" class="kpms-textbox"
                                                style="width: 150px" />
                                        </td>
                                        <td class="td-l">
                                            控件类型
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" readonly="readonly" id="tbCtrlType" class="kpms-textbox"
                                                style="width: 150px" />
                                        </td>
                                    </tr>
                                    <tr id="trDefaultValue">
                                        <td class="td-l">
                                            默认值
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbDefaultValue" CssClass="kpms-textbox" Width="150px"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                            控件标识
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbCtrlName" CssClass="kpms-textbox" Width="150px"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="trReqStar" style="display: none">
                                        <td class="td-l">
                                            是否带红*
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbReqStar" Text="是" />
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr id="trActs" style="display: none">
                                        <td class="td-l">
                                            取得默认值步骤
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlActs" Width="150px">
                                            </zhongsoft:LightDropDownList>
                                            <span class="req-star">（设置取得默认值的步骤，如果要在新建时取得默认值请将此项设置为空）</span>
                                        </td>
                                    </tr>
                                    <tr id="trTitle" style="display: none">
                                        <td class="td-l">
                                            表Title
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbTitle" CssClass="kpms-textbox" Width="150px"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr id="trTextClass" style="display: none">
                                        <td class="td-l">
                                            文本框宽度
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbWidth" CssClass="kpms-textbox" Width="150px" regex="^[1-9]\d*$"
                                                Style="text-align: right" errmsg="Text宽度只能填写正整数"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                            文本框类型
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlTextType" Width="150px">
                                            </zhongsoft:LightDropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trIsReadOnly" style="display: none">
                                        <td class="td-l">
                                            是否只读
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbIsReadOnly" Text="是" />
                                        </td>
                                        <td class="td-l">
                                            对齐方式
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlTextAlign" Width="150px">
                                            </zhongsoft:LightDropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trCheckBox" style="display: none">
                                        <td class="td-l">
                                            是否单个CheckBox
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbIsSingle" Text="是" />
                                        </td>
                                        <td class="td-l">
                                            单个CheckBox的Text
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" id="tbSingleText" class="kpms-textbox" style="width: 150px" />
                                        </td>
                                    </tr>
                                    <tr id="trList" style="display: none">
                                        <td class="td-l">
                                            排列方向
                                        </td>
                                        <td class="td-r">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlDirection" Width="150px">
                                            </zhongsoft:LightDropDownList>
                                        </td>
                                        <td class="td-l">
                                            每列显示条数
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbRepeatColumns" CssClass="kpms-textbox" Width="150px"
                                                MaxLength="4" regex="^[1-9]\d*$" Style="text-align: right" errmsg="TRepeatColumns只能填写正整数"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table id="tableData" class="tz-table">
                                                <tr>
                                                    <td colspan="4" class="tz-title">
                                                        数据集属性
                                                    </td>
                                                </tr>
                                                <tr id="trReq">
                                                    <td class="td-l">
                                                        是否必填项
                                                    </td>
                                                    <td class="td-r">
                                                        <asp:CheckBox runat="server" ID="cbReq" Text="是" />
                                                    </td>
                                                    <td class="td-l">
                                                    </td>
                                                    <td class="td-r">
                                                    </td>
                                                </tr>
                                                <tr id="trSaveAsXml" style="display: none">
                                                    <td class="td-l">
                                                        保存为Xml
                                                    </td>
                                                    <td class="td-m" colspan="3">
                                                        <asp:CheckBox runat="server" ID="cbSaveAsXml" Text="是" Checked="true" />
                                                        <span class="req-star">当为多选时，选中此项数据在数据库内以xml方式存储，否则数据以“，”分割存储</span>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-l">
                                                        自定义数据源
                                                    </td>
                                                    <td class="td-m" colspan="3">
                                                        <asp:CheckBox runat="server" ID="cbIsDataCustom" Text="是" />
                                                        <span class="req-star">选中此项，控件会从自定义方法中读书数据</span>
                                                    </td>
                                                </tr>
                                                <tr id="trCustom">
                                                    <td class="td-l">
                                                        自定义源标志<span class="req-star">*</span>
                                                    </td>
                                                    <td class="td-r">
                                                        <asp:TextBox runat="server" ID="tbTableName" Width="150px"></asp:TextBox>
                                                    </td>
                                                    <td class="td-l">
                                                        字段名<span class="req-star">*</span>
                                                    </td>
                                                    <td class="td-r">
                                                        <asp:TextBox runat="server" ID="tbField" Width="150px"></asp:TextBox>
                                                    </td>
                                                </tr>
                                                <tr id="trTableName">
                                                    <td class="td-l">
                                                        表名<span class="req-star">*</span>
                                                    </td>
                                                    <td class="td-r">
                                                        <zhongsoft:LightDropDownList runat="server" ID="ddlTableName" AutoPostBack="true"
                                                            OnSelectedIndexChanged="ddlTableName_Changed" Width="150px">
                                                        </zhongsoft:LightDropDownList>
                                                    </td>
                                                    <td class="td-l">
                                                        字段名<span class="req-star">*</span>
                                                    </td>
                                                    <td class="td-r">
                                                        <zhongsoft:LightDropDownList runat="server" ID="ddlField" Width="150px">
                                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                                        </zhongsoft:LightDropDownList>
                                                    </td>
                                                </tr>
                                                <tr id="trText" style="display: none">
                                                    <td class="td-l">
                                                        数据最大长度
                                                    </td>
                                                    <td class="td-r">
                                                        <asp:TextBox runat="server" ID="tbLength" CssClass="kpms-textbox" Width="150px" regex="^[1-9]\d*$"
                                                            Style="text-align: right" errmsg="数据最大长度宽度只能填写正整数"></asp:TextBox>
                                                    </td>
                                                    <td class="td-l">
                                                        数据类型
                                                    </td>
                                                    <td class="td-r">
                                                        <input type="text" runat="server" readonly="readonly" id="tbDataType" class="kpms-textbox"
                                                            style="width: 150px" />
                                                    </td>
                                                </tr>
                                                <tr id="trRegex" style="display: none">
                                                    <td class="td-l">
                                                        匹配规则
                                                    </td>
                                                    <td class="td-r">
                                                        <zhongsoft:LightDropDownList runat="server" ID="ddlRegex" Width="150px">
                                                        </zhongsoft:LightDropDownList>
                                                    </td>
                                                    <td class="td-l">
                                                    </td>
                                                    <td class="td-r">
                                                    </td>
                                                </tr>
                                                <tr id="trIsSaveText" style="display: none">
                                                    <td class="td-l">
                                                        是否保存Text
                                                    </td>
                                                    <td class="td-r">
                                                        <asp:CheckBox runat="server" ID="cbIsSaveText" Text="是" />
                                                    </td>
                                                    <td class="td-l">
                                                        Text字段名
                                                    </td>
                                                    <td class="td-r">
                                                        <zhongsoft:LightDropDownList runat="server" ID="ddlTextField" Width="150px">
                                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                                        </zhongsoft:LightDropDownList>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <table id="tableParam" class="tz-table">
                                                <tr>
                                                    <td colspan="4" class="tz-title">
                                                        参数集属性
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="td-l">
                                                        设置
                                                    </td>
                                                    <td class="td-m" colspan="3">
                                                        <table cellpadding='0' cellspacing='0' width="85%">
                                                            <tr>
                                                                <td>
                                                                    <input type="hidden" runat="server" id="hiFieldParam" />
                                                                    <zhongsoft:XHtmlInputText type="text" ID="txtFieldParam" runat="server" readonly="readonly"
                                                                        style="width: 100%" class="kpms-textbox">
                                                                    </zhongsoft:XHtmlInputText>
                                                                </td>
                                                                <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                                    <asp:LinkButton runat="server" ID="btnFieldParam" OnClientClick="return setFieldParam();"
                                                                        OnClick="btnFieldParam_Click" Style="height: 18px; width: 20px; padding: 0px"
                                                                        CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                                    </asp:LinkButton>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="form">
                        <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="td-m" width="200px" rowspan="2" valign="top">
                                            <div style="height: 255px; overflow: auto;">
                                                <asp:TreeView ID="ActsTree" runat="server">
                                                </asp:TreeView>
                                            </div>
                                        </td>
                                        <td class="td-m" valign="top">
                                            <table width="100%">
                                                <tr>
                                                    <td colspan="2" class="tz-title" valign="top">
                                                        以下步骤可用
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="75px">
                                                        <asp:LinkButton runat="server" ID="btnAddActiveStatus" CssClass="kpms-btn" OnClick="btnAddActiveStatus_Click"><span>添加</span></asp:LinkButton><br />
                                                        <asp:LinkButton runat="server" ID="btnDeleteActiveStatus" CssClass="kpms-btn" OnClick="btnDeleteActiveStatus_Click"><span>删除</span></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:ListBox runat="server" ID="boxActiveStatus" SelectionMode="Multiple" Width="150px"
                                                            Height="150px"></asp:ListBox>
                                                        <input type="hidden" runat="server" id="hiActiveStatus" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-m" valign="top">
                                            <table width="100%">
                                                <tr>
                                                    <td colspan="2" class="tz-title" valign="top">
                                                        以下步骤可见
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td width="75px">
                                                        <asp:LinkButton runat="server" ID="btnAddDisplayStatus" CssClass="kpms-btn" OnClick="btnAddDisplayStatus_Click"><span>添加</span></asp:LinkButton><br />
                                                        <asp:LinkButton runat="server" ID="btnDeleteDisplayStatus" CssClass="kpms-btn" OnClick="btnDeleteDisplayStatus_Click"><span> 删除</span></asp:LinkButton>
                                                    </td>
                                                    <td>
                                                        <asp:ListBox runat="server" ID="boxDisplayStatus" SelectionMode="Multiple" Width="150px"
                                                            Height="95px"></asp:ListBox>
                                                        <input type="hidden" runat="server" id="hiDisplayStatus" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                </div>
            </td>
        </tr>
    </table>
    <div id="divCtrl" style="display: none">
    </div>
    <input type="hidden" runat="server" id="hiXml" />
    <script>
        var type = "<%=CtrlType %>";
        $(document).ready(function () {
            if ("<%=Page.IsPostBack %>" == "False") {
                var args = window.dialogArguments;
                $("#<%=hiXml.ClientID %>").val(args.html());
                var ctrl = args.children();
                getCtrlAttr(ctrl);
            }
            setTrShowORHide();
            setAttr();
            $("#divCtrl").html($("#<%=hiXml.ClientID %>").val());
        })

        function initCustomerPlugin() {
            $('#templateTabs').tabs();
            checkRegex();
            if (type == "table" || type == "hidden") {
                $("#aform").hide();
            }
            if ("<%=FormType %>" != "XForm") { $("#aform").hide(); }
            if ("<%=FormType %>" == "XForm" && (type == "textbox" || type == "dropdownlist" || type == "radiobutton" || type == "checkbox" || type == "hidden"))
            { $("#trActs").show(); }

            setTrShowORHide();
            setAttr();
            $("#<%=this.tbDefaultValue.ClientID %>").autocomplete({
                source: function (request, response) {
                    $.getJSON("JsonSelectorHandler.ashx", {
                        term: request.term + ',xformdefault'
                    }, response);
                },
                minLength: 1,
                select: function (event, ui) {
                    if (ui.item) {
                        $("#<%=tbDefaultValue.ClientID %>").attr("value", ui.item.value);
                    }
                }
            });
        }



        function Save() {
            if (!checkReqField()) {
                return false;
            }


            var ctrl = $("#divCtrl").children();
            saveCtrlAttr(ctrl);
            $("#<%=hiXml.ClientID %>").val($("#divCtrl").html());
            window.returnValue = $("#<%=hiXml.ClientID %>").val();

            window.close();
        }

        function setDataAttr() {
            if ($("#<%=cbIsDataCustom.ClientID %>").is(':checked')) {
                $("#trCustom").show();
                $("#trTableName").hide();
                $("#<%=tbTableName.ClientID %>").attr("req", "1");
                $("#<%=tbField.ClientID %>").attr("req", "1");
                $("#<%=ddlTableName.ClientID %>").removeAttr("req");
                $("#<%=ddlField.ClientID %>").removeAttr("req");
            }
            else {
                $("#trCustom").hide();
                $("#trTableName").show();
                $("#<%=tbTableName.ClientID %>").removeAttr("req");
                $("#<%=tbField.ClientID %>").removeAttr("req");
                $("#<%=ddlTableName.ClientID %>").attr("req", "1");
                $("#<%=ddlField.ClientID %>").attr("req", "1");
            }
        }

        function setAttr() {
            if (type == "textbox" || type == "dropdownlist" || type == "radiobutton" || type == "checkbox" || type == "hidden") {
                setDataAttr();
            }
            if (type == "dropdownlist" || type == "radiobutton") {
                setDropRadioAttr();
            }
            if (type == "checkbox") {
                setCheckBoxAttr();
            }
            if (type == "textbox") {
                $("#<%=ddlTextType.ClientID %>").attr("req", "1");
                setTextAttr();
            }
        }

        function setTrShowORHide() {
            if (type == "table") {
                $("#trDefaultValue").hide();
                $("#tableData").hide();
                $("#tableParam").hide();
                $("#trTitle").show();
            }
            else if (type == "label") {
                $("#tableData").hide();
                $("#tableParam").hide();
                $("#trReqStar").show();
            }
            else if (type == "textbox") {
                $("#tableParam").hide();
                $("#trText").show();
                $("#trTextClass").show();
                $("#trIsReadOnly").show();
                $("#trRegex").show();
            }
            else if (type == "dropdownlist") {
                $("#trIsSaveText").show();
            }
            else if (type == "radiobutton") {
                $("#trList").show();
                $("#trIsSaveText").show();

            }
            else if (type == "checkbox") {
                $("#trList").show();
                $("#trCheckBox").show();
                $("#trSaveAsXml").show();
            }
            else if (type == "hidden") {
                $("#tableParam").hide();
                $("#trReq").hide();
            }
        }

        function getCtrlAttr(ctrl) {
            $("#<%=hiActiveStatus.ClientID %>").val(ctrl.attr("ActiveStatus"));
            $("#<%=hiDisplayStatus.ClientID %>").val(ctrl.attr("DisplayStatus"));
            $("#<%=tbID.ClientID %>").val(ctrl.attr("id"));
            $("#<%=tbCtrlType.ClientID %>").val(ctrl.attr("CtrlType"));
            $("#<%=tbDefaultValue.ClientID %>").val(ctrl.attr("DefaultValue"));
            if (ctrl.attr("CtrlName") == "" || ctrl.attr("CtrlName") == null || ctrl.attr("CtrlName") == undefined)
                $("#<%=tbCtrlName.ClientID %>").val(ctrl.attr("id"));
            else
                $("#<%=tbCtrlName.ClientID %>").val(ctrl.attr("CtrlName"));
            $("#<%=tbTitle.ClientID %>").val(ctrl.attr("Title"));
            $("#<%=tbWidth.ClientID %>").val(ctrl.attr("XWidth"));
            $("#<%=tbSingleText.ClientID %>").val(ctrl.attr("SingleText"));
            $("#<%=ddlDirection.ClientID %>").val(ctrl.attr("Direction"));
            $("#<%=tbRepeatColumns.ClientID %>").val(ctrl.attr("RepeatColumns"));
            if (ctrl.attr("IsDataCustom") == "True") {
                $("#<%=cbIsDataCustom.ClientID %>").attr("checked", "checked");
                $("#<%=tbTableName.ClientID %>").val(ctrl.attr("TableName"));
                $("#<%=tbField.ClientID %>").val(ctrl.attr("Field"));
            }
            else {
                $("#<%=ddlField.ClientID %>").val(ctrl.attr("Field"));
            }
            $("#<%=tbDataType.ClientID %>").val(ctrl.attr("DataType"));
            $("#<%=tbLength.ClientID %>").val(ctrl.attr("Length"));
            $("#<%=ddlTextType.ClientID %>").val(ctrl.attr("TextType"));
            $("#<%=ddlRegex.ClientID %>").val(ctrl.attr("RegexType"));
            if (ctrl.attr("IsReadOnly") == "True") {
                $("#<%=cbIsReadOnly.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("IsSingle") == "True") {
                $("#<%=cbIsSingle.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("Req") == "True") {
                $("#<%=cbReq.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("SaveAsXml") == "False") {
                $("#<%=cbSaveAsXml.ClientID %>").removeAttr("checked");
            }
            if (ctrl.attr("IsSaveText") == "True") {
                $("#<%=cbIsSaveText.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("ReqStar") == "True") {
                $("#<%=cbReqStar.ClientID %>").attr("checked", "checked");
            }
            $("#<%=ddlTextField.ClientID %>").val(ctrl.attr("TextField"));
            $("#<%=ddlActs.ClientID %>").val(ctrl.attr("DefaultAct"));
            $("#<%=hiFieldParam.ClientID %>").val(ctrl.attr("FieldParam"));
        }



        function saveCtrlAttr(ctrl) {
            var activestatus = $("#<%=hiActiveStatus.ClientID %>").val();
            var displaystatus = $("#<%=hiDisplayStatus.ClientID %>").val();
            var ctrlname = $("#<%=tbCtrlName.ClientID %>").val();
            var defaultvalue = $("#<%=tbDefaultValue.ClientID %>").val();
            var title = $("#<%=tbTitle.ClientID %>").val();
            var isDataCustom = $("#<%=cbIsDataCustom.ClientID %>").is(':checked') ? "True" : "False";
            var field = $("#<%=ddlField.ClientID %>").val();
            var tablename = $("#<%=ddlTableName.ClientID %>").val();
            if (isDataCustom == "True") {
                field = $("#<%=tbField.ClientID %>").val();
                tablename = $("#<%=tbTableName.ClientID %>").val();
            }
            var datatype = $("#<%=tbDataType.ClientID %>").val();
            var texttype = $("#<%=ddlTextType.ClientID %>").val();
            var width = $("#<%=tbWidth.ClientID %>").val();
            var regextype = $("#<%=ddlRegex.ClientID %>").val();
            var singletext = $("#<%=tbSingleText.ClientID %>").val();
            var direction = $("#<%=ddlDirection.ClientID %>").val();
            var repeatcolumns = $("#<%=tbRepeatColumns.ClientID %>").val();
            var length = $("#<%=tbLength.ClientID %>").val();
            var isreadonly = $("#<%=cbIsReadOnly.ClientID %>").is(':checked') ? "True" : "False";
            var req = $("#<%=cbReq.ClientID %>").is(':checked') ? "True" : "False";
            var issavetext = $("#<%=cbIsSaveText.ClientID %>").is(':checked') ? "True" : "False";
            var issingle = $("#<%=cbIsSingle.ClientID %>").is(':checked') ? "True" : "False";
            var reqstar = $("#<%=cbReqStar.ClientID %>").is(':checked') ? "True" : "False";
            var textfield = $("#<%=ddlTextField.ClientID %>").val();
            var fieldparam = $("#<%=hiFieldParam.ClientID %>").val();
            var textalign = $("#<%=ddlTextAlign.ClientID %>").val();
            var defaultAct = $("#<%=ddlActs.ClientID %>").val();
            var saveAsXml = $("#<%=cbSaveAsXml.ClientID %>").is(':checked') ? "True" : "False";
            ctrl.attr({ CanSave: "1", ActiveStatus: activestatus, DisplayStatus: displaystatus });
            if (type != "table") {
                ctrl.css("border", "");
            }
            if (type == "table") {
                ctrl.attr("Title", title)
            }
            else if (type == "label") {
                ctrl.attr({ DefaultValue: defaultvalue, CtrlName: ctrlname, ReqStar: reqstar })
                var star = (reqstar == "True" ? "*" : "");
                if (defaultvalue != "") {
                    ctrl.html(defaultvalue + star);
                }
                else {
                    ctrl.html('label' + star);
                }
            }
            else if (type == "textbox") {
                ctrl.attr({ CtrlName: ctrlname, DefaultValue: defaultvalue, TableName: tablename, Field: field, DataType: datatype,
                    Length: length, IsReadOnly: isreadonly, Req: req, XWidth: width, value: defaultvalue, TextType: texttype,
                    RegexType: regextype, TextAlign: textalign, DefaultAct: defaultAct, IsDataCustom: isDataCustom
                })
            }
            else if (type == "dropdownlist") {
                ctrl.attr({ CtrlName: ctrlname, DefaultValue: defaultvalue, TableName: tablename, Field: field, Req: req,
                    IsSaveText: issavetext, TextField: textfield, FieldParam: fieldparam, DefaultAct: defaultAct, IsDataCustom: isDataCustom
                })
                if (ctrlname != '') {
                    ctrl.html("<option>" + ctrlname + "</option>");
                }
                else {
                    ctrl.html("<option>请选择</option>");
                }
            }
            else if (type == "radiobutton") {
                ctrl.attr({ CtrlName: ctrlname, DefaultValue: defaultvalue, TableName: tablename, Field: field, Req: req,
                    IsSaveText: issavetext, TextField: textfield, FieldParam: fieldparam, DefaultAct: defaultAct, IsDataCustom: isDataCustom
                })
            }
            else if (type == "checkbox") {
                ctrl.attr({ CtrlName: ctrlname, DefaultValue: defaultvalue, TableName: tablename, Field: field, Req: req,
                    FieldParam: fieldparam, Direction: direction, RepeatColumns: repeatcolumns,
                    IsSingle: issingle, SingleText: singletext, DefaultAct: defaultAct, SaveAsXml: saveAsXml, IsDataCustom: isDataCustom
                })
            }
            else if (type == "hidden") {
                ctrl.attr({ CtrlName: ctrlname, DefaultValue: defaultvalue, TableName: tablename, Field: field, DefaultAct: defaultAct, IsDataCustom: isDataCustom });
                if (ctrlname != "") {
                    ctrl.html(ctrlname);
                }
                else {
                    ctrl.html('hidden');
                }
            }
        }


        function setTextAttr() {
            var datatype = $("#<%=tbDataType.ClientID %>").val().toLowerCase().split("(")[0];
            var texttype = $("#<%=ddlTextType.ClientID %>").val();
            if (datatype != "clob" && datatype != "nclob" && datatype != "xml" && datatype != "" && datatype != "date" && datatype != "datetime" && datatype != "text" && texttype != "日期控件" && texttype != "") {
                $("#<%=tbLength.ClientID %>").attr("req", "1");
            }
            else {
                $("#<%=tbLength.ClientID %>").removeAttr("req");
            }
        }



        function setCheckBoxAttr() {
            var isSingle = $("#<%=cbIsSingle.ClientID %>").is(':checked');
            if (isSingle) {
                $("#tableParam").hide();
                $("#trList").hide();
                $("#trReq").hide();
            }
            else {
                $("#tableParam").show();
                $("#trList").show();
                $("#trReq").show();
            }
        }

        function setDropRadioAttr() {
            var isSaveText = $("#<%=cbIsSaveText.ClientID %>").is(':checked');
            if (isSaveText) { $("#<%=ddlTextField.ClientID %>").attr("req", "1") }
            else { $("#<%=ddlTextField.ClientID %>").removeAttr("req") }
        }



        $("#<%=ddlField.ClientID %>").live("change", function () {
            if (type == "textbox") {
                if ($(this).val() == "")
                { $("#<%=tbDataType.ClientID %>").val("") }
                else {
                    $.post("XFormCtrlEditor.aspx",
                    { asyfunc: "GetDataType", tablecode: $("#<%=ddlTableName.ClientID %>").val(), fieldcode: $(this).val() },
                    function (res) {
                        $("#<%=tbDataType.ClientID %>").val(res)
                        setTextAttr();
                    }
                );
                }
            }
        })

        $("#<%=cbIsDataCustom.ClientID %>").live("click", function () {
            setDataAttr();
        })

        $("#<%=cbIsSingle.ClientID %>").live("click", function () {
            setCheckBoxAttr();
        })

        $("#<%=cbIsSaveText.ClientID %>").live("click", function () {
            setDropRadioAttr();
        })

        $("#<%=ddlTextType.ClientID %>").live("change", function () {
            setTextAttr();
        })

        function setFieldParam() {
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", null);
            var re = showModal(encodeURI(url), $("#<%=hiFieldParam.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiFieldParam.ClientID%>").val(re);
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel3" UpdateMode="Conditional">
        <ContentTemplate>
            <asp:LinkButton runat="server" ID="btnSave" class="kpms-btn" OnClientClick="Save();return false;">
                            <span>确定</span>
            </asp:LinkButton>
            <asp:LinkButton runat="server" ID="btnCancel" class="kpms-btn" OnClientClick="window.close();return false;">
                            <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
