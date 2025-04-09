<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="PublishWorkInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Publish.PublishWorkInfo" %>
<table class="tz-table" width="100%" id="Table1">
    <tr id="trleader">
        <td class="flexible" onclick="openDetail('workDetail')">
            工种安排&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" /><span style="float: right">
            </span>
        </td>
        <td align="right">
            <zhongsoft:LightDropDownList ID="ddlWork1" runat="server" Width="100px">
            </zhongsoft:LightDropDownList>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%" id="workDetail">
    <tr>
        <td colspan="6">
            <zhongsoft:LightPowerGridView ID="gvList" runat="server" UseDefaultDataSource="true"
                PermissionStatus="true" PageSize="100" AutoGenerateColumns="false" Width="100%"
                DataKeyNames="PublishWorkID" EmptyDataText="没有工种安排信息" BindGridViewMethod="UserControl.BindInfo"
                OnRowCommand="gvList_RowCommand">
                <Columns>
                    <asp:TemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center" HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <%#((GridViewRow)Container).DataItemIndex + 1 %>
                        </ItemTemplate>
                    </asp:TemplateField>
                    <%--<zhongsoft:LightTemplateField HeaderText="卷册编号" HeaderStyle-Width="10%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbWBSCode"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="卷册名称" HeaderStyle-Width="20%">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbWBSName"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>--%>
                    <zhongsoft:LightBoundField DataField="WorkTypeName" HeaderText="工种类型名称" HeaderStyle-Width="10%">
                    </zhongsoft:LightBoundField>
                    <%-- <zhongsoft:LightBoundField DataField="WorkContent" HeaderText="工作内容" HeaderStyle-Width="35%"
                        HtmlEncode="false">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightTemplateField HeaderText="工作内容" HeaderStyle-Width="35%" ItemStyle-Wrap="true">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbWorkContent" CssClass="kpms-textarea"
                                EnableTheming="false" TextMode="MultiLine" Text='<%#Eval("WorkContent") %>' Enabled="false">
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="Amount" HeaderText="数量" HeaderStyle-Width="10%"
                        ItemStyle-HorizontalAlign="right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ChargeSum" HeaderText="金额" HeaderStyle-Width="10%"
                        ItemStyle-HorizontalAlign="right">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ReceiveDate" HeaderText="接受日期" HeaderStyle-Width="6%"
                        DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="CompleteDate" HeaderText="完成日期" HeaderStyle-Width="6%"
                        DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ChargeUserName" HeaderText="负责人" HeaderStyle-Width="8%">
                    </zhongsoft:LightBoundField>
                    <%-- <zhongsoft:LightBoundField DataField="ChargeDate" HeaderText="计费日期" HeaderStyle-Width="8%"
                        DataFormatString="{0:yyyy-MM-dd}">
                    </zhongsoft:LightBoundField>--%>
                    <zhongsoft:LightButtonField HeaderText="查看" CommandName="ViewData" EditItemClick="initWorkInfo"
                        DataParamFields="PublishWorkID,PublishConsignWBSID" ItemStyle-Width="40px">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="编辑" CommandName="EditData" EditItemClick="editWorkInfo"
                        DataParamFields="PublishWorkID,PublishConsignWBSID" ItemStyle-Width="40px">
                    </zhongsoft:LightButtonField>
                    <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<asp:Button ID="btnInWork" runat="server" OnClick="btnInWork_Click" class="btn" Style="display: none" />
<script type="text/javascript">

//查看工种安排
    function initWorkInfo(detailID) {
        var actionType = 1;
        var url = buildQueryUrl("EPMS/List/Publish/PublishWorkEditor.aspx", { "actionType": actionType, "PublishConsignID": '<%=PublishConsignID %>',"bizId": detailID ,"CurActivityName":'<%=CurActivityName %>',"IsFlowPage": '<%=IsFlowPage %>'});
        showDivDialog(url, null, 700, 500, null);
        return false;
    }

    //编辑工种安排
    function editWorkInfo(detailID) {
        var actionType = 3;
        var url = buildQueryUrl("EPMS/List/Publish/PublishWorkEditor.aspx", { "actionType": actionType, "PublishConsignID": '<%=PublishConsignID %>',"bizId": detailID, "CurActivityName":'<%=CurActivityName %>',"IsFlowPage": '<%=IsFlowPage %>'});
        showDivDialog(url, null, 700, 500, getWorkInfo);
        return false;
    }

    //编辑工种安排弹出层callback方法
    function getWorkInfo() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnInWork,"") %>
    }

    //添加工种安排
    function creatWorkInfo(detailID,curActivityName,isFlow) {
        var actionType = 2;
        var type=$("#<%=ddlWork1.ClientID %>").val();
        if(detailID==""||detailID==null){
            alert("请先保存，再添加工种安排！");
        }
        else{
            var url = buildQueryUrl("EPMS/List/Publish/PublishWorkEditor.aspx", { "actionType": actionType,"Type":type, "PublishConsignID": detailID,"CurActivityName": curActivityName,"IsFlowPage":isFlow});
            if(type!=null && type!=""){
                showDivDialog(url, null, 700, 550, getWorkInfo);
                $("#<%=ddlWork1.ClientID %>").val("");
            }
        }
        return false;
    }
</script>
