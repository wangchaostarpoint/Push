<%@ Page Title="前期项目工作任务分解" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master"
    AutoEventWireup="true" CodeBehind="WorkBreakdownList.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.WorkBreakdownList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <span class="filter-block"><span class="filter-block-lb">市场项目编号/名称</span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="losMarketProjectInfo" IsMutiple="false"
            PageWidth="850" SelectPageMode="Dialog" EnableTheming="false" Text="选择市场项目" PageUrl="../../Obsolete/MarketProjectSelector.aspx"
            OnClick="selMarketProjectChange" ShowJsonRowColName="true" ResultAttr="name"
            ResultForControls="{'hiMarketProjectID':'id'}"></zhongsoft:LightObjectSelector>
    </span></span>
    <input type="hidden" id="hiMarketProjectID" runat="server" />
    <span style="float: right" runat="server" id="spanImport">
        <asp:FileUpload ID="importFile" runat="server" />
        <asp:LinkButton runat="server" ID="lbtnImport" OnClick="btnImport_Click">
        <span>导入Excel</span>
        </asp:LinkButton>
        <a class="btn-link" href="javascript:download();"><span>下载模板</span></a>
        <asp:LinkButton runat="server" ID="lbtnSave" EnableTheming="false" CssClass="btn-query"
            OnClick="lbtnSave_Click">
            <span>
                <img alt="" runat="server" id="imgSave" src="../../../Themes/Images/btn_save.gif"
                    height="16" />保存 </span>
        </asp:LinkButton>
    </span>
    <script type="text/javascript">
        function download() {
            window.open("<%=WebAppPath%>/Sys/Download/EPMS/前期工作任务分解表及台账模板.xls");
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:TreeGridView ID="gvList" runat="server" AutoGenerateColumns="false" ShowExport="true"
        AllowPaging="true" PageSize="100" UseDefaultDataSource="true" ShowPageSizeChange="true"
        OnRowDataBound="gvList_RowDataBound" SelfIdColumn="ParamWorkDetailsID" ParentIdColumn="ParentId"
        BindGridViewMethod="BindDataGrid" DataKeyNames="ProjectWorkDetailID" EmptyDataText="请先选择项目" 
        AllowFrozing="true" FrozenRowNum="1" FrozenHeight="450px">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="20px">
                <ItemTemplate>
                    <%# gvList.CreateHeader(Container.DataItem)%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="工作名称" DataField="WorkName" HtmlEncode="false"
                ItemStyle-Width="12%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="工作内容" DataField="WorkContent" ShowToolTip="true"
                ItemStyle-Width="10%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="审批部门" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbDept" EnableTheming="false" CssClass="kpms-textbox"
                        Text='<%#Eval("ApprovalDepartment") %>'>
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="合同签订</br>情况" ItemStyle-Width="6%">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbContractSigning" RepeatDirection="Vertical">
                        <asp:ListItem Value="0">未签</asp:ListItem>
                        <asp:ListItem Value="1">已签</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="是否外委" ItemStyle-Width="6%">
                <ItemTemplate>
                    <asp:RadioButtonList runat="server" ID="rbExternallyDelegated" RepeatDirection="Vertical">
                        <asp:ListItem Value="0">否</asp:ListItem>
                        <asp:ListItem Value="1">是</asp:ListItem>
                    </asp:RadioButtonList>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="任务下达/</br>外委时间" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText ID="xhitWorkDate" runat="server" readonly="readonly" class="kpms-textbox-date"
                        value='<%#Eval("TaskingTime","{0:yyyy-MM-dd}") %>'>
                    </zhongsoft:XHtmlInputText>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="承担部门/</br>单位" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbUndertakeDept" EnableTheming="false"
                        CssClass="kpms-textbox" Text='<%#Eval("UndertakeDepartment") %>'>
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="联系人" ItemStyle-Width="5%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbUndertaker" EnableTheming="false" CssClass="kpms-textbox"
                        Text='<%#Eval("Undertaker") %>'>
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="电话" ItemStyle-Width="9%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbUndertakerTel" EnableTheming="false"
                        CssClass="kpms-textbox" Text='<%#Eval("UndertakerTel") %>'>
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="计划完成</br>时间" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText ID="xhitPlanEndDate1" runat="server" readonly="readonly"
                        class="kpms-textbox-date" value='<%#Eval("PlanEndTime1","{0:yyyy-MM-dd}") %>'>
                    </zhongsoft:XHtmlInputText>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightTemplateField HeaderText="计划完成</br>时间2" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText ID="xhitPlanEndDate2" runat="server" readonly="readonly"
                        class="kpms-textbox-date" value='<%#Eval("PlanEndTime2","{0:yyyy-MM-dd}") %>'>
                    </zhongsoft:XHtmlInputText>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightTemplateField HeaderText="实际完成</br>时间" ItemStyle-Width="6%">
                <ItemTemplate>
                    <zhongsoft:XHtmlInputText ID="xhitRealEndDate" runat="server" readonly="readonly"
                        class="kpms-textbox-date" value='<%#Eval("RealEndTime","{0:yyyy-MM-dd}") %>'>
                    </zhongsoft:XHtmlInputText>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="提前或滞后天数" DataField="AdvanceOrLagDay" ItemStyle-Width="8%" />
            <zhongsoft:LightTemplateField HeaderText="进展情况及</br>存在问题" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbProgressProblems" EnableTheming="false"
                        CssClass="kpms-textarea this-textarea" Text='<%#Eval("ProgressProblems") %>' TextMode="MultiLine">
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="备注" ItemStyle-Width="8%">
                <ItemTemplate>
                    <zhongsoft:LightTextBox runat="server" ID="ltbMemo" EnableTheming="false" CssClass="kpms-textarea"
                        Text='<%#Eval("Memo") %>' TextMode="MultiLine">
                    </zhongsoft:LightTextBox>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:TreeGridView>
    <style type="text/css">
        .this-textarea {
            white-space: normal;
        }
    </style>
</asp:Content>
