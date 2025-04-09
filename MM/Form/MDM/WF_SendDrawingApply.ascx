<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SendDrawingApply.ascx.cs" Inherits="Zhongsoft.Portal.MM.Form.MDM.WF_SendDrawingApply" %>
<table class="tz-table" width="100%">
    <tr>
        <td class="td-m" colspan="6">
            <font color="red" size="3">仅限于西安地区送图</font>
        </td>
    </tr>
    <tr>
        <td class="td-l">申请人
        </td>
        <td class="td-r" style="width: 17%">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyUserName" readonly="readonly" class="kpms-textbox" tablename="MM_SendDrawingApply" field="ApplyUserName"
                activestatus="(23.填写送图申请)" />
            <input type="hidden" runat="server" id="hiApplyUserID" tablename="MM_SendDrawingApply" field="ApplyUserID" />
        </td>
        <td class="td-l">申请时间
        </td>
        <td class="td-r" style="width: 17%">
            <zhongsoft:XHtmlInputText runat="server" ID="txtApplyDate" readonly="readonly" class="kpms-textbox-date" tablename="MM_SendDrawingApply" field="ApplyDate" activestatus="(23.填写送图申请)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">项目编号<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketID" ShowJsonRowColName="True" SelectPageMode="Dialog" Writeable="False" tablename="MM_SendDrawingApply" req="1"
                field="ProjectCode" activestatus="(23.填写送图申请)" ResultAttr="ProjectCode" ResultForControls="{'hiMarketID':'id','txtProjectName':'name'}"
                PageUrl="/EPMS/Obsolete/ProjectEntitySelector.aspx" PageWidth="800" PageHeight="600" OnClick="lbsMarketID_OnClick" />
            <input type="hidden" runat="server" id="hiMarketID" tablename="MM_SendDrawingApply" field="OrganizationID" />
        </td>
        <td class="td-l">项目名称
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectName" class="kpms-textbox" readonly="readonly" tablename="MM_SendDrawingApply" field="ProjectName"
                activestatus="(23.填写送图申请)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">送图信息<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbSendDrawingInfo" CssClass="kpms-textarea" EnableTheming="False" MaxLength="1024" Rows="3" TextMode="MultiLine"
                tablename="MM_SendDrawingApply" field="SendDrawingInfo" activestatus="(23.填写送图申请)" req="1" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否同意<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblIsAgree" onclick="isShowArgeeReasons();" RepeatDirection="Horizontal" tablename="MM_SendDrawingApply" field="IsAgree" activestatus="(3.接收)" req="1">
                <asp:ListItem Value="1">同意</asp:ListItem>
                <asp:ListItem Value="0">不同意</asp:ListItem>
            </asp:RadioButtonList>
        </td>
        <td class="td-m" colspan="4"></td>
    </tr>
    <tr flag="disagreeReasons">
        <td class="td-l">不同意原因<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbDisagreeReasons" EnableTheming="False" CssClass="kpms-textarea" Rows="3" MaxLength="1024" TextMode="MultiLine"
                tablename="MM_SendDrawingApply" field="DisagreeReasons" activestatus="(3.接收)" />
        </td>
    </tr>
</table>
<input type="hidden" runat="server" id="hiSendDrawingApplyID" tablename="MM_SendDrawingApply" field="SendDrawingApplyID" />
<script type="text/javascript">
    function initCustomerPlugin() {
        isShowArgeeReasons();
    }

    //根据是否同意 控制不同意原因的显隐
    function isShowArgeeReasons() {
        var SelectVal = $("#<%= rblIsAgree.ClientID%>").find("input:checked").val();
        if (SelectVal == "0") {
            $("[flag$='disagreeReasons']").show();
            $("#<%=tbDisagreeReasons.ClientID%>").attr("req", "1");
        } else {
            $("[flag$='disagreeReasons']").hide();
            $("#<%=tbDisagreeReasons.ClientID%>").val("");
            $("#<%=tbDisagreeReasons.ClientID%>").removeAttr("req");
        }
    }
</script>
