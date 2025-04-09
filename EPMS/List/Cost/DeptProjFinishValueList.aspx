<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="DeptProjFinishValueList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.DeptProjFinishValueList" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>年份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>起始月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBeginMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>结束月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlEndMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>事业部</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="9" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        DataKeyNames="MARKETPROJECTID" AllowFrozing="true" UseDefaultDataSource="false"
        FrozenColNum="3" BindGridViewMethod="BindData" EmptyDataText="没有数据" OnRowCreated="gvList_RowCreated"
        OnRowDataBound="gvList_RowDataBound" ShowEmptyDataHeader="false">
        <Columns>
            <zhongsoft:LightBoundField DataField="" HeaderText="序号" ItemStyle-HorizontalAlign="center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="项目名称" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="设计规模">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiMarketProjID" value='<%# DataBinder.Eval(Container.DataItem, "MARKETPROJECTID") %>' />
                    <asp:Label ID="lbProjScale" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="预估总合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbPreContractTotalValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实际总合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbFactContractTotalValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="设计阶段">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiPhaseID" value='<%# DataBinder.Eval(Container.DataItem, "PHASEID") %>' />
                    <asp:Label ID="lbPhaseName" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "PhaseName") %>'></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="类别">
                <ItemTemplate>
                    <asp:Label ID="lbType" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="预估分项合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbPreConSplitValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="实际分项合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbFactConSplitValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="部门占比(%)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbDeptRatio" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="部门合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbDeptValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="产值" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbLastValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="%" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbLastRatio" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="产值" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbThisValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="%" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbThisRatio" runat="server" ItemStyle-HorizontalAlign="Right"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="产值" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbThisTotalValue" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="%" ItemStyle-HorizontalAlign="Right">
                <ItemTemplate>
                    <asp:Label ID="lbThisTotalRatio" runat="server"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <%--<zhongsoft:LightBoundField DataField="PROJECTSCALE" HeaderText="设计规模">
            </zhongsoft:LightBoundField>--%>
            <%--<zhongsoft:LightBoundField DataField="PRECONTRACTTOTALVALUE" HeaderText="预估总合同额(万元)">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FACTCONTRACTTOTALVALUE" HeaderText="实际总合同额(万元)">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PHASENAME" HeaderText="设计阶段">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TYPE" HeaderText="类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PRECONSPLITVALUE" HeaderText="预估分项合同额(万元)"
                ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FACTCONSPLITVALUE" HeaderText="实际分项合同额(万元)"
                ItemStyle-HorizontalAlign="Right" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DEPTRATIO" HeaderText="部门占比(%)">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="DEPTVALUE" HeaderText="部门合同额(万元)">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LASTVALUE" HeaderText="产值">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LASTRATIO" HeaderText="%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="THISVALUE" HeaderText="产值">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="THISRATIO" HeaderText="%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="THISTOTALVALUE" HeaderText="产值">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="THISTOTALRATIO" HeaderText="%">
            </zhongsoft:LightBoundField>--%>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
