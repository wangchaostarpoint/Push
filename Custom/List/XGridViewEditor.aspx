<%@ Page Title="列表控件属性设置页面" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XGridViewEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XGridViewEditor" %>


<asp:Content ID="Content1" ContentPlaceHolderID="Content" runat="server">
    <table width="100%">
        <tr>
            <td>
                <asp:ScriptManager ID="ScriptManager1" runat="server">
                </asp:ScriptManager>
                <div id="templateTabs">
                    <ul>
                        <li><a href='#control' id='acontrol'>控件属性</a></li>
                        <li><a href='#gridview' id='agridview'>列表配置</a></li>
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
                                                style="width: 100px" />
                                        </td>
                                        <td class="td-l">
                                            控件类型
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" readonly="readonly" id="tbCtrlType" class="kpms-textbox"
                                                style="width: 100px" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            列表名称<span class="req-star">*</span>
                                        </td>
                                        <td class="td-r">
                                            <input type="text" runat="server" req="1" id="tbGridName" class="kpms-textbox" style="width: 100px" />
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4" class="tz-title">
                                            扩展属性
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            在移动端编辑
                                        </td>
                                        <td class="td-m">
                                            <asp:CheckBox runat="server" ID="cbOnMobile" Text="是" />
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-m">
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            移动端禁用新建删除
                                        </td>
                                        <td class="td-m">
                                            <asp:CheckBox runat="server" ID="cbBanAddDelete" Text="是" />
                                        </td>
                                        <td class="td-l">
                                            移动端自动添加行
                                        </td>
                                        <td class="td-m">
                                            <asp:CheckBox runat="server" ID="cbAutoAdd" Text="是" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            行权限类型
                                        </td>
                                        <td class="td-m">
                                            <asp:DropDownList runat="server" ID="ddlRowAclType" Width="100px">
                                                <asp:ListItem Value="">请选择</asp:ListItem>
                                                <asp:ListItem>@UserId</asp:ListItem>
                                                <asp:ListItem>@OrganizationId</asp:ListItem>
                                                <asp:ListItem>@DeptId</asp:ListItem>
                                            </asp:DropDownList>
                                             <asp:TextBox runat="server" ID="tbRowAclType" Width="100px"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                            行权限字段
                                        </td>
                                        <td class="td-m">
                                            <asp:TextBox runat="server" ID="tbRowAclField"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            PC端控制权限
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:CheckBoxList runat="server" ID="cbAuthority" RepeatDirection="Horizontal">
                                                <asp:ListItem>查看</asp:ListItem>
                                                <asp:ListItem>新建</asp:ListItem>
                                                <asp:ListItem>编辑</asp:ListItem>
                                                <asp:ListItem>删除</asp:ListItem>
                                            </asp:CheckBoxList>
                                        </td>
                                    </tr>
                                    <tr id="trIsOpen" style="display: none">
                                        <td class="td-l">
                                            打开新的页面(编辑、查看)
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:CheckBox runat="server" ID="cbOpenPage" Text="是" />
                                        </td>
                                    </tr>
                                    <tr id="trCreateText" style="display: none">
                                        <td class="td-l">
                                            新建按钮Text<span class="req-star">*</span>
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:TextBox runat="server" ID="tbCreateText" CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="trEditorPage" style="display: none">
                                        <td class="td-l">
                                            编辑页面<span class="req-star">*</span>
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <table cellpadding='0' cellspacing='0' width="85%">
                                                <tr>
                                                    <td>
                                                        <input type="hidden" runat="server" id="hiEditorPage" />
                                                        <zhongsoft:XHtmlInputText type="text" ID="txtEditorPage" runat="server" readonly="readonly"
                                                            style="width: 100%" MaxLength="250" class="kpms-textbox">
                                                        </zhongsoft:XHtmlInputText>
                                                    </td>
                                                    <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                        <asp:LinkButton runat="server" ID="btnEditorPage" OnClientClick="return setEditorPage();"
                                                            OnClick="btnEditorPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                                            CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                        </asp:LinkButton>
                                                    </td>
                                                </tr>
                                            </table>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="gridview">
                        <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                            <ContentTemplate>
                                <table class="tz-table">
                                    <tr>
                                        <td class="td-l">
                                            列表实体表
                                        </td>
                                        <td class="td-m">
                                            <asp:DropDownList runat="server" ID="ddlMainTableCode"  Width="200px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlMainTableCode_Change">
                                            </asp:DropDownList>
                                        </td>
                                        <td class="td-l">
                                            关联主表字段
                                        </td>
                                        <td class="td-m">
                                            <asp:DropDownList runat="server" ID="ddlFKCode" Width="200px">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            可选数据源
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:DropDownList runat="server" ID="ddlDataTableCode" Width="200px" AutoPostBack="true"
                                                OnSelectedIndexChanged="ddlDataTableCode_Changed">
                                            </asp:DropDownList>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            字段
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:ListBox ID="lbxField" runat="server" SelectionMode="Multiple" Width="200px"
                                                Height="85px"></asp:ListBox>
                                            <asp:Button ID="btnSelect" runat="server" Text="添加" OnClick="btnSelect_Click" ActiveStatus="(23.*)"
                                                DisplayStatus="(23.*)" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="4">
                                            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                                                UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound">
                                                <Columns>
                                                    <asp:TemplateField HeaderText="列名" HeaderStyle-Width="100px">
                                                        <ItemTemplate>
                                                            <asp:TextBox runat="server" ID="tbHeaderText" Text='<%#Eval("HeaderText") %>' Content="HeaderText"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="字段编号" Visible="false">
                                                        <ItemTemplate>
                                                            <asp:Label runat="server" ID="lblDispCode" Text='<%#Eval("DispCode") %>' Content="DispCode"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="字段别名" HeaderStyle-Width="200px">
                                                        <ItemTemplate>
                                                            <asp:TextBox runat="server" ID="tbAliasCode" Text='<%#Eval("DataField") %>' req="1"
                                                                Content="AliasCode" regex="^[a-zA-Z_0-9]*$" errmsg="字段别名只能由字母、数字和'_'组成"></asp:TextBox>
                                                            <asp:Label runat="server" ID="lblDataType" Text='<%#Eval("Type") %>' Style="display: none"
                                                                Content="DataType"></asp:Label>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="列宽" HeaderStyle-Width="50px">
                                                        <ItemTemplate>
                                                            <asp:TextBox runat="server" ID="tbWidth" Width="40px" Content="Width" regex="^\d*$"
                                                                errmsg="列宽只能填写非负整数" MaxLength="4" ActiveStatus="(23.*)" Style="text-align: right"></asp:TextBox>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="是否<br/>显示" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <asp:CheckBox runat="server" ID="cbIsShow" Content="IsShow" AutoPostBack="true" />
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="数据转换" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <input type="hidden" runat="server" id="hiConverter" flag="color" content="Converter" />
                                                            <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetConverter" ToolTip="数据转换"
                                                                Text="设置">
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="编辑属性" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <input type="hidden" runat="server" id="hiEdit" flag="color" content="Edit" />
                                                            <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetEdit" ToolTip="编辑属性"
                                                                Text="设置">
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="移动">
                                                        <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbUp" runat="server" EnableTheming="false" CommandName="Up">
						 <img  alt="上移"  src="../../themes/images/fleximages/uup.png" title="上移"  />
                                                            </asp:LinkButton>
                                                            <asp:LinkButton ID="lbDown" runat="server" EnableTheming="false" CommandName="Down">
						 <img  alt="下移"  src="../../themes/images/fleximages/ddn.png" title="下移"  />
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                    <asp:TemplateField HeaderText="删除">
                                                        <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                                                        <ItemTemplate>
                                                            <asp:LinkButton ID="lbDelete" runat="server" EnableTheming="false" CommandName="DeleteData">
						 <img onclick="if(!confirm('确认要删除吗？')) return false;" src="../../themes/images/btn_dg_delete.gif"  />
                                                            </asp:LinkButton>
                                                        </ItemTemplate>
                                                    </asp:TemplateField>
                                                </Columns>
                                            </zhongsoft:LightPowerGridView>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class="td-l">
                                            SQL语句
                                        </td>
                                        <td class="td-m" colspan="3">
                                            <asp:TextBox runat="server" ID="tbSQL" CssClass="kpms-textarea" EnableTheming="false"
                                                TextMode="MultiLine" req="1"></asp:TextBox>
                                            <span class="req-star">与主表的关联主键Id参数为@bizId</span>
                                        </td>
                                    </tr>
                                </table>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </div>
                    <div id="form">
                        <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
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
                                                            Height="100px"></asp:ListBox>
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
                                                        <asp:LinkButton runat="server" ID="btnDeleteDisplayStatus" CssClass="kpms-btn" OnClick="btnDeleteDisplayStatus_Click"><span>删除</span></asp:LinkButton>
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
            setReq();
            setFKReq();
            $("#divCtrl").html($("#<%=hiXml.ClientID %>").val());
        })

        $("#<%=ddlRowAclType.ClientID %>").on("change", function () {
            $("#<%=tbRowAclType.ClientID %>").val($(this).val());
        });

        function initCustomerPlugin() {
            $('#templateTabs').tabs();
            checkRegex();
            setReq();
            setFKReq();
            if ("<%=FormType %>" != "XForm") { $("#aform").hide(); }
            $("#<%=gvList.ClientID%> input[flag='color']").each(function () {
                if ($(this).val() == "") {
                    $(this).next().css("color", "");
                }
                else {
                    $(this).next().css("color", "blue");
                }
            })
        }

        function getCtrlAttr(ctrl) {
            $("#<%=hiActiveStatus.ClientID %>").val(ctrl.attr("ActiveStatus"));
            $("#<%=hiDisplayStatus.ClientID %>").val(ctrl.attr("DisplayStatus"));
            $("#<%=tbID.ClientID %>").val(ctrl.attr("id"));
            $("#<%=tbCtrlType.ClientID %>").val(ctrl.attr("CtrlType"));
            $("#<%=tbGridName.ClientID %>").val(ctrl.attr("GridName"))

            $("#<%=cbAuthority.ClientID %> input[type=checkbox]").each(function () {
                var text = $(this).next().html();
                if (text == "新建" && ctrl.attr("HasCreate") == "True")
                    $(this).attr("checked", true);
                else if (text == "查看" && ctrl.attr("HasRead") == "True")
                    $(this).attr("checked", true);
                else if (text == "编辑" && ctrl.attr("HasEdit") == "True")
                    $(this).attr("checked", true);
                else if (text == "删除" && ctrl.attr("HasDelete") == "True")
                    $(this).attr("checked", true);
            })
            if (ctrl.attr("IsOpenPage") == "True") {
                $("#<%=cbOpenPage.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("EditOnMobile") == "True") {
                $("#<%=cbOnMobile.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("IsAutoAdd") == "True") {
                $("#<%=cbAutoAdd.ClientID %>").attr("checked", "checked");
            }
            if (ctrl.attr("BanAddDelete") == "True") {
                $("#<%=cbBanAddDelete.ClientID %>").attr("checked", "checked");
            }
            $("#<%=tbSQL.ClientID %>").val(ctrl.attr("SQL"));
            $("#<%=tbCreateText.ClientID %>").val(ctrl.attr("CreateText"));
            $("#<%=hiEditorPage.ClientID %>").val(ctrl.attr("EditorPage"));
            $("#<%=tbRowAclType.ClientID %>").val(ctrl.attr("RowAclType"));
            $("#<%=tbRowAclField.ClientID %>").val(ctrl.attr("RowAclField"));
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

        function saveCtrlAttr(ctrl) {
            var activestatus = $("#<%=hiActiveStatus.ClientID %>").val();
            var displaystatus = $("#<%=hiDisplayStatus.ClientID %>").val();
            var datatablecode = $("#<%=ddlMainTableCode.ClientID %>").val();
            var fkcode = $("#<%=ddlFKCode.ClientID %>").val();
            var gridname = $("#<%=tbGridName.ClientID %>").val();
            var hascreate = "False";
            var hasread = "False";
            var hasedit = "False";
            var hasdelete = "False";
            $("#<%=cbAuthority.ClientID %> input[type=checkbox]:checked").each(function () {
                var text = $(this).next().html();
                if (text == "新建")
                    hascreate = "True";
                else if (text == "查看")
                    hasread = "True";
                else if (text == "编辑")
                    hasedit = "True";
                else if (text == "删除")
                    hasdelete = "True";
            })
            var isopenpage = $("#<%=cbOpenPage.ClientID %>").is(':checked') ? "True" : "False";
            var editonmobile = $("#<%=cbOnMobile.ClientID %>").is(':checked') ? "True" : "False";
            var isAutoAdd = $("#<%=cbAutoAdd.ClientID %>").is(':checked') ? "True" : "False";
            var banAddDelete = $("#<%=cbBanAddDelete.ClientID %>").is(':checked') ? "True" : "False";

            var boundFields = getBoundFileds();
            var sql = $("#<%=tbSQL.ClientID %>").val();
            var createtext = $("#<%=tbCreateText.ClientID %>").val();
            var editorpage = $("#<%=hiEditorPage.ClientID %>").val();
            var rowacltype = $("#<%=tbRowAclType.ClientID %>").val();
            var rowaclfield = $("#<%=tbRowAclField.ClientID %>").val();

            var cvArray = new Array();
            var eidtArray = new Array();
            var cvs = $("#<%=gvList.ClientID %> [Content='Converter']");
            var edits = $("#<%=gvList.ClientID %> [Content='Edit']");
            for (var i = 0; i < cvs.length; i++) {
                cvArray.push(cvs.eq(i).val());
                eidtArray.push(edits.eq(i).val());
            }
            ctrl.css("border", "");
            ctrl.attr({ CanSave: "1", ActiveStatus: activestatus, DisplayStatus: displaystatus, DataTableCode: datatablecode, BoundFields: boundFields,
                HasCreate: hascreate, HasRead: hasread, HasEdit: hasedit, HasDelete: hasdelete,
                SQL: sql, CreateText: createtext, EditorPage: editorpage, GridName: gridname, EditOnMobile: editonmobile, IsAutoAdd: isAutoAdd,
                BanAddDelete: banAddDelete, IsOpenPage: isopenpage, FKCode: fkcode, RowAclType: rowacltype, RowAclField: rowaclfield,
                CvArray: encodeURI(JSON.stringify(cvArray)), EidtArray: encodeURI(JSON.stringify(eidtArray))
            })
        }

        $("#<%=cbOnMobile.ClientID %>").live("click", function () {
            setFKReq();
        })

        $("#<%=cbBanAddDelete.ClientID %>").live("click", function () {
            setFKReq();
        })

        function setFKReq() {
            var edit = $("#<%=cbOnMobile.ClientID %>").is(':checked');
            var banadd = $("#<%=cbBanAddDelete.ClientID %>").is(':checked');
            if (edit && !banadd) {
                $("#<%=ddlFKCode.ClientID %>").attr("req", "1");
            }
            else {
                $("#<%=ddlFKCode.ClientID %>").removeAttr("req");
            }

        }

        $("#<%=cbAuthority.ClientID %>").live("click", function () {
            setReq();
        })

        $("#<%=cbOpenPage.ClientID %>").live("click", function () {
            setReq();
        })

        function setReq() {
            var needpage = false;
            var iscreate = false;
            var needopen = false;
            $("#<%=cbAuthority.ClientID %> input[type=checkbox]:checked").each(function () {
                var text = $(this).next().html();
                if (text == "新建")
                    iscreate = true;
                if (text == "新建" || text == "查看" || text == "编辑") {
                    needopen = true;
                    if ($("#<%=cbOpenPage.ClientID %>").is(':checked')) {
                        needpage = true;
                    }
                }
            })
            if (iscreate) {
                $("#trCreateText").show();
                $("#<%=tbCreateText.ClientID %>").attr("req", "1");
            }
            else {
                $("#trCreateText").hide();
                $("#<%=tbCreateText.ClientID %>").removeAttr("req");
            }
            if (needopen) {
                $("#trIsOpen").show();
            }
            else {
                $("#trIsOpen").hide();
            }
            if (needpage) {
                $("#<%=txtEditorPage.ClientID %>").attr("req", "1");
                $("#trEditorPage").show();
            }
            else {
                $("#<%=txtEditorPage.ClientID %>").removeAttr("req");
                $("#trEditorPage").hide();
            }
        }

        function getBoundFileds() {
            var headerTexts = $("#<%=gvList.ClientID %> [Content='HeaderText']");
            var dispCodes = $("#<%=gvList.ClientID %> [Content='DispCode']");
            var aliasCodes = $("#<%=gvList.ClientID %> [Content='AliasCode']");
            var dataTypes = $("#<%=gvList.ClientID %> [Content='DataType']");
            var widths = $("#<%=gvList.ClientID %> [Content='Width']");
            var isShows = $("#<%=gvList.ClientID %> [Content='IsShow']");
            var boundFields = "";
            for (var i = 0; i < headerTexts.length; i++) {
                boundFields += headerTexts.eq(i).val() + ";";
                boundFields += dispCodes.eq(i).text() + ";";
                boundFields += aliasCodes.eq(i).val() + ";";
                boundFields += dataTypes.eq(i).text() + ";";
                boundFields += widths.eq(i).val() + ";";
                if (i != headerTexts.length - 1) {
                    boundFields += (isShows.eq(i).html().indexOf("checked") > -1 ? "True" : "False") + "|";
                }
                else boundFields += isShows.eq(i).html().indexOf("checked") > -1 ? "True" : "False";
            }
            return boundFields;
        }


        $("#<%=gvList.ClientID %> [Content='HeaderText']").live("blur", function () {
            var value = $(this).val();
            if (value.indexOf('|') != -1 || value.indexOf(';') != -1) {
                alert("列名不能包含“|”和“;”");
                $(this).val("");
            }
        })

        function setEditorPage() {
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", null);

            var re = showModal(encodeURI(url), $("#<%=hiEditorPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiEditorPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }


        function setDataConverter(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", { Convert: "1" });
            var re = showModal(encodeURI(url), json, 600, 300);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }
            return false
        }


        function setEdit(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/FieldEditAttrEditor.aspx", { TableCode: $("#<%=ddlMainTableCode.ClientID %>").val() });
            var re = showModal(encodeURI(url), json, 600, 300);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }
            return false
        }
       
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel4" UpdateMode="Conditional">
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
