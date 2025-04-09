<%@ Page Title="磁贴管理" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    AutoEventWireup="true" CodeBehind="TileEditor.aspx.cs" Inherits="Zhongsoft.Portal.Metro.List.TileEditor" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%" class="tz-table">
        <tr>
            <td class="td-l">
                磁贴名称<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <input type="hidden" runat="server" id="hiTileID" field="TileID" tablename="PortalMetroTile" />
                <zhongsoft:LightTextBox runat="server" ID="tbTileName" CssClass="kpms-textbox" MaxLength="20"
                    req="1" field="TileName" tablename="PortalMetroTile" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                图标名称(小)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbIconSmall" CssClass="kpms-textbox" Style="width: 100%;
                                height: 16px;" MaxLength="100" req="1" field="ICON" tablename="PortalMetroTile"
                                activestatus="(23.*)">
                            </zhongsoft:LightTextBox>
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="lbtnGetIcon" OnClientClick="return GetIcon('s');"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
            <td class="td-l">
                图标名称(大)<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <zhongsoft:LightTextBox runat="server" ID="tbIconBig" CssClass="kpms-textbox" Style="width: 100%;
                                height: 16px;" MaxLength="100" req="1" field="TILEICON" tablename="PortalMetroTile"
                                activestatus="(23.*)">
                            </zhongsoft:LightTextBox>
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="LinkButton1" OnClientClick="return GetIcon('b');"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                跨行数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbRowNum" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="ROWSPAN" regex="^\d*$"
                    errmsg="只能填写非负整数" tablename="PortalMetroTile" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
            <td class="td-l">
                跨列数<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbColNum" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="COLSPAN" regex="^\d*$"
                    errmsg="只能填写非负整数" tablename="PortalMetroTile" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                类型
            </td>
            <td class="td-m" colspan="3">
                <asp:RadioButtonList ID="rblType" runat="server" req="1" AutoPostBack="True" RepeatDirection="Horizontal"
                    OnSelectedIndexChanged="rblType_SelectedIndexChanged" field="TILETYPE" tablename="PortalMetroTile">
                </asp:RadioButtonList>
            </td>
        </tr>
        <tr id="trList">
            <td class="td-l">
                页面路径<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <zhongsoft:LightObjectSelector runat="server" ID="selUrl" PageUrl="~/Custom/List/ListSelector.aspx"
                    SelectPageMode="Dialog" Filter="{'PageType':'0'}" ResultForControls="{'hiPageId':'id','hiViewId':'att3'}"
                    ResultAttr="name" AfterSelect="initUrl()" ShowJsonRowColName="true" activestatus="(23.*)" />
                <input type="hidden" runat="server" id="hiPageId" />
                <input type="hidden" runat="server" id="hiViewId" field="XVIEWID" tablename="PortalMetroTile" />
                <input type="hidden" runat="server" id="hiUrl" field="URL" tablename="PortalMetroTile" />
            </td>
        </tr>
        <tr id="trUrl">
            <td class="td-l">
                页面路径<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbUrl" MaxLength="256">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                打开方式<span class="req-star">*</span>
            </td>
            <td class="td-m">
                <asp:RadioButtonList runat="server" ID="RadioButtonList1" RepeatDirection="Horizontal"
                    field="TARGET" tablename="PortalMetroTile">
                    <asp:ListItem Value="_self" Selected="True">本页面</asp:ListItem>
                    <asp:ListItem Value="_blank">新窗口</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                展示项目编号
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbProjectCode" CssClass="kpms-textbox"
                    MaxLength="32" field="PROJECTCODE" tablename="PortalMetroTile" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                是否公开<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <asp:RadioButtonList runat="server" ID="rbtnPublic" RepeatDirection="Horizontal"
                    field="ISPUBLIC" tablename="PortalMetroTile">
                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                    <asp:ListItem Value="0">否</asp:ListItem>
                </asp:RadioButtonList>
            </td>
            <td class="td-l">
                排序<span class="req-star">*</span>
            </td>
            <td class="td-r">
                <zhongsoft:LightTextBox runat="server" ID="tbSort" CssClass="kpms-textbox" Width="40px"
                    MaxLength="3" req="1" Style="text-align: right" field="Sort" regex="^\d*$" errmsg="排序只能填写非负整数"
                    tablename="PortalMetroTile" activestatus="(23.*)">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr id="trAdmin" runat="server">
            <td class="td-l">
                模块管理员
            </td>
            <td class="td-m" colspan="3">
                <table cellpadding='0' cellspacing='0' width="85%">
                    <tr>
                        <td>
                            <input type="hidden" id="hiConsignerID" runat="server" field="MODULEADMINIDS" tablename="PortalMetro" />
                            <input type="text" runat="server" id="tbConsignUserName" readonly="readonly" class="kpms-textbox"
                                style="width: 100%; height: 16px;" field="MODULEADMINNAMES" tablename="PortalMetro" />
                        </td>
                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                            <asp:LinkButton runat="server" ID="btnonsignUse" OnClientClick="return GetUser();"
                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/look-up.gif"  style="padding:0px"/>
                            </asp:LinkButton>
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                扩展属性
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="lbExtendedAttribute" CssClass="kpms-textbox"
                    tablename="PortalMetroTile" field="ExtendedAttribute"
                    activestatus="(23.*)" MaxLength="1024">
                </zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                备注
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox runat="server" ID="tbMemo" TableName="PortalMetroTile" Field="Memo"
                    activestatus="(23.*)" CssClass="kpms-textarea" EnableTheming="false" TextMode="MultiLine"
                    Rows="3" MaxLength="1024"></zhongsoft:LightTextBox>
            </td>
        </tr>
    </table>
    <input type="hidden" runat="server" id="hiGroupId" field="GROUPID" tablename="PortalMetroTile" />
    <input type="hidden" runat="server" id="hiFlag" tablename="PortalMetroTile" field="Flag" />
    <script type="text/javascript">
        function initCustomerPlugin() {
            checkRegex();
            checkMaxLength();
            setDisplay();
        }
        function setDisplay() {
            var type = $("#<%=rblType.ClientID %>").find("input:checked").val();
            if (type != "4") {
                $("#trList").show();
                $("#trUrl").hide();
                $("#<%=selUrl.ClientID %>").attr("req", "1");
                $("#<%=tbUrl.ClientID %>").removeAttr("req");
            }
            else {
                $("#trList").hide();
                $("#trUrl").show();
                $("#<%=selUrl.ClientID %>").removeAttr("req");
                $("#<%=tbUrl.ClientID %>").attr("req", "1");
            }

        }
        $("#<%=rblType.ClientID %>").live("change", function () {
            setDisplay();
            $("#<%=selUrl.HiddenClientID %>").val("");
            $("#<%=selUrl.ClientID %>").val("");
            $("#<%=tbUrl.ClientID %>").val("");
        });

        //将页面地址与id拼接为url
        function initUrl() {
            var type = $("#<%=rblType.ClientID %>").find("input:checked").val();
            var url = $('#<%=selUrl.ClientID %>').val();
            if (type == "0" || type == "1" || type == "2") {
                if (type == "1") {
                    url = "/Custom/List/DispListNew.aspx"; //自定义列表
                }
                else if (type == "2") {
                    url = "/Custom/List/XChartPage.aspx"; //自定义图表
                }
                else if (type == "0") {
                    url = "/Custom/List/Dashboard.aspx"; //自定义仪表板
                }
                var listId = $('#<%=hiPageId.ClientID %>').val();
                if (listId != '') {
                    url += '?listId=' + listId;
                }
            }
            if (type == 3) {
                //系统页面，增加secid
                var secId = $('#<%=hiPageId.ClientID %>').val();
                if (secId != '') {
                    if (url.indexOf('?') > -1)
                        url += '&secid=' + secId;
                    else
                        url += '?secid=' + secId;
                }
            }
            $('#<%=hiUrl.ClientID %>').val(url);
            return false;
        }
        //选择人
        function GetUser() {
            var param = new InputParamObject("m");
            var users = getUsers("none", param, "");
            if (null != users) {
                var strid = "";
                var strname = "";
                var o = users.selectNodes("//o/@id");
                for (var i = 0; i < o.length; i++) {
                    strid += o[i].value + "|";
                }
                o = users.selectNodes("//o/@name");
                for (var i = 0; i < o.length; i++) {
                    strname += o[i].value + " ";
                }
                $("#<%=this.tbConsignUserName.ClientID %>").val(strname);
                $("#<%=this.hiConsignerID.ClientID %>").val(strid);
            }
            return false;
        }
        var flg = 's';
        function GetIcon(f) {
            flg = f;
            var url = buildQueryUrl("Metro/Obsolete/MetroIconSelector.aspx", { "IconType": "ModuleIcon" });
            showDivDialog(encodeURI(url), null, 1000, 600, afterParamFilter);
            return false;
        }
        function afterParamFilter(re) {
            if (flg == "s") {
                $("#<%=tbIconSmall.ClientID %>").val(re);
            }
            else {
                $("#<%=tbIconBig.ClientID %>").val(re);
            }
            return false;
        }
    </script>
</asp:Content>
