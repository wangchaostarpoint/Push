<%@ Page Title="流程主题设置" Language="C#" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    AutoEventWireup="true" CodeBehind="XFormObjNameEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.XFormObjNameEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="Content" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td class="td-l">
                        流程主题
                    </td>
                    <td class="td-m">
                        <input type="text" class="kpms-textbox" id="tbFormat" runat="server" req="1" style="width: 300px" />
                        <span class="req-star">形如：信息发布【{0}】，其中{0}对应设置的第一个字段</span>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        对应字段
                    </td>
                    <td class="td-m">
                        <input type="hidden" runat="server" id="hiFields" />
                        <asp:ListBox ID="boxFields" runat="server" Width="300px" Rows="6" SelectionMode="Multiple">
                        </asp:ListBox>
                        <asp:LinkButton runat="server" ID="btnDelete" CssClass="kpms-btn" OnClick="btnDelete_Click"><span>删除</span></asp:LinkButton>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        可选字段
                    </td>
                    <td class="td-m">
                        表名
                        <asp:DropDownList runat="server" ID="ddlTables" Width="100px" OnSelectedIndexChanged="ddlTables_Change"
                            AutoPostBack="true">
                        </asp:DropDownList>
                        <input type="text" runat="server" id="tbTable" class="kpms-textbox" readonly="readonly"
                            style="width: 150px" /><br />
                        字段
                        <asp:DropDownList runat="server" ID="ddlFields" Width="100px" OnSelectedIndexChanged="ddlFileds_Change"
                            AutoPostBack="true">
                        </asp:DropDownList>
                        <input type="text" runat="server" id="tbField" class="kpms-textbox" readonly="readonly"
                            style="width: 150px" />
                        <asp:LinkButton runat="server" ID="btnAdd" CssClass="kpms-btn" OnClientClick="return addField();"
                            OnClick="btnAdd_Click"><span>添加</span></asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
    <hr />
    <script type="text/javascript">

        function addField() {
            var table = $("<%=tbTable.ClientID %>").val();
            var field = $("<%=tbField.ClientID %>").val();
            if (table == "" || field == "") {
                alert("请先选择好表名和字段再添加");
                return false;
            }
            return true;
        }

        function Save() {
            if (!checkReqField()) {
                return false;
            }
            return true;
        }
        
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table">
                <tr>
                    <td colspan="4" align="right">
                        <asp:LinkButton runat="server" ID="btnSave" OnClientClick="return Save();" OnClick="btnSave_Click">
                           <span>确定</span>
                        </asp:LinkButton>
                        <asp:LinkButton runat="server" ID="btnCancel" OnClientClick="parent.returnValue = null;closeWindow();return false;">
                            <span>取消</span>
                        </asp:LinkButton>
                    </td>
                </tr>
            </table>
        </ContentTemplate>
    </asp:UpdatePanel>
</asp:Content>
