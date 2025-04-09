<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="ProjectTypeFinishValueSum.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.ProjectTypeFinishValueSum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>年份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBeginMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
        至<zhongsoft:LightDropDownList runat="server" ID="ddlEndMonth" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>工程类型</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlProjectType" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <div style="text-align: center; font-weight: bold; font-size: larger">
        <asp:Label runat="server" ID="lbTitle"></asp:Label>
    </div>
    <zhongsoft:LightPowerGridView Width="98%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        AllowFrozing="true" FrozenColNum="3" UseDefaultDataSource="true" BindGridViewMethod="BindData"
        EmptyDataText="没有数据" ShowEmptyDataHeader="false" OnRowCreated="gvList_RowCreated"
        OnRowDataBound="gvList_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="" HeaderText="序号" ItemStyle-HorizontalAlign="center">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="项目名称" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ATTRIBUTEVALUE" HeaderText="设计规模">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTCODE" HeaderText="合同号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTVALUE" HeaderText="预估合同额<br>(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="VALUE" HeaderText="合同额<br>(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactStartDate" HeaderText="开工日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactCompleteDate" HeaderText="完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SPLITITEMVALUE" HeaderText="类别">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PREVALUE" HeaderText="预估分项合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FACTVALUE" HeaderText="实际分项合同额<br/>(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastValue" HeaderText="产值(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="" HeaderText="%" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ThisValue" HeaderText="产值(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="" HeaderText="%" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TotalValue" HeaderText="产值(万元)" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="" HeaderText="%" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
