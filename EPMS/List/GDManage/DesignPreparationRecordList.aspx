<%@ Page Title="设计交底准备记录台帐" Language="C#" MasterPageFile="~/UI/Master/ObjectList.Master" AutoEventWireup="true" CodeBehind="DesignPreparationRecordList.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.GDManage.DesignPreparationRecordList" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="lbtnNew" runat="server" EnableTheming="false" CssClass="subtoolbarlink" OnClientClick="return startWF();">
        <span>
            <img runat="server" id="img1" src="~/Themes/Images/btn_new.gif" alt="发起流程" height="16" />发起流程</span>
    </asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBar" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="advSearch" runat="server">
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
                                  ShowExport="true" AllowPaging="true" PageSize="15" UseDefaultDataSource="true"
                                  AllowSorting="true" BindGridViewMethod="BindData"
                                  DataKeyNames="DesignPreparationRecordID">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="30px">
                <ItemTemplate>
                    <%#Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnViewForm" runat="server" EnableTheming="false" OnClientClick="return false">
                        <img alt="img" src="../../../Themes/Images/btn_dg_view.gif"  title="查看流程信息"
                             onclick="viewWF('<%# Eval("DesignPreparationRecordID") %>','');"/>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="项目名称" DataField="ProjectName" Width="150px" ShowToolTip="True"/>
            <zhongsoft:LightBoundField HeaderText="项目编号" DataField="ProjectCode" />
            <zhongsoft:LightBoundField HeaderText="填写人" DataField="WriteUserName" />
            <zhongsoft:LightBoundField HeaderText="预计交底时间" DataField="ExpectedTime" DataFormatString="{0:yyyy-MM-dd}" />
            <zhongsoft:LightBoundField HeaderText="专工" DataField="ZGUserName" Width="150px" ShowToolTip="True"/>
            <zhongsoft:LightBoundField HeaderText="主要交底内容" DataField="MainContent" Width="450px" ShowToolTip="True" />
            <zhongsoft:LightBoundField HeaderText="批准日期" DataField="ApproveDate" DataFormatString="{0:yyyy-MM-dd}" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        //查看流程信息
        function viewWF(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }

        //发起流程
        function startWF() {
            var organizationid = '<%=OrganizationID%>';
            var url = buildQueryUrl("/Sys/Workflow/FormDetail.aspx", {
                actionType: 2, packageName: 'EPMSDesignPreparationRecord.xpdl', xpdlId: 'EPMSDesignPreparationRecord_wp1', formId: 442, ver:
                    '|', organizationID: organizationid
            });
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
