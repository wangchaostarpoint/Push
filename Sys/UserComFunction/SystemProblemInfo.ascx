<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="SystemProblemInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.Sys.UserComFunction.SystemProblemInfo" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            功能页面<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <%--<zhongsoft:LightObjectSelector runat="server" ID="lbsSelectPage" req="1" IsMutiple="false"
            SelectPageMode="Dialog" ResultForControls="{'hiPageID':'id'}" EnableTheming="false"
            Text="选择功能页面" PageUrl="~/Sys/Menu/PageSelector.aspx" ShowJsonRowColName="true"
            ResultAttr="PageName" activestatus="(23.*)(23.提出问题)" field="PageName" tablename="SystemProblemReport" />
        <input type="hidden" id="hiPageID" name="PageID" runat="server" field="PageID" tablename="SystemProblemReport" />--%>
            <zhongsoft:LightTextBox ID="tbPageName" runat="server" TableName="SystemProblemReport"
                Field="PageName" req="1" activestatus="(23.*)(23.提出问题)" MaxLength="64">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">
            工作类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlWorkType" runat="server" activestatus="(23.*)(23.提出问题)"
                Field="WorkType" TableName="SystemProblemReport" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector ID="lbsProposerName" runat="server" activestatus="(23.*)(23.提出问题)"
                TableName="SystemProblemReport" Field="ProposerName" class="kpms-textbox" IsMutiple="false"
                SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                ResultForControls="{'hiProposerID':'id','hiProposerCode':'code','hiProposeDeptID':'DEPTID','txtProposeDeptName':'DEPTNAME','txtProposerPhone':'Phone'}"
                SelectPageMode="Dialog" />
            <input type="hidden" runat="server" id="hiProposerID" field="ProposerID" tablename="SystemProblemReport" />
            <input type="hidden" runat="server" id="hiProposerCode" field="ProposerCode" tablename="SystemProblemReport" />
        </td>
        <td class="td-l">
            提出部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProposeDeptName" runat="server" readonly="readonly"
                activestatus="(23.*)(23.提出问题)" class="kpms-textbox" field="ProposeDeptName" tablename="SystemProblemReport" />
            <input id="hiProposeDeptID" type="hidden" runat="server" field="ProposeDeptID" tablename="SystemProblemReport" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            提出人电话
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProposerPhone" runat="server" readonly="readonly"
                activestatus="(23.*)(23.提出问题)" class="kpms-textbox" field="ProposerPhone" tablename="SystemProblemReport" />
        </td>
        <td class="td-l">
            提出日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtProposeTime" runat="server" activestatus="(23.*)(23.提出问题)"
                class="kpms-textbox-date" readonly="readonly" field="ProposeTime" tablename="SystemProblemReport">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            来源
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlSource" runat="server" activestatus="(23.*)(23.提出问题)"
                Field="Source" TableName="SystemProblemReport">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划处理日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtPlanHandleTime" runat="server" activestatus="(23.*)(23.提出问题)"
                class="kpms-textbox-date" readonly="readonly" field="PlanHandleTime" tablename="SystemProblemReport">
            </zhongsoft:XHtmlInputText>
        </td>
        <td class="td-l">
            实际处理日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtFactHandleTime" runat="server" activestatus="(23.*)(23.提出问题)"
                class="kpms-textbox-date" readonly="readonly" field="FactHandleTime" tablename="SystemProblemReport">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            处理人
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector ID="lbsHandlePersonName" runat="server" activestatus="(23.*)(23.提出问题)"
                TableName="SystemProblemReport" Field="HandlePersonName" class="kpms-textbox"
                IsMutiple="false" SourceMode="SelectorPage" ShowJsonRowColName="true" ResultAttr="name"
                PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ResultForControls="{'hiHandlePersonID':'id','hiHandlePersonCode':'code'}"
                SelectPageMode="Dialog" />
            <input type="hidden" id="hiHandlePersonID" name="HandlePersonID" runat="server" field="HandlePersonID"
                tablename="SystemProblemReport" />
            <input type="hidden" runat="server" id="hiHandlePersonCode" tablename="SystemProblemReport"
                field="HandlePersonCode" />
        </td>
        <td class="td-l">
            是否有效
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlIsEffective" runat="server" activestatus="(23.*)(23.提出问题)"
                Field="IsEffective" TableName="SystemProblemReport">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            项目组意见
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbProjOpinion" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.*)(23.提出问题)" TextMode="MultiLine" maxtext="1024"
                Rows="4" field="ProjOpinion" tablename="SystemProblemReport">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            描述<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbDescription" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.*)(23.提出问题)" TextMode="MultiLine" maxtext="1024"
                Rows="4" field="Description" tablename="SystemProblemReport" req="1">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            缓急程度
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlUrgency" runat="server" activestatus="(23.*)(23.提出问题)"
                Field="Urgency" TableName="SystemProblemReport">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            是否处理
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlIsHandle" runat="server" activestatus="(23.*)(23.提出问题)"
                Field="IsHandle" TableName="SystemProblemReport">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            处理意见
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbHandleOpinion" CssClass="kpms-textarea"
                EnableTheming="false" activestatus="(23.*)(23.提出问题)" TextMode="MultiLine" maxtext="1024"
                Rows="4" field="HandleOpinion" tablename="SystemProblemReport">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            工作量
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightTextBox runat="server" ID="tbWorkload" activestatus="(23.*)(23.提出问题)"
                field="Workload" tablename="SystemProblemReport" Regex="^[1-9]\d*$" errmsg="请输入整数"
                CssClass="kpms-textbox-money" EnableTheming="false" />人/日
        </td>
    </tr>
    <tr>
        <td class="td-l" colspan="4" style="font-weight: bold; text-align: center">
            附件信息<span id="files" class="req-star" runat="server" displaystatus="(2.*)">先保存再上传附件</span>
        </td>
    </tr>
    <tr id="Tr1" runat="server" displaystatus="(3.*)(3.提出问题)">
        <td class="td-m" colspan="4" style="text-align: right">
            <asp:LinkButton runat="server" ID="lbtnUpByFile" OnClientClick="uploadFileForm();"
                OnClick="lbtnUpByFile_Click" CssClass="kpms-btn" EnableTheming="false">
                    <img alt="点此上传文件" id="imgUpByFile" src="../../Themes/Images/btn_dg_upfile.gif" 
                    style="cursor:hand; border:0;" />
                    <span>上传</span>
            </asp:LinkButton>
        </td>
    </tr>
    <tr id="Tr2" runat="server" nodisplaystatus="(2.提出问题)(2.*)">
        <td colspan="4">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" DataKeyNames="FILEID" AutoGenerateColumns="False"
                AllowPaging="True" OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="60px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <asp:TemplateField HeaderText="文件名" ItemStyle-Width="90%">
                        <ItemTemplate>
                            <%-- <a href='#' onclick='downLoad("<%# Eval("FilePath") %>","<%# Eval("FileName") %>")'>
                            <%# Eval("FileName") %></a>--%>
                            <a href="/portal/sys/fileDocument/FileDownload.aspx?fileId=<%#Eval("FILEID") %>"
                                target="_parent" title="点击下载文件" class="kpms-attachmenta" style="text-decoration: underline;
                                color: #0033FF;">
                                <%# Eval("FILENAME")%>
                            </a>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--   <asp:TemplateField HeaderText="删除" Visible="false" ItemStyle-HorizontalAlign="Center"
                    HeaderStyle-Width="40px">
                    <ItemTemplate>
                        <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="remove" CommandArgument='<%#Eval("FileId") %>'>
                        <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除附件？')"
										 src="/Portal/Themes/Images/btn_dg_delete.gif" border="0" />
                        </asp:LinkButton>
                    </ItemTemplate>
                </asp:TemplateField>--%>
                    <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px"
                        Visible="false">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<!---流程主键ID-->
<input type="hidden" runat="server" id="hiFlag" tablename="SystemProblemReport" field="Flag" />
<input type="hidden" runat="server" id="hiProblemID" field="ProblemID" tablename="SystemProblemReport" />
<script type="text/javascript">
    //上传附件
    function uploadFileForm() {
        var fileSrcId = $("#<%=hiProblemID.ClientID %>").val();
        showUploadForm(fileSrcId, "Module");
        return true;
    }
</script>
