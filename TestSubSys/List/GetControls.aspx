<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="GetControls.aspx.cs" Inherits="Zhongsoft.Portal.TestSubSys.List.GetControls" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <style>
        .closeleft
        {
            width: 5px;
            cursor: pointer;
            background: #eff3f6 url(/portal/themes/images/closeleft.jpg) center no-repeat;
            border-right: #C0C3C8 1px solid;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
    <div>
        <table width="100%">
            <tr>
                <td id="td" width="200px" valign="top" style="position: relative; height: 450px;
                    border: #9ea5ad 1px dotted;">
                    <div id="rb" style="height: 100%; width: 100%; border: #9ea5ad 1px dotted;">
                    </div>
                </td>
                <td class="closeleft" style="width: 3px!important" rowspan="2">
                </td>
                <td style="height: 450px; border: #9ea5ad 1px dotted;">
                    1111111
                </td>
            </tr>
            <tr>
                <td id="td1" colspan="3" width="200px" valign="top" style="position: relative; height: 450px;
                    border: #9ea5ad 1px dotted;">
                    <div id="Div1" style="height: 100%; width: 100%; border: #9ea5ad 1px dotted;">
                    </div>
                </td>
              
            </tr>
        </table>
        <script>

            $(".closeleft").live("click", function () { $("#td").toggle(); $("#td1").toggle() });
        </script>
    </div>
    </form>
</body>
</html>
