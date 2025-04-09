<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSPartakerList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSPartakerList" %>
<span style="float: right;" id="spAdd">
    <asp:LinkButton runat="server" ID="ibtnAdd" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
        <span>
            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加参与人" width="16"
                height="16" />添加参与人</span>
    </asp:LinkButton></span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="WBSPartakerID" UseDefaultDataSource="true" BindGridViewMethod="BindPartakerList"
    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            HeaderStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField HeaderText="参与人" DataField="PartakerUserName">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="工作内容" DataField="WorkContent">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField HeaderText="工作比例" DataField="WorkRate" ItemStyle-HorizontalAlign="Right"
            DataFormatString="{0:F2}%">
        </zhongsoft:LightBoundField>
        <asp:TemplateField HeaderText="查看" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnView" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_view.gif" 
                                    onclick="viewPartakerItem('1','<%# Eval("WBSPartakerID") %>');"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="../../Themes/Images/btn_dg_edit.gif" 
                                    onclick="viewPartakerItem('3','<%# Eval("WBSPartakerID") %>');"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                    CommandArgument='<%# Eval("WBSPartakerID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="../../Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Button runat="server" ID="btnBindUser" OnClick="btnBindUser_Click" Style="display: none" />
<asp:Button runat="server" ID="btnAddUser" OnClick="btnAddUser_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiUserXML" />
<input type="hidden" runat="server" id="hiWBSId" />
<script type="text/javascript">

    $('#<%=ibtnAdd.ClientID %>').live('click', function () {
        batchAddUser();
    });

    //隐藏添加操作
    if (!parseBool('<%=Enable %>')) {
        $('#spAdd').hide();
    }

    //添加参与人
    function batchAddUser() {
        var param = new InputParamObject("m");
        var deptID = '<%=DeptID%>';
        var wbsID = $("#<%=hiWBSId.ClientID%>").val();
        if (wbsID == "") {
            alert("请先选择卷册再添加设计参与人");
            return false;
        }
        var filter = { OrganizationId: deptID };
        getDivUsersNew('<%=hiUserXML.ClientID %>', param, filter, addUser);
    }

    //查看编辑参与人信息
    function viewPartakerItem(actionType, bizId) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSPartakerEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = bindUser;
        }
        showDivDialog(url, "", 650, 350, callBack);
        return false;
    }

    //执行后台添加参与人
    function addUser() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddUser,"")%>;
    }

    //执行后台绑定参与人
    function bindUser() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindUser,"")%>;
    }
</script>
