<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="WBSCompleteRateEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WBSCompleteRateEditor" Title="安排计划时间"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <%--<tr content="Sjr">
            <td class="td-l">
                完成百分比<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbCompleteRate" activestatus="(23.*)"
                    EnableTheming="false" CssClass="kpms-textbox-money" Regex="^([1-9]\d{0,2}|[0])(\.\d{1,4})?$"
                    errmsg="请输入正数，最多3位整数，4位小数" onBlur="ontextBlur()" req="1"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlWBSState" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" content="RollComplete">
                实际完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtFactCompleteDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>--%>
        <tr content="Szr">
            <td class="td-l">
                计划开始时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanStartTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                计划完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l" wbstype="roll">
                计划个人出手时间
            </td>
            <td class="td-r" wbstype="roll">
                <zhongsoft:XHtmlInputText ID="txtPlanHandTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr content="Szr" wbstype="roll">
            <td class="td-l">
                计划互校完成时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanCheckTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                计划科室交出时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanRecheckTime1" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                计划部交出时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanRecheckTime2" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr content="Szr" wbstype="roll">
            <td class="td-l">
                计划交付时间
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:XHtmlInputText ID="txtPlanDeliveryTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr content="Sjr">
            <td class="td-l">
                存在的问题
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbExistProblems" CssClass="kpms-textarea"
                    EnableTheming="false" activestatus="(23.*)" TextMode="MultiLine" maxtext="512"
                    Rows="4">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Sjr">
            <td class="td-l">
                解决措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMeasures" CssClass="kpms-textarea" EnableTheming="false"
                    activestatus="(23.*)" TextMode="MultiLine" maxtext="512" Rows="4">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr content="Szr">
            <td class="td-l">
                负责人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtOwner" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" Filter="{'RoleID':'EF7DA59B-5DE3-4B57-8AFD-204070718407'}"
                    PageWidth="850" ShowAttrs="name,UserCode" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                </zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                校核人
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtChecker" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" Filter="{'RoleID':'5FF8A6A1-73B6-4D20-A99F-4A393F4197E9'}"
                    PageWidth="850" ShowAttrs="name,UserCode" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                </zhongsoft:LightObjectSelector>
            </td>
        </tr>
    </table>
    <script type="text/javascript">


    </script>
</asp:Content>
