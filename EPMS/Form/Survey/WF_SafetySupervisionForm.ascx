<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SafetySupervisionForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.Survey.WF_SafetySupervisionForm" %>
<table class="tz-table">
    <tr>
        <td class="td-l">
            标题<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText ID="txtOutlineTheme" runat="server" MaxText="256" field="SupervisionTheme"
                tablename="EPMS_SafetySupervision" readonly="readonly" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtProjectName" SourceMode="SelectorPage"
                IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                PageWidth="850" EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                ResultForControls="{'hiProjectID':'id','txtProjectCode':'ProjectCode','tbProjectType':'ProjectType','tbPhaseName':'PhaseName','hiManagerUserID':'ManagerUserID','txtManagerUserName':'ManagerUserName'}"
                activestatus="(23.编制绩效测量和监视记录)" req="1" field="ProjectName" tablename="EPMS_SafetySupervision"
                AfterSelect="afterSelect()"></zhongsoft:LightObjectSelector>
            <input type="hidden" id="hiProjectID" runat="server" field="OrganizationID" tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            项目编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" readonly="readonly"
                class="kpms-textbox" field="ProjectCode" tablename="EPMS_SafetySupervision" />
        </td>
    </tr>
    <tr runat="server" id="trExtendInfo">
        <td class="td-l">
            设总
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtManagerUserName" runat="server" readonly="readonly"
                maxlength="32" class="kpms-textbox" field="ManagerUserName" tablename="EPMS_SafetySupervision" />
            <input type="hidden" id="hiManagerUserID" name="hiManagerUserID" runat="server" field="ManagerUserID"
                tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            项目类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbProjectType" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" field="ProjectType" tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" field="PhaseName" tablename="EPMS_SafetySupervision" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            是否院级<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsConfirm" RepeatDirection="Horizontal"
                req="1" field="SupervisionType" tablename="EPMS_SafetySupervision" ActiveStatus="(23.编制绩效测量和监视记录)">
                <asp:ListItem Text="是" Value="院级"></asp:ListItem>
                <asp:ListItem Text="否" Value="部门级"></asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-r" colspan="4" style="color: Red; font-weight: bold">
            院级监查(安监部发起，经安监部审核)，部门级（部门发起），到部门办理
        </td>
    </tr>
    <tr>
        <td class="td-l">
            编写人
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtWriteUserName" runat="server"
                readonly="readonly" field="WriteUserName" tablename="EPMS_SafetySupervision" />
            <!--- 填写（编制\编写）人ID-->
            <input type="hidden" id="hiWriteUserID" name="hiWriteUserID" runat="server" field="WriteUserID"
                tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            联系电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtPhone" runat="server" readonly="readonly"
                field="WriteUserPhone" tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtWriteRoomName" runat="server" MaxText="32" class="kpms-textbox"
                readonly="readonly" field="WriteRoomName" tablename="EPMS_SafetySupervision" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteRoomID" name="hiWriteRoomID" runat="server" field="WriteRoomID"
                tablename="EPMS_SafetySupervision" />
            <!--编制（编写）部门ID--->
            <input type="hidden" id="hiWriteDeptID" name="hiWriteDeptID" runat="server" field="WriteDeptID"
                tablename="EPMS_SafetySupervision" />
            <input type="hidden" id="hiWriteDeptName" name="hiWriteDeptName" runat="server" field="WriteDeptName"
                tablename="EPMS_SafetySupervision" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            安全监查编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtSupervisionCode" runat="server"
                readonly="readonly" field="SupervisionCode" tablename="EPMS_SafetySupervision" />
        </td>
        <td class="td-l">
            编制时间
        </td>
        <td class="td-m">
            <!-- class="kpms-textbox-date" -->
            <zhongsoft:XHtmlInputText ID="txtWriteTime" runat="server" class="kpms-textbox" readonly="readonly"
                field="WriteDate" tablename="EPMS_SafetySupervision" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            备注
        </td>
        <td colspan="5" class="td-m">
            <zhongsoft:LightTextBox ID="tbFormContent" CssClass="kpms-textarea" runat="server"
                TextMode="MultiLine" EnableTheming="false" maxtext="2048" tablename="EPMS_SafetySupervision"
                field="FormContent" ActiveStatus="(23.编制绩效测量和监视记录)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td align="center" style="font-weight: bold; font-size: 14px" colspan="6">
            绩效测量和监视记录
        </td>
    </tr>
    <tr class="trDrillPlan">
        <td class="flexible" onclick="openDetail('trDrillPlan')" colspan="6">
            施工组织设计、勘测工作大纲、钻探施工方案等&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trDrillPlan">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6">
                        <span id="Span7" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnDrillPlan" CssClass="subtoolbarlink" EnableTheming="false"
                                DisplayStatus="(3.编制绩效测量和监视记录)" ActiveStatus="(3.编制绩效测量和监视记录)" OnClientClick="return addDrillPlan()"
                                OnClick="btnDrillPlan_Click">
                                <span>
                                    <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增</span></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvDrillPlan" AllowPaging="true"
                            UseDefaultDataSource="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            DataKeyNames="SupervisionDetailID" OnRowCommand="gvDrillPlan_RowCommand" OnRowDataBound="gvDrillPlan_RowDataBound"
                            BindGridViewMethod="UserControl.BindDrillPlan" PermissionStatus="true" AllowSorting="true">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="DetailContent" HeaderText="安全监查、检查项目" ShowToolTip="true"
                                    Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查时间<span class='req-star'>*</span>"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="SupervisionDate">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtSupervisionDate" runat="server" type="text" class="kpms-textbox-date"
                                            activestatus="(3.编制绩效测量和监视记录)" Value='<%#Eval("SupervisionDate") %>' checkReq="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查人" HeaderStyle-Width="120px" SortExpression="OperatorName">
                                    <ItemTemplate>
                                        <input runat="server" id="hiOperatorID" type="hidden" value='<%#Eval("OperatorID") %>' />
                                        <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" Value='<%#Eval("OperatorName") %>'
                                            IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                            Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                            ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                            activestatus="(3.编制绩效测量和监视记录)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查结果<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbOperatorResult" runat="server" MaxLength="2000" Text='<%#Eval("OperatorResult") %>'
                                            activestatus="(3.编制绩效测量和监视记录)" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Rows="2" EnableTheming="false" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="EditData" />
                                <zhongsoft:LightTemplateField HeaderText="保存">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="SaveData" CommandArgument='<%#Eval("SupervisionDetailID") %>'
                                            EnableTheming="false">
						<img alt="保存" title="保存" src="<%=WebAppPath%>/themes/images/btn_save.gif" >
                        </img>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="SupervisionDetailID">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="trManagementFiles">
        <td class="flexible" onclick="openDetail('trManagementFiles')" colspan="6">
            现场安全生产管理文件&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trManagementFiles">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6">
                        <span id="Span1" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnManagementFiles" CssClass="subtoolbarlink"
                                EnableTheming="false" ActiveStatus="(3.编制绩效测量和监视记录)" OnClientClick="return addManagementFiles()"
                                OnClick="btnManagementFiles_Click" DisplayStatus="(3.编制绩效测量和监视记录)">
                                <span>
                                    <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增</span></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvManagementFiles"
                            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            DataKeyNames="SupervisionDetailID" UseDefaultDataSource="true" OnRowCommand="gvDrillPlan_RowCommand"
                            OnRowDataBound="gvDrillPlan_RowDataBound" BindGridViewMethod="UserControl.BindManagementFiles"
                            PermissionStatus="true"  AllowSorting="true">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="DetailContent" HeaderText="安全监查、检查项目" ShowToolTip="true"
                                    Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查时间<span class='req-star'>*</span>"
                                    ItemStyle-HorizontalAlign="Center" SortExpression="SupervisionDate">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtSupervisionDate" runat="server" type="text" class="kpms-textbox-date"
                                            activestatus="(3.编制绩效测量和监视记录)" Value='<%#Eval("SupervisionDate") %>' checkReq="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查人" HeaderStyle-Width="120px"  SortExpression="OperatorName">
                                    <ItemTemplate>
                                        <input runat="server" id="hiOperatorID" type="hidden" value='<%#Eval("OperatorID") %>' />
                                        <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" Value='<%#Eval("OperatorName") %>'
                                            IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                            Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                            ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                            activestatus="(3.编制绩效测量和监视记录)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查结果<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbOperatorResult" runat="server" MaxLength="2000" Text='<%#Eval("OperatorResult") %>'
                                            activestatus="(3.编制绩效测量和监视记录)" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Rows="2" EnableTheming="false" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="EditData" />
                                <zhongsoft:LightTemplateField HeaderText="保存">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="SaveData" CommandArgument='<%#Eval("SupervisionDetailID") %>'
                                            EnableTheming="false">
						<img alt="保存" title="保存" src="<%=WebAppPath%>/themes/images/btn_save.gif" >
                        </img>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="SupervisionDetailID">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="trManagement">
        <td class="flexible" onclick="openDetail('trManagement')" colspan="6">
            现场安全生产管理文件&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trManagement">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6">
                        <span id="Span2" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnManagement" CssClass="subtoolbarlink" EnableTheming="false"
                                ActiveStatus="(3.编制绩效测量和监视记录)" OnClientClick="return addManagement()" OnClick="btnManagement_Click"
                                DisplayStatus="(3.编制绩效测量和监视记录)">
                                <span>
                                    <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增</span></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvManagement" AllowPaging="true"
                            PageSize="10" AutoGenerateColumns="false" ShowExport="true" DataKeyNames="SupervisionDetailID"
                            UseDefaultDataSource="true" OnRowCommand="gvDrillPlan_RowCommand" OnRowDataBound="gvDrillPlan_RowDataBound"
                            BindGridViewMethod="UserControl.BindManagement" PermissionStatus="true"  AllowSorting="true">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="DetailContent" HeaderText="安全监查、检查项目" ShowToolTip="true"
                                    Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查时间<span class='req-star'>*</span>"
                                    ItemStyle-HorizontalAlign="Center"   SortExpression="SupervisionDate">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtSupervisionDate" runat="server" type="text" class="kpms-textbox-date"
                                            activestatus="(3.编制绩效测量和监视记录)" Value='<%#Eval("SupervisionDate") %>' checkReq="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查人" HeaderStyle-Width="120px"   SortExpression="OperatorName">
                                    <ItemTemplate>
                                        <input runat="server" id="hiOperatorID" type="hidden" value='<%#Eval("OperatorID") %>' />
                                        <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" Value='<%#Eval("OperatorName") %>'
                                            IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                            Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                            ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                            activestatus="(3.编制绩效测量和监视记录)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查结果<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbOperatorResult" runat="server" MaxLength="2000" Text='<%#Eval("OperatorResult") %>'
                                            activestatus="(3.编制绩效测量和监视记录)" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Rows="2" EnableTheming="false" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="EditData" />
                                <zhongsoft:LightTemplateField HeaderText="保存">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="SaveData" CommandArgument='<%#Eval("SupervisionDetailID") %>'
                                            EnableTheming="false">
						<img alt="保存" title="保存" src="<%=WebAppPath%>/themes/images/btn_save.gif" >
                        </img>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="SupervisionDetailID">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr class="trLivingManagement">
        <td class="flexible" onclick="openDetail('trLivingManagement')" colspan="6">
            驻地、生活区安全管理&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trLivingManagement">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6">
                        <span id="Span3" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnLivingManagement" CssClass="subtoolbarlink"
                                EnableTheming="false" ActiveStatus="(3.编制绩效测量和监视记录)" OnClientClick="return addLivingManagement()"
                                OnClick="btnLivingManagement_Click" DisplayStatus="(3.编制绩效测量和监视记录)">
                                <span>
                                    <img runat="server" id="img3" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增</span></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvLivingManagement"
                            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            DataKeyNames="SupervisionDetailID" UseDefaultDataSource="true" OnRowCommand="gvDrillPlan_RowCommand"
                            OnRowDataBound="gvDrillPlan_RowDataBound" BindGridViewMethod="UserControl.BindLivingManagement"
                            PermissionStatus="true"  AllowSorting="true">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="DetailContent" HeaderText="安全监查、检查项目" ShowToolTip="true"
                                    Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查时间<span class='req-star'>*</span>"
                                    ItemStyle-HorizontalAlign="Center"  SortExpression="SupervisionDate">
                                    <ItemTemplate>
                                        <zhongsoft:XHtmlInputText ID="txtSupervisionDate" runat="server" type="text" class="kpms-textbox-date"
                                            activestatus="(3.编制绩效测量和监视记录)" Value='<%#Eval("SupervisionDate") %>' checkReq="1" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查人" HeaderStyle-Width="120px"   SortExpression="OperatorName">
                                    <ItemTemplate>
                                        <input runat="server" id="hiOperatorID" type="hidden" value='<%#Eval("OperatorID") %>' />
                                        <zhongsoft:LightObjectSelector runat="server" ID="tbOperatorName" Value='<%#Eval("OperatorName") %>'
                                            IsMutiple="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                            Style="width: 100px !important" SelectPageMode="Dialog" DoCancel="true" ResultAttr="name"
                                            ResultForControls="{'hiOperatorID':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                            activestatus="(3.编制绩效测量和监视记录)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="监查、检查结果<span class='req-star'>*</span>">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox ID="tbOperatorResult" runat="server" MaxLength="2000" Text='<%#Eval("OperatorResult") %>'
                                            activestatus="(3.编制绩效测量和监视记录)" TextMode="MultiLine" CssClass="kpms-textarea"
                                            Rows="2" EnableTheming="false" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="EditData" />
                                <zhongsoft:LightTemplateField HeaderText="保存">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnCancel" runat="server" CommandName="SaveData" CommandArgument='<%#Eval("SupervisionDetailID") %>'
                                            EnableTheming="false">
						<img alt="保存" title="保存" src="<%=WebAppPath%>/themes/images/btn_save.gif" >
                        </img>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <%--                                <zhongsoft:LightButtonField HeaderText="保存" DataParamFields="SupervisionDetailID"
                                    CommandName="SaveData">
                                </zhongsoft:LightButtonField>--%>
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDrillPlan" DataParamFields="SupervisionDetailID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="SupervisionDetailID">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td align="center" style="font-weight: bold; font-size: 14px" colspan="6">
            事故隐患排查情况及治理要求
        </td>
    </tr>
    <tr id="tr1">
        <td colspan="6">
            <table class="tz-table">
                <tr>
                    <td colspan="6">
                        <span id="Span4" runat="server" style="float: right">
                            <asp:LinkButton runat="server" ID="lbtnChkAndFeedback" CssClass="subtoolbarlink"
                                EnableTheming="false" ActiveStatus="(3.编制绩效测量和监视记录)" OnClientClick="return addChkAndFeedback()"
                                OnClick="btnChkAndFeedback_Click" DisplayStatus="(3.编制绩效测量和监视记录)">
                                <span>
                                    <img runat="server" id="img4" src="~/Themes/Images/btn_add.gif" alt="新增里程碑节点" width="16"
                                        height="16" />新增</span></asp:LinkButton></span>
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvSafetyChkAndFeedback"
                            AllowPaging="true" PageSize="10" AutoGenerateColumns="false" ShowExport="true"
                            DataKeyNames="InvestigationID" UseDefaultDataSource="true" OnRowCommand="gvSafetyChkAndFeedback_RowCommand"
                            BindGridViewMethod="UserControl.BindChkAndFeedback" PermissionStatus="true"  AllowSorting="true">
                            <Columns>
                                <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%# Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightBoundField DataField="InvestigationContent" HeaderText="隐患排查情况描述"
                                    ShowToolTip="true" Width="300">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="InvestigationDate" HeaderText="排查时间" DataFormatString="{0:yyyy-MM-dd}">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="InvestigationUserName" HeaderText="排查人">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="InvestigationType" HeaderText="类别">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="RiskLevel" HeaderText="风险等级">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ExcUnitName" HeaderText="责任科室">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="ExcDeptName" HeaderText="责任部门">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightBoundField DataField="PlanExcDate" HeaderText="要求整改<br/>完成时间" HtmlEncode="False"
                                    DataFormatString="{0:yyyy-MM-dd}">
                                </zhongsoft:LightBoundField>
                                <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editChkAndFeedback" DataParamFields="InvestigationID"
                                    CommandName="EditData" />
                                <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewChkAndFeedback" DataParamFields="InvestigationID"
                                    CommandName="ViewData" />
                                <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DataParamFields="InvestigationID">
                                </zhongsoft:LightButtonField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiIsLoadTPLT" value="1" />
<!----g过滤条件--->
<input type="hidden" runat="server" id="hiDrillPlan" value="1" />
<input type="hidden" runat="server" id="hiManagementFiles" value="2" />
<input type="hidden" runat="server" id="hiManagement" value="3" />
<input type="hidden" runat="server" id="hiLivingManagement" value="4" />
<input type="hidden" runat="server" id="Hidden5" value="1" />
<!---勘测项目外业安全监查管理流程ID-->
<input type="hidden" runat="server" id="hiSupervisionID" readonly="readonly" field="SupervisionID"
    tablename="EPMS_SafetySupervision" />
<script type="text/javascript">
    function afterSelect() {
        var ProjName = $("#<%=txtProjectName.ClientID %>").val();
        var ProjCode = $("#<%=txtProjectCode.ClientID %>").val();
        $("#<%=txtOutlineTheme.ClientID %>").val(ProjName + "【" + ProjCode + "】" + "外业安全监查");
    }
</script>
<!--勘测项目外业安全监查管理流程-->
<script type="text/javascript">
    function addDrillPlan() {
        AddDrillPlan(2, '', 1, '施工组织设计、勘测工作大纲、钻探施工方案等');
        return false;
    }

    function editDrillPlan(bizId) {
        handleDrillPlan(3, bizId);
        return false;
    }

    function viewDrillPlan(bizId) {
        handleDrillPlan(1, bizId);
        return false;
    }

    function addManagementFiles() {
        AddDrillPlan(2, '', 2, '现场安全生产管理文件');
        return false;
    }

    function addManagement() {
        AddDrillPlan(2, '', 3, '现场安全生产管理');
        return false;
    }


    function addLivingManagement() {
        AddDrillPlan(2, '', 4, '驻地、生活区安全管理');
        return false;
    }


    //添加
    function AddDrillPlan(actionType, bizId, typeid, typeName) {
//        var json = { DetailTypeID: typeid, DetailTypeName: typeName };
//        var url = buildBizUrl(actionType, bizId, '/EPMS/Form/Survey/SafetySupervisionEditor.aspx', json);

        var FormID = $('#<%=hiSupervisionID.ClientID %>').val();
        var json = { actionType: actionType, bizId: bizId, DetailTypeID: typeid, DetailTypeName: typeName, SupervisionID: FormID };
        var url = buildQueryUrl('/EPMS/Form/Survey/SafetySupervisionEditor.aspx', json);
        var callBack = BindTable;
        showDivDialog(encodeURI(url), "", 800, 600, callBack);
    }

    //
    function handleDrillPlan(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/Form/Survey/SafetySupervisionEditor.aspx', json);
        var callBack = BindTable;
        showDivDialog(encodeURI(url), "", 800, 600, callBack);
    }

        //刷新
    function BindTable() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnDrillPlan,"")%>;
    }

    //添加事故隐患
    function addChkAndFeedback() {
        handleChkAndFeedback(2, '');
        return false;
    }
    function editChkAndFeedback(bizId) {
        handleChkAndFeedback(3, bizId);
        return false;
    }

    function viewChkAndFeedback(bizId) {
        handleChkAndFeedback(1, bizId);
        return false;
    }
    function handleChkAndFeedback(actionType, bizId) {
        var FormID = $('#<%=hiSupervisionID.ClientID %>').val();
        var json = { actionType: actionType, bizId: bizId, SupervisionID: FormID };
        var url = buildQueryUrl('/EPMS/Form/Survey/SafetyChkTaskEditor.aspx', json);
        var callBack = BindChkAndFeedback;
        showDivDialog(encodeURI(url), "", 800, 600, callBack);
    }

        //
    function BindChkAndFeedback() {
         <%=Page.ClientScript.GetPostBackEventReference(this.lbtnChkAndFeedback,"")%>;
    }
</script>
