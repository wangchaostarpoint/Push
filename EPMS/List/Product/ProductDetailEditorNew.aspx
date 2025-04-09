<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ProductDetailEditorNew.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductDetailEditorNew" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
        .ui-tabs-panel {
            background: #eff3f6 !important;
        }

        .sData, .sHeader {
            width: 100% !important;
        }

            .sData table {
                width: 100% !important;
            }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li id="liMap"><a href='#' onclick="showDetail('mapInfo')">图纸</a></li>
            <li id="liText"><a href='#' onclick="showDetail('textInfo')">其他</a></li>
            <li id="liSign"><a href='#' onclick="showDetail('signInfo')">会签成品</a></li>
            <li id="liOpinion"><a href='#' onclick="showDetail('oppionInfo')">校审意见</a></li>
        </ul>
        <table width="100%">
            <tr>
                <td id="productList" valign="top">
                    <!--滚动条-->
                    <div>
                        <span class="req-star" style="display: none;" flag="opinion">如果需要针对卷册提建议，不需勾选成品；否则勾选成品进行批量添加意见</span>
                        <table style="width: 100%">
                            <tr>
                                <td id="tdProduct">
                                    <table width="100%">
                                        <tr>
                                            <td class="td-l">设计人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName" IsMutiple="true"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                                                    FilterFunction="designerFilter()"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiDesignerId" />
                                            </td>
                                            <td class="td-l">校核人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbCheckerName" IsMutiple="true"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" PageWidth="850"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiCheckerId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="getCheckerFilter()"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiCheckerId" />
                                            </td>
                                            <td class="td-l">审核人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbVerifyerName" IsMutiple="true"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" PageWidth="850"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiVerifyerId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="{QualificationName:'审核'}"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiVerifyerId" />
                                            </td>
                                            <td class="td-l">批准人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbApproverName" IsMutiple="false"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" PageWidth="850"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiApproverId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="{QualificationName:'批准'}"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiApproverId" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <%-- <td class="td-l">
                                                批量更改内容
                                            </td>--%>
                                            <td class="td-l">成品类别
                                            </td>
                                            <td class="td-r">
                                                <asp:DropDownList ID="ddlProductType" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="td-l" style="display: none;">压力管道级别
                                            </td>
                                            <td class="td-r" style="display: none;">
                                                <asp:DropDownList ID="ddlPressurePipeLevel" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="td-r" colspan="6">
                                                <asp:LinkButton runat="server" ID="lbtnUpdateAll" flag="update" OnClick="lbtnUpdateAll_Click"
                                                    ToolTip="针对打钩项进行保存" Style="float: right;">
                                           <span style="white-space:nowrap;">批量更新</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8">
                                                <div style="overflow-y: auto; max-height: 440px;">
                                                    <zhongsoft:LightPowerGridView runat="server" Width="100%" ID="gvProductList" AllowPaging="false"
                                                        AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ProductID" UseDefaultDataSource="true"
                                                        BindGridViewMethod="BindProductList" EmptyDataText="没有成品信息" AllowFrozing="false"
                                                        OnRowDataBound="gvProductList_RowDataBound">
                                                        <Columns>
                                                            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50">
                                                            </zhongsoft:LightCheckField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品编号" SortExpression="ProductCode" ItemStyle-Width="120px">
                                                                <ItemTemplate>
                                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                                        <%#Eval("ProductCode")%>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="120px" Visible="false">
                                                                <ItemTemplate>
                                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                                        <%#Eval("ProductName")%>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品类别">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlProductType">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="压力管道<br/>级别" Visible="false">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList ID="ddlPressurePipeLevel" runat="server">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="设计人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbDesignUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignUserId':'id'}"
                                                                        PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="designerFilter()"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiDesignUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="校核人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbCheckUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiCheckUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="getCheckerFilter()"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiCheckUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="审核人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbVerifyUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiVerifyUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="{QualificationName:'审核'}"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiVerifyUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="批准人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbApproveUserName" IsMutiple="false"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiApproveUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="{QualificationName:'批准'}"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiApproveUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="格式" ItemStyle-Width="55px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlFileFormat">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="图幅" ItemStyle-Width="85px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlMapsize" AutoPostBack="true" OnSelectedIndexChanged="ddlMapsize_SelectedIndexChanged">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="标准张" ItemStyle-Width="45px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightTextBox runat="server" ID="tbStandardPage" DataType="Decimal2" Text='<%#Eval("StandardPage") %>'>
                                                                    </zhongsoft:LightTextBox>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ID="lbtnSave" EnableTheming="false" CommandName="SaveData"
                                                                        key='<%#Eval("ProductID") %>' OnClick="lbtnSave_Click" flag="update">
                                <img alt="保存" title="保存" src="../../../Themes/Images/btn_save.gif"                                     />
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </zhongsoft:LightPowerGridView>
                                                </div>
                                                <asp:LinkButton runat="server" ID="lbtnUpdateAllList" flag="update" OnClick="lbtnUpdateAllList_Click"
                                                    ToolTip="针对所有列表项进行保存">
                                           <span style="white-space:nowrap;">保存</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="lbtnUpdateAllListAndClose" flag="update" OnClick="lbtnUpdateAllListAndClose_Click"
                                                    ToolTip="针对所有列表项进行保存">
                                           <span style="white-space:nowrap;">关闭</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td id="tdText">
                                    <table width="100%">
                                        <tr>
                                            <td class="td-l">设计人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName1" IsMutiple="true"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId1':'id'}"
                                                    PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="designerFilter()"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiDesignerId1" />
                                            </td>
                                            <td class="td-l">校核人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbCheckerName1" IsMutiple="true" PageWidth="850"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiCheckerId1':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="getCheckerFilter()"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiCheckerId1" />
                                            </td>
                                            <td class="td-l">审核人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbVerifyerName1" IsMutiple="true" PageWidth="850"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiVerifyerId1':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="{QualificationName:'审核'}"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiVerifyerId1" />
                                            </td>
                                            <td class="td-l">批准人
                                            </td>
                                            <td class="td-r">
                                                <zhongsoft:LightObjectSelector runat="server" ID="tbApproverName1" IsMutiple="false" PageWidth="850"
                                                    EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                    DoCancel="true" ResultAttr="name" ResultForControls="{'hiApproverId1':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                    FilterFunction="{QualificationName:'批准'}"></zhongsoft:LightObjectSelector>
                                                <input type="hidden" runat="server" id="hiApproverId1" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <%--<td class="td-l">
                                                批量更改内容
                                            </td>--%>
                                            <td class="td-l">成品类别
                                            </td>
                                            <td class="td-r">
                                                <asp:DropDownList ID="ddlProductType1" runat="server">
                                                </asp:DropDownList>
                                            </td>
                                            <td class="td-r" colspan="6">
                                                <asp:LinkButton runat="server" ID="lbtnUpdateText" flag="update" OnClick="lbtnUpdateText_Click"
                                                    ToolTip="针对打钩项进行保存" Style="float: right;">
                                           <span>批量更新</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>

                                        <tr>
                                            <td colspan="8">
                                                <div style="overflow-y: auto; max-height: 440px;">
                                                    <zhongsoft:LightPowerGridView runat="server" Width="100%" ID="gvTextList" AllowPaging="false"
                                                        AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ProductID" UseDefaultDataSource="true"
                                                        BindGridViewMethod="BindTextList" EmptyDataText="没有成品信息" FrozenHeight="500px"
                                                        AllowFrozing="false" OnRowDataBound="gvTextList_RowDataBound">
                                                        <Columns>
                                                            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50">
                                                            </zhongsoft:LightCheckField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品编号" SortExpression="ProductCode" ItemStyle-Width="120px">
                                                                <ItemTemplate>
                                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                                        <%#Eval("ProductCode")%>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="120px" Visible="false">
                                                                <ItemTemplate>
                                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                                        <%#Eval("ProductName")%>
                                                                    </div>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="成品类别">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlProductType">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="设计人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbDesignUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignUserId':'id'}"
                                                                        PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="designerFilter()"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiDesignUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="校核人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbCheckUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiCheckUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="getCheckerFilter()"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiCheckUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="审核人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbVerifyUserName" IsMutiple="true"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiVerifyUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="{QualificationName:'审核'}"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiVerifyUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="批准人" ItemStyle-Width="75px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="tbApproveUserName" IsMutiple="false"
                                                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiApproveUserId':'id'}" PageWidth="850"
                                                                        PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" FilterFunction="{QualificationName:'批准'}"></zhongsoft:LightObjectSelector>
                                                                    <input type="hidden" runat="server" id="hiApproveUserId" />
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="格式" ItemStyle-Width="55px">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList runat="server" ID="ddlFileFormat">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="文本类型">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList ID="ddlTextType" runat="server">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="文本本数" ItemStyle-Width="5%">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightTextBox runat="server" ID="tbTotalOfBook" DataType="Integer" Text='<%#Eval("TotalOfBook") %>'>
                                                                    </zhongsoft:LightTextBox>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="文本页数" ItemStyle-Width="5%">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightTextBox runat="server" ID="tbBookPages" DataType="Integer" Text='<%#Eval("BookPages") %>'>
                                                                    </zhongsoft:LightTextBox>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="计算书项">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightDropDownList ID="ddlCalculateInfo" runat="server">
                                                                    </zhongsoft:LightDropDownList>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <asp:TemplateField HeaderText="保存" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ID="lbtnSaveFile" EnableTheming="false" CommandName="SaveData"
                                                                        key='<%#Eval("ProductID") %>' OnClick="lbtnSaveFile_Click" flag="update">
                                <img alt="保存" title="保存" src="../../../Themes/Images/btn_save.gif"                                     />
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </asp:TemplateField>
                                                        </Columns>
                                                    </zhongsoft:LightPowerGridView>
                                                </div>
                                                <asp:LinkButton runat="server" ID="lbtnUpdateTextList" flag="update" OnClick="lbtnUpdateTextList_Click"
                                                    ToolTip="针对所有列表项进行保存">
                                           <span style="white-space:nowrap;">保存</span>
                                                </asp:LinkButton>
                                                <asp:LinkButton runat="server" ID="lbtnUpdateTextListAndClose" flag="update" OnClick="lbtnUpdateTextListAndClose_Click"
                                                    ToolTip="针对所有列表项进行保存">
                                           <span style="white-space:nowrap;">关闭</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <%--  <td style="width: 0px; background: #eff3f6;">
                </td>--%>
                <td valign="top" id="productDetail">
                    <div id="mapInfo" style="width: 100%">
                        <table class="tz-table" style="width: 100%">
                            <tr style="display: none">
                                <td class="td-l">成品编号
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightTextBox runat="server" ID="tbProductCode"></zhongsoft:LightTextBox>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnProductCodeUpdate" runat="server" flag="update" Text="更新" OnClick="btnProductCodeUpdate_Click" />
                                </td>
                            </tr>
                            <tr style="display: none">
                                <td class="td-l">图纸类型
                                </td>
                                <td class="td-r">
                                    <%--<asp:DropDownList ID="ddlMapType" runat="server" AutoPostBack="true" OnSelectedIndexChanged="ddlMapType_SelectedIndexChanged"
                                        Width="150px">
                                    </asp:DropDownList>--%>
                                </td>
                                <td style="text-align: center; width: 50px;"></td>
                            </tr>
                            <tr>
                                <%--<td class="td-l">
                                    成品类别
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlProductType" runat="server">
                                    </asp:DropDownList>
                                </td>--%>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnProductTypeUpdate" runat="server" flag="update" Text="更新" OnClick="btnProductTypeUpdate_Click" />
                                </td>
                            </tr>
                            <tr id="trPressure" style="display: none">
                                <%--  <td class="td-l">
                                    压力管道级别
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlPressurePipeLevel" runat="server">
                                    </asp:DropDownList>
                                </td>--%>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnPressurePipeLeveleUpdate" runat="server" flag="update" Text="更新"
                                        OnClick="btnPressurePipeLeveleUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">图幅
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlMapsize" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnMapsizeUpdate" runat="server" flag="update" Text="更新" OnClick="btnMapsizeUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">格式
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlFileFormat" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnFileFormatUpdate" runat="server" flag="update" Text="更新" OnClick="btnFileFormatUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">标准张
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightTextBox runat="server" ID="tbStandardPage" DataType="Decimal2" Width="96%"></zhongsoft:LightTextBox>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnStandardPageUpdate" runat="server" flag="update" Text="更新" OnClick="btnStandardPageUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <%--<td class="td-l">
                                    设计人
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName" IsMutiple="true"
                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId':'id'}" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
                                        FilterFunction="designerFilter()"></zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiDesignerId" />
                                </td>--%>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnDesignerUpdate" runat="server" flag="update" Text="更新" OnClick="btnDesignerUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">删除成品
                                </td>
                                <td class="td-r"></td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnDelete" runat="server" flag="update" Text="删除" OnClientClick="return confirm('您确定删除列表中选择的成品吗？');"
                                        OnClick="btnDelete_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="textInfo" style="width: 100%">
                        <table class="tz-table" style="width: 100%">
                            <tr style="display: none;">
                                <td class="td-l">成品名称
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightTextBox runat="server" ID="tbProductName" Width="96%"></zhongsoft:LightTextBox>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnProductNameUpdate" runat="server" flag="update" Text="更新" OnClick="btnProductNameUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <%--<td class="td-l">
                                    成品类别
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlProductType1" runat="server">
                                    </asp:DropDownList>
                                </td>--%>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnProductTypeUpdate1" runat="server" flag="update" Text="更新" OnClick="btnProductTypeUpdate1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">格式
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlFileFormat1" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnFileFormatUpdate1" runat="server" flag="update" Text="更新" OnClick="btnFileFormatUpdate1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">文本类型
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlTextType" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnTextTypeUpdate" runat="server" flag="update" Text="更新" OnClick="btnTextTypeUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">文本页数
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightTextBox runat="server" ID="tbBookPages" DataType="Integer" Width="96%"></zhongsoft:LightTextBox>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnBookPagesUpdate" runat="server" flag="update" Text="更新" OnClick="btnBookPagesUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">文本本数
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightTextBox runat="server" ID="tbTotalOfBook" DataType="Integer" Width="96%"></zhongsoft:LightTextBox>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnTotalOfBookUpdate" runat="server" flag="update" Text="更新" OnClick="btnTotalOfBookUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">计算书项
                                </td>
                                <td class="td-r">
                                    <asp:DropDownList ID="ddlCalculateInfo" runat="server">
                                    </asp:DropDownList>
                                </td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnCalculateInfo" runat="server" flag="update" Text="更新" OnClick="btnCalculateInfoUpdate_Click" />
                                </td>
                            </tr>
                            <tr>
                                <%--<td class="td-l">
                                    设计人
                                </td>
                                <td class="td-r">
                                    <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName1" IsMutiple="true"
                                        EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                        DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId1':'id'}"
                                        PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" FilterFunction="designerFilter()">
                                    </zhongsoft:LightObjectSelector>
                                    <input type="hidden" runat="server" id="hiDesignerId1" />
                                </td>--%>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnDesignerUpdate1" runat="server" flag="update" Text="更新" OnClick="btnDesignerUpdate1_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td class="td-l">删除成品
                                </td>
                                <td class="td-r"></td>
                                <td style="text-align: center; width: 50px;">
                                    <asp:Button ID="btnDelete1" runat="server" flag="update" Text="删除" OnClientClick="return confirm('您确定删除列表中选择的成品吗？');"
                                        OnClick="btnDelete1_Click" />
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="signInfo" style="width: 100%">
                        <table class="tz-table" style="width: 100%;">
                            <tr>
                                <td align="right">
                                    <%--  <asp:Button ID="btnAddSignOperator" Text="添加会签人" runat="server" flag="update" class="kpms-buttonfree"
                                        OnClientClick="return addSignOperator();" OnClick="btnAddSignOperator_Click"
                                        ToolTip="添加成品会签人" />--%>
                                    <asp:Button ID="btnAddSignSpe" Text="添加会签专业" runat="server" flag="update" class="kpms-buttonfree"
                                        OnClientClick="return addSignSpe();" OnClick="btnAddSignSpe_Click" ToolTip="添加会签专业" />
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <zhongsoft:LightPowerGridView runat="server" Width="100%" ID="gvSignProductList"
                                        AllowPaging="false" AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ProductID"
                                        UseDefaultDataSource="true" BindGridViewMethod="BindSignProductList" EmptyDataText="没有成品信息"
                                        FrozenHeight="500px" AllowFrozing="false" OnRowDataBound="gvSignProductList_RowDataBound">
                                        <Columns>
                                            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="50">
                                            </zhongsoft:LightCheckField>
                                            <zhongsoft:LightTemplateField HeaderText="成品编号" SortExpression="ProductCode" ItemStyle-Width="180px">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                        <%#Eval("ProductCode")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="250px">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important;">
                                                        <%#Eval("ProductName")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="会签信息">
                                                <ItemTemplate>
                                                    <zhongsoft:LightPowerGridView ID="gvSignList" runat="server" AllowPaging="false"
                                                        AllowSorting="true" AutoGenerateColumns="false" BindGridViewMethod="BindSignGrid"
                                                        DataKeyNames="ProductID,ParamSpecialtyID" EmptyDataText="没有会签信息" PageSize="20"
                                                        UseDefaultDataSource="true" Width="100%" OnRowDataBound="gvSignList_RowDataBound"
                                                        OnRowCommand="gvSignList_RowCommand" ShowHeader="false" ShowEmptyDataHeader="false"
                                                        ShowFooter="false">
                                                        <Columns>
                                                            <zhongsoft:LightTemplateField HeaderText="成品" ItemStyle-Width="100" Visible="false">
                                                                <ItemTemplate>
                                                                    <div runat="server" id="divProduct" style="word-break: break-all!important; white-space: normal!important; width: 110px">
                                                                    </div>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="会签专业" ItemStyle-Width="100">
                                                                <ItemTemplate>
                                                                    <asp:Label runat="server" ID="lbSignSpe"></asp:Label>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="会签人" ItemStyle-Width="150">
                                                                <ItemTemplate>
                                                                    <zhongsoft:LightObjectSelector runat="server" ID="txtSignerInfo" IsMutiple="true" 
                                                                        ShowSelectBtn="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                                                        SelectPageMode="Dialog" DoCancel="false" ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                                        OnClick="txtSignerInfo_Click" pid='<%#Eval("ProductID") %>' sid='<%#Eval("ParamSpecialtyID") %>'
                                                                        PageWidth="850" ToolTip="选择会签人" title="选择会签人"></zhongsoft:LightObjectSelector>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                            <zhongsoft:LightTemplateField HeaderText="删除">
                                                                <ItemTemplate>
                                                                    <asp:LinkButton runat="server" ID="lbtnDel" CommandName="del" EnableTheming="false"
                                                                        OnClientClick="return confirm('确定删除吗？')" CommandArgument='<%# Eval("ProductID")+"|"+Eval("ParamSpecialtyID")%>'>
                                                                        <img src="~/Themes/Images/btn_dg_delete.gif"  runat="server"/>
                                                                    </asp:LinkButton>
                                                                </ItemTemplate>
                                                            </zhongsoft:LightTemplateField>
                                                        </Columns>
                                                    </zhongsoft:LightPowerGridView>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                        </Columns>
                                    </zhongsoft:LightPowerGridView>
                                    <zhongsoft:LightPowerGridView ID="gvSignList1" runat="server" AllowPaging="true"
                                        AllowSorting="true" AutoGenerateColumns="false" BindGridViewMethod="BindSignGrid"
                                        DataKeyNames="ProductID,ParamSpecialtyID" EmptyDataText="没有会签信息" PageSize="20"
                                        UseDefaultDataSource="true" Width="100%" OnRowDataBound="gvSignList_RowDataBound"
                                        OnRowCommand="gvSignList_RowCommand">
                                        <Columns>
                                            <zhongsoft:LightTemplateField HeaderText="成品" ItemStyle-Width="100" Visible="false">
                                                <ItemTemplate>
                                                    <div runat="server" id="divProduct" style="word-break: break-all!important; white-space: normal!important; width: 110px">
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="会签专业" ItemStyle-Width="100">
                                                <ItemTemplate>
                                                    <asp:Label runat="server" ID="lbSignSpe"></asp:Label>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="会签人" ItemStyle-Width="170">
                                                <ItemTemplate>
                                                    <zhongsoft:LightObjectSelector runat="server" ID="txtSignerInfo" IsMutiple="true" 
                                                        ShowSelectBtn="false" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                                        SelectPageMode="Dialog" DoCancel="false" ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                        OnClick="txtSignerInfo_Click" pid='<%#Eval("ProductID") %>' sid='<%#Eval("ParamSpecialtyID") %>'
                                                        PageWidth="850" ToolTip="选择会签人" title="选择会签人"></zhongsoft:LightObjectSelector>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该会签成品吗？">
                                            </zhongsoft:LightButtonField>
                                        </Columns>
                                    </zhongsoft:LightPowerGridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="oppionInfo" style="width: 100%">
                        <table class="list" style="width: 100%;">
                            <tr class="list-header" runat="server" id="trAddOpinionTitle">
                                <td style="width: 50%">校审意见
                                </td>
                                <td style="width: 20%">差错性质
                                </td>
                                <td style="width: 20%">差错类别
                                </td>
                                <td style="width: 10%">质量判定
                                </td>
                            </tr>
                            <tr align="left" runat="server" id="trAddOpinionContent">
                                <td class="td-m">
                                    <zhongsoft:LightTextBox ID="tbVerifyOpinion" runat="server" TextMode="MultiLine"
                                        ToolTip="请输入校审意见" CssClass="kpms-textarea" EnableTheming="false" Height="20px"
                                        Width="95%" maxtext="1024"></zhongsoft:LightTextBox>
                                    <input type="hidden" runat="server" id="hiVerifyOpinionID" />
                                </td>
                                <td class="td-m">
                                    <asp:RadioButtonList ID="rblMistakeType" runat="server" RepeatDirection="Vertical"
                                        RepeatColumns="2" CssClass="kpms-radio" ToolTip="请选择差错性质">
                                    </asp:RadioButtonList>
                                </td>
                                <td class="td-m"></td>
                                <td class="td-m" title="如果校审意见较重要，具有借鉴意义，请选中该项" align="left">
                                    <asp:CheckBox ID="ckIsQuality" runat="server"></asp:CheckBox>
                                </td>
                            </tr>
                        </table>
                        <table class="tz-table" style="width: 100%; border-top: none!important;">
                            <tr>
                                <td style="height: 26px;">
                                    <asp:RadioButtonList ID="rblOpinionType" runat="server" RepeatColumns="3" OnSelectedIndexChanged="rblOpinionType_SelectedIndexChanged"
                                        AutoPostBack="true">
                                        <asp:ListItem Value="mine" Selected="True">我添加的校审意见</asp:ListItem>
                                        <asp:ListItem Value="other">其他校审人的意见</asp:ListItem>
                                    </asp:RadioButtonList>
                                </td>
                                <td align="right" style="padding-right: 5px;">
                                    <asp:Button ID="btnSaveOpinion" runat="server" flag="update" Text="保存" Width="50px"
                                        OnClick="btnSaveOpinion_Click" />
                                </td>
                            </tr>
                            <tr>
                                <td style="width: 100%" colspan="2" valign="top">
                                    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                                        <ContentTemplate>
                                            <zhongsoft:LightPowerGridView runat="server" ID="gvOpinionList" AllowPaging="false"
                                                AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" EmptyDataText="没有校审意见"
                                                DataKeyNames="VerifyOpinionID" UseDefaultDataSource="true" FrozenHeight="335"
                                                AllowFrozing="true" BindGridViewMethod="BindGrid" OnRowDataBound="gvOpinionList_RowDataBound"
                                                OnRowCommand="gvOpinionList_RowCommand">
                                                <Columns>
                                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                                        <ItemTemplate>
                                                            <%# Container.DataItemIndex+1 %>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightTemplateField HeaderText="校审成品" SortExpression="ProductCode" HeaderStyle-Width="130">
                                                        <ItemTemplate>
                                                            <div style="word-break: break-all!important; white-space: normal!important; width: 130px;">
                                                                <%#Eval("ProductCode")%>
                                                            </div>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightTemplateField HeaderText="校审意见" HeaderStyle-Width="130">
                                                        <ItemTemplate>
                                                            <asp:TextBox ID="tbVerifyOpinion" runat="server" TextMode="MultiLine" Text='<%#Eval("VerifyOpinion")%>'
                                                                CssClass="kpms-textarea" EnableTheming="false" Height="20px" Width="130px" maxtext="1024"
                                                                ToolTip='<%#Eval("VerifyOpinion")%>'></asp:TextBox>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightBoundField DataField="RoleName" HeaderText="校审角色" ItemStyle-Width="80" />
                                                    <zhongsoft:LightTemplateField HeaderText="差错性质" ItemStyle-Width="130">
                                                        <ItemTemplate>
                                                            <asp:RadioButtonList ID="rblMistakeTypeList" runat="server" RepeatDirection="Vertical"
                                                                RepeatColumns="2" CssClass="kpms-radio" ToolTip="请选择差错性质">
                                                            </asp:RadioButtonList>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightBoundField HeaderText="差错类别" ItemStyle-Width="100" />
                                                    <zhongsoft:LightTemplateField HeaderText="修改情况" ItemStyle-Width="50">
                                                        <ItemTemplate>
                                                            <%#Eval("ExcutionState") == "1" ? "已执行" : Eval("ExcutionState") == "0" ? "不执行" : "未修改" + Eval("Memo")%>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightTemplateField HeaderText="质量<br/>判定" ItemStyle-Width="30">
                                                        <ItemTemplate>
                                                            <asp:CheckBox ID="ckIsQuality" runat="server"></asp:CheckBox>
                                                        </ItemTemplate>
                                                    </zhongsoft:LightTemplateField>
                                                    <zhongsoft:LightBoundField DataField="PutUserName" HeaderText="提出人" ItemStyle-Width="40" />
                                                    <zhongsoft:LightButtonField CommandName="DeleteData" DeleteText="您确认删除该校审意见吗？" HeaderText="删除">
                                                    </zhongsoft:LightButtonField>
                                                </Columns>
                                            </zhongsoft:LightPowerGridView>
                                        </ContentTemplate>
                                    </asp:UpdatePanel>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
            </tr>
        </table>
        <%--记录显示的li内容--%>
        <input type="hidden" id="hiShowDivId" runat="server" value="mapInfo" />
        <asp:Button ID="btnClickDivLabel" runat="server" Style="display: none" OnClick="btnClickDivLabel_Click" />
        <input runat="server" id="hiSignXml" type="hidden" />
        <asp:Button ID="btnPorductSelSignerRefresh" runat="server" Style="display: none"
            OnClick="btnPorductSelSignerRefresh_Click" />
        <input type="hidden" runat="server" id="hiSignerProductId" />
        <%--成品编辑会签人--%>
        <input type="hidden" runat="server" id="hiSignerXml" />
        <input runat="server" id="hiPressureName" type="hidden" value='压力管道' />
        <!-- 所属部门-->
        <input type="hidden" runat="server" id="hiBelongDeptID" />
    </div>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvProductList.CheckedClientID %>";
        function initCustomerPlugin() {
            initDivDetail($("#<%=hiShowDivId.ClientID %>").val());
            //隐藏查询区域
            $("#divToolBtn").hide();
            $('#templateTabs').tabs({ select: function (event, ui) { return checkTabs(ui); } });

            var type ='<%=Action %>';
            if (type == "3" || type == "2") {
                $("#liMap").show();
                $("#liText").show();

                $("#liSign").hide();//编辑，不显示会签信息
                $("#liOpinion").hide();
            }
            else if (type == "4") {
                $("#liMap").hide();
                $("#liText").hide();

                $("#liSign").hide();
                $("#liOpinion").show();
                showDetail("oppionInfo");
                //显示增加意见的说明信息
                //$('[flag="opinion"]').show();
            }
            else if (type == "5") {
                $("#liMap").hide();
                $("#liText").hide();

                $("#liSign").show();
                $("#liOpinion").hide();
                showDetail("signInfo");
            }
            //设置是否显示会签信息
            var isShowSign = parseBool("<%=IsShowSignInfo %>");
            if (!isShowSign)
                $("#liSign").hide();

            //设置是否显示会签信息
            var isShowPressure = parseBool("<%=IsShowPressureInfoInfo %>");
            if (isShowPressure)
                $("#trPressure").show();

            //对需要刷新的按钮注册返回值
            $('[flag="update"]').each(function () {
                $(this).bind('click', function () {
                    setReturnVal();
                });
            });
            $('[flag="hide"]').hide();

            //            window.onbeforeunload = onbeforeunload_handler;
            //            function onbeforeunload_handler() {
            //                if (window.event.keyCode != 13) {
            //                    var warning = "确定离开当前页面吗?";
            //                    confirm(warning);
            //                }
            //            }
        }

        function editFormView() {
        }

        //选择设计人的筛选
        function designerFilter() {
            var bizId = '<%=BizId %>';
            return { FlowName: 1, ShowMore: "true", BizId: bizId };
        }

        function selectSigner(productId, xmlStr) {
            $("#<%=hiSignerProductId.ClientID %>").val(productId);
            var json = { SelectFlag: '1', OrganizationID:'<%=OrganizationID %>' };
            var url = buildQueryUrl("EPMS/Obsolete/SignSpecSelector.aspx", json);
            showDivDialog(encodeURI(url), xmlStr, 850, 600, afterSelProductSigner);
            return false;
        }

        function afterSelProductSigner(re) {
            $("#<%=hiSignerXml.ClientID %>").val(re);
            <%=this.Page.ClientScript.GetPostBackEventReference(this.btnPorductSelSignerRefresh, "")%>;
            return false;
        }

        function showDetail(divId) {
            initDivDetail(divId);
            //在InitCustomerPlugin方法中调用后台，会导致重复不停调用在InitCustomerPlugin方法，导致页面控件不可操作
            //暂时去掉 tainhl 20150703
            //$("#<%=btnClickDivLabel.ClientID %>").click();
        }

        function initDivDetail(divId) {
            $("#" + divId).show();
            $("#<%=hiShowDivId.ClientID %>").val(divId);
            if ("mapInfo" == divId) {
                $("#textInfo").hide();
                $("#mapInfo").hide();
                $("#signInfo").hide();
                $("#oppionInfo").hide();
                $("#tdProduct").show();
                $("#tdText").hide();
                $("#productList").css("width", "99%");
                //$("#productDetail").css("width", "39%");
            }
            else if ("textInfo" == divId) {
                $("#textInfo").hide();
                $("#mapInfo").hide();
                $("#signInfo").hide();
                $("#oppionInfo").hide();
                $("#tdProduct").hide();
                $("#tdText").show();
                $("#productList").css("width", "99%");
                //$("#productDetail").css("width", "39%");
            }
            else if ("signInfo" == divId) {
                $("#mapInfo").hide();
                $("#textInfo").hide();
                $("#oppionInfo").hide();
                $("#tdText").hide();
                $("#productList").hide();
                //$("#productList").css("width", "40%");
                $("#productDetail").css("width", "99%");
            }
            else if ("oppionInfo" == divId) {
                $("#mapInfo").hide();
                $("#textInfo").hide();
                $("#signInfo").hide();
                $("#tdText").hide();
                $("#productList").css("width", "40%");
                $("#productDetail").css("width", "59%");
            }
        }

        //添加会签专业
        function addSignSpe() {
            var xml = $("#<%=hiSignXml.ClientID %>").val();
            var json = { SelectFlag: '1', OrganizationID:'<%=OrganizationID %>', CurSpeId:'<%=VerifyForm.BelongSpecialtyID %>' };
            var url = buildQueryUrl("EPMS/Obsolete/SignSpecSelector.aspx", json);
            showDivDialog(encodeURI(url), xml, 900, 600, afterAddSignSpe);
            return false;
        }

        function afterAddSignSpe(re) {
            $("#<%=hiSignXml.ClientID %>").val(re);
            if (re != null && re != 'saved') {
            <%=this.Page.ClientScript.GetPostBackEventReference(this.btnAddSignSpe, "")%>;
            }
            return false;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }

        //校核人筛选条件
        function getCheckerFilter() {
            return { DeptID: $('#<%=hiBelongDeptID.ClientID%>').val(), QualificationName: '校核' };
        }

    </script>
</asp:Content>
