<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="TaskInfoEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.MM.List.MDM.TaskInfoEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="kpms-table">
        <tr>
            <td class="td-l">
                任务名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTaskName" field="TASKNAME" tablename="MDM_TASKINFOFORM"
                    Width="250" class="kpms-textbox" req="1" activestatus="(23.?)" MaxLength="64">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                任务编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTaskCode" field="TASKCODE" class="kpms-textbox"
                    readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.?)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                工程编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" field="MARKETPROJECTCODE"
                    class="kpms-textbox" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.?)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                工程类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProjectType" runat="server" tablename="MDM_TASKINFOFORM"
                    field="PROJECTTYPEID" req="1" activestatus="(23.?)">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计阶段
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBoxList ID="cblPhases" editFirst="true" RepeatDirection="Horizontal" runat="server"
                    activestatus="(23.?)" RepeatColumns="4">
                </asp:CheckBoxList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                委托书接收日期
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtReceiveProXYDate" field="RECEIVEPROXYDATE"
                    class="kpms-textbox-date" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.?)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                委托书编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProXYNumber" field="PROXYNUMBER"
                    class="kpms-textbox" readonly="readonly" tablename="MDM_TASKINFOFORM" activestatus="(23.编写计划书)">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                任务下达日期
            </td>
            <td class="td-l">
                <zhongsoft:XHtmlInputText runat="server" ID="txtTaskIssuedDate" field="TASKISSUEDDATE"
                    activestatus="(23.编写计划书)(3.修改计划书)" tablename="MDM_TASKINFOFORM" class="kpms-textbox-date"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                签订状态
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rbSignState" field="SIGNSTATE" tablename="MDM_TASKINFOFORM"
                    activestatus="(23.*)" RepeatDirection="Horizontal">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                任务下达类别
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rbTaskType" field="ISNEW" tablename="MDM_TASKINFOFORM"
                    activestatus="(23.?)" RepeatDirection="Horizontal">
                    <asp:ListItem Text="新任务" Value="1"></asp:ListItem>
                    <asp:ListItem Text="调整" Value=""></asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td rowspan="5" class="td-l">
                业主信息
            </td>
            <td class="td-l">
                建设单位
            </td>
            <td class="td-m" colspan="4">
                <zhongsoft:XHtmlInputText runat="server" ID="txtCustomerName" field="CUSTOMERNAME"
                    class="kpms-textbox" activestatus="(23.?)" readonly="readonly" tablename="MDM_TASKINFOFORM">
                </zhongsoft:XHtmlInputText>
                <input type="hidden" runat="server" id="hiCustomerID" field="CUSTOMERID" tablename="MDM_TASKINFOFORM" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                联系人
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContactName" field="CONTACTNAME"
                    class="kpms-textbox" activestatus="(23.?)" readonly="readonly" tablename="MDM_TASKINFOFORM">
                </zhongsoft:XHtmlInputText>
                <input id="hiContactID" type="hidden" field="CONTACTID" runat="server" tablename="MDM_TASKINFOFORM" />
            </td>
            <td colspan="td-l">
                联系电话
            </td>
            <td class="td-m" colspan="2">
                <zhongsoft:XHtmlInputText runat="server" ID="txtContactPhone" field="CONTACTTELEPHONE"
                    readonly="readonly" class="kpms-textbox" tablename="MDM_TASKINFOFORM" activestatus="(23.?)">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l" rowspan="3">
                业主要求
            </td>
            <td class="td-l">
                进度要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbProgressRequire" CssClass="kpms-textarea" runat="server"
                    TextMode="MultiLine" EnableTheming="false" maxtext="512" tablename="MDM_MIDMARKETPROJECT"
                    activestatus="(23.?)" field="PROGRESSREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                质量要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbQualityRequire" CssClass="kpms-textarea" runat="server"
                    activestatus="(23.?)" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                    tablename="MDM_MIDMARKETPROJECT" field="QUALITYREQUIRE" editFirst="true"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                其他要求
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbOtherRequire" CssClass="kpms-textarea" runat="server"
                    activestatus="(23.?)" TextMode="MultiLine" EnableTheming="false" maxtext="512"
                    tablename="MDM_MIDMARKETPROJECT" field="OTHERREQUIRE"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvPhaseProject" runat="server" AllowPaging="true"
                    AutoGenerateColumns="false" UseDefaultDataSource="true" ShowHeaderWhenEmpty="true"
                    DataKeyNames="OrganizationID" ShowExport="true" OnRowDataBound="gvPhaseProject_RowDataBound"
                    BindGridViewMethod="BindProjectEntity">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="PROJECTNAME" HeaderText="项目名称" MaxLength="15" />
                        <zhongsoft:LightBoundField DataField="PROJECTCODE" HeaderText="项目编号" ItemStyle-Wrap="false" />
                        <zhongsoft:LightBoundField DataField="PROJECTTYPENAME" HeaderText="工程类别" Width="100" />
                        <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="设计阶段" Width="100" />
                        <%--  <zhongsoft:LightBoundField DataField="MasterDesignName" HeaderText="项目总工" Width="70" />--%>
                        <zhongsoft:LightBoundField DataField="ManagerUserName" HeaderText="项目设总" ItemStyle-Width="70" />
                        <zhongsoft:LightTemplateField HeaderText="立项状态">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbProjectState" Text='<%#Eval("ProjectState") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="签订状态">
                            <ItemTemplate>
                                <asp:Label runat="server" ID="lbSignState" Text='<%#Eval("CONTRACTSTATE") %>'></asp:Label>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="签订合同信息">
                            <ItemTemplate>
                                <asp:DataList ID="dlContract" runat="server" OnItemDataBound="dlContract_ItemDataBound">
                                    <ItemTemplate>
                                        <asp:LinkButton runat="server" ID="lbtnViewContract" EnableTheming="false"><%#Eval("CONTRACTNAME") %></asp:LinkButton>
                                        <input type="hidden" runat="server" id="hiContractID" value='<%#Eval("CONTRACTID") %>' />
                                    </ItemTemplate>
                                </asp:DataList>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <!---流程主键ID--->
    <input type="hidden" runat="server" id="hiTaskInfoFormID" field="TASKINFOFORMID"
        tablename="MDM_TASKINFOFORM" />
    <input type="hidden" runat="server" id="hiServiceType" field="SERVICETYPE" tablename="MDM_TASKINFOFORM" />
    <!---服务类型表示总包项-->
    <input type="hidden" runat="server" id="hiGeneralName" value="总包" />
    <!---总包对应的工程类型名称--->
    <input type="hidden" runat="server" id="hiGeneralProjectName" value="总承包" />
    <script>
        $("#<%=gvPhaseProject.ClientID %> input[id$=BtnExcel]").live("click", function () {
            $("base").attr("target", "_blank");
            return true;
        });
        $("#<%=gvPhaseProject.ClientID %> input[id$=BtnWord]").live("click", function () {
            $("base").attr("target", "_blank");
            return true;
        });

        setInterval(check, 1000);
        function check() {
            $("base").attr('target', '_self');
        }

        //打开合同详细页面
        function openContractDetail(contractID) {
            var url = buildBizUrl(1, contractID, "MM/List/MCM/ContractEditor.aspx", null);
            showModal(url, null, 924, 700);
            return false;
        }
    
    </script>
</asp:Content>
