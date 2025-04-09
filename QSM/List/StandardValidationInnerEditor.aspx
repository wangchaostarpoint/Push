<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StandardValidationInnerEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.QSM.List.StandardValidationInnerEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                编制人
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiDraftManID" field="DraftManID" tablename="EPMS_StandardValidationInnerManage" />
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtDraftManName" readonly="readonly"
                    class="kpms-textbox" style="width: 80px" field="DraftManName" tablename="EPMS_StandardValidationInnerManage"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                编制部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtDraftDeptName" readonly="readonly"
                    class="kpms-textbox" field="DraftDeptName" tablename="EPMS_StandardValidationInnerManage"
                    activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiDraftDeptID" field="DraftDeptID" tablename="EPMS_StandardValidationInnerManage" />
            </td>
            <td class="td-l">
                编制日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtDraftDate" readonly="readonly"
                    class="kpms-textbox" style="width: 70px" field="DraftDate" tablename="EPMS_StandardValidationInnerManage"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评审类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightDropDownList ID="ddlValidationType" runat="server" field="ValidationType"
                    tablename="EPMS_StandardValidationInnerManage" activestatus="(23.*)"
                    req="1"> 
                </zhongsoft:LightDropDownList>--%>
                <zhongsoft:XHtmlInputText type="text" runat="server" ID="txtValidationType" readonly="readonly"
                    class="kpms-textbox" field="ValidationType" tablename="EPMS_StandardValidationInnerManage"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                审核年度<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightDropDownList ID="ddlValidationYear" runat="server" field="ValidationYear"
                    tablename="EPMS_StandardValidationInnerManage" activestatus="(23.*)" req="1"
                    Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评审报告名称<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbValidationContent" field="ValidationContent"
                    maxtext="512" tablename="EPMS_StandardValidationInnerManage" activestatus="(23.*)"
                    CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="Remark" maxtext="512"
                    tablename="EPMS_StandardValidationInnerManage" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine"></zhongsoft:LightTextBox>
            </td>
        </tr>
          <tr>
            <td class="td-l">
                文件
            </td>
            <td class="td-r" colspan="7">
                <asp:ImageButton ID="ibtnUpload" runat="server" ImageUrl="../../Themes/Images/btn_dg_upfile.gif"
                    DisplayStatus="(23.*)" Style="cursor: hand;" ToolTip="点此上传文件" OnClientClick="ShowUpload();"
                    OnClick="ibtnUpload_Click" />
                <zhongsoft:LightPowerGridView ID="gvListFile" runat="server" AllowPaging="true" PageSize="10"
                    DataKeyNames="SystemPublicFileDetailID" AutoGenerateColumns="false" OnRowCommand="gvListFile_RowCommand"
                    OnRowDataBound="gvListFile_RowDataBound">
                    <FooterStyle CssClass="kpms-borrowaggregate" />
                    <PagerStyle CssClass="kpms-borrowbottom" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle CssClass="kpms-borrowheader" Font-Bold="True" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>
                    <AlternatingRowStyle CssClass="kpms-borrowbody-ji" />
                    <RowStyle CssClass="kpms-borrowbody-ou" />
                    <Columns>
                        <asp:TemplateField HeaderText="文件名" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <a href="/portal/sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("fileId") %>"
                                    target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline;
                                    color: #0033FF;">
                                    <%# Eval("FileName") %>
                                </a>
                                <asp:LinkButton ID="LinkButton1" runat="server" CommandName="down" CommandArgument='<%#Eval("fileId") %>'
                                    Visible="false"><%# Eval("FileName") %></asp:LinkButton>
                            </ItemTemplate>
                        </asp:TemplateField> 
                        <asp:BoundField DataField="CreateUserName" HeaderText="创建人" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="100px" />
                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiCreatUserID" value='<%#Eval("CreateUserId") %>' />
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="del" CommandArgument='<%#Eval("fileId") %>'
                                    ImageUrl="../../Themes/Images/btn_dg_delete.gif" OnClientClick="return window.confirm('您确定删除吗？')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiStandardValidationInnerManageID" field="StandardValidationInnerManageID"
        tablename="EPMS_StandardValidationInnerManage" />
    <!--业务部门集合-->
    <input type="hidden" runat="server" id="hiBusinessDeptID" />
    <script type="text/javascript">

        //上传附件
        function ShowUpload() {
            var fileSrcId = document.getElementById('<%=hiStandardValidationInnerManageID.ClientID %>').value;
            var fileSrcFlag = "module";
            var buildSelf = "<%=AttchmentSelfFolder %>";

            var url = "../../Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf; 
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }
    </script>
</asp:Content>
