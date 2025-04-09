<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QSMSystemPublicFileEditor.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" Inherits="Zhongsoft.Portal.QSM.List.QSMSystemPublicFileEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">文件名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:TextBox runat="server" ID="tbFileName" CssClass="kpms-textbox" field="FileName"
                    tablename="QSM_SystemPublicFile" MaxLength="64" ActiveStatus="(23.*)" req="1"></asp:TextBox>
            </td>
            <td class="td-l">文件编号<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox runat="server" ID="tbFileCode" CssClass="kpms-textbox" field="FileCode"
                    tablename="QSM_SystemPublicFile" MaxLength="20" ActiveStatus="(23.*)" req="1"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">发布日期<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbFileReleaseDate" readonly="readonly"
                    class="kpms-textbox-date" req="1" field="FileReleaseDate" tablename="QSM_SystemPublicFile"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">管理部门<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" req="1" ID="ddlDept" activestatus="(23.*)"
                    field="DEPTID" tablename="QSM_SystemPublicFile">
                </zhongsoft:LightDropDownList>
            </td> 
            <td class="td-l">版本
            </td>
            <td class="td-m">
                <input type="text" id="tbFileEdition" runat="server" class="kpms-textbox" field="FileEdition"
                    tablename="QSM_SystemPublicFile" activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <zhongsoft:LightDropDownList runat="server" ID="ddlLevel" activestatus="(23.*)" Visible="false">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiSecretLevel" field="SecretLevel" tablename="QSM_SystemPublicFile" /> 
        </tr>
        <tr>
            <td class="td-l">替换版本
            </td>
            <td class="td-m" colspan="3">
                <input type="text" id="Text1" runat="server" class="kpms-textbox" field="FileEditionType"
                    tablename="QSM_SystemPublicFile" activestatus="(23.*)" />
            </td>
            <td class="td-l" runat="server" id="tdSec">内控分册<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" req="1" ID="ddlSectionType" activestatus="(23.*)"
                    field="SectionType" tablename="QSM_SystemPublicFile" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" runat="server" id="tdSX">分册分项<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <zhongsoft:LightDropDownList runat="server" req="1" ID="ddlSectPType" activestatus="(23.*)"
                    field="SectionPlanType" tablename="QSM_SystemPublicFile" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">文件
            </td>
            <td class="td-r" colspan="7">
                <asp:ImageButton ID="ibtnUpload" runat="server" ImageUrl="../../Themes/Images/btn_dg_upfile.gif"
                    DisplayStatus="(23.*)" Style="cursor: hand;" ToolTip="点此上传文件" OnClientClick="ShowUpload();"
                    OnClick="ibtnUpload_Click" />
                <zhongsoft:LightPowerGridView ID="gvListFile" runat="server" AllowPaging="true" PageSize="10"
                    DataKeyNames="SystemPublicFileDetailID" AutoGenerateColumns="false" OnRowCommand="gvListFile_RowCommand"
                    OnRowDataBound="gvListFile_RowDataBound" EmptyDataText="没有文件信息">
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
                                    target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline; color: #0033FF;">
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
    <input type="hidden" runat="server" id="hiSystemPublicFileID" field="SystemPublicFileID"
        tablename="QSM_SystemPublicFile" />
    <input type="hidden" runat="server" id="hiDeptName" field="DeptName" tablename="QSM_SystemPublicFile" />
    <input type="hidden" runat="server" id="hiFileType" field="FileType" tablename="QSM_SystemPublicFile" />
    <input type="hidden" runat="server" id="hiLevelType" field="LevelType" tablename="QSM_SystemPublicFile" />
    <input type="hidden" runat="server" id="hiSystemFileType" field="SystemFileType" value="有效" tablename="QSM_SystemPublicFile" />

    <script type="text/javascript">

        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        //上传附件
        function ShowUpload() {
            var fileSrcId = document.getElementById('<%=hiSystemPublicFileID.ClientID %>').value;
            var fileSrcFlag = "module";
            var buildSelf = "<%=AttchmentSelfFolder %>";

            var url = "../../Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf; //+ "&catalogs=A6E28266-082B-40E8-9A8F-01FAE1060F6A"
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }

        function checkForm() {

            if ($('#<%=gvListFile.ClientID %>')[0].rows[1].cells[0].innerText == "没有文件信息") {
                window.alert('-请至少添加一个文件！');
            }
            return true;
        }
    </script>
</asp:Content>
