<%@ Page Title="过滤设置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="AclFilterEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.AclFilterEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table runat="server" class="tz-table" id="table_fieldFilter">
        <tr>
            <td class="td-l">
                访问者
            </td>
            <td class="td-m">
                <input type="hidden" id="hiFieldOperatorExp" runat="server" />
                <table cellpadding='0' cellspacing='0'>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbFieldOperatorExp" req="1" ReadOnly="true" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="btn" OnClientClick="setFieldOperator();" OnClick="btnSetFieldOperator_Click"
                                EnableTheming="false" CssClass="btn-look-up"><img  src="../../Themes/Images/btn_fx.png"/></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                数据列
            </td>
            <td class="td-m">
                <asp:CheckBoxList runat="server" ID="cbFields" RepeatDirection="Horizontal" RepeatColumns="10"
                    req="1" CssClass="kpms-chklist">
                </asp:CheckBoxList>
                <asp:Label runat="server" ID="lblTips" CssClass="req-star" Visible="false">没有可供选择的列，请重写该页面的AclHeaderTexts属性以提供可选列。</asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                隐藏
            </td>
            <td class="td-m">
                <asp:CheckBox ID="cbVisable" Checked="true" runat="server" Text="是" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <asp:TextBox runat="server" ID="tbFieldMark" Width="400px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <table runat="server" id="table_rowFilter" class="tz-table">
        <tr>
            <td class="td-l">
                访问者
            </td>
            <td class="td-m">
                <input type="hidden" id="hiOperatorExp" runat="server" />
                <table cellpadding='0' cellspacing='0'>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbOperatorExp" req="1" ReadOnly="true" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="btnSetRowOperator" OnClientClick="setRowOperator();"
                                EnableTheming="false" CssClass="btn-look-up" OnClick="btnSetRowOperator_Click"><img  src="../../Themes/Images/btn_fx.png"/></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                表达式
            </td>
            <td class="td-m">
                <input type="hidden" id="hiSqlExp" runat="server" />
                <table cellpadding='0' cellspacing='0'>
                    <tr>
                        <td>
                            <asp:TextBox runat="server" ID="tbSqlExp" ReadOnly="true" Width="400px"></asp:TextBox>
                        </td>
                        <td>
                            <asp:LinkButton runat="server" ID="btnSetRowSql" OnClientClick="setRowSql();" EnableTheming="false"
                                CssClass="btn-look-up" OnClick="btnSetRowSql_Click"><img  src="../../Themes/Images/btn_fx.png"/></asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                说明
            </td>
            <td class="td-m">
                <asp:TextBox runat="server" ID="tbRowMark" Width="400px"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                过滤优先级
            </td>
            <td class="td-m">
                <asp:TextBox runat="server" ID="tbRowLevel" req="1" Width="400px"></asp:TextBox>
            </td>
        </tr>
    </table>
    <script>

        function setFieldOperator() {
            var condition = $("#<%=hiFieldOperatorExp.ClientID %>").val();
            var url = "/Portal/Sys/ConditionEditor.aspx?PageId=<%=SecurityObjectId %>&ExpType=AclOperator";
            var re = showModal(encodeURI(url), condition, 900, 400);
            if (re != undefined) {
                $("#<%=hiFieldOperatorExp.ClientID %>").val(re);
                return true;
            }
            return false
        }

        function setRowOperator() {
            var condition = $("#<%=hiOperatorExp.ClientID %>").val();
            var url = "/Portal/Sys/ConditionEditor.aspx?PageId=<%=SecurityObjectId %>&ExpType=AclOperator";
            var re = showModal(encodeURI(url), condition, 900, 400);
            if (re != undefined) {
                $("#<%=hiOperatorExp.ClientID %>").val(re);
                return true;
            }
            return false
        }

        function setRowSql() {
            var condition = $("#<%=hiSqlExp.ClientID %>").val();
            var url = "/Portal/Sys/ConditionEditor.aspx?PageId=<%=SecurityObjectId %>&ExpType=AclSql";
            var re = showModal(encodeURI(url), condition, 900, 400);
            if (re != undefined) {
                $("#<%=hiSqlExp.ClientID %>").val(re);
                return true;
            }
            return false
        }
    
    </script>
</asp:Content>
