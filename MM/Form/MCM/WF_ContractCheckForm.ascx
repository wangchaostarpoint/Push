<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_ContractCheckForm.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.Form.MCM.WF_ContractCheckForm" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="UpLoadFile"
    TagPrefix="uc3" %>
<%@ Import Namespace="Zhongsoft.Portal.MM.Entity" %>
<table class="tz-table">
    <tr>
        <td class="td-l" style="display: none">合同签订类型<span class="req-star">*</span>
        </td>
        <td class="td-r" style="display: none">
            <asp:RadioButtonList runat="server" ID="rblContractSignType" field="ContractSignType" tablename="MM_ContractCheck"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">评审方式<span class="req-star">*</span>
        </td>
        <td class="td-m" style="white-space: nowrap" colspan="3">
            <asp:RadioButtonList runat="server" ID="rblCheckMode" field="CheckMode" tablename="MM_ContractCheck"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">评审单号
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbCheckNum" ToolTip="保存自动生成" class="kpms-textbox" activestatus="(23.提交合同)(3.返回修改)" field="CheckNum"
                tablename="MM_ContractCheck">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同名称<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox ID="tbContractName" runat="server" MaxLength="256" req="1"
                field="ContractName" tablename="MM_ContractCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textbox"
                EnableTheming="false"></zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">业务板块<span class="req-star">*</span>
        </td>
        <td class="td-m" colspan="5">
            <asp:RadioButtonList runat="server" ID="rblBusinessPlate" field="ParamBusinessPlateID" tablename="MM_ContractCheck"
                RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)" req="1">
            </asp:RadioButtonList>
            <input type="hidden" runat="server" id="hiBusinessPlate" field="BusinessPlate" tablename="MM_ContractCheck" />
        </td>
    </tr>
    <tr>
        <td class="td-l">项目类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlProjectClass" TableName="MM_ContractCheck"
                Field="ParamProjectClassID" activestatus="(23.提交合同)(3.返回修改)" req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProjectClass" field="ProjectClass" tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">合同类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlContractType" TableName="MM_ContractCheck"
                Field="ParamContractTypeID" activestatus="(23.提交合同)(3.返回修改)" req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiContractTypeName" field="ContractTypeName" tablename="MM_ContractCheck" />
        </td>
        <td class="td-m" colspan="2"></td>
    </tr>
    <tr>
        <td class="td-l">新产业类别
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlNewIndustryType" TableName="MM_ContractCheck"
                Field="ParamNewIndustryTypeID" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiNewIndustryType" field="NewIndustryType" tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">商业模式类别<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlBusinessMode" TableName="MM_ContractCheck"
                req="1" Field="ParamBusinessModeID" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiBusinessMode" field="BusinessMode" tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">重要程度<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rblImportantLevel" field="ImportantLevel" tablename="MM_ContractCheck"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)">
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
                ShowJsonRowColName="true" ResultAttr="name" tablename="MM_ContractCheck" Filter="{IsOrderByHit:'1'}"
                field="CustomerName" activestatus="(23.提交合同)(3.返回修改)" DoCancel="false" Writeable="false" />
            <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">业主单位分类（建设单位分类）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList runat="server" ID="ddlBuildUnit" TableName="MM_ContractCheck"
                Field="ParamBuildUnitClassID" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiBuildUnit" field="BuildUnit" tablename="MM_ContractCheck" />
        </td>
    </tr>
    <tr>
        <td class="td-l">是否境内<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <asp:RadioButtonList runat="server" ID="rbIsChurchyard" field="IsChurchyard" tablename="MM_ContractCheck"
                req="1" RepeatDirection="Horizontal" activestatus="(23.提交合同)(3.返回修改)" AutoPostBack="true"
                OnSelectedIndexChanged="rbIsChurchyard_SelectedIndexChanged">
            </asp:RadioButtonList>
        </td>
        <td class="td-l">省份(洲)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightDropDownList ID="ddlProvince" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                AutoPostBack="True" OnSelectedIndexChanged="ddlProvince_SelectedIndexChanged"
                req="1">
            </zhongsoft:LightDropDownList>
            <input type="hidden" runat="server" id="hiProvince" field="Province" tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">市(国家)<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <input type="hidden" runat="server" id="hiArea" field="Area" tablename="MM_ContractCheck" />
            <zhongsoft:LightDropDownList ID="ddlArea" runat="server" activestatus="(23.提交合同)(3.返回修改)" field="Area" tablename="MM_ContractCheck" req="1">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
    <tr>
        <td class="td-l">合同金额（万元）<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContractValue" EnableTheming="false" req="1"
                CssClass="kpms-textbox-money" DataType="Decimal6" activestatus="(23.提交合同)(3.返回修改)"></zhongsoft:LightTextBox>
            <input type="hidden" runat="server" id="hiContractValue" field="ContractValue"
                tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">合同份数<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbContractNum" EnableTheming="false" req="1" field="ContractNum"
                tablename="MM_ContractCheck" CssClass="kpms-textbox-money" DataType="PositiveInteger" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightTextBox>
        </td>
        <td class="td-l">收费负责人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="txtChargeOfficerName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                ResultForControls="{'hiChargeOfficerID':'id'}" EnableTheming="false"
                Text="选择收费负责人" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                ResultAttr="name" activestatus="(23.提交合同)" TableName="MM_ContractEntity" Field="ChargeOfficerName" FilterFunction="chargeOfficerFilter()" />
            <input type="hidden" id="hiChargeOfficerID" runat="server" field="ChargeOfficerID"
                tablename="MM_ContractEntity" />
        </td>
    </tr>
    <tr>
        <td class="td-l">合同承办部门<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText runat="server" ID="txtUndertakeDeptName" readonly="readonly"
                req="1" class="kpms-textbox" activestatus="(23.提交合同)(3.返回修改)" field="UndertakeDeptName"
                tablename="MM_ContractCheck">
            </zhongsoft:XHtmlInputText>
            <input type="hidden" id="hiUndertakeDeptID" runat="server" field="UndertakeDeptID"
                tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">合同签约人<span class="req-star">*</span>
        </td>
        <td class="td-r">
            <zhongsoft:LightObjectSelector runat="server" ID="lbsContractorName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                                           ResultForControls="{'hiContractorID':'id','hiContractorDept':'DEPTNAME'}" EnableTheming="false"
                                           Text="选择收费负责人" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                                           ResultAttr="name" activestatus="(23.提交合同)(3.返回修改)" TableName="MM_ContractEntity" Field="ContractorName" FilterFunction="chargeOfficerFilter()" />
            <input type="hidden" id="hiContractorID" runat="server" field="ContractorID"
                tablename="MM_ContractCheck" />
            <input type="hidden" id="hiContractorDept" runat="server" field="ContractorDept"
                tablename="MM_ContractCheck" />
        </td>
        <td class="td-l">评审时间
        </td>
        <td class="td-r">
            <zhongsoft:XHtmlInputText ID="txtCheckDate" runat="server" activestatus="(23.提交合同)(3.返回修改)"
                class="kpms-textbox-date" readonly="readonly" field="CheckDate" tablename="MM_ContractCheck">
            </zhongsoft:XHtmlInputText>
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>合同相对方</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <%-- <span style="float: right;" id="spAdd" runat="server" displaystatus="(3.提交合同)">
                <asp:LinkButton runat="server" ID="lbtnSelCMB" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="选择合同相对方" width="16"
                            height="16" />选择合同相对方</span>
                </asp:LinkButton></span>--%>
            <span id="Span3" runat="server" style="float: right" displaystatus="(3.提交合同)">
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
            <zhongsoft:LightPowerGridView ID="gvContractMainBody" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                DataKeyNames="MainBodyID" OnRowCommand="gvContractMainBody_RowCommand" OnRowDataBound="gvContractMainBody_RowDataBound">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="类型<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList runat="server" ID="ddlMainBodyType" activestatus="(23.提交合同)(3.返回修改)" req="1" flag="ddlMainBodyType"
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
                                SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                                ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode" Filter="{IsOrderByHit:'1'}"
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
                                            SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
                                            ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                                            ResultForControls="{'hiContactID':'id'}" Value='<%#Eval("ContactName") %>'
                                            PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                                            flag="txtSysContactName"></zhongsoft:LightObjectSelector>
                                    </td>
                                    <td txtcontactnameid='<%#Eval("MainBodyID") %>'>
                                        <zhongsoft:LightObjectSelector runat="server" ID="txtContactName" IsMutiple="false"
                                            SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
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
                                activestatus="(23.提交合同)(3.返回修改)" readonly="readonly" value='<%#string.Format("{0:yyyy-MM-dd}",Eval("SignDate")) %>'
                                class="kpms-textbox-date" />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("MainBodyID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
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
            <zhongsoft:LightDropDownList runat="server" ID="ddlPhysicalIndicator1" TableName="MM_ContractCheck"
                Field="PhysicalIndicator1" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">实物量</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbConverting1" field="Converting1" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" tablename="MM_ContractCheck" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">实物量指标2（数值）
        </td>
        <td class="td-m" colspan="3">
            <zhongsoft:LightDropDownList runat="server" ID="ddlPhysicalIndicator2" TableName="MM_ContractCheck"
                Field="PhysicalIndicator2" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightDropDownList>
        </td>
        <td class="td-l">实物量</td>
        <td class="td-r">
            <zhongsoft:LightTextBox runat="server" ID="tbConverting2" field="Converting2" EnableTheming="false"
                CssClass="kpms-textbox-money" DataType="Decimal2" tablename="MM_ContractCheck" activestatus="(23.提交合同)(3.返回修改)">
            </zhongsoft:LightTextBox>
        </td>
    </tr>
    <tr>
        <td class="td-l">备注</td>
        <td class="td-m" colspan="5">
            <zhongsoft:LightTextBox runat="server" ID="tbMemo" field="Memo" tablename="MM_ContractCheck" activestatus="(23.提交合同)(3.返回修改)" CssClass="kpms-textarea"
                EnableTheming="False" MaxLength="1024" TextMode="MultiLine" />
        </td>
    </tr>
    <tr>
        <td class="flexible" colspan="6">
            <span>合同拆分信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <span style="float: right;" id="Span1" runat="server" displaystatus="(3.提交合同)">
                <asp:LinkButton runat="server" ID="lbtnSelMarket" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return false">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择工程" width="16"
                            height="16" />选择工程</span>
                </asp:LinkButton></span>
        </td>
    </tr>
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvContractReleMProj" runat="server" UseDefaultDataSource="true" permissionstatus="true"
                ShowFooter="true" FooterStyle-HorizontalAlign="Right" DataKeyNames="ContractReleMProjID" OnRowCommand="gvContractReleMProj_RowCommand">
                <Columns>
                    <zhongsoft:LightBoundField DataField="ProjectPackage" HeaderText="所属工程包" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectName" HeaderText="工程名称" ItemStyle-Width="100px" ShowToolTip="true">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MarketProjectCode" HeaderText="工程编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="收费负责人<span class='req-star'>*</span>" ItemStyle-Width="120px" Visible="false">
                        <ItemTemplate>
                            <zhongsoft:LightObjectSelector runat="server" ID="txtChargeOfficerName" IsMutiple="false"
                                SelectPageMode="Dialog" activestatus="(23.提交合同)(3.返回修改)" SourceMode="SelectorPage"
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
                                Text='<%# Eval("ContractValue")==DBNull.Value?"": (Convert.ToDecimal(Eval("ContractValue") )/10000).ToString("F2") %>' req="1"
                                CssClass="kpms-textbox-money" EnableTheming="false" activestatus="(23.提交合同)(3.返回修改)"></zhongsoft:LightTextBox>
                            <input type="hidden" runat="server" id="hiMarketProjectID" value='<%#Eval("MarketProjectID") %>' />
                            <input type="hidden" runat="server" id="hiContractReleMProjID" value='<%#Eval("ContractReleMProjID") %>' />
                        </ItemTemplate>
                        <FooterTemplate>
                            <asp:Label runat="server" ID="lbTotalAmount" flag="total"></asp:Label>
                        </FooterTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="100px">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbMemo" Text='<%#Eval("Memo") %>' MaxLength="1024" activestatus="(23.提交合同)(3.返回修改)"
                                CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="2"></zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                        Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del" CommandArgument='<%# Eval("ContractReleMProjID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
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
            <asp:LinkButton runat="server" ID="lbtnUp" displaystatus="(3.提交合同)(3.返回修改)" EnableTheming="False" OnClientClick="return uploadFileStamp('Form','General');">
                <img src="../../Themes/Images/btn_upload.gif">
                <span>上传附件</span>
            </asp:LinkButton>
            <span class="req-star" style="float: right;"
                id="Span2" runat="server" displaystatus="(2.*)">请先保存再上传附件</span>
            <uc3:UpLoadFile ID="uploadFile" runat="server" />
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiContractCheckID" tablename="MM_ContractCheck"
    field="ContractCheckID" />
<input runat="server" type="hidden" id="hiContractID" tablename="MM_ContractCheck"
    field="ContractID" />
<input type="hidden" runat="server" id="hiContractMainBody" />
<asp:Button runat="server" ID="btnBindContractMainBody" OnClick="btnBindContractMainBody_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiReleMarket" />
<asp:Button runat="server" ID="btnBindReleMarket" OnClick="btnBindReleMarket_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiCreateDeptLevel" tablename="MM_ContractCheck"
    field="CreateDeptLevel" />
<asp:Button ID="btnUploadFileCallBack" runat="server" Visible="false" OnClick="btnUploadFileCallBack_OnClick" />
<div id="hide" style="display: none">
    <table class="tz-table" style="width: 100%">
        <tr runat="server" visible="false">
            <td class="td-l">是否需公司批
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBox ID="cbIsNeedCompany" activestatus="(23.?)"
                    runat="server" field="IsNeedCompany" tablename="MM_ContractCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedCompany" tablename="MM_ContractCheck" field="IsNeedCompany" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否需协办部门
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbIsNeedCoDept" activestatus="(23.提交合同)"
                    runat="server" tablename="MM_ContractCheck" field="IsNeedCoDept"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedCoDept" tablename="MM_ContractCheck" field="IsNeedCoDept" />
            </td>
            <td class="td-l" flag="coDept">协办部门<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" flag="coDept">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCoDeptNames" IsMutiple="true"
                    ResultForControls="{'hiCoDeptIDs':'id'}" EnableTheming="false"
                    PageUrl="~/Sys/OrgUsers/OrgSelectorJson.aspx" SelectPageMode="Dialog" Filter="{showTree:'1'}"
                    ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.提交合同)"
                    TableName="MM_ContractCheck" field="CoDeptNames" />
                <input type="hidden" runat="server" id="hiCoDeptIDs" tablename="MM_ContractCheck"
                    field="CoDeptIDs" />
            </td>
            <td class="td-m" colspan="4" flag="noCoDept" style="display: none"></td>
        </tr>
        <tr>
            <td class="td-l">是否需副总师批
            </td>
            <td class="td-r">
                <asp:CheckBox ID="cbIsNeedMaster" activestatus="(23.提交合同)"
                    runat="server" field="IsNeedMaster" tablename="MM_ContractCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedMaster" tablename="MM_ContractCheck" field="IsNeedMaster" />
            </td>
            <td class="td-l" flag="master">副总师<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3" flag="master">
                <zhongsoft:LightObjectSelector runat="server" ID="txtMasterName" IsMutiple="false"
                    SelectPageMode="Dialog" activestatus="(23.提交合同)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    ResultForControls="{'hiMasterID':'id'}" field="MasterName" tablename="MM_ContractCheck"
                    PageWidth="850" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" Filter="{'RoleName':'副总工程师'}"></zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiMasterID" runat="server" field="MasterID"
                    tablename="MM_ContractCheck" />
            </td>
            <td class="td-m" colspan="4" flag="noMaster" style="display: none"></td>
        </tr>
        <tr>
            <td class="td-l">主管领导<span class="req-star">*</span></td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="tbMianLeaderName" req="1" IsMutiple="false" SelectPageMode="Dialog"
                    ResultForControls="{'hiMianLeaderID':'id'}" EnableTheming="false"
                    Text="选择主管领导" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                    Filter="{'OrganizationId':'F9A24FD1-3C1F-4FFE-AB5E-11509D8827EE','IsOnlyFilterDept':'1'}"
                    ResultAttr="name" activestatus="(23.提交合同)" TableName="MM_ContractCheck" Field="MianLeaderName" />
                <input type="hidden" id="hiMianLeaderID" runat="server" tablename="MM_ContractCheck" field="MianLeaderID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否需董事长批
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBox ID="cbIsNeedChief" activestatus="(23.提交合同)"
                    runat="server" field="IsNeedChief" tablename="MM_ContractCheck"></asp:CheckBox>
                <input type="hidden" runat="server" id="hiIsNeedChief" tablename="MM_ContractCheck" field="IsNeedChief" />
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">   

    function initCustomerPlugin() {
        //将是否需要xx审批，整合到通用意见处
        $('#userSelect').append($('#hide').html());
        $('#hide').empty();

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

        //是否需要公司批相关处理
        setCompanyInfo(true);
        $('#<%=cbIsNeedCompany.ClientID %>').live('change', function () {
            setCompanyInfo(false);
        });

        setCoDeptInfo(true);
        $('#<%=cbIsNeedCoDept.ClientID %>').live('change', function () {
            setCoDeptInfo(false);
        });

        setMasterInfo(true);
        $('#<%=cbIsNeedMaster.ClientID %>').live('change', function () {
            setMasterInfo(false);
        });

        //是否需董事长批
        setChiefInfo(true);
        $('#<%=cbIsNeedChief.ClientID %>').live('change', function () {
            setChiefInfo(false);
        });

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
        if ($formAction == 0) {
            var result = "";
            if ($actName == "提交合同") {
                $.ajax({
                    type: 'POST',
                    url: buildQueryUrl("/MM/Handler/ContractHandler.ashx", null),
                    data: { 'checkType': "ContractName", BizID: $("#<%=hiContractID.ClientID %>").val(), 'ContractName': $("#<%=tbContractName.ClientID %>").val() },
                    async: false,
                    cache: false,
                    success: function (res) {
                        result = res;
                    },
                    error: function (err) {
                    }
                });
            }
            if (result != "") {
                if (parseBool(result)) {
                    alert("合同名称已经存在，请重新填写");
                    return false;
                }
            }
            if ($('#<%=gvContractReleMProj.ClientID %>')[0].rows[1].cells[0].innerText != "没有要查找的数据") {
                //var businessPlate = $("#<%=rblBusinessPlate.ClientID %> input[type=radio]:checked").val();
                //业务板块 工程承包类型不需要做工程金额验证
                var businessPlate = $("#<%=rblBusinessPlate.ClientID %> input[type=radio]:checked")[0].nextSibling.innerText;
                if (businessPlate != "工程承包") {
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
        }
        return true;
    }

    function contactFilter(id) {
        var $hiCustomerID = $('#<%=gvContractMainBody.ClientID %> [flag="' + id + '"]');
        var customerID = $hiCustomerID.val();
        return { CustomerID: customerID };
    }

    //是否需公司批相关处理（checkbox控件选中状态会丢失，所以增加hidden辅助）
    function setCompanyInfo(isLoad) {
        if (isLoad) {
            var isNeedCompany = $('#<%=hiIsNeedCompany.ClientID%>').val();
            if (isNeedCompany == '1') {
                $("#<%=cbIsNeedCompany.ClientID%>").attr('checked', true);
            }
        }

        if ($("#<%=cbIsNeedCompany.ClientID%>").is(':checked')) {
            $('#<%=hiIsNeedCompany.ClientID%>').val('1');
        }
        else {
            $('#<%=hiIsNeedCompany.ClientID%>').val('0');
        }
    }

    //协办部门
    function setCoDeptInfo(isLoad) {
        if (isLoad) {
            var isNeedCoDept = $('#<%=hiIsNeedCoDept.ClientID%>').val();
            if (isNeedCoDept == '1')
                $("#<%=cbIsNeedCoDept.ClientID%>").attr('checked', true);
        }

        if ($("#<%=cbIsNeedCoDept.ClientID%>").is(':checked')) {
            $('[flag = "coDept"]').show();
            $('[flag = "noCoDept"]').hide();
            $("#<%=txtCoDeptNames.ClientID%>").attr("req", "1");
            $('#<%=hiIsNeedCoDept.ClientID%>').val('1');
        }
        else {
            $('[flag = "coDept"]').hide();
            $('[flag = "noCoDept"]').show();
            $("#<%=txtCoDeptNames.ClientID%>").removeAttr("req");
            $('#<%=hiIsNeedCoDept.ClientID%>').val('0');
            //清空选择的协办部门信息
            $('#<%=txtCoDeptNames.ClientID%>').val('');
            $('#<%=txtCoDeptNames.ClientID%>_hivalue').val('');
            $('#<%=hiCoDeptIDs.ClientID%>').val('');
        }
    }

    //主管副总
    function setMasterInfo(isLoad) {
        if (isLoad) {
            var isNeedMaster = $('#<%=hiIsNeedMaster.ClientID%>').val();
            if (isNeedMaster == '1')
                $("#<%=cbIsNeedMaster.ClientID%>").attr('checked', true);
        }

        if ($("#<%=cbIsNeedMaster.ClientID%>").is(':checked')) {
            $('[flag = "master"]').show();
            $('[flag = "noMaster"]').hide();
            $("#<%=txtMasterName.ClientID%>").attr("req", "1");
            $('#<%=hiIsNeedMaster.ClientID%>').val('1');
        }
        else {
            $('[flag = "master"]').hide();
            $('[flag = "noMaster"]').show();
            $("#<%=txtMasterName.ClientID%>").removeAttr("req");
            $('#<%=hiIsNeedMaster.ClientID%>').val('0');

            //清空选择的主管副总信息
            $('#<%=txtMasterName.ClientID%>').val('');
            $('#<%=txtMasterName.ClientID%>_hivalue').val('');
            $('#<%=hiMasterID.ClientID%>').val('');
        }
    }

    //是否需董事长批
    function setChiefInfo(isLoad) {
        if (isLoad) {
            var isNeedChief = $('#<%=hiIsNeedChief.ClientID%>').val();
            if (isNeedChief == '1') {
                $("#<%=cbIsNeedChief.ClientID%>").attr('checked', true);
            }
        }

        if ($("#<%=cbIsNeedChief.ClientID%>").is(':checked')) {
            $('#<%=hiIsNeedChief.ClientID%>').val('1');
        }
        else {
            $('#<%=hiIsNeedChief.ClientID%>').val('0');
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
        var $total = $('[flag="total"]');
        if ($total.length > 0) {
            $total[0].innerHTML = totalAmount;
        }
    }

    function chargeOfficerFilter() {
        return { OrganizationID: '<%=KPMSUser.DeptId%>' };
    }
</script>
