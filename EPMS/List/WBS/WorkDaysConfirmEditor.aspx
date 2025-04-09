<%@ Page Title="维护卷册定额工日" Language="C#" AutoEventWireup="true" CodeBehind="WorkDaysConfirmEditor.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.WBS.WorkDaysConfirmEditor" MasterPageFile="~/UI/Master/ObjectEditor.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                项目编号
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtProjectCode" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目名称
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText ID="txtProjectName" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                专业名称
            </td>
            <td class="td-r" colspan="5">
                <zhongsoft:XHtmlInputText ID="txtSpecialty" runat="server" activestatus="(23.*)"
                    class="kpms-textbox" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计备用工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSJBYGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                标书编制备用工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBSBZBYGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                勘测备用工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtKCBYGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                设计总工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbSJZGR" runat="server" activestatus="(23.*)" DataType="Money"
                    errmsg="请输入正数，最多包含2位小数" CssClass="kpms-textbox-money" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                标书编制总工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbBSBZZGR" runat="server" activestatus="(23.*)" DataType="Money"
                    CssClass="kpms-textbox-money" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                勘测总工日
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox ID="tbKCZGR" runat="server" activestatus="(23.*)" DataType="Money"
                    CssClass="kpms-textbox-money" EnableTheming="false">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                项目分配设计总工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtSJZGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目分配标书编制总工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtBSBZZGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
            <td class="td-l">
                项目分配勘测总工日
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtKCZGR" runat="server" activestatus="(23.*)" class="kpms-textbox-money"
                    readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6" align="right">
                <table>
                    <tr>
                        <td>
                            卷册编号/名称
                        </td>
                        <td> 
                            <zhongsoft:LightTextBox ID="tbWBSCodeOrName" runat="server" CssClass="kpms-textboxsearch" EnableTheming="false">
                            </zhongsoft:LightTextBox>
                        </td>
                        <td>
                            <asp:LinkButton ID="lkbSelect" runat="server" EnableTheming="false" Text="查找" OnClick="lkbSelect_Click">
                            </asp:LinkButton>
                            <asp:LinkButton ID="lkbReSet" runat="server" EnableTheming="false" Text="重置" OnClick="lkbReSet_Click">
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
                    AllowSorting="true" DataKeyNames="WBSID" UseDefaultDataSource="false" AllowPaging="false"
                    ShowExport="true" ShowPageSizeChange="false" OnRowDataBound="gvList_RowDataBound"
                    OnRowCommand="gvList_RowCommand" ShowFooter="true"  PageSize="500">
                    <Columns>
                        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号">
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="卷册名称">
                            <ItemTemplate>
                                <%#Eval("WBSName") %>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="卷册类型">
                            <ItemTemplate>
                                <asp:Label ID="lbRollType" runat="server" Text='<%#Eval("RollType") %>'></asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业名称">
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightBoundField DataField="BelongDeptName" HeaderText="所属部室">
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="主设人">
                            <ItemTemplate>
                                <%=PutUserName%>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField DataField="WBSState" HeaderText="卷册状态">
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightBoundField>
                        <zhongsoft:LightTemplateField HeaderText="专业分配工日">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbSpecialtySetWorkDay" runat="server" Text='<%#Eval("SpecWorkDayOfConfirm") %>'
                                    DataType="Money" CssClass="kpms-textbox-money" EnableTheming="false">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="折算分配工日">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbWorkDayOfDesign" runat="server" Text='<%#Eval("WorkDayOfConfirm") %>'
                                    ReadOnly="true" CssClass="kpms-textbox-money" EnableTheming="false">
                                </zhongsoft:LightTextBox>
                            </ItemTemplate>
                            <ItemStyle Width="100px" />
                        </zhongsoft:LightTemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <script type="text/javascript">

    </script>
</asp:Content>
