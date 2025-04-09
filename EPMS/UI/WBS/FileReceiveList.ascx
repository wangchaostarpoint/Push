<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileReceiveList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileReceiveList" %>
<span style="float: right;" id="Span1" runat="server">
    <asp:LinkButton runat="server" ID="lbtnDownLoadFiles" CssClass="subtoolbarlink" EnableTheming="false"
        ToolTip="批量下载">
        <span id="spanDownLoadFiles" runat="server">
            <img runat="server" id="imgDownLoadFiles" src="~/Themes/Images/ico_fujian.gif" alt="批量下载"
                width="16" height="16" />批量下载</span>
    </asp:LinkButton>
</span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="WBSID,ParamSpecialtyID,FileReceiveState" UseDefaultDataSource="true"
    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControl.BindFileList">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSType" HeaderText="资料类别">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称" DataParamFields="WBSID"
            DialogMode="Dialog" EditItemClick="viewItem">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="资料分类">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileImp"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="接受专业">
            <ItemTemplate>
                <div runat="server" id="divRecSpe" tip="1" style="width: 100px" class="autoskip">
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="资料状态">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileNature"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划提交" DataFormatString="{0:yyyy-MM-dd}">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际提交" DataFormatString="{0:yyyy-MM-dd}">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="提交状态">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbState"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="是否已接受">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbIsRec"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="查看">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                    Visible="false"><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" /> </span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<script type="text/javascript">
    //批量下载
    function batchDownload(fileRelateId) {
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?FileRelateId=" + fileRelateId;
        showDivDialog(urlStr, null, 750, 550);
        return false;
    }
    //查看流程
    function viewForm(bizId, extendedAttribute) {
        var url = '/Custom/List/C_FormDetailLoading.aspx';
        var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
        url = buildQueryUrl(url, json);
        window.open(url);
        return false;
    }
</script>
