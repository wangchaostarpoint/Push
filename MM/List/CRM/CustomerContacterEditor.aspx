<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CustomerContacterEditor.aspx.cs"
    Title="联系人信息" Inherits="Zhongsoft.Portal.MM.List.CRM.CustomerContacterEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="divOpenBaseInfo">
        <table class="tz-table">
            <tr>
                <td class="td-l">客户名称</td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox runat="server" ReadOnly="True" ID="tbCustomerName" activestatus="(23.*)"/>
                </td>
            </tr>
            <tr>
                <td class="td-l">姓名<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbName" TableName="MM_CUSTOMERCONTACTER" Field="ContacterName"
                        runat="server" activestatus="(23.*)" MaxLength="10" req="1"></zhongsoft:LightTextBox>
                </td>
                <td class="td-l">性别<span class="req-star">*</span></td>
                <td class="td-r">
                    <asp:RadioButtonList ID="rblSex" runat="server" TableName="MM_CUSTOMERCONTACTER"
                        activestatus="(23.*)" Field="SEX" RepeatDirection="Horizontal" req="1">
                        <asp:ListItem Value="男">男</asp:ListItem>
                        <asp:ListItem Value="女">女</asp:ListItem>
                    </asp:RadioButtonList>
                </td>
            </tr>
            <tr>
                <td class="td-l">部门<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="LightTextBox1" runat="server" tablename="MM_CUSTOMERCONTACTER"
                        field="DEPTNAME" activestatus="(23.*)" MaxLength="32" req="1"/>
                </td>
                <td class="td-l">职务<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbStation" runat="server" tablename="MM_CUSTOMERCONTACTER"
                        field="Post" activestatus="(23.*)" MaxLength="16" req="1"/>
                </td>
            </tr>
            <tr>
                <td class="td-l">办公电话<span class="req-star">*</span></td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbPhone" runat="server" tablename="MM_CUSTOMERCONTACTER"
                        field="PHONE" activestatus="(23.*)" req="1"/>
                </td>
                <td class="td-l">手机</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbMobilePhone" runat="server" class="kpms-textbox" tablename="MM_CUSTOMERCONTACTER"
                                            field="MOBILEPHONE" activestatus="(23.*)" />
                </td>
            </tr>
            <tr>
                <td class="td-l">电子邮箱</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbEmail" runat="server" tablename="MM_CUSTOMERCONTACTER"
                                            field="EMAIL" activestatus="(23.*)" Regex="^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$"
                                            ErrMsg="请输入正确的邮箱" />
                </td>
                <td class="td-l">家庭电话</td>
                <td class="td-r">
                    <zhongsoft:LightTextBox ID="tbHomePhone" runat="server" class="kpms-textbox" tablename="MM_CUSTOMERCONTACTER"
                                            field="HomePhone" activestatus="(23.*)" />
                </td>
            </tr>
            <tr>
                <td class="td-l">备注
                </td>
                <td class="td-m" colspan="3">
                    <zhongsoft:LightTextBox ID="tbMemo" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                                            tablename="MM_CUSTOMERCONTACTER" field="MEMO" activestatus="(23.*)" MaxLength="256"
                                            TextMode="MultiLine" Rows="5" />
                </td>
            </tr>
        </table>
    </div>
    
    <!--主键 -->
    <input id="hiContacterID" runat="server" field="CONTACTERID" tablename="MM_CUSTOMERCONTACTER" type="hidden" />
    <input id="hiCustomerId" runat="server" field="CustomerID" tablename="MM_CUSTOMERCONTACTER" type="hidden" />
    <input id="hiFlag" runat="server" field="Flag" tablename="MM_CUSTOMERCONTACTER" type="hidden" value="1"/>
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            if ("<%=this.ActionType %>" == "Create") {
                $("#divOpenExpendInfo").hide();
                $("#divOpenDynamicInfo").hide();
                $("#member").hide();
            }
            else {
                $("#divOpenExpendInfo").hide();
                $("#divOpenDynamicInfo").hide();
                $("#member").hide();
            }
        }

        
    </script>
</asp:Content>
