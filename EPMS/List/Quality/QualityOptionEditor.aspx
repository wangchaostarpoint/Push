<%@ Page Language="C#" MasterPageFile="~/UI/Master/ObjectEditor.Master" AutoEventWireup="true"
    CodeBehind="QualityOptionEditor.aspx.cs" Inherits="Zhongsoft.Portal.EPMS.List.Quality.QualityOptionEditor"
    Title="评审意见维护" %>

<%@ Import Namespace="DAL.EPMS" %>
<asp:Content ID="Content1" ContentPlaceHolderID="BusinessObjectHolder" runat="server">
    <asp:ScriptManager runat="server" ID="ScriptManager1">
    </asp:ScriptManager>
    <script type="text/javascript">
        function initCustomerPlugin() {
            speDisplay();
            //对需要刷新的按钮注册返回值
            $('[flag="save"]').each(function(){
                $(this).bind('click',function(){
                    setReturnVal();
                });
            });
        }

        function checkForm() {
            //综合评审必须选择专业和卷册
            if ("<%=FormCode %>" == "EPMS07"||"<%=FormCode %>" == "") {
                var speIds = $('#<%=hiExeSpeIds.ClientID %>').val(); 
                if(speIds==""||speIds == null){
                    alert("请选择专业及卷册！");
                    return false;
                }
            }
			if($('#<%=pdgRollList.ClientID %>').length>0){
				if ($('#<%=pdgRollList.ClientID %>')[0].rows[1].cells[0].innerText == "没有卷册信息") {
				   alert("请选择卷册！");
				   return false;
				}
			}
            //评审意见中卷册的执行情况如果是不执行，需要填写该卷册备注信息
            if(!checkReason()){
                return false;
            }
            return true;
        }

        function checkReason() {
            var $State=$('#<%=pdgRollList.ClientID %> [content="state"]');
            var $Reason = $('#<%=pdgRollList.ClientID %> [content="reason"]');
            var len = $Reason.length;
            for(var i = 0; i < len; i++){
                var value=$Reason.eq(i).val().trim();
                if($Reason.eq(i).attr('isDisabled')!='true' &&value == '' && $State.eq(i).val()== "0") {
                    alert('评审意见中卷册的执行情况如果是不执行，需要填写该卷册备注信息！');
                    $Reason.eq(i).focus();
                    return false;
                }
            }
        return true;
    }

        ///选择关联任务，需要按项目、专业
        function selectRelaWBS() {
            var orgId = $('#<%=hiOrganizationID.ClientID %>').val();   
            var speIds = $('#<%=hiExeSpeIds.ClientID %>').val();     
            //add by likun on 20160303 选择专业之后才能选择卷册
            if(speIds==""||speIds == null){
                alert("请先选择专业！");
            }
            else{ 
                var param = new InputParamObject("m");
                var filter = { OrganizationID:orgId,WBSType: '<%=(int)WBSMode.任务管理 %>',ExeSpecialtyID:speIds ,IsFilterSpe:"true"};
                getWBS('<%=hiXmlRoll.ClientID %>', param, filter, afterWBSSelect);
            }
            return false;
        }   

        function afterWBSSelect() { 
            <%=this.Page.ClientScript.GetPostBackEventReference(this.btnSelectReleWBS, "")%>;
        }

        function speDisplay() {
            if ("<%=FormCode %>" == "EPMS08") {                
                $("#trSpe").hide();
                $('#<%=cbSpecialty.ClientID %>').removeAttr('req');
            }
            else{
                $('#<%=cbSpecialty.ClientID %>').attr('req', '1');
            }
        }
        //设置页面返回值，编辑后刷新父级页面
        function setReturnVal(){
            parent.returnValue="save";
        }
    </script>
    <input type="hidden" id="hiQualityDealOpinionID" runat="server" field="QualityDealOpinionID"
        tablename="EPMS_QualityDealOpinion" />
    <input type="hidden" id="hiQualityActivityContentID" runat="server" field="QualityActivityContentID"
        tablename="EPMS_QualityDealOpinion" />
    <input type="hidden" id="hiQualityActivityOfProjectID" runat="server" field="QualityActivityOfProjectID"
        tablename="EPMS_QualityDealOpinion" />
    <input type="hidden" id="hiFlag" runat="server" field="Flag" value="1" tablename="EPMS_QualityDealOpinion" />
    <input type="hidden" id="hiOrganizationID" runat="server" />
    <input type="hidden" id="hiXmlRoll" runat="server" value="<root></root>" />
    <input type="hidden" id="hiSpecialtyID" runat="server" />
    <input type="hidden" id="hiProjectPhaseID" runat="server" />
    <table class="tz-table" width="100%">
        <tr>
            <td class="td-l">
                评审主题
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:XHtmlInputText runat="server" ID="tbJudgeTitle" activestatus="(23.?)"
                    readonly="readonly" class="kpms-textbox" />
            </td>
        </tr>
        <tr>
            <td class="td-l">
                评审意见<span class="req-star">*</span>
            </td>
            <td class="td-m" colspan="3">
                <zhongsoft:LightTextBox ID="tbJudgeOption" ActiveStatus="(23.*)" field="JudgeOpinion"
                    tablename="EPMS_QualityDealOpinion" CssClass="kpms-textarea" EnableTheming="false"
                    TextMode="MultiLine" maxtext="1024" runat="server" req="1"></zhongsoft:LightTextBox>
            </td>
        </tr>
        <tr>
            <td class="td-l">
                提出人
            </td>
            <td class="td-r">
                <zhongsoft:LightObjectSelector runat="server" ID="txtPutUserName" IsMutiple="false"
                    req="1" SelectPageMode="Dialog" activestatus="(23.*)" SourceMode="SelectorPage"
                    ShowJsonRowColName="true" DoCancel="true" ResultAttr="name" ShowAttrs="name,UserCode"
                    PageWidth="850" ResultForControls="{'hiPutUserID':'id','tbUserCode':'UserCode'}"
                    PageUrl="~/EPMS/Obsolete/EPMSUserSelector.aspx" field="PutUserName" tablename="EPMS_QualityActivityContent">
                </zhongsoft:LightObjectSelector>
                <input type="hidden" id="hiPutUserID" runat="server" field="PutUserID" tablename="EPMS_QualityActivityContent" />
            </td>
            <td class="td-l">
                提出时间
            </td>
            <td class="td-r">
                <zhongsoft:XHtmlInputText runat="server" ID="tbPutDate" activestatus="(23.*)" EnableTheming="false"
                    req="1" class="kpms-textbox-date" readonly="readonly" field="PutDate" tablename="EPMS_QualityActivityContent" />
            </td>
        </tr>
        <tr id="trSpe">
            <td class="td-l">
                专业<span class="req-star">*</span>
            </td>
            <td class="td-r" colspan="3">
                <asp:UpdatePanel runat="server">
                    <ContentTemplate>
                        <asp:CheckBoxList ID="cbSpecialty" runat="server" RepeatColumns="5" RepeatDirection="Horizontal"
                            activestatus="(23.*)" AutoPostBack="true" OnSelectedIndexChanged="cbSpecialty_SelectedIndexChanged">
                        </asp:CheckBoxList>
                        <input type="hidden" id="hiExeSpeIds" runat="server" /></ContentTemplate>
                </asp:UpdatePanel>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="center">
                <h4>
                    相关卷册</h4>
            </td>
        </tr>
        <tr>
            <td colspan="4" align="right">
                <label id="lbtip" runat="server" displaystatus="(2.*)" style="color: Red">
                    请先保存再添加卷册</label>
                <asp:Button ID="btnSelectReleWBS" runat="server" Text="添加相关卷册" CssClass="kpms-buttonfree"
                    OnClientClick="return selectRelaWBS();" OnClick="btnReleWBS_Click" displaystatus="(3.*)"
                    flag="save" ForeColor="Black" />
            </td>
        </tr>
        <tr>
            <td colspan="4">
                <zhongsoft:LightPowerGridView ID="pdgRollList" runat="server" AutoGenerateColumns="False"
                    CacheRecordCount="False" DataBorderSize="1" DefaultSortColumn="" ExportFilePath="/KPMS/Temp/"
                    FlashColor="#C1D2EE" oldvalue="oldlace" ShowBorder="True" singlevalue="#FFFFFF"
                    DataKeyField="QualityOpinionReleWBSID" Width="100%" Style="margin-bottom: 0px"
                    OnRowDataBound="pdgRollList_ItemDataBound" EmptyDataText="没有卷册信息">
                    <Columns>
                        <asp:TemplateField HeaderText="卷册编号">
                            <ItemTemplate>
                                <asp:Label ID="lbRollCode" runat="server"></asp:Label>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("QualityOpinionReleWBSID") %>' />
                                <input type="hidden" runat="server" id="hiwbsID" value='<%#Eval("WBSID") %>' />
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="卷册名称">
                            <ItemTemplate>
                                <asp:Label ID="lbRollName" runat="server"></asp:Label>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="是否执行<span class='req-star'>*</span>">
                            <HeaderTemplate>
                                是否执行<span class="req-star">*</span>
                            </HeaderTemplate>
                            <ItemTemplate>
                                <zhongsoft:LightDropDownList ID="ddlIsExecute" runat="server" req="1" content="state">
                                    <asp:ListItem Value="">请选择</asp:ListItem>
                                    <asp:ListItem Value="1">执行</asp:ListItem>
                                    <asp:ListItem Value="0">不执行</asp:ListItem>
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="质量判定">
                            <%--<HeaderTemplate>
                                是否存在<br />
                                质量问题
                            </HeaderTemplate>--%>
                            <ItemTemplate>
                                <asp:CheckBox ID="ckbIsQualityProblem" runat="server" />
                                <%-- <zhongsoft:LightDropDownList ID="ddlIsQualityProblem" runat="server">
                                    <asp:ListItem Value="">请选择</asp:ListItem>
                                    <asp:ListItem Value="1">是</asp:ListItem>
                                    <asp:ListItem Value="0">否</asp:ListItem>
                                </zhongsoft:LightDropDownList>--%>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="备注">
                            <ItemTemplate>
                                <zhongsoft:LightTextBox ID="tbMemo" runat="server" TextMode="MultiLine" CssClass="kpms-textarea"
                                    content="reason" maxtext="256" EnableTheming="false" Text='<%#DataBinder.Eval(Container.DataItem,"Memo") %>'></zhongsoft:LightTextBox>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" HeaderStyle-HorizontalAlign="Center" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Width="30px">
                            <ItemTemplate>
                                <asp:ImageButton ID="ibtnDelete" OnClientClick="return confirm('确认删除该卷册信息？')" ImageUrl="/Portal/Themes/Images/btn_dg_delete.gif"
                                    runat="server" OnCommand="ibtnDelete_Click" CommandArgument='<%#Eval("QualityOpinionReleWBSID") %>' />
                            </ItemTemplate>
                            <HeaderStyle HorizontalAlign="Center"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center"></ItemStyle>
                        </asp:TemplateField>
                    </Columns>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>
</asp:Content>
