<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DesignLibrary.aspx.cs"
    MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" Inherits="Zhongsoft.Portal.EPMS.List.Sys.DesignLibrary"
    Title="设计资料库" %>

<%@ Register Src="~/EPMS/UI/DesignFilesList.ascx" TagName="FileList" TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
            <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
                <asp:TextBox ID="tbProjectInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
            </span></span><span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span>
                <span>
                    <asp:TextBox ID="tbWBSInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                </span></span><span class="filter-block"><span class="filter-block-lb">资料名称/编号</span>
                    <span>
                        <asp:TextBox ID="tbFileInfo" search="1" runat="server" MaxLength="64" class="kpms-textboxsearch" EnableTheming="false"></asp:TextBox>
                    </span></span>
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
    <table width="100%">
        <tr>
            <td>
                担任角色&nbsp;&nbsp;
            </td>
            <td>
                <asp:RadioButtonList ID="rblRoleName" runat="server" RepeatDirection="Horizontal"
                    AutoPostBack="true" OnSelectedIndexChanged="rblRoleName_SelectedIndexChanged">
                    <asp:ListItem Value="主设人" Selected="True">主设人</asp:ListItem>
                    <asp:ListItem Value="设计">设计人/提资人/卷册负责人</asp:ListItem>
                    <asp:ListItem Value="校核">校核人</asp:ListItem>
                    <asp:ListItem Value="审核">审核人</asp:ListItem>
                    <asp:ListItem Value="批准">批准人</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
    </table>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <input type="hidden" runat="server" id="hiIndex" value="0" />
    <div id="templateTabs">
        <ul>
            <li><a href='#Product' id='aProduct'>成品资料（<asp:Label ID="lbProduct" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#OutFiles' id='aOutFiles'>提出资料（<asp:Label ID="lbOutFiles" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#InFiles' id='aInFiles'>接收资料（<asp:Label ID="lbInFiles" runat="server"
                Text="0"></asp:Label>）</a></li>
            <li><a href='#ExternalFile' id='aaExternalFiles'>外部资料（<asp:Label ID="lbExternalFile"
                runat="server" Text="0"></asp:Label>）</a></li>
            <li><a href='#Calculate' id='aCalculate'>计算书（<asp:Label ID="lbCalculate" runat="server"
                Text="0"></asp:Label>）</a></li>
        </ul>
        <div id="Product">
            <asp:UpdatePanel ID="panelProduct" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:FileList ID="ucProduct" runat="server" Memo="" />
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="OutFiles">
            <asp:UpdatePanel ID="panelOutFiles" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:FileList ID="ucOutFile" runat="server"></uc1:FileList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="InFiles">
            <asp:UpdatePanel ID="panelInFiles" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:FileList ID="ucInFiles" runat="server"></uc1:FileList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="ExternalFile">
            <asp:UpdatePanel ID="panelExternalFile" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:FileList ID="ucExternalFile" runat="server"></uc1:FileList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="Calculate">
            <asp:UpdatePanel ID="panelCalculate" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <uc1:FileList ID="ucCalculate" runat="server"></uc1:FileList>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
    </div>
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvWBS" AutoGenerateColumns="false"
        AllowFrozing="true" FrozenColNum="2" runat="server" ShowPageSizeChange="true"
        UseDefaultDataSource="true" AllowSorting="true" Width="100%">
        <Columns>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex + 1%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="项目" ItemStyle-Width="200px" SortExpression="ProjectPhaseCode">
                <ItemTemplate>
                    <%#string.Format("{0}{1}", Eval("ProjectPhaseCode"), Eval("ProjectPhaseName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="DesignName" HeaderText="项目设总" SortExpression="DesignName"
                Width="50" />
            <zhongsoft:LightTemplateField HeaderText="专业" SortExpression="SpecialtyCode" ItemStyle-Width="50px">
                <ItemTemplate>
                    <%#string.Format("{0}{1}", Eval("SpecialtyCode"), Eval("SpecialtyName"))%>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="人员配置单" ItemStyle-Width="50px">
                <ItemTemplate>
                    <input type="hidden" runat="server" id="hiDeptId" value='<%#Eval("Dept_ID") %>' />
                    <input type="hidden" runat="server" id="hiSpecialtyId" value='<%#Eval("SpecialtyID") %>' />
                    <input type="hidden" runat="server" id="hiPhaseCode" value='<%#Eval("PhaseCode") %>' />
                    <a onclick="viewProjUsers('<%#Eval("PROJECTRESOURCEINFOID") %>')">预览</a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
    <script type="text/javascript">
        $gridCheckedClientID = "<%=this.gvWBS.CheckedClientID %>";
        //$hideObjIds = "ctl00_btnQuery,ctl00_btnResrt";

        function initPagePlugin() {
            $('#templateTabs li a').each(function (i) {
                var index = $("#<%=hiIndex.ClientID %>").val();
                if (i == index) {
                    $('#templateTabs').tabs({ active: i });
                }
                $(this).click(function () {
                    $('#templateTabs').tabs({ active: i });
                    $("#<%=hiIndex.ClientID %>").val(i);
                    return true;
                });
            })
        }

        function selUserFilter() {
            return { DicpUser: 1 };
        }

    </script>
</asp:Content>
