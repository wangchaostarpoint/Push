<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ComprehensiveRollRelRolls.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Product.ComprehensiveRollRelRolls" MasterPageFile="~/UI/Master/ObjectList.Master"
    Title="综合卷册关联卷册信息" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    卷册编号
    <%-- <asp:TextBox ID="tbRollCode" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            Enabled="false"></asp:TextBox>--%>
    <asp:Label runat="server" ID="lbRollCode" Style="font-weight: bold"></asp:Label>
    卷册名称
    <%--  <asp:TextBox ID="tbRollName" search="1" runat="server" MaxLength="64" CssClass="kpms-textboxsearch"
            Enabled="false"></asp:TextBox>--%>
    <asp:Label runat="server" ID="lbRollName"  Style="font-weight: bold"></asp:Label>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReleWBSList" AllowPaging="true"
        PageSize="50" ShowExport="true" AutoGenerateColumns="false" DataKeyNames="WBSID"
        UseDefaultDataSource="true" BindGridViewMethod="BindGrid" EmptyDataText="没有关联卷册/成品信息"
        OnRowDataBound="gvReleWBSList_RowDataBound" OnRowCommand="gvReleWBSList_RowCommand">
        <Columns>
            <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />
            <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" />
            <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人" />
            <zhongsoft:LightTemplateField HeaderText="校审信息" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" Visible="false">
                                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_detail.gif" />
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="修改状态">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbModifyInfo"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightButtonField HeaderText="发起成品设计修改流程" EditItemClick="checkCanStartModify"
                ImageUrl="../../../Themes/Images/ico_act_start.png" DataParamFields="ModifyInfo"
                CommandName="StartModifiedFlow" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script>

        //提示启动流程
        function checkCanStartModify(reworkState) {
            if (reworkState == "" || reworkState == "1") {
                return confirm("您确定给卷册负责人发起成品设计修改流程吗？");
            }
            else {
                alert("此卷册的成品设计修改流程还没有结束，不能再发起成品设计修改流程");
                return false;
            }
        }

        function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
