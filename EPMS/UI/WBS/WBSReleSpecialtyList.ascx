<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSReleSpecialtyList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSReleSpecialtyList" %>
<span style="float: right;" id="spAddRelSpe">
<asp:LinkButton runat="server" ID="ibtnAddRelSpe" CssClass="subtoolbarlink" EnableTheming="false"
    OnClientClick="return false">
    <span>
        <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加专业" width="16"
            height="16" />添加专业</span></asp:LinkButton></span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="WBSID,ParamSpecialtyID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindSpecialtyList"
    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="专业代字">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbSpeCode"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="专业名称">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbSpeName"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="部门">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbDept"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                    CommandArgument='<%# Eval("ParamSpecialtyID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Button runat="server" ID="btnAddSpe" OnClick="btnAddSpe_Click" Visible="false" />
<script type="text/javascript">
    function initRelSpe() {
        $('#<%=ibtnAddRelSpe.ClientID %>').live('click', function () {
            batchAddRelSpe();
        });

        //隐藏添加专业操作
        if(!parseBool('<%=Enable %>')) {
            $('#spAddRelSpe').hide();
        }
    }

    //批量添加专业
    function batchAddRelSpe() {
        var param = new InputParamObject("m");
        var json = { WBSID: '<%=BizID %>', OrganizationID: '<% =OrganizationID%>' };
        getDivSpecialty("", param, json, addRelSpes);
        return false;
    }

    //执行后台添加专业数据
    function addRelSpes() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddSpe,"")%>;
    }
 
</script>
