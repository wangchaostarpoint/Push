<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_DesignTaskForm.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.Form.WBS.WF_DesignTaskForm" %>
<%@ Register Src="../../UI/WBS/DesignTaskInfo.ascx" TagName="DesignTaskInfo" TagPrefix="uc1" %>
<%@ Register Src="../../UI/WBS/WBSPartakerList.ascx" TagName="WBSPartakerList" TagPrefix="uc2" %>
<%@ Register Src="../../UI/WBS/FileItemList.ascx" TagName="FileItemList" TagPrefix="uc3" %>
<!---计算书信息--->
<%@ Register Src="../../UI/Product/CalculateInfoList.ascx" TagName="CalculateInfoList"
    TagPrefix="uc4" %>
<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal.ACL" %>
<table class="tz-table" width="100%">
    <uc1:DesignTaskInfo ID="taskInfo" runat="server" WBSBookType="设计任务书" WBSBookNature="首次下达"
        OnAfterSelWBSClick="AfterSelWBSClick" />
    <tr>
        <td class="flexible" colspan="6" onclick="openDetail('trPartaker')">
            设计参与人<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trPartaker">
        <td colspan="6">
            <uc2:WBSPartakerList ID="wbsPartaker" runat="server" />
        </td>
    </tr>
    <tr style="display: none">
        <td class="flexible" colspan="6" onclick="openDetail('trMandatoryList')">
            强制性条文<img src="<%=WebAppPath%>/themes/images/lright.png" />
        </td>
    </tr>
    <tr id="trMandatoryList" style="display: none">
        <td colspan="6">
            <%-- 根据卷册编号对应--%>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvMandatoryList" AllowPaging="True"
                PageSize="100" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="MandatoryTemplateID" UseDefaultDataSource="true" BindGridViewMethod="BindMandatoryList">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="序号" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="MandatoryName" HeaderText="规范名称" DataParamFields="MandatoryTemplateID"
                        DialogMode="Dialog" EditItemClick="viewMandatoryDetail">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="ItemCode" HeaderText="条款号" ShowToolTip="true"
                        Width="100">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="MandatoryContent" HeaderText="强制性条文内容" ShowToolTip="true"
                        Width="300">
                    </zhongsoft:LightBoundField>
                    <%--  <zhongsoft:LightTemplateField HeaderText="查看" ItemStyle-HorizontalAlign="Center"
                        ItemStyle-Width="35px">
                        <ItemTemplate>
                            <asp:LinkButton runat="server" ID="ibtnView" EnableTheming="false">
                                 <img alt="" style="cursor: pointer"  src="<%=WebAppPath%>/Themes/Images/btn_dg_view.gif" 
                                   onclick="return viewMandatory('<%#Eval("MandatoryTemplateID")%>');" />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>--%>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>

<input type="hidden" runat="server" id="hiFileXML" />
<input type="hidden" runat="server" id="hiQualityXml" />
<script type="text/javascript">
    function initCustomerPlugin() {
        if (typeof (initDesignTaskInfo) == "function") {
            initDesignTaskInfo();
        }
    }

    //选择输入资料
    function selInFile(callType, orgId) {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: orgId,IsContainComplete:'0'};
        getFileItem('<%=hiFileXML.ClientID %>', param, filter, bindInFile);
        return false;
    }

      function viewMandatoryDetail(bizId) {
        var json = { actionType: 1, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/Sys/MandatoryTemplateEditor.aspx', json);
        showDivDialog(url, null, 850, 450, null);
     }

    //end 为多个同一Control页面提供调用

     function showQualityDetail(bizId, actionType) {
        var json = { WBSBookID: $bizCtx.bizId};
        var url = buildBizUrl(actionType, bizId, "EPMS/List/WBS/QualityUsingEditor.aspx", json);
        var callBack=null;
        if(actionType!="1")
            callBack=bindQuality;
        showDivDialog(url, null, 750, 1150,callBack);
        return false;
    }

    function editQualityDetail(bizId) {
        return showQualityDetail(bizId, 3);
    }

    function addQualityDetail() {
        return showQualityDetail("", 2);
    }

    function viewQualityDetail(bizId) {
        return showQualityDetail(bizId, 1);
    }

    //选择质量信息
    function selQualityInfo() {
        var param = new InputParamObject("m");
        var orgId=getOrgID();
        var filter = { OrganizationID: orgId,WBSID:getWBSID()};
        getQualityInfo('<%=hiQualityXml.ClientID %>', param, filter, resetBindQuality);
        return false;
    }
    
</script>
