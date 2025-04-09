<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="createProjectCode.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.CreateProjectCode" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table>
        <tr>
            <td class="td-l">
                工程类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectType" runat="server" ContentEditable="false"></zhongsoft:LightTextBox>
                <input type="hidden" id="hiProjectType" runat="server" />
            </td>
            <td class="td-l">
                工程代号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectSymbol" runat="server" MaxLength="4" onchange="return createProjectCode();"
                    errmsg="请输入4位数字" regex="^[0-9]{4}$" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程期数代号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbProjectPhaseCode" runat="server" MaxLength="2" onchange="return createProjectCode();"
                    regex="^[1-9]([0-9])?$" errmsg="请输入1~99之间的数字"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                分项工程
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbChildProject" runat="server" regex="^[1-9]([0-9])?$"
                    errmsg="请输入1或2位数字" MaxLength="2" onchange="return createProjectCode();"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                单项工程代号
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbSingleProjectCode" runat="server" regex="^E([1-9]([0-9])?)$"
                    errmsg="请输入以字母E开头的1~99之间的数字" MaxLength="3" onchange="return createProjectCode();"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <table>
        <tr>
            <td>
                工程类型
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" Width="100px">
                </zhongsoft:LightDropDownList>
                工程名称
                <zhongsoft:LightTextBox ID="tbProjectName" runat="server" Width="100px"></zhongsoft:LightTextBox>
                工程编号
                <zhongsoft:LightTextBox ID="tbProjectCode" runat="server" Width="60px"></zhongsoft:LightTextBox>
                <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
                <asp:Button ID="btnCheck" runat="server" Text="验证" OnClientClick="return checkCodeCanUse()" />
                <asp:Button ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" />
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <zhongsoft:LightPowerGridView ID="gvMarketProject" AllowPaging="true" PageSize="10"
                    BindGridViewMethod="BindMarketProject" runat="server" AutoGenerateColumns="false"
                    UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="工程编号">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="工程名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="PHASEINFO" HeaderText="工程阶段">
                        </zhongsoft:LightBoundField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <table class="tz-table">
        <tr>
            <td align="center" style="text-align: center">
                <asp:Button ID="btnOK" runat="server" Text="确定" OnClientClick="return checkCodeIsOK()"
                    OnClick="btnOK_Click" />
                <input id="btCancel" type="button" value="取消" onclick="javascript:window.close()" />
                <input id="hiProjectCode" type="hidden" runat="server" />
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //生成工程编号
        function createProjectCode() {
            //工程类别 
            var sProjectType = $("#<%=hiProjectType.ClientID %>").val();
            //工程代号
            var sProjectSymbol = $("#<%=tbProjectSymbol.ClientID %>").val();
            //工程期数代号
            var sProjectPhaseCode = $("#<%=tbProjectPhaseCode.ClientID %>").val();
            //分项工程
            var sChildProject = $("#<%=tbChildProject.ClientID %>").val();
            //单项工程代号
            var sSingleProjectCode = $("#<%=tbSingleProjectCode.ClientID %>").val();

            if ("<%=IsGeneralProject %>".toLowerCase() == "true") {
                sProjectType = sProjectType + "C";
            }
            //removeBlank 去除空格
            var sCode = removeBlank(sProjectType) + removeBlank(sProjectSymbol) + removeBlank(sProjectPhaseCode);
            if (removeBlank(sChildProject).length > 0) {
                sCode += "(" + removeBlank(sChildProject) + ")";
            }
            sCode += removeBlank(sSingleProjectCode);
            $("#<%=tbProjectCode.ClientID %>").val(sCode);
        }

        // 去除指定字符串中的所有空字符
        function removeBlank(sInput) {
            var reg = /\s/g;
            var sOutput = sInput.replace(reg, "");
            return sOutput;
        }

        //判断工程编号是否可用
        function checkCode() {
            var isOK = false;
            $.ajax({
                type: "POST",
                async: false,
                url: "CreateProjectCode.aspx",
                data: { asyfunc: "CheckCodeIsOK", "isGeneralProject": "<%=IsGeneralProject %>", "projectCode": $("#<%=tbProjectCode.ClientID %>").val(), "isCheck": true },
                success: function (data) {
                    isOK = data;
                },
                error: function (err) {
                    alert("验证编号出错");
                }
            })
            return isOK;
        }

        function checkCodeIsOK() {
            var isOK = checkCode();
            if (isOK == "1") {
                return true;
            }
            else if (isOK == "2") {
                alert("该项目编号【" + $("#<%=tbProjectCode.ClientID %>").val() + "】已被使用");
                return false;
            }
            else if (isOK == "3") {
                alert("该项目编号【" + $("#<%=tbProjectCode.ClientID %>").val() + "】不合法");
                return false;
            }
        }

        function checkCodeCanUse() {
            var canUse = checkCode();
            if (canUse == "1") {
                alert("该项目编号【" + $("#<%=tbProjectCode.ClientID %>").val() + "】可以使用");
            }
            else if (canUse == "2") {
                alert("该项目编号【" + $("#<%=tbProjectCode.ClientID %>").val() + "】已被使用");
            }
            else if (canUse == "3") {
                alert("该项目编号【" + $("#<%=tbProjectCode.ClientID %>").val() + "】不合法");
            }
            return false;
        }
    </script>
</asp:Content>
