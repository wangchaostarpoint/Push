<%@ Page Title="控件属性设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XFileLinkEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFileLinkEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolTip" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
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
                                            控件标识
                                        </td>
                                        <td class="td-r">
                                            <asp:TextBox runat="server" ID="tbCtrlName" CssClass="kpms-textbox" Width="150px"></asp:TextBox>
                                        </td>
                                        <td class="td-l">
                                        </td>
                                        <td class="td-r">
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
                                                <tr>
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
                                                <tr>
                                                    <td class="td-l">
                                                        FileId字段名
                                                    </td>
                                                    <td class="td-r">
                                                        <zhongsoft:LightDropDownList runat="server" ID="ddlFileIdField" Width="150px" req="1">
                                                            <asp:ListItem Value="">请选择</asp:ListItem>
                                                        </zhongsoft:LightDropDownList>
                                                    </td>
                                                    <td class="td-l">
                                                    </td>
                                                    <td class="td-r">
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
            
            $("#divCtrl").html($("#<%=hiXml.ClientID %>").val());
        })

        function initCustomerPlugin() {
            $('#templateTabs').tabs();
            checkRegex();
            if (type == "table" || type == "hidden") {
                $("#aform").hide();
            }
            if ("<%=FormType %>" != "XForm") { $("#aform").hide(); }
            if ("<%=FormType %>" == "XForm")
            { $("#trActs").show(); }

           

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


        function getCtrlAttr(ctrl) {
            $("#<%=hiActiveStatus.ClientID %>").val(ctrl.attr("ActiveStatus"));
            $("#<%=hiDisplayStatus.ClientID %>").val(ctrl.attr("DisplayStatus"));
            $("#<%=tbID.ClientID %>").val(ctrl.attr("id"));
            $("#<%=tbCtrlType.ClientID %>").val(ctrl.attr("CtrlType"));
            if (ctrl.attr("CtrlName") == "" || ctrl.attr("CtrlName") == null || ctrl.attr("CtrlName") == undefined)
                $("#<%=tbCtrlName.ClientID %>").val(ctrl.attr("id"));
            else
                $("#<%=tbCtrlName.ClientID %>").val(ctrl.attr("CtrlName"));
       
            $("#<%=ddlField.ClientID %>").val(ctrl.attr("Field"));
            $("#<%=ddlFileIdField.ClientID %>").val(ctrl.attr("FileIdField"));
        
        }



        function saveCtrlAttr(ctrl) {
            var activestatus = $("#<%=hiActiveStatus.ClientID %>").val();
            var displaystatus = $("#<%=hiDisplayStatus.ClientID %>").val();
            var ctrlname = $("#<%=tbCtrlName.ClientID %>").val();

            var fileidfield = $("#<%=ddlFileIdField.ClientID %>").val();
            var field = $("#<%=ddlField.ClientID %>").val();
            var tablename = $("#<%=ddlTableName.ClientID %>").val();
           
           
            ctrl.attr({ CanSave: "1", ActiveStatus: activestatus, DisplayStatus: displaystatus });

            ctrl.attr({ CtrlName: ctrlname, TableName: tablename, Field: field, FileIdField: fileidfield });             
            

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
