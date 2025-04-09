<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PatentTechnologyEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TSM.PatentTechnologyEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                专利名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbPatentName" runat="server" tablename="TSM_PATENTTECHNOLOGY"
                    req="1" field="PATENTNAME" activestatus="(23.*)" MaxLength="64" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专利类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbPatentType" field="PatentType" tablename="TSM_PATENTTECHNOLOGY"
                    req="1" activestatus="(23.*)" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                专利号<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPatentNum" runat="server" tablename="TSM_PATENTTECHNOLOGY"
                    req="1" field="PATENTNUMBER" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                发明人
            </td>
            <td class="td-m">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsInventorName" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                    ResultAttr="name" ActiveStatus="(23.*)" ResultForControls="{'hiInventorId':'id','hiInventorCode':'UserCode'}"
                      ShowJsonRowColName="True" SelectPageMode="Dialog" IsMutiple="true"
                    SourceMode="SelectorPage" field="INVENTORNAME" tablename="TSM_PATENTTECHNOLOGY" />
                <input id="hiInventorId" type="hidden" runat="server" tablename="TSM_PATENTTECHNOLOGY"
                    field="INVENTORID" />
                <input id="hiInventorCode" type="hidden" runat="server" tablename="TSM_PATENTTECHNOLOGY"
                    field="INVENTORCODE" />
            </td>
            <td class="td-l">
                专利权人
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbPatentee" runat="server" tablename="TSM_PATENTTECHNOLOGY"
                    field="PATENTEENAME" activestatus="(23.*)" MaxLength="32" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                法律状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlLawType" runat="server" field="LawType" activestatus="(23.*)"
                    tablename="TSM_PATENTTECHNOLOGY" Width="100px">
                    <asp:ListItem Value="申请">申请</asp:ListItem>
                    <asp:ListItem Value="受理">受理</asp:ListItem>
                    <asp:ListItem Value="授权">授权</asp:ListItem>
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                受理日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtAcceptanceDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_PATENTTECHNOLOGY" field="AcceptanceDate"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                授权日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtAuthorizationDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_PATENTTECHNOLOGY" field="AUTHORIZATIONDATE"
                    activestatus="(23.*)" />
            </td>
            <td class="td-l">
                证书日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" ID="txtCertificateDate" runat="server" readonly="readonly"
                    class="kpms-textbox-date" tablename="TSM_PATENTTECHNOLOGY" field="CERTIFICATEDATE"
                    activestatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                价值（元）
            </td>
            <td class="td-r" colspan="1">
                <zhongsoft:LightTextBox runat="server" ID="tbValue" activestatus="(23.*)" tablename="TSM_PATENTTECHNOLOGY"
                    field="VALUE" Regex="^([1-9]\d{0,11}|[0])(\.\d{1,2})?$" ErrMsg="请输入正数，最多12位整数，2位小数"
                    CssClass="kpms-textbox-money" EnableTheming="false" />
            </td>
            <td class="td-l">
                关键词
            </td>
            <td class="td-r" colspan="2">
                <zhongsoft:LightTextBox runat="server" ID="tbKeyWord" activestatus="(23.*)" tablename="TSM_PATENTTECHNOLOGY"
                    field="KeyWord" CssClass="kpms-textbox" EnableTheming="false" />
            </td>
            <%-- <td class="td-l">
                类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlType" runat="server" field="TECHTYPE" activestatus="(23.*)"
                    tablename="TSM_PATENTTECHNOLOGY">
                </zhongsoft:LightDropDownList>
            </td> --%>
        </tr>
        <tr>
            <td class="td-l">
                摘要
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbAbstract" activestatus="(23.*)" tablename="TSM_PATENTTECHNOLOGY"
                    field="Abstract" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false" />
            </td>
        </tr>

        <tr>
            <td colspan="6" align="center" style="font-weight: bold">
                申报材料
            </td>
        </tr>
        <tr>
            <td colspan="6" align="right">
                <asp:Button ID="btnAdd" Text="上传附件" runat="server" OnClick="btnAdd_Click" displaystatus="(3.*)"
                    OnClientClick="return UpFile();" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvDocument" runat="server" AllowPaging="true" PageSize="10"
                    DataKeyNames="FileId" AutoGenerateColumns="false" OnRowCommand="gvDocument_RowCommand">
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
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="del" CommandArgument='<%#Eval("FileId") %>'
                                    ImageUrl="../../../Themes/Images/btn_dg_delete.gif" OnClientClick="return window.confirm('您确定删除吗？')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!---专利技术Id--->
    <input id="hiPatentTechnolotyId" type="hidden" tablename="TSM_PATENTTECHNOLOGY" field="PATENTTECHNOLOGYID"
        runat="server" />
    <input id="Hidden1" type="hidden" tablename="TSM_PATENTTECHNOLOGY" field="FLAG" runat="server"
        value="1" />
    <input id="Hidden2" type="hidden" tablename="TSM_PATENTTECHNOLOGY" field="IsPass"
        runat="server" value="True" />
    <input id="hiIssue" type="hidden" tablename="TSM_PATENTTECHNOLOGY" field="Issue"
        runat="server" value="1" />
    <script type="text/javascript">
        var acType = '<%=ActionType %>';

        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();

            check()
            var pageType = '<%=Request.QueryString["pageType"]%>';
            if (pageType == "1") {
                $("#<%=hiIssue.ClientID%>").val(0);
            }
        }

        function check() {
            var isType = $("#<%=ddlLawType.ClientID %> :selected").val();

            $("#<%=txtAcceptanceDate.ClientID %>").removeAttr("req");
            $("#<%=txtAuthorizationDate.ClientID %>").removeAttr("req");
            $("#<%=tbPatentNum.ClientID %>").removeAttr("req");

            if (isType == "受理") {
                $("#<%=txtAcceptanceDate.ClientID %>").attr("req", "1");
            } else if (isType == "授权") {
                $("#<%=txtAcceptanceDate.ClientID %>").attr("req", "1");
                $("#<%=txtAuthorizationDate.ClientID %>").attr("req", "1");
                $("#<%=tbPatentNum.ClientID %>").attr("req", "1");
            }
        }

        $("#<%=ddlLawType.ClientID %>").change(function () {
            var isType = $("#<%=ddlLawType.ClientID %> :selected").val();

            $("#<%=txtAcceptanceDate.ClientID %>").removeAttr("req");
            $("#<%=txtAuthorizationDate.ClientID %>").removeAttr("req");
            $("#<%=tbPatentNum.ClientID %>").removeAttr("req");

            if (isType == "受理") {
                $("#<%=txtAcceptanceDate.ClientID %>").attr("req", "1");
            } else if (isType == "授权") {
                $("#<%=txtAcceptanceDate.ClientID %>").attr("req", "1");
                $("#<%=txtAuthorizationDate.ClientID %>").attr("req", "1");
                $("#<%=tbPatentNum.ClientID %>").attr("req", "1");
            }
        });

        //上传附件
        function UpFile() {
            var fileSrcFlag = "Module";
            var buildSelf = "False";
            var fileSrcId = '<%=BusinessObjectId %>';

            var url = "/Portal/Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf;
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }

    </script>
</asp:Content>
