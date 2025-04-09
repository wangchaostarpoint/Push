<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_TechProjectInspect.ascx.cs"
    Inherits="Zhongsoft.Portal.TSM.Form.TM.WF_TechProjectInspect" %>

<table class="tz-table">
    <tr>
        <td class="td-l">
            项目名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" field="ProjectName"
                req="1" tablename="SRPM_ProjectCheckForm" IsMutiple="false" EnableTheming="false"
                ResultForControls="{ 'hiProjectListID':'ProjectListID',
                 'tbProjectManagerName':'ProjectManagerName','hiProjectManagerID':'ProjectManagerID'
                ,'txtProjectDeptName':'ProjectDeptName','txtTechnologySource':'TechnologySource','hiProjectDeptID':'ProjectDeptID'
                ,'txtMobilePhone':'MobilePhone' ,'hiProjectManagerID':'ProjectManagerID'}" ResultAttr="name"
               SelectPageMode="Dialog"  ShowJsonRowColName="true" activestatus="(23.提出验收申请)(23.修改验收申请)" PageUrl="~/TSM/Obsolete/TechProjectTaskSelector.aspx" AfterSelect="AfterSelectOrg()"/>
            <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_ProjectCheckForm" />
        </td>
        <td class="td-l">
            承担部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProjectDeptName" runat="server" readonly="readonly" activestatus="(23.提出验收申请)(23.修改验收申请)"
                Field="ProjectDeptName" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectDeptID" field="ProjectDeptID" tablename="SRPM_ProjectCheckForm" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            合同编号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtContractCode" runat="server" type="text" class="kpms-textbox"
                style="width: 120px" tablename="SRPM_ProjectCheckForm" field="ContractCode" readonly="readonly"
                activestatus="(23.提出验收申请)(23.修改验收申请)" />
        </td>
        <td class="td-l">
            合同名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="txtContractName" field="ContractName"
                tablename="SRPM_ProjectCheckForm" activestatus="(23.提出验收申请)(23.修改验收申请)" SourceMode="SelectorPage"
                SelectPageMode="Dialog" ShowJsonRowColName="true" DoCancel="false" ResultAttr="name"
                Writeable="false" ShowAttrs="name,UserCode" ResultForControls="{'hiContractID':'id','txtContractCode':'CONTRACTCODE', 'tbContractName':'name'}"
                PageWidth="850" PageUrl="~/MM/Obsolete/ContractSelector.aspx"></zhongsoft:LightObjectSelector>
            <input id="hiContractID" type="hidden" field="ContractID" runat="server" tablename="SRPM_ProjectCheckForm" />
            <asp:Button ID="btnBindgv" runat="server" Visible="false" OnClick="btnBindgv_Click"/>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目负责人
        </td>
        <td class="td-m">
            <zhongsoft:XHtmlInputText ID="tbProjectManagerName" runat="server" readonly="readonly" activestatus="(23.提出验收申请)(23.修改验收申请)"
                Field="ProjectManagerName" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" runat="server" id="hiProjectManagerID" field="ProjectManagerID"
                tablename="SRPM_ProjectCheckForm" />
        </td>
        <td class="td-l">
            手机号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtMobilePhone" runat="server" readonly="readonly" activestatus="(23.提出验收申请)(23.修改验收申请)"
                Field="MobilePhone" TableName="SRPM_ProjectCheckForm" class="kpms-textbox">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            建议验收时间<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbApplyDate" runat="server" Field="ApplyDate" Tablename="SRPM_ProjectCheckForm"
                readonly="readonly" class="kpms-textbox-date" req="1" ActiveStatus="(23.提出验收申请)(23.修改验收申请)">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建议验收地点
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox ID="tbProjectEvolve" runat="server" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine" maxtext="128" Field="CruxTechnology" TableName="SRPM_ProjectCheckForm" ActiveStatus="(23.提出验收申请)(23.修改验收申请)"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            申请验收形式<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <input type="hidden" runat="server" id="hiReviewMethod" field="AchievementsBrief"
                tablename="SRPM_ProjectCheckForm" />
            <asp:CheckBoxList ID="cblAdviceReviewMethod" runat="server" req="1" ActiveStatus="(23.提出验收申请)(23.修改验收申请)"
                RepeatDirection="Horizontal">
                <asp:ListItem Text="会议验收">会议验收</asp:ListItem>
                <asp:ListItem Text="现场验收">现场验收</asp:ListItem>
                <asp:ListItem Text="通讯验收">通讯验收</asp:ListItem>
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验收需提交的材料<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <input type="hidden" runat="server" id="hiInnovate" field="Innovate" tablename="SRPM_ProjectCheckForm" />
            <asp:CheckBoxList ID="cblInnovate" runat="server" req="1" ActiveStatus="(23.提出验收申请)(23.修改验收申请)"
                RepeatDirection="Horizontal" OnSelectedIndexChanged="cblInnovate_SelectedIndexChanged" AutoPostBack="true">
                <asp:ListItem Text="工作总结">工作总结</asp:ListItem>
                <asp:ListItem Text="技术报告">技术报告</asp:ListItem>
                <asp:ListItem Text="资金使用情况">资金使用情况</asp:ListItem>
                <asp:ListItem Text="相关资料">相关资料</asp:ListItem>
            </asp:CheckBoxList>
        </td>
    </tr>
    <tr id="Tr2" runat="server" style="display:none;">
        
        <td class="td-m" colspan="6" style="border-left: none; text-align: right;">
            <asp:Button ID="btnUploadFile" runat="server" OnClientClick="return uploadFileOfSRPMProjectApplicatin();"
                OnClick="btnUploadFile_Click" Text="上传附件" activeStatus="(23.提出验收申请)(23.修改验收申请)" />
        </td>
    </tr>
    <tr id="Tr3" runat="server" style="display:none;">
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvFileList" runat="server" AutoGenerateColumns="false"
                AllowPaging="true" BindGridViewMethod="BindFileListGrid" OnRowCommand="gvFileList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名">
                        <ItemTemplate>
                            <a href="<%=WebAppPath %>/Sys/FileDocument/FileDownload.aspx?fileId=<%#Eval("FileId") %>"
                                title="【点击下载】<%# Eval("FileName") %>" target="_blank" style="color: Blue; text-decoration: underline;">
                                <%# Eval("FileName") %>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--  <asp:BoundField DataField="AttachmentType" HeaderText="附件类型" ItemStyle-Width="80px" />--%>
                    <asp:BoundField DataField="UploadDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd HH:mm:ss}"
                        ItemStyle-Width="120px" />
                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("FileId") %>'
                                CommandName="DeleteData">
                                        <img alt="删除" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" title="点击删除该文件"
                                         onclick="return confirm('-确定删除该文件吗？');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            建议专家清单
        </td>
        <td colspan="5">
            <table style="width:100%;">
                <tr runat="server" DisplayStatus="(23.提出验收申请)(23.修改验收申请)">
                    <td style="text-align:right;">
                        新增
                        <zhongsoft:XHtmlInputText ID="txtExpertNum" runat="server" class="kpms-textbox" regex="^\d{0,6}$" style="width:40px;"  errmsg="请填写整数" ActiveStatus="(23.提出验收申请)(23.修改验收申请)"/>行
                        <asp:Button ID="btnAddExpert" runat="server" Text="新增" OnClick="btnAddExpert_Click" ActiveStatus="(23.提出验收申请)(23.修改验收申请)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="pgvExpert" runat="server" AutoGenerateColumns="false" DataKeyNames="SuggestExpertID"
                            AllowPaging="false" BindGridViewMethod="UserControl.BindExpertListGrid" UseDefaultDataSource="true" OnRowCommand="pgvExpert_RowCommand" OnRowDataBound="pgvExpert_RowDataBound" ActiveStatus="(123.*)">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="姓名">
                                    <ItemTemplate>
                                        <zhongsoft:LightObjectSelector runat="server" ID="txtCheckerName" Width="200px" IsMutiple="false" Value='<%#Eval("ExpertName") %>'
                                            SelectPageMode="Dialog" SourceMode="SelectorPage" Visible="false" Writeable="true"
                                            ShowJsonRowColName="true" PageWidth="750px" DoCancel="true" ResultAttr="name"
                                            ShowAttrs="name,LoginId" ResultForControls="{'hiExpertID':'id','hiExpertName':'name'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx">
                                        </zhongsoft:LightObjectSelector>
                                        <input id="hiExpertID" runat="server" type="hidden" value='<%#Eval("ExpertID") %>'/>
                                        <input id="hiExpertName" runat="server" type="hidden" value='<%#Eval("ExpertName") %>'/>
                                        <asp:TextBox  runat="server"  TextEdit="true" ID="tbExpertName" Text='<%# Eval("ExpertName") %>'
                                                        CssClass="kpms-textbox" EnableTheming="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="是否院内" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                        <asp:CheckBox ID="cbIsInstitute" runat="server" rownum='<%#Container.DataItemIndex%>' AutoPostBack="true" OnCheckedChanged="cbIsInstitute_CheckedChanged"/>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("SuggestExpertID") %>'
                                            CommandName="DeleteData">
                                                    <img alt="删除" src="../../Themes/Images/btn_dg_delete.gif" title="点击删除该条数据"
                                                        onclick="return confirm('确定删除吗？');"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            验收文件列表
        </td>
        <td colspan="5">
            <zhongsoft:LightPowerGridView ID="pgvCheckFile" runat="server" AutoGenerateColumns="false" DataKeyNames="TaskID,TaskType"
                AllowPaging="false" BindGridViewMethod="UserControl.BindCheckFileGrid" UseDefaultDataSource="true" OnRowCommand="pgvCheckFile_RowCommand" OnRowDataBound="pgvCheckFile_RowDataBound" ActiveStatus="(123.*)">
                <Columns>
                    <asp:TemplateField HeaderText="分类">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbTaskType" Text='<%# Eval("TaskType") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="任务名称">
                        <ItemTemplate>
                            <asp:TextBox runat="server" ReadOnly="true" ID="tbTaskName" Text='<%# Eval("TaskName") %>'></asp:TextBox>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="任务校审单">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbUploadFileUrl" Text='<%# Eval("UploadFileUrl") %>'></asp:Label>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnView" EnableTheming="false" runat="server">
                                        <img alt="查看" src="../../Themes/Images/btn_chakan.gif" title="查看"/>
                            </asp:LinkButton>
                            <zhongsoft:LightFileUploader runat="server" Visible="false" CommandArgument='<%#Eval("TaskID")+","+Eval("TaskType") %>' ID="lbtnUpload" CssClass="subtoolbarlink" Multiselect="true" FileSourceId='<%#Eval("TaskID") %>' FileSourceFlag="CatalogTree" rowid=""
                            EnableTheming="false" OnClick="lbtnUpload_Click" markType="0"> 
                                <img alt="上传" src="../../Themes/Images/btn_upload.gif" title="上传"/>
                            </zhongsoft:LightFileUploader>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="操作" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("TaskID")+","+Eval("TaskType") %>'
                                CommandName="DeleteData" Visible="false">
                                        <img alt="删除" src="../../Themes/Images/btn_dg_delete.gif" title="点击删除该条数据"
                                            onclick="return confirm('确定删除吗？');"/>
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            知识产权
        </td>
        <td colspan="5">
             <table style="width:100%;">
                <tr runat="server" DisplayStatus="(23.提出验收申请)(23.修改验收申请)">
                    <td style="text-align:right;">
                       新增
                        <zhongsoft:XHtmlInputText ID="txtPropNum" runat="server" class="kpms-textbox" regex="^\d{0,6}$" style="width:40px;"  errmsg="请填写整数" ActiveStatus="(23.提出验收申请)(23.修改验收申请)"/>行
                        <asp:Button ID="btnAddProp" runat="server" Text="新增" OnClick="btnAddProp_Click" ActiveStatus="(23.提出验收申请)(23.修改验收申请)" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <zhongsoft:LightPowerGridView ID="pgvPropList" runat="server" AutoGenerateColumns="false" DataKeyNames="IntellectualPropID"
                            AllowPaging="false" BindGridViewMethod="UserControl.BindPropListGrid" UseDefaultDataSource="true" OnRowCommand="pgvPropList_RowCommand" OnRowDataBound="pgvPropList_RowDataBound" ActiveStatus="(123.*)">
                            <Columns>
                                <asp:TemplateField HeaderText="序号" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="分类" ItemStyle-Width="100px" >
                                    <ItemTemplate>
                                        <asp:DropDownList  runat="server" ID="ddlPropType"></asp:DropDownList>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="名称" ItemStyle-Width="150px" >
                                    <ItemTemplate>
                                        <asp:TextBox  runat="server"  TextEdit="true" ID="tbPropName" Text='<%# Eval("PropName") %>'
                                            CssClass="kpms-textbox" EnableTheming="false"></asp:TextBox>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="状态" ItemStyle-Width="30px">
                                    <ItemTemplate>
                                         <asp:Label runat="server" ID="lbPropState" Text='<%# Eval("PropState") %>'></asp:Label>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="证书及证明" ItemStyle-Width="45px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnView" EnableTheming="false" runat="server">
                                            <img alt="查看" src="../../Themes/Images/btn_chakan.gif" title="查看"/>
                                        </asp:LinkButton>
                                        <zhongsoft:LightFileUploader runat="server" CommandArgument='<%#Eval("IntellectualPropID") %>' ID="lbtnUpload" CssClass="subtoolbarlink" Multiselect="true" FileSourceId='<%#Eval("IntellectualPropID") %>' FileSourceFlag="Module"
                                        EnableTheming="false" OnClick="lbtnUpload_Click" markType="1"> 
                                            <img alt="上传" src="../../Themes/Images/btn_upload.gif" title="上传"/>
                                        </zhongsoft:LightFileUploader>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <asp:TemplateField HeaderText="操作" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" EnableTheming="false" runat="server" CommandArgument='<%#Eval("IntellectualPropID") %>'
                                            CommandName="DeleteData">
                                                    <img alt="删除" src="../../Themes/Images/btn_dg_delete.gif" title="点击删除该条数据"
                                                        onclick="return confirm('确定删除吗？');"/>
                                        </asp:LinkButton>
                                    </ItemTemplate>
                                </asp:TemplateField>
                            </Columns>
                        </zhongsoft:LightPowerGridView>
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<%--流程主键  --%>
<input type="hidden" runat="server" id="hiSRPMProjectCheckID" field="SRPMProjectCheckID"
    tablename="SRPM_ProjectCheckForm" />
<input type="hidden" runat="server" id="hiAcceptanceMethod" field="AcceptanceMethod"
    tablename="SRPM_ProjectCheckForm" value="验收" />
<script type="text/javascript">


    //统一附件上传
    function uploadFileOfSRPMProjectApplicatin() {

        var fileSourceId = "<%=BusinessObjectId %>";
        var url = buildQueryUrl("<%=WebAppPath %>/Sys/FileDocument/FileUploader.aspx?fileSourceFlag=Form&buildSelfFolder=False", { fileSourceId: fileSourceId });
       
         showDivDialog(url, null, 850, 700, editProjectCallBackU);
        return false; 
    }

      function editProjectCallBackU(re) {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFile,"") %>
            return true;
        }
    function AfterSelectOrg() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindgv,"") %>
    }
</script>
<script type="text/javascript">
    function allShowTip(fid) {
        var actionType = 'Read';
        if (('<%=CurrentActivityName%>'=="提出验收申请"||'<%=CurrentActivityName%>'=="修改验收申请")&&'<%=ActionType.ToString().ToLower()%>'!="read") {
            actionType = 'Update';
        }
        var url = buildQueryUrl("<%=WebAppPath %>/TSM/List/TM/FileView.aspx", { FileSourceID: fid,ActionType:actionType });
        showDivDialog(url, null, 850, 700, null);
        return false; 
    }
</script>