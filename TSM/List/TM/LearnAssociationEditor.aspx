<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearnAssociationEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.TSM.List.TM.LearnAssociationEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
     <tr>
            <td class="td-l">
                名称
            </td>
            <td class="kpms-fim-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbLearnAssociationName" runat="server" Field="LearnAssociationName" ActiveStatus="(23.*)"
                    maxtext="256" Width="95%" EnableTheming="false" CssClass="kpms-textbox"   TableName="TM_LearnAssociationInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlLearnAssociationName" field="LearnAssociationType"
                    req="1" tablename="TM_LearnAssociationInfo" activestatus="(23.*)" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                会费(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContactsMoney" CssClass="kpms-textbox-money"
                    Width="70px" req="1" MaxLength="13" field="ContactsMoney" tablename="TM_LearnAssociationInfo"
                    activestatus="(23.*)" Regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" ErrMsg="请填写正数，小数点后最多保留2位"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                联系人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUserName" field="CUserName"
                    tablename="TM_LearnAssociationInfo" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" SelectPageMode="Dialog" ResultAttr="name" EnableTheming="false"
                    Writeable="false" req="1" ShowAttrs="name" ResultForControls="{'hiUserID':'id','tbMobilePhone':'MobilePhone'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                <input type="hidden" runat="server" id="hiUserID" tablename="TM_LearnAssociationInfo"
                    field="CUserID" />
            </td>
            <td class="td-l">
                联系电话
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbMobilePhone" CssClass="kpms-textbox"
                    MaxLength="13" field="MobilePhone" tablename="TM_LearnAssociationInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
         <tr>
            <td class="td-l">
                原登记联系人是否还参加
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="RadioButtonList1" runat="server"  field="ISCUserAttend" tablename="TM_LearnAssociationInfo"  RepeatDirection="Horizontal" >
                <asp:ListItem Value="参加">参加</asp:ListItem>
                <asp:ListItem Value="退出">退出</asp:ListItem>
                <asp:ListItem Value="暂不参加">暂不参加</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                参加目的
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAttendPurpose" CssClass="kpms-textbox"
                      field="AttendPurpose" tablename="TM_LearnAssociationInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                下次缴费时间 
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText type="text" runat="server" tablename="TM_LearnAssociationInfo"
                    field="ContactsDate" activestatus="(23.*)" readonly="readonly" class="kpms-textbox-date"
                      ID="txtContactsDate" />
            </td>
            <td class="td-l">
                通讯地址
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbAbbrName" CssClass="kpms-textbox" MaxLength="213"
                    field="AbbrName" tablename="TM_LearnAssociationInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                单位任职情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRZQK" CssClass="kpms-textbox" MaxLength="512"
                    field="OfficeSituation" tablename="TM_LearnAssociationInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
         <tr>
            <td class="td-l">
                个人任职情况
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbPersonalRZQK" CssClass="kpms-textbox" MaxLength="512"
                    field="PersonalSituation" tablename="TM_LearnAssociationInfo" activestatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="kpms-fim-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" Field="Memo" ActiveStatus="(23.*)"
                    maxtext="256" Width="95%" EnableTheming="false" CssClass="kpms-textarea" TextMode="MultiLine"
                    Rows="3" TableName="TM_LearnAssociationInfo" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                缴费列表
            </td>
            <td colspan="3" align="right">
                <asp:Button ID="btnNew" runat="server" OnClientClick="return AddNewYearCheck();"
                    DisplayStatus="(3.*)" Text="新建缴费信息" ToolTip="新建缴费信息" OnClick="btnNew_Click" />
                <zhongsoft:LightPowerGridView ID="gvYearCheck" runat="server" AllowPaging="true"
                    PageSize="10" DataKeyNames="LearnAssociationEntityID" AutoGenerateColumns="false"
                     OnRowCommand="gvYearCheck_RowCommand" >
                    <FooterStyle CssClass="kpms-borrowaggregate" />
                    <PagerStyle CssClass="kpms-borrowbottom" ForeColor="DarkSlateBlue" HorizontalAlign="Center" />
                    <HeaderStyle CssClass="kpms-borrowheader" Font-Bold="True" />
                    <SelectedRowStyle BackColor="DarkSlateBlue" ForeColor="GhostWhite"></SelectedRowStyle>
                    <AlternatingRowStyle CssClass="kpms-borrowbody-ji" />
                    <RowStyle CssClass="kpms-borrowbody-ou" />
                    <Columns>
                        <asp:BoundField DataField="LearnYear" HeaderText="缴费年度" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="100px" />
                        <asp:BoundField DataField="ContactsMoney" HeaderText="缴纳会费(元)" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="100px" />
                        <asp:BoundField DataField="Memo" HeaderText="备注" ItemStyle-HorizontalAlign="Left"
                            ItemStyle-Width="100px" /> 
                        <asp:TemplateField HeaderText="操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEdit" runat="server" CommandName="modify" CommandArgument='<%#Eval("LearnAssociationEntityID") %>'
                                    EnableTheming="false">
                    <img alt="编辑年度缴费信息" onclick="return EditYearCheck('<%#Eval("LearnAssociationEntityID") %>')" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor:hand" />
                                </asp:LinkButton>
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="del" CommandArgument='<%#Eval("LearnAssociationEntityID") %>'
                                    ImageUrl="../../../Themes/Images/btn_dg_delete.gif" OnClientClick="return window.confirm('您确定删除吗？')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                发票扫描件
            </td>
            <td class="td-r" colspan="3">
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
                <asp:ImageButton ID="ibtnUpload" runat="server" ImageUrl="../../../Themes/Images/btn_dg_upfile.gif"
                    DisplayStatus="(3.*)" Style="cursor: hand;" ToolTip="点此上传发票扫描件" OnClientClick="ShowUpload();"
                    OnClick="ibtnUpload_Click" />
            </td>
        </tr>
        <tr>
            <td class="td-m" style="text-align: right" colspan="4">
                <asp:Button runat="server" ID="btnAddMumber" Text="新增成员" OnClientClick="return ChooseUser();"/>
                <asp:Button ID="btnAffterSelect" runat="server" Style="display: none" OnClick="btnAffterSelect_Click"/>
                <input type="hidden" runat="server" id="hiSelectXml" />
                <asp:Button ID="btnDateChange" runat="server" Style="display: none" OnClick="btnDateChange_Click"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                成员列表
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="pgvMumberList" AllowPaging="true"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="false" AllowSorting="false" 
                    DataKeyNames="LearnAssociatMemberID" UseDefaultDataSource="true"  OnRowCommand="pgvMumberList_RowCommand" >
                    <Columns>
                        <asp:TemplateField HeaderText="院号">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbLoginId" Text='<%# Eval("LoginId") %>'></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="姓名">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbMemberName" Text='<%# Eval("MemberName") %>'></asp:Label>
                                <input type="hidden" runat="server" id="hiMemberID" value='<%# Eval("MemberID") %>'/>
                                <input type="hidden" runat="server" id="hiMemberCode" value='<%# Eval("MemberCode") %>'/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="担任职务">
                            <ItemTemplate>
                                <asp:TextBox runat="server" ID="tbRank" Text='<%# Eval("Rank") %>' ></asp:TextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="参加时间">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-date"
                                      ID="txtAppointDate" Value='<%# Eval("AppointDate") %>'  onchange="dateChange('<%#Container.DataItemIndex %>')"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="退出时间">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" runat="server" readonly="readonly" class="kpms-textbox-date"
                                      ID="txtLeaveDate" Value='<%# Eval("LeaveDate") %>'  onchange="dateChange('<%#Container.DataItemIndex %>')"/>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:ImageButton ID="imgDel" runat="server" CommandName="del" CommandArgument='<%#Eval("LearnAssociatMemberID") %>'
                                    ImageUrl="../../../Themes/Images/btn_dg_delete.gif" OnClientClick="return window.confirm('您确定删除吗？')" />
                            </ItemTemplate>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!---主键Id--->
    <input id="hiLearnAssociationInfoID" type="hidden" tablename="TM_LearnAssociationInfo"
        field="LearnAssociationInfoID" runat="server" /> 
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
        
        //上传资质附件
        function ShowUpload() {
            var fileSrcId = document.getElementById('<%=hiLearnAssociationInfoID.ClientID %>').value;
            var fileSrcFlag = "module";
            var buildSelf = "<%=AttchmentSelfFolder %>";

            var url = "../../../Sys/FileDocument/FileUploader.aspx?fileSourceId=" + fileSrcId + "&fileSourceFlag=" + fileSrcFlag + "&buildSelfFolder=" + buildSelf; //+ "&catalogs=A6E28266-082B-40E8-9A8F-01FAE1060F6A"
            var stringFeatures = "dialogHeight: 320px; dialogWidth: 500px; edge:Raised; center: Yes; help: Yes; resizable: no; scroll:no; status: no;";
            window.showModalDialog(url, null, stringFeatures);
            return true;
        }

        //新建年度缴费信息
        function AddNewYearCheck() {
            var parentId = document.getElementById('<%=hiLearnAssociationInfoID.ClientID %>').value;
            var arg, url;
            var stringFeatures = "dialogHeight: 400px; dialogWidth: 500px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; status: no;";
            url = "LearnAssociationEntity.aspx?actionType=2&parentId=" + parentId;
            arg = window.showModalDialog(url, "", stringFeatures);
            if (arg != null) {
                return true;
            }
            return false;
        }

        //编辑年度缴费信息
        function EditYearCheck(yearCheckId) {
            var arg, url;
            var stringFeatures = "dialogHeight:400px; dialogWidth: 500px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; status: no;";
            url = "LearnAssociationEntity.aspx?actionType=3" + "&bizId=" + yearCheckId;
            arg = window.showModalDialog(url, "", stringFeatures);

            if (arg != null) {
                return true;
            }
            return false;
        }
        function ChooseUser() {
            var param = new InputParamObject("m");
            var json = {};
            var url = "/Sys/OrgUsers/UserSelectorJson.aspx";
            buildDivSelector("<%=hiSelectXml.ClientID %>", param, json, buildQueryUrl(url, null), 1000, 600, afterSelectCallBack);
            return false;
        }
        function afterSelectCallBack() {
            $("#<%=btnAffterSelect.ClientID %>").click();
        }
        function dateChange(rowid) {
            $("#<%=btnDateChange.ClientID %>").attr("rowid",rowid);
            $("#<%=btnDateChange.ClientID %>").click();
        }
    </script>
</asp:Content>
