<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectCfg.Master"
    CodeBehind="ProjectCodeCheck.aspx.cs" Title="编制工程编号" Inherits="Zhongsoft.Portal.EPMS.List.Project.ProjectCodeCheck" %>

<asp:Content ID="Content1" ContentPlaceHolderID="topBar" runat="server">
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnAll"
        ToolTip="编制完成" OnClick="btnSure_Click" OnClientClick="return saveData();">
        <span runat="server" id="span1">
            <img runat="server" id="img1" src="~/Themes/Images/btn_finish.gif" alt="编制完成" width="16"
                height="16" />编制完成</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="btnCheckCode"
        ToolTip="验证" OnClick="btnCheck_Click">
        <span runat="server" id="span3">
            <img runat="server" id="img3" src="~/Themes/Images/btn_finish.gif" alt="验证" width="16"
                height="16" />验证</span>
    </asp:LinkButton>
    <asp:LinkButton runat="server" CssClass="subtoolbarlink" EnableTheming="false" ID="lbtnCancel"
        OnClientClick="cancelEdit();return false;" ToolTip="取消">
        <span runat="server" id="span2">
            <img runat="server" id="img2" src="~/Themes/Images/btn_cancel.gif" alt="取消" width="16"
                height="16" />取消</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Content" runat="server">
    <link href="../../../Themes/custom/styles/global.css" rel="stylesheet" type="text/css" />
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <asp:UpdatePanel runat="server" ID="UpdatePanel1" UpdateMode="Conditional">
        <ContentTemplate>
            <table class="tz-table" style="width: 100%">
                <tr>
                    <td class="td-l">
                        工程类别
                    </td>
                    <td class="td-r">
                        <asp:DropDownList ID="ddlPT" runat="server" Width="120px" OnSelectedIndexChanged="ddlProjectType_SelectedIndexChanged"
                            AutoPostBack="true">
                        </asp:DropDownList>
                    </td>
                    <td class="td-l">
                        工程代号
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbProjectSymbol" req="1" MaxLength="4"
                            onchange="return CreateProjectCode();" onfocus="ValidateTrue()" onblur="ValidateFalse()"></zhongsoft:LightTextBox>
                        <asp:RegularExpressionValidator ID="regvProjectNum" runat="server" Enabled="false"
                            ControlToValidate="tbProjectSymbol" ErrorMessage="请输入3位或4位数字" ValidationExpression="^[0-9]{3,4}$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                        <asp:RegularExpressionValidator ID="regvProjectNum4" runat="server" Enabled="false"
                            ControlToValidate="tbProjectSymbol" ErrorMessage="请输入4位数字" ValidationExpression="^[0-9]{4}$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        工程期数代号
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbProjectPhaseCode" MaxLength="2" onchange="return CreateProjectCode();"
                            onfocus="ValidateTrue()" onblur="ValidateFalse()"></zhongsoft:LightTextBox>
                        <asp:RegularExpressionValidator ID="regvProjectPhaseCode" runat="server" Enabled="false"
                            ControlToValidate="tbProjectPhaseCode" ErrorMessage="请输入1~99之间的数字" ValidationExpression="^[1-9]([0-9])?$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                    <td class="td-l">
                        分项工程
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbChildProject" MaxLength="2" onchange="return CreateProjectCode();"></zhongsoft:LightTextBox>
                        <asp:RegularExpressionValidator ID="regvChildProject" runat="server" Enabled="false"
                            ControlToValidate="tbChildProject" ErrorMessage="请输入1或2位数字" ValidationExpression="^[1-9]([0-9])?$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        单项工程代号
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbSingleProjectCode" MaxLength="3" onchange="return CreateProjectCode();"></zhongsoft:LightTextBox>
                        <asp:RegularExpressionValidator ID="regvSingleCode" runat="server" Enabled="false"
                            ControlToValidate="tbSingleProjectCode" ErrorMessage="请输入以字母E开头的1~99之间的数字" ValidationExpression="^E([1-9]([0-9])?)$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                    <td class="td-l">
                        设计阶段
                    </td>
                    <td class="td-r">
                        <asp:DropDownList ID="ddlPhase" runat="server" Width="120px" onchange="return CreateProjectCode();">
                        </asp:DropDownList>
                        修改版次
                        <zhongsoft:LightTextBox runat="server" ID="tbModifyNum" MaxLength="2" onchange="return CreateProjectCode();"
                            onfocus="ValidateTrue()" onblur="ValidateFalse()" Width="40px"></zhongsoft:LightTextBox>
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" Enabled="false"
                            ControlToValidate="tbModifyNum" ErrorMessage="请输入1~99之间的数字" ValidationExpression="^[1-9]([0-9])?$"
                            Display="Dynamic"></asp:RegularExpressionValidator>
                    </td>
                </tr>
            </table>
            <table class="tz-table" style="width: 100%">
                <tr>
                    <td style="text-align: right" class="td-r">
                        工程类型<asp:DropDownList ID="ddlProjectType" runat="server" Width="100px">
                        </asp:DropDownList>
                        工程名称
                        <asp:TextBox ID="tbProjectName" runat="server" Width="100px"></asp:TextBox>
                        工程编号
                        <asp:TextBox ID="tbProjectCode" runat="server" Width="100px"></asp:TextBox>
                        <asp:Button ID="btnSearch" runat="server" Text="查询" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnReset" runat="server" Text="重置" OnClick="btnReset_Click" />&nbsp;&nbsp;
                    </td>
                </tr>
                <tr>
                    <td class="td-r">
                        <zhongsoft:LightPowerGridView runat="server" ID="gvList" AllowPaging="True" Style="word-break: break-all;
                            word-wrap: break-word;" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            AllowSorting="true" DataKeyNames="OrganizationID" UseDefaultDataSource="true"
                            BindGridViewMethod="BindGrid" ShowEmptyDataHeader="true">
                            <Columns>
                                <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="设总">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="详细" HeaderStyle-Width="120px">
                                    <ItemTemplate>
                                        <asp:Label ID="lbDeptName" runat="server"></asp:Label>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
            <input type="hidden" runat="server" id="hiExpXml" />
            <input type="hidden" runat="server" id="hiProjName" />
            <input id="hiProjectCode" type="hidden" runat="server" />
        </ContentTemplate>
    </asp:UpdatePanel>
    <script type="text/javascript">
        function initCustomerPlugin() {

        }
        function saveData() {
            if (!checkReqField()) {
                return false;
            }
            CreateProjectCode();
            return true;
        }

        // 根据用户的输入实时显示生成的编号
        function CreateProjectCode() {
            var sProjectType = $("#<%=ddlPT.ClientID %>").val();
            var sProjectSymbol = $("#<%=tbProjectSymbol.ClientID %>").val();
            var sProjectPhaseCode = $("#<%=tbProjectPhaseCode.ClientID %>").val();
            var sChildProject = $("#<%=tbChildProject.ClientID %>").val();
            var sSingleProjectCode = $("#<%=tbSingleProjectCode.ClientID %>").val();
            var sPhaseCode = $("#<%=ddlPhase.ClientID %>").val();
            var sModifyNum = $("#<%=tbModifyNum.ClientID %>").val();

            var sCode = RemoveBlank(sProjectType) + RemoveBlank(sProjectSymbol) + RemoveBlank(sProjectPhaseCode);
            if (RemoveBlank(sChildProject).length > 0) {
                sCode += "(" + RemoveBlank(sChildProject) + ")";
            }
            sCode += RemoveBlank(sSingleProjectCode);
            sCode += RemoveBlank(sPhaseCode);
            sCode += RemoveBlank(sModifyNum);
            $("#<%=tbProjectCode.ClientID %>").val(sCode);
        }

        function ValidateTrue() {
            $("#<%=regvProjectPhaseCode.ClientID %>").enabled = true;
            $("#<%=regvChildProject.ClientID %>").enabled = true;
            $("#<%=regvSingleCode.ClientID %>").enabled = true;
        }

        function ValidateFalse() {
            $("#<%=regvProjectPhaseCode.ClientID %>").enabled = false;
            $("#<%=regvChildProject.ClientID %>").enabled = false;
            $("#<%=regvSingleCode.ClientID %>").enabled = false;
        }

        // 去除指定字符串中的所有空字符
        function RemoveBlank(sInput) {
            var reg = /\s/g;
            var sOutput = sInput.replace(reg, "");
            return sOutput;
        }
    </script>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="bottomBar" runat="server">
    <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
        <ContentTemplate>
        </ContentTemplate>
    </asp:UpdatePanel>
    <script>
        function closeExpWindow() {
            parent.returnValue = $("#<%=tbProjectCode.ClientID %>").val() + "|" + $("#<%=hiProjName.ClientID %>").val();
            closeWindow();
            return false;
        }
        function cancelEdit() {
            parent.returnValue = null;
            closeWindow();
        }    
    </script>
</asp:Content>
