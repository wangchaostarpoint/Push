<%@ Page Title="项目卷册数量导入" Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true" CodeBehind="ProjectMonthPlanImport.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Plan.ProjectMonthPlanImport" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr style="height: 30px;">
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fileUploadWbs" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center" style="font-weight: bold"></td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    OnClick="btnImport_Click" flag="update">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <script type="text/javascript">
        //对需要刷新的按钮注册返回值
        $('[flag="update"]').each(function () {
            $(this).bind('click', function () {
                setReturnVal();
            });
        });
        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }
    </script>
</asp:Content>
