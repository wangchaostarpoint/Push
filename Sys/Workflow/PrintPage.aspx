<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PrintPage.aspx.cs" Inherits="Zhongsoft.Portal.Sys.Workflow.PrintPage" %>

<%@ Register Src="Controls/FormOpinionPrint.ascx" TagName="FormOpinion"
    TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style type="text/css">
        .kpms-printtitle
        {
            text-align: center;
            font-size: large;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div style="text-align: center">
        <object id="wb" height="0" width="0" classid="CLSID:8856F961-340A-11D0-A96B-00C04FD705A2"
            name="wb" viewastext>
        </object>
        <table id="tbBtns" style="margin:0 auto;">
            <tr>
                <td>
                    <input type="button" name="btnPrint" id="btnPrint" value="打印" />
                    <input type="button" name="btnSetup" id="btnSetup" value="打印页面设置" />
                    <input type="button" name="btnView" id="btnView" value="打印预览" />
                    <input type="button" name="btnClose" id="btnClose" value="关闭" />
                </td>
            </tr>
        </table>
        <table width="100%">
            <tr>
                <td id="tdTitle" class="kpms-printtitle">
                </td>
            </tr>
            <tr>
                <td id="tdContent" align="center">
                </td>
            </tr>
            <tr>
                <td>
                    <uc2:FormOpinion ID="FormOpinion" runat="server" OpinionSign="ESign" />
                </td>
            </tr>
        </table>
    </div>

    <script type="text/javascript">
        $(document).ready(function() {
            //打印
            $('#btnPrint').bind("click", function() {
                if (confirm('确定打印吗？')) {
                    printXX(6, 6);
                }
            });

            //打印设置
            $('#btnSetup').bind("click", function() {
                document.all.wb.execwb(8, 1);
            });

            //打印预览
            $('#btnView').bind("click", function() {
                printXX(7, 1);
            });

            //关闭
            $('#btnClose').bind("click", function() {
                document.all.wb.execwb(45, 1);
            });
        });

        function printXX(i, j) {
            SetBtnVisible(0);
            document.all.wb.execwb(i, j);
            SetBtnVisible(1);
        }

        function SetBtnVisible(isVisible) {
            if (1 == isVisible)
                document.getElementById("tbBtns").style.display = "";
            else
                document.getElementById("tbBtns").style.display = "none";

        }
    </script>

    <script type="text/javascript">
        GetParam();
        function GetParam() {
            if (window.opener == null)
                return;
            if (window.opener.document.all.formContent == null)
                return;
            $('#tdTitle').html($(window.opener.document.all.divTitle).html());
            $('#tdContent').html($(window.opener.document.all.formContent).html());
            //去掉disabled=disabled的属性，原因：有这个属性字体为灰色的
            $('*').removeAttr('disabled');
            //table border 黑色
            $('.kpms-table').css('border', '#000000 1px solid');
            $('.kpms-table td').css('border', '#000000 1px solid');
            $('.kpms-letter').css('border', 'none');
            $('.kpms-letter td').css('border', 'none');
            $('td.kpms-letterrighttd').css('border-right', 'none');
            //日期移除样式
            $('.kpms-textbox-date').removeClass('kpms-textbox-date');
            //*（必填项的标志）隐藏
            $('.req-star').hide();
            $('textarea').css('border', 'none');
            $('textarea').css('background', '#ffffff');
            $('textarea').attr('contentEditable', 'false');

            var inputs = $("input");
            $.each(inputs, function(i, n) {
                if (n.type == "image" || n.type == "submit")//ImageButton,Button隐藏
                    n.style.display = "none";
                else if (n.type == "text") {//文本框去掉样式，不可编辑
                    $(this).css('border', 'none'); //去掉文本框的border
                    $(this).css('background', '#ffffff'); //文本框的背景黄色去掉，改为白色
                    $(this).css('font-weight', 'normal'); //字体正常显示，在流程中加粗的
                    $(this).attr('contentEditable', 'false'); //文字不可编辑
                }

            });

            //dropdownlist只显示选择的项
            $.each($('select option:selected'), function(i, n) {
                if ($(this).val() == "")
                    $(this).parent().replaceWith('');
                else
                    $(this).parent().replaceWith($(this).text());

            });

            //图片隐藏
            $('img').hide();
            $('img.kpms-letterlogo').css('display','block')
            //此处是因为radiobuttonlist和checkboxlist在IE中解析时生成了几个空列，需要去掉空列的边
            $("td[class^='kpms-fim'] table td").css('border', 'none');
            //radio,checkbox只显示选择的项
            $.each($('[type="radio"],[type="checkbox"]'), function(i, n) {
                if ($(this).attr('checked'))
                    $(this).parent().replaceWith($(this).next().text() + '   ');
                else
                    $(this).parent().replaceWith('');
            });
            //列表中样式调整，border #000000，background #ffffff
            $('.kpms-detbodyheader').removeClass('kpms-detbodyheader').addClass('kpms-detbodyheaderprint');
            $('.kpms-detbody-ou').removeClass('kpms-detbody-ou').addClass('kpms-detbody-ouprint');
            $('.kpms-detbody-ji').removeClass('kpms-detbody-ji').addClass('kpms-detbody-jiprint');
            $('[class="kpms-detbody-ouprint"] td table td').css('border', 'none');
            //alert($("table tr[class='kpms-detbodyheaderprint']").length);
        }

        ESignProtect1();
    </script>

    </form>
</body>
</html>
