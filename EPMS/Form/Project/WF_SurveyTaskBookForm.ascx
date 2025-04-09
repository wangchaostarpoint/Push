<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_SurveyTaskBookForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.Project.WF_SurveyTaskBookForm" %>
<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView" TagPrefix="uc1" %>
<table class="tz-table">
    <tr>
        <td class="td-l">工程名称
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsProjectName" req="1" IsMutiple="false"
                SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtprojectCode':'ProjectCode','txtProjectType':'ProjectType','txtProjectPhase':'PhaseName','txtProjectPlace':'ProjectPlace','tbVoltageGrade':'VoltageGrade','txtBuildUnit':'CustomerName'}"
                EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                PageWidth="850" ShowJsonRowColName="true" ResultAttr="name"
                activestatus="(23.收集相关资料)" OnClick="lbsProjectName_OnClick"  />
            <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_SurveyTaskBook" field="OrganizationID" />
        </td>
    </tr>
    <tr>
        <td class="td-l">工程检索号
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtprojectCode" readonly="readonly" activestatus="(23.收集相关资料)" class="kpms-textbox" />
        </td>
        <td class="td-l">工程类别
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectType" readonly="readonly" activestatus="(23.收集相关资料)" class="kpms-textbox" />
        </td>
        <td class="td-l">设计阶段
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectPhase" readonly="readonly" activestatus="(23.收集相关资料)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建设地点
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtProjectPlace" readonly="readonly" activestatus="(23.收集相关资料)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建设容量或规模
        </td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-l">规划</td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbPlanning" tablename="EPMS_SurveyTaskBook" field="Planning" activestatus="(23.收集相关资料)" />
                    </td>
                    <td class="td-l">本期
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbThisTime" tablename="EPMS_SurveyTaskBook" field="ThisTime" activestatus="(23.收集相关资料)" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">电压等级
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbVoltageGrade" tablename="EPMS_SurveyTaskBook" field="VoltageGrade" activestatus="(23.收集相关资料)" Style="width: 80%" />
                        kV
                    </td>
                    <td class="td-l">线路长度
                    </td>
                    <td class="td-r">
                        <zhongsoft:LightTextBox runat="server" ID="tbLineLength" tablename="EPMS_SurveyTaskBook" field="LineLength" activestatus="(23.收集相关资料)" Style="width: 80%" />
                        km
                    </td>
                </tr>
            </table>
        </td>

    </tr>

    <tr>
        <td class="td-l">建设单位
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:XHtmlInputText runat="server" ID="txtBuildUnit" readonly="readonly" activestatus="(2.收集相关资料)" class="kpms-textbox" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘测专业交资日期
        </td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-l">工程测量
                    </td>
                    <td class="td-l">岩土工程勘察
                    </td>
                    <td class="td-l">水文气象
                    </td>
                </tr>
                <tr>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSpecialGCCLDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="SpecialGCCLDate" ActiveStatus="(23.收集相关资料)" />
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSpecialYTGCKCDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="SpecialYTGCKCDate" ActiveStatus="(23.收集相关资料)" />
                    </td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSpecialSWQXDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="SpecialSWQXDate" ActiveStatus="(23.收集相关资料)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">委托专业室
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEntrustSpecialtyDeptName" class="kpms-textbox" readonly="readonly" runat="server" MaxText="32" tablename="EPMS_SurveyTaskBook" field="EntrustSpecialtyDeptName" ActiveStatus="(23.收集相关资料)" />
            <input type="hidden" id="hiEntrustSpecialtyDeptID" name="hiEntrustSpecialtyDeptID" runat="server" tablename="EPMS_SurveyTaskBook" field="EntrustSpecialtyDeptID" />
        </td>
        <td class="td-l">编制人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtEditUserName" class="kpms-textbox" readonly="readonly" runat="server" MaxText="16" tablename="EPMS_SurveyTaskBook" field="EditUserName" ActiveStatus="(23.收集相关资料)" />
            <input type="hidden" id="hiEditUserID" name="hiEditUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="EditUserID" />
        </td>
        <td class="td-l">编制日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtEditDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="EditDate" ActiveStatus="(23.收集相关资料)" />
        </td>
    </tr>
    <tr>
        <td class="td-l">审核人</td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCheckUserName" class="kpms-textbox" readonly="readonly" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBook" Field="CheckUserName" ActiveStatus="(3.专工审核)" />
            <input type="hidden" id="hiCheckUserID" name="hiCheckUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="CheckUserID" />
        </td>
        <td class="td-l">审核日期
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtCheckDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="CheckDate" ActiveStatus="(3.专工审核)" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>工程测量任务要求</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td id="Td1" align="right" style="font-weight: bold" colspan="6" displaystatus="(3.收集相关资料)"
            runat="server">增加
            <zhongsoft:LightTextBox runat="server" ID="tbRowNum" Width="30px" Style="text-align: right"
                regex="\d{1,3}" errmsg="请输入正确的行号！">
            </zhongsoft:LightTextBox>
            行
            <asp:Button runat="server" ID="btnSure" Text="确定" OnClick="btnSure_OnClick" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvSurveyDemandList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15"
                BindGridViewMethod="BindSurveyDemandData" DataKeyNames="ProjectSurveyTaskDemandID" OnRowCommand="gvSurveyDemandList_OnRowCommand" PermissionStatus="True">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="测量项目名称">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSurveyName" req="1" Text='<%#Eval("SurveyName") %>' MaxLength="256" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="具体要求">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDemand" req="1" Text='<%#Eval("Demand") %>' CssClass="kpms-textarea" Rows="3"
                                TextMode="MultiLine" EnableTheming="False" MaxLength="1024" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="估计工作量">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbEstimatedWorkload" req="1" Text='<%#Eval("EstimatedWorkload") %>' MaxLength="256" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="False" CommandName="remove" CommandArgument='<%#Eval("ProjectSurveyTaskDemandID") %>'>
                                <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除？')"
                                     src="../../Themes/Images/btn_dg_delete.gif"  border="0" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>要求提交的测量成果</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td id="Td2" align="right" style="font-weight: bold" colspan="6" displaystatus="(3.收集相关资料)"
            runat="server">增加
        <zhongsoft:LightTextBox runat="server" ID="tbSurveyResultNum" Width="30px" Style="text-align: right"
            regex="\d{1,3}" errmsg="请输入正确的行号！">
        </zhongsoft:LightTextBox>
            行
        <asp:Button runat="server" ID="btnSurveyResultSubmit" Text="确定" OnClick="btnSurveyResultSubmit_OnClick" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvSurveyResultList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15"
                BindGridViewMethod="BindSurveyResultData" DataKeyNames="SurveyDocumentID" OnRowCommand="gvSurveyResultList_OnRowCommand" PermissionStatus="True">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%#Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="资料名称" ItemStyle-Width="35%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDocumentName" req="1" Text='<%#Eval("DocumentName") %>' MaxLength="256" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="比例" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbRatio" req="1" Text='<%#Eval("Ratio") %>' MaxLength="256" DataType="Decimal2" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="具体要求" ItemStyle-Width="35%">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDemand" req="1" Text='<%#Eval("Demand") %>' CssClass="kpms-textarea" Rows="3"
                                                    TextMode="MultiLine" EnableTheming="False" MaxLength="1024" activestatus="(3.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="数量" ItemStyle-Width="10%" ItemStyle-HorizontalAlign="Right">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbNumber" req="1" Text='<%#Eval("Number") %>' DataType="Integer" activestatus="(23.收集相关资料)" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbtnDelete" runat="server" EnableTheming="False" CommandName="remove" CommandArgument='<%#Eval("SurveyDocumentID") %>'>
                                <img id="btnDelete" alt="删除" style="CURSOR: hand" onclick="return confirm('是否删除？')"
                                     src="../../Themes/Images/btn_dg_delete.gif"  border="0" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </asp:TemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>勘测室意见</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvSurveyOpinionList" UseDefaultDataSource="True" AllowPaging="True" PageSize="15"
                BindGridViewMethod="BindSurveyOpinionData" DataKeyNames="ParamSpecialtyID,SurveyOpinionID" PermissionStatus="True">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="专业">
                        <ItemTemplate>
                            <%#Eval("SpecialtyName") %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="专业要求">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbSpecialtyDemand" req="1" Text='<%#Eval("SpecialtyDemand") %>' MaxLength="1024"
                                ActiveStatus="(23.反馈意见)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="主设人">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="lbsZSR" IsMutiple="true"
                                SelectPageMode="Dialog" activestatus="(3.分配人员)(3.反馈意见)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiMainDesignUserID':'id'}" req="1"
                                PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value" Value='<%#Eval("MainDesignUserName") %>' />
                            <input type="hidden" runat="server" id="hiMainDesignUserID" value='<%#Eval("MainDesignUserID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="专工">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="lbsZG" IsMutiple="true"
                                SelectPageMode="Dialog" activestatus="(3.分配人员)" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" ResultForControls="{'hiZGUserID':'id'}" req="1"
                                PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" PageWidth="850" content="value" Value='<%#Eval("ZGUserName") %>' />
                            <input type="hidden" runat="server" id="hiZGUserID" value='<%#Eval("ZGUserID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
    <tr>
        <td class="td-l">对测量的特殊要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDemandOfSurvey" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DemandOfSurvey"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计专业向测量<br />
            专业提供的资料</td>
        <td class="td-m" colspan="6">
            <zhongsoft:LightTextBox ID="tbDocumentOfSJDesign" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfSJDesign"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>岩土工程勘察任务要求</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘察项目及要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbSurveyProjAndDemand" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="SurveyProjAndDemand"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">设计要求勘察提<br />
            交资料(包括主要<br />
            参数)</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDocumentOfSurvey" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfSurvey"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>



    <tr>
        <td class="flexible" colspan="6">
            <span>设计专业向岩土工程勘察专业提供资料内容</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建(构)筑物的资料<br />
            (名称,层数,高度<br />
            ,等级,类型及平<br />
            面布置图)
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDocumentOfBuildName" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfBuildName"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">建(构)筑物基础资<br />
            料(形式,尺寸,埋<br />
            深,对地基承载力<br />
            的要求值)
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDocumentOfBuildSize" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfBuildSize"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="4" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>水文气象勘测任务要求</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td class="td-l">委托工程水文勘测<br />
            内容及要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDemandOfHydrology" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DemandOfHydrology"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">要求提交的工程水<br />
            文资料和参数</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDocumentOfHydrology" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfHydrology"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">委托工程气象勘测<br />
            项目及要求</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDemandOfMeteorology" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DemandOfMeteorology"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="td-l">要求提交的工程气<br />
            象资料和参数</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbDocumentOfMeteorology" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="DocumentOfMeteorology"
                ActiveStatus="(23.收集相关资料)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>各级意见</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td class="td-l">勘测室意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbSurveyOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="SurveyOpinion"
                            ActiveStatus="(23.汇总意见)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">勘测室主任或者专业工程师</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSurveyLeaderUserName" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBook" Field="SurveyLeaderUserName"
                            ActiveStatus="(23.汇总意见)" readonly="readonly" class="kpms-textbox" style="width: 30%" />
                        <input type="hidden" id="hiSurveyLeaderUserID" name="hiSurveyLeaderUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="SurveyLeaderUserID" />
                    </td>
                    <td class="td-l">勘测室意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSurveyOpinionDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="SurveyOpinionDate" ActiveStatus="(23.汇总意见)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">委托专业专工对<br />
            勘测室反馈意见<br />
            的意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbZGOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="ZGOpinion" req="1"
                            ActiveStatus="(23.委托专业专工对勘测反馈意见的意见)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">委托专业专工姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtZGUserName" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBook" Field="ZGUserName"
                            ActiveStatus="(23.委托专业专工对勘测反馈意见的意见)" readonly="readonly" class="kpms-textbox" style="width: 30%" />
                        <input type="hidden" id="hiZGUserID" name="hiZGUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="ZGUserID" />
                    </td>
                    <td class="td-l">委托专业专工意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtZGOpinionDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="ZGOpinionDate" ActiveStatus="(23.委托专业专工对勘测反馈意见的意见)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">设计总工程师协<br />
            调意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbSZOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="SZOpinion"
                            ActiveStatus="(23.设总审定)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" req="1" />

                    </td>
                </tr>
                <tr>
                    <td class="td-l">设计总工程师姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtSZUserName" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBook" Field="SZUserName"
                            ActiveStatus="(23.设总审定)" readonly="readonly" class="kpms-textbox" style="width: 30%" />
                        <input type="hidden" id="hiSZUserID" name="hiZGUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="SZUserID" />
                    </td>
                    <td class="td-l">设计总工程师意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtSZOpinionDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="SZOpinionDate" ActiveStatus="(3.设总审定)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">项目管理岗意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbBusinessDeptOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="BusinessDeptOpinion"
                            ActiveStatus="(23.会签)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" req="1" />
                    </td>
                </tr>
                <tr>
                    <td class="td-l">项目管理岗姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtBusinessDeptUserName" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="BusinessDeptUserName"
                            ActiveStatus="(23.会签)" readonly="readonly" class="kpms-textbox" style="width: 30%" />
                        <input type="hidden" id="hiBusinessDeptUserID" name="hiBusinessDeptUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="BusinessDeptUserID" />
                    </td>
                    <td class="td-l">项目管理岗意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtBusinessDeptOpinionDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="BusinessDeptOpinionDate" ActiveStatus="(23.会签)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">公司主管领导/<br />
            总工程师意见<span class="req-star">*</span></td>
        <td class="td-m" colspan="5">
            <table style="width: 100%">
                <tr>
                    <td class="td-m" colspan="4">
                        <zhongsoft:LightTextBox ID="tbMainLeaderOpinion" runat="server" MaxText="1024" TableName="EPMS_SurveyTaskBook" Field="MainLeaderOpinion"
                            ActiveStatus="(23.批准)" TextMode="MultiLine" Rows="3" CssClass="kpms-textarea" EnableTheming="False" req="1" />

                    </td>
                </tr>
                <tr>
                    <td class="td-l">主要领导姓名</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText ID="txtMainLeaderUserName" runat="server" MaxText="16" TableName="EPMS_SurveyTaskBook" Field="MainLeaderUserName"
                            ActiveStatus="(23.批准)" readonly="readonly" class="kpms-textbox" Style="width: 30%" />
                        <input type="hidden" id="hiMainLeaderUserID" name="hiMainLeaderUserID" runat="server" tablename="EPMS_SurveyTaskBook" field="MainLeaderUserID" />
                    </td>
                    <td class="td-l">主要领导意见日期</td>
                    <td class="td-r">
                        <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtMainLeaderOpinionDate" runat="server" readonly="readonly" TableName="EPMS_SurveyTaskBook" Field="MainLeaderOpinionDate" ActiveStatus="(23.批准)" />
                    </td>
                </tr>
            </table>
        </td>
    </tr>
    <tr>
        <td class="td-l">附件</td>
        <td class="td-m" colspan="5">
            <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.收集相关资料)" EnableTheming="False">
            <img src="../../Themes/Images/btn_upload.gif">
            <span>上传附件</span>
            </asp:LinkButton>
            <span class="req-star" style="float: right;"
                runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
            <uc1:AttachmentView ID="ucUploadFile" runat="server" />
        </td>
    </tr>
</table>
<input type="hidden" id="hiSurveyTaskBookID" name="hiSurveyTaskBookID" runat="server" tablename="EPMS_SurveyTaskBook" field="SurveyTaskBookID" />
<asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />

<script type="text/javascript">
    function initCustomerPlugin() {
        checkRegex();
        checkMaxLength();
    }

    <%--function checkForm() {
        if ($formAction == 2) {
            if ($actName == "收集相关资料") {
                var value = $("#<%=hiOrganizationID.ClientID %>").val();
                if (value == "") {
                    alert("请选择项目！");
                    return false;
                }
            }
        }
        return true;
    }--%>


    //上传附件
    function uploadFileNew(flag, fileType) {
        var fileSrcId = $("#<%=hiOrganizationID.ClientID%>").val();
        showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
        return false;
    }

    //新建、编辑申请设备弹出层callback方法
    function uploadFileCallBack() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
    }

</script>
