<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="QSMSystemPublicFileList.aspx.cs"
    MasterPageFile="~/UI/Master/ObjectList.Master" Title="文件台帐" Inherits="Zhongsoft.Portal.QSM.List.QSMSystemPublicFileList" %>

<%@ Register Src="~/Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>
<asp:Content ID="Content1" ContentPlaceHolderID="treeView" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="toolBar" runat="server">
    <span class="filter-block"><span class="filter-block-lb">发布日期</span><span>
        <zhongsoft:XHtmlInputText runat="server" ID="txtStartDate" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
        <zhongsoft:XHtmlInputText runat="server" ID="txtEndDate" class="kpms-textbox-comparedate"
            readonly="readonly" compare="1">
        </zhongsoft:XHtmlInputText>
    </span></span><span class="filter-block"><span class="filter-block-lb">文件名称</span><span>
        <zhongsoft:LightTextBox ID="tbFileName" runat="server" CssClass="kpms-textboxsearch"
            EnableTheming="false">  </zhongsoft:LightTextBox>
    </span></span>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="toolBtn" runat="server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="listGrid" runat="server">
    <zhongsoft:LightPowerGridView ID="gvList" runat="server" AllowPaging="true" PageSize="15"
        ShowExport="true" UseDefaultDataSource="true" DataKeyNames="SystemPublicFileID"
        OnExport="gvList_Export" OnRowCommand="gvList_RowCommand" OnRowDataBound="gvList_RowDataBound"
        HideFieldOnExport="全选">
        <Columns>
            <zhongsoft:LightCheckField HeaderText="全选" HeaderStyle-Width="40px" OnClientClick="checkGridView">
            </zhongsoft:LightCheckField>
            <asp:BoundField DataField="FileName" HeaderText="文件名称" ItemStyle-Width="90px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="FileReleaseDate" HeaderText="发布日期" ItemStyle-Width="70px"
                ItemStyle-HorizontalAlign="Right" DataFormatString="{0:yyyy-MM-dd}">
                <ItemStyle Width="70px"></ItemStyle>
            </asp:BoundField>
            <asp:BoundField DataField="FileEdition" HeaderText="版本" ItemStyle-Width="30px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField> 
            <asp:BoundField DataField="DeptName" HeaderText="管理部门" ItemStyle-Width="90px">
                <ItemStyle Width="90px"></ItemStyle>
            </asp:BoundField>       
             <asp:TemplateField HeaderText="文件">
                <ItemTemplate>
                    <uc1:AttachmentView ID="Certificate" runat="server" RepeatColumns="1" />
                    <input type="hidden" runat="server" id="hiFileID" value='<%#Eval("SystemPublicFileID") %>' /> 
                </ItemTemplate>
                <HeaderStyle Width="10%"></HeaderStyle>
            </asp:TemplateField>
        </Columns>
        <PagerStyle HorizontalAlign="Right"></PagerStyle>
    </zhongsoft:LightPowerGridView>
    <input type="hidden" runat="server" id="hiKey" />
    <script type="text/javascript">
        $gridCheckedClientID = "<%=gvList.CheckedClientID %>";

        function checkGridView(array) {
            transParamToToolBar(array, null);
            $("#<%=hiKey.ClientID %>").val(array);

        }

        function InitCustomerPlugin() {
            alert("11");
            checkRegex();
            checkMaxLength();
        }

        function EditItem(bizId, actionType) {
            var enterType = "<%=EnterType %>";
            var url = "QSMSystemPublicFileEditor.aspx?actionType=" + actionType;
            if (actionType != 2) {
                url += "&bizId=" + bizId;
            }

            url += "&EnterType=" + enterType;
            var sFeatures = "dialogHeight:600px; dialogWidth: 950px; dialogTop: px; dialogLeft: px; edge:Raised; center: Yes; help: Yes; resizable: Yes; scroll:yes; status: no;";
            var reObj = window.showModalDialog(url, "", sFeatures);
            if (actionType == 1) {
                return false;
            }
            return true;
        }


        //根据List页面传递编辑页参数值
        function beforeDialog(actionType, bizId) {
            var enterType = "<%=EnterType %>";
            var level = "<%=Level %>";
            var levelType = "<%=LevelType %>";
            var url = buildBizUrl(actionType, bizId, "QSM/List/QSMSystemPublicFileEditor.aspx?EnterType=" + enterType + "&Level=" + level + "&levelType=" + levelType, null);
            switch (actionType) {
                case "1":
                    showModal(url, "", 850, 600);
                    break;
                case "3":
                case "2":
                    if (checkReturn(showModal(url, "", 850, 600))) {
                        if (typeof (rebindGridData) == "function") {
                            rebindGridData();
                        }
                    }
                    break;
            }
            return false;
        }
    </script>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="detailContent" runat="server">
</asp:Content>
