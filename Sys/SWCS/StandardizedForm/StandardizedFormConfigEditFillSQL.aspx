<%@ Page Title="标准表单数据源配置" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="StandardizedFormConfigEditFillSQL.aspx.cs"
    Inherits="Zhongsoft.Portal.Sys.StandardizedForm.StandardizedFormConfigEditFillSQL" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">数据源名称</td>
            <td class="td-m" colspan="5">
                <zhongsoft:LightTextBox runat="server" ID="tbDataSource" ReadOnly="True" activeStatus="(23.*)" />
            </td>
        </tr>
        <tr>
            <td class="td-l">是否列表<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList ID="rblIsList" runat="server" RepeatDirection="Horizontal" activeStatus="(23.*)"
                    req="1" errmsg="请选择“是否列表”" Field="IsList" tablename="StandardizedFormConfig_FillInfo">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l" style="display: none;">是否横向列表<span id="spanRblIsHorizontalList" class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3" style="display: none;">
                <asp:RadioButtonList ID="rblIsHorizontalLis" runat="server" RepeatDirection="Horizontal"
                    activeStatus="(23.*)" errmsg="请选择“是否横向列表”" Field="IsHorizontalList" tablename="StandardizedFormConfig_FillInfo">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
                <span class="req-star">【注】“是”列表时必选。</span>
            </td>
            <td class="td-l">是否签字图片<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblIsSignImage" runat="server" RepeatDirection="Horizontal"
                    activeStatus="(23.*)" req="1" errmsg="请选择“是否签字图片”" Field="IsSignImage" tablename="StandardizedFormConfig_FillInfo">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l" style="display: none;">是否第三方签字<span id="spanRblIsThirdSign" class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3" style="display: none;">
                <asp:RadioButtonList ID="rblIsThirdSign" runat="server" RepeatDirection="Horizontal"
                    activeStatus="(23.*)" errmsg="请选择“是否第三方签字”" Field="IsThirdSign" tablename="StandardizedFormConfig_FillInfo">
                    <asp:ListItem Value="True">是</asp:ListItem>
                    <asp:ListItem Value="False" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
                <span class="req-star">【注】“是”签字图片时必选。</span>
            </td>
        </tr>
        <tr>
            <td class="td-l">是否关联流程数据<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="5">
                <asp:RadioButtonList ID="rblIsReleFlowData" runat="server" RepeatDirection="Horizontal"
                    activeStatus="(23.*)" req="1" errmsg="请选择“是否关联流程数据”" Field="IsReleFlowData" tablename="StandardizedFormConfig_FillInfo">
                    <asp:ListItem Value="1">是</asp:ListItem>
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">数据源<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="5">
                <%--<asp:DropDownList ID="ddlDataSource" runat="server" activeStatus="(23.*)" errmsg="请选择“数据源”"
                    req="1" AutoPostBack="true" Field="DataSource" tablename="StandardizedFormConfig_FillInfo"
                    OnSelectedIndexChanged="ddlDataSource_SelectedIndexChanged">
                </asp:DropDownList>--%>
                <input type="hidden" runat="server" id="hiDataSource" field="DataSource" tablename="StandardizedFormConfig_FillInfo" />
                <zhongsoft:LightObjectSelector runat="server" ID="lselDict" ResultAttr="name" SelectPageMode="Dialog"
                    PageUrl="~/BDM/List/DictSelector.aspx" IsMutiple="false" OnClick="lselDict_Click"
                    ResultForControls="{'hiDataSource':'att2'}" Filter="|1" activeStatus="(23.*)" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">数据列<span class="req-star">*</span>
                <asp:Button runat="server" ID="btnAllSel" Text="全选" OnClick="btnAllSel_Click" />
            </td>
            <td class="td-m" colspan="5">
                <asp:CheckBoxList ID="cblDataColumns" runat="server" activeStatus="(23.*)" RepeatColumns="6"
                    RepeatDirection="Horizontal" errmsg="请选择“数据列”">
                </asp:CheckBoxList>
                <input type="hidden" runat="server" id="hiDataSourceColumns" field="DataColumns"
                    tablename="StandardizedFormConfig_FillInfo" />
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">数据源主键列<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:DropDownList ID="ddlFieldName4DataSourcePK" runat="server" activeStatus="(23.*)"
                    errmsg="请选择“数据源主键列”">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiFieldName4DataSourcePK" field="FieldName4DataSourcePK"
                    tablename="StandardizedFormConfig_FillInfo" />
            </td>
            <td class="td-m" flag="temp" colspan="4"></td>
            <td class="td-l" flag="img">签字角色列
            </td>
            <td class="td-r" flag="img">
                <asp:DropDownList ID="ddlFieldName4SignRole" runat="server" activeStatus="(23.*)">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiFieldName4SignRole" field="FieldName4SignRole"
                    tablename="StandardizedFormConfig_FillInfo" />
            </td>
            <td class="td-l" flag="img">签字用户列
            </td>
            <td class="td-r" flag="img">
                <asp:DropDownList ID="ddlFieldName4SignUser" runat="server" activeStatus="(23.*)">
                </asp:DropDownList>
                <input type="hidden" runat="server" id="hiFieldName4SignUser" field="FieldName4SignUser"
                    tablename="StandardizedFormConfig_FillInfo" />
            </td>
        </tr>
        <tr flag="list">
            <td class="td-l">“序号”列名
            </td>
            <td class="td-r" colspan="5">
                <asp:TextBox ID="tbFieldName4RowNumber" runat="server" activeStatus="(23.*)" maxtext="100"
                    Width="200px" Field="FieldName4RowNumber" tablename="StandardizedFormConfig_FillInfo"></asp:TextBox>
                <span class="req-star">【注】只有在配置“排序字段”时才有效；默认值为RowNumber。</span>
            </td>
        </tr>
        <tr style="display: none">
            <td class="td-l">数据筛选条件<br />
                (不带Where)
            </td>
            <td class="td-m" colspan="5">
                <asp:TextBox ID="tbSQLWhere" runat="server" TextMode="MultiLine" CssClass="kpms-textarea"
                    activeStatus="(23.*)" EnableTheming="false" maxtext="3000" Field="SQLWhere" tablename="StandardizedFormConfig_FillInfo"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">SQL表达式
            </td>
            <td colspan="5" class="td-m">
                <zhongsoft:LightTextBox runat="server" ID="tbSQLSOURCE" TextMode="MultiLine" CssClass="kpms-textarea"
                    activeStatus="(23.*)" EnableTheming="false" maxtext="2000" Field="SQLSOURCE" tablename="StandardizedFormConfig_FillInfo" />
            </td>
        </tr>
        <tr flag="list">
            <td class="td-l">排序字段<br />
                (不带Order by)
            </td>
            <td class="td-m" colspan="5">
                <asp:TextBox ID="tbOrderColumns" runat="server" TextMode="MultiLine" CssClass="kpms-textarea"
                    activeStatus="(23.*)" EnableTheming="false" maxtext="1000" Field="OrderColumns"
                    tablename="StandardizedFormConfig_FillInfo"></asp:TextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiFillInfoID" field="FillInfoID" tablename="StandardizedFormConfig_FillInfo" />
    <input type="hidden" runat="server" id="hiMappingID" field="MappingID" tablename="StandardizedFormConfig_FillInfo" />
    <!-- 是否用户填充数据-->
    <input type="hidden" runat="server" id="hiIsUserAdd" field="ISUSERADD" value="1"
        tablename="StandardizedFormConfig_FillInfo" />
    <script type="text/javascript">
        //是否横向列表
        var rblIsList = $("#<%=this.rblIsList.ClientID %>");
        var spanRblIsHorizontalList = $("#spanRblIsHorizontalList");
        var rblIsHorizontalLis = $("#<%=this.rblIsHorizontalLis.ClientID %>");
        //是否签字图片
        var rblIsSignImage = $("#<%=this.rblIsSignImage.ClientID %>");
        var spanRblIsThirdSign = $("#spanRblIsThirdSign");
        var rblIsThirdSign = $("#<%=this.rblIsThirdSign.ClientID %>");
        var ddlFieldName4SignRole = $("#<%=ddlFieldName4SignRole.ClientID %>");
        var ddlFieldName4SignUser = $("#<%=ddlFieldName4SignUser.ClientID %>");

        function initCustomerPlugin() {
            checkMaxLength();

            LoadIsHorizontalList();
            rblIsList.find("input[type=radio]").each(function () {
                $(this).click(function () {
                    LoadIsHorizontalList();
                });
            });

            LoadIsThirdSign();
            rblIsSignImage.find("input[type=radio]").each(function () {
                $(this).click(function () {
                    LoadIsThirdSign();
                });
            });
        }
        //处理“是否横向列表”，如果“是列表”，则必选。
        function LoadIsHorizontalList() {
            if (rblIsList.find("input:checked").length > 0 && rblIsList.find("input:checked").first().val() == "True") {
                spanRblIsHorizontalList.show();
                rblIsHorizontalLis.attr("req", "1");

                $("[flag='list']").show();
            }
            else {
                spanRblIsHorizontalList.hide();
                rblIsHorizontalLis.removeAttr("req");

                $("[flag='list']").hide();
            }
        }

        //处理“是否第三方签字”，如果“是签字图片”，则必选。
        function LoadIsThirdSign() {
            if (rblIsSignImage.find("input:checked").length > 0 && rblIsSignImage.find("input:checked").first().val() == "True") {
                spanRblIsThirdSign.show();
                rblIsThirdSign.attr("req", "1");

                ddlFieldName4SignRole.attr("req", "1");
                ddlFieldName4SignUser.attr("req", "1");

                $("[flag='temp']").hide();
                $("[flag='img']").show();
            }
            else {
                spanRblIsThirdSign.hide();
                rblIsThirdSign.removeAttr("req");

                ddlFieldName4SignRole.removeAttr("req");
                ddlFieldName4SignUser.removeAttr("req");

                $("[flag='temp']").show();
                $("[flag='img']").hide();
            }
        }
    </script>
</asp:Content>
