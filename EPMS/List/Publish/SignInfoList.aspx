<%@ Page Title="批签批转状态" Language="C#" AutoEventWireup="true" CodeBehind="SignInfoList.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Publish.SignInfoList" MasterPageFile="~/Custom/UI/Master/CustomListNew.Master" %>

<asp:Content ID="Content4" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">项目名称/编号</span> <span>
        <asp:TextBox ID="tbProjectInfo" search="1" runat="server" class="kpms-textboxsearch"
            EnableTheming="false"></asp:TextBox>
    </span></span>
    <%--<span class="filter-block"><span class="filter-block-lb">任务类型</span> <span>
        <zhongsoft:LightDropDownList ID="ddlWBSType" runat="server" class="kpms-ddlsearch"
            EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>--%>
    <span class="filter-block"><span class="filter-block-lb">卷册名称/编号</span> <span>
        <asp:TextBox ID="tbWBSInfo" search="1" runat="server" class="kpms-ddlsearch" EnableTheming="false"></asp:TextBox>
    </span></span><span class="filter-block"><span class="filter-block-lb">批签状态</span> <span>
        <zhongsoft:LightDropDownList ID="ddlSign" runat="server" class="kpms-ddlsearch" EnableTheming="false">
        </zhongsoft:LightDropDownList>
    </span></span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView AllowPaging="true" ID="gvSign" AutoGenerateColumns="false"
        DataKeyNames="RollID" ShowExport="true" HideFieldOnExport="全部" runat="server"
        OnDataBound="gvSign_DataBound" BindGridViewMethod="BindDataGrid" ShowPageSizeChange="true"
        OnRowCommand="gvSign_RowCommand" AllowSorting="true" OnRowDataBound="gvSign_RowDataBound">
        <Columns>
            <zhongsoft:LightBoundField DataField="ProjectCode" HeaderText="项目编号" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="80px">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="项目名称" ItemStyle-Width="200px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbProjectName" Text='<%# gvSign.GetSubString(DataBinder.Eval(Container.DataItem, "ProjectName"), 20)%>'
                        ToolTip='<%#Eval("ProjectName") %>'></asp:Label>
                    <input type="hidden" runat="server" id="hiConvertType" value='<%#Eval("ConvertType") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="WBSType" HeaderText="任务类型" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="150px" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightBoundField DataField="RollCode" HeaderText="卷册编号" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="150px">
            </zhongsoft:LightBoundField>
            <%--<zhongsoft:LightBoundField DataField="RollName" HeaderText="卷册名称" ItemStyle-HorizontalAlign="Left"
                ItemStyle-Width="120px" Visible="false">
            </zhongsoft:LightBoundField>--%>
            <zhongsoft:LightTemplateField HeaderText="卷册名称" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <a onclick="viewSignInfo('<%#Eval("RollID") %>')" class="aStyle" title="点击查看批签错误信息">
                        <%#Eval("RollName") %></a>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="SignState" HeaderText="批签状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="批签优先级">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSignLevel" Text='<%#Eval("SignLevel") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批签情况" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbSignInfo"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PLTState" HeaderText="批转PLT状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="批转PLT优先级">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPLTLevel" Text='<%#Eval("PLTLevel") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转PLT情况" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPLTInfo"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="PDFState" HeaderText="批转PDF状态">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="批转PDF优先级">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPDFLevel" Text='<%#Eval("PDFLevel") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转PDF情况" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbPDFInfo"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightBoundField DataField="TIFState" HeaderText="批转TIF状态" Visible="false">
            </zhongsoft:LightBoundField>
            <zhongsoft:LightTemplateField HeaderText="批转TIF优先级" Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbTIFLevel" Text='<%#Eval("TIFLevel") %>' />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转TIF情况" ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Left"
                Visible="false">
                <ItemTemplate>
                    <asp:Label runat="server" ID="lbTIFInfo"></asp:Label>
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <asp:TemplateField HeaderText="切换批签批转" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Wrap="false" Visible="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSignServer" runat="server" CommandName="SignServer" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认由服务器进行批签批转操作？')" title="服务器批签批转" EnableTheming="false">
                        <img alt="重签" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                    <asp:LinkButton ID="lbtnSignClient" runat="server" CommandName="SignClient" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认由客户端进行批签批转操作？')" title="客户端批签批转" EnableTheming="false">
                        <img alt="重签" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <asp:TemplateField HeaderText="重新批签批转" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSignAgin2" runat="server" CommandName="SignAgin2" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认重新批签批转？')" title="重新批签批转" EnableTheming="false">
                        <img alt="重新批签批转" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                </ItemTemplate>
            </asp:TemplateField>
            <zhongsoft:LightTemplateField HeaderText="批签操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnSignAgin" runat="server" CommandName="SignAgin" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认重签？')" title="重签" EnableTheming="false">
                        <img alt="重签" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSignLevel1" ToolTip="加急" CommandName="SignLevel1"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">加急</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnSignLevel3" ToolTip="特急" CommandName="SignLevel3"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">特急</asp:LinkButton>
                    <zhongsoft:LightTextBox ID="tbSignLevel" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" OnTextChanged="SignLevel_TextChanged" Text='<%#Eval("SignLevel") %>'
                        AutoPostBack="true" rollID='<%#Eval("RollID") %>' req="1" Width="30px" regex="[0-9]{1,2}"
                        errmsg="排序号只能填写0到99之间的整数" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转PLT操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnPLTAgin" runat="server" CommandName="PLTAgin" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认重转PLT？')" title="重转PLT" EnableTheming="false">
                        <img alt="重转PLT" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnPLTLevel1" ToolTip="加急" CommandName="PLTLevel1"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">加急</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnPLTLevel3" ToolTip="特急" CommandName="PLTLevel3"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">特急</asp:LinkButton>
                    <zhongsoft:LightTextBox ID="tbPLTLevel" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" OnTextChanged="PLTLevel_TextChanged" Text='<%#Eval("PLTLevel") %>'
                        AutoPostBack="true" rollID='<%#Eval("RollID") %>' req="1" Width="30px" regex="[0-9]{1,2}"
                        errmsg="排序号只能填写0到99之间的整数" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转PDF操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnPDFAgin" runat="server" CommandName="PDFAgin" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认重转PDF？')" title="重转PDF" EnableTheming="false">
                        <img alt="重转PDF" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnPDFLevel1" ToolTip="加急" CommandName="PDFLevel1"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">加急</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnPDFLevel3" ToolTip="特急" CommandName="PDFLevel3"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">特急</asp:LinkButton>
                    <zhongsoft:LightTextBox ID="tbPDFLevel" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" OnTextChanged="PDFLevel_TextChanged" Text='<%#Eval("PDFLevel") %>'
                        AutoPostBack="true" rollID='<%#Eval("RollID") %>' req="1" Width="30px" regex="[0-9]{1,2}"
                        errmsg="排序号只能填写0到99之间的整数" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
            <zhongsoft:LightTemplateField HeaderText="批转TIF操作" ItemStyle-Width="50px" ItemStyle-HorizontalAlign="Center"
                Visible="false" ItemStyle-Wrap="false">
                <ItemTemplate>
                    <asp:LinkButton ID="lbtnTIFAgin" runat="server" CommandName="TIFAgin" CommandArgument='<%#Eval("RollID") %>'
                        OnClientClick="return confirm('确认重转TIF？')" title="重转TIF" EnableTheming="false">
                        <img alt="重转TIF" src="../../../Themes/Images/btn_dg_edit.gif" style="cursor: hand" /></asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnTIFLevel1" ToolTip="加急" CommandName="TIFLevel1"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">加急</asp:LinkButton>
                    <asp:LinkButton runat="server" ID="lbtnTIFLevel3" ToolTip="特急" CommandName="TIFLevel3"
                        CommandArgument='<%#Eval("RollID") %>' EnableTheming="false">特急</asp:LinkButton>
                    <zhongsoft:LightTextBox ID="tbTIFLevel" runat="server" CssClass="kpms-textbox-money"
                        EnableTheming="false" OnTextChanged="TIFLevel_TextChanged" Text='<%#Eval("TIFLevel") %>'
                        AutoPostBack="true" rollID='<%#Eval("RollID") %>' req="1" Width="30px" regex="[0-9]{1,2}"
                        errmsg="排序号只能填写0到99之间的整数" />
                </ItemTemplate>
            </zhongsoft:LightTemplateField>
        </Columns>
    </zhongsoft:LightPowerGridView>
    <script type="text/javascript">

        $gridCheckedClientID = "<%=this.gvSign.CheckedClientID %>";

        function viewSignInfo(wbsId) {
            var url = '/EPMS/List/Product/ProductConvertError.aspx';
            url = buildQueryUrl(url, { RollID: wbsId });
            showDivDialog(url, null, 900, 600, null);
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
