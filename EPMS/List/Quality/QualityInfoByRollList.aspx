<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QualityInfoByRollList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityInfoByRollList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">部门</span> <span>
        <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">专业</span> <span>
        <zhongsoft:LightDropDownList ID="ddlSpecialty" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span><span class="filter-block"><span class="filter-block-lb">项目编号/名称</span>
        <span>
            <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
                EnableTheming="false"></asp:TextBox>
        </span></span><span class="filter-block"><span class="filter-block-lb">工程类型</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlProType" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">设计阶段</span> <span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlPhases" class="kpms-ddlsearch"
                EnableTheming="false">
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb"></span><span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlRQualityLevel" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">室评等级</asp:ListItem>
                <asp:ListItem Value="优等品">优等品</asp:ListItem>
                <asp:ListItem Value="良等品">良等品</asp:ListItem>
                <asp:ListItem Value="合格品">合格品</asp:ListItem>
                <asp:ListItem Value="不合格品">不合格品</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb"></span><span>
            <zhongsoft:LightDropDownList runat="server" ID="ddlYQualityLevel" class="kpms-ddlsearch"
                EnableTheming="false">
                <asp:ListItem Value="">院评等级</asp:ListItem>
                <asp:ListItem Value="优等品">优等品</asp:ListItem>
                <asp:ListItem Value="良等品">良等品</asp:ListItem>
                <asp:ListItem Value="合格品">合格品</asp:ListItem>
                <asp:ListItem Value="不合格品">不合格品</asp:ListItem>
            </zhongsoft:LightDropDownList>
        </span></span><span class="filter-block"><span class="filter-block-lb">时间</span><span>
            <asp:CheckBox ID="chbDate" CheckControls="tbAppraisalDateMin,tbAppraisalDataMax"
                runat="server" />
            <asp:TextBox ID="tbAppraisalDateMin" Condition="VerifyEndDate >= '{0}'" CssClass="textbox_cal2"
                runat="server"></asp:TextBox>
            到
            <asp:TextBox ID="tbAppraisalDataMax" Condition="VerifyEndDate <= '{0}'" CssClass="textbox_cal2"
                runat="server"></asp:TextBox>
        </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="15" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
        DataKeyNames="QualityID,QualityFeedBackID" UseDefaultDataSource="true" BindGridViewMethod="BindDataGrid"
        OnRowDataBound="gvList_RowDataBound" EmptyDataText="没有要查找的数据">
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectName" HeaderText="项目名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="卷册编号">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册名称">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="标准张合计">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualityTheme" HeaderText="原则性" ShowToolTip="true"
                HeaderStyle-Width="150px" MaxLength="13">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ProjectNature" HeaderText="技术性">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="一般性">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="QualityStateToList" HeaderText="一般性差错率">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="ApproveOpinion" HeaderText="室评" ShowToolTip="true"
                Width="150px" MaxLength="13">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WriteUserName" HeaderText="院评">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="利用质量&lt;br&gt;信息条数">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="活用图率%">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightButtonField HeaderText="查看流程" CommandName="viewData" CausesValidation="false"
                DataParamFields="QualityFeedBackID,IsOld" EditItemClick="viewFormDetail">
            </zhongsoft:LightButtonField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
      
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
