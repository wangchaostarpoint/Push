<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductDetailView.aspx.cs"
    Title="成品详细信息" MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductDetailView" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table style="width: 100%" style="border-bottom: 1px solid #cbccce;">
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('wbsInfo')">
                成品基本信息&nbsp;<img src="../../../themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td>
                <table class="tz-table" width="100%" id="wbsInfo">
                    <tr>
                        <td class="td-l">
                            项目名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectName" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="ProjectName"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            项目编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="ProjectCode"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            卷册名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbWBSName" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="WBSName"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            卷册编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbWBSCode" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="WBSCode"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            成品名称
                        </td>
                        <td class="td-m" colspan="3">
                            <zhongsoft:LightTextBox runat="server" ID="tbProductName" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="ProductName"></zhongsoft:LightTextBox>
                               <%-- 暂时隐藏预览按钮 word转PDF时word释放不了内存爆满。--%>
                            <asp:LinkButton runat="server" ID="lbtnViewFile" EnableTheming="false" Visible="false" Text="预览"
                                OnClientClick="ViewFile()"></asp:LinkButton>
                        </td>
                        <td class="td-l">
                            成品编号
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbProductCode" TableName="EPMS_ProductEntity"
                                Field="ProductCode" activestatus="(23.?)"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            成品类别
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbProductType" TableName="EPMS_ProductEntity"
                                Field="ProductType" activestatus="(23.?)"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            图幅
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbMapsize" TableName="EPMS_ProductEntity"
                                Field="Mapsize" activestatus="(23.?)"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            格式
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbFileFormat" TableName="EPMS_ProductEntity"
                                Field="FileFormat" activestatus="(23.?)"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            文本类型
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightDropDownList runat="server" ID="ddlTextType" activestatus="(23.?)"
                                TableName="EPMS_ProductEntity" Field="TextType">
                            </zhongsoft:LightDropDownList>
                        </td>
                        <td class="td-l">
                            文本页数
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbBookPages" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="BookPages"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            文本本数
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbTotalOfBook" activestatus="(23.?)" TableName="EPMS_ProductEntity"
                                Field="TotalOfBook"></zhongsoft:LightTextBox>
                        </td>
                    </tr>
                    <tr>
                        <td class="td-l">
                            标准张
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbStandardPage" activestatus="(23.?)"
                                TableName="EPMS_ProductEntity" Field="StandardPage"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-l">
                            设计人
                        </td>
                        <td class="td-r">
                            <zhongsoft:LightTextBox runat="server" ID="tbDesigner" activestatus="(23.?)"></zhongsoft:LightTextBox>
                        </td>
                        <td class="td-m" colspan="2">
                            会签
                            <asp:CheckBox ID="cbIsJointlySign" runat="server" Enabled="false" />&nbsp; 套用
                            <asp:CheckBox ID="cbIsReuse" runat="server" Enabled="false" />
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <table style="width: 100%" style="border-bottom: 1px solid #cbccce;">
        <tr>
            <td colspan="6" class="flexible" onclick="openDetail('signers')">
                校审人&nbsp;<img src="../../../Themes/Images/lright.png" />
            </td>
        </tr>
        <tr>
            <td>
                <table width="100%" id="signers">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                                PageSize="20" ShowExport="true" AutoGenerateColumns="false" AllowSorting="true"
                                UseDefaultDataSource="true" BindGridViewMethod="BindGrid" EmptyDataText="没有校审人信息">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="OperateUserName" HeaderText="校审/会签人" />
                                    <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" />
                                    <zhongsoft:LightBoundField DataField="VerifyPost" HeaderText="校审岗位" />
                                    <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业" />
                                    <zhongsoft:LightBoundField DataField="OperateFinishTime" HeaderText="校审时间" ItemStyle-HorizontalAlign="center"
                                        DataFormatString="{0:yyyy-MM-dd}" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiProductID" runat="server" tablename="EPMS_ProductEntity"
        field="ProductID" />
    <script type="text/javascript">
        //隐藏查询区域
        $("#divToolBtn").hide();
        function ViewFile() {
            var fileId = $("#<%=hiProductID.ClientID %>").val();
            var fileName = $("#<%=tbProductCode.ClientID %>").val();
            var url = "/Portal/Sys/FileView/FileViewOnline.aspx?FileID=" + fileId + "&fileName=" + fileName + "&fileType=Product";
            window.open(url);
        }
    </script>
</asp:Content>
