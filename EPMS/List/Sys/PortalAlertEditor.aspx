<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PortalAlertEditor.aspx.cs"
    Title="工作提醒" Inherits="Zhongsoft.Portal.EPMS.List.Sys.PortalAlertEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lkbSend" runat="server" OnClick="lkbSend_Click" OnClientClick="return sendAlert();"
        CssClass="subtoolbarlink" EnableTheming="false"><span><img alt='发送' src="<%=WebAppPath %>/Themes/Images/btn_save.gif" width="16" height="16" />发送</span></asp:LinkButton>
    <asp:LinkButton ID="lkbSave" runat="server" OnClick="lkbSave_Click" OnClientClick="return saveData();"
        CssClass="subtoolbarlink" EnableTheming="false"><span><img alt='保存' src="<%=WebAppPath %>/Themes/Images/btn_save.gif" width="16" height="16" />保存</span></asp:LinkButton>
    <asp:LinkButton ID="lkbSaveAndClose" runat="server" OnClientClick="return saveData();"
        OnClick="lkbSaveAndClose_Click" CssClass="subtoolbarlink" EnableTheming="false"><span><img alt='保存并关闭' src="<%=WebAppPath %>/Themes/Images/btn_save.gif" width="16" height="16" />保存并关闭</span></asp:LinkButton>
    <asp:LinkButton ID="lkbDelete" runat="server" OnClick="lkbDelete_Click" CssClass="subtoolbarlink"
        EnableTheming="false"><span><img alt='删除' src="<%=WebAppPath %>/Themes/Images/btn_delete.gif" width="16" height="16" />删除</span></asp:LinkButton>
    <asp:LinkButton ID="lkbClose" runat="server" OnClientClick="
    closeWindow();
    return false;
" CssClass="subtoolbarlink" OnClick="lkbClose_Click" EnableTheming="false"><span><img alt='关闭' src="<%=WebAppPath %>/Themes/Images/btn_close.gif" width="16" height="16" />关闭</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table id="tz-table" class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                是否项目提醒<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rdblIsProject" runat="server" Field="IsProject" TableName="PortalAlert"
                    activestatus="(23.*)" req="1" RepeatColumns="2">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trProject">
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode'}"
                    PageWidth="850" EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)" Field="ProjectName"
                    TableName="PortalAlert" />
                <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
                    field="OrganizationID" tablename="PortalAlert" />
            </td>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" Field="ProjectCode"
                    TableName="PortalAlert" />
            </td>
        </tr>
        <tr runat="server" id="Spe1">
            <td class="td-l">
                主题<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbTitle" ActiveStatus="(23.*)" MaxLength="64" Field="Title"
                    TableName="PortalAlert" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                内容<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox TextMode="MultiLine" ActiveStatus="(23.*)" maxtext="256"
                    ID="tbContent" field="Content" tablename="PortalAlert" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblType" runat="server" ActiveStatus="(23.*)" Field="AlertType"
                    TableName="PortalAlert" RepeatColumns="3" req="1">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                提醒级别
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblLevel" runat="server" ActiveStatus="(23.*)" Field="AlertLevel"
                    TableName="PortalAlert" RepeatColumns="2">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                相关链接
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox ID="tbRelationUrl" ActiveStatus="(23.*)" MaxLength="256"
                    Field="RelationUrl" TableName="PortalAlert" runat="server"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                发送人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSendUserName" runat="server" readonly="readonly"
                    activestatus="(23.*)" maxlength="16" class="kpms-textbox" Field="SendUserName"
                    TableName="PortalAlert" />
                <input type="hidden" id="hiSendUserID" runat="server" field="SendUserID" tablename="PortalAlert" />
            </td>
            <td class="td-l">
                发送时间
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiAlertTime" tablename="PortalAlert" field="AlertTime" />
                <zhongsoft:XHtmlInputText ID="txtAlertTime" runat="server" type="text" class="kpms-textbox-wholedate"
                    readonly="readonly" activestatus="(23.*)" />
            </td>
        </tr>
        <tr content="alertUser">
            <td colspan="4" class="td-m flexible">
                处理信息<span id="Span1" runat="server" style="float: right; color: Red" displaystatus="(2.*)">请先保存，再添加接收人</span>
                <span id="Span2" runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button ID="btnSelProject" runat="server" Text="添加接收人" OnClientClick="return selUsers()"
                        class="btn" ForeColor="Black" />
                </span>
            </td>
        </tr>
        <tr content="alertUser">
            <td colspan="4">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvAlertUser" AutoGenerateColumns="false"
                    AllowSorting="true" DataKeyNames="AlertUserID" UseDefaultDataSource="true" BindGridViewMethod="BindGridData"
                    OnRowCommand="gvAlertUser_RowCommand" ShowExport="true" HideFieldOnExport="删除"
                    ShowPageSizeChange="true" AllowPaging="true" PageSize="10" OnRowDataBound="gvAlertUser_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="30px"></ItemStyle>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ReceiveUserName" HeaderText="接收人">
                            <HeaderStyle Width="100px"></HeaderStyle>
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReceiveTime" HeaderText="接收时间" DataFormatString="{0:yyyy-MM-dd hh:mm:ss}">
                            <HeaderStyle Width="100px"></HeaderStyle>
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="ReceiveState" HeaderText="阅读状态">
                            <HeaderStyle Width="100px"></HeaderStyle>
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DealTime" HeaderText="阅读时间" DataFormatString="{0:yyyy-MM-dd hh:mm:ss}">
                            <HeaderStyle Width="100px"></HeaderStyle>
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="DealMeasure" HeaderText="备注" ShowToolTip="true"
                            Width="100px" MaxLength="10">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditorData" ItemStyle-Width="40px"
                            EditItemClick="editUser" DataParamFields="AlertUserID">
                            <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" ItemStyle-Width="40px"
                            EditItemClick="viewUser" DataParamFields="AlertUserID">
                            <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        </zhongsoft:LightButtonField>
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px">
                            <HeaderStyle HorizontalAlign="Center" Width="35px"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        </zhongsoft:LightButtonField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr content="readInof">
            <td class="td-l">
                接收人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtReceiveUserName" runat="server" readonly="readonly"
                    maxlength="16" class="kpms-textbox" activestatus="(23.?)" />
            </td>
            <td class="td-l">
                接收时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtReceiveTime" runat="server" type="text" class="kpms-textbox-wholedate"
                    readonly="readonly" display="display" activestatus="(23.?)" />
            </td>
        </tr>
        <tr content="readInof">
            <td class="td-l">
                阅读时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtDealTime" runat="server" type="text" class="kpms-textbox-wholedate"
                    readonly="readonly" display="display" />
            </td>
            <td class="td-l">
                阅读状态
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rdblReceiveState" runat="server" ActiveStatus="(23.*)" RepeatColumns="2">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr content="readInof">
            <td class="td-l">
                备注
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightTextBox TextMode="MultiLine" maxtext="1024" ID="tbDealMeasure" runat="server"
                    CssClass="kpms-textarea" EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiAlertID" runat="server" field="AlertID" tablename="PortalAlert" />
    <input type="hidden" id="hiSourceID" runat="server" field="SourceID" tablename="PortalAlert" />
    <input type="hidden" id="hiAlertUser" runat="server" />
    <input type="hidden" runat="server" id="hiUserXML" />
    <asp:Button runat="server" ID="btnAddUser" OnClick="btnAddUser_Click" Visible="false" />
    <script type="text/javascript">

        function initCustomerPlugin() {

            $("#<%=rdblIsProject.ClientID %> input").each(function () {
                $(this).click(function () { setProjectAccess(); });
            });
            setProjectAccess();
        }

        function sendAlert() {
            if (saveData()) {
               var alertUser = $("#<%=hiAlertUser.ClientID %>").val();
               if (alertUser == "") {
                     alert("请添加接收人");
                     return false;
               }
               return confirm("是否确认发送");
            }
            return false;
        }

        function setProjectAccess() {
            //获取select 选中的 text :
            var text = $("#<%=rdblIsProject.ClientID  %> input:radio:checked").val();
            if (text == "1") {
                $("#trProject").show();
                $("#<%=lbsSelectProject.ClientID %>").attr("req", "1");
            } else {
                $("#trProject").hide();
                $("#<%=lbsSelectProject.ClientID %>").removeAttr("req");
                //非项目提醒 清空项目数据
                $("#<%=lbsSelectProject.ClientID %>").val("");
                $("#<%=lbsSelectProject.ClientID %>").next().val("");
                $("#<%=txtProjectCode.ClientID %>").val("");
                $("#<%=hiOrganizationId.ClientID %>").val("");
            }
            if ("<%=PageType %>" == "readPage") {
                $("[content='readInof']").show();
                $("#<%=txtDealTime.ClientID %>").attr("req", "1");
                $("[content='alertUser']").hide();
            } else {
                $("[content='readInof']").hide();
                $("#<%=txtDealTime.ClientID %>").removeAttr("req");
                $("[content='alertUser']").show();
            }
        }

        function editUser(alertUserID) {
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertUsersEditor.aspx", { bizid: alertUserID, "actionType": 3 });
            showDivDialog(url, null, 600, 300, addUser);
            return false;
        }

        function viewUser(alertUserID) {
            var url = buildQueryUrl("/EPMS/List/Sys/PortalAlertUsersEditor.aspx", { bizid: alertUserID, "actionType": 1 });
            showDivDialog(url, null, 600, 300, null);
            return false;
        }

        function selUsers() {
            var param = new InputParamObject("m");
            var filter = { OrganizationID: $("#<%=hiOrganizationId.ClientID %>").val(), DeptID: "<%=DeptID %>", IsShowChildDeptID: 'true', IsFilterByOrg: '1' };
            getEPMSUser('<%=hiUserXML.ClientID %>', param, filter, addUser);

            return false;
        }
        function addUser() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser,"")%>;
        }
    </script>
</asp:Content>
