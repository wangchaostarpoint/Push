<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ProjectHomePage.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.ProjectPortal.ProjectHomePage" %>

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1" />
    <title></title>
    <link href="../../../Themes/Styles/projectsite.css" rel="stylesheet" type="text/css" />
    <script language="javascript">

        function ChangeUrl(MenuId, MenuName, Url, organizationId) {
            //var url = encodeURI(Url + "?IsPortal=true&MenuId=" + MenuId + "&OrganizationID=" + organizationId);
            var url;

            if (Url.indexOf("?") == -1) {
                url = encodeURI(Url + "?IsPortal=true&MenuId=" + MenuId + "&OrganizationID=" + organizationId + "&projectPhaseEntityID=" + organizationId);
            }
            else {
                url = encodeURI(Url + "&IsPortal=true&OrganizationID=" + organizationId + "&projectPhaseEntityID=" + organizationId);
            }

            $("#projectPortal").attr("src", url);
        }
        function initCustomerPlugin() {
            $('.kpms-rightnava').click(function () {
                $(this).addClass('kpms-rightnavalink').parent('li').siblings().children('a').removeClass('kpms-rightnavalink');
            })

            $('.kpms-rightnava').eq(0).trigger("click");


            var $midw = 1;
            var $oldmenu = $('#menuContainer');
            var hei = $oldmenu.height() - 35;
            var top = $oldmenu.position().top;
            var w = $('.kpms-rightnavul').width();
            var widw = w + 410;
            ChangeNav();
            $(window).resize(function () {
                ChangeNav();
            });
            function ChangeNav() {

                $midw = $(window).width();
                if ($midw < widw) {
                    $('.menuchange').width($midw - 410);
                    $('#turnmenu').css('display', '');
                    $('#turnmenu').attr('src', '../../../themes/images/nav_r2.gif');
                }
                if ($midw > widw) {
                    $('.menuchange').width(w);
                    $('#turnmenu').css('display', 'none');
                    $('#turnmenu').attr('src', '../../../themes/images/nav_r2unable.gif');
                }
                hei = $oldmenu.height() - 35;

                top = $oldmenu.position().top;
                if (Math.abs(top) >= hei) {
                    $oldmenu.css('top', '0');
                }
            }
            $('#turnmenu').click(function () {
                hei = $oldmenu.height() - 35;
                top = $oldmenu.position().top;
                if (Math.abs(top) >= hei) {
                    $oldmenu.css('top', '0');
                } else {
                    $oldmenu.animate({ top: '-=35px' }, 300);
                }
            });

        }
    </script>
</head>
<body class="kpms-noscrollbody">
    <form id="form1" runat="server">
    <table class="kpms-table100 kpms-righttable" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div class="kpms-rightheader" >
                    <span class="kpms-rightheadertitle">
                        <img alt="" runat="server" id="imgLogo" src="~/Themes/UserImages/imglogo.png" /> 
                        <asp:Label ID="lbProjectInfo" runat="server"></asp:Label></span>
                    <div class="kpms-rightnav" >
                        <div class="kpms-rightnavleft">
                        </div>
                        <div class="menuchange">
                            <ul id="menuContainer" class="kpms-rightnavul">
                                <%=GenerateNavigatorHTML()%>
                            </ul>
                        </div>
                        <%--<div class="kpms-contral" nowrap="nowrap">
                            <img id="turnmenu" title="翻动按钮" src="/Portal/Themes/Images/nav_r2.gif" />
                        </div>--%>
                        <div class="kpms-rightnavright">
                        </div>
                    </div>
                </div>
            </td>
        </tr>
        <tr>
            <td class="kpms-rightcontent">
                <iframe name="projectPortal" frameborder="0" id="projectPortal" width="100%" height="100%"
                    scrolling="auto" allowtransparency="true"></iframe>
            </td>
        </tr>
    </table>
    </form>
</body>
</html>
<script>
    var screenWidth = window.screen.width;
    $('#projectPortal').height($(window).height() - $(".kpms-rightheader").height()-11);
   
</script>
