<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="MarketProjectInfo.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.MarketProjectInfo" %>
<zhongsoft:LightPowerGridView ID="gvMarketProject" runat="server" AllowPaging="true"
    AutoGenerateColumns="false" UseDefaultDataSource="true" DataKeyNames="MIDMARKETPROJECTID"
    ShowHeaderWhenEmpty="true" OnRowCommand="gvMarketProject_RowCommand" ShowExport="true"
    OnRowDataBound="gvMarketProject_RowDataBound" OnExport="gvMarketProject_OnExport">
    <Columns>
        <zhongsoft:LightTemplateField HeaderText="工程编号">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbMarketProjectCode" Text='<%#Eval("MARKETPROJECTCODE") %>'></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightBoundField DataField="MARKETPROJECTNAME" HeaderText="工程名称" Width="250"
            ItemStyle-HorizontalAlign="Left" ShowToolTip="true" />
        <zhongsoft:LightBoundField DataField="PROGRESSREQUIRE" HeaderText="进度要求" Width="80"
            ItemStyle-HorizontalAlign="Left" ShowToolTip="true" />
        <zhongsoft:LightBoundField DataField="QUALITYREQUIRE" HeaderText="质量要求" Width="80"
            ItemStyle-HorizontalAlign="Left" ShowToolTip="true" />
        <zhongsoft:LightTemplateField HeaderText="设计阶段">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbPhases"></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightTemplateField HeaderText="预估合同额(万元)" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Right">
            <ItemTemplate>
                <asp:Label runat="server" ID="lbContractValue" Text='<%#Eval("CONTRACTVALUE") %>'></asp:Label>
            </ItemTemplate>
        </zhongsoft:LightTemplateField>
        <zhongsoft:LightButtonField HeaderText="编辑" EditItemClick="editDetail" DataParamFields="MIDMARKETPROJECTID,ISNEWPROJECT"
            CommandName="EditData" />
        <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewDetail" DataParamFields="MIDMARKETPROJECTID,ISNEWPROJECT"
            CommandName="ViewData" />
        <zhongsoft:LightButtonField HeaderText="选择" EditItemClick="selMarketProjectCode"
            ImageUrl="../../Themes/Images/look-up.gif" DataParamFields="MIDMARKETPROJECTID"
            CommandName="SelData" />
        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该项目吗？">
        </zhongsoft:LightButtonField>
    </Columns>
</zhongsoft:LightPowerGridView>
<input type="hidden" runat="server" id="hiOldProjectID" />
<script>

    //获取项目数量
    function getProjectCount() {
        return $("#<%=gvMarketProject.ClientID %> [id$=lbPhases]").length;
    }

    //验证项目是否选择了设计阶段
    function checkSelPhases() {
        var altertMsg = "";
        $("#<%=gvMarketProject.ClientID %> [id$=lbPhases]").each(function (i) {
            if ($(this).text() == "") {
                altertMsg += (i + 1) + ",";
            }
        });
        return altertMsg
    }

    //验证项目是否填写了预估合同额信息
    function checkFillValue() {
        var altertMsg = "";
        $("#<%=gvMarketProject.ClientID %> [id$=lbContractValue]").each(function (i) {
            if ($(this).text() == "") {
                altertMsg += (i + 1) + ",";
            }
        });
        return altertMsg;
    }

    function checkFillProjectCode() {
        var altertMsg = "";
        $("#<%=gvMarketProject.ClientID %> [id$=lbMarketProjectCode]").each(function (i) {
            if ($(this).text() == "") {
                altertMsg += (i + 1) + ",";
            }
        });
        return altertMsg;
    }

    //选择项目编号信息
    function selMarketProjectCode() {
        var param = new InputParamObject("s");
        var json = "{ projectTypeID: '" + getProjectTypeID() + "' }";
        var reObj = getMarketProjects('re', param, json);

        if (reObj != null) {
            $("#<%=hiOldProjectID.ClientID %>").val(reObj.getId());
            return true;
        }
        return false;
    }

</script>
