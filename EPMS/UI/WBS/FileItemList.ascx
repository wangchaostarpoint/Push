<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileItemList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileItemList" %>
<span style="float: right;" id="Span1" runat="server">
    <asp:LinkButton runat="server" ID="lbtnDownLoadFiles" CssClass="subtoolbarlink" EnableTheming="false"
        Visible="false" ToolTip="批量下载">
        <span id="spanDownLoadFiles" runat="server">
            <img runat="server" id="imgDownLoadFiles" src="~/Themes/Images/ico_fujian.gif" alt="批量下载"
                width="16" height="16" />批量下载</span>
    </asp:LinkButton>
</span><span style="float: right;" id="spAdd" runat="server">
    <asp:LinkButton runat="server" ID="lbtnAdd" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
        <span>
            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="<%=AddFileBtnName%>"
                width="16" height="16" /><%=AddFileBtnName%></span></asp:LinkButton>
    <asp:LinkButton runat="server" ID="lbtnSelFile" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
        <span>
            <img runat="server"  src="~/Themes/Images/btn_add.gif" alt="选择接受资料" width="16"
                height="16" />选择接受资料</span></asp:LinkButton>
</span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
    PageSize="10" AutoGenerateColumns="false" ShowExport="true" AllowSorting="true"
    DataKeyNames="WBSID" UseDefaultDataSource="true" OnRowDataBound="gvList_RowDataBound"
    OnRowCommand="gvList_RowCommand" BindGridViewMethod="UserControl.BindFileList">
    <Columns>
        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
            <ItemTemplate>
                <%# Container.DataItemIndex+1 %>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="专业" ItemStyle-Width="30px" Visible="false">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSType" HeaderText="资料类别" ItemStyle-Width="40px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSCode" HeaderText="资料编号" ItemStyle-Width="60px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="WBSName" HeaderText="资料名称" DataParamFields="WBSID"
            DialogMode="Dialog" EditItemClick="viewItem" ShowToolTip="true" Width="120px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="资料分类" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileType"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="资料性质" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileImp"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="提资单位" ItemStyle-Width="60px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbProviderUnit"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="ExecSpecialtyName" HeaderText="提资专业" ItemStyle-Width="60px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="提资卷册" ItemStyle-Width="60px">
            <ItemTemplate>
                <%--<asp:Label runat="server" ID="lbRoll"></asp:Label>--%>
                <div runat="server" id="divRoll" tip="1" style="width: 100px" class="autoskip">
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="接受专业" ItemStyle-Width="80px">
            <ItemTemplate>
                <div runat="server" id="divRecSpe" tip="1" style="width: 80px" class="autoskip">
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="接受卷册" ItemStyle-Width="80px">
            <ItemTemplate>
                <div runat="server" id="divRecRoll" tip="1" style="width: 80px" class="autoskip">
                </div>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="资料状态" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileNature"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="PlanCompleteTime" HeaderText="计划提交" DataFormatString="{0:yyyy-MM-dd}"
            ItemStyle-Width="40px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="实际提交" DataFormatString="{0:yyyy-MM-dd}"
            ItemStyle-Width="40px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="提资人" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbUser"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="验证人" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbCheckUser"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="验证日期" DataFormatString="{0:yyyy-MM-dd}"
            ItemStyle-Width="40px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightBoundField DataField="FactCompleteTime" HeaderText="提交日期" DataFormatString="{0:yyyy-MM-dd}"
            ItemStyle-Width="40px">
        </zhongsoft:LightBoundField>
        <zhongsoft:LightTemplateField HeaderText="提交状态" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbState"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="是否<br/>已接受" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbIsRec"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="附件" Visible="false" ItemStyle-Width="40px">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="ibtnViewFlow" EnableTheming="false" ToolTip="查看"
                    Visible="false"><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_detail.gif" alt="查看" /> </span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="查看"  ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <asp:LinkButton runat="server" ID="ibtnView" EnableTheming="false" ToolTip="查看"
                        CommandName="view" Visible="false" CommandArgument='<%# DataBinder.Eval(Container.DataItem, "WBSID") %>'><span>
                        <img src="<%=WebAppPath %>/Themes/Images/btn_dg_view.gif" alt="查看" /> </span>
                    </asp:LinkButton>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
            Visible="false">
            <ItemTemplate>
                <asp:LinkButton ID="lbtnEdit" runat="server" EnableTheming="false" OnClientClick="return false">
                                    <img alt="img" src="<%=WebAppPath %>/Themes/Images/btn_dg_edit.gif" 
                                    onclick="wbsItem('3','<%# Eval("WBSID") %>','<%=CallType %>');"/>
                </asp:LinkButton>
            </ItemTemplate>
        </asp:TemplateField>
        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
            Visible="false">
            <ItemTemplate>
                <asp:LinkButton runat="server" ID="lbtnDel" EnableTheming="false" CommandName="del"
                    CommandArgument='<%# Eval("WBSID") %>' OnClientClick="if(!confirm('您确定删除吗？')) return false;">
                                <span><img src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif" alt="删除" /></span>
                </asp:LinkButton>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<asp:Button runat="server" ID="btnBindWbs" OnClick="btnBindWbs_Click" Visible="false" />
<input type="hidden" runat="server" id="hiRoleName" value="验证人" />
<input type="hidden" runat="server" id="hiFileXML" />
<script type="text/javascript">

    $('#<%=lbtnAdd.ClientID %>').live('click', function () {
        addFile('<%=WBSTypeID %>', '<%=CallType %>','<%=ParamWBSTypeID %>');
    });

    $('#<%=lbtnSelFile.ClientID %>').live('click', function () {
        selInFile('<%=CallType %>', '<%=OrganizationID %>');
    });

    //隐藏添加操作
    if (!parseBool('<%=Enable %>')) {
        $('#<%=spAdd.ClientID %>').hide();
    }

    //新建资料
    function addFile(wbsType, callType,paramWBSTypeID) {
        var json = { OrganizationID: '<%=OrganizationID %>', actionType: 2, ExecSpecialtyID: '<%=SpecialtyID %>',DeptID: '<%=DeptID %>', WBSSplitFormID: '<%=WBSBizID %>' };
        json = $.extend(json, { ParamWBSTypeID: paramWBSTypeID,ParentID:'<%=ParentID %>' });
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = initCallBack(callType);
        showDivDialog(encodeURI(url), "", 1050, 600, callBack);
        return false;
    }

    //wbs任务详细
    function wbsItem(actionType, bizId, callType) {
        var json = { actionType: actionType, bizId: bizId };
        var url = buildQueryUrl('/EPMS/List/WBS/WBSEditor.aspx', json);
        var callBack = null;
        if (actionType == '3') {
            callBack = initCallBack(callType);
        }
        showDivDialog(url, "", 1050, 600, callBack);
        return false;
    }

    function viewItem(wbsId) {
        return wbsItem('1', wbsId);
    }

    //绑定资料列表
    function bindWbs() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnBindWbs,"")%>;
    }
    //批量下载
    function batchDownload(fileRelateId) {
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?FileRelateId=" + fileRelateId;
        showDivDialog(urlStr, null, 750, 550);
        return false;
    }

    function viewForm(bizId, extendedAttribute) {
            var url = '/Custom/List/C_FormDetailLoading.aspx';
            var json = { bizId: bizId, IsOld: 2, ExtendedAttribute: extendedAttribute };
            url = buildQueryUrl(url, json);
            window.open(url);
            return false;
        }
   
</script>
