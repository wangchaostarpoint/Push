<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ProductList2.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ProductList2" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('productListDetail')">
                成品清单&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
            <td nowrap="nowrap">
                <div id="divCustomBar" style="float: left; padding-left: 0; padding-right: 0;" class="subtoolbarbg">
                    <asp:LinkButton runat="server" ID="lbtnUpdateProduct" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="批量更新" OnClientClick="return openUpdateProduct();">
                        <span>
                            <img runat="server" id="img7" src="~/Themes/Images/btn_editor.gif" alt="批量更新" width="16"
                                height="16" />批量更新</span>
                    </asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;&nbsp;
                    <zhongsoft:LightFileUploader runat="server" ID="btnNew" EnableTheming="false" CssClass="subtoolbarlink"
                        OnClick="btnNew_Click" BeforeUpload="productUpload">
                        <span>
                            <img  src="<%=WebAppPath%>/Themes/Images/btn_new.gif" title="上传文本类成品"  width="16"
                                height="16" />文本上传</span></zhongsoft:LightFileUploader>
                    <asp:LinkButton runat="server" ID="lbtnStartCAD" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="上传图纸类成品" OnClientClick="return StartCAD();">
                        <span>
                            <img runat="server" id="img4" src="~/Themes/Images/btn_new.gif" alt="选择/添加套用成品" width="16"
                                height="16" />图纸上传</span>
                    </asp:LinkButton>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton runat="server" ID="lbtnReuse" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="选择/添加套用成品" OnClientClick="return ProductReuseEdit(3);">
                        <span>
                            <img runat="server" id="img2" src="~/Themes/Images/btn_add.gif" alt="选择/添加套用成品" width="16"
                                height="16" />套用</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnEdit" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="编辑/修改成品基本信息、会签信息" OnClientClick="return ProductEdit(3);" Visible="false">
                        <span>
                            <img runat="server" id="imgOk" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />编辑</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSign" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="编辑/修改会签信息" OnClientClick="return ProductEdit(5);">
                        <span>
                            <img runat="server" id="img5" src="~/Themes/Images/btn_examine.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />会签</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnAddOppion" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="编辑/修改成品信息、会签、添加校审意见" OnClientClick="return ProductEdit(4);" Visible="false">
                        <span>
                            <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="编辑、修改成品信息、会签、添加校审意见"
                                width="16" height="16" />添加意见</span>
                    </asp:LinkButton>
                    <%-- <asp:LinkButton runat="server" ID="lbtnView" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return ProductEdit(1);" ToolTip="查看成品信息">
                        <span>
                            <img runat="server" id="imgCancel" src="~/Themes/Images/btn_chakan.gif" alt="查看成品信息"
                                width="16" height="16" />查看</span>
                    </asp:LinkButton>--%>
                    &nbsp;&nbsp;&nbsp;
                    <asp:LinkButton runat="server" ID="lbtnDownLoad" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="下载成品" OnClientClick="return downloadProduct('product');">
                        <span>
                            <img runat="server" id="img3" src="~/Themes/Images/ico_fujian.gif" alt="下载成品" width="16"
                                height="16" />下载成品</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnPDFDownload" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="下载PDF" OnClientClick="return downloadProduct('pdf');">
                        <span>
                            <img runat="server" id="img8" src="~/Themes/Images/ico_fujian.gif" alt="下载PDF" width="16"
                                height="16" />下载PDF</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbOffice2PDF" CssClass="subtoolbarlink" EnableTheming="false"
                        ToolTip="文本转PDF" OnClick="lbOffice2PDF_Click" Visible="false">
                        <span>
                            <img runat="server" id="img6" src="~/Themes/Images/ico_fujian.gif" alt="文本转PDF" width="16"
                                height="16" />文本转PDF</span>
                    </asp:LinkButton>
                    &nbsp;&nbsp;
                </div>
            </td>
            <td align="right">
                <div id="divSystemBar" class="subtoolbarbg" runat="server" style="float: right; padding-left: 0;
                    padding-right: 0;">
                    <asp:LinkButton runat="server" ID="lbtnAllNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnAllNum_Click">
                        <span>全部(<asp:Label ID="lbAllNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnNewNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnNewNum_Click">
                        <span>新制(<asp:Label ID="lbNew" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnReuseNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnReuseNum_Click">
                        <span>套用(<asp:Label ID="lbReuseNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSignNum" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClick="lbtnSignNum_Click" Visible="false">
                        <span>会签(<asp:Label ID="lbSignNum" runat="server"></asp:Label>)</span>
                    </asp:LinkButton>
                    &nbsp;&nbsp;
                    <asp:DropDownList ID="ddlWBS" runat="server" Width="150px" AutoPostBack="true" OnSelectedIndexChanged="ddlWBS_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>
            </td>
        </tr>
        <tr id="trOperator" runat="server">
            <td colspan="3">
                <span class="req-star">注意：可勾选需要更新的成品，点击【批量更新】按钮，针对校审审批人、成品类别进行批量统一更新；然后可针对单个成品进行调整；</span>
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%" id="productListDetail">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvProductList" AllowPaging="false"
                                PageSize="500" ShowExport="false" AutoGenerateColumns="false" AllowSorting="true"
                                DataKeyNames="ProductID,SignState,WBSID,ProductCode" UseDefaultDataSource="true"
                                BindGridViewMethod="BindGrid" EmptyDataText="没有成品信息" OnRowDataBound="gvProductList_RowDataBound"
                                OnRowCommand="gvProductList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="30px">
                                    </zhongsoft:LightCheckField>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号" Width="70px"
                                        SortExpression="ProductCode" />
                                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" Width="100px"
                                        DataParamFields="ProductID" DialogMode="Dialog" EditItemClick="viewItem" />
                                    <zhongsoft:LightBoundField DataField="ProductType" HeaderText="成品类别" SortExpression="ProductType" />
                                    <zhongsoft:LightBoundField DataField="FileFormat" HeaderText="格式" SortExpression="FileFormat"
                                        ItemStyle-Width="30px" Visible="false" />
                                    <zhongsoft:LightBoundField DataField="Mapsize" HeaderText="图幅" ItemStyle-Width="30px"
                                        Visible="false" />
                                    <zhongsoft:LightTemplateField HeaderText="设计人" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lbDesigners" runat="server"></asp:Label>--%>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtDesigners" IsMutiple="true"
                                                EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                DoCancel="false" ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                OnClick="txtUsers_Click" pid='<%#Eval("ProductID") %>' station='设计' ToolTip="选择设计人"
                                                title="选择设计人"></zhongsoft:LightObjectSelector>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="校核人" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lbCheckers" runat="server"></asp:Label>--%>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtCheckers" IsMutiple="true" EnableTheming="false"
                                                SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="false"
                                                ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" OnClick="txtUsers_Click"
                                                pid='<%#Eval("ProductID") %>' station='校核' ToolTip="选择校核人" title="选择校核人"></zhongsoft:LightObjectSelector>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="审核人" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lbAuditors" runat="server"></asp:Label>--%>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtAuditors" IsMutiple="true" EnableTheming="false"
                                                SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog" DoCancel="false"
                                                ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" OnClick="txtUsers_Click"
                                                pid='<%#Eval("ProductID") %>' station='审核1' ToolTip="选择审核人" title="选择审核人"></zhongsoft:LightObjectSelector>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="审核人2" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%--<asp:Label ID="lbAuditors2" runat="server"></asp:Label>--%>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtAuditors2" IsMutiple="true"
                                                Width="70px" EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true"
                                                SelectPageMode="Dialog" DoCancel="false" ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                OnClick="txtUsers_Click" pid='<%#Eval("ProductID") %>' station='审核2' ToolTip="选择审核人"
                                                title="选择审核人"></zhongsoft:LightObjectSelector>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="批准人" ItemStyle-Width="70px">
                                        <ItemTemplate>
                                            <%-- <asp:Label ID="lbApprovers" runat="server"></asp:Label>--%>
                                            <zhongsoft:LightObjectSelector runat="server" ID="txtApprovers" IsMutiple="true"
                                                EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                                                DoCancel="false" ResultAttr="name" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"
                                                OnClick="txtUsers_Click" pid='<%#Eval("ProductID") %>' station='批准' ToolTip="选择批准人"
                                                title="选择批准人"></zhongsoft:LightObjectSelector>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="会签" Visible="false">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSignInfo" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="图章" ItemStyle-Width="100px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbTZ" runat="server" Checked="true" />
                                            <asp:DropDownList ID="ddlTZ" runat="server" Width="75px">
                                                <asp:ListItem Text="竣工图章" Value="1" Selected="True"></asp:ListItem>
                                            </asp:DropDownList>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="电子签名" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:CheckBox ID="cbQZ" runat="server" Checked="true" />
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="下载成品" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnProductDownload" EnableTheming="false" ToolTip="下载成品">
                                                <img alt="下载成品" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/ico_fujian.gif" 
                                                onclick="return downloadFile('<%#Eval("ProductID")%>','product')" /> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="PDF" ItemStyle-Width="30px">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnPDFView" EnableTheming="false" ToolTip="预览PDF">
                                                <img alt="预览PDF" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" />
                                            </asp:LinkButton>
                                            <asp:LinkButton runat="server" ID="ibtnPDFDownload" EnableTheming="false" ToolTip="下载PDF">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/ico_fujian.gif" 
                                                onclick="return downloadFile('<%#Eval("ProductID")%>','pdf')" /> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="版本" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnViewVersion" EnableTheming="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return viewVersions('<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="签署页" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="ibtnSignPage" EnableTheming="false">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return viewSignPage('<%#Eval("ProductID")%>');" />
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                                        ItemStyle-Width="35px" Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="btnProductView" EnableTheming="false" ToolTip="查看">
                                                <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                                onclick="return showProductDetail('1','<%#Eval("ProductID")%>');" /> 
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <asp:TemplateField HeaderText="删除" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center"
                                        Visible="false">
                                        <ItemTemplate>
                                            <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" ToolTip="删除" CommandName="del"
                                                CommandArgument='<%# Eval("ProductID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=this.WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                                            </asp:LinkButton>
                                        </ItemTemplate>
                                    </asp:TemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr flag="sign">
            <td class="flexible" onclick="openDetail('signProduct')" colspan="3" align="center">
                会签成品&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr flag="sign">
            <td colspan="3">
                <table width="100%" id="signProduct">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView ID="gvSignList" runat="server" AllowSorting="true"
                                AutoGenerateColumns="false" BindGridViewMethod="BindSignGrid" DataKeyNames="ProductID"
                                EmptyDataText="没有会签信息" PageSize="20" UseDefaultDataSource="true" Width="100%"
                                AllowPaging="false" OnRowDataBound="gvSignList_RowDataBound" ShowHeader="false">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="20px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号" ItemStyle-Width="80px" />
                                    <zhongsoft:LightBoundField DataField="ProductName" HeaderText="成品名称" ItemStyle-Width="120px" />
                                    <zhongsoft:LightTemplateField HeaderText="会签信息" ItemStyle-Width="300px">
                                        <ItemTemplate>
                                            <asp:Label ID="lbSignInfo" runat="server" Width="85%"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<div>
    <object id="CADActive" visible="false" classid="clsid:F4B25887-127F-46A9-BF75-30332B826B51">
    </object>
</div>
<%--批量更新成品内容--%>
<table id="divUpdateProduct" style="display: none;">
    <tr>
        <td colspan="3">
            <table class="tz-table" width="100%" style="text-align: center;">
                <tr>
                    <td class="td-l" style="width: 80px;">
                        批准
                    </td>
                    <td class="td-l" style="width: 180px;">
                        <zhongsoft:LightObjectSelector runat="server" ID="tbApproverName2" IsMutiple="true"
                            EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                            DoCancel="true" ResultAttr="name" ResultForControls="{'hiApproverId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiApproverId" />
                    </td>
                    <td class="td-l" style="width: 80px;">
                        设计
                    </td>
                    <td class="td-l" style="width: 180px;">
                        <zhongsoft:LightObjectSelector runat="server" ID="tbDesignerName" IsMutiple="true"
                            EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                            DoCancel="true" ResultAttr="name" ResultForControls="{'hiDesignerId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiDesignerId" />
                    </td>
                </tr>
                <tr>
                    <td rowspan="2" class="td-l">
                        审核
                    </td>
                    <td class="td-l">
                        <zhongsoft:LightObjectSelector runat="server" ID="tbAuditorName" IsMutiple="true"
                            EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                            DoCancel="true" ResultAttr="name" ResultForControls="{'hiAuditorId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiAuditorId" />
                    </td>
                    <td class="td-l">
                        成品类别
                    </td>
                    <td class="td-l">
                        <asp:DropDownList ID="ddlProductType" runat="server">
                        </asp:DropDownList>
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        <zhongsoft:LightObjectSelector runat="server" ID="tbAuditorName2" IsMutiple="true"
                            EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                            DoCancel="true" ResultAttr="name" ResultForControls="{'hiAuditorId2':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiAuditorId2" />
                    </td>
                    <td class="td-l" colspan="2">
                    </td>
                </tr>
                <tr>
                    <td class="td-l">
                        校核
                    </td>
                    <td class="td-l">
                        <zhongsoft:LightObjectSelector runat="server" ID="tbCheckerName" IsMutiple="true"
                            EnableTheming="false" SourceMode="SelectorPage" ShowJsonRowColName="true" SelectPageMode="Dialog"
                            DoCancel="true" ResultAttr="name" ResultForControls="{'hiCheckerId':'id'}" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                        </zhongsoft:LightObjectSelector>
                        <input type="hidden" runat="server" id="hiCheckerId" />
                    </td>
                    <td class="td-l" colspan="2">
                        <asp:Button ID="btnBatchUpdate" runat="server" flag="update" Style="display: none"
                            Text="批量更新" OnClick="btnBatchUpdate_Click" />
                    </td>
                </tr>
                <tr style="display: none;">
                    <td colspan="2" class="td-l" style="text-align: center">
                        成品类别
                    </td>
                    <td colspan="2" class="td-l" style="text-align: center">
                        设计人
                    </td>
                    <td colspan="2" class="td-l" style="text-align: center">
                        校核人
                    </td>
                    <td colspan="2" class="td-l" style="text-align: center">
                        审核人
                    </td>
                    <td colspan="2" class="td-l" style="text-align: center">
                        审核人2(设总或总工)
                    </td>
                    <td colspan="2" class="td-l" style="text-align: center">
                        批准人
                    </td>
                </tr>
                <tr style="display: none;">
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                    <td class="td-l">
                    </td>
                    <td class="td-l" style="width: 40px;">
                    </td>
                </tr>
            </table>
        </td>
    </tr>
</table>
<asp:Button ID="btnProductRefresh" runat="server" content="Refresh" Style="display: none"
    OnClick="btnProductRefresh_Click" />
<input type="hidden" runat="server" id="hiSignNum" value="0" />
<input type="hidden" runat="server" id="hiIsAddedSigner" />
<%--校审流程主卷册ID--%>
<input type="hidden" runat="server" id="hidWBSID" />
<input type="hidden" runat="server" id="hiWBSCode" />
<input type="hidden" runat="server" id="hiWBSName" />
<style type="text/css">
    .backpanel-inner
    {
        position: fixed;
        z-index: 1001;
        margin-left: 10px;
        left: 5%;
        bottom: 60%;
        padding-bottom: 10px;
    }
    .backpanel-inner td
    {
        height: 20px;
        background-color: Silver;
    }
</style>
<script type="text/javascript">
    //在校审流程默认加载的时候，自动执行；
    function initProductList() {
        var signNum = $('#<%=hiSignNum.ClientID %>').val();
        //没有会签成品的时候，隐藏会签成品列表
        if (signNum == '0') {
            $('[flag="sign"]').hide();
        }

        //初始化更新按钮信息；
        initUpdate();
    }

    //查看、编辑套用成品
    function ProductReuseEdit(action) {
        //先判断流程是否保存
        if ("<%=ActionType %>" == "2") {
            alert("请先暂存表单再上传成品！");
            return false;
        }

        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        var bizId = '<%=BizId %>';
        if (wbsId == "") {
            alert("请您在右侧选择上传的任务！");
            return false;
        }
        else {
            var json = { actionType: action, bizId: '<%=BizId %>', wbsId: wbsId, action: action };
            var url = buildQueryUrl('EPMS/List/Product/ProductReuseEditor.aspx', json);
            showDivDialog(url, null, 1000, 600, afterOpenProduct);
            return false;
        }
    }


    //查看、编辑成品
    function ProductEdit(actionType) {
        //先判断流程是否保存
        if ("<%=ActionType %>" == "2") {
            alert("请先暂存表单再上传成品！");
            return false;
        }

        var action = actionType;
        if (action == "") {
            action = 1;
        }
        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        var json = { actionType: actionType, bizId: '<%=BizId %>', wbsId: wbsId, action: action };
        // var url = buildQueryUrl('EPMS/List/Product/ProductEditor.aspx', json);
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailEditor2.aspx', json);
        showDivDialog(url, null, 1000, 600, afterOpenProduct);
        return false;
    }

    //    function ProductAddEdit(actionType) {
    //        var action = '<%=Action %>';
    //        if (!(action == 2 || action == 3)) {
    //            action = 1;
    //        }
    //        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
    //        var json = { actionType: actionType, bizId: '<%=BizId %>', wbsId: wbsId, action: action };
    //        var url = buildQueryUrl('EPMS/List/Product/ProductOppinionDetailEditor.aspx', json);
    //        showDivDialog(url, null, 1050, 600, afterOpenProduct);
    //        return false;
    //    }
    function afterOpenProduct() {
        $("#<%=btnProductRefresh.ClientID %>").click();
    }
    //上传成品
    function productUpload() {
        if ("<%=ActionType %>" == "2") {
            alert("请先暂存表单再上传成品！");
            return false;
        }

        var wbsId = $('select#<%=ddlWBS.ClientID %> option:selected').val();
        if (wbsId == "") {
            alert("请您在右侧选择上传的任务！");
            return false;
        }

        return true;
    }
    ///批量下载成品
    function downloadProduct(type) {
        var wbsIds = '<%=WBSIds %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=" + type + "&wbsIds=" + wbsIds + "&rollIds=" + wbsIds;
        showDivDialog(urlStr, null, 750, 550);
        return false;
    }
    //单个下载成品
    function downloadFile(fileid, type) {
        var url = "<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileId=" + fileid + "&FileType=product&docType=" + type;
        open(url);
        return false;
    }

    //图纸上传按钮操作
    function StartCAD() {
        //先判断是否流程保存
        if ("<%=ActionType %>" == "2") {
            alert("请先暂存表单再上传成品！");
            return false;
        }

        var orgId = '<%=OrgId %>';
        var wbsId = '<%=WBSID %>';
        if (orgId == "") {
            alert("-请先选择项目");
        }
        else {
            var url = "/Portal/EPMS/List/Product/ProductCADStart.aspx?OrganizationId=" + orgId + "&WBSID=" + wbsId;
            window.open(url);
        }
    }

    function showProductDetail(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('EPMS/List/Product/ProductDetailView.aspx', json);
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }

    function viewItem(productId) {
        return showProductDetail('1', productId);
    }

    //查看版本
    function viewVersions(productId) {
        var json = { ProductId: productId };
        var url = buildQueryUrl('EPMS/List/Product/ProductVersionList.aspx', json);
        showDivDialog(url, null, 1000, 600, null);
        return false;
    }

    //签署页
    function viewSignPage(productId) {
        var json = { ProductId: productId };
        var url = buildQueryUrl('EPMS/List/Product/SignPage.aspx', json);
        window.open(url);
        return false;
    }

    function isAddedSigner() {
        var isAdd = $('#<%=hiIsAddedSigner.ClientID %>').val();
        if (isAdd == 'false') {
            alert("还有会签专业尚未添加会签人，请添加！")
            return false;
        }
        return true;
    }

    //选择设计人的筛选
    function designerFilter() {
        var bizId = '<%=BizId %>';
        return { FlowName: 1, ShowMore: "true", BizId: bizId };
    }

    //打开批量更新成品的页面
    function openUpdateProduct() {
        //        if (!checkSpe(speId)) {
        //            return false;
        //        }

        //先判断是否流程保存
        if ("<%=ActionType %>" == "2") {
            alert("请先选择要更新的成品！");
            return false;
        }

        $("#divUpdateProduct").dialog('open');
        $("#divUpdateProduct").parent().appendTo("#<%=this.Page.Form.ClientID%>");

        return false;
    }

    //初始化批量更新按钮
    function initUpdate() {
        var width = 600;
        var height = 400;
        $("#divUpdateProduct :ui-dialog").dialog("destroy");
        $("#divUpdateProduct").dialog({
            title: "批量更新",
            resizable: true,
            autoOpen: false,
            minHeight: height,
            minWidth: width,
            modal: true,
            buttons: {
                "更新": function () {
                    $("#<%=btnBatchUpdate.ClientID %>").click();
                },
                "关闭": function () {
                    $(this).dialog("close");
                }
            }
        });
    }

    //设置页面返回值，编辑后刷新父级页面
    function setReturnVal() {
        parent.returnValue = "saved";
    }

    //在线预览
    function onlineView(filePath, fileName, fileId) {
        if (filePath.length > 0 && fileName.length > 0) {
            var url = "";
            url = "<%=WebAppPath %>" + "/Sys/FileView/FileViewOnline.aspx?filePath=" + filePath + "&fileName=" + fileName + "&fileId=" + fileId + "&IsNewView=1";
            window.open(encodeURI(url), '_blank');
        }
        return false;
    }

</script>
