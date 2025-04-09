<%@ Page Title="合同签订计划安排编辑" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="ContractSignArrangeEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MDM.ContractSignArrangeEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <input runat="server" type="hidden" id="hiMarketProjectID" tablename="MDM_ContractSignArrange"
                    field="MarketProjectID" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsMarketProject" activestatus="(23.*)"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" TextBoxMode="SingleLine" ShowJsonRowColName="true"
                    DoCancel="false" ResultAttr="name" EnableTheming="false" Writeable="true" ShowAttrs="name"
                    ResultForControls="{'hiMarketProjectID':'id'}" PageUrl="~/MM/ObSolete/MarketProjectSelector.aspx"
                    OnClick="lbsMarketProject_Click" PageWidth="800px" tablename="MDM_ContractSignArrange"
                    field="MarketProjectName" req="1" ></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                阶段或内容<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbPhaseOrContent" activestatus="(23.*)"
                    MaxLength="64" tablename="MDM_ContractSignArrange" field="PhaseOrContent" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractSignType" activestatus="(23.*)"
                    tablename="MDM_ContractSignArrange" field="ContractSignType" req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                合同签订负责人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input runat="server" type="hidden" id="hiContractSignUserID" tablename="MDM_ContractSignArrange"
                    field="ContractSignUserID" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsContractSignUserName" activestatus="(23.*)"
                    SelectPageMode="Dialog" SourceMode="SelectorPage" ShowJsonRowColName="true" DoCancel="false"
                    ResultAttr="name" EnableTheming="false" Writeable="false" ShowAttrs="name" ResultForControls="{'hiContractSignUserID':'id'}"
                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" tablename="MDM_ContractSignArrange"
                    Filter="{DeptName:'市场部、国际业务部'}" field="ContractSignUserName" req="1"></zhongsoft:LightObjectSelector>
            </td>
            <td class="td-l">
                是否境内<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MDM_ContractSignArrange"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                省份(洲)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiProvince" field="Province" tablename="MDM_ContractSignArrange" />
                <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" activestatus="(23.*)"
                    AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                    req="1">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                市州(国家)
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiArea" field="Area" tablename="MDM_ContractSignArrange" />
                <zhongsoft:LightDropDownList ID="ddlArea" runat="server" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="ddlArea_SelectedIndexChanged">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                县
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiCounty" field="County" tablename="MDM_ContractSignArrange" />
                <zhongsoft:LightDropDownList ID="ddlCounty" runat="server" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同额或<br />
                预计合同额（万元）
            </td>
            <td class="td-r">
                <input runat="server" type="hidden" id="hiContractValue" tablename="MDM_ContractSignArrange"
                    field="ContractValue" />
                <zhongsoft:LightTextBox runat="server" ID="tbContractValue" activestatus="(23.*)"
                    MaxLength="10" Style="text-align: right" DataType="Money"></zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                紧急程度
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlUrgentLevel" runat="server" tablename="MDM_ContractSignArrange"
                    field="UrgentLevel" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                完成时限
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbFinishTimeLimit" activestatus="(23.*)"
                    MaxLength="64" tablename="MDM_ContractSignArrange" field="FinishTimeLimit"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                合同进展状态
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbProgressStatus" TextMode="MultiLine"
                    MaxLength="1024" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.*)"
                    Rows="8" tablename="MDM_ContractSignArrange" field="ProgressStatus">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                需协调的事项
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbRequireCoordinateMatter" TextMode="MultiLine"
                    MaxLength="1024" CssClass="kpms-textarea" EnableTheming="false" activestatus="(23.*)"
                    Rows="8" tablename="MDM_ContractSignArrange" field="RequireCoordinateMatter">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiContractSignArrangeID" tablename="MDM_ContractSignArrange"
        field="ContractSignArrangeID" />
    <input runat="server" type="hidden" id="hiMarketProjectName" />
</asp:Content>
