<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="LearnAssociationEntity.aspx.cs"
 Inherits="Zhongsoft.Portal.TSM.List.TM.LearnAssociationEntity" Title="学会协会年度缴费信息"  MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                缴费年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPrepareYear" field="LearnYear"
                    req="1" tablename="TM_LearnAssociationEntity" activestatus="(23.*)" Width="100px">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                缴费金额(元)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContactsMoney" CssClass="kpms-textbox-money"
                    Width="70px" req="1" MaxLength="13" field="ContactsMoney" tablename="TM_LearnAssociationEntity"
                    activestatus="(23.*)" Regex="(^[1-9]\d{0,9}(\.\d{1,2})?$)|(^[0]\.\d{1,2}$)" ErrMsg="请填写正数，小数点后最多保留2位"></zhongsoft:LightTextBox>
            </td>
        </tr>
         
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="kpms-fim-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" Field="Memo" ActiveStatus="(23.*)"
                    maxtext="256" Width="95%" EnableTheming="false" CssClass="kpms-textarea" TextMode="MultiLine"
                    Rows="3" TableName="TM_LearnAssociationEntity" />
            </td>
        </tr> 
    </table>
    <!---主键Id--->
    <input id="hiLearnAssociationEntityID" type="hidden" tablename="TM_LearnAssociationEntity"
        field="LearnAssociationEntityID" runat="server" /> 
        
    <input type="hidden" runat="server" id="hiLearnAssociationInfoID" tablename="TM_LearnAssociationEntity"
        field="LearnAssociationInfoID" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkMaxLength();
            checkRegex();
        }
         
    </script>
</asp:Content>
