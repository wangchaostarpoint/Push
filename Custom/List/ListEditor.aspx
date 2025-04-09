<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="自定义列表" CodeBehind="ListEditor.aspx.cs" Inherits="Zhongsoft.Portal.Custom.List.ListEditor" %>

<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBtn" runat="server">
    <div class="subtoolbarbg">
        <asp:LinkButton runat="server" ID="btnView" CssClass="subtoolbarlink" OnClientClick="return viewForm()"
            DisplayStatus="(3.*)" EnableTheming="false"><span><img  src="../../Themes/Images/btn-preview.png" width="16" height="16" />预览</span></asp:LinkButton>
        <asp:LinkButton runat="server" ID="btnViewNew" CssClass="subtoolbarlink" OnClientClick="return viewNewForm()"
            DisplayStatus="(3.*)" EnableTheming="false"><span><img  src="../../Themes/Images/btn-preview.png" width="16" height="16" />预览新版</span></asp:LinkButton></div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <style>
        .connectedSortable, .connectedGroupable
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
            float: left;
            margin-right: 10px;
            background: #eee;
            padding: 5px;
            width: 400px;
            min-height: 60px;
            height: auto;
        }
        
        .connectedSortable li, .connectedGroupable li
        {
            margin: 5px;
            padding: 5px;
            font-size: 1.2em;
            min-height: 20px;
            width: 300px;
            line-height: 20px;
        }
        
        
        .connectedFilterable
        {
            list-style-type: none;
            margin: 0;
            padding: 0;
            float: left;
            margin-right: 10px;
            background: #eee;
            padding: 5px;
            width: 400px;
            min-height: 60px;
            height: auto;
        }
        .connectedFilterable li
        {
            margin: 5px;
            padding: 5px;
            font-size: 1.2em;
            min-height: 18px;
            width: 300px;
            line-height: 20px;
        }
        #sortContainer li
        {
            display: block;
            margin: 0 3px 3px 3px;
            padding: 2px;
            padding-left: 2px;
            font-size: 14px;
            height: 18px;
            width: 340px;
            text-indent: 20px;
        }
        #sortContainer li span
        {
            position: absolute;
        }
        .ui-tabs-vertical
        {
            width: 100%;
        }
        .ui-tabs-vertical .ui-tabs-nav
        {
            float: left;
            width: 14%;
        }
        .ui-tabs-vertical .ui-tabs-panel
        {
            float: right;
            width: 82%;
        }
        .ui-tabs-vertical .ui-tabs-nav li
        {
            clear: left;
            border-bottom-width: 1px !important;
            border-right-width: 1 !important;
            width: 100%;
        }
        .ui-tabs-vertical .ui-tabs-nav li a
        {
            display: block;
            width: 100%;
        }
        .ui-tabs-vertical .ui-tabs-nav li.ui-tabs-active
        {
            border-right-width: 1px;
            border-right-width: 1px;
        }
    </style>
    <asp:ScriptManager ID="ScriptManager1" runat="server">
    </asp:ScriptManager>
    <div id="templateTabs">
        <ul>
            <li index="0"><a href='#base'>基本信息</a></li>
            <li index="1"><a href='#list'>功能设置</a></li>
            <li index="2"><a href='#sort'>排序筛选</a></li>
        </ul>
        <div id="base">
            <input type="hidden" runat="server" id="hiExpression" field="Expression" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiViewName" field="ViewName" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiViewId" field="ViewId" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsPublic" field="IsPublic" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsBaseView" field="IsBaseView" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiIsDefaultView" field="IsDefaultView" tablename="BD_View" />
            <input type="hidden" runat="server" id="hiListId" field="ListId" tablename="BD_View" />
            <asp:UpdatePanel ID="UpdatePanel2" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="tz-title" colspan="4">
                                <div style="white-spacing: nowrap; line-height: 23px; height: 23px; vertical-align: middle">
                                    基本信息</div>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                名称<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <input type="text" runat="server" id="txtViewName" class="kpms-textbox" activestatus="(23.*)"
                                    reqmsg="请填写列表名称。" reqtabid="templateTabs" reqtabindex="0" req="1" maxlength="50"
                                    style="width: 200px" />
                                <asp:Button ID="btnSelect" runat="server" Text="选择" OnClick="btnSelect_Click" ActiveStatus="(23.*)"
                                    Style="display: none" />
                                <input type="hidden" runat="server" id="hiRedIds" />
                            </td>
                            <td class="td-l">
                                编号<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <input type="hidden" runat="server" id="hiListCode" />
                                <zhongsoft:LightTextBox runat="server" ID="tbCodePrefix" Width="95px" ReadOnly="true"
                                    req="1">
                                </zhongsoft:LightTextBox>
                                <zhongsoft:LightTextBox runat="server" ID="tbCode" Width="195px" DataType="EnNumStr"
                                    MaxLength="20" req="1">
                                </zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                公用<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rblIsPublic" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                默认视图<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rblIsDefault" runat="server" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr flag="hide" id="trMainTable">
                            <td class="td-l">
                                列表主表<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlMainTableCode" req="1" Width="200px"
                                    ActiveStatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="ddlMainTableCode_Change">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                                默认排序字段<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSort" Width="145px" ActiveStatus="(23.*)"
                                    req="1">
                                </zhongsoft:LightDropDownList>
                                <zhongsoft:LightDropDownList runat="server" ID="ddlSortDirection" ActiveStatus="(23.*)"
                                    Width="50px">
                                    <asp:ListItem Value="ASC">升序</asp:ListItem>
                                    <asp:ListItem Value="DESC">降序</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                每页显示行数<span class="req-star">*</span>
                            </td>
                            <td class="td-m">
                                <zhongsoft:LightDropDownList runat="server" ID="ddlPageSize" ActiveStatus="(23.*)"
                                    Width="200px">
                                </zhongsoft:LightDropDownList>
                            </td>
                            <td class="td-l">
                            </td>
                            <td class="td-m">
                                <asp:LinkButton runat="server" ID="btnDataSet" OnClientClick="return setDataSet();"
                                    OnClick="btnDataSet_Click" Visible="false" ActiveStatus="(3.*)"><span>配置数据集</span></asp:LinkButton>
                            </td>
                        </tr>
                    </table>
                    <table class="tz-table">
                        <tr>
                            <td class="tz-title">
                                显示设置
                                <asp:LinkButton runat="server" ID="lbtnSort" OnClientClick="return showSort();" ActiveStatus="(3.*)"><span>列排序</span></asp:LinkButton>
                                <asp:Button ID="btnSortHide" runat="server" Text="Button" OnClick="btnSortHide_Click"
                                    Visible="false" />
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <zhongsoft:LightPowerGridView ID="gvList" runat="server" AutoGenerateColumns="False"
                                    OnAddData="gvList_AddClick" FrozenWidth="1035" FrozenHeight="280px" Width="1015"
                                    AllowFrozing="true" UseDefaultDataSource="true" OnRowCommand="gvList_RowCommand"
                                    OnRowDataBound="gvList_RowDataBound">
                                    <Columns>
                                        <asp:TemplateField HeaderText="显示" HeaderStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbVisible" flag="visible" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="类型" HeaderStyle-Width="70px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:CheckBox runat="server" ID="cbIsFromDataSet" Visible="false" />
                                                <asp:DropDownList runat="server" ID="ddlFieldType" req="1" flag='fieldtype'>
                                                </asp:DropDownList>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="显示名称" HeaderStyle-Width="150px">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="tbName" Text='<%#Eval("HeaderText") %>' MaxLength="50"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="编号" HeaderStyle-Width="200px">
                                            <ItemTemplate>
                                                <input type="text" runat="server" id="tbDispCode" class="kpms-textbox" req="1" value='<%#Eval("DispCode") %>'
                                                    flag="dispcode" />
                                                <input type="hidden" runat="server" id="hiSort" value='<%#Eval("SortExpression") %>' />
                                                <input type="hidden" runat="server" id="hiDataField" value='<%#Eval("DataField") %>' />
                                                <input type="hidden" runat="server" id="hiFormat" value='<%#Eval("DataFormatString") %>' />
                                                <input type="hidden" runat="server" id="hiAggregateType" />
                                                <input type="hidden" runat="server" id="hiFieldParam" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="数据类型" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:Label runat="server" ID="lblType" Text='<%#Eval("Type") %>' Style="display: none"></asp:Label>
                                                <asp:Label runat="server" ID="lblTypeName"></asp:Label>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="列宽" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="tbWidth" Text='<%#Eval("Width") %>' Width="40px"
                                                    regex="^\d*$" errmsg="列宽只能填写非负整数" MaxLength="4" ActiveStatus="(23.*)" Style="text-align: right"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="长度" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <asp:TextBox runat="server" ID="tbMaxLength" Text='<%#Eval("MaxLength") %>' Width="40px"
                                                    regex="^\d*$" errmsg="长度只能填写非负整数" MaxLength="4" ActiveStatus="(23.*)" Style="text-align: right"></asp:TextBox>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="对齐方式" HeaderStyle-Width="50px">
                                            <ItemTemplate>
                                                <zhongsoft:LightDropDownList runat="server" ID="ddlAlign" ActiveStatus="(23.*)" />
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="设置" HeaderStyle-Width="80px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <input type="hidden" runat="server" id="hiConverter" flag="color" />
                                                <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetConverter" ToolTip="数据转换"
                                                    flag="convert" Text="转换">
                                                </asp:LinkButton>
                                                <input type="hidden" runat="server" id="hiDrilling" flag="color" />
                                                <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetDrilling" ToolTip="数据钻取"
                                                    flag="drilling" Text="钻取">
                                                </asp:LinkButton>
                                                <input type="hidden" runat="server" id="hiAction" flag="color" />
                                                <asp:LinkButton runat="server" EnableTheming="false" ID="btnSetAction" ToolTip="功能设置"
                                                    flag="action" Text="功能">
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                        <asp:TemplateField HeaderText="删除" HeaderStyle-Width="30px" ItemStyle-HorizontalAlign="Center">
                                            <ItemTemplate>
                                                <asp:LinkButton ID="btnDelete" runat="server" CommandName="DeleteData" EnableTheming="false">
					                           	<img   src="../../Themes/Images/btn_dg_delete.gif" onclick="return confirm('确定删除？')" />
                                                </asp:LinkButton>
                                            </ItemTemplate>
                                        </asp:TemplateField>
                                    </Columns>
                                </zhongsoft:LightPowerGridView>
                            </td>
                        </tr>
                    </table>
                    <div id="sortDialog" style="display: none;">
                        <ul id="sortContainer">
                        </ul>
                    </div>
                    <input runat="server" type="hidden" id="hiSort" />
                </ContentTemplate>
                <Triggers>
                    <asp:PostBackTrigger ControlID="btnDataSet" />
                </Triggers>
            </asp:UpdatePanel>
        </div>
        <div id="list">
            <asp:UpdatePanel ID="UpdatePanel5" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr runat="server" id="trFrozen">
                            <td class="td-l">
                                冻结
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rblAllowFrozing" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-m" colspan="2">
                                <table id="tbFrozen" style="display: none">
                                    <tr>
                                        <td>
                                            冻结列数
                                        </td>
                                        <td style="width: 90px">
                                            <asp:TextBox runat="server" ID="tbFrozenColNum" regex="^\d*$" errmsg="冻结列数只能填写非负整数。"
                                                Style="text-align: right" CssClass="kpms-textbox" Width="80px"></asp:TextBox>
                                        </td>
                                        <td>
                                            冻结高度
                                        </td>
                                        <td style="width: 90px">
                                            <asp:TextBox runat="server" ID="tbFrozenHeight" regex="^(([1-9]\d{2})|1000)$" errmsg="冻结高度只能填写100至1000间的整数。"
                                                Style="text-align: right" CssClass="kpms-textbox" Width="80px"></asp:TextBox>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td class="td-l">
                                树形展示
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rbtlTree" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-m" colspan="2">
                                <table id="tbTree" style="display: none">
                                    <tr>
                                        <td>
                                            父级字段
                                        </td>
                                        <td style="width: 90px">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlParent" Width="84px" reqmsg="请填写父级字段。"
                                                reqtabid="templateTabs" reqtabindex="1">
                                            </zhongsoft:LightDropDownList>
                                        </td>
                                        <td>
                                            子级字段
                                        </td>
                                        <td style="width: 90px">
                                            <zhongsoft:LightDropDownList runat="server" ID="ddlSelf" Width="84px" reqmsg="请填写子级字段。"
                                                reqtabid="templateTabs" reqtabindex="1">
                                            </zhongsoft:LightDropDownList>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td class="td-l">
                                显示全选列
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rbtlShowCheckField" runat="server" ActiveStatus="(23.*)"
                                    RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                            <td class="td-l">
                                显示导出按钮
                            </td>
                            <td class="td-m">
                                <asp:RadioButtonList ID="rbtlShowExport" runat="server" ActiveStatus="(23.*)" RepeatDirection="Horizontal">
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                    <asp:ListItem Value="1" Selected="True">是</asp:ListItem>
                                </asp:RadioButtonList>
                            </td>
                        </tr>
                        <tr flag="hide">
                            <td class="td-l">
                                默认过滤
                            </td>
                            <td class="td-m" colspan="3">
                                <table cellpadding='0' cellspacing='0' width="80%">
                                    <tr>
                                        <td>
                                            <asp:TextBox runat="server" ID="tbDefaultFilter" Height="16px" ReadOnly="true" Width="100%"
                                                CssClass="kpms-textbox"></asp:TextBox>
                                        </td>
                                        <td valign='middle' style='width: 19px; padding-left: 2px'>
                                            <asp:LinkButton runat="server" ID="btnSetFilter" OnClientClick="return setDefaultFilter();"
                                                Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                OnClick="btnSetFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                            </asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </td>
                        </tr>
                        <tr>
                            <td class="td-l">
                                默认过滤说明
                            </td>
                            <td class="td-m" colspan="3">
                                <zhongsoft:LightTextBox runat="server" ID="tbFilterMemo" ActiveStatus="(23.*)" Style="width: 80%"></zhongsoft:LightTextBox>
                            </td>
                        </tr>
                        <tr>
                            <tr>
                                <td class="td-l">
                                    综合查询
                                </td>
                                <td class="td-m" colspan="3">
                                    <table cellpadding='0' cellspacing='0' width="80%">
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="tbIntegratedFilter" Height="16px" ReadOnly="true"
                                                    Width="100%" CssClass="kpms-textbox"></asp:TextBox>
                                            </td>
                                            <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                <asp:LinkButton runat="server" ID="btnSetCondition" OnClientClick="return setIntegratedFilter();"
                                                    Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                    OnClick="btnSetCondition_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    接收参数
                                </td>
                                <td class="td-m" colspan="3">
                                    <table cellpadding='0' cellspacing='0' width="80%">
                                        <tr>
                                            <td>
                                                <input type="hidden" runat="server" id="hiParam" />
                                                <asp:TextBox runat="server" ID="tbParam" Height="16px" ReadOnly="true" Width="100%"
                                                    CssClass="kpms-textbox"></asp:TextBox>
                                            </td>
                                            <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                <asp:LinkButton runat="server" ID="btnParam" OnClick="btnParam_Click" OnClientClick="return setParam();"
                                                    Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    参数过滤
                                </td>
                                <td class="td-m" colspan="3">
                                    <table cellpadding='0' cellspacing='0' width="80%">
                                        <tr>
                                            <td>
                                                <asp:TextBox runat="server" ID="tbParamFilter" Height="16px" ReadOnly="true" Width="100%"
                                                    CssClass="kpms-textbox"></asp:TextBox>
                                            </td>
                                            <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                <asp:LinkButton runat="server" ID="btnParamFilter" OnClientClick="return setParamFilter();"
                                                    Style="height: 18px; width: 20px; padding: 0px" CssClass="btn-look-up" EnableTheming="false"
                                                    OnClick="btnParamFilter_Click"><img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    字典基本功能
                                </td>
                                <td class="td-m" colspan="3">
                                    <asp:CheckBoxList runat="server" ID="cbAuthority" RepeatDirection="Horizontal">
                                        <asp:ListItem Value="Read">查看</asp:ListItem>
                                        <asp:ListItem Value="Create">新建</asp:ListItem>
                                        <asp:ListItem Value="Update">编辑</asp:ListItem>
                                        <asp:ListItem Value="Delete">删除</asp:ListItem>
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    编辑页面
                                </td>
                                <td class="td-m" colspan="3">
                                    <table cellpadding='0' cellspacing='0' width="80%">
                                        <tr>
                                            <td>
                                                <input type="hidden" runat="server" id="hiDialogPage" />
                                                <zhongsoft:XHtmlInputText type="text" ID="txtDialogPage" runat="server" readonly="readonly"
                                                    style="width: 100%" MaxLength="250" class="kpms-textbox">
                                                </zhongsoft:XHtmlInputText>
                                            </td>
                                            <td valign='middle' style='width: 19px; padding-left: 2px'>
                                                <asp:LinkButton runat="server" ID="btnDialogPage" OnClientClick="return setDialogPage();"
                                                    OnClick="btnDialogPage_Click" Style="height: 18px; width: 20px; padding: 0px"
                                                    CssClass="btn-look-up" EnableTheming="false">
                                <img  src="../../Themes/Images/btn_fx.png"  style="padding:0px"/>
                                                </asp:LinkButton>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    删除插件
                                </td>
                                <td class="td-m" colspan="3">
                                    <input type="hidden" runat="server" id="hiPluginId" />
                                    <zhongsoft:LightObjectSelector runat="server" ID="lbsPlugin" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                                        SelectPageMode="Dialog" Width="80%" ResultAttr="name" ResultForControls="{'hiPluginId':'id'}"
                                        activestatus="(23.*)" />
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    汇总描述插件
                                </td>
                                <td class="td-m" colspan="3">
                                    <input type="hidden" runat="server" id="hiListMemoPluginId" />
                                    <zhongsoft:LightObjectSelector runat="server" ID="lbsListMemoPlugin" PageUrl="~/Sys/Plugins/PluginSelector.aspx"
                                        SelectPageMode="Dialog" Width="80%" ResultAttr="name" ResultForControls="{'hiListMemoPluginId':'id'}"
                                        activestatus="(23.*)" />
                                </td>
                            </tr>
                            <tr flag="hide">
                                <td class="td-l">
                                    主表自定义功能
                                </td>
                                <td class="td-m" colspan="3">
                                    <asp:CheckBoxList runat="server" ID="cbActions" RepeatDirection="Horizontal">
                                    </asp:CheckBoxList>
                                </td>
                            </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
            <asp:UpdatePanel ID="UpdatePanel1" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td class="tz-title" flag="fixed" colspan="2">
                                功能按钮设置
                                <asp:LinkButton runat="server" ID="lbtnAddRibbonMenu" OnClientClick="addRibbonMenu()"
                                    OnClick="lbtnAddRibbonMenu_Click">
                                <span>增加</span></asp:LinkButton>
                                <input type="hidden" runat="server" id="hiNewRibbon" />
                            </td>
                            <td class="tz-title" flag="fixed" colspan="2">
                                固定过滤按钮设置
                                <asp:LinkButton runat="server" ID="lbtnAddFixedFilter" OnClientClick="addFixedFilter()"
                                    OnClick="lbtnAddFixedFilter_Click">
                                <span>增加</span></asp:LinkButton>
                                <input type="hidden" runat="server" id="hiNewFilter" />
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; vertical-align: top" flag="fixed" colspan="2">
                                <input type="hidden" runat="server" id="hiRibbonMenuJsons" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="ribbonTable" class="connectedGroupable">
                                    </ul>
                                </div>
                            </td>
                            <td style="width: 50%; vertical-align: top" flag="fixed" colspan="2">
                                <input type="hidden" runat="server" id="hiFixedFilterJsons" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="fixedTable" class="connectedGroupable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <div id="sort">
            <asp:UpdatePanel ID="UpdatePanel3" UpdateMode="Conditional" runat="server">
                <ContentTemplate>
                    <table class="tz-table">
                        <tr>
                            <td colspan="2" class="tz-title">
                                排序字段
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; vertical-align: top">
                                <input type="hidden" runat="server" id="hiSortFields" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="sortable1" class="connectedSortable">
                                    </ul>
                                </div>
                            </td>
                            <td style="width: 60%; vertical-align: top">
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="sortable2" class="connectedSortable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="tz-title">
                                筛选字段
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 40%; vertical-align: top">
                                <input type="hidden" runat="server" id="hiFilterFields" />
                                <input type="hidden" runat="server" id="hiFilterJsons" />
                                <input type="hidden" runat="server" id="hiNoFilterFields" />
                                <input type="hidden" runat="server" id="hiNoFilterJsons" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="filterable1" class="connectedFilterable">
                                    </ul>
                                </div>
                            </td>
                            <td style="width: 60%; vertical-align: top">
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="filterable2" class="connectedFilterable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                        <tr>
                            <td class="tz-title" colspan="2">
                                分组排序
                            </td>
                        </tr>
                        <tr>
                            <td style="width: 50%; vertical-align: top" colspan="2">
                                <input type="hidden" runat="server" id="hiGroupFields" />
                                <div style="width: 400px; max-height: 230px; overflow-y: auto; overflow-x: hidden">
                                    <ul runat="server" id="groupable2" class="connectedGroupable">
                                    </ul>
                                </div>
                            </td>
                        </tr>
                    </table>
                </ContentTemplate>
            </asp:UpdatePanel>
        </div>
        <input type="hidden" runat="server" id="hiOpenPage" />
        <input type="hidden" runat="server" id="hiIntegratedFilter" />
        <input type="hidden" runat="server" id="hiDefaultFilter" />
        <input type="hidden" runat="server" id="hiParamFilter" />
        <input type="hidden" runat="server" id="hiIsQuickView" field="ISQUICKVIEW" tablename="BD_View" />
        <span style='margin-right: 4px; display: none'>
            <input type='checkbox' /></span>
    </div>
    <script>

        function showSort() {
            var container = $("#sortContainer");
            container.html("");
     
            $("#<%=gvList.ClientID %> [sortmark]").each(function (i) {
                    container.append("<li sortmark=" + $(this).attr("sortmark") + " class='ui-state-default'><span class='ui-icon ui-icon-arrowthick-2-n-s'></span>" + $(this).val() + "</li>");
            });
            container.sortable({
                items: "li:not(.ui-state-disabled)",
                placeholder: "ui-state-highlight"
            });
            $("#sortDialog").dialog({
                title: "列排序",
                height: 400,
                width: 600,
                modal: true,
                buttons: {
                    "确定": function () {
                        $(this).dialog("close");
                        var sortMark = "";
                        $("#sortContainer li").each(function () {
                            sortMark += $($(this)).attr("sortmark") + "|";
                        });
                        $("#<%=hiSort.ClientID %>").val(sortMark);
                        <%=Page.GetPostBackEventReference(this.btnSortHide,"") %>;
                    },
                    "取消": function () {
                        $(this).dialog("close");
                    }
                }
            });
            return false;
        }

        function setDispCode(tbid) {
            var dispcode = $("#" + tbid).val();
            if (dispcode == "") {
                $("#" + tbid).val($("#" + tbid).attr('code'));
                alert("编号不能为空。");
                return;
            }
            else {
                var hasexist = false;
                $("#<%=gvList.ClientID%> [flag='dispcode']").each(function () {
                    var id = $(this).attr('id');
                    if (id != tbid) {
                        if ($(this).val() == dispcode) {
                            $("#" + tbid).val($("#" + tbid).attr('code'));
                            hasexist = true;
                            alert("编号不能重复。");
                            return;
                        }
                    }
                })
                if (!hasexist) {
                    $("#" + tbid).attr('code', dispcode)
                }
            }
        }

        function setBtnDisplay(ddlid, convertid, drillingid, actionid) {
            var type = $("#" + ddlid).val();
            if (type == "Normal") {
                $("#" + convertid).show();
                $("#" + drillingid).show();
                $("#" + actionid).hide();
            }
            else if (type == "Action") {
                $("#" + convertid).hide();
                $("#" + drillingid).hide();
                $("#" + actionid).show();
            }
        }

        function setDataConverter(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", { Convert: "1", ListId: "<%=ListId %>" });
            var re = showModal(encodeURI(url), json, 600, 300);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }

            return false
        }

        function setDataDrilling(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", { ListId: "<%=ListId %>", DialogType: "DataDrilling", ViewCol: "1" });
            var re = showModal(encodeURI(url), json, 600, 300);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }
            return false
        }

        function setAction(hiid, selfid) {
            var json = $("#" + hiid).val();
            var url = buildQueryUrl("Custom/List/ActionEditor.aspx", { ListId: "<%=ListId %>", ViewCol: "1" });
            var re = showModal(encodeURI(url), json, 600, 460);
            if (checkReturn(re)) {
                $("#" + hiid).val(re);
                if (re != "") {
                    $("#" + selfid).css("color", "blue");
                }
                else {
                    $("#" + selfid).css("color", "");
                }
            }
            return false
        }

        function setDataSet() {
            if ("<%=ActionType %>" != "Update") {
                alert("请先保存列表基本信息，再配置数据集。");
                return false;
            }
            var listId = $("#<%=hiListId.ClientID %>").val();
            var fullyCustom = parseBool("<%=IsCustom %>") ? "1" : "0";
            var json = { IsCustom: fullyCustom,PageNamespace:"<%=PageNamespace %>" };
            var url = buildBizUrl(3, listId, "bdm/list/BDDataSetEditor.aspx", json);
            showDivDialog(encodeURI(url), null, 1000, 580,afterDataSet);
            return false;
        }

        function afterDataSet(){
          <%=Page.GetPostBackEventReference(this.btnDataSet,"") %>;
        }

        function setParam() {
            var ps = $("#<%=hiParam.ClientID %>").val();
            var url =buildQueryUrl("Custom/List/ParamEditor.aspx",null);
            showDivDialog(encodeURI(url), ps, 550, 350,afterParam);
            return false;
        }

        function afterParam(re){
          $("#<%=hiParam.ClientID %>").val(re);
          <%=Page.GetPostBackEventReference(this.btnParam,"") %>;
        }

        function setParamFilter() {
            var xml = $("#<%=hiParamFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "ParamFilter", "DataSetId": "<%=ListId%>", "ViewType": "XList", "ViewId": "<%=BusinessObjectId%>" });
            showDivDialog(encodeURI(url), xml, 900, 400,afterParamFilter);
            return false;
        }

        function afterParamFilter(re){
           $("#<%=hiParamFilter.ClientID %>").val(re);
            <%=Page.GetPostBackEventReference(this.btnParamFilter,"") %>;
        }

        function setDefaultFilter() {
            var xml = $("#<%=hiDefaultFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "DefaultFilter", "DataSetId": "<%=ListId%>" });
            showDivDialog(encodeURI(url), xml, 900, 400,afterDefaultFilter);
            return false;
        }

         function afterDefaultFilter(re){
           $("#<%=hiDefaultFilter.ClientID %>").val(re);
            <%=Page.GetPostBackEventReference(this.btnSetFilter,"") %>;
        }

        function setIntegratedFilter() {
            var xml = $("#<%=hiIntegratedFilter.ClientID %>").val();
            var url = buildQueryUrl("Sys/ConditionEditor.aspx", { "ExpType": "IntegratedFilter", "DataSetId": "<%=ListId%>" });
            showDivDialog(encodeURI(url), xml, 900, 400,afterIntegratedFilter);
            return false;
        }

        function afterIntegratedFilter(re){
           $("#<%=hiIntegratedFilter.ClientID %>").val(re);
            <%=Page.GetPostBackEventReference(this.btnSetCondition,"") %>;
        }


        function checkForm() {
            getSortFields();
            getFilterFields();
            getGroupFields();

            getFixedFilters();

            getRibbonMenus();

            return true;
        }

        function checkTabs(ui) {
            $('#<%=hiOpenPage.ClientID %>').val($(ui.newTab).attr("index"));
            if ($(ui.newTab).attr("index") == "0") {
                //回发之前记录必填标红控件
                var ctrls=$("#base").find('.kpms-textboxred');
                var array=new Array();
                for (var i = 0; i < ctrls.length; i++) {
                  array.push(ctrls.eq(i).attr('id'));
                }
                if(array.length>0)
                {
                  $("#<%=hiRedIds.ClientID%>").val(JSON.stringify(array));
                }
                getSortFields();
                getFilterFields();
                getGroupFields();

                <%=Page.GetPostBackEventReference(this.btnSelect,"") %>;
            }
        }
        
         $("#<%=rblAllowFrozing.ClientID%>").live("click", function () {
          if ($(this).find("input:checked").val() == "1") {
             $("#tbFrozen").show();
          }
            else {
             $("#tbFrozen").hide();
            }
         })
        $("#<%=rbtlTree.ClientID%>").live("click", function () {
            if ($(this).find("input:checked").val() == "1") {
                $("#tbTree").show();
                $("#<%=ddlParent.ClientID%>").attr("req", "1");
                $("#<%=ddlSelf.ClientID%>").attr("req", "1");
            }
            else {
               $("#tbTree").hide();
                $("#<%=ddlParent.ClientID%>").removeAttr("req");
                $("#<%=ddlSelf.ClientID%>").removeAttr("req");
            }
        })

        function setBtnColorAndDisplay() {
            $("#<%=gvList.ClientID%> input[flag='color']").each(function () {
                if ($(this).val() == "") {
                    $(this).next().css("color", "");
                }
                else {
                    $(this).next().css("color", "blue");
                }
            })
            $converts = $("#<%=gvList.ClientID%> [flag='convert']");
            $drillings = $("#<%=gvList.ClientID%> [flag='drilling']");
            $actions = $("#<%=gvList.ClientID%> [flag='action']");
            $("#<%=gvList.ClientID%> [flag='fieldtype']").each(function (i) {
                if ($(this).val() == "Normal") {
                    $converts.eq(i).show();
                    $drillings.eq(i).show();
                    $actions.eq(i).hide();
                }
                else {
                    $converts.eq(i).hide();
                    $drillings.eq(i).hide();
                    $actions.eq(i).show();
                }
            })
        }

        function initCustomerPlugin() {
            var $tab1 = $('#templateTabs').tabs({ activate: function (event, ui) { return checkTabs(ui); },
                                                  beforeActivate: function( event, ui ) {  return checkTabs(ui);}
                                                  });
           
            var index = $('#<%=hiOpenPage.ClientID %>').val();
            if (index != "") {
                $tab1.tabs("option", "active", index);
            }
            var redIds= $("#<%=hiRedIds.ClientID%>").val();
            if(redIds!=""){//回发之后设置必填标红控件
             var array=jQuery.parseJSON(redIds);
             for(var i=0;i<array.length;i++){
                $("#"+array[i]).addClass("kpms-textboxred");
             }
             $("#<%=hiRedIds.ClientID%>").val("");
            }

             if ($("#<%=rblAllowFrozing.ClientID%>").find("input:checked").val() == "1") {
                  $("#tbFrozen").show();}
                else{
                   $("#tbFrozen").hide();
                   }
               

            if ($("#<%=rbtlTree.ClientID%>").find("input:checked").val() == "1") {
                $("#tbTree").show();
                $("#<%=ddlParent.ClientID%>").attr("req", "1");
                $("#<%=ddlSelf.ClientID%>").attr("req", "1");
            }
            else {
                $("#tbTree").hide();
                $("#<%=ddlParent.ClientID%>").removeAttr("req");
                $("#<%=ddlSelf.ClientID%>").removeAttr("req");
            }

            if (!parseBool("<%=IsCustom%>") || !parseBool("<%=IsBaseView%>")) {
                $("tr[flag='hide']").hide();
                $("#<%=ddlSort.ClientID %>").removeAttr('req');
                $("#<%=ddlMainTableCode.ClientID %>").removeAttr('req');
            }
            else {
                if ($("#<%=ddlMainTableCode.ClientID %>").find("option").length == 0) {
                    $("#trMainTable").hide();
                }
                else {
                    $("#trMainTable").show();
                }
            }
            setBtnColorAndDisplay();
            $("#<%=sortable1.ClientID %>,#<%=sortable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedSortable",
                placeholder: "ui-state-highlight",
                stop: function (eb, ui) {
                    if ($(ui.item).parent().attr('id') == "<%=sortable2.ClientID %>"
                     && $(ui.item).find('.ui-icon-circle-close').length == 0) {
                        var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                            deleteSelectLi(this, "<%=sortable1.ClientID %>");
                        });
                        $(ui.item).append(removeButton);
                    }
                    else if ($(ui.item).parent().attr('id') == "<%=sortable1.ClientID %>") {
                        $(ui.item).find('.ui-icon-circle-close').remove();
                    };
                    getSortFields();
                }
            }).disableSelection();

            $("#<%=groupable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedGroupable",
                placeholder: "ui-state-highlight",
                stop: function (eb, ui) {
                    getGroupFields();
                }
            }).disableSelection();

            $("#<%=filterable1.ClientID %>, #<%=filterable2.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                connectWith: ".connectedFilterable",
                placeholder: "ui-state-highlight",
                stop: function (ev, ui) {
                    if ($(ui.item).parent().attr('id') == "<%=filterable2.ClientID %>"
                     && $(ui.item).find('.ui-icon-circle-close').length == 0) {
                        var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                            deleteSelectLi(this, "<%=filterable1.ClientID %>");
                        });
                        $(ui.item).append(removeButton);
                    }
                    else if ($(ui.item).parent().attr('id') == "<%=filterable1.ClientID %>") {
                        $(ui.item).find('.ui-icon-circle-close').remove();
                    };
                    getFilterFields()
                }
            }).disableSelection();

            $("#<%=fixedTable.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                //connectWith唯一
                connectWith: ".connectedFilterable1",
                placeholder: "ui-state-highlight",
                stop: function (ev, ui) {
                    var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                        var parentLi = $(this).parent();
                        $(this).remove();
                        parentLi.remove();
                    });
                    
                    getFixedFilters()
                }
            }).disableSelection();

            $("#<%=ribbonTable.ClientID %>").sortable({
                items: "li:not(.ui-state-disabled)",
                //connectWith唯一
                connectWith: ".connectedFilterable2",
                placeholder: "ui-state-highlight",
                stop: function (ev, ui) {
                    var removeButton = $("<div class='ui-icon ui-icon-circle-close' title='删除'></div>").click(function () {
                        var parentLi = $(this).parent();
                        $(this).remove();
                        parentLi.remove();
                    });
                    
                    getRibbonMenus();
                }
            }).disableSelection();

            $("#<%=sortable2.ClientID %>").find("select").live("change", function () {
                getSortFields();
            })
            checkRegex();
            getSortFields();
            getFilterFields();
            getGroupFields();
            
            getFixedFilters();

            getRibbonMenus();

          
            initFixedFilter();
        }

        function initFixedFilter() {
            if(!parseBool("<%=IsBaseView%>")) {
                //只有基础视图，设置固定筛选按钮/功能按钮
                $("[flag='fixed']").hide();
            }
        }


        function getSortFields() {
            var sordfileds = '';
            $("#<%=sortable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + "|";
                sordfileds += $(this).find("select").val() + ";";

            })
            $("#<%=hiSortFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
        }

        function getGroupFields() {
            var groupfileds = '';
            $("#<%=groupable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                groupfileds += $(this).find("input[type='hidden']").val() + ";";
            });
            $("#<%=hiGroupFields.ClientID %>").val(groupfileds.substr(0, groupfileds.length - 1));
        }

        function getFixedFilters() {
            var fixedFilters='';
            var arry = new Array();
            $("#<%=fixedTable.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiFixedFilterJsons.ClientID %>").val(JSON.stringify(arry));
        }

        function getRibbonMenus() {
            var ribbonMenus='';
            var arry = new Array();
            $("#<%=ribbonTable.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiRibbonMenuJsons.ClientID %>").val(JSON.stringify(arry));
        }

        function getFilterFields() {
            var sordfileds = '';
            var arry = new Array();
            $("#<%=filterable2.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + ";";
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiFilterFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
            $("#<%=hiFilterJsons.ClientID %>").val(JSON.stringify(arry));

            sordfileds = '';
            arry = new Array();
            $("#<%=filterable1.ClientID %>").find('li:not(.ui-state-disabled)').each(function () {
                sordfileds += $(this).find("input[type='hidden']").val() + ";";
                arry.push($(this).find("[flag='json']").attr("json"));
            })

            $("#<%=hiNoFilterFields.ClientID %>").val(sordfileds.substr(0, sordfileds.length - 1));
            $("#<%=hiNoFilterJsons.ClientID %>").val(JSON.stringify(arry));
        }

        //删除选中的排序或筛选字段
        function deleteSelectLi(self, toId) {
            var parentLi = $(self).parent();
            $(self).remove();
            parentLi.remove().appendTo($('#' + toId));
        }

        $("[flag='deleteSort']").live("click", function ()  { 
            deleteSelectLi(this, "<%=sortable1.ClientID %>");
        });

        $("[flag='deleteFilter']").live("click", function () {
             deleteSelectLi(this, "<%=filterable1.ClientID %>"); 
        });

        $("[flag='deleteFixedFilter']").live("click", function () {   
            var parentLi = $(this).parent();
            $(this).remove();
            parentLi.remove();
        });

        $("[flag='deleteRibbonMenu']").live("click", function () {   
            var parentLi = $(this).parent();
            $(this).remove();
            parentLi.remove();
        });

        function viewForm() {
            var listId = $("#<%=hiListId.ClientID %>").val();
            var page = "<%=ViewUrl %>";
            var url = buildQueryUrl(page, { ViewId:$bizCtx.bizId, IsView: 1, ListId: listId, secid: listId })
            if (showModal(encodeURI(url), null, 1000, 550) == undefined) {
                return false;
            }
        }

        function viewNewForm() {
            var listId = $("#<%=hiListId.ClientID %>").val();
            var page = "/Custom/List/DispListNew.aspx";
            var url = buildQueryUrl(page, { ViewId: $bizCtx.bizId, IsView: 1, ListId: listId, secid: listId })
            if (showModal(encodeURI(url), null, 1000, 550) == undefined) {
                return false;
            }
        }

        function setFieldParam(hijson) {
            var url = buildQueryUrl("Custom/List/DataConverterEditor.aspx", {FilterParam:1});
            var re = showModal(encodeURI(url), $(hijson).attr('json'), 600, 300);
            if (checkReturn(re)) {
                $(hijson).attr("json", re);
                if (re != "") {
                    $(hijson).css("color", "blue");
                }
                else {
                    $(hijson).css("color", "");
                }
            }
            return false;
        }

        function setFixedFieldParam(hijson){
            var url = buildQueryUrl("Custom/List/ActionEditor.aspx", { AddFilter: "1" ,ListId: "<%=ListId%>"});
            var re = showModal(encodeURI(url), $(hijson).attr('json'), 600, 420);
            if (checkReturn(re)) {
                $(hijson).attr("json", re);
                var jsonObj=JSON.parse(re);
                //实时更新标签信息
                $(hijson).parent().parent().find("div").first().text(jsonObj.Label);
                if (re != "") {
                    $(hijson).css("color", "blue");
                }
                else {
                    $(hijson).css("color", "");
                }
            }
            return false;
        }

        function addFixedFilter() {
            var url = buildQueryUrl("Custom/List/ActionEditor.aspx", { AddFilter: "1",ListId: "<%=ListId%>" });
            var re = showModal(encodeURI(url), null, 600, 420);
            if (checkReturn(re)) {
                $("#<%=hiNewFilter.ClientID %>").val(re);
                return true;
            }
            return false;
        }

        function setRibbonMenuParam(hijson){
            var url = buildQueryUrl("Custom/List/RibbonMenuEditor.aspx", { ListId: "<%=ListId%>"});
            var re = showModal(encodeURI(url), $(hijson).attr('json'), 1000, 650);
            if (checkReturn(re)) {
                $(hijson).attr("json", re);
                var jsonObj=JSON.parse(re);
                //实时更新标签信息
                $(hijson).parent().parent().find("div").first().text(jsonObj.Label);
                if (re != "") {
                    $(hijson).css("color", "blue");
                }
                else {
                    $(hijson).css("color", "");
                }
            }
            return false;
        }

        function addRibbonMenu() {
            var url = buildQueryUrl("Custom/List/RibbonMenuEditor.aspx", { ListId: "<%=ListId%>" });
            var re = showModal(encodeURI(url), null, 1000, 650);
            if (checkReturn(re)) {
                $("#<%=hiNewRibbon.ClientID %>").val(re);
                return true;
            }
            return false;
        }
         function setDialogPage() {
            var url = buildQueryUrl("Custom/List/ActionDialogEditor.aspx", null);

            var re = showModal(encodeURI(url), $("#<%=hiDialogPage.ClientID%>").val(), 600, 300);
            if (checkReturn(re)) {
                $("#<%=hiDialogPage.ClientID%>").val(re);
                return true;
            }
            return false;
        }
    </script>
</asp:Content>
