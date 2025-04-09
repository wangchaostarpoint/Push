<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SRPMProjectWorkArrangeEditor.aspx.cs" 
  MasterPageFile="~/UI/Master/ObjectEditor.Master"  Inherits="Zhongsoft.Portal.TSM.List.TSM.SRPMProjectWorkArrangeEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                起止日期<span class="req-star">*</span> 
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="tbStartDate" runat="server" class="kpms-textbox-comparedate"
                    compare="2" req="1" readonly="readonly" activeStatus="(23.*)" Field="StartDate"
                    TableName="SRPM_StageSchedule">
                </zhongsoft:XHtmlInputText>
                至
                <zhongsoft:XHtmlInputText ID="tbFinishDate" runat="server" class="kpms-textbox-comparedate"
                    compare="2" req="1" readonly="readonly" activeStatus="(23.*)" Field="FinishDate"
                    TableName="SRPM_StageSchedule">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                内容<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbWorkContent" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" Field="WorkContent" TableName="SRPM_StageSchedule" TextMode="MultiLine"
                    req="1" maxtext="512" activeStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                阶段成果<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbWorkResult" runat="server" CssClass="kpms-textarea"
                    EnableTheming="false" Field="WorkResult" TableName="SRPM_StageSchedule" TextMode="MultiLine"
                    req="1" maxtext="218" activeStatus="(23.*)"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr  >
            <td class="td-l">
                是否阶段检查
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblPhaseCheck" runat="server" RepeatDirection="Horizontal" field="PhaseCheck" activeStatus="(23.*)"
                    tablename="SRPM_StageSchedule"   >
                    <asp:ListItem Value="是">是</asp:ListItem>
                    <asp:ListItem Value="否">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPhaseScheduleID" field="PhaseScheduleID" tablename="SRPM_StageSchedule" />
    <input type="hidden" runat="server" id="hiProjectListID" field="ProjectListID" tablename="SRPM_StageSchedule" />
    <input type="hidden" runat="server" id="hiSRPWorkFlowID" field="SRPWorkFlowID" tablename="SRPM_StageSchedule" />
     <script type="text/javascript">
         function initCustomerPlugin() {
             checkRegex();
             checkMaxLength();
         }

    </script>
</asp:Content>

