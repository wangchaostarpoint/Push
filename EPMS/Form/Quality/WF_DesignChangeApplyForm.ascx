<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignChangeApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_DesignChangeApplyForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">申请人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApplyUserName" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计变更申请表)" field="ApplyUserName" tablename="EPMS_DesignChangeApply" />
            <input type="hidden" id="hiApplyUserID" runat="server" field="ApplyUserID" tablename="EPMS_DesignChangeApply" />
        </td>
        <td class="td-l">申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApplyDeptName" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计变更申请表)" field="ApplyDeptName" tablename="EPMS_DesignChangeApply" />
            <input type="hidden" id="hiApplyDeptID" runat="server" field="ApplyDeptID" tablename="EPMS_DesignChangeApply" />
        </td>
        <td class="td-l">申请时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtApplyDate" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计变更申请表)" field="ApplyDate" tablename="EPMS_DesignChangeApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode'}"
                EnableTheming="false" PageWidth="900px"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" ActiveStatus="(23.填写设计变更申请表)" field="ProjectName" tablename="EPMS_QualityActivityOfProject" />
            <input type="hidden" id="hiOrganizationID" runat="server" field="OrganizationID" tablename="EPMS_DesignChangeApply" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly"
                ActiveStatus="(23.填写设计变更申请表)" field="ProjectCode" tablename="EPMS_DesignChangeApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">变更类型<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblChangeType" RepeatDirection="Horizontal" req="1" RepeatColumns="3"
                field="ChangeType" tablename="EPMS_DesignChangeApply" ActiveStatus="(23.填写设计变更申请表)" >
            </asp:RadioButtonList>
        </td>
        <td class="td-l">变更编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtChangeCode" runat="server"  
                field="ChangeCode" tablename="EPMS_DesignChangeApply" ActiveStatus="(23.填写设计变更申请表)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否需会签<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsSign" RepeatDirection="Horizontal" req="1"
                field="IsSign" tablename="EPMS_DesignChangeApply" ActiveStatus="(23.填写设计变更申请表)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
            </asp:RadioButtonList></td>
        <td class="td-l">会签部门</td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbSignDeptName" IsMutiple="true"
                SelectPageMode="Dialog" ResultForControls="{'hiSignDeptID':'id'}" EnableTheming="false"
                Text="选择会签部门" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" field="SignDeptName" tablename="EPMS_DesignChangeApply" ActiveStatus="(23.填写设计变更申请表)" />
            <input type="hidden" id="hiSignDeptID" runat="server" field="SignDeptID" tablename="EPMS_DesignChangeApply" /></td>
    </tr>
    <tr>
        <td class="td-l">变更原因<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList ID="cblChangeReason" runat="server" RepeatColumns="1" req="1" RepeatDirection="Horizontal" ActiveStatus="(23.填写设计变更申请表)"></asp:CheckBoxList>
            <input type="hidden" id="hiChangeReason" runat="server" field="ChangeReason" tablename="EPMS_DesignChangeApply" />
        </td>
    </tr>
    <tr>
        <td class="td-l">变更内容<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeContent" runat="server" MaxLength="1024" req="1" CssClass="kpms-textarea" TextMode="MultiLine"
                ActiveStatus="(23.填写设计变更申请表)" EnableTheming="false" field="ChangeContent" tablename="EPMS_DesignChangeApply" /></td>
    </tr>
    <tr>
        <td class="td-l">变更对工程组成部分及<br />
            已交付设计产品的影响<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeAffect" runat="server" MaxLength="1024" req="1" CssClass="kpms-textarea" TextMode="MultiLine"
                ActiveStatus="(23.填写设计变更申请表)" EnableTheming="false" field="ChangeAffect" tablename="EPMS_DesignChangeApply" /></td>
    </tr>
     <tr>
        <td class="td-l">附件</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server"  DisplayStatus="(23.填写设计变更申请表)"  ActiveStatus="(23.填写设计变更申请表)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
            <uc1:AttachmentView ID="Attachment" runat="server" />
        </td>
    </tr> 
</table>
<input id="hiDesignChangeApplyID" runat="server" type="hidden" field="DesignChangeApplyID" tablename="EPMS_DesignChangeApply" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>