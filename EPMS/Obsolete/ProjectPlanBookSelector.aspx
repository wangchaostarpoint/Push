<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectPlanBookSelector.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Obsolete.ProjectPlanBookSelector" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    Title="历史工程文件" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <table>
        <tr>
            <td>
                任务类型
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSType" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                专业
                <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" class="kpms-ddlsearch"
                    EnableTheming="false">
                </zhongsoft:LightDropDownList>
                编号/名称
                <zhongsoft:LightTextBox runat="server" ID="tbProjectName" CssClass="kpms-textboxsearch"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvProjPlanFileList" AllowPaging="true" runat="server"
        BindJsonClick="true" OnJsonClick="addCustomerObject" JsonClickMode="onclick"
        ShowJsonRowColName="true" OnRowDataBound="gvProjPlanFileList_RowDataBound" AutoGenerateColumns="false"
        UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" />
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称" />
            <zhongsoft:LightBoundField DataField="VersionNum" HeaderText="版本" />
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" />
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" />
            <zhongsoft:LightBoundField DataField="WriteTime" HeaderText="编制日期" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightTemplateField HeaderText="下载">
                <ItemTemplate>
                    <a runat="server" id="aFileName" title='<%# Eval("ProjectName") %>' class="form-fujiana"
                        style="text-decoration: underline; color: #0033FF;">
                        <%# Eval("ProjectName")%>
                    </a>
                    <input type="hidden" runat="server" id="hiBookFiledId" value='<%#Eval("BookFiledId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>
        function addCustomerObject(json) {
            if (json["BookFiledId"] == undefined || json["BookFiledId"] == "") {
                alert("该项目没有相应的文件，请选择其它项目");
                return false;
            }
            addObject(json);
        }
    </script>
</asp:Content>
