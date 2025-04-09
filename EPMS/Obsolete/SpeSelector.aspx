<%@ Page Language="C#" AutoEventWireup="true" Title="选择专业" MasterPageFile="~/UI/Master/ObjectSelector.Master"
    CodeBehind="SpeSelector.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.Obsolete.SpeSelector" %>

<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block" runat="server" id="spanProject"><span class="filter-block-lb">历史工程</span> <span>
        <zhongsoft:LightObjectSelector runat="server" ID="lbsSelectProject" req="1" IsMutiple="false"
            PageWidth="850" SelectPageMode="Dialog" ResultForControls="{'hiOrganizationID':'id','tbProjectPhaseCode':'ProjectCode'}"
            EnableTheming="false" Text="选择项目" AfterSelect="afterSelect()" PageUrl="~/EPMS/Obsolete/ProjectEntitySelector.aspx"
            ShowJsonRowColName="true" ResultAttr="name" activestatus="(23.步骤)" />
        <input type="hidden" id="hiOrganizationId" name="hiOrganizationId" runat="server" />
        <asp:LinkButton runat="server" ID="btnBindOldProjSpe" OnClick="btnBindOldProjSpe_Click"
            Style="display: none"></asp:LinkButton>
    </span></span><span class="filter-block" id="spanTemplate" runat="server"><span class="filter-block-lb"></span><span>【<asp:Label ID="lbTemplateName" runat="server"></asp:Label>】&nbsp;
            <asp:LinkButton ID="btnBindTemplateSpe" runat="server" EnableTheming="false" OnClick="btnBindTemplateSpe_Click"
                ForeColor="Red">加载模板专业</asp:LinkButton>
        <input type="hidden" id="hiProjectTemplateId" name="hiProjectTemplateId" runat="server" /></span></span>
    <span class="filter-block"><span class="filter-block-lb">专业代字/名称</span> <span>
        <zhongsoft:LightTextBox ID="tbName" runat="server" Width="120px" CssClass="kpms-textboxsearch"
            EnableTheming="false"></zhongsoft:LightTextBox></span></span> <span class="filter-block">
                <span class="filter-block-lb">部门</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlDept" runat="server" class="kpms-ddlsearch" EnableTheming="false"
                        Width="180px">
                    </zhongsoft:LightDropDownList>
                </span></span><span class="filter-block-lb">业务板块</span> <span>
                    <zhongsoft:LightDropDownList ID="ddlBusinessPlate" runat="server" class="kpms-ddlsearch"
                        EnableTheming="false">
                    </zhongsoft:LightDropDownList>
                </span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="True"
        PageSize="10" AutoGenerateColumns="false" AllowSorting="true" DataKeyNames="ParamSpecialtyId"
        UseDefaultDataSource="true" BindGridViewMethod="DoSelectByFilter" OnRowDataBound="gvList_RowDataBound"
        OnRowCommand="gvList_RowCommand" BindJsonClick="true" OnJsonClick="addObject"
        JsonClickMode="onclick" ShowJsonRowColName="true">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选"
                HeaderStyle-Width="40px" Visible="false">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="选择" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center"
                Visible="false">
                <ItemTemplate>
                    <asp:RadioButton runat="server" ID="rb" onclick='radioClick(this)' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                    <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("ParamSpecialtyId") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="部门" ItemStyle-Width="200px">
                <ItemTemplate>
                    <div runat="server" id="lbDept" tip="1" style="width: 200px" class="autoskip">
                        <%#Eval("DeptName") %>
                    </div>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="ParamSpecialtyId" HeaderText="专业ID" Visible="false" />
            <zhongsoft:LightBoundField DataField="SpecialtyCode" HeaderText="专业代字" />
            <zhongsoft:LightBoundField DataField="SpecialtyName" HeaderText="专业名称" />
            <zhongsoft:LightBoundField DataField="SpecialtyType" HeaderText="专业类型">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="Description" HeaderText="描述" />
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
    </script>
</asp:Content>
