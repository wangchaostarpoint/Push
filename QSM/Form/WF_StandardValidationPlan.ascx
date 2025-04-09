<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_StandardValidationPlan.ascx.cs" Inherits="Zhongsoft.Portal.QSM.Form.WF_StandardValidationPlan" %>

<table  class="tz-table" width="100%">
    <tr>
        <td class="td-l">
            编制人
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiDraftManID" field="DraftManID" tablename="EPMS_StandardValidationPlan" />
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftManName" readonly="readonly" class="kpms-textbox"
                style="width: 80px" field="DraftManName" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" />
        </td>
        <td class="td-l">
            编制部门
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDeptName" readonly="readonly" class="kpms-textbox"
                field="DraftDeptName" tablename="EPMS_StandardValidationPlan" activestatus="(23.编制评审计划)(3.修改评审计划)" />
            <input type="hidden" runat="server" id="hiDraftDeptID" field="DraftDeptID" tablename="EPMS_StandardValidationPlan" />
        </td>
        <td class="td-l">
            编制日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText type="text" runat="server" id="txtDraftDate" readonly="readonly" class="kpms-textbox"
                style="width: 70px" field="DraftDate" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">
            评审类型<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlValidationType" runat="server" field="ValidationType" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" req="1">
                <asp:ListItem Value="">请选择</asp:ListItem>
                <asp:ListItem Value="内审">内审</asp:ListItem>
                <asp:ListItem Value="外审">外审</asp:ListItem>
                <asp:ListItem Value="管理评审">管理评审</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">
            计划评审年度<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="3">
            <zhongsoft:LightDropDownList ID="ddlValidationYear" runat="server" field="ValidationYear" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" req="1" Width="100px">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">
            计划名称<span class="req-star">*</span>
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbPlanName" field="PlanName" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" req="1" MaxLength="128"></zhongsoft:LightTextBox>
        </td>
    </tr>
    
    <tr>
        <td class="td-l">
            备注
        </td>
        <td class="td-r" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbRemark" field="Remark" maxtext="512" tablename="EPMS_StandardValidationPlan"
                activestatus="(23.编制评审计划)(3.修改评审计划)" CssClass="kpms-textarea" EnableTheming="false"
                TextMode="MultiLine"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>

<div class="kpms-rollist-divlast">
    <div id="trFileDetail">
        <table class="kpms-rollistnew" width="100%">
            <tr>
                <td id="Td4" colspan="6" class="kpms-rollist" align="right" runat="server" displaystatus="(23.编制评审计划)(23.修改评审计划)">
                    <asp:Button ID="btnAddFile" Text="添加评审计划文件" runat="server" OnClientClick="return UpFile();"
                        displaystatus="(23.编制评审计划)(23.修改评审计划)" OnClick="btnAddFile_Click" class="kpms-buttonfree" /> 
                </td>
            </tr>
            <tr>
                <td colspan="6">
                    <zhongsoft:LightPowerGridView ID="pdgFile" runat="server" DataBorderSize="1" ShowBorder="True"
                        FlashColor="#C1D2EE" AutoGenerateColumns="False" Width="100%" IsShowSave="False"
                        IsShowPrint="False" CacheRecordCount="False" ExportSqlCommand="" oldvalue="oldlace"
                        singlevalue="#FFFFFF"  OnRowDataBound="gvSubComputer_RowDataBound">
                        <Columns>
                            <asp:TemplateField HeaderText="文件名称">
                                <ItemTemplate>
                                    <a runat="server" id="aFileName" style="text-decoration: underline; color: #0033FF;">
                                        <%#Eval("FileName")%></a>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="删除" ItemStyle-Width="10%" Visible="false">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                                <ItemTemplate>
                                    <asp:LinkButton ID="lbDelete" runat="server" OnCommand="lbDelete_Click" CommandArgument='<%#Eval("fileId") %>'  EnableTheming="false" >
										            <img id="btDelete" title="删除" onclick="if(!confirm('确认要删除吗？')) return false;" 
										src="/Portal/Themes/Images/btn_dg_delete.gif" border="0" alt="删除" /></asp:LinkButton>
                                            <asp:ImageButton ID="ibtnDelete" runat="server" Visible="false" CausesValidation="False" ImageUrl="~/themes/images/btn_dg_delete.gif"
                                OnClientClick="return confirm('确定删除？');" CommandName="remove" CommandArgument='<%#DataBinder.Eval(Container.DataItem,"fileId") %>'
                                 >
                            </asp:ImageButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </zhongsoft:LightPowerGridView>
                </td>
            </tr>
        </table>
    </div>
</div>
<input type="hidden" runat="server" id="hiStandardValidationPlanID" field="StandardValidationPlanID"
    tablename="EPMS_StandardValidationPlan" />
<!--生产技术部部门id-->
<input type="hidden" id="hiJZ" runat="server" value="e1ec4711-bb99-437d-8c19-965e93afdf7e" />

<script type="text/javascript">
    function checkForm() {//原有方法: KPMSCheckSubmit
        if ($formAction == 0) {//原有属性: $readyFormSend
            if ($actName == "编制评审计划" || $actName == "修改评审计划") {//$actName 系统变量
                var fileTable = document.getElementById('<%=pdgFile.ClientID %>');
                var fileCnt = fileTable.rows.length;
               if (fileCnt < 2) {
                    alert("请上传评审计划文件！");
                    return false;
                } else {
                    return true;
                }
            }
        }
        return true;
    } 
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