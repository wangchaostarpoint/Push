<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="C_CustomerComplaint.ascx.cs"
    Inherits="Zhongsoft.Portal.MM.UI.Controls.C_CustomerComplaint" %>
<div class="wp_listleft" style="margin-top: 8px;">
    <div class="wp_header">
        <div>
            <span>客户投诉</span>
        </div>
    </div>
    <div class="wp_main">
        <div class="wp_content">
            <zhongsoft:LightPowerGridView runat="server" ID="gvCustomComplaint" AllowPaging="true"
                PageSize="5" UseDefaultDataSource="true" AutoGenerateColumns="false" BindGridViewMethod="UserControl.BindCustomPlaints">
                <Columns>
                    <zhongsoft:LightTemplateField HeaderText="客户">
                        <ItemTemplate>
                            <asp:Label ID="lbCustomer" Text='<%# gvCustomComplaint.GetSubString(Eval("CUSTOMERNAME"), 6)%>'
                                ToolTip='<%#Eval("CUSTOMERNAME") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="项目">
                        <ItemTemplate>
                            <asp:Label ID="lbProj" Text='<%# gvCustomComplaint.GetSubString(Eval("ProjectPhaseName"), 6)%>'
                                ToolTip='<%#Eval("ProjectPhaseName") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="主题">
                        <ItemTemplate>
                            <asp:Label ID="lbTitle" Text='<%# gvCustomComplaint.GetSubString(Eval("COMPLAINTCONTENT"), 6)%>'
                                ToolTip='<%#Eval("COMPLAINTCONTENT") %>' runat="server"></asp:Label>
                        </ItemTemplate>
                        <ItemStyle Width="100px" />
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightBoundField HeaderText="日期" DataField="CREATEDATE" DataFormatString="{0:yyyy-MM-dd}"
                        ItemStyle-Wrap="false" ItemStyle-Width="150px">
                    </zhongsoft:LightBoundField>
                    <zhongsoft:LightButtonField HeaderText="查看" EditItemClick="viewFlow" DataParamFields="FId,PId"
                        ItemStyle-Width="40px" ImageUrl="../../Themes/Images/btn_dg_detail.gif">
                    </zhongsoft:LightButtonField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </div>
    </div>
    <div class="wp_footer">
        <div>
        </div>
    </div>
    <br />
</div>
<script type="text/javascript">
    //查看流程信息
    function viewFlow(formid, processInstanceId) {
        var urlStr = buildQueryUrl("Sys/Workflow/FormDetail.aspx", { actionType: 1, formId: formid, prcInstId: processInstanceId });

        window.open(urlStr);
        return false;
    }
</script>
