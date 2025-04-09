<%@ Page Language="C#" AutoEventWireup="true" Title="模板权限详细" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    CodeBehind="TemplatePermissionEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Sys.TemplatePermissionEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                专业信息<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_TemplatePermission"
                    Field="ParamSpecialtyID" activestatus="(23.*)" req="1" OnSelectedIndexChanged="ddlSpecialty_SelectedIndexChanged"
                    AutoPostBack="true">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiSpecialtyCode" tablename="EPMS_TemplatePermission"
                    field="SpecialtyCode" />
                <input type="hidden" runat="server" id="hiSpecialtyName" tablename="EPMS_TemplatePermission"
                    field="SpecialtyName" />
            </td>
            <td class="td-l">
                人员<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPermissionUserName" IsMutiple="false"
                    req="1" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    PageWidth="850" ResultForControls="{'hiPermissionUserID':'id'}" tablename="EPMS_TemplatePermission"
                    field="PermissionUserName" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPermissionUserID" tablename="EPMS_TemplatePermission"
                    field="PermissionUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                开始日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtStartTime" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox-date" TableName="EPMS_TemplatePermission"
                    Field="StartTime">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                结束日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtEndTime" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox-date" TableName="EPMS_TemplatePermission" Field="EndTime">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="EPMS_TemplatePermission"
                    Field="Memo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否启用
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList runat="server" ID="rblFlag" RepeatDirection="Horizontal" TableName="EPMS_TemplatePermission"
                    Field="FLAG" activestatus="(23.*)">
                    <asp:ListItem Value="1" Selected="True">启用</asp:ListItem>
                    <asp:ListItem Value="0">不启用</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input id="hikeyID" type="hidden" tablename="EPMS_TemplatePermission" field="TemplatePermissionID"
        runat="server" />
    <script type="text/javascript">
       
    </script>
</asp:Content>
