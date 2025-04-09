<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AdjustDetailOfFile.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Plan.AdjustDetailOfFile" %>
<%@ Import Namespace="DAL.EPMS" %>
<table class="tz-table" style="width: 100%">
    <tr id="trToolBar" runat="server">
        <td align="right">
            <div id="divCustomBar" style="float: left;" class="subtoolbarbg" runat="server">
                <asp:LinkButton runat="server" ID="lbtnSelWBSFile" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return selFile();" ToolTip="选择计划任务" OnClick="btnAddWBS_Click">
                    <span>
                        <img runat="server" id="img5" src="~/Themes/Images/look-up.gif" alt="选择计划任务" width="16"
                            height="16" />选择影响的资料</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnBatchDelFile" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClientClick="return checkBatchDelFile();" ToolTip="批量删除" OnClick="lbtnBatchDelFile_Click">
                    <span>
                        <img runat="server" id="img2" src="~/Themes/Images/btn_delete.gif" alt="选择计划任务" width="16"
                            height="16" />批量取消影响的资料</span>
                </asp:LinkButton>
                <asp:LinkButton runat="server" ID="lbtnBatchUpdateFile" CssClass="subtoolbarlink"
                    OnClick="lbtnBatchUpdateFile_Click" EnableTheming="false" ToolTip="批量更新时间" OnClientClick="return showFileUpdateInfo()">
                    <span>
                        <img runat="server" id="img1" src="~/Themes/Images/btn_editor.gif" alt="批量更新时间" width="16"
                            height="16" />批量更新时间</span>
                </asp:LinkButton>
            </div>
        </td>
    </tr>
    <tr>
        <td>
            <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvFileList" AllowPaging="true"
                PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
                DataKeyNames="PlanWBSID" OnExport="gvFileList_Export" UseDefaultDataSource="true"
                OnRowCommand="gvFileList_RowCommand" OnBeforeExporting="gvFileList_BeforeExporting"
                OnRowDataBound="gvFileList_RowDataBound">
                <Columns>
                    <zhongsoft:LightCheckField HeaderText="全选" ItemStyle-Width="40px">
                    </zhongsoft:LightCheckField>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightTemplateField HeaderText="接收专业" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <asp:Label runat="server" ID="lbReceiveSpe"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="计划<br/>提交时间" ItemStyle-Width="200px">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" class="kpms-textbox-date"
                                readonly="readonly" Value='<%# (Eval("PlanCompleteTime")==null||string.IsNullOrEmpty(Eval("PlanCompleteTime").ToString())) ? Eval("PlanCompleteTime") : Convert.ToDateTime(Eval("PlanCompleteTime")).ToString("yyyy-MM-dd") %>' />
                            <input type="hidden" runat="server" id="hiBelongSpecialtyID" value='<%#Eval("BelongSpecialtyID") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<div id="divBatchUpdateFile" style="display: none" title="批量更新计划时间">
    <table class="tz-table" style="width: 100%">
        <tr>
            <td class="td-m" colspan="2" align="center" style="font-weight: bold">
                <asp:Label runat="server" ID="lbBatchUpdateNum" flag="batchUpdateFileAlert">
                </asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                计划提交时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText ID="txtPlanCompleteTime" runat="server" activestatus="(23.*)"
                    class="kpms-textbox-date" readonly="readonly">
                </zhongsoft:XHtmlInputText>
            </td>
        </tr>
    </table>
</div>
<input type="hidden" runat="server" id="hiAdjustFileXml" />
<input type="hidden" runat="server" id="hiUpdateTimeXml" />
<input type="hidden" runat="server" id="hiExeSpecialtyID" />
<script>
  $gridCheckedClientIDFile = "<%=this.gvFileList.CheckedClientID %>";

   //更新
    function refreshFileInfo() {
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnSelWBSFile, "")%>;
    }

    function selFile() {
        var param = new InputParamObject("m");
        var filter = { OrganizationID: '<% =OrganizationID%>',WBSType:'<%=(int)WBSMode.设计接口资料 %>' };
        getFileItem("<%=hiAdjustFileXml.ClientID %>", param, filter, refreshFileInfo);
        return false;
    }
    //批量删除
    function checkBatchDelFile() {
        var updateNum=getFileCheckNum();
        if (updateNum< 1) {
            alert("请勾选任务信息");
            return false;
        }
        if (confirm("您确认要删除吗？")) {
            <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchDelFile, "")%>;
        }
        return false;
    }
 
     //获取选中的任务数量
    function getFileCheckNum(){
        var checkedValue=$("#" + $gridCheckedClientIDFile).val().length;
        var updateNum=0;
        if (checkedValue > 1)
        {
            checkedValue=$("#" + $gridCheckedClientIDFile).val().substring(1,checkedValue-1);
            if(checkedValue!="")
              updateNum=checkedValue.split(",").length;
        }
        return updateNum;
    }

     function showFileUpdateInfo(){
        var updateNum=getFileCheckNum();
        if (updateNum< 1) {
            alert("请勾选任务信息");
            return false;
        }
        var xml = $("#<%=hiUpdateTimeXml.ClientID %>").val();
        var wbsTypeShowInfo="file";
        var json= {WBSTypeShowInfo:wbsTypeShowInfo,UpdateWBSNum:updateNum,IsAdjust:true};
        var url = buildQueryUrl("EPMS/List/Plan/BatchUpdatePlanTime.aspx", json);
        showDivDialog(encodeURI(url), xml, 350, 200, batchRefreshFileInfo);
        return false;
    }

     //更新
    function batchRefreshFileInfo(re) {
          $("#<%=hiUpdateTimeXml.ClientID %>").val(re);    
          <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.lbtnBatchUpdateFile, "")%>;
    }
</script>
