<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductEditor.aspx.cs"
    Title="成品详细信息" MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductEditor" %>

<%@ Register Src="../../UI/Product/ProductSelect.ascx" TagName="ProductSelect" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td valign="top" style="width: 200px; height: 100%;">
                <uc1:ProductSelect ID="ProductSelect" runat="server" />
            </td>
            <td valign="top">
                <table class="tz-table" style="width: 100%">
                    <tr>
                        <td class="td-l">
                            项目名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectName" activestatus="(23.?)" Width="95%"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            项目编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" activestatus="(23.?)" Width="95%"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            任务名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbWBSName" activestatus="(23.?)" Width="95%"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            任务编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" activestatus="(23.?)" Width="95%"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            成品名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbProductName" activestatus="(23.*)" Width="95%"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            成品编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbProductCode" TableName="EPMS_ProductEntity"
                                Field="ProductCode" activestatus="(23.*)" Width="145px"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            成品类别
                        </td>
                        <td class="td-r">
                            <asp:DropDownList ID="ddlProductType" runat="server" activestatus="(23.*)">
                            </asp:DropDownList>
                        </td>
                        <td class="td-l">
                            图幅
                        </td>
                        <td class="td-r">
                            <asp:DropDownList ID="ddlMapsize" runat="server" activestatus="(23.*)">
                            </asp:DropDownList>
                        </td>
                        <td class="td-l">
                            格式
                        </td>
                        <td class="td-r">
                            <asp:DropDownList ID="ddlFileFormat" runat="server" activestatus="(23.*)" Width="95%">
                            </asp:DropDownList>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            标准张
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbStandardPage" activestatus="(23.*)"
                                DataType="Decimal2"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            文本页数
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbBookPages" activestatus="(23.*)" DataType="Integer"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            文本本数
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbTotalOfBook" activestatus="(23.*)" Width="95%"
                                DataType="Integer"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            设计人
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName" IsMutiple="true"
                                EnableTheming="false" activestatus="(23.*)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                SelectPageMode="Dialog" DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId':'id'}"
                                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="designerFilter()">
                            </zhongsoft:LightObjectSelector>
                            <input type="hidden" runat="server" id="hiDesignerId" />
                        </td>
                        <td class="td-l" colspan="2">
                            会签
                            <asp:CheckBox ID="cbIsJointlySign" runat="server" Enabled="false" />&nbsp; 套用
                            <asp:CheckBox ID="cbIsReuse" runat="server" Enabled="false" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
        OnClick="btnProductRefresh_Click" />
    <input type="hidden" runat="server" id="hiWBSType" />
    <input type="hidden" runat="server" id="hiPhaseId" />
    <script type="text/javascript">
        $("[name='fileCheck']>:checkbox").click(function () {
            $("#<%=btnProductRefresh.ClientID %>").click();
        });

        //选择设计人的筛选
        function designerFilter() {
            var bizId = '<%=BizId %>';
            return { FlowName: 1, ShowMore: "true", BizId: bizId };
        }
    </script>
</asp:Content>
