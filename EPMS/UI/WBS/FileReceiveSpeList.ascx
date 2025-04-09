<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="FileReceiveSpeList.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.WBS.FileReceiveSpeList" %>
<span style="float: right;" id="spAddSpe">
    <asp:LinkButton runat="server" ID="ibtnAddSpe" CssClass="subtoolbarlink" EnableTheming="false"
        OnClientClick="return false">
        <span>
            <img runat="server" id="imgAdd" src="~/Themes/Images/btn_add.gif" alt="添加专业" width="16"
                height="16" />添加专业</span>
    </asp:LinkButton></span>
<zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="false"
    PageSize="20" AutoGenerateColumns="false" ShowExport="false" AllowSorting="true"
    DataKeyNames="FileItemID,ParamSpecialtyID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindSpecialtyList"
    OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" EmptyDataText="没有专业信息">
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
        <zhongsoft:LightTemplateField HeaderText="接收状态<span class='req-star'>*</span>">
            <ItemTemplate>
                <asp:RadioButtonList runat="server" ID="rbl" Visible="false" RepeatDirection="Horizontal"
                    key='<%#Eval("ParamSpecialtyID") %>' OnSelectedIndexChanged="rbl_SelectedIndexChanged"
                    AutoPostBack="true" content="state" req="1">
                </asp:RadioButtonList>
                <asp:Label runat="server" ID="lbFileReceiveState">
                </asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="拒绝原因">
            <ItemTemplate>
                <zhongsoft:LightTextBox runat="server" ID="tbReason" Text='<%#Eval("Memo") %>' maxText="100"
                    CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine" Rows="2"
                    content="reason"></zhongsoft:LightTextBox>
                <input type="hidden" runat="server" id="hiSpeId" value='<%#Eval("ParamSpecialtyID") %>' />
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="资料收到日期">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbFileReceiveDate"></asp:Label>
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
<asp:Button runat="server" ID="btnAddSpe" OnClick="btnAddSpe_Click" Style="display: none" />
<input type="hidden" runat="server" id="hiFileID" />
<input type="hidden" runat="server" id="hiOrganizationID" />

<%--接收专业ID--%>
<input type="hidden" runat="server" id="hiReceiveSpecID" />
<script type="text/javascript">
    function initFileSpe() {

        $('#<%=ibtnAddSpe.ClientID %>').bind('click', function () {
            batchAddSpe();
        });

        //隐藏添加专业操作
        if (!parseBool('<%=Enable %>')) {
            $('#spAddSpe').hide();
        }
    }

    //批量添加专业
    function batchAddSpe() {
//        var json = { FileItemID: '<%=BizID %>', OrganizationID: '<% =OrganizationID%>' };
        //        var url = '/EPMS/Obsolete/SpeSelector.aspx';
        //        url = buildQueryUrl(url, json);
        //        showDivDialog(encodeURI(url), null, 850, 550, addSpes);
        var fileID = $('#<%=hiFileID.ClientID%>').val();
        if (fileID == "") {
            alert("请先确定资料");
            return false;
        }
        var orgID = $('#<%=hiOrganizationID.ClientID%>').val();
        var param = new InputParamObject("m");
        var json = { FileItemID: fileID, OrganizationID: orgID, ShowLittleSpe: 1 };
        getDivSpecialty("", param, json, addSpes);
        return false;
    }

    //执行后台添加专业数据
    function addSpes() {
        <%=Page.ClientScript.GetPostBackEventReference(this.btnAddSpe,"")%>;
    }

    function checkReason() {
        if ($actName == "签收") {
            var $State = $('#<%=gvList.ClientID %> [content="state"]');
            var $Reason = $('#<%=gvList.ClientID %> [content="reason"]');
            var len = $Reason.length;
            for (var i = 0; i < len; i++) {
                var value = $Reason.eq(i).val().trim();
                if ($Reason.eq(i).attr('isDisabled') != 'true' && value == '' && $State.eq(i).find('input:checked').val() == "存在问题") {
                    alert('存在问题时，必须填写拒绝原因！');
                    $Reason.eq(i).focus();
                    return false;
                }
            }
            for (var i = 0; i < len; i++) {
                if ($Reason.eq(i).attr('isDisabled') != 'true' && $State.eq(i).find('input:checked').val() == "不需要接受") {
                    return confirm('是否确定不接收此资料项，如确实不需要接受，则后续需要此资料时需要此资料提出人重新给您提资');
                }
            }
        }
        return true;
    }

    //接收专业
    function checReceiveSpe() {
        if ($actName == "编写资料交接表") {
            if ($('#<%=gvList.ClientID %>')[0].rows[1].cells[0].innerText == "没有专业信息") {
                alert("请选择接受专业！");
                return false;
            }
        }
        return true;
    }
</script>
