<%@ Page Title="工程获奖详细" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="MarketProjectAwardEntityEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.MarketProjectAwardEntityEditor1" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工程名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtMarketProjectCode" ActiveStatus="(23.*)" SourceMode="SelectorPage"
                    SelectPageMode="Dialog" ResultAttr="name" ShowJsonRowColName="true" DoCancel="true" 
                    PageUrl="~/MM/Obsolete/MarketProjectSelector.aspx" Filter="{IsFormalProject:'1'}" req="1" ResultForControls="{'hiMarketProjectID':'id','lbsCompleteDeptName':'DutyDeptName','hiCompleteDeptID':'DutyDeptID'}"
                    EnableTheming="false" PageWidth="850" Writeable="false" TableName="MM_MarketProjectAwardEntity" Field="MarketProjectName" />
                <input type="hidden" id="hiMarketProjectID" name="hiMarketProjectID" runat="server" tablename="MM_MarketProjectAwardEntity" field="MarketProjectID" />
            </td>
        </tr>
        <tr>
            <td class="td-l" style="width: 13%">完成部室</td>
            <td class="td-r" style="width: 23%">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsCompleteDeptName" Writeable="True" PageUrl="~/Sys/OrgUsers/OrgSelector.aspx"
                    SelectPageMode="Dialog" TableName="MM_TenderEntity" Field="CompleteDeptName" ResultForControls="{'hiCompleteDeptID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiCompleteDeptID" name="hiCompleteDeptID" runat="server" tablename="MM_MarketProjectAwardEntity" field="CompleteDeptID" />
            </td>
            <td class="td-l">文号</td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbAwardCode" runat="server" MaxText="32" TableName="MM_MarketProjectAwardEntity" Field="AwardCode" ActiveStatus="(23.*)" />
            </td>
            <td class="td-l">获奖年度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <%--<zhongsoft:LightDropDownList ID="ddlAwardYear" runat="server" TableName="MM_MarketProjectAwardEntity" Field="AwardYear" ActiveStatus="(23.*)" req="1" />--%>
                <zhongsoft:LightTextBox runat="server" ID="tbAwardYear" TableName="MM_MarketProjectAwardEntity" Field="AwardYear" ActiveStatus="(23.*)" req="1" DataType="Integer" MaxLength="4"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">建设单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsBuildUnitName" IsMutiple="false"
                                               ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiBuildUnitID':'id'}"
                                               EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                                               ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectAwardEntity"
                                               field="BuildUnitName" activestatus="(23.*)" DoCancel="false" Writeable="True" />
                <input type="hidden" id="hiBuildUnitID" name="hiBuildUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="BuildUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">勘察设计单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDesignUnitName" IsMutiple="false"
                                               ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiDesignUnitID':'id'}"
                                               EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                                               ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectAwardEntity"
                                               field="DesignUnitName" activestatus="(23.*)" DoCancel="false" Writeable="True" />
                <input type="hidden" id="hiDesignUnitID" name="hiDesignUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="DesignUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">监理单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSupervisoryUnitName" IsMutiple="false"
                                               ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiSupervisoryUnitID':'id'}"
                                               EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                                               ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectAwardEntity"
                                               field="SupervisoryUnitName" activestatus="(23.*)" DoCancel="false" Writeable="True" />
                <input type="hidden" id="hiSupervisoryUnitID" name="hiSupervisoryUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="SupervisoryUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">施工总承包单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsConstructionUnitName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiConstructionUnitID':'id'}"
                    EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectAwardEntity"
                    field="ConstructionUnitName" activestatus="(23.*)" DoCancel="false" Writeable="True" />
                <input type="hidden" id="hiConstructionUnitID" name="hiConstructionUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="ConstructionUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">获奖级别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAwardLevel" runat="server" TableName="MM_MarketProjectAwardEntity" Field="AwardLevel" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">获奖类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAwardType" runat="server" TableName="MM_MarketProjectAwardEntity" Field="AwardType" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">获奖等次<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlAwardRanking" runat="server" TableName="MM_MarketProjectAwardEntity" Field="AwardRanking" ActiveStatus="(23.*)" req="1" />
            </td>
        </tr>
        <tr>
            <td class="td-l">授奖单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsAwardingUnitName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiAwardingUnitID':'id'}"
                    EnableTheming="false" Text="选择委托单位" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="MM_MarketProjectAwardEntity"
                    field="AwardingUnitName" activestatus="(23.*)" DoCancel="false" Writeable="True" />
                <input type="hidden" id="hiAwardingUnitID" name="hiAwardingUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="AwardingUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">获奖单位</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDutyDeptName" Writeable="True" PageUrl="~/Sys/OrgUsers/OrgSelector.aspx"
                    SelectPageMode="Dialog" TableName="MM_TenderEntity" Field="AwardUnitName" ResultForControls="{'hiAwardUnitID':'id'}" EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiAwardUnitID" name="hiAwardUnitID" runat="server" tablename="MM_MarketProjectAwardEntity" field="AwardUnitID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">获奖个人姓名</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsUndertakeUserName" Writeable="True" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="winnerFilter()"
                    TableName="MM_MarketProjectAwardEntity" Field="WinnerName" SelectPageMode="Dialog" ResultForControls="{'hiWinnerID':'id'}" IsMutiple="True"
                    EnableTheming="false" ActiveStatus="(23.*)" />
                <input type="hidden" id="hiWinnerID" name="hiWinnerID" runat="server" tablename="MM_MarketProjectAwardEntity" field="WinnerID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">获奖实物</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbAwardItems" runat="server" MaxText="512" TableName="MM_MarketProjectAwardEntity" Field="AwardItems" ActiveStatus="(23.*)"
                    EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox ID="tbMemo" runat="server" MaxText="1024" TableName="MM_MarketProjectAwardEntity" Field="Memo" ActiveStatus="(23.*)"
                    EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="td-l">附件</td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFile('Module','MarketProjectAward');" OnClick="lbtnUploadNew_OnClick">
                    <img src="../../../Themes/Images/btn_upload.gif">
                    <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                      runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                <uc1:AttachmentView ID="ucUploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input type="hidden" id="hiMarketProjectAwardEntityID" name="hiMarketProjectAwardEntityID" runat="server" tablename="MM_MarketProjectAwardEntity" field="MarketProjectAwardEntityID" />
    <input type="hidden" runat="server" id="hiFlag" tablename="MM_MarketProjectAwardEntity" field="flag" value="1" />
    <input type="hidden" runat="server" id="hirecorderNO" tablename="MM_MarketProjectAwardEntity" field="recorderNO" />
    <input type="hidden" runat="server" id="hiRecordNoNew" tablename="MM_MarketProjectAwardEntity" field="RecordNoNew" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />

    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }

        function winnerFilter() {
            var organizationId = $("#<%=hiAwardUnitID.ClientID %>").val();
            return { OrganizationId: organizationId }
        }

        
        //上传附件
        function uploadFile(flag, fileType) {
            var fileSrcId = $("#<%=hiMarketProjectAwardEntityID.ClientID%>").val();
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        
        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }
    </script>
</asp:Content>
