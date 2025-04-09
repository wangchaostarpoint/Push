<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TechAgreementEditor.aspx.cs"
    Title="设备参数详细" Inherits="Zhongsoft.Portal.EPMS.List.WBS.TechAgreementEditor"
    MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                执行专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" req="1" activestatus="(23.*)"
                    field="ParamSpecialtyID" tablename="EPMS_TechEquipmentDetail">
                </zhongsoft:LightDropDownList>
                <!--专业编号-->
                <input type="hidden" runat="server" id="hiSpecialtyCode" field="SpecialtyCode" tablename="EPMS_TechEquipmentDetail" />
                <!--专业名称-->
                <input type="hidden" runat="server" id="hiSpecialtyName" field="SpecialtyName" tablename="EPMS_TechEquipmentDetail" />
            </td>
            <td>
            </td>
            <td>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                卷册编号
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtWBSCodes" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="WBSCode"
                    EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/EPMS/Obsolete/WBSSelector.aspx"
                    FilterFunction="wbsFilter()" activestatus="(23.*)" tablename="EPMS_TechEquipmentDetail"
                    field="WBSCodes"></zhongsoft:LightObjectSelector>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                安装地点
            </td>
            <td class="td-r">
                <%-- <zhongsoft:LightTextBox runat="server" ID="tbInstallPlace" TableName="EPMS_TechEquipmentDetail"
                    Field="InstallPlace" activestatus="(23.*)" MaxLength="64"></zhongsoft:LightTextBox>--%>
                <zhongsoft:LightDropDownList ID="ddlInstallPlace" runat="server" activestatus="(23.*)"
                    field="InstallPlace" tablename="EPMS_TechEquipmentDetail">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">
                设备类型
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEquipmentType" TableName="EPMS_TechEquipmentDetail"
                    Field="EquipmentType" activestatus="(23.*)" MaxLength="64"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设备编号
            </td>
            <td class="td-r">
                <%--  <zhongsoft:LightTextBox runat="server" ID="tbEquipmentCode" TableName="EPMS_TechEquipmentDetail"
                    Field="EquipmentCode" activestatus="(23.*)"></zhongsoft:LightTextBox>--%>
                <zhongsoft:XHtmlInputText runat="server" ID="txtEquipmentCode" activestatus="(23.*)"
                    readonly="readonly" class="kpms-textbox" TableName="EPMS_TechEquipmentDetail"
                    Field="EquipmentCode" />
            </td>
            <td class="td-l">
                设备名称<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbEquipmentName" TableName="EPMS_TechEquipmentDetail"
                    MaxLength="64" Field="EquipmentName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                来源
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbEquipmentResource" TableName="EPMS_TechEquipmentDetail"
                    Field="EquipmentResource" activestatus="(23.*)" MaxLength="512" CssClass="kpms-textarea"
                    EnableTheming="false" TextMode="MultiLine" Rows="2"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                主要内容
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMainContent" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" MaxLength="512" tablename="EPMS_TechEquipmentDetail" field="MainContent"
                    activestatus="(23.*)" Rows="2"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                其他
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbOtherContent" TextMode="MultiLine" CssClass="kpms-textarea"
                    EnableTheming="false" MaxLength="512" tablename="EPMS_TechEquipmentDetail" field="OtherContent"
                    activestatus="(23.*)" Rows="2"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="4" style="text-align: center;">
                <b>模板文件</b> <span id="Span1" runat="server" style="float: right" displaystatus="(3.*)">
                    <zhongsoft:LightFileUploader runat="server" ID="lbtnAttach" CssClass="subtoolbarlink"
                        EnableTheming="false" FileSourceFlag="Module" OnClick="btnBindFile_Click"> <span>
                              <img id="imgFile" src="../../../Themes/Images/ico_fujian.gif" alt="上传" width="16"
                                height="16" />上传</span></zhongsoft:LightFileUploader>
                </span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFile" AllowPaging="True"
                    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                    DataKeyNames="FileID" UseDefaultDataSource="true" BindGridViewMethod="BindFile"
                    OnRowCommand="gvFile_RowCommand">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <%# Container.DataItemIndex+1 %>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="附件名称">
                            <ItemTemplate>
                                <a href="<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=<%#Eval("FileId") %>"
                                    target="_blank" title="<%# Eval("FileName") %>">
                                    <%#Eval("FileName")%></a>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="CreateUserName" HeaderText="上传人">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="CreateDate" HeaderText="上传时间" DataFormatString="{0:yyyy-MM-dd}">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="删除">
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            <ItemTemplate>
                                <asp:LinkButton ID="lbDelete" runat="server" alt="" CommandName="DeleteData" OnClientClick="return confirm('确认要删除该文件吗吗？');"
                                    EnableTheming="false" CommandArgument='<%#Eval("FileId") %>'><img id="btDelete" title="删除" style="CURSOR: hand" src="../../../Themes/Images/btn_dg_delete.gif" border="0"></asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!--技术设备详细ID-->
    <input type="hidden" runat="server" id="hiTechEquipmentDetailID" field="TechEquipmentDetailID"
        tablename="EPMS_TechEquipmentDetail" />
    <!--技术协议书流程ID-->
    <input type="hidden" runat="server" id="hiTechAgreementFormID" field="TechAgreementFormID"
        tablename="EPMS_TechEquipmentDetail" />
    <input type="hidden" runat="server" id="hiFlag" field="Flag" tablename="EPMS_TechEquipmentDetail"
        value="1" />
    <script>
        function initCustomerPlugin() {
            specialtyChanged();
        }

        function specialtyChanged() {
            $("#<%=ddlSpecialty.ClientID %>").live("change", function () {
                $("#<%=txtWBSCodes.ClientID %>").val("");
                $("#<%=txtWBSCodes.ClientID %>").next.val("");
            });
        }

        //选择任务的筛选条件
        function wbsFilter() {
            var orgId = "<%=OrganizationID %>";
            var speID = $("#<%=ddlSpecialty.ClientID %>").val();
            return { OrganizationID: orgId, ExeSpecialtyID: speID };
        }

        //选择任务之前的逻辑判断
        function beforeSelectWbs() {
            var speID = $("#<%=ddlSpecialty.ClientID %>").val();
            if (speID == '' || speID == undefined) {
                alert('请先选择专业信息，再选择卷册！');
                return false;
            }
            return true;
        }
    </script>
</asp:Content>
