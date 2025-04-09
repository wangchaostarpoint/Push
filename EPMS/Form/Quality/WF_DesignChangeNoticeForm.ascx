<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignChangeNoticeForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Quality.WF_DesignChangeNoticeForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">申请人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApplyUserName" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计更改通知单)" field="ApplyUserName" tablename="EPMS_DesignChangeNotice" />
            <input type="hidden" id="hiApplyUserID" runat="server" field="ApplyUserID" tablename="EPMS_DesignChangeNotice" />
        </td>
        <td class="td-l">申请部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtApplyDeptName" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计更改通知单)" field="ApplyDeptName" tablename="EPMS_DesignChangeNotice" />
            <input type="hidden" id="hiApplyDeptID" runat="server" field="ApplyDeptID" tablename="EPMS_DesignChangeNotice" />
        </td>
        <td class="td-l">申请时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtApplyDate" runat="server" readonly="readonly"
                ActiveStatus="(2.填写设计更改通知单)" field="ApplyDate" tablename="EPMS_DesignChangeNotice" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="tbProjectName" IsMutiple="false" req="1"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectCode':'ProjectCode'}"
                EnableTheming="false" PageWidth="900px"
                Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
                ResultAttr="name" ActiveStatus="(23.填写设计更改通知单)" field="ProjectName" tablename="EPMS_DesignChangeNotice" />
            <input type="hidden" id="hiOrganizationID" runat="server" field="OrganizationID" tablename="EPMS_DesignChangeNotice" />
        </td>
        <td class="td-l">项目编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="tbProjectCode" runat="server" readonly="readonly"
                ActiveStatus="(23.填写设计更改通知单)" field="ProjectCode" tablename="EPMS_DesignChangeNotice" />
        </td>
    </tr>
    <tr>
        <td class="td-l">更改图纸（文件）编号<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox class="kpms-textbox" ID="txtDrawingNo" runat="server" req="1"
                ActiveStatus="(23.填写设计更改通知单)" field="DrawingNo" tablename="EPMS_DesignChangeNotice" />
        </td>
        <td class="td-l" style="display:none;">主送单位<span class="req-star">*</span></td>
        <td class="td-m" colspan="3" style="display:none;">
            <zhongsoft:LightObjectSelector runat="server" ID="tbHostDept" IsMutiple="true" 
                SelectPageMode="Dialog" ResultForControls="{'hiHostDeptID':'id'}" EnableTheming="false"
                Text="选择主送单位" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" field="HostDeptName" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)" />
            <input type="hidden" id="hiHostDeptID" runat="server" field="HostDeptID" tablename="EPMS_DesignChangeNotice" />
        </td>
    </tr>
    <tr>
        <td class="td-l">更改图纸（文件）名称<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox class="kpms-textbox" ID="txtDrawingName" runat="server"
                ActiveStatus="(23.填写设计更改通知单)" field="DrawingName" tablename="EPMS_DesignChangeNotice" />
        </td>
        <td class="td-l" style="display:none;">抄送单位</td>
        <td class="td-m" colspan="3" style="display:none;">
            <zhongsoft:LightObjectSelector runat="server" ID="tbCopyDept" IsMutiple="true" SelectPageMode="Dialog" ResultForControls="{'hiCopyDeptID':'id'}" EnableTheming="false"
                Text="选择抄送单位" PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" field="CopyDeptName" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)" />
            <input type="hidden" id="hiCopyDeptID" runat="server" field="CopyDeptID" tablename="EPMS_DesignChangeNotice" />
        </td>
    </tr>
    <tr>
        <td class="td-l">变更分类<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblChangeType" RepeatDirection="Horizontal" req="1" RepeatColumns="3"
                field="ChangeType" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">变更编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtChangeCode" runat="server"
                field="ChangeCode" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计更改原因<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <asp:CheckBoxList ID="cblChangeReason" runat="server" RepeatColumns="1" req="1" RepeatDirection="Horizontal" ActiveStatus="(23.填写设计更改通知单)"></asp:CheckBoxList>
            <input type="hidden" id="hiChangeReason" runat="server" field="ChangeReason" tablename="EPMS_DesignChangeNotice" />
        </td>
    </tr>
     <tr style="display:none;">
         <td class="td-l">本次修改<br />对工程组成部分<br />及已交付产品的影响
         </td>
         <td class="td-r">
             <asp:RadioButtonList runat="server" ID="rblIsAffect" RepeatDirection="Horizontal"  
                 field="IsAffect" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)">
                 <asp:ListItem Text="有" Value="1"></asp:ListItem>
                 <asp:ListItem Text="无" Value="0"></asp:ListItem>
             </asp:RadioButtonList>
         </td>
         <td class="td-l">是否需会签
         </td>
         <td class="td-m" colspan="3">
             <asp:RadioButtonList runat="server" ID="rblIsSign" RepeatDirection="Horizontal"  
                 field="IsSign" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)">
                 <asp:ListItem Text="是" Value="1"></asp:ListItem>
                 <asp:ListItem Text="否" Value="0"></asp:ListItem>
             </asp:RadioButtonList>
         </td>
    </tr>
     <tr>
        <td class="td-l">变更详细原因<br />及变更内容 
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbChangeContent" runat="server" MaxText="5000" TextMode="MultiLine"
                CssClass="kpms-textarea" EnableTheming="false" ActiveStatus="(23.填写设计更改通知单)"
                Field="ChangeContent" TableName="EPMS_DesignChangeNotice" />
        </td>
    </tr>
    <tr style="display:none;">
        <td class="td-l">是否已现场签认<span class="req-star">*</span></td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsNowSign" RepeatDirection="Horizontal" 
                field="IsNowSign" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)">
                <asp:ListItem Text="是" Value="1"></asp:ListItem>
                <asp:ListItem Text="否" Value="0" Selected="True"></asp:ListItem>
            </asp:RadioButtonList></td>
        <td class="td-l">文件编号</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox" ID="txtFileCode" runat="server"
                field="FileCode" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)" />
        </td>
        <td class="td-l">附：文件扫描/复印件</td>
        <td class="td-r">
            <asp:CheckBox ID="cbIsAttachment" runat="server" field="IsAttachment" tablename="EPMS_DesignChangeNotice" ActiveStatus="(23.填写设计更改通知单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">附件</td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightFileUploader ID="upLoadFile" runat="server" DisplayStatus="(23.填写设计更改通知单)" ActiveStatus="(23.填写设计更改通知单)" OnClick="upLoadFile_Click">
                <span>
                    <img id="imgFile" src="<%=WebAppPath %>/Themes/Images/btn_upload.gif" alt="上传文件" width="16"  height="16" />上传文件</span>
            </zhongsoft:LightFileUploader>
            <uc1:AttachmentView ID="Attachment" runat="server" RepeatColumns="1" />
        </td>
    </tr>
</table>
<input id="hiDesignChangeNoticeID" runat="server" type="hidden" field="DesignChangeNoticeID" tablename="EPMS_DesignChangeNotice" />
<script type="text/javascript">
    function initCustomerPlugin() {
        //隐藏附件功能
        $("#FormToolBar_LinkAttachment").hide();
        $("#partAttachment").hide();
    }
</script>
