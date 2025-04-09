<%@ Page Title="" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true"
    CodeBehind="DeptProjectValueSum.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Cost.DeptProjectValueSum" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>年份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlYear">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>月份</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlBeginMonth" Width="50px">
        </zhongsoft:LightDropDownList>
        至<zhongsoft:LightDropDownList runat="server" ID="ddlEndMonth" Width="50px">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>部门</span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlDept">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="98%" runat="server" ID="gvList" AllowPaging="false"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="false"
        AllowFrozing="true" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindData"
        EmptyDataText="没有数据">
        <Columns>
            <%--<zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" Visible="false">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>--%>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTCODE" HeaderText="工程编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="项目名称" MaxLength="15">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="" HeaderText="设计规模">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTACTID" HeaderText="合同号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="CONTRACTVALUE" HeaderText="预估合同额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="FactContractValue" HeaderText="合同额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="PhaseName" HeaderText="设计阶段">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="阶段项目编号">
            </zhongsoft:LightBoundField>
            
            <zhongsoft:LightBoundField DataField="PhaseValue" HeaderText="分项合同额" ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastValue" HeaderText="上期末累计<br>完成产值" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="LastSpare" HeaderText="上期末累<br>计完成%" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ThisValue" HeaderText="本期完成<br>产值" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ThisSpare" HeaderText="本期完成%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TotalValue" HeaderText="本期末累计<br>完成产值" HtmlEncode="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="TotalSpare" HeaderText="本期末累<br>计完成%" HtmlEncode="false">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
