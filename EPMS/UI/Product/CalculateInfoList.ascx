<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="CalculateInfoList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Product.CalculateInfoList" %>
<div id="divBars" style="width: 100%;">
    <table class="tz-table">
        <tr id="trleader">
            <td class="flexible" onclick="openDetail('calculateInfoList')" colspan="3">
                计算书&nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
        </tr>
        <tr>
            <td colspan="3">
                <table width="100%" id="calculateInfoList">
                    <tr runat="server" id="trAdd" style="float: right;">
                        <td colspan="3">
                            <asp:LinkButton runat="server" ID="lbtnAdd" CssClass="subtoolbarlink" EnableTheming="false"
                                OnClientClick="return false">
                                <span>
                                    <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="新增计算书" width="16"
                                        height="16" />新增计算书</span></asp:LinkButton>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvCalcuteList" AllowPaging="True"
                                PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                                EmptyDataText="没有计算书信息" DataKeyNames="WBSID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindCalculateInfo"
                                OnRowDataBound="gvCalcuteList_RowDataBound" OnRowCommand="gvCalcuteList_RowCommand">
                                <Columns>
                                    <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                        <ItemTemplate>
                                            <%# Container.DataItemIndex+1 %>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="计算编号" />
                                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="计算名称" DataParamFields="WBSID"
                                        DialogMode="Dialog" EditItemClick="viewCalItem">
                                    </zhongsoft:LightBoundField>
                                    <zhongsoft:LightBoundField DataField="Content" HeaderText="程序" />
                                    <zhongsoft:LightBoundField DataField="PlanTerm" HeaderText="预计工期" ItemStyle-HorizontalAlign="Right" />
                                    <zhongsoft:LightTemplateField HeaderText="计算书">
                                        <ItemTemplate>
                                            <asp:Label ID="lbCalcute" runat="server"></asp:Label>
                                        </ItemTemplate>
                                    </zhongsoft:LightTemplateField>
                                    <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="WBSID"
                                        CommandName="EditData" />
                                    <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该计算书吗？">
                                    </zhongsoft:LightButtonField>
                                </Columns>
                            </zhongsoft:LightPowerGridView>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
    </table>
</div>
<asp:Button runat="server" ID="btnBindCal" Style="display: none" OnClick="btnBindCal_Click" />
<input type="hidden" runat="server" id="hiTextType" value="计算书" />
<input type="hidden" runat="server" id="hiSpecialityID" />
<input type="hidden" runat="server" id="hiDeptID" />
<input type="hidden" runat="server" id="hiOrganizationID" />
<input type="hidden" runat="server" id="hiParamWBSTypeID" />
<script type="text/javascript">
    $('#<%=lbtnAdd.ClientID %>').live('click', function () {
        addCalculateInfo();
    });
    //新建资料
    function addCalculateInfo() {
        calculateItem(2, '');
        return false;
    }

    function editDetail(wbsID) {
        calculateItem(3, wbsID);
        return false;
    }

    function viewCalItem(wbsID){
        calculateItem(1, wbsID);
        return false;
    }

    function refreshCalculate() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindCal,"")%>;
    }

    function calculateItem(actionType, bizId) {
        var paramWBSTypeID = $("#<%=hiParamWBSTypeID.ClientID %>").val();
        var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
        var speId = $("#<%=hiSpecialityID.ClientID %>").val();
        var deptId = $("#<%=hiDeptID.ClientID %>").val();
        var json = { OrganizationID: orgId, actionType: actionType, ExecSpecialtyID: speId, DeptID: deptId, WBSSplitFormID: '<%=WBSBizID %>' };
        json = $.extend(json, { ParamWBSTypeID: paramWBSTypeID, ParentID: '<%=WBSId %>', bizId: bizId });
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = refreshCalculate;
        showDivDialog(encodeURI(url), "", 1050, 600, callBack);
    }

       ///下载成品
    function downloadProduct(productId) {
        var urlStr = "<%=this.WebAppPath %>/Sys/Handler/FileDownloadHandler.ashx?fileType=sign&fileId=" + productId;
        window.open(urlStr);
        return false;
    }

</script>
