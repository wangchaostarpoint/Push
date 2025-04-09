<%@ Page Title="Excel导入配置" MasterPageFile="~/UI/Master/ObjectEditor.Master" Language="C#" AutoEventWireup="true" CodeBehind="ExcelImportEditor.aspx.cs" Inherits="Zhongsoft.Portal.WHHelper.List.Import.List.ExcelImportEditor" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table id="table1" runat="server" class="kpms-table" width="100%">
        <tr>
            <td colspan="4" class="td-l" style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large">Excel导入配置
            </td>
        </tr>
        <tr>
            <td class="td-l">台账页面<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="losPageId" SelectPageMode="Dialog" activestatus="(23.*)"
                    SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="true" Width="100px" field="PageName" tablename="WH_Helper_ExcelImport"
                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name,UserCode"
                    IsMutiple="false" ResultForControls="{'hiPageId':'id'}" PageUrl="~/WHHelper/List/Import/Obsolete/PageSelector.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiPageId" field="PageId" tablename="WH_Helper_ExcelImport" />
            </td>
            <td class="td-l">关键字<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightTextBox ID="tbKeyWord" TableName="WH_Helper_ExcelImport" Field="KeyWord" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>

        </tr>
        <tr>
            <td class="td-l">数据库表名<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList ID="ddlTable" runat="server" AutoPostBack="True" ActiveStatus="(2.*)" OnSelectedIndexChanged="ddlTable_SelectedIndexChanged" field="TableId" tablename="WH_Helper_ExcelImport">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="HiTableName" field="TableName" tablename="WH_Helper_ExcelImport" />
            </td>
            <td class="td-l">主键<span class="req-star">*</span>
            </td>
            <td class="td-r">

                <zhongsoft:XHtmlInputText ID="tbTableKeyId" class="kpms-textbox" TableName="WH_Helper_ExcelImport" Field="TableKeyId" runat="server" ActiveStatus="(23.*)" req="1" readonly="readonly" />
            </td>
        </tr>
        <tr>
            <td class="td-l">表说明<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbTableDsc" TableName="WH_Helper_ExcelImport" Field="TableDsc" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">Sheet名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSheetName" TableName="WH_Helper_ExcelImport" Field="SheetName" runat="server" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l" rowspan="2">上传模版<span class="req-star">*</span></td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" ActiveStatus="(23.*)" displaystatus="(3.*)" OnClick="upLoadFile_Click" Multiselect="false">
                    <span>
                        <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16" height="16" />上传附件</span>
                </zhongsoft:LightFileUploader>
            </td>
        </tr>
        <tr>
            <td class="td-r" colspan="3">
                <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
            </td>
        </tr>

        <tr>
            <td colspan="4" class="td-l" style="text-align: center; background-color: #f9ffff; font-family: 微软雅黑; font-size: large">导入对应字段
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvDetail" AllowPaging="true" UseDefaultDataSource="true" AutoGenerateColumns="false" Width="100%"
                    runat="server" OnRowCommand="gvDetail_RowCommand" ShowExport="true" PageSize="15" BindGridViewMethod="BindGrid" HideFieldOnExport="编辑,查看,删除" ShowFooter="true" OnRowDataBound="gvDetail_RowDataBound" ActiveStatus="(23.*)">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                            HeaderStyle-Width="40px">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="数据库字段<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText ID="tbColumnCode" value='<%#Eval("ColumnCode") %>' class="kpms-textbox" runat="server" readonly="readonly" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="Excel列名<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbColumnName" req="1" value='<%#Eval("ColumnName") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="是否必填<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <asp:CheckBox runat="server" ID="cbIsReq" />

                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>

                        <zhongsoft:LightTemplateField HeaderText="操作">
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnDelete" runat="server" ImageUrl="~/Themes/Images/btn_dg_delete.gif" CommandName="DeleteData" ToolTip="删除" OnClientClick="if(!confirm('确认要删除吗？')) return false;" CommandArgument='<%#Eval("DetailId") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbRemark" runat="server" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="false" MaxText="512" TableName="WH_Helper_ExcelImport" Field="Remark" ActiveStatus="(23.*)" />
            </td>
        </tr>

    </table>
    <input type="hidden" runat="server" id="hiImportId" field="ImportId" tablename="WH_Helper_ExcelImport" />
    <input type="hidden" runat="server" id="HiFlag" tablename="WH_Helper_ExcelImport" field="Flag" />
    <script type="text/javascript">
        function checkForm() {
            if (<%=(int)ActionType %> == 3) {
                var grid = $("#ctl00_BusinessObjectHolder_Attachment_dlAttachment")[0];
                if (grid == "" || grid == undefined || grid.rows.length <= 0) {
                    alert("请上传模版文件！");
                    return false;
                } else {
                    return true;
                }
            }
            return true;
        }
    </script>

</asp:Content>

