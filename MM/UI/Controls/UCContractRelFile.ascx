<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="UCContractRelFile.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.UCContractRelFile" %>
<table class="tz-table" style="width: 100%">
    <tr>
        <td class="td-m" colspan="6" height="25" style="font-weight: bold; text-align: center">
            相关文件
        </td>
    </tr>
    <tr id="trAdd">
        <td colspan="6" style="text-align: right">
            <%--   <asp:Button EnableTheming="false" ID="btnUpload" runat="server" Text="上传相关资料" OnClick="btnAdd_Click"
                OnClientClick="return upLoadFiles()" />--%>
            <zhongsoft:LightFileUploader runat="server" ID="lbtnUpload" CssClass="subtoolbarlink"
                EnableTheming="false" OnClick="btnAdd_Click"> <span>
                            <img id="imgFile" src="../../Themes/Images/ico_fujian.gif" alt="上传相关资料" width="16"
                                height="16" />上传文件</span></zhongsoft:LightFileUploader>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" UseDefaultDataSource="true"
                AutoGenerateColumns="false" DataKeyNames="FILEDETAILID" OnRowCommand="gvList_RowCommand"
                ShowExport="true" OnExport="gvList_Export" OnRowDataBound="gvList_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="文件名称">
                        <ItemTemplate>
                            <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                <%#Eval("FILENAME")%></a>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除">
                        <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        <ItemTemplate>
                            <input type="hidden" runat="server" id="hiFilePath" value='<%#Eval("FILEPATH") %>' />
                            <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除吗？');"
                                EnableTheming="false" CommandArgument='<%#Eval("FILEDETAILID") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<script>

    function accessOfFileAddDisplay() {
        if ("<%=Enabled %>" == "<%=Boolean.FalseString %>") {
            $("#trAdd").hide();
        }
    }

    //上传文件
    function upLoadFiles() {
        showUploadForm($currBizId, "Form");
        return true;
    }

    //获取上传附件信息
    function getAttachFileNum() {
        return $("#<%=gvList.ClientID %> [id$=aFileName]").length;
    }

</script>
