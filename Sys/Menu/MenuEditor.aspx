<%@ Page Title="页面管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="MenuEditor.aspx.cs" Inherits="Zhongsoft.Portal.Sys.MenuEditor" %>

<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table class="tz-table">
        <tr>
            <td class="td-l">
                页面分类
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPageScope" field="PageScope" tablename="PortalPages" />
                <asp:Label runat="server" ID="lblPageScope"></asp:Label>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面名称<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbMenuName" runat="server" MaxLength="50" ActiveStatus="(23.*)"
                    req="1" Field="PageName" TableName="PortalPages"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面编号
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiPageCode" field="PageCode" tablename="PortalPages" />
                <input type="text" runat="server" id="tbCodePrefix"   style="width: 41%"
                    class="kpms-textbox" />
                <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="42%" DataType="EnNumStr"
                    MaxLength="20">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面权限
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlPublic" runat="server" Field="IsPublic" TableName="PortalPages"
                    Width="85%" ActiveStatus="(23.*)">
                    <asp:ListItem Value="1">公用访问</asp:ListItem>
                    <asp:ListItem Value="0">受限访问</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                操作动作
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlActionPublic" runat="server" Field="ActionIsPublic" TableName="PortalPages"
                    Width="85%" ActiveStatus="(23.*)">
                    <asp:ListItem Value="1">公用访问</asp:ListItem>
                    <asp:ListItem Value="0">受限访问</asp:ListItem>
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面实体
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiDictCode" field="DictCode" tablename="PortalPages" />
                <zhongsoft:LightObjectSelector runat="server" ID="lbsDict" PageUrl="~/BDM/List/DictSelector.aspx"
                    ResultAttr="name" ResultForControls="{'hiDictCode':'att2'}" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面类型
            </td>
            <td class="td-m">
                <asp:DropDownList ID="ddlPageType" runat="server" Field="PageType" TableName="PortalPages"
                    Width="85%" ActiveStatus="(23.*)">
                </asp:DropDownList>
            </td>
        </tr>
        <tr id="trIsXPage">
            <td class="td-l">
                自定义
            </td>
            <td class="td-m">
                <asp:RadioButtonList ID="rbtnIsXPage" runat="server" Field="IsXPage" TableName="PortalPages"
                    RepeatDirection="Horizontal" ActiveStatus="(23.*)">
                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                    <asp:ListItem Value="1">是</asp:ListItem>
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trXPageName" style="display: none">
            <td class="td-l">
                页面连接<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <input type="hidden" runat="server" id="hiXPageXML" />
                <input type="hidden" runat="server" id="hiXPageId" field="XPageId" tablename="PortalPages" />
                <table cellpadding='0' cellspacing='0' style="width: 85%">
                    <tr>
                        <td>
                            <input type="text" runat="server" id="txtXPageName" class="kpms-textbox" req="1"
                                style="width: 100%" activestatus="(23.*)" readonly="readonly" />
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="btnChoose" DisplayStatus="(23.*)" CssClass="btn-look-up"
                                Style="height: 18px; width: 20px; padding: 0px" EnableTheming="false">
                    <img title="选择视图" src="../../Themes/Images/look-up.gif"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面Url
            </td>
            <td class="td-m">
                <input type="text" id="tbMenuUrl" runat="server" maxlength="512" activestatus="(23.*)"
                    class="kpms-textbox" field="PageUrl" tablename="PortalPages" />
                <span id="spanEditView" class="req-star" runat="server" style="display: none">如要编辑视图，请先保存再编辑视图！</span>
            </td>
        </tr>
        <tr id="trExp" style="display: none">
            <td class="td-l">
                表达式
            </td>
            <td>
                <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false"
                    ShowAddData="true" OnAddData="gvList_AddData" OnRowDataBound="gvList_RowDataBound"
                    OnRowCommand="gvList_RowCommand" Width="85%" UseDefaultDataSource="true">
                    <columns>
                        <asp:TemplateField HeaderText="表达式" HeaderStyle-Width="60%">
                            <ItemTemplate>
                                <input type="hidden" id="hiOperatorExp" runat="server" />
                                <table cellpadding='0' cellspacing='0' width="90%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbOperatorExp" req="1" ReadOnly="true" Width="100%"></asp:TextBox>
                                        </td>
                                        <td>
                                            <asp:LinkButton runat="server" ID="btnSetExp" EnableTheming="false" CssClass="btn-look-up"
                                                CommandName="SetExp"><img  src="../../Themes/Images/btn_fx.png"/></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="页面" HeaderStyle-Width="25%">
                            <ItemTemplate>
                                <input type="hidden" runat="server" id="hiPageId" value='<%#Eval("PageId")%>' />
                                <zhongsoft:LightObjectSelector runat="server" ID="lbsel" PageUrl="~/Sys/Menu/PageSelector.aspx"
                                    req="1" Width="90%" ShowJsonRowColName="true" ResultForControls="{'hiPageId':'id'}" />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="等级" HeaderStyle-Width="10%">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox runat="server" ID="tbLevel" Text='<%#Eval("Level")%>' req="1"
                                    MaxLength="2" Style="text-align: right" Width="90%" DataType="Integer"></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <zhongsoft:LightButtonField CommandName="DeleteData" HeaderText="删除" HeaderStyle-Width="5%">
                        </zhongsoft:LightButtonField>
                    </columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
        <tr id="trTarget">
            <td class="td-l">
                打开方式
            </td>
            <td class="td-m">
                <asp:DropDownList runat="server" ID="ddlTarget" ActiveStatus="(23.*)" Field="Target"
                    Width="85%" TableName="PortalPages">
                </asp:DropDownList>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                页面图标
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbMenuIcon" runat="server" MaxLength="56" Field="PageIcon" TableName="PortalPages"
                    ActiveStatus="(23.*)"> </asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbSoftIndex" runat="server" MaxLength="3" ActiveStatus="(23.*)"
                    regex="^\d*$" errMsg="排序顺序只能填写整数！" req="1" Field="Sort" TableName="PortalPages"></asp:TextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                描述
            </td>
            <td class="td-m">
                <asp:TextBox ID="tbDescription" runat="server" MaxLength="512" ActiveStatus="(23.*)"
                    TextMode="MultiLine" Field="Memo" TableName="PortalPages" Rows="4" CssClass="kpms-textarea" EnableTheming="false"></asp:TextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiPageId" field="PageId" tablename="PortalPages" />
    <input type="hidden" runat="server" id="hiParentPageId" field="ParentPageId" tablename="PortalPages" />
    <input type="hidden" runat="server" id="hiModuleId" field="ModuleId" tablename="PortalPages" />
    <input type="hidden" runat="server" id="hiAclPageExp" field="AclPageExp" tablename="PortalPages" />    
    <script>
        function setOperatorExp(hiid) {
            var condition = $("#" + hiid + "").val();
            var url = "/Portal/Sys/ConditionEditor.aspx?ExpType=AclOperator";
            var re = showModal(encodeURI(url), condition, 900, 400);
            if (re != undefined) {
                $("#" + hiid + "").val(re);
                return true;
            }
            return false
        }
        var $tbMenuUrl = $("#<%=tbMenuUrl.ClientID %>");
        var $hiPageXml = $("#<%=hiXPageXML.ClientID %>");
        var $txtXPageName = $("#<%=txtXPageName.ClientID %>");
        var $hiXPageId = $("#<%=hiXPageId.ClientID %>");
        var $rbtnIsXPage = $("#<%=rbtnIsXPage.ClientID %>");
        var $ddlPageType = $("#<%=ddlPageType.ClientID %>");
        var $tbCodePrefix = $("#<%=tbCodePrefix.ClientID %>");
        var $tbCode = $("#<%=tbCode.ClientID %>");

        var xListUrl = "<%=XListUrl %>";
        var xEditorUrl = "<%=XEditorUrl %>";
        var xSelectorUrl = "<%=XSelectorUrl %>";
        var xPageUrl = "<%=XPageUrl %>";
        var aclPageUrl = "<%=AclPageUrl %>";

        function initCustomerPlugin() {
            checkRegex();

            if ($ddlPageType.val() == "2") {
                $tbCode.attr("req", "1");
            }
            else {
                $tbCode.removeAttr("req");
            }

            if ($ddlPageType.val() == "4") {
                $("#trMenuUrl").hide();
                $("#trXPageName").hide();
                $("#trIsXPage").hide();
                $("#trExp").show();
                $txtXPageName.removeAttr("req");
            }
            else {
                $("#trIsXPage").show();
                $("#trExp").hide();
                menuPageType($rbtnIsXPage.find("input:checked").val(), false);
            }

        }

        function chooseXList(type) {
            var param = new InputParamObject("s");
            var json = '{ "PageType":"' + type + '"}';
            var re = getXList("<%=hiXPageXML.ClientID %>", param, json);
            if (re != null) {
                $hiXPageId.val(re.buildAttrJson("o", "id"));
                $txtXPageName.val(re.buildAttrJson("o", "name"));
                var code = re.buildAttrJson("o", "att2");
                $tbCode.val(code.toString().split('-')[1]);
                if (type == "0") {
                    $tbMenuUrl.val(xListUrl);
                }
                else if (type == "1") {
                    $tbMenuUrl.val(xEditorUrl);
                }
                else if (type == "2") {
                    $tbMenuUrl.val(xSelectorUrl);
                }
                else if (type == "3") {
                    $tbMenuUrl.val(xPageUrl);
                }

            }
            return false;
        }

        //根据页面类型及是否自定义页面获取页面编号前缀
        function setCodePrefix() {
            var type = $ddlPageType.val();
            var isxpage = $rbtnIsXPage.find("input:checked").val();
            $.post("MenuEditor.aspx",
                 { asyfunc: "GetCodePrefix", Type: type, IsXpage: isxpage },
                 function (res) {
                     $("#<%=tbCodePrefix.ClientID %>").val(res);
                 })
        }

        $ddlPageType.live("change", function () {
            setCodePrefix();
            $hiPageXml.val("");
            $txtXPageName.val("");
            $hiXPageId.val("");

            if ($ddlPageType.val() == "2") {
                $tbCode.attr("req", "1");
            }
            else {
                $tbCode.removeAttr("req");
            }

            if ($ddlPageType.val() == "4") {
                $("#trMenuUrl").hide();
                $("#trXPageName").hide();
                $("#trIsXPage").hide();
                $("#trExp").show();
                $tbMenuUrl.val(aclPageUrl);
                $txtXPageName.removeAttr("req");
            }
            else {
                $("#trIsXPage").show();
                $("#trExp").hide();
                $tbMenuUrl.val("");
                menuPageType($rbtnIsXPage.find("input:checked").val(), false);
            }
        })


        $rbtnIsXPage.live("click", function () {
            setCodePrefix();
            menuPageType($rbtnIsXPage.find("input:checked").val(), true);
        })

        function menuPageType(type, isChange) {

            if (type == "0") {
                $("#trMenuUrl").show();
                $("#trXPageName").hide();
                $tbCode.removeAttr("readonly");
                $tbCode.css("background", "");
                $txtXPageName.removeAttr("req");
            }
            else {
                $("#trMenuUrl").hide();
                $("#trXPageName").show();
                $txtXPageName.attr("req", "1"); 
                setChoose();
            }
            if (isChange) {
                $tbMenuUrl.val("");
                $hiPageXml.val("");
                $txtXPageName.val("");
                $hiXPageId.val("");
            }
            hideCode();
        }

        function setChoose() {
            $("#<%=btnChoose.ClientID %>").unbind('click');
            $("#<%=btnChoose.ClientID %>").click(function () {
                var type = $ddlPageType.val();
                chooseXList(type);
                return false;
            })

        }
        function hideCode()
        { 
            //如果是门户管理模块，则编号不能填写，保存时根据页面名称生成编号 
            if ($("#<%=hiModuleId.ClientID%>").val()== "<%=PortalWebModuleId%>")
            {
                $tbCodePrefix.attr("readonly","readonly");
                $tbCode.attr("Readonly","True"); 
            }
        }
    </script>
</asp:Content>
