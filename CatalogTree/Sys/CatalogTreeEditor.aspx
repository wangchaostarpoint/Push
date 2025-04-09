<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CatalogTreeEditor.aspx.cs" Title="类别设置"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectDesign.CatalogTreeEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">分类编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtClassfiedCode" runat="server" maxlength="8" class="kpms-textbox"
                    req="1" field="CatalogCode" tablename="PortalCatalogSet" style="width: 70px"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">分类名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtClassfiedName" runat="server" maxlength="16" class="kpms-textbox"
                    req="1" field="CatalogName" tablename="PortalCatalogSet" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">级别<span class="req-star">*</span>
            </td>
            <td class="td-l">
                <zhongsoft:LightDropDownList runat="server" ID="ddlClassfiedLevel" field="CatalogLevel"
                    tablename="PortalCatalogSet" req="1" AutoPostBack="true" activestatus="(23.*)"
                    OnSelectedIndexChanged="ddlClassfiedLevel_SelectedIndexChanged">
                    <asp:ListItem Text="一级" Value="1"></asp:ListItem>
                    <asp:ListItem Text="二级" Value="2"></asp:ListItem>
                    <asp:ListItem Text="三级" Value="3"></asp:ListItem>
                    <asp:ListItem Text="四级" Value="4"></asp:ListItem>
                    <asp:ListItem Text="五级" Value="5"></asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">父级工作分类
            </td>
            <td class="td-l">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParentID" field="ParentID" tablename="PortalCatalogSet"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <%
            //显示项目类型、阶段
            if (!string.IsNullOrEmpty(ShowProjectTypeAndPhase))
            {
        %>
        <tr>
            <td class="td-l">项目类型
            </td>
            <td class="td-l">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamProjectType"
                    activestatus="(23.?)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiParamProjectTypeId" tablename="PortalCatalogSet" field="ParamProjectTypeId" />
            </td>
            <td class="td-l">阶段
            </td>
            <td class="td-l">
                <zhongsoft:LightDropDownList runat="server" ID="ddlParamPhase" tablename="PortalCatalogSet" field="ParamPhaseIdId"
                    activestatus="(23.?)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiParamPhaseIdId" tablename="PortalCatalogSet" field="ParamPhaseIdId" />
            </td>
        </tr>
        <%
            }
        %>
        <tr runat="server" id="trSpecialtyMaintain">
            <td class="td-l">是否区分专业<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="rbIsDistinctSpecialty" field="IsDistinctSpecialty"
                    req="1" RepeatDirection="Horizontal" tablename="PortalCatalogSet" activestatus="(23.*)" OnSelectedIndexChanged="rbIsDistinctSpecialty_SelectedIndexChanged" AutoPostBack="true">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">是否允许用户维护<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="rbIsPermitUserMaintain" field="IsPermitUserMaintain"
                    req="1" RepeatDirection="Horizontal" tablename="PortalCatalogSet" activestatus="(23.*)">
                    <asp:ListItem Text="是" Value="1"></asp:ListItem>
                    <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr runat="server" id="trBelongView">
            <td class="td-l">所属视图
            </td>
            <td class="td-m" colspan="1">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBelongView" field="BelongView" tablename="PortalCatalogSet"
                    activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">关联流程
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsForm" PageUrl="/Portal/Sys/Workflow/WfFormSelector.aspx" IsMutiple="true"
                    ResultAttr="name" ShowJsonRowColName="true" ResultForControls="{'hiFormsID':'FormID'}"
                    field="FormNames" tablename="PortalCatalogSet" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiFormsID" field="FormIDs" tablename="PortalCatalogSet" />
            </td>
        </tr>
        <tr>
            <td class="td-l">页面Url
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbUrl" field="URL" tablename="PortalCatalogSet"
                    CssClass="kpms-textbox" EnableTheming="false" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">排序
            </td>
            <td class="td-l">
                <zhongsoft:LightTextBox runat="server" ID="txtSort" field="Sort" tablename="PortalCatalogSet"
                    CssClass="kpms-textbox-money" EnableTheming="false" MaxLength="3" regex="^\d+$"
                    errmsg="请填写最多三位正整数" Width="30px" activestatus="(23.*)" />
            </td>
            <td class="td-l">是否启用
            </td>
            <td class="td-l">
                <asp:RadioButtonList runat="server" ID="rbtnFlag" RepeatDirection="Horizontal" field="Flag"
                    activestatus="(23.*)" tablename="PortalCatalogSet">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>

    </table>
    <input type="hidden" runat="server" id="hiParamDesignClassfiedID" field="CatalogID"
        tablename="PortalCatalogSet" />
    <input type="hidden" runat="server" id="hiParentID" field="ParentID" tablename="PortalCatalogSet" />
    <input type="hidden" runat="server" id="hiTreeType" field="TreeType" tablename="PortalCatalogSet" />

    <script type="text/javascript">
        function InitCustomerPlugin() {

            CheckParent();
            $("#<%=ddlClassfiedLevel.ClientID %>").live("change", function () { CheckParent() });
            checkRegex();
        }
        //控制父级工作分类是否必填
        function CheckParent() {
            var level = $("#<%=ddlClassfiedLevel.ClientID %>").val();

            if (level != "1") {
                $("#<%=ddlParentID.ClientID %>").attr("req", "1");

            }
            else {
                $("#<%=ddlParentID.ClientID %>").removeAttr("req");

            }

            return true;
        }

        function KPMSCheckSubmit() {

            var alertMsg = "";
            var code = $("#<%=txtClassfiedCode.ClientID %>").val();
            var bizID = "<%=BusinessObjectId %>";
            alertMsg = CheckCode(code, bizID);
            if (alertMsg != "" && alertMsg != null) {
                alert(alertMsg);
                return false;
            }

            return true;
        }


        //判断分类编号是否重复
        function CheckCode(code, bizId) {
            var request = null;
            try {
                request = new ActiveXObject("Msxml2.XMLHTTP");
            }
            catch (ex) {
                request = null;
            }
            if (request == null) {
                try {
                    request = new XMLHttpRequest();
                }
                catch (ex) {
                    request = null;
                }
            }
            if (request == null) {
                return;
            }
            var url = 'WorkDesignClassfiedEditor.aspx?con=check&code=' + code + "&bizID=" + bizId;
            request.open("POST", encodeURI(url), false);
            request.send();
            var responseText = request.responseText;
            return responseText;
        }


    </script>

</asp:Content>
