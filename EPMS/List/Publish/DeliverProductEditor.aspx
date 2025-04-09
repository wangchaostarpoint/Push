<%@ Page Title="成品交付记录" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="DeliverProductEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Publish.DeliverProductEditor" %>

<%@ Import Namespace="DAL.EPMS" %>
<%@ Import Namespace="Zhongsoft.Portal" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">

    <table class="tz-table">
        <tr>
            <td class="td-l">项目编号
            </td>
            <td class="td-r" style="width: 14%">
                <zhongsoft:XHtmlInputText runat="server" ID="txtProjectCode" ActiveStatus="(23.*)" readonly="readonly" class="kpms-textbox" tablename="EPMS_PublishDeliver" field="ProjectCode" />
            </td>
            <td class="td-l">项目名称<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
                    SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','txtProjectCode':'ProjectCode','hiCustomerID':'CustomerID','txtCustomerName_hivalue':'CustomerName',
                'txtCustomerName':'CustomerName'}"
                    EnableTheming="false" Text="选择项目" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
                    PageWidth="850" ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_PublishDeliver" field="ProjectName"
                    activestatus="(23.*)" />
                <input type="hidden" id="hiOrganizationID" name="hiOrganizationID" runat="server" tablename="EPMS_PublishDeliver" field="OrganizationID" />
            </td>
        </tr>
        <tr>
            <td class="td-l">交付时间<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText class="kpms-textbox-date" ID="txtDeliverCustomerDate" runat="server" readonly="readonly" TableName="EPMS_PublishDeliver"
                    Field="DeliverCustomerDate" ActiveStatus="(23.*)" req="1" />
            </td>
            <td class="td-l">交付地址
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbDeliverAddress" runat="server" MaxText="128" TableName="EPMS_PublishDeliver" Field="DeliverAddress" ActiveStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">交付业主</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightObjectSelector runat="server" ID="txtCustomerName" IsMutiple="false"
                    ShowSelectBtn="true" SelectPageMode="Dialog" ResultForControls="{'hiCustomerID':'id'}"
                    EnableTheming="false" PageWidth="850" PageUrl="~/MM/Obsolete/CustomerSelector.aspx"
                    ShowJsonRowColName="true" ResultAttr="name" tablename="EPMS_PublishDeliver"
                    field="CustomerName" activestatus="(23.*)(23.下达项目立项通知)" DoCancel="false" Writeable="false" />
                <input type="hidden" id="hiCustomerID" name="hiCustomerID" runat="server" field="CustomerID"
                    tablename="EPMS_PublishDeliver" />
            </td>
        </tr>
        <tr>
            <td class="flexible" colspan="5">
                <span>交付卷册信息</span> &nbsp;<img src="<%=WebAppPath%>/themes/images/lright.png" />
            </td>
            <td class="flexible">
                <asp:Label runat="server" ID="lbTip" activestatus="(2.*)"
                    displaystatus="(2.*)" ForeColor="Red"
                    Text="先保存再添加卷册"></asp:Label>
            </td>
        </tr>
        <tr>
            <td colspan="6">
                <span style="float: right;" id="Span1" runat="server" displaystatus="(3.*)">
                    <asp:LinkButton runat="server" ID="lbtnSelWBS" CssClass="subtoolbarlink" EnableTheming="false"
                        OnClientClick="return false" flag="update">
                        <span>
                            <img runat="server" id="img1" src="~/Themes/Images/btn_add.gif" alt="选择工程" width="16"
                                height="16" />添加卷册</span>
                    </asp:LinkButton></span>
            </td>
        </tr>
        <tr>
            <td class="td-m" colspan="6">
                <zhongsoft:LightPowerGridView runat="server" ID="gvList" UseDefaultDataSource="True" AllowPaging="True" PageSize="10" DataKeyNames="DeliverProductID,WBSID"
                    OnRowCommand="gvList_OnRowCommand" OnRowDataBound="gvList_OnRowDataBound">
                    <Columns>
                        <zhongsoft:LightBoundField HeaderText="卷册编号" DataField="WBSCode" />
                        <zhongsoft:LightBoundField HeaderText="卷册名称" DataField="WBSName" />
                        <zhongsoft:LightTemplateField HeaderText="份数" ItemStyle-HorizontalAlign="Right">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbCount" DataType="Integer" EnableTheming="False" CssClass="kpms-textbox-money" Text='<%#Eval("CoverCount")%>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbMemo" EnableTheming="False" CssClass="kpms-textarea" TextMode="MultiLine" MaxLength="1024" Text='<%#Eval("Memo")%>' />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightBoundField HeaderText="出版状态" DataField="PublishState" />
                        <zhongsoft:LightButtonField HeaderText="删除" CommandName="DeleteData" ItemStyle-Width="40px" Visible="false" />
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiReleWBS" />
    <input type="hidden" id="hiFlag" name="hiFlag" runat="server" tablename="EPMS_PublishDeliver" field="Flag" />
    <input type="hidden" id="hiPublishDeliverID" name="hiPublishDeliverID" runat="server" tablename="EPMS_PublishDeliver" field="PublishDeliverID" />
    <asp:Button runat="server" ID="btnBindReleWBS" OnClick="btnBindReleWBS_OnClick" Style="display: none" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
        }
        $('#<%=lbtnSelWBS.ClientID %>').live('click', function () {
            selReleWBS();
        });

        //选择关联市场项目
        function selReleWBS() {
            var param = new InputParamObject("m");
            var orgID = $("#<%=hiOrganizationID.ClientID%>").val();
            var publishState = '<%=(int)PublishState.已出版%>';
            var isAllowDeliverAgain = '<%=(int)BoolType.是%>';
            var json = { OrganizationID: orgID, PublishState: publishState, IsAllowDeliverAgain: isAllowDeliverAgain };
            getWBS('<%=hiReleWBS.ClientID %>', param, json, bindReleWBS);
            return false;
        }
        function bindReleWBS() {
            $("#<%=btnBindReleWBS.ClientID %>").click();
        }
    </script>
</asp:Content>
