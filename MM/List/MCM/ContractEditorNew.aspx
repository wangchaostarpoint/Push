<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ContractEditorNew.aspx.cs" Inherits="Zhongsoft.Portal.MM.List.MCM.ContractEditorNew"
    Title="合同信息详细" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
        TagPrefix="uc3" %>
    <%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
    <%@ Import Namespace="Zhongsoft.Portal.ACL" %>
    <table class="tz-table" id="tbTable" runat="server">
        <tr>
            <td class="td-l" style="display: none">合同签订类型<span class="req-star">*</span>
            </td>
            <td class="td-r" style="display: none">
                <asp:RadioButtonList runat="server" ID="rblContractSignType" field="ContractSignType" tablename="MM_ContractEntity"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="4">
                <zhongsoft:LightTextBox ID="tbContractName" runat="server" MaxLength="256" req="1"
                    field="ContractName" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textbox"
                    EnableTheming="false"></zhongsoft:LightTextBox>
            </td>
            <td class="td-r"><a id="aCheckForm" onclick="viewWF();" style="text-decoration: underline">查看合同评审单</a><span id="spNoCheckForm" class="req-star">没有对应的合同评审单</span></td>
        </tr>
        <tr>
            <td class="td-l">业务板块<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="MM_ContractEntity"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1">
                </asp:RadioButtonList>
                <input type="hidden" runat="server" id="hiBusinessPlate" field="BusinessPlate" tablename="MM_ContractEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">项目类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlProjectClass" TableName="MM_ContractEntity"
                    Field="ParamProjectClassID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiProjectClass" field="ProjectClass" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">合同类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" TableName="MM_ContractEntity"
                    Field="ParamContractTypeID" activestatus="(23.*)" req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiContractTypeName" field="ContractTypeName" tablename="MM_ContractEntity" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">新产业类别
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlNewIndustryType" TableName="MM_ContractEntity"
                    Field="ParamNewIndustryTypeID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiNewIndustryType" field="NewIndustryType" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">商业模式类别<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessMode" TableName="MM_ContractEntity"
                    req="1" Field="ParamBusinessModeID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiBusinessMode" field="BusinessMode" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">重要程度<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rblImportantLevel" field="ImportantLevel" tablename="MM_ContractEntity"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr>
            <td class="td-l">业主单位名称（建设单位）<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false" req="1"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                    EnableTheming="false" PageWidth="850" PageUrl="../../Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="MM_ContractEntity"
                    field="CustomerName" activestatus="(23.*)" DoCancel="false" Writeable="false" />
                <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">业主单位分类（建设单位分类）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlBuildUnit" TableName="MM_ContractEntity"
                    Field="ParamBuildUnitClassID" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiBuildUnit" field="BuildUnit" tablename="MM_ContractEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否境内<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MM_ContractEntity"
                    req="1" RepeatDirection="Horizontal" activestatus="(23.*)" AutoPostBack="true"
                    OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">省份(洲)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" activestatus="(23.*)"
                    AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                    req="1">
                </zhongsoft:LightDropDownList>
                <input type="hidden" runat="server" id="hiProvince" field="Province" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">市(国家)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <input type="hidden" runat="server" id="hiArea" field="Area" tablename="MM_ContractEntity" />
                <zhongsoft:LightDropDownList ID="ddlArea" runat="server" activestatus="(23.*)" field="Area" tablename="MM_ContractEntity" req="1">
                </zhongsoft:LightDropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同金额（万元）<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContractValue" EnableTheming="false" req="1"
                    CssClass="kpms-textbox-money" DataType="Decimal6" activestatus="(23.*)"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiContractValue" field="ContractValue"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">合同份数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbContractNum" EnableTheming="false" req="1" field="ContractNum"
                    tablename="MM_ContractEntity" CssClass="kpms-textbox-money" DataType="PositiveInteger" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">评审时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtCheckDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="CheckDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">合同承办部门<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtUndertakeDeptName" IsMutiple="false"
                    ResultForControls="{'hiUndertakeDeptID':'id'}" EnableTheming="false"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" SelectPageMode="Dialog" Filter="{showTree:'0'}"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.*)"
                    TableName="MM_ContractEntity" field="UndertakeDeptName" />
                <input type="hidden" id="hiUndertakeDeptID" runat="server" field="UndertakeDeptID"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">合同签约人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtContractorName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                    ResultForControls="{'hiContractorID':'id','hiContractorDept':'DEPTNAME'}" EnableTheming="false"
                    Text="选择合同签约人" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" TableName="MM_ContractEntity" Field="ContractorName" />
                <input type="hidden" id="hiContractorID" runat="server" field="ContractorID"
                    tablename="MM_ContractEntity" />
                <input type="hidden" id="hiContractorDept" runat="server" field="ContractorDept"
                    tablename="MM_ContractEntity" />
            </td>
            <td class="td-l" style="display: none">会签状态<span class="req-star">*</span>
            </td>
            <td class="td-r" style="white-space: nowrap; display: none">
                <asp:RadioButtonList runat="server" ID="rblSignState" field="SignState" tablename="MM_ContractEntity"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">收费负责人<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtChargeOfficerName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                    ResultForControls="{'hiChargeOfficerID':'id'}" EnableTheming="false"
                    Text="选择收费负责人" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    ResultAttr="name" activestatus="(23.*)" TableName="MM_ContractEntity" Field="ChargeOfficerName" FilterFunction="chargeOfficerFilter()" />
                <input type="hidden" id="hiChargeOfficerID" runat="server" field="ChargeOfficerID"
                    tablename="MM_ContractEntity" />
            </td>
        </tr>
        <tr>
            <td class="td-l">专业<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCodeSpecialty" TableName="MM_ContractEntity" Field="CodeSpecialty" activestatus="(23.*)" req="1" OnSelectedIndexChanged="ddlCodeSpecialty_OnSelectedIndexChanged"
                    AutoPostBack="True" />
            </td>
            <td class="td-l">类型<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightDropDownList runat="server" ID="ddlCodeType" TableName="MM_ContractEntity" Field="CodeType" activestatus="(23.*)" req="1" OnSelectedIndexChanged="ddlCodeType_OnSelectedIndexChanged"
                    AutoPostBack="True" />
            </td>
            <td class="td-m" colspan="2"></td>
        </tr>
        <tr>
            <td class="td-l">签订状态<span class="req-star">*</span>
            </td>
            <td class="td-r" style="white-space: nowrap">
                <asp:RadioButtonList runat="server" ID="rblContractStatus" field="ContractStatus" tablename="MM_ContractEntity" onClick="checkContractCode();"
                    RepeatDirection="Horizontal" activestatus="(23.*)" req="1">
                </asp:RadioButtonList>
            </td>
            <td class="td-l">合同编号<span class="req-star" name="spanContractCode">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbContractCode" runat="server" MaxLength="64"
                    activestatus="(23.*)" CssClass="kpms-textbox" EnableTheming="false"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiContractCode" field="ContractCode" tablename="MM_ContractEntity" />
            </td>
            <td class="td-l">签订时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSignDate" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly" field="SignDate" tablename="MM_ContractEntity">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">备注</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="MM_ContractEntity" activestatus="(23.*)" CssClass="kpms-textarea"
                    EnableTheming="False" MaxLength="1024" TextMode="MultiLine" />
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                <span>合同相对方</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <%-- <span style="float: right;" id="spAdd" runat="server" displaystatus="(3.*)">
                <asp:LinkButton runat="server" ID="lbtnSelCMB" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="选择合同相对方" width="16"
                            height="16" />选择合同相对方</span>
                </asp:LinkButton></span>--%>
                <span id="Span3" runat="server" style="float: right" displaystatus="(3.*)">
                    <asp:Button runat="server" ID="btnAdd" Text="添加" OnClick="btnAdd_Click" />
                    <zhongsoft:LightTextBox runat="server" ID="tbNum" Style="text-align: right; width: 70px;"
                        regex="^[1-9]{0,2}$" Text="1" errmsg="请输入最多2位整数"></zhongsoft:LightTextBox>行
                </span>
                <label id="lbtip" runat="server"
                    displaystatus="(2.*)" style="color: Red; float: right">
                    请先保存再添加合同相对方</label>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvContractMainBody" runat="server" UseDefaultDataSource="true"
                    DataKeyNames="MainBodyID" OnRowCommand="gvContractMainBody_RowCommand" OnRowDataBound="gvContractMainBody_RowDataBound">
                    <Columns>
                        <zhongsoft:LightTemplateField HeaderText="类型<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlMainBodyType" activestatus="(23.*)" req="1" flag="ddlMainBodyType"
                                    ddlMainBodyTypeID='<%#Eval("MainBodyID") %>'>
                                </zhongsoft:LightDropDownList>
                                <input type="hidden" runat="server" id="hiMainBodyID" value='<%#Eval("MainBodyID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <%-- <zhongsoft:LightBoundField DataField="UnitName" HeaderText="单位名称" ItemStyle-Width="40%">
                    </zhongsoft:LightBoundField>--%>
                        <zhongsoft:LightTemplateField HeaderText="单位名称<span class='req-star'>*</span>">
                            <ItemTemplate>
                                <zhongsoft:LightObjectSelector runat="server" ID="txtUnitName" IsMutiple="false" req="1"
                                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                    ResultForControls="{'hiUnitID':'id','txtContactName':'MainContacter','txtContactName_hiValue':'MainContacter','hiContactID':'MainContacterID'}" Value='<%#Eval("UnitName") %>'
                                    PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"></zhongsoft:LightObjectSelector>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="联系人" ItemStyle-Width="150px">
                            <ItemTemplate>
                                <table>
                                    <tr>
                                        <td txtsyscontactnameid='<%#Eval("MainBodyID") %>'>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtSysContactName" IsMutiple="false"
                                                SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                                                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                                ResultForControls="{'hiContactID':'id'}" Value='<%#Eval("ContactName") %>'
                                                PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                                                flag="txtSysContactName"></zhongsoft:LightObjectSelector>
                                        </td>
                                        <td txtcontactnameid='<%#Eval("MainBodyID") %>'>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" IsMutiple="false"
                                                SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                                                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                                ResultForControls="{'hiContactID':'id'}" Value='<%#Eval("ContactName") %>'
                                                PageWidth="850" PageUrl="~/MM/Obsolete/CustomerContactSelector.aspx"
                                                flag="txtContactName"
                                                FilterFunction='<%# String.Format("contactFilter(\"{0}\")",Eval("MainBodyID")) %>'></zhongsoft:LightObjectSelector>
                                        </td>
                                    </tr>
                                </table>
                                <input type="hidden" runat="server" id="hiContactID" value='<%#Eval("ContactID") %>' />
                                <input type="hidden" runat="server" id="hiUnitID" value='<%#Eval("UnitID") %>' flag='<%# Eval("MainBodyID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="签署日期">
                            <ItemTemplate>
                                <zhongsoft:XHtmlInputText type="text" runat="server" EnableTheming="false" ID="txtSignDate"
                                    activestatus="(23.*)" readonly="readonly" value='<%#string.Format("{0:yyyy-MM-dd}",Eval("SignDate")) %>'
                                    class="kpms-textbox-date" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("MainBodyID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                <span>主要实物量</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td class="td-l">实物量指标1（等级）
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhysicalIndicator1" TableName="MM_ContractEntity"
                    Field="PhysicalIndicator1" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">实物量</td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbConverting1" field="Converting1" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="PositiveInteger" tablename="MM_ContractEntity" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">实物量指标2（数值）
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightDropDownList runat="server" ID="ddlPhysicalIndicator2" TableName="MM_ContractEntity"
                    Field="PhysicalIndicator2" activestatus="(23.*)">
                </zhongsoft:LightDropDownList>
            </td>
            <td class="td-l">实物量</td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbConverting2" field="Converting2" EnableTheming="false"
                    CssClass="kpms-textbox-money" DataType="PositiveInteger" tablename="MM_ContractEntity" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="6">
                <span>合同拆分信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span style="float: right;" id="Span1" runat="server" displaystatus="(3.*)">
                    <asp:LinkButton runat="server" ID="lbtnSelMarket" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return false" flag="update">
                        <span>
                            <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择工程" width="16"
                                height="16" />选择工程</span>
                    </asp:LinkButton></span>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView ID="gvContractReleMProj" runat="server" UseDefaultDataSource="true" FooterStyle-HorizontalAlign="Right"
                    ShowFooter="true" DataKeyNames="ContractReleMProjID" OnRowCommand="gvContractReleMProj_RowCommand" OnRowDataBound="gvContractReleMProj_RowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="ProjectPackage" HeaderText="所属工程包" ItemStyle-Width="100px" ShowToolTip="true">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="150px" Visible="false">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="工程名称" ItemStyle-Width="200px">
                            <ItemTemplate>
                                <div style="word-break: break-all !important; white-space: normal !important;">
                                    <%#Eval("MarketProjectName") %>
                                </div>
                                <input type="hidden" runat="server" id="hiContractReleMProjID" value='<%#Eval("ContractReleMProjID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号" HeaderStyle-Width="60px">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="收费负责人<span class='req-star'>*</span>" ItemStyle-Width="80px" Visible="false">
                            <ItemTemplate>
                                <zhongsoft:LightObjectSelector runat="server" ID="txtChargeOfficerName" IsMutiple="false"
                                    SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                    ResultForControls="{'hiChargeOfficerID':'id'}" Value='<%#Eval("ChargeOfficerName") %>'
                                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"></zhongsoft:LightObjectSelector>
                                <input type="hidden" runat="server" id="hiChargeOfficerID" value='<%#Eval("ChargeOfficerID") %>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="EstimateContractVal" HeaderText="估算产值（万元）" DataFormatString="{0:F2}" ItemStyle-HorizontalAlign="Right">
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="合同产值（万元）<span class='req-star'>*</span>" ItemStyle-HorizontalAlign="Right" ItemStyle-Width="100px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbContractValue" flag="projAmount"
                                    Text='<%# Eval("ContractValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("ContractValue") )/10000).ToString("F6") %>' req="1"
                                    CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.*)"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                            <FooterTemplate>
                                <asp:Label runat="server" ID="lbTotalAmount" flag="total"></asp:Label>
                            </FooterTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="80px">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbMemo" Text='<%#Eval("Memo") %>' MaxLength="1024" activestatus="(23.*)"
                                    CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="2"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                            Visible="false">
                            <ItemTemplate>
                                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ContractReleMProjID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../../Themes/Images/btn_dg_delete.gif" alt="删除" flag="update" /></span>
                                </asp:LinkButton>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr>
            <td class="td-l">相关附件
            </td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUp" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','General');">
                    <img src="../../../Themes/Images/btn_upload.gif">
                    <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                    id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                <uc3:UpLoadFile ID="uploadFile" runat="server" />
            </td>
        </tr>
        <tr>
            <td class="td-l">上传盖章电子版<br />
                正式合同文件</td>
            <td class="td-m" colspan="5">
                <asp:LinkButton runat="server" ID="lbtnUploadNew" displaystatus="(3.*)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','Stamp');">
                <img src="../../../Themes/Images/btn_upload.gif">
                <span>上传附件</span>
                </asp:LinkButton>
                <span class="req-star" style="float: right;"
                    runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
                <uc3:UpLoadFile ID="ucUploadFile" runat="server" />
            </td>
        </tr>
    </table>
    <input runat="server" type="hidden" id="hiContractID" tablename="MM_ContractEntity"
        field="ContractID" />
    <input type="hidden" runat="server" id="hiContractMainBody" />
    <asp:Button runat="server" ID="btnBindContractMainBody" OnClick="btnBindContractMainBody_Click" Style="display: none" />
    <input type="hidden" runat="server" id="hiReleMarket" />
    <asp:Button runat="server" ID="btnBindReleMarket" OnClick="btnBindReleMarket_Click" Style="display: none" />
    <input runat="server" type="hidden" id="hiBaseType" tablename="MM_ContractEntity"
        field="BaseType" />
    <%--    <input runat="server" type="hidden" id="hiIsBind" tablename="MM_ContractEntity"
        field="IsBind" />--%>
    <input runat="server" type="hidden" id="hiContractState" tablename="MM_ContractEntity"
        field="ContractState" />
    <input runat="server" type="hidden" id="hiFlag" tablename="MM_ContractEntity"
        field="Flag" />

    <asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />

    <%--专业与代字对应,用于生成合同编号--%>
    <input type="hidden" runat="server" id="hiCodeSpeciatlty" value="<root><o text='发电' value='F' /><o text='新能源' value='N' /><o text='线路' value='S' /><o text='变电' value='B' /><o text='系统' value='X' /><o text='网信' value='W' /><o text='总包' value='Z' /><o text='其他' value='Q' /></root>" />
    <%--类型与代字对应,用于生成合同编号--%>
    <input type="hidden" runat="server" id="hiCodeType" value="<root><o text='设计' value='S' /><o text='咨询' value='L' /><o text='总承包' value='E' /><o text='其他' value='Q' /></root>" />
    <script type="text/javascript">   

        function initCustomerPlugin() {
            $('[flag="ddlMainBodyType"]').each(function () {
                var id = $(this).attr("ddlMainBodyTypeID");
                var $ddlMainBodyTypeID = $("[ddlMainBodyTypeID='" + id + "']");
                var $txtSysContactName = $("[txtSysContactNameID='" + id + "']");
                var $txtContactName = $("[txtContactNameID='" + id + "']");
                if ($ddlMainBodyTypeID.find("option:selected").val() =="<%=MainBodyType.乙方.ToString()%>") {
                    $txtSysContactName.show();
                    $txtSysContactName.parent().next().show();
                    $txtContactName.hide();
                    $txtContactName.parent().next().hide();
                }
                else {
                    $txtSysContactName.hide();
                    $txtSysContactName.parent().next().hide();
                    $txtContactName.show();
                    $txtContactName.parent().next().show();
                }
            })

            $("#<%=this.tbConverting1.ClientID %>").bind('click', function () {
                var physicalIndicator1 = $("#<%=this.ddlPhysicalIndicator1.ClientID %>").val();
                if (physicalIndicator1.indexOf("电压") > -1) {
                    $("#<%=this.tbConverting1.ClientID %>").autocomplete({
                        source: function (request, response) {
                            $.getJSON("<%=WebAppPath %>/JsonSelectorHandler.ashx", {
                                term: request.term + ',voltagegrade'
                            }, response);
                        },
                        minLength: 1,
                        select: function (event, ui) {
                            if (ui.item) {
                                $("#<%=tbConverting1.ClientID %>").attr("value", ui.item.value);
                            }
                        }
                    })
                }
                else {
                    $("#<%=this.tbConverting1.ClientID %>").autocomplete({
                        source: {}
                    });
                }
            });
            checkContractCode();
            setCheckFormLink();

            computeTotal();
            $('[flag="projAmount"]').each(function () {
                $(this).bind('blur', function () {
                    computeTotal();
                });
            });
        }

        $('[flag="ddlMainBodyType"]').each(function () {
            $(this).live("change", function () {
                var id = $(this).attr("ddlMainBodyTypeID");
                var $ddlMainBodyTypeID = $("[ddlMainBodyTypeID='" + id + "']");
                var $txtSysContactName = $("[txtSysContactNameID='" + id + "']");
                var $txtContactName = $("[txtContactNameID='" + id + "']");
                if ($ddlMainBodyTypeID.find("option:selected").val() == "<%=MainBodyType.乙方.ToString()%>") {
                    $txtSysContactName.show();
                    $txtSysContactName.parent().next().show();
                    $txtContactName.hide();
                    $txtContactName.parent().next().hide();
                }
                else {
                    $txtSysContactName.hide();
                    $txtSysContactName.parent().next().hide();
                    $txtContactName.show();
                    $txtContactName.parent().next().show();
                }
            })
        })

<%--    $('#<%=lbtnSelCMB.ClientID %>').live('click', function () {
            selContractMainBody();
        }); --%>

        //选择合同向对方
        function selContractMainBody() {
            var param = new InputParamObject("m");
            getDivCustomer('<%=hiContractMainBody.ClientID %>', param, null, bindContractMainBody);
            return false;
        }

        function bindContractMainBody() {
            $("#<%=btnBindContractMainBody.ClientID %>").click();
        }


        $('#<%=lbtnSelMarket.ClientID %>').live('click', function () {
            selReleMarket();
        });

        //选择关联市场项目
        function selReleMarket() {
            var param = new InputParamObject("m");
            var json = { IsFormalProject: "1", BoundStateValue: "1" };
            getMarketDivProjects('<%=hiReleMarket.ClientID %>', param, json, bindReleMarket);
            return false;
        }

        function bindReleMarket() {
            $("#<%=btnBindReleMarket.ClientID %>").click();
        }

        function checkForm() {
            if ("<%=ActionType%>" =="<%=AccessLevel.Update%>") {

                //企发部合同管理岗不做工程金额验证
                var isCotractMgr = '<%=DAL.DALHelper.IsUserInRolesCommon(KPMSUser.UserId,new List<string> { "合同管理岗"},null,"68A5496C-1BDC-4849-8E16-31FF18E9BE1B")%>';
                var businessPlate = $("#<%=rblBusinessPlate.ClientID %> input[type=radio]:checked").val();
                if (!parseBool(isCotractMgr) && businessPlate != "4") {
                    var totalAmount = 0;
                    $('[flag="projAmount"]').each(function () {
                        var value = $(this).val();
                        if (value != '' && value != undefined) {
                            value = parseFloat(value);
                            totalAmount += value;
                        }
                    });
                    totalAmount = totalAmount.toFixed(4);
                    var contractValue = 0;
                    if ($("#<%=tbContractValue.ClientID%>").val() != "") {
                        contractValue = parseFloat($("#<%=tbContractValue.ClientID%>").val());
                    }
                    contractValue = contractValue.toFixed(4);
                    if (parseFloat(totalAmount) != parseFloat(contractValue)) {
                        alert("工程合同产值总和需等于合同金额");
                        return false;
                    }
                }
            }
            return true;
        }

        function contactFilter(id) {
            var $hiCustomerID = $('#<%=gvContractMainBody.ClientID %> [flag="' + id + '"]');
            var customerID = $hiCustomerID.val();
            return { CustomerID: customerID };
        }

        function chargeOfficerFilter() {
            return { OrganizationID: '<%=KPMSUser.DeptId%>' };
        }

        //设置合同评审单链接
        function setCheckFormLink() {
            var bizId = '<%=ContractCheckID%>';
            if (bizId == "") {
                $('#aCheckForm').hide();
                $('#spNoCheckForm').show();
            }
            else {
                $('#aCheckForm').show();
                $('#spNoCheckForm').hide();
            }
        }

        //查看合同评审单
        function viewWF() {
            var bizId = '<%=ContractCheckID%>';
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, ExtendedAttribute: null };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        function checkContractCode() {
            var selectValue = $("#<%=rblContractStatus.ClientID  %> :checked").val();
            if (selectValue == "已签订") {
                $("[name$='spanContractCode']").show();
                $("#<%=tbContractCode.ClientID%>").attr("req", "1");
                var signDate = $("#<%=txtSignDate.ClientID%>").val();
                if (signDate == "") {
                    var nowDate = new Date();
                    var month = nowDate.getMonth() + 1;
                    if (month < 10) {
                        month = "0" + month;
                    }
                    $("#<%=txtSignDate.ClientID%>").val(nowDate.getFullYear() + "-" + month + "-" + nowDate.getDate());
                }
            } else {
                $("[name$='spanContractCode']").hide();
                $("#<%=tbContractCode.ClientID %>").removeAttr("req");
                $("#<%=txtSignDate.ClientID%>").val("");
            }
        }

        //上传附件
        function uploadFileStamp(flag, fileType) {
            var fileSrcId = '<%=BusinessObjectId%>';
            showUploadFormAndType(fileSrcId, flag, fileType, uploadFileCallBack);
            return false;
        }

        //新建、编辑申请设备弹出层callback方法
        function uploadFileCallBack() {
            <%=Page.ClientScript.GetPostBackEventReference(this.btnUploadFileCallBack,"") %>
        }

        $('[flag="update"]').each(function () {
            $(this).bind('click', function () {
                setReturnVal();
            });
        });

        function setReturnVal() {
            parent.returnValue = "saved";
        }

        //计算工程金额合计
        function computeTotal() {
            var totalAmount = 0;
            $('[flag="projAmount"]').each(function () {
                var value = $(this).val();
                if (value != '' && value != undefined) {
                    value = parseFloat(value);
                    totalAmount += value;
                }
            });
            $('[flag="total"]')[0].innerHTML = totalAmount;
        }
    </script>

</asp:Content>
