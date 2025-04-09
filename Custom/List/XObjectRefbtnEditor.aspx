<%@ Page Title="选择按钮属性设置页面" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XObjectRefbtnEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XObjectRefbtnEditor" %>

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
                                    <tr>
                                        <td class="td-l">
                                            默认值
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbDefaultValue" CssClass="kpms-textbox" Width="150px"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            取得默认值步骤
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlActs" Width="150px">
                                            </zhongsoft:LightDropDownList>
                                            <span class="req-star">（设置取得默认值的步骤，如果要在新建时取得默认值请将此项设置为空）</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="tz-title">
                                            数据集属性
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            保存到扩展表
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbSaveExTable" Text="是" />
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr flag='ex' style="display: none">
                                        <td class="td-l">
                                            扩展表名
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlExTable" AutoPostBack="true" OnSelectedIndexChanged="ddlExTable_Changed">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="td-l">
                                            关联主表字段
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlFKCode">
                                                <asp:ListItem Value="">请选择</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr flag='ex' style="display: none">
                                        <td class="td-l">
                                            对应关系
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:TextBox runat="server" ID="tbAttrsAndFields" Width="85%"></asp:TextBox>
                                            <span class="req-star">选择结果xml中的属性attr与扩展表字段的对应关系（attr1;field1|attr2;field2）</span>
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
                                            表名
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlTableName" AutoPostBack="true" OnSelectedIndexChanged="ddlTableName_Changed"
                                                Width="150px">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="td-l">
                                            字段名
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlField" Width="150px">
                                                <asp:ListItem Value="">请选择</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr id="trReq">
                                        <td class="td-l">
                                            是否保存所选Xml
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbIsSaveXml" Text="是" AutoPostBack="false" />
                                        </td>
                                        <td class="td-l">
                                            是否必填
                                        </td>
                                        <td class="td-r">
                                            <asp:CheckBox runat="server" ID="cbXReq" Text="是" AutoPostBack="false" />
                                        </td>
                                    </tr>
                                    <tr id="trTableField">
                                        <td class="td-l">
                                            Xml字段<span class="req-star">*</span>
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlXmlField" Width="150px">
                                                <asp:ListItem Value="">请选择</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="tz-title">
                                            选择页面属性<span class="req-star">*</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            选择页面宽度<span class="req-star">*</span>
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" id="tbPageWidth" class="kpms-textbox" style="text-align: right;
                                                width: 150px" req="1" maxlength="4" value="650" regex="^[1-9]\d*$" errmsg="选择页面宽度只能填写正整数" />
                                        </td>
                                        <td class="td-l">
                                            选择页面高度<span class="req-star">*</span>
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" id="tbPageHeight" class="kpms-textbox" style="text-align: right;
                                                width: 150px" req="1" maxlength="4" value="600" regex="^[1-9]\d*$" errmsg="选择页面高度只能填写正整数" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            选择页面<span class="req-star">*</span>
                                        </td>
                                        <td class="td-m">
                                            <input type="hidden" runat="server" id="hiSelectorPageId" />
                                            <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectorPage" PageUrl="~/Sys/Menu/PageSelector.aspx"
                                                OnClick="lbsSelectorPage_Click" Width="150px" Filter="2" ResultAttr="att3" ResultForControls="{'hiSelectorPageId':'id'}" />
                                        </td>
                                        <td class="td-l">
                                            选择类型
                                        </td>
                                        <td class="td-r">
                                            <asp:DropDownList runat="server" ID="ddlSingleMutiple" req="1" Width="150px">
                                                <asp:ListItem Value="s">单选</asp:ListItem>
                                                <asp:ListItem Value="m">多选</asp:ListItem>
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            选择页面类名
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:TextBox runat="server" ID="tbFullClassName" Width="85%"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            参数
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <table cellpadding='0' cellspacing='0' width="85%">
                                                <tr>
                                                    <td>
                                                        <input type="text" runat="server" id="tbParam" readonly="readonly" style="width: 100%;
                                                            height: 16px" />
                                                    </td>
                                                    <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                        <asp:LinkButton runat="server" ID="btnSetParam" OnClientClick="return setParam();"
                                                            Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            选择结果<span class="req-star">*</span>
                                        </td>
                                        <td class="td-m">
                                            <input type="text" runat="server" id="txtResultAttr" value="name" req="1" />
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-m">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            控件及其对应字段
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <input type="hidden" runat="server" id="hiControlsAndFields" />
                                            <asp:ListBox ID="boxControlsAndFields" runat="server" Width="150px" Height="80px"
                                                SelectionMode="Multiple"></asp:ListBox>
                                            <asp:LinkButton runat="server" ID="btnDelete" CssClass="kpms-btn" OnClick="btnDelete_Click"><span>删除</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            添加控件与字段
                                        </td>
                                        <td class="td-m" colspan="3">
                                            控件
                                            <asp:DropDownList runat="server" ID="ddlControls" Width="150px">
                                            </asp:DropDownList>
                                            <input type="text" runat="server" id="tbCtrl" class="kpms-textbox" readonly="readonly"
                                                style="width: 150px" /><br />
                                            字段
                                            <asp:DropDownList runat="server" ID="ddlRefFields" Width="150px">
                                            </asp:DropDownList>
                                            <input type="text" runat="server" id="tbRefField" class="kpms-textbox" style="width: 150px" />
                                            <asp:LinkButton runat="server" ID="btnAdd" CssClass="kpms-btn" OnClientClick="return addCtrlAndField();"
                                                OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="tz-title">
                                            移动端属性<span class="req-star">（配置了移动端Appflag，移动端根据Appflag弹出移动端定制页面）</span>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            AppFlag标识
                                        </td>
                                        <td class="td-m">
                                            <input type="text" runat="server" id="txtAppFlag" value="name" />
                                            <span class="req-star">（AppFlag|标题）</span>
                                        </td>
                                        <td class="td-l">
                                            App选择结果
                                        </td>
                                        <td class="td-m">
                                            <input type="text" runat="server" id="txtAppResultAttr" value="name" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            App控件及其对应字段
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <input type="hidden" runat="server" id="hiAppControlsAndFields" />
                                            <asp:ListBox ID="lbAppControlsAndFields" runat="server" Width="150px" Height="80px"
                                                SelectionMode="Multiple"></asp:ListBox>
                                            <asp:LinkButton runat="server" ID="btnAppDelete" CssClass="kpms-btn" OnClick="btnAppDelete_Click"><span>删除</span></asp:LinkButton>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            添加App控件与字段
                                        </td>
                                        <td class="td-m" colspan="3">
                                            控件
                                            <asp:DropDownList runat="server" ID="ddlAppCtrls" Width="150px">
                                            </asp:DropDownList>
                                            <input type="text" runat="server" id="tbAppCtrl" class="kpms-textbox"
                                                style="width: 150px" /><br />
                                            字段
                                            <input type="text" runat="server" id="tbAppField" class="kpms-textbox" style="width: 150px" />
                                            <asp:LinkButton runat="server" ID="btnAppAdd" CssClass="kpms-btn" OnClientClick="return addAppCtrlAndField();"
                                                OnClick="btnAppAdd_Click"><span>添加</span></asp:LinkButton>
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
                                        <td class="td-m" width="150px" rowspan="2" valign="top">
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
                                                        <asp:LinkButton runat="server" ID="btnAddActiveStatus" CssClass="kpms-btn" OnClick="btnAddActiveStatus_Click"><span>添加<img  src="../ui/images/next.gif" /></span></asp:LinkButton><br />
                                                        <asp:LinkButton runat="server" ID="btnDeleteActiveStatus" CssClass="kpms-btn" OnClick="btnDeleteActiveStatus_Click"><img src="../ui/images/pre.gif" /><span>删除</span></asp:LinkButton>
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
                                                        <asp:LinkButton runat="server" ID="btnAddDisplayStatus" CssClass="kpms-btn" OnClick="btnAddDisplayStatus_Click"><span>添加<img  src="../ui/images/next.gif" /></span></asp:LinkButton><br />
                                                        <asp:LinkButton runat="server" ID="btnDeleteDisplayStatus" CssClass="kpms-btn" OnClick="btnDeleteDisplayStatus_Click"><img src="../ui/images/pre.gif" /><span> 删除</span></asp:LinkButton>
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
    <hr />
    <div id="divCtrl" style="display: none">
    </div>
    <input type="hidden" runat="server" id="hiXml" />
    <script>

        $(document).ready(function () {
            if ("<%=Page.IsPostBack %>" == "False") {
                var args = window.dialogArguments;
                $("#<%=hiXml.ClientID %>").val(args.html());
                var ctrl = args.children();
                getCtrlAttr(ctrl);
            }
            setTableFieldAttr();
            setExOrMain();
            setDataAttr();
            $("#divCtrl").html($("#<%=hiXml.ClientID %>").val());
        })

        function initCustomerPlugin() {
            $('#templateTabs').tabs();
            checkRegex();
           // setTableFieldAttr();
          //  setExOrMain();
            if ("<%=FormType %>" != "XForm") { $("#aform").hide(); }

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

        $("#<%=cbIsSaveXml.ClientID %>").live("click", function () {
            setTableFieldAttr();
        })

        $("#<%=cbSaveExTable.ClientID %>").live("click", function () {
            setExOrMain();
        });

        function setExOrMain() {
            var isSaveEx = $("#<%=cbSaveExTable.ClientID %>").is(':checked');
            if (isSaveEx) {
                $("[flag='ex']").show();
                $("#<%=ddlExTable.ClientID %>").attr("req", "1");
                $("#<%=ddlFKCode.ClientID %>").attr("req", "1");
                $("#<%=tbAttrsAndFields.ClientID %>").attr("req", "1");
                $("#<%=ddlTableName.ClientID %>").removeAttr("req");
                $("#<%=ddlField.ClientID %>").removeAttr("req");
            }
            else {
                $("[flag='ex']").hide();
                $("#<%=ddlExTable.ClientID %>").removeAttr("req");
                $("#<%=ddlFKCode.ClientID %>").removeAttr("req");
                $("#<%=tbAttrsAndFields.ClientID %>").removeAttr("req");
//                $("#<%=ddlTableName.ClientID %>").attr("req", "1");
//                $("#<%=ddlField.ClientID %>").attr("req", "1");
            }
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
//                $("#<%=ddlTableName.ClientID %>").attr("req", "1");
//                $("#<%=ddlField.ClientID %>").attr("req", "1");
            }
        }

        function getCtrlAttr(ctrl) {
            $("#<%=hiActiveStatus.ClientID %>").val(ctrl.attr("ActiveStatus"));
            $("#<%=hiDisplayStatus.ClientID %>").val(ctrl.attr("DisplayStatus"));
            $("#<%=tbID.ClientID %>").val(ctrl.attr("id"));
            $("#<%=tbCtrlType.ClientID %>").val(ctrl.attr("CtrlType"));
            if (ctrl.attr("PageWidth") != "" && ctrl.attr("PageWidth") != undefined) {
                $("#<%=tbPageWidth.ClientID %>").val(ctrl.attr("PageWidth"));
            }
            if (ctrl.attr("PageHeight") != "" && ctrl.attr("PageHeight") != undefined) {
                $("#<%=tbPageHeight.ClientID %>").val(ctrl.attr("PageHeight"));
            }

            if (ctrl.attr("SingleMutiple") != undefined && ctrl.attr("SingleMutiple") != "")
                $("#<%=ddlSingleMutiple.ClientID %>").val(ctrl.attr("SingleMutiple"));
            $("#<%=hiControlsAndFields.ClientID %>").val(ctrl.attr("ControlsAndFields"));
            if (ctrl.attr("IsSaveXml") == "True") {
                $("#<%=cbIsSaveXml.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("XReq") == "True") {
                $("#<%=cbXReq.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("SaveToExTable") == "True") {
                $("#<%=cbSaveExTable.ClientID %>").attr("checked", "checked");
            }
            $("#<%=ddlFKCode.ClientID %>").val(ctrl.attr("FKCode"));
            $("#<%=tbAttrsAndFields.ClientID %>").val(ctrl.attr("AttrsAndFields"));

            if (ctrl.attr("IsDataCustom") == "True") {
                $("#<%=cbIsDataCustom.ClientID %>").attr("checked", "checked");
                $("#<%=tbTableName.ClientID %>").val(ctrl.attr("TableName"));
                $("#<%=tbField.ClientID %>").val(ctrl.attr("Field"));
            }
            else {
                $("#<%=ddlField.ClientID %>").val(ctrl.attr("Field"));
            }
            $("#<%=ddlXmlField.ClientID %>").val(ctrl.attr("XmlField"));
            if (ctrl.attr("ResultAttr") != "" && ctrl.attr("ResultAttr") != undefined) {
                $("#<%=txtResultAttr.ClientID %>").val(ctrl.attr("ResultAttr"));
            }
            $("#<%=hiSelectorPageId.ClientID %>").val(ctrl.attr("SelectorPageId"));
            $("#<%=tbFullClassName.ClientID %>").val(ctrl.attr("FullClassName"));
            $("#<%=tbParam.ClientID %>").val(ctrl.attr("Param"));

            $("#<%=txtAppFlag.ClientID %>").val(ctrl.attr("AppFlag"));
            if (ctrl.attr("AppResultAttr") != "" && ctrl.attr("AppResultAttr") != undefined) {
                $("#<%=txtAppResultAttr.ClientID %>").val(ctrl.attr("AppResultAttr"));
            }
            $("#<%=hiAppControlsAndFields.ClientID %>").val(ctrl.attr("AppControlsAndFields"));
            $("#<%=tbDefaultValue.ClientID %>").val(ctrl.attr("DefaultValue"));
            $("#<%=ddlActs.ClientID %>").val(ctrl.attr("DefaultAct"));
        }

        function Save() {
            if (!checkReqField()) {
                return false;
            }
            var ctrl = $("#divCtrl").children();
            saveCtrlAttr(ctrl);
            $("#<%=hiXml.ClientID %>").val($("#divCtrl").html());
            parent.returnValue = $("#<%=hiXml.ClientID %>").val();
            closeWindow();
        }

        function saveCtrlAttr(ctrl) {
            var activestatus = $("#<%=hiActiveStatus.ClientID %>").val();
            var displaystatus = $("#<%=hiDisplayStatus.ClientID %>").val();
            var pagewidth = $("#<%=tbPageWidth.ClientID %>").val();
            var pageheight = $("#<%=tbPageHeight.ClientID %>").val();
            var singlemutiple = $("#<%=ddlSingleMutiple.ClientID %>").val();
            var controlsandfields = $("#<%=hiControlsAndFields.ClientID %>").val();
            var issavexml = $("#<%=cbIsSaveXml.ClientID %>").is(':checked') ? "True" : "False";
            var xreq = $("#<%=cbXReq.ClientID %>").is(':checked') ? "True" : "False";
            var isDataCustom = $("#<%=cbIsDataCustom.ClientID %>").is(':checked') ? "True" : "False";
            var field = $("#<%=ddlField.ClientID %>").val();
            var tablename = $("#<%=ddlTableName.ClientID %>").val();
            if (isDataCustom == "True") {
                field = $("#<%=tbField.ClientID %>").val();
                tablename = $("#<%=tbTableName.ClientID %>").val();
            }
            var xmlfield = $("#<%=ddlXmlField.ClientID %>").val();
            var resultattr = $("#<%=txtResultAttr.ClientID %>").val();
            var pageid = $("#<%=hiSelectorPageId.ClientID %>").val();
            var appflag = $("#<%=txtAppFlag.ClientID %>").val();
            var appresultattr = $("#<%=txtAppResultAttr.ClientID %>").val();
            var appcontrolsandfields = $("#<%=hiAppControlsAndFields.ClientID %>").val();
            var defaultvalue = $("#<%=tbDefaultValue.ClientID %>").val();
            var defaultAct = $("#<%=ddlActs.ClientID %>").val();
            var param = $("#<%=tbParam.ClientID %>").val();
            var fullClassName = $("#<%=tbFullClassName.ClientID %>").val();

            var saveextable = $("#<%=cbSaveExTable.ClientID %>").is(':checked') ? "True" : "False";
            var extable = $("#<%=ddlExTable.ClientID %>").val();
            var fkcode = $("#<%=ddlFKCode.ClientID %>").val();
            var attrandefields = $("#<%=tbAttrsAndFields.ClientID %>").val();
            ctrl.css("border", "");
            ctrl.attr({ CanSave: "1", ActiveStatus: activestatus, DisplayStatus: displaystatus, PageWidth: pagewidth, PageHeight: pageheight,
                SingleMutiple: singlemutiple, ControlsAndFields: controlsandfields,
                IsSaveXml: issavexml, XReq: xreq, TableName: tablename, Field: field,IsDataCustom: isDataCustom,
                XmlField: xmlfield, ResultAttr: resultattr, SelectorPageId: pageid, FullClassName: fullClassName, Param: param,
                AppFlag: appflag, AppResultAttr: appresultattr, AppControlsAndFields: appcontrolsandfields,
                DefaultValue: defaultvalue, DefaultAct: defaultAct,
                SaveToExTable: saveextable, ExTableCode: extable, FKCode: fkcode, AttrsAndFields: attrandefields
            })
        }

        $("#<%=cbIsDataCustom.ClientID %>").live("click", function () {
            setDataAttr();
        })

        function setTableFieldAttr() {
            var isSaveXml = $("#<%=cbIsSaveXml.ClientID %>").is(':checked');
            if (isSaveXml) {
                $("#trTableField").show();
                $("#<%=ddlXmlField.ClientID %>").attr("req", "1");
            }
            else {
                $("#trTableField").hide();
                $("#<%=ddlXmlField.ClientID %>").removeAttr("req");
            }
        }

        function addCtrlAndField() {
            if ($("#<%=tbCtrl.ClientID %>").val() == "" || $("#<%=tbRefField.ClientID %>").val() == "") {
                alert("请先选择好控件和字段再添加！");
                return false;
            }
            return true;
        }

        function addAppCtrlAndField() {
            if ($("#<%=tbAppCtrl.ClientID %>").val() == "" || $("#<%=tbAppField.ClientID %>").val() == "") {
                alert("请先选择好控件和字段再添加！");
                return false;
            }
            return true;
        }

        $("#<%=ddlControls.ClientID %>").live("change", function () { $("#<%=tbCtrl.ClientID %>").val($(this).val()) });
        $("#<%=ddlRefFields.ClientID %>").live("change", function () { $("#<%=tbRefField.ClientID %>").val($(this).val()) });
        $("#<%=ddlAppCtrls.ClientID %>").live("change", function () { $("#<%=tbAppCtrl.ClientID %>").val($(this).val()) });


        function setParam() {
            var pageId = $("#<%=hiSelectorPageId.ClientID %>").val();
            var json = { PageId: pageId };
            var url = buildQueryUrl("sys/CommonExpEditor.aspx", json);
            var re = showModal(url, $("#<%=tbParam.ClientID %>").val(), 800, 400);
            if (checkReturn(re)) {
                $("#<%=tbParam.ClientID %>").val(re);
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
            <asp:LinkButton runat="server" ID="btnCancel" class="kpms-btn" OnClientClick="closeWindow();return false;">
                            <span>取消</span>
            </asp:LinkButton>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
