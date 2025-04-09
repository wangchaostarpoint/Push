<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ReferenceConfirmationForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_ReferenceConfirmationForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbPhaseName':'PhaseName','hiParamPhaseID':'ParamPhaseID','hiPhaseCode':'PhaseCode'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" OnClick="lbsProjectName_OnClick"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_ReferenceConfirmation" field="ProjectName"
                activestatus="(2.填写参考资料确认单)" />
            <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" tablename="EPMS_ReferenceConfirmation" field="OrganizationID" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="tbPhaseName" runat="server" readonly="readonly" maxlength="16"
                class="kpms-textbox" activestatus="(2.填写参考资料确认单)" tablename="EPMS_ReferenceConfirmation" field="PhaseName" />
            <input type="hidden" runat="server" id="hiParamPhaseID" tablename="EPMS_ReferenceConfirmation" field="ParamPhaseID" />
            <input type="hidden" runat="server" id="hiPhaseCode" tablename="EPMS_ReferenceConfirmation" field="PhaseCode" />
        </td>
    </tr>
    <tr>
        <td class="td-l">专业<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlSpecialty" activestatus="(23.填写参考资料确认单)" tablename="EPMS_ReferenceConfirmation" field="SpecialtyID" req="1" />
            <input type="hidden" id="hiSpecialtyName" name="hiSpecialtyName" runat="server" tablename="EPMS_ReferenceConfirmation" field="SpecialtyName"/>
        </td>
        <td class="td-l">主设人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtPutForwardUserName" readonly="readonly" tablename="EPMS_ReferenceConfirmation"
                field="PutForwardUserName" class="kpms-textbox" activestatus="(23.填写参考资料确认单)" />
            <input type="hidden" runat="server" id="hiPutForwardUserID" tablename="EPMS_ReferenceConfirmation" field="PutForwardUserID" />
        </td>
        <td class="td-l">提出日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox" ID="txtPutForwardDate" tablename="EPMS_ReferenceConfirmation" field="PutForwardDate" activestatus="(23.填写参考资料确认单)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">专工</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtZGUserName" readonly="readonly" tablename="EPMS_ReferenceConfirmation"
                field="ZGUserName" class="kpms-textbox" activestatus="(3.专工验证)" />
            <input type="hidden" runat="server" id="hiZGUserId" tablename="EPMS_ReferenceConfirmation" field="ZGUserId" />
        </td>
        <td class="td-l">验证日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtZGUserId" readonly="readonly" class="kpms-textbox" tablename="EPMS_ReferenceConfirmation" field="ZGCheckDate"
                activestatus="(3.专工验证)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">设总</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSZUserName" readonly="readonly" tablename="EPMS_ReferenceConfirmation"
                field="SZUserName" class="kpms-textbox" activestatus="(3.设总审批)" />
            <input type="hidden" runat="server" id="hiSZUserID" tablename="EPMS_ReferenceConfirmation" field="SZUserID" />
        </td>
        <td class="td-l">审批日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtSZCheckDate" readonly="readonly" class="kpms-textbox" tablename="EPMS_ReferenceConfirmation" field="SZCheckDate"
                activestatus="(23.设总审批)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">总工</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtChiefUserName" readonly="readonly" tablename="EPMS_ReferenceConfirmation"
                field="ChiefUserName" class="kpms-textbox" activestatus="(3.总工审批)" />
            <input type="hidden" runat="server" id="hiChiefUserID" tablename="EPMS_ReferenceConfirmation" field="ChiefUserID" />
        </td>
        <td class="td-l">审批日期</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" readonly="readonly" class="kpms-textbox" ID="txtChiefCheckDate" tablename="EPMS_ReferenceConfirmation"
                field="ChiefCheckDate" activestatus="(3.总工审批)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td colspan="6">
            <table class="tz-table" width="100%" id="CustomerSatisfaction">
                <tr>
                    <td colspan="6" align="right" style="text-align: right">
                        <asp:Button ID="btnUpLoadCS" runat="server" Text="上传参考资料" displaystatus="(23.填写参考资料确认单)" />
                    </td>
                </tr>
                <tr>
                    <td colspan="6">
                        <zhongsoft:LightPowerGridView AllowPaging="true" PageSize="10" ID="gvList" UseDefaultDataSource="True" OnRowCommand="gvList_OnRowCommand"
                            DataKeyNames="FileId,ParamSpecialtyID" runat="server" BindGridViewMethod="BindData" Width="100%" OnRowDataBound="gvList_OnRowDataBound" PermissionStatus="True">
                            <PagerStyle HorizontalAlign="Right"></PagerStyle>
                            <PagerStyle HorizontalAlign="Right"></PagerStyle>
                            <Columns>
                                <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <%#Container.DataItemIndex+1 %>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <asp:TemplateField HeaderText="资料名称" ItemStyle-Width="20%">
                                    <ItemTemplate>
                                        <div style="width: 100px; white-space: normal; word-break: break-all; word-wrap: break-word;">
                                            <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("fileId") %>"
                                                target="_blank" title="<%# Eval("FileName") %>" style="text-decoration: underline; color: Blue"><%# Eval("FileName") %></a>
                                        </div>
                                    </ItemTemplate>
                                </asp:TemplateField>
                                <zhongsoft:LightTemplateField HeaderText="参考工程(或厂家)及资料内容" ItemStyle-Width="60%">
                                    <ItemTemplate>
                                        <zhongsoft:LightTextBox runat="server" ID="txtContent" TextMode="MultiLine" Text='<%#Eval("RefProjAndContent") %>'
                                            Rows="3" CssClass="kpms-textarea" MaxLength="1024" EnableTheming="False" activestatus="(23.填写参考资料确认单)"/>
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <zhongsoft:LightTemplateField HeaderText="涉及专业" ItemStyle-Width="10%">
                                    <ItemTemplate>
                                        <zhongsoft:LightDropDownList runat="server" ID="ddlSpecial" activestatus="(23.填写参考资料确认单)" />
                                    </ItemTemplate>
                                </zhongsoft:LightTemplateField>
                                <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                                    <ItemTemplate>
                                        <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="False" CommandName="remove" CommandArgument='<%#Eval("FileId") %>'>
                                            <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除？')"
                                                 src="../../Themes/Images/btn_dg_delete.gif"  border="0" />
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
<input type="hidden" runat="server" id="hiReferenceConfirmationID" tablename="EPMS_ReferenceConfirmation" field="ReferenceConfirmationID" />

<asp:Button runat="server" ID="btnUpLoadCallBack" Visible="False" OnClick="btnUpLoadCallBack_OnClick" />
<script type="text/javascript">
    function checkForm() {
        if ($formAction == 2) {
            if ($actName == "填写参考资料确认单") {
                var value = $("#<%=hiOrganizationId.ClientID %>").val();
                if (value == "") {
                    alert("请选择项目！");
                    return false;
                }
            }
        }
        else if ($formAction == 0) {
            var gvList = $("#<%=gvList.ClientID %>")[0];
            if (gvList.rows.length == 2) {
                if (gvList.rows[1].cells[0].innerText == "没有要查找的数据") {
                    alert("请上传参考资料!");
                    return false;
                }
            }
        }
        return true;
    }

    //上传附件
    function uploadFileAndType(flag, fileType) {
        var fileSrcId = "<%=BusinessObjectId%>";
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }

    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnUpLoadCallBack,"") %>
    }

</script>
