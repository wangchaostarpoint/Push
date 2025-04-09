<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="NotReturnContractEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MBM.NotReturnContractEditor" MasterPageFile="~/UI/Master/ObjectEditorNew.Master" %>

<%@ Register TagPrefix="uc4" TagName="UCContractRelFile" Src="../../UI/Controls/UCContractRelFile.ascx" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                合同编号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractCode" runat="server" tablename="MCM_CONTRACTENTITY"
                    req="1" field="CONTRACTCODE" activestatus="(23.*)" MaxLength="32" />
            </td>
            <td class="td-l">
                归档编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbReturnCode" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="FILENUM" activestatus="(23.*)" MaxLength="16" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbContractName" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="CONTRACTNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractType" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="CONTRACTTYPENAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                合同相对方
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractRleatives" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="CONTRACTRELATIVESNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购申请部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbApplyDept" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="APPLYNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                采购承办部门
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUndertakeDept" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="UNDERTAKEDEPTNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                采购承办人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbUndertakePerson" runat="server" tablename="MCM_CONTRACTENTITY"
                    field="UNDERTAKEUSERNAME" ReadOnly="true" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                合同总额（万元）
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractMoney" runat="server" tablename="MCM_CONTRACTENTITY"
                    CssClass="kpms-textbox-money" EnableTheming="false" field="CONTRACTVALUE" ReadOnly="true"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                签订日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtSignDate" tablename="MCM_CONTRACTENTITY"
                    req="1" readonly="readonly" class="kpms-textbox-date" field="SIGNDATE" activestatus="(23.*)" />
            </td>
            <td class="td-l">
                录入日期<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtCreat" tablename="MCM_CONTRACTENTITY"
                    req="1" readonly="readonly" class="kpms-textbox-date" field="FILLDATE" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" Field="MEMO" tableName="MCM_CONTRACTENTITY" activestatus="(23.*)"
                    runat="server" maxtext="256" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                    Rows="5">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr runat="server" displaystatus="(3.*)">
            <td colspan="4" style="text-align: right">
                <asp:Button ID="btnUpload" runat="server" Text="上传相关资料" activestatus="(23.*)" OnClick="btnAdd_Click"
                    OnClientClick="return upLoadFiles()" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                    AutoGenerateColumns="false" DataKeyNames="FileId" OnRowCommand="gvList_RowCommand"
                    ShowExport="true" OnRowDataBound="gvList_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="文件名称">
                            <ItemTemplate>
                                <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                    <%#Eval("FileName")%></a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FilePath") %>' />
                                <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                    EnableTheming="false" CommandArgument='<%#Eval("FileId") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" height="25" style="font-weight: bold; text-align: center">
                合同相关流程
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="gvRelateForms" runat="server" AllowPaging="true"
                    PageSize="15" BindGridViewMethod="BindRelForm" AutoGenerateColumns="false" UseDefaultDataSource="true">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="FLOWNAME" HeaderText="流程名称">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CREATEUSERNAME" HeaderText="创建人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CREATEDATE" HeaderText="创建时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="查看" DataParamFields="CHECKID,ISOLD" EditItemClick="viewFlowDetail"
                            ImageUrl="../../../Themes/Images/btn_dg_view.gif" ItemStyle-Width="40px">
                        </zhongsoft:LightButtonField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiContractId" tablename="MCM_CONTRACTENTITY" field="CONTRACTID"
        runat="server" />
    <input type="hidden" id="hiIsReturn" runat="server" field="ISRETURN" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiFileSourceID" field="FILESOURCEID" tablename="MCM_CONTRACTENTITY" />
    <input type="hidden" runat="server" id="hiContractState"  field="CONTRACTSTATE" tablename="MCM_CONTRACTENTITY"/>
    <script>
        //上传文件
        function upLoadFiles() {
            var fileSourceID = $("#<%=hiFileSourceID.ClientID %>").val();
            showUploadForm(fileSourceID, "Module");
            return true;
        }

        function viewFlowDetail(bizid, isOld) {
            var urlStr = buildQueryUrl("/Custom/List/C_FormDetailLoading.aspx", { bizid: bizid, IsOld: isOld });
            window.open(urlStr);
            return false;
        }
    </script>
</asp:Content>
