<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="KeyWorkFlowTemplate.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Sys.KeyWorkFlowTemplate" %>

<%@ Register Src="~/EPMS/UI/Project/ProjectCommon.ascx" TagName="ProjectCommon" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <style type="text/css">
        #kpms-tabtable
        {
            border-collapse: collapse;
            border-spacing: 0px; /*width: 1100px;*/
            min-width: 1055px;
            _width: 1055px;
        }
        .kpms-tabstabtitle
        {
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: left;
            color: #2e6e9e;
            font-weight: bold;
            border-left: #a6c9e2 1px solid;
            border-right: #a6c9e2 1px solid;
        }
        .kpms-tabstabcontent
        {
            vertical-align: top;
            text-align: center;
            border-left: #a6c9e2 1px solid;
            border-right: #a6c9e2 1px solid;
            padding-top: 10px;
        }
        .kpms-tabstabcontent table
        {
            margin: 0 auto;
        }
        .kpms-tabstabtitlefirst
        {
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: center;
            color: #2e6e9e;
            font-weight: bold;
            border-right: #a6c9e2 1px solid;
        }
        .kpms-tabstabcontentfirst
        {
            vertical-align: top;
            text-align: center;
            border-right: #a6c9e2 1px solid;
            padding-top: 10px;
        }
        .kpms-tabstabcontentfirst table
        {
            margin: 0 auto;
        }
        .kpms-tabstabtitlelast
        {
            cursor: pointer;
            width: 187px;
            background: url(../Images/step.jpg) no-repeat center;
            height: 30px;
            text-align: center;
            color: #2e6e9e;
            /*font-weight: bold;*/
            border-left: #a6c9e2 1.5px dashed;
        }
        .kpms-tabstabtitlelasthover
        {
            background: url(../Images/stephover.jpg) no-repeat center;
            color: #e17009;
        }
        .kpms-tabstabcontentlast
        {
            vertical-align: top;
            text-align: center;
            border-left: #a6c9e2 1.5px dashed;
            padding-top: 10px;
        }
        .kpms-tabstabcontenttdcenter
        {
            vertical-align: inherit;
            width:2%;
            border-right: #a6c9e2 1.5px dashed;
            padding-right:3px;
        }
        .kpms-tabstabcontentlast table
        {
            margin: 0 auto;
        }
        .kpms-lefttabtd
        {
            vertical-align: top;
            width: 140px;
        }
        .kpms-tablebordernone td
        {
            border: solid 0px #ffffff;
        }
        #KPMSTemplate0
        {
            overflow: auto;
        }
        
        
        /*** tab页再分的样式 ***/
        .kpms-tabdisplaylefttd
        {
            padding-left: 6px;
            border-bottom: #f0f4fd 1px solid;
            border-top: #f0f4fd 1px solid;
            color: #00156e;
            height: 25px;
            vertical-align: middle;
            text-align: left;
            background: #f0f4fd;
            width: 130px;
            cursor: pointer;
        }
        .kpms-tabdisplaylefttd a
        {
            color: #00156e !important;
        }
        .kpms-tabdisplayrighttd
        {
            border-left: #dcdcdc 0px solid;
            text-align: left;
            vertical-align: top;
        }
        .kpms-tabdisplaylefttdclick
        {
            background: #f6fbff url(../../../Themes/Images/next.gif) right no-repeat;
            background-image
        }
        .kpms-tabdisplaylefttdclick a
        {
            color: #e17009 !important;
           /*font-weight: bold;*/
        }
        .kpms-tabdisplaylefttdhover
        {
            background: #f0f4fd url(../Images/kpms-flowleftbghover.jpg) left no-repeat;
        }
        .kpms-tabdisplaylefttdhover a
        {
            color: #e17009 !important;
        }
        
        /*** <!--- table通用样式 ---> ***/
        .kpms-formpic
        {
        	width:150px!important;
            text-align: center;
            vertical-align: top;
            height: 71px;
           /* background: url(/portal/Themes/Images/form-picbg.jpg) no-repeat center 100%;*/
            padding-top:10px;
        }
        .kpms-formpic img
        {
            float: none;
            text-align: center;
            vertical-align: top;
        }
        .kpms-formpic table
        {
            height: 100%;
            margin: 0 auto;
            text-align: left;
            min-width: 87px;
        }
        .kpms-formpic table .kpms-formpictd
        {
            width: 70px;
            text-align: center;
            line-height: 1.2em;
            vertical-align: top;
            /*text-align:left;*/
        }
        
        .kpms-formpictd a:link
        {
            color: #00156e;
            /*font-weight:bold;*/
        }
        .kpms-formpictd a:visited
        {
            color: #00156e;
        }
        .kpms-formpictd a:hover
        {
            color: #e17009;
        }
        .kpms-projinfo a
        {
            color:Gray !important;
        }
        td .kpms-projinfo {
            min-width: 60px;
            vertical-align:top;
            padding-top:5px;
        }
        td .kpms-projinfo span {
            margin-top:5px;
        }
        .kpms-tabletr
        {
            border-bottom: #a6c9e2 1.5px dashed;
        }
        .kpms-assisform
        {
            vertical-align: top;
            padding-top: 5px;
            min-width:52px;
        }
        .kpms-assisform div
        {
            margin-bottom: 5px;
            /*background-image: url(/portal/themes/images/kpms-jt.png);*/
            background-repeat: no-repeat;
            background-position: 1px 3px;
            margin-left: 0px;
            padding-left: 0px;
        }
        .kpms-assisform a
        {
            color: #00156e;
            /*font-weight:bold;*/
        }
        .kpms-assisform a:hover
        {
            color: #e17009;
        }
        .kpms-assisform span
        {
            color:Gray;
        }
        .kpms-assisform span a
        {
            color:Gray;
            font-weight:normal;
        }
        .kpms-tablenotmaincontent
        {
        }
		.kpms-tablebordernone
		{
		    
		}
		.ALink
		{ 
		    padding:0.5em 1em;  
		    float:left; 
		    color: #555; 
		    background:#f7fdfd; 
		    border:#7bbec5 1px solid; 
		    height: 22px; 
		    line-height:22px; 
		    margin:2px 0.1em 0px 0px;
		}
		.selectedLink
		{
		    background:#fff; 
		    color:#212121;
		    border:#7bbec5 1px solid;
		    border-top-left-radius:0px;
		    border-top-right-radius:0px; 
		    margin-bottom:-1px; 
		    margin-left:0.2em; 
		    padding-bottom:0.6em; 
		    border-bottom:0px;
		}
		.kpms-mouseoverdiv
		{
		    display:none;
		    position:absolute;
		    line-height:25px;
		    margin-left:135px;
		    text-align:left;
		}
		#divcol辅助管理 .kpms-assisform
		{
		    max-width:0px;
		    min-width:20px;
		}
		#divcol辅助管理 .kpms-formpic
		{
		    width:100px !important;
		}
		#divcol生产计划 .kpms-assisform
		{
		    max-width:0px;
		    min-width:20px;
		}
		#divcol生产计划 .kpms-formpic
		{
		    width:100px !important;
		}
		.kpms-keyform .kpms-formpictd a
		{
		    color:Blue !important; 
		}
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <div>
            <table class="tz-table" style="width: 100%">
                <tr runat="server" id="trBusinessPlate">
                    <td class="td-l">
                        业务板块
                    </td>
                    <td class="td-m" colspan="4">
                        <asp:DataList runat="server" ID="dlBusinessPlate" CssClass="kpms-tablebordernone"
                            DataKeyField="ParamBusinessPlateID" OnItemDataBound="dlBusinessPlate_ItemDataBound"
                            OnItemCommand="dlBusinessPlate_ItemCommand" RepeatDirection="Horizontal">
                            <ItemTemplate>
                                <table class="kpms-tablebordernon">
                                    <tr>
                                        <td>
                                            <asp:LinkButton runat="server" ID="lbtnBusPlateName" EnableTheming="false" CssClass="ALink"
                                                value='<%#Eval("ParamBusinessPlateID") %>' CommandName="ChangePlate" Text='<%# Eval("BusinessPlate") %>'></asp:LinkButton>
                                        </td>
                                    </tr>
                                </table>
                            </ItemTemplate>
                        </asp:DataList>
                        <input runat="server" id="hiBusinessPlateId" type="hidden" />
                    </td>
                    <td>
                        <asp:LinkButton runat="server" ID="lbtnConfig" EnableTheming="false" Text="配置关键路径"
                            OnClientClick="return ConfigKeyWorkflow();"></asp:LinkButton>
                    </td>
                </tr>
                <uc1:ProjectCommon runat="server" ID="ProjectCommon1" AllowSelect="true" />
            </table>
            <input runat="server" id="hiOrganizationID" type="hidden" />
            <input runat="server" id="hiTip" type="hidden" value="已有发起的流程，不得再次发起！" />
        </div>
        <div id="templateTabs">
            <asp:Literal runat="server" ID="ltContent"></asp:Literal>
        </div>
        <div>
            <input runat="server" id="hiNumXml" type="hidden" />
        </div>
    </div>
    <input runat="server" id="hiZSpecialtyCode" type="hidden" value="A" />
    </form>
    <script type="text/javascript">
        $(function () {
            var index = 0;
            $('#templateTabs').tabs({ active: index });

            //返回值，发起流程后刷新待办列表
            $('[flag="flow"]').click(function () {
                parent.returnValue = 'reloadTodo';
            });

            $('.disableCss').removeAttr('href'); //去掉a标签中的href属性 
            $('.disableCss').removeAttr('onclick'); //去掉a标签中的onclick事件 
            $(".disableCss").css("font", "12px/1.5 \\5B8B\\4F53, Georgia, Times New Roman, serif, arial");
            $(".disableCss").css("text-decoration", "none");
            $(".disableCss").css("color", "#afafaf");
            $(".disableCss").css("outline", "0 none");
            $(".disableCss").css("cursor", "default");

        });

        //设置选中业务板块页签样式
        $("a[id$='lbtnBusPlateName']").each(function () {
            if ($(this).attr("value") == $("#<%=hiBusinessPlateId.ClientID %>").val()) {
                $(this).attr("class", "ALink selectedLink")
            }
            else {
                $(this).attr("class", "ALink")
            }
        });
        $(".kpms-tabdisplaylefttdclick:last").attr("style", "background-image:none");

        function ConfigKeyWorkflow() {
            var url = "/Custom/List/DispList.aspx";
            var json = { secid: '742D125B-5270-464C-B9DA-51444D1D9811' };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1100, 600);
            return false;
        }

        function openWorkFlow(url, flg) {
            var orgId = $("#<%=hiOrganizationID.ClientID %>").val();
            if (orgId == "") {
                alert("请先选择项目，再发起流程！")
                return false;
            }

            if (flg == "false") {
                var tip = $("#<%=hiTip.ClientID %>").val();
                alert(tip);
                return false;
            }
            else {
                window.open(url);
            }
        }

        function viewWorkFlow(fId, processStatu) {
            var url = "/Sys/Workflow/ProcessManager.aspx";
            var json = { OrganizationID: $("#<%=hiOrganizationID.ClientID %>").val(), FId: fId, ProcessStatu: processStatu, IsInitKPMSUser: false };
            url = buildQueryUrl(url, json);
            showDivDialog(url, "", 1100, 600);
            return false;
        }
    </script>
</body>
</html>
