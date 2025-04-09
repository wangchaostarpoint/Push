<%@ Page Language="C#" AutoEventWireup="true" Title="个人工作查询" MasterPageFile="~/UI/Master/ObjectList.Master"
    CodeBehind="WorkQueryStatByPerson.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.ProduceSta.WorkQueryStatByPerson" %>

<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span>工作状态 </span><span>
        <zhongsoft:LightDropDownList runat="server" ID="ddlWorkState">
            <asp:ListItem Value="">请选择</asp:ListItem>
            <asp:ListItem Value="计划">计划</asp:ListItem>
            <asp:ListItem Value="实际">实际</asp:ListItem>
            <asp:ListItem Value="进行中">进行中</asp:ListItem>
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span>人员姓名 </span><span>
        <zhongsoft:LightObjectSelector runat="server" ID="txtUser" SourceMode="SelectorPage"
            IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
            EnableTheming="false" SelectPageMode="Dialog" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx"
            PageWidth="850" ResultForControls="{'hiUserID':'LoginId'}"></zhongsoft:LightObjectSelector>
        <input type="hidden" runat="server" id="hiUserID" />
    </span></span><span class="filter-block"><span>时间
        <asp:CheckBox runat="server" ID="cbTime" />
    </span><span>
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtTimeStart" runat="server"
            readonly="readonly" compare="1" />
        到
        <zhongsoft:XHtmlInputText class="kpms-textbox-comparedate" ID="txtTimeEnd" runat="server"
            readonly="readonly" compare="1" />
    </span></span>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" UseDefaultDataSource="true"
        BindGridViewMethod="BindGrid" OnRowDataBound="gvList_RowDataBound" ShowFooter="true">
        <FooterStyle ForeColor="Red" HorizontalAlign="Right" />
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="项目编号" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="项目名称" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="卷册编号" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="卷册名称" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="岗位" HeaderText="岗位">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="定额工日" HeaderText="定额工日" DataFormatString="{0:F2}"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="进展情况" HeaderText="进展情况" DataFormatString="{0:P2}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="剩余工作量" HeaderText="剩余工作量" DataFormatString="{0:F2}"
                ItemStyle-HorizontalAlign="Right">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="计划完成日期" HeaderText="计划完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="实际完成日期" HeaderText="实际完成日期" DataFormatString="{0:yyyy-MM-dd}">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
