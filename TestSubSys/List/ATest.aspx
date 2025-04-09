<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ATest.aspx.cs" Inherits="Zhongsoft.Portal.BDM.List.ATest" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=10.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<%@ Register Assembly="Zhongsoft.Portal.UI.Controls" Namespace="Zhongsoft.Portal.UI.Controls"
    TagPrefix="zhongsoft" %>
<%@ Register Assembly="Zhongsoft.Portal" Namespace="Zhongsoft.Portal.Controls" TagPrefix="zhongsoft" %>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .xpdl-sendwindow
        {
            text-align: center;
            margin: 0 auto;
            z-index: 700;
            background: url(../Images/panel_title.png);
            border: #99bbe8 1px solid;
            width: 620px;
            padding-bottom: 10px;
        }
        
        .tbda td
        {
            height: 0px !important;
            padding: 0px !important;
            border: none !important;
        }
        #draggable
        {
            width: 100px;
            height: 100px;
            padding: 0.5em;
            float: left;
            margin: 10px 10px 10px 0;
        }
        #droppable
        {
            width: 150px;
            height: 150px;
            padding: 0.5em;
            float: left;
            margin: 10px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <asp:LinkButton runat="server" ID="btn1" OnClick="btn1_Click"><span>导出</span></asp:LinkButton>
        <asp:FileUpload ID="fileUpload" runat="server" />
        <asp:LinkButton runat="server" ID="btn2" OnClick="btn2_Click"><span>导入</span></asp:LinkButton>
        <asp:Button ID="Button1" runat="server" Text="Button" OnClientClick="show();" />
        <%--        <zhongsoft:LightFileUploader runat="server" ID="btnUploader" FileSourceId="<%this.BusinessObjectId %>"
            CssClass="btn-function"> <span> <img src="../../Themes/Images/btn_f_fujian.gif" title="附件" /><br />文档</span></zhongsoft:LightFileUploader>--%>
    </div>
    <style>
        body
        {
            min-width: 520px;
        }
        .column
        {
            width: 170px;
            float: left;
            padding-bottom: 100px;
        }
        .portlet
        {
            margin: 0 1em 1em 0;
            padding: 0.3em;
        }
        .portlet-header
        {
            padding: 0.2em 0.3em;
            margin-bottom: 0.5em;
            position: relative;
        }
        .portlet-toggle
        {
            position: absolute;
            top: 50%;
            right: 0;
            margin-top: -8px;
        }
        .portlet-content
        {
            padding: 0.4em;
        }
        .portlet-placeholder
        {
            border: 1px dotted black;
            margin: 0 1em 1em 0;
            height: 50px;
        }
    </style>
    <script>
        function show() {
            var re = showModal("TestEditor.aspx?actionType=3", window, 500, 500);
            alert(re);
            return false;
        }
    </script>
    <script>
        $(function () {
            $(".column").sortable({
                connectWith: ".column",
                handle: ".portlet-header",
                cancel: ".portlet-toggle",
                placeholder: "portlet-placeholder ui-corner-all"
            });

            $(".portlet")
      .addClass("ui-widget ui-widget-content ui-helper-clearfix ui-corner-all")
      .find(".portlet-header")
        .addClass("ui-widget-header ui-corner-all")
        .prepend("<span class='ui-icon ui-icon-minusthick portlet-toggle'></span>");

            $(".portlet-toggle").click(function () {
                var icon = $(this);
                icon.toggleClass("ui-icon-minusthick ui-icon-plusthick");
                icon.closest(".portlet").find(".portlet-content").toggle();
            });
        });
    </script>
    </head>
    <body>
        <div class="column">
            <div class="portlet">
                <div class="portlet-header">
                    Feeds</div>
                <div class="portlet-content">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
            </div>
            <div class="portlet">
                <div class="portlet-header">
                    News</div>
                <div class="portlet-content">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
            </div>
        </div>
        <div class="column">
            <div class="portlet">
                <div class="portlet-header">
                    Shopping</div>
                <div class="portlet-content">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
            </div>
        </div>
        <div class="column">
            <div class="portlet">
                <div class="portlet-header">
                    Links</div>
                <div class="portlet-content">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
            </div>
            <div class="portlet">
                <div class="portlet-header">
                    Images</div>
                <div class="portlet-content">
                    Lorem ipsum dolor sit amet, consectetuer adipiscing elit</div>
            </div>
        </div>
    </form>
</body>
</html>
