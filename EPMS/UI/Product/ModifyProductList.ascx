<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="ModifyProductList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.ModifyProductList" %>
<%@ Import Namespace="DAL.EPMS" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('modifiedProduct')">
                各专业成品校审修改列表&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%" id="modifiedProduct">
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvModifiedWBSList"
                                AllowPaging="false" PageSize="50" ShowExport="true" AutoGenerateColumns="false"
                                AllowSorting="true" DataKeyNames="WBSID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindModifiedProduct"
                                EmptyDataText="没有修改卷册信息" OnRowCommand="gvModifiedWBSList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="卷册编号" />
                                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="卷册名称" />
                                    <zhongsoft:LightBoundField DataField="WBSOwnerName" HeaderText="卷册负责人" />
                                    <zhongsoft:LightTemplateField HeaderText="校审信息">
                                        <ItemTemplate>
                                            <div style="word-break: break-all !important; white-space: normal !important;">
                                                <%# GetOpinionInfo(Eval("WBSID").ToString())%>
                                            </div>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightTemplateField HeaderText="修改状态">
                                        <ItemTemplate>
                                            <asp:Label runat="server" ID="lbModifyInfo" Text='<%#Eval("ReworkState") %>'></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField HeaderText="发起成品设计修改流程" EditItemClick="checkCanStart"
                                        ImageUrl="../../../Themes/Images/ico_act_start.png" DataParamFields="ReworkState"
                                        CommandName="StartModifiedFlow" Visible="false" />
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<script type="text/javascript">

    //提示启动流程
    function checkCanStart(reworkState) {
        if (reworkState == "" || reworkState == "<%=ReworkState.修改完成.ToString() %>") {
            return confirm("您确定给卷册负责人发起成品设计修改流程吗？");
        }
        else {
            alert("此卷册的成品设计修改流程还没有结束，不能再发起成品设计修改流程");
            return false;
        }
    }

    //判断是否有卷册正在修改中
    function checkHasAllModified() {
        var isAllModified = true;
        var $reworkState = $("#<%=gvModifiedWBSList.ClientID %> [id$=lbModifyInfo]");
        for (i = 0; i < $reworkState.length; i++) {
            if ($($reworkState[i]).text() == "<%=ReworkState.正在修改.ToString() %>" || $($reworkState[i]).text() == "<%=ReworkState.准备修改.ToString() %>") {
                isAllModified = false;
                break;
            }
        }
        return isAllModified;
    }
       
</script>
