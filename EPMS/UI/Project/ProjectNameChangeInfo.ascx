<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProjectNameChangeInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Project.ProjectNameChangeInfo" %>
<tr>
    <td class="td-l">
        项目编号<span class="req-star">*</span>
    </td>
    <td class="td-r">
        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProjectCode" req="1" IsMutiple="false"
            SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectNameOfOriginal':'ProjectName'}"
            EnableTheming="false" Text="选择项目编号" AfterSelect="afterSelect()" FilterFunction="projFilter()"
            PageWidth="850" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx" ShowJsonRowColName="true"
            ResultAttr="ProjectCode" activestatus="(23.*)(23.提出变更申请)" />
        <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server"
            field="OrganizationId" tablename="EPMS_ProjectNameChange" />
        <input type="hidden" id="hiProjectNameChangeID" name="ProjectNameChangeID" runat="server"
            field="ProjectNameChangeID" tablename="EPMS_ProjectNameChange" />
        <input type="hidden" runat="server" id="hiFlag" tablename="EPMS_ProjectNameChange"
            field="Flag" />
        <asp:LinkButton runat="server" ID="btnBind" OnClick="btnBind_Click" Visible="false"></asp:LinkButton>
    </td>
    <td class="td-l" runat="server">
        提出人
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="txtApplyUserName" runat="server" readonly="readonly"
            activestatus="(23.*)(23.提出变更申请)" class="kpms-textbox-short" field="ApplyUserName"
            tablename="EPMS_ProjectNameChange" />
        <input id="hiApplyUserID" type="hidden" runat="server" field="ApplyUserID" tablename="EPMS_ProjectNameChange" />
    </td>
    <td class="td-l">
        提出日期
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText ID="txtApplyDate" runat="server" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox-date" readonly="readonly" field="ApplyDate" tablename="EPMS_ProjectNameChange">
        </zhongsoft:XHtmlInputText>
    </td>
</tr>
<tr>
    <td class="td-l" nowrap>
        原项目名称
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectNameOfOriginal" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" field="ProjectNameOfOriginal" tablename="EPMS_ProjectNameChange" />
    </td>
    <td class="td-l" nowrap flag="hide">
        原项目简称
    </td>
    <td class="td-r" flag="hide">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjNameForSOfOriginal" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" field="ProjNameForSOfOriginal" tablename="EPMS_ProjectNameChange" />
    </td>
    <td class="td-r" colspan="2" flag="show"></td>
</tr>
<tr>
    <td class="td-l">
        新项目名称 <span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectNameOfChanged" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" EnableTheming="false" MaxLength="256" req="1" field="ProjectNameOfChanged"
            tablename="EPMS_ProjectNameChange" />
    </td>
    <td class="td-l" flag="hide">
        新项目简称
    </td>
    <td class="td-r" flag="hide">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjNameForSOfChanged" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" EnableTheming="false" MaxLength="30" field="ProjNameForSOfChanged"
            tablename="EPMS_ProjectNameChange" />
    </td>
    <td class="td-r" colspan="2" flag="show"></td>
</tr>
<tr flag="hide">
    <td class="td-l">
        原项目名称(英文)
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox runat="server" ID="tbProjNameForEOfOriginal" TableName="EPMS_ProjectNameChange"
            Field="ProjNameForEOfOriginal" activestatus="(23.*)(23.提出变更申请)" CssClass="kpms-textarea"
            EnableTheming="false" TextMode="MultiLine" Rows="3" ReadOnly="true"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l" nowrap>
        设计规模
    </td>
    <td class="td-r">
     <zhongsoft:XHtmlInputText runat="server" ID="txtProjScaleIDOfChanged" TableName="EPMS_ProjectNameChange"
            Field="ProjScaleOfOriginal" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" />
    </td>
</tr>
<tr flag="hide">
    <td class="td-l">
        新项目名称(英文)
    </td>
    <td class="td-m" colspan="3">
        <zhongsoft:LightTextBox runat="server" ID="tbProjNameForEOChanged" TableName="EPMS_ProjectNameChange"
            Field="ProjNameForEOChanged" activestatus="(23.*)(23.提出变更申请)" CssClass="kpms-textarea"
            EnableTheming="false" TextMode="MultiLine" Rows="3" MaxLength="500"></zhongsoft:LightTextBox>
    </td>
    <td class="td-l">
        修改后设计规模
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtProjectScaleOfChanged" TableName="EPMS_ProjectNameChange"
            Field="ProjScaleOfChanged"  activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" EnableTheming="false" MaxLength="30"  />
    </td>
</tr>
<tr>
    <td class="td-l">
        项目类别
    </td>
    <td class="td-r">
     <zhongsoft:XHtmlInputText runat="server" ID="txtProjectType" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" />
        <zhongsoft:LightDropDownList ID="ddlProjScaleIDOfChanged" runat="server" activestatus="(23.*)(23.提出变更申请)"
            req="1" Visible="false">
        </zhongsoft:LightDropDownList>
        <input type="hidden" id="hiProjScaleOfChanged" name="ProjScaleOfChanged" runat="server"
             Visible="false"/>
        <input type="hidden" runat="server" id="hiProjScaleOfOriginal"  Visible="false"
             />
        <input type="hidden" id="hiProjScaleIDOfOriginal" runat="server"  Visible="false"
             />
    </td>
    <td class="td-l">
        设计阶段
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtPhaseName" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" />
    </td>
    <td class="td-l">
        设总
    </td>
    <td class="td-r">
        <zhongsoft:XHtmlInputText runat="server" ID="txtManagerUserName" activestatus="(23.*)(23.提出变更申请)"
            class="kpms-textbox" readonly="readonly" />
    </td>
</tr>
<tr>
    <td class="td-l">
        变更原因<span class="req-star">*</span>
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbChangeReason" CssClass="kpms-textarea"
            EnableTheming="false" activestatus="(23.*)(23.提出变更申请)" TextMode="MultiLine" maxtext="1024"
            Rows="3" req="1" field="ChangeReason" tablename="EPMS_ProjectNameChange">
        </zhongsoft:LightTextBox>
    </td>
</tr>
<tr>
    <td class="td-l">
        备注
    </td>
    <td class="td-m" colspan="5">
        <zhongsoft:LightTextBox runat="server" ID="tbMemo" CssClass="kpms-textarea" EnableTheming="false"
            activestatus="(23.*)(23.提出变更申请)" TextMode="MultiLine" maxtext="1024" Rows="4"
            field="Memo" tablename="EPMS_ProjectNameChange">
        </zhongsoft:LightTextBox>
    </td>
</tr>
<script type="text/javascript">
    function afterSelect() { 
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnBind, "")%>;
    }

    function projFilter(){
        return "<%=Filter %>";
    }

    function initCustomerPlugin() {
        setHide();
    }

    // 设置隐藏
    function setHide() {
        $('[flag="hide"]').hide();
        $('[flag="show"]').show();
    }
</script>
