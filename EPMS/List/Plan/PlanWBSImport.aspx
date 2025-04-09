<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="PlanWBSImport.aspx.cs"
    Inherits="Zhongsoft.Portal.EPMS.List.Plan.PlanWBSImport" MasterPageFile="~/UI/Master/ObjectEditor.Master"
    Title="任务计划导入页面" %>

<asp:Content ID="Content2" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <table width="100%">
        <tr>
            <td align="center" style="font-weight: bold">
                <asp:FileUpload ID="fupExternalContract" runat="server" />
            </td>
        </tr>
        <tr>
            <td align="center">
                <asp:LinkButton runat="server" ID="lbtnInport" CssClass="subtoolbarlink" EnableTheming="false"
                    flag="update" OnClick="btnImport_Click">
                    <span>
                        <img runat="server" id="img3" src="~/Themes/Images/ico_excel.gif" alt="导入" width="16"
                            height="16" />确定导入</span>
                </asp:LinkButton>
            </td>
        </tr>
    </table>
    <script>
        function initCustomerPlugin() {
            //对需要刷新的按钮注册返回值
            $('[flag="update"]').each(function () {
                $(this).bind('click', function () {
                    setReturnVal();
                });
            });
        }

        function closeExpWindow() {
            closeWindow();
            return false;
        }

        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal() {
            parent.returnValue = "saved";
        }

    </script>
</asp:Content>
