<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductBatchDSpecialPower.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductBatchDSpecialPower" Title="成品批量下载特殊岗位人员配置"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                人员工号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserCode" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="UserCode" ShowAttrs="name,UserCode" ResultForControls="{'hiUserID':'id','txtUserName':'name','txtDeptName':'DEPTNAME','hiDeptID':'DEPTID','txtOrgName':'OrgUnitName','hiOrgID':'OrgUnitId'}"
                    tablename="EPMS_ProductBatchDSpecial" req="1" PageWidth="850" field="UserCode"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserID" tablename="EPMS_ProductBatchDSpecial"
                    field="UserID" />
            </td>
            <td class="td-l">
                人员姓名
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtUserName" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" tablename="EPMS_ProductBatchDSpecial" field="UserName" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                所属部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtDeptName" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" tablename="EPMS_ProductBatchDSpecial" field="DeptName" />
                <input type="hidden" runat="server" id="hiDeptID" tablename="EPMS_ProductBatchDSpecial"
                    field="DeptID" />
            </td>
            <td class="td-l">
                所属科室
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtOrgName" activestatus="(23.*)" readonly="readonly"
                    class="kpms-textbox" tablename="EPMS_ProductBatchDSpecial" field="OrgName" />
                <input type="hidden" runat="server" id="hiOrgID" tablename="EPMS_ProductBatchDSpecial"
                    field="OrgID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否限定项目类型<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <asp:RadioButtonList ID="rdblIsDistinctProj" runat="server" field="IsDistinctProj"
                    tablename="EPMS_ProductBatchDSpecial" ActiveStatus="(23.*)" RepeatDirection="Horizontal"
                    req="1">
                    <asp:ListItem Value="是">是</asp:ListItem>
                    <asp:ListItem Value="否">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                有权限的项目类型
            </td>
            <td class="td-r" colspan="3">
                <asp:CheckBoxList runat="server" ID="cblProjType" RepeatDirection="Horizontal" activestatus="(23.*)"
                    RepeatColumns="6">
                </asp:CheckBoxList>
                <input type="hidden" id="hiProjectTypeCodes" runat="server" tablename="EPMS_ProductBatchDSpecial"
                    field="ProjectTypeCodes" />
                <input type="hidden" id="hiProjectTypes" runat="server" tablename="EPMS_ProductBatchDSpecial"
                    field="ProjectTypes" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否指定项目<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <asp:RadioButtonList ID="rdblIsSpecifyProject" runat="server" field="IsSpecifyProject"
                    tablename="EPMS_ProductBatchDSpecial" ActiveStatus="(23.*)" RepeatDirection="Horizontal"
                    req="1" OnSelectedIndexChanged="rdblIsSpecifyProject_OnSelectedIndexChanged" AutoPostBack="True">
                    <asp:ListItem Value="是">是</asp:ListItem>
                    <asp:ListItem Value="否">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="1">
                <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ResultForControls="{'hidSpecifyProjectID':'id','txtSpecifyProjectCode':'ProjectCode'}"
                    TableName="EPMS_ProductBatchDSpecial" Field="SpecifyProjectName" activestatus="(23.*)"
                    ></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hidSpecifyProjectID" tablename="EPMS_ProductBatchDSpecial"
                    field="SpecifyProjectID" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtSpecifyProjectCode" class="kpms-textbox"  tablename="EPMS_ProductBatchDSpecial" field="SpecifyProjectCode" activestatus="(23.*)" readonly="readonly"/>
                
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="1024" TableName="EPMS_ProductBatchDSpecial"
                    Field="Memo" ActiveStatus="(23.*)" EnableTheming="false" CssClass="kpms-textarea"
                    TextMode="MultiLine" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProductBatchDSpecialID" runat="server" tablename="EPMS_ProductBatchDSpecial"
        field="ProductBatchDSpecialID" />
    <script type="text/javascript">
        $(document).ready(function () {
            //保存之前去验证所有字段是否符合
            $("#<%=rdblIsSpecifyProject.ClientID %>").click(function() {
                var a = $("#<%=rdblIsSpecifyProject.ClientID %>").find("[checked]").val();
                //alert(a);
            });
        })

    </script>
</asp:Content>
