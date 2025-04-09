<%@ Page Title="工代服务记录详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="GDServiceRecordEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.GDManage.GDServiceRecordEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工程名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" IsMutiple="false" req="1"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectPlace':'ProjectPlace'}" AfterSelect="afterSelect()"
                    EnableTheming="false" Text="选择工程" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" TableName="EPMS_GDServiceRecord" Field="ProjectName" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_GDServiceRecord" field="OrganizationID" />
                <asp:LinkButton runat="server" ID="btnBindSpec" OnClick="btnBindSpec_OnClick" Visible="false" />
            </td>
        </tr>
        <tr>
            <td class="td-l">工程所在地</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectPlace" readonly="readonly" class="kpms-textbox" runat="server" MaxText="128" TableName="EPMS_GDServiceRecord" Field="ProjectPlace" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">服务开始日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" compare="1" ID="txtServiceStartDate" runat="server" readonly="readonly" TableName="EPMS_GDServiceRecord" Field="ServiceStartDate" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">服务结束日期</td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" compare="1" ID="txtServiceEndDate" runat="server" readonly="readonly" TableName="EPMS_GDServiceRecord" Field="ServiceEndDate" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">专业</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" TableName="EPMS_GDServiceRecord" Field="SpecialtyID" ActiveStatus="(23.*)" OnSelectedIndexChanged="ddlSpecialty_OnSelectedIndexChanged" AutoPostBack="True" />
                <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_GDServiceRecord" field="SpecialtyName" />
            </td>
            <td class="td-l">工代</td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsGDUserName" IsMutiple="False" FilterFunction="selectFilter()"
                    SelectPageMode="Dialog" ActiveStatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                    DoCancel="true" ResultAttr="name" ShowAttrs="name,LoginId" ResultForControls="{'hiGDUserID':'id'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value" TableName="EPMS_GDServiceRecord" Field="GDUserName" />
                <input type="hidden" id="hiGDUserID" name="hiGDUserID" runat="server" tablename="EPMS_GDServiceRecord" field="GDUserID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">服务内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbContent" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" Height="150PX" runat="server" MaxText="1024" TableName="EPMS_GDServiceRecord" Field="Content" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_GDServiceRecord" field="Flag" value="1" />
    <input type="hidden" id="hiGDServiceRecordID" name="hiGDServiceRecordID" runat="server" tablename="EPMS_GDServiceRecord" field="GDServiceRecordID" />



    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function afterSelect() {
            <%=this.Page.ClientScript.GetPostBackEventReference(btnBindSpec, "")%>;
        }

        //设总筛选
        function selectFilter() {
            var deptID = '<%=KPMSUser.DeptId%>';
            return "{DeptID:'" + deptID + "'}";
        }
    </script>
</asp:Content>
