<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ParamIdentiyItemEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ParamIdentiyItemEditor" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<%@ Import Namespace="Zhongsoft.Portal.EPMS" %>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-l">
                <span id="spanPlace">产品/活动/设施/场所</span><span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbItemName" TableName="EPMS_ParamIdentiyItem"
                    MaxLength="128" Field="Place" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                <span id="spanItemReource">环境因素</span><span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbItemReource" TableName="EPMS_ParamIdentiyItem"
                    Field="ItemReource" activestatus="(23.*)" MaxLength="128" req="1"/>
            </td>
        </tr>
        <tr itemtype=environment flag="WX">
            <td class="td-l">
                <span id="spanItemRiskAndInfluence">环境影响</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBoxList runat="server" ID="ckbItemRiskAndInfluenceType" RepeatDirection="Horizontal" activestatus="(23.*)" RepeatColumns="6" />
                <input type="hidden" runat="server" id="hiItemRiskAndInfluenceType" tablename="EPMS_ParamIdentiyItem" field="ItemRiskAndInfluence" />
                <zhongsoft:LightTextBox runat="server" activestatus="(23.*)" ID="tbItemRiskAndInfluence" Style="display: none" />
            </td>
        </tr>
        <tr>
            <td class="td-l" flag="HJWX"><span id="spanImportant">评价结果</span>
            </td>
            <td class="td-r" flag="HJWX">
                <zhongsoft:LightDropDownList runat="server" ID="ddlImportant" TableName="EPMS_ParamIdentiyItem"
                    Field="Important" activestatus="(23.*)" >
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l" itemtype="important" flag="noWX">完成时间
            </td>
            <td class="td-r" itemtype="important" flag="noWX">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCompleteTime" activestatus="(23.*)" TableName="EPMS_ParamIdentiyItem"
                    Field="CompleteTime" class="kpms-textbox-date" readonly="readonly" />
            </td>
            <td class="td-l" itemtype="danger" style="display: none">是否事故隐患
            </td>
            <td class="td-r" itemtype="danger" style="display: none">
                <zhongsoft:LightDropDownList runat="server" ID="ddlIsDanger" activestatus="(23.*)" TableName="EPMS_ParamIdentiyItem"
                    Field="IsDanger" />
            </td>
            <td class="td-m" colspan="2" itemtype="important" ></td>
            <td class="td-m" colspan="4" itemtype="environment"></td>
        </tr>
        <tr flag="HJWX">
            <td class="td-l">评价方法
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbEvaluationMethod" TableName="EPMS_ParamIdentiyItem" TextMode="MultiLine"
                    Field="EvaluationMethod" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea" EnableTheming="False" />
            </td>
        </tr>
        <tr itemtype="important">
            <td class="td-l">控制措施
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbControlDetailInfo" TableName="EPMS_ParamIdentiyItem"
                    MaxLength="1024" Field="ControlDetailInfo" activestatus="(23.*)" TextMode="MultiLine" CssClass="kpms-textarea" EnableTheming="False" />
            </td>
        </tr>
        <tr flag="HJWX">
            <td class="td-l">合规义务
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tb" TableName="EPMS_ParamIdentiyItem" TextMode="MultiLine"
                    Field="ComplianceObligation" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea" EnableTheming="False" />
            </td>
        </tr >
        <tr itemtype="important" flag="noWX">
            <td class="td-l">实施情况
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbProgressStatus" TableName="EPMS_ParamIdentiyItem" TextMode="MultiLine"
                    Field="ProgressStatus" activestatus="(23.*)" MaxLength="1024" CssClass="kpms-textarea" EnableTheming="False" />
            </td>
        </tr>
    </table>






    <table class="tz-table" style="width: 100%; display: none">
        <tr>
            <td class="td-l">级别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemLevel" TableName="EPMS_ParamIdentiyItem"
                    Field="ItemLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">状态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemState" TableName="EPMS_ParamIdentiyItem"
                    Field="ItemState" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">时态
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlItemTense" TableName="EPMS_ParamIdentiyItem"
                    Field="ItemTense" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">活动/生产/服务区域
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRegion" TableName="EPMS_ParamIdentiyItem"
                    Field="Region" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>

        </tr>
        <tr>
        </tr>
        <tr itemtype="environment">
        </tr>
        <tr>
            <td class="td-l" itemtype="danger" style="display: none">风险等级
            </td>
            <td class="td-m" itemtype="danger" style="display: none" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlRiskLevel" TableName="EPMS_ParamIdentiyItem"
                    Field="RiskLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>

        <tr>
            <td class="td-l">控制方式
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:LightDropDownList runat="server" ID="ddlControlMode" TableName="EPMS_ParamIdentiyItem"
                    Field="ControlMode" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>

        <tr>
            <td class="td-l">填写人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillUserName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamIdentiyItem" field="FillUserName" />
            </td>
            <td class="td-l">填写部门
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDeptName" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" tablename="EPMS_ParamIdentiyItem" field="FillDeptName" />
            </td>
            <td class="td-l">填写日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtFillDate" activestatus="(23.*)" readonly="readonly"
                    style="width: 70px" class="kpms-textbox-date" tablename="EPMS_ParamIdentiyItem"
                    field="FillDate" />
            </td>
        </tr>
    </table>
    <!--填写人-->
    <input type="hidden" runat="server" id="hiFillUserId" field="FillUserId" tablename="EPMS_ParamIdentiyItem" />
    <!--填写部门-->
    <input type="hidden" runat="server" id="hiFillDeptID" field="FillDeptID" tablename="EPMS_ParamIdentiyItem" />
    <!--主键ID-->
    <input type="hidden" runat="server" id="hiParamIdentiyItemID" field="ParamIdentiyItemID"
        tablename="EPMS_ParamIdentiyItem" />
    <!---类型-->
    <input type="hidden" runat="server" id="hiItemType" field="ItemType" tablename="EPMS_ParamIdentiyItem" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_ParamIdentiyItem" value="1" />
    <script>
        function initCustomerPlugin() {
            var itemType = "<%=ItemType %>";
            //危险源
            if (itemType == "<%=IdentiyItemType.危险源辨识.GetHashCode()%>") {
                $("#spanItemReource").text("危险源");
                $("#spanPlace").text("活动/设施/场所");
                $("#spanItemRiskAndInfluence").text("风险");
                //$("#spanImportant").text("是否接受");
                $("[itemtype=danger]").show();
                $("[itemtype=environment]").hide();
                $("[flag=noWX]").hide();
                $("[flag=WX]").show();
                $("#<%=ckbItemRiskAndInfluenceType.ClientID%>").css("display", "none");
                $("#<%=tbItemRiskAndInfluence.ClientID%>").css("display", "block");
            }
            else if (itemType == "<%=IdentiyItemType.环境因素识别.GetHashCode()%>") {
                $("#spanPlace").text("产品/活动/设施/场所");
                $("[itemtype=danger]").hide();
                $("[itemtype=important]").hide();
                $("[itemtype=environment]").show();
            }
            else if (itemType == "<%=IdentiyItemType.重要环境因素.GetHashCode()%>") {
                $("#spanPlace").text("产品/活动/设施/场所");
                $("#spanItemReource").text("重要环境因素");
                $("[itemtype=danger]").hide();
                $("[itemtype=important]").show();
                $("[itemtype=environment]").hide();
                $("[flag=HJWX]").hide();
            }
        }
    </script>
</asp:Content>
