<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WBSUser.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.UI.WBS.WBSUser" %>
<div class="tz-toolbar">
    <table width="100%" class="tz-table" id="tbQuery">
        <tr class="list-leader">
            <td style="width: 500px;">
                <span class="filter-block"><span class="filter-block-lb">项目编号/名称</span> <span>
                    <zhongsoft:LightTextBox ID="tbName" runat="server" CssClass="kpms-textboxsearch"
                        EnableTheming="false"></zhongsoft:LightTextBox>
                </span></span>
            </td>
            <td style="width: 130px;">
                <zhongsoft:LightObjectSelector runat="server" ID="txtOwner" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    PageWidth="850" EnableTheming="false" ShowAttrs="name,UserCode" SelectPageMode="Dialog"
                    Value='<%#Eval("WBSOwnerName") %>' PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                </zhongsoft:LightObjectSelector>
            </td>
            <td>
                <asp:LinkButton runat="server" ID="lbBatchUpdate" CssClass="searchbtn" OnClick="lbBatchUpdate_Click">
                    <span>批量更新负责人</span>
                </asp:LinkButton>
            </td>
            <td>
                <div style="float: right; padding-right: 5px; padding-top: 3px;">
                    <asp:LinkButton runat="server" class="searchbtn bluecolor" ID="lbtnSearch" OnClick="lbtnSearch_Click">
                      <span content="searchResultf">查找</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" class="searchbtn" ID="ibtnReset" OnClick="ibtnReset_Click">
                     <span>重置</span>
                    </asp:LinkButton>
                    <asp:LinkButton runat="server" ID="ibtnHasConfig" CssClass="searchbtn" OnClick="ibtnHasConfig_Click">
                    <span>已配置人员</span>
                    </asp:LinkButton>
                </div>
            </td>
        </tr>
    </table>
</div>
<zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
    DataKeyNames="WBSID" runat="server" ShowPageSizeChange="true" UseDefaultDataSource="true"
    AllowSorting="true" OnSorting="gvWBS_Sorting" OnRowCommand="gvWBS_RowCommand"
    OnRowDataBound="gvWBS_RowDataBound" Width="100%">
    <Columns>
        <zhongsoft:LightCheckField HeaderText="全部">
        </zhongsoft:LightCheckField>
        <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
            ItemStyle-Width="40px">
            <ItemTemplate>
                <%# Container.DataItemIndex + 1%>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="项目" ItemStyle-Width="150px" SortExpression="ProjectPhaseCode">
            <ItemTemplate>
                <%#string.Format("{0}{1}", Eval("ProjectCode"), Eval("ProjectName"))%>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="专业" SortExpression="ExecSpecialtyCode"
            ItemStyle-Width="50px">
            <ItemTemplate>
                <%#string.Format("{0}{1}", Eval("ExecSpecialtyCode"), Eval("ExecSpecialtyName"))%>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="任务" SortExpression="WBSCode" ItemStyle-Width="150px">
            <ItemTemplate>
                <%#string.Format("{0}{1}", Eval("WBSCode"), Eval("WBSName"))%>
                <input type="hidden" runat="server" id="hiBiz" value='<%#Eval("WBSId") %>' />
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="任务负责人" ItemStyle-Width="70px">
            <ItemTemplate>
                <zhongsoft:LightObjectSelector runat="server" ID="txtOwner" SourceMode="SelectorPage"
                    IsMutiple="false" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" ShowAttrs="name,UserCode" SelectPageMode="Dialog" OnClick="btn_UpdateOwner"
                    PageWidth="850" Value='<%#Eval("WBSOwnerName") %>' PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx">
                </zhongsoft:LightObjectSelector>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="校核人" ItemStyle-Width="70px">
            <ItemTemplate>
                <zhongsoft:LightObjectSelector runat="server" ID="txtChecker" SourceMode="SelectorPage"
                    IsMutiple="true" ShowJsonRowColName="true" DoCancel="true" ResultAttr="name"
                    EnableTheming="false" ShowAttrs="name,UserCode" SelectPageMode="Dialog" OnClick="btn_UpdateChecker"
                    PageWidth="850" PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx"></zhongsoft:LightObjectSelector>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
    </Columns>
</zhongsoft:LightPowerGridView>
<input type="hidden" runat="server" id="hiSearchFlag" value="false" />
<script type="text/javascript">

    //一个页面调用多次控件，因js方法相同，可能导致问题
    $('#<%=lbBatchUpdate.ClientID %>').live('click', function () {
        if ($('#<%=txtOwner.ClientID %>').val() == '') {
            alert('请先选择负责人，再进行批量更新！');
            return false;
        }
        var array = buildGirdRowIds("<%=gvWBS.CheckedClientID %>");
        if (buildGirdRowIds("<%=gvWBS.CheckedClientID %>").length == 0) {
            alert('请先选择需要更新的数据，再进行批量更新！');
            return false;
        }
    });
</script>
