<%@ Page Title="工程信息" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="PerformanceAndDesignEditor.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MM.PerformanceAndDesignEditor" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">工程包
            </td>
            <td class="td-m" colspan="3">
                <asp:Label runat="server" ID="lblProjectPackage" tablename="MM_MarketInfo" field="ProjectPackage" activestatus="(23.*)"/>
            </td>
            <td class="td-l">业务板块</td>
            <td class="td-r">
                <asp:Label runat="server" ID="lblBusinessPlate" tablename="MM_MarketInfo" field="BusinessPlate" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">工程名称</td>
            <td class="td-m" colspan="3">
                <asp:Label runat="server" ID="lblProjectName" tablename="MM_MarketInfo" field="MarketProjectName" activestatus="(23.*)"/>
            </td>
            <td class="td-l">工程编号</td>
            <td class="td-r">
                <asp:Label runat="server" ID="lblProjectCode" tablename="MM_MarketInfo" field="MarketProjectCode" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">业主单位</td>
            <td class="td-m" colspan="3">
                <asp:Label runat="server" ID="lblCustomerName" tablename="MM_MarketInfo" field="CustomerName" activestatus="(23.*)"/>
            </td>
            <td class="td-l">投产时间</td>
            <td class="td-r">
                <asp:Label runat="server" ID="lblProductionDate" tablename="MM_MarketInfo" field="ProductionDate" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">项目地点</td>
            <td class="td-r">
                <asp:Label runat="server" ID="lblBuildPlace" tablename="MM_MarketInfo" field="BuildPlace" activestatus="(23.*)"/>
            </td>
            <td class="td-l">业绩状态</td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPerformanceStatus" tablename="MM_MarketInfo" field="PerformanceStatus" activestatus="(23.*)"/>
            </td>
            <td class="td-m" colspan="2">
                <a runat="server" id="aDetail" style="color: blue">查看项目详细信息</a>
            </td>
        </tr>
        <tr>
            <td class="td-l">工程规模</td>
            <td class="td-m" colspan="5">
                <asp:Label runat="server" ID="lblProjectScale" tablename="MM_MarketInfo" field="ProjectScale" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr runat="server" id="trAS">
            <td class="td-l">获奖情况</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbAwardStatus" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" EnableTheming="False"
                                        tablename="MM_MarketInfo" field="AwardStatus" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr runat="server" id="trDCR">
            <td class="td-l">设计竞赛结果</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbDesignCompetitionResults" CssClass="kpms-textarea" Rows="3" TextMode="MultiLine" EnableTheming="False"
                                        tablename="MM_MarketInfo" field="DesignCompetitionResults" activestatus="(23.*)"/>
            </td>
        </tr>
        <tr>
            <td class="td-l">相关附件</td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" >
                    <img src="../../../Themes/Images/btn_upload.gif">
                    <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                      runat="server" displaystatus="(2.*)"> 请先保存再上传附件</span>
                <uc1:AttachmentView ID="ucUploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiMarketProjectID" tablename="MM_MarketInfo" field="MarketProjectID" />
    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick"/>
    <script type="text/javascript">
        //上传附件
        function uploadFile(flag, fileType) {
            var fileSrcId = $("#<%=hiMarketProjectID.ClientID%>").val();
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }

        function viewDetail(id) {
            var url = buildBizUrl(1, id, "MM/List/MM/AddToFormalProject.aspx", null);
            showDivDialog(url, null, 800, 500, null);
            return false;
        }
    </script>
</asp:Content>
