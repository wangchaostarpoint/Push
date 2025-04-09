<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProductReuseEditor.aspx.cs"
    Title="成品套用信息" MasterPageFile="~/UI/Master/ObjectList.Master" Inherits="Zhongsoft.Portal.EPMS.List.Product.ProductReuseEditor" %>

<asp:Content ID="Content4" ContentPlaceHolderID="detailContent" runat="server">
    <div id="templateTabs">
        <ul>
            <li id="liAdd"><a href='#' onclick="showDetail('addInfo')">添加套用图</a></li>
            <li id="liRelate"><a href='#' onclick="showDetail('relateInfo')">历史工程套用图</a></li>
            <li id="liLibrary"><a href='#' onclick="showDetail('libraryInfo')">从套用图库中选择</a></li>
        </ul>
        <%--    <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
            <ContentTemplate>--%>
        <table class="tz-table" style="border: 1px">
            <tr>
                <td valign="top" style="width: 550px; background: #eff3f6; border: 1px solid #b9d1f1;">
                    <div id="addInfo" style="width: 100%">
                        <table style="width: 100%">
                            <tr>
                                <td>
                                    <%--  <fieldset class="rtm_fds_bd">
                                <legend class="rtm_fds_tle">添加套用图</legend>--%>
                                    <table class="tz-table">
                                        <%-- <tr>
                                                    <td colspan="7" align="center" style="height: 30px">
                                                        <b>添加套用图</b>
                                                    </td>
                                                </tr>--%>
                                        <tr>
                                            <td>
                                                套用图编号<span class="req-star">*</span>
                                            </td>
                                            <td colspan="7">
                                                <zhongsoft:LightTextBox runat="server" ID="tbProductCode" activestatus="(23.*)" req="1"
                                                    onchange="queryResueInfo()"></zhongsoft:LightTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                套用图名称<span class="req-star">*</span>
                                            </td>
                                            <td colspan="7">
                                                <zhongsoft:LightTextBox runat="server" ID="tbProductName" activestatus="(23.*)" req="1"></zhongsoft:LightTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>
                                                格式<span class="req-star">*</span>
                                            </td>
                                            <td>
                                                <asp:DropDownList ID="ddlFileFormat" runat="server" req="1" Width="50px">
                                                </asp:DropDownList>
                                            </td>
                                            <td>
                                                标准张
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbStandardPage" activestatus="(23.*)"
                                                    Width="50px" DataType="Decimal2"></zhongsoft:LightTextBox>
                                            </td>
                                            <td>
                                                文本页数
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbBookPages" activestatus="(23.*)" DataType="Integer"
                                                    Width="50px"></zhongsoft:LightTextBox>
                                            </td>
                                            <td>
                                                文本本数
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbTotalOfBook" activestatus="(23.*)" DataType="Integer"
                                                    Width="50px"></zhongsoft:LightTextBox>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="8" align="center">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                        <%--</fieldset>--%>
                    </div>
                    <div id="relateInfo" style="width: 100%">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%">
                                    <table>
                                        <tr>
                                            <td>
                                                项目编号/名称
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbQueryProject" activestatus="(23.*)"
                                                    EnableTheming="false" CssClass="kpms-textboxsearch" Width="120px"></zhongsoft:LightTextBox>
                                            </td>
                                            <td>
                                                专业
                                            </td>
                                            <td>
                                                <%--<zhongsoft:LightTextBox runat="server" ID="tbQuerySpe" activestatus="(23.*)" Width="120px"></zhongsoft:LightTextBox>--%>
                                                <zhongsoft:LightDropDownList runat="server" ID="ddlSpe">
                                                </zhongsoft:LightDropDownList>
                                            </td>
                                            <%--<td>
                                            任务编号/名称
                                        </td>
                                        <td>
                                            <zhongsoft:LightTextBox runat="server" ID="tbQueryWBS" activestatus="(23.*)" Width="120px"></zhongsoft:LightTextBox>
                                        </td>--%>
                                        </tr>
                                        <tr>
                                            <td>
                                                成品编号/名称
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbQueryProduct" activestatus="(23.*)"
                                                    EnableTheming="false" CssClass="kpms-textboxsearch" Width="120px"></zhongsoft:LightTextBox>
                                            </td>
                                            <td colspan="2">
                                                <asp:LinkButton runat="server" ID="btnQuery" OnClick="btnQuery_Click" OnClientClick="return beforeQuery();">
                                                <span content='searchResult'>查询</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvReuseSelect" AllowPaging="true"
                                        PageSize="10" DataKeyNames="ProductID" EmptyDataText="请您输入要套用的图纸信息，点击查找进行查询"
                                        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" UseDefaultDataSource="false"
                                        BindGridViewMethod="BindGridSelect" OnRowDataBound="gvReuseSelect_RowDataBound">
                                        <Columns>
                                            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
                                            </zhongsoft:LightCheckField>
                                            <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="选择" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbIsSelect" runat="server" AutoPostBack="true" OnCheckedChanged="CblChanged"
                                                        onclick=" selProduct()" data='<%#Eval("ProductID")%>'></asp:CheckBox>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号">
                                            </zhongsoft:LightBoundField>
                                            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="100">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important; width: 100px"
                                                        title='<%#Eval("ProjectName") %>'>
                                                        <%# Convert.ToString(Eval("ProjectName")).Length > 15 ? Convert.ToString(Eval("ProjectName")).Substring(0, 14) + "…" : Convert.ToString(Eval("ProjectName"))%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightBoundField DataField="BelongSpecialtyName" HeaderText="专业">
                                            </zhongsoft:LightBoundField>
                                            <%--<zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
                                            </zhongsoft:LightBoundField>--%>
                                            <zhongsoft:LightTemplateField HeaderText="成品编号" ItemStyle-Width="130">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important; width: 130px">
                                                        <%#Eval("ProductCode")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="130">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important; width: 130px">
                                                        <%#Eval("ProductName")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                        </Columns>
                                    </zhongsoft:LightPowerGridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                    <div id="libraryInfo" style="width: 100%">
                        <table style="width: 100%">
                            <tr>
                                <td style="width: 100%">
                                    <table>
                                        <tr>
                                            <td>
                                                套用图号
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbReuseProductCode" activestatus="(23.*)" EnableTheming="false"
                                                    CssClass="kpms-textboxsearch" Width="120px"></zhongsoft:LightTextBox>
                                            </td>
                                            <td>
                                                套用图名称
                                            </td>
                                            <td>
                                                <zhongsoft:LightTextBox runat="server" ID="tbReuseProductName" activestatus="(23.*)" EnableTheming="false"
                                                    CssClass="kpms-textboxsearch" Width="120px"></zhongsoft:LightTextBox>
                                            </td>
                                            <td colspan="2">
                                                <asp:LinkButton runat="server" ID="btnQuery2" OnClick="btnQuery2_Click">
                                                <span content='searchResult'>查询</span>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvLibrary" AllowPaging="true"
                                        PageSize="10" DataKeyNames="ReuseProductId" EmptyDataText="请您输入要套用的图纸信息，点击查找进行查询"
                                        AutoGenerateColumns="false" ShowExport="true" AllowSorting="true" UseDefaultDataSource="true"
                                        BindGridViewMethod="BindReuseLibraryGridSelect" OnRowDataBound="gvReuseLibrarySelect_RowDataBound">
                                        <Columns>
                                            <zhongsoft:LightCheckField HeaderText="全部" OnClientClick="checkGridViewRow">
                                            </zhongsoft:LightCheckField>
                                            <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="选择" Visible="false">
                                                <ItemTemplate>
                                                    <asp:CheckBox ID="cbIsSelect" runat="server" AutoPostBack="true"
                                                        data='<%#Eval("ReuseProductId")%>'></asp:CheckBox>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="成品编号" ItemStyle-Width="130">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important; width: 130px">
                                                        <%#Eval("ReuseProductCode")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                            <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="130">
                                                <ItemTemplate>
                                                    <div style="word-break: break-all!important; white-space: normal!important; width: 130px">
                                                        <%#Eval("ReuseProductName")%>
                                                    </div>
                                                </ItemTemplate>
                                            </zhongsoft:LightTemplateField>
                                        </Columns>
                                    </zhongsoft:LightPowerGridView>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td style="width: 500px" valign="top">
                    <table style="width: 100%">
                        <tr>
                            <td valign="middle" align="center" style="width: 80px;">
                                <b style="color: red"></b>
                                <asp:LinkButton runat="server" ID="lbtnSave" OnClientClick="return beforSaveReuse();"
                                    OnClick="lbtnSaveReuse_Click">
                                                                <span>添加=></span>
                                </asp:LinkButton>
                                <asp:LinkButton runat="server" ID="lbtnReUse" OnClick="lbtnReUse_Click" OnClientClick="return beforeReUse();">
                                                <span>关联=></span>
                                </asp:LinkButton>
                                 <asp:LinkButton runat="server" ID="lbtnReUseLibrary" OnClick="lbtnReUseLibrary_Click">
                                                <span>添加=></span>
                                </asp:LinkButton>
                            </td>
                            <td align="center" style="height: 30px; background: #eff3f6; border: 1px solid #b9d1f1;">
                                <b>已套用成品</b>
                            </td>
                        </tr>
                        <tr>
                            <td>
                            </td>
                            <td>
                                <zhongsoft:LightPowerGridView Width="100%" runat="server" ID="gvList" AllowPaging="true"
                                    PageSize="20" DataKeyNames="ProductID" EmptyDataText="没有套用成品" AutoGenerateColumns="false"
                                    ShowExport="true" AllowSorting="true" UseDefaultDataSource="true" BindGridViewMethod="BindGrid"
                                    OnRowCommand="gvList_RowCommand">
                                    <Columns>
                                        <zhongsoft:LightTemplateField ItemStyle-Width="30px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <%# Container.DataItemIndex+1 %>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightBoundField DataField="ProductCode" HeaderText="成品编号">
                                        </zhongsoft:LightBoundField>
                                        <zhongsoft:LightTemplateField HeaderText="成品名称" ItemStyle-Width="200">
                                            <ItemTemplate>
                                                <div style="word-break: break-all!important; white-space: normal!important;">
                                                    <%#Eval("ProductName")%>
                                                </div>
                                            </ItemTemplate>
                                        </zhongsoft:LightTemplateField>
                                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" DeleteText="您确认删除该套用成品吗？">
                                        </zhongsoft:LightButtonField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
        <input runat="server" id="hiProductName" type="hidden" />
        <asp:Button ID="btnProductSel" runat="server" Style="display: none" OnClick="btnProductSelRefresh_Click" />
        <%-- </ContentTemplate>
        </asp:UpdatePanel>--%>
    </div>
    <input type="hidden" id="hiShowDivId" runat="server" value="addInfo" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvReuseSelect.CheckedClientID %>";
        $("#divBars").hide();

        function queryReuse(ctlId) {
            $("#<%=hiProductName.ClientID %>").val(ctlId);
            <%=this.Page.ClientScript.GetPostBackEventReference(this.btnProductSel, "")%>;
        }
        function beforSaveReuse() {
            if (!checkReqField()) {
                return false;
            }
            else {
                //标准张、文本本数、页数必须填一种
                var standard = $("#<%=tbStandardPage.ClientID %>").val();
                var page = $("#<%=tbBookPages.ClientID %>").val();
                var book = $("#<%=tbTotalOfBook.ClientID %>").val();
                if (!((standard != "" && page == "" && book == "")
                    || (standard == "" && page != "" && book != ""))) {
                    alert("如果是图纸，您只需录入标准张数，如果是文本，您只需录入文本本数、页数");
                    return false;
                }
            }
            setReturnVal();
            return true;
        }

        function beforeReUse(){
            var ids = $("#" + $gridCheckedClientID).val();
            if (ids.length < 3) {
                alert("请勾选要套用的成品！");
                return false;
            }
            return true;
        }

        function initCustomerPlugin() {
            $('#templateTabs').tabs({ select: function (event, ui) { return checkTabs(ui); } });
            showDetail($('#<%=hiShowDivId.ClientID %>').val());
             parent.returnValue = "saved";
        }

        function showDetail(divId) {
            $("#" + divId).show();
            $('#<%=hiShowDivId.ClientID %>').val(divId)
            if ("addInfo" == divId) {
                $("#addInfo").show();
                $("#relateInfo").hide();
                $("#libraryInfo").hide();
                $('#<%=lbtnSave.ClientID %>').show();
                $('#<%=lbtnReUse.ClientID %>').hide();   
                $('#<%=lbtnReUseLibrary.ClientID %>').hide();            
            }
            else if("relateInfo" == divId){
                $("#relateInfo").show();
                $("#addInfo").hide(); 
                $("#libraryInfo").hide();
                $('#<%=lbtnSave.ClientID %>').hide();
                $('#<%=lbtnReUse.ClientID %>').show();
                $('#<%=lbtnReUseLibrary.ClientID %>').hide();     
            }
             else if("libraryInfo" == divId){
                $("#libraryInfo").show();
                $("#addInfo").hide();
                $("#relateInfo").hide();
                $('#<%=lbtnSave.ClientID %>').hide();
                $('#<%=lbtnReUse.ClientID %>').hide();  
                $('#<%=lbtnReUseLibrary.ClientID %>').show();   
            }
        }

        function beforeQuery() {
            var projectName = $("#<%=tbQueryProject.ClientID %>").val();
            var speInfo = $("#<%=ddlSpe.ClientID %>").val();
            var productName = $("#<%=tbQueryProduct.ClientID %>").val();
            if (projectName == "" && speInfo == "" && productName == "") {
                alert("请您先录入查询条件，再查询套用成品");
                return false;
            }
            return true;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }

        function selProduct() {
            parent.returnValue = "saved";
        }

        //异步获取套用图信息
        function queryResueInfo() {
            var code=$('#<%=tbProductCode.ClientID %>').val();
            $.post("ProductReuseEditor.aspx",
                 { asyfunc: "GetReuseInfo", reuseCode: code },
                 function (res) {
                     if (res == "") { return; }
                     var $re = eval('(' + res + ')');
                     if($re.length > 0)
                     {
                         var $name = $re[0][0];
                         var $format = $re[0][1];
                         var $standPage = $re[0][2];
                         var $pages = $re[0][2];
                         var $books =$re[0][2];

                         $('#<%=tbProductName.ClientID %>').val($name);
                         $('#<%=ddlFileFormat.ClientID %>').val($format);
                         $('#<%=ddlFileFormat.ClientID%> option').each(function(){
                            if($(this).text()==$format)
                                $(this).attr('selected',true);
                         });
                         if($format=='图纸' || $format=='附图'){
                            $('#<%=tbStandardPage.ClientID %>').val($standPage);
                         }
                         else {
                             $('#<%=tbBookPages.ClientID %>').val($pages);
                             $('#<%=tbTotalOfBook.ClientID %>').val($books);
                         }
                     }
                 }
            );
        }
    </script>
</asp:Content>
