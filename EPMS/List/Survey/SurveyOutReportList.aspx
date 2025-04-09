<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SurveyOutReportList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Survey.SurveyOutReportList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <fieldset class="rtm_fds_bd" id="Fieldset1" style="display: block">
        <%-- <legend class="rtm_fds_tle" onclick="return showSearch();" style="cursor: pointer">一般查询条件</legend>--%>
        <div style="background-color: #EFF2F7;" id="divQuery">
            <span class="filter-block"><span class="filter-block-lb">年份</span><span>
                <zhongsoft:LightDropDownList ID="ddlYear" runat="server" />
            </span></span><span class="filter-block"><span class="filter-block-lb">月份</span><span>
                <zhongsoft:LightDropDownList ID="ddlMonth" runat="server" />
            </span></span><span class="filter-block"><span class="filter-block-lb">旬</span><span>
                <zhongsoft:LightDropDownList ID="ddlWeek" runat="server" />
            </span></span>
        </div>
    </fieldset>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBtn" runat="server">
    <asp:LinkButton ID="btnDel" runat="server" EnableTheming="false" CssClass="btn-query"
        OnClick="btnNew_Click"><span>新建</span></asp:LinkButton>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvList" AutoGenerateColumns="false"
        DataKeyNames="BaseMapInfoId" AllowFrozing="true" runat="server" ShowPageSizeChange="true"
        UseDefaultDataSource="true" AllowSorting="true" OnRowDataBound="gvList_RowDataBound"
        Width="100%">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridView">
            </zhongsoft:LightCheckField>
            <zhongsoft:LightTemplateField HeaderText="序号" ItemStyle-HorizontalAlign="Center"
                HeaderStyle-Width="40px">
                <ItemTemplate>
                    <%# Container.DataItemIndex+1 %>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="安排时间" DataField="ProjectPhaseCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="安排时间">
                <ItemTemplate>
                    <%#Eval("SpecialtyName")%>年<%#Eval("SpecialtyCode")%>）月
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField HeaderText="负责人" DataField="RollCode">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="负责专业" DataField="FlowNum">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="开始时间" DataField="ProjectPhaseName">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField HeaderText="结束时间" DataField="RollName">
            </zhongsoft:LightBoundField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiKey" />
    <script>
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";
        $("#<%=btnBorrow.ClientID %>").hide();

        function checkGridView(array) {
            transParamToToolBar(array, null);
            $("#<%=hiKey.ClientID %>").val(array);
            if (array != "") {
                $("#<%=btnBorrow.ClientID %>").show();
            }
            else {
                $("#<%=btnBorrow.ClientID %>").hide();
            }
        }
        //批量打印
        function openPrint() {
            var a = $("#<%=hiKey.ClientID %>").val();
            window.open('BaseMapTransferPrint.aspx?BaseMapTransferID=' + a);
            return false;
        }
    </script>
</asp:Content>
