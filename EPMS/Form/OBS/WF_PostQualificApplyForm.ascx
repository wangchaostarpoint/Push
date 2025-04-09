<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="WF_PostQualificApplyForm.ascx.cs" Inherits="Zhongsoft.Portal.EPMS.Form.OBS.WF_PostQualificApplyForm" %>

<table class="tz-table" width="100%">
    <tr>
        <td class="td-l">提出人</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPutUserName" runat="server" CssClass="kpms-textbox"
                EnableTheming="false" ActiveStatus="(2.资格申报)" Field="PutUserName"
                TableName="EPMS_PostQualificApply" ReadOnly="true"></zhongsoft:LightTextBox>
            <input runat="server" type="hidden" id="hiPutUserId" field="PutUserID" tablename="EPMS_PostQualificApply" />
        </td>
        <td class="td-l">提出部门</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPutDeptName" runat="server" CssClass="kpms-textbox"
                EnableTheming="false" ActiveStatus="(2.资格申报)" Field="PutDeptName"
                TableName="EPMS_PostQualificApply" ReadOnly="true"></zhongsoft:LightTextBox>
            <input runat="server" type="hidden" id="hiPutDeptID" field="PutDeptID" tablename="EPMS_PostQualificApply" />
        </td>
        <td class="td-l">提出时间</td>
        <td class="td-r">
            <zhongsoft:LightTextBox ID="tbPutDate" runat="server" CssClass="kpms-textbox"
                EnableTheming="false" ActiveStatus="(2.资格申报)" Field="PutDate"
                TableName="EPMS_PostQualificApply" ReadOnly="true"></zhongsoft:LightTextBox>
        </td>
    </tr>
</table>
<table class="tz-table" width="100%">
    <tr id="verifyPointHeader">
        <td class="td-m" colspan="6" style="text-align: center;">
            <b>资格信息</b>
        </td>
    </tr>
    <tr runat="server" displaystatus="(23.资格申报)" align="right">
        <td colspan="6">
            <asp:Label ID="Label2" runat="server" displaystatus="(23.资格申报)"
                Text="增加"></asp:Label>
            <zhongsoft:LightTextBox ID="tbAddCnt" Width="5" value="1" ToolTip="请填写1至10之间的整数"
                runat="server" Style="width: 20px;" regex="^([1-9]|10)$" errmsg="增加行数请填写1至10之间的整数"
                displaystatus="(23.资格申报)">
            </zhongsoft:LightTextBox>
            <asp:Label ID="Label3" runat="server" displaystatus="(23.资格申报)"
                Text="行"></asp:Label>
            <asp:ImageButton runat="server" ID="ImageButton1" ImageUrl="~/Themes/Images/btn_add.gif"
                displaystatus="(23.资格申报)" OnClick="ibtnAddRow_Click" />
        </td>
    </tr>
    <tr id="applyUser">
        <td colspan="6">
            <zhongsoft:LightPowerGridView runat="server" ID="gvList" AutoGenerateColumns="false" PermissionStatus="true"
                DataKeyNames="PostQualificDetailID" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGrid"  PageSize="100"    
                AllowPaging="true" OnRowDataBound="gvList_RowDataBound" OnRowCommand="gvList_RowCommand" ShowExport="true" 
                HideFieldOnExport="删除"  OnExport="gvList_Export">
                <Columns>
                    <zhongsoft:LightTemplateField ItemStyle-Width="40px" HeaderText="序号" ItemStyle-HorizontalAlign="Center">
                        <ItemTemplate>
                            <%# Container.DataItemIndex+1 %>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField> 
                    <zhongsoft:LightTemplateField HeaderText="姓名<span class='req-star'>*</span>">
                        <ItemTemplate>
                           <zhongsoft:LightObjectSelector runat="server" ID="tbUserName" req="1" IsMutiple="false"
                                SelectPageMode="Dialog" ResultForControls="{'hiUserID':'id'}" EnableTheming="false"
                                Text="选择人员" PageUrl="~/Sys/OrgUsers/UserSelectorJson.aspx" ShowJsonRowColName="true"
                                ResultAttr="name" ActiveStatus="(23.资格申报)" value='<%#Eval("UserName") %>' 
                               OnClick="tbUserName_Click"/>
                            <input type="hidden" id="hiUserID" name="hiUserID" runat="server" value='<%#Eval("UserID") %>' />
                            <asp:Label ID="lblUserName" runat="server" Visible="false" ><%#Eval("UserName") %></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField> 
                    <zhongsoft:LightTemplateField HeaderText="资质名称<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlQualification" runat="server" ActiveStatus="(23.资格申报)"  req="1" 
                                OnSelectedIndexChanged="ddlQualification_SelectedIndexChanged" AutoPostBack="true"></zhongsoft:LightDropDownList>
                            <input id="hiQualificationID" runat="server" type="hidden" value='<%#Eval("QualificationID") %>'/>
                            <asp:Label ID="lblQualification" runat="server" Visible="false" ><%#Eval("QualificationName") %></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="生效时间<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtEffectiveDate" runat="server" type="text" class="kpms-textbox-date"  
                                ActiveStatus="(23.资格申报)" readonly="readonly"  value='<%#Eval("EffectiveDate") %>'  req="1"/>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="过期时间<span class='req-star'>*</span>">
                        <ItemTemplate>
                            <zhongsoft:XHtmlInputText ID="txtExpireDate" runat="server" type="text" class="kpms-textbox-date"
                                 ActiveStatus="(23.资格申报)" readonly="readonly"  value='<%#Eval("ExpireDate") %>'  req="1"/>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="能力系数">
                        <ItemTemplate>
                            <zhongsoft:LightDropDownList ID="ddlCapacityFactor" runat="server" ActiveStatus="(23.资格申报)">
                            </zhongsoft:LightDropDownList>
                            <input id="hiCapacityFactor" runat="server" type="hidden" value='<%#Eval("CapacityFactor") %>' />
                            <asp:Label ID="lblCapacityFactor" runat="server" Visible="false" ><%#Eval("CapacityFactor") %></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="控制<br/>项目类型<span class='req-star'>*</span>"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rblIsCtrlProjType" onclick='changeReq(this)'  req="1"
                                RepeatDirection="Horizontal" key='<%#Eval("QualificationID") %>' ActiveStatus="(23.资格申报)">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            </asp:RadioButtonList>
                            <input id="hiIsControlProject" runat="server" type="hidden" value='<%#Eval("IsControlProject") %>' />
                            <asp:Label ID="lblIsControlProject" runat="server" Visible="false"></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="项目类型">
                        <ItemTemplate>
                            <div style="clear: both">
                                <div style="float: left; width: 80%">
                                    <zhongsoft:LightTextBox runat="server" ID="tbProjType" Height="50px"  Width="100%"  Text='<%#Eval("ParamProjectTypeNames") %>'
                                        activestatus="(23.资格申报)" CssClass="kpms-textarea" TextMode="MultiLine" EnableTheming="false"></zhongsoft:LightTextBox>
                                    <input type="hidden" runat="server" id="hiXml" />
                                </div>
                                <div style="float: left; width: 19px; padding-left: 0px">
                                    <asp:LinkButton runat="server" ID="btnProjType" Style="height: 18px; width: 20px; padding: 0px"
                                        CssClass="btn-look-up" EnableTheming="false" displaystatus="(23.资格申报)">
                                                <img src="<%=WebAppPath %>/Themes/Images/look-up.gif"  style="padding:0px"/>
                                    </asp:LinkButton>
                                </div>
                            </div>
                            <input id="hiParamProjectTypeIDs" runat="server" type="hidden" value='<%#Eval("ParamProjectTypeIDs") %>' />
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="控制<br/>项目专业<span class='req-star'>*</span>"
                        HeaderStyle-Width="40px">
                        <ItemTemplate>
                            <asp:RadioButtonList runat="server" ID="rblIsCtrlSpe" onclick='changeReq(this)' RepeatDirection="Horizontal"
                                key='<%#Eval("QualificationID") %>' ActiveStatus="(23.资格申报)"  req="1">
                                <asp:ListItem Value="1">是</asp:ListItem>
                                <asp:ListItem Value="0" Selected="True">否</asp:ListItem>
                            </asp:RadioButtonList>
                         <input id="hiIsControlSpecialty" runat="server" type="hidden" value='<%#Eval("IsControlSpecialty") %>' />
                         <asp:Label ID="lblIsControlSpecialty" runat="server" Visible="false" ></asp:Label>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="专业">
                        <ItemTemplate>
                              <div style="clear:both">
                                  <div style="float: left;width:70%">
                                      <zhongsoft:LightTextBox runat="server" ID="tbSpeType" TextMode="MultiLine" ActiveStatus="(23.资格申报)"
                                          CssClass="kpms-textarea" EnableTheming="false" Text='<%#Eval("ParamSpecialtyTypeNames") %>'>
                                      </zhongsoft:LightTextBox>
                                      <input type="hidden" runat="server" id="hiSpeXml" />
                                      <input id="hiParamSpecialtyTypeIDs" runat="server" type="hidden" value='<%#Eval("ParamSpecialtyTypeIDs") %>' />
                                      <input type="hidden" runat="server" id="hiSpeName" value='<%#Eval("ParamSpecialtyTypeNames") %>' />
                                      <input type="hidden" runat="server" id="hiTitle" /> 
                                  </div>
                                  <div style="float: left; width: 19px; padding-left: 0px">
                                      <asp:LinkButton runat="server" ID="btnSpeType" Style="height: 18px; width: 20px; padding: 0px"
                                          CssClass="btn-look-up" EnableTheming="false" displaystatus="(23.资格申报)">
                                                <img src="<%=WebAppPath %>/Themes/Images/look-up.gif"  style="padding:0px"/>
                                      </asp:LinkButton>
                                  </div>
                              </div>                            
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                    <zhongsoft:LightTemplateField HeaderText="描述">
                        <ItemTemplate>
                            <zhongsoft:LightTextBox runat="server" ID="tbDescription" TextMode="MultiLine" ActiveStatus="(23.资格申报)"
                                MaxLength="1024" CssClass="kpms-textarea" EnableTheming="false" text='<%#Eval("Description") %>'>
                            </zhongsoft:LightTextBox>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                     <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" Visible="false">
                        <ItemTemplate>
                            <asp:LinkButton ID="lbDelete" runat="server" CommandName="Del" EnableTheming="false"
                                CommandArgument='<%#Eval("PostQualificDetailID") %>'>
                                    <img alt="删除" onclick="if(!confirm('确认要删除吗？')) return false;" src="<%=WebAppPath %>/Themes/Images/btn_dg_delete.gif"   />
                            </asp:LinkButton>
                        </ItemTemplate>
                    </zhongsoft:LightTemplateField>
                </Columns>
            </zhongsoft:LightPowerGridView>
        </td>
    </tr>
</table>
<input runat="server" type="hidden" id="hiPostQualificApplyID" field="PostQualificApplyID" tablename="EPMS_PostQualificApply" />
<script type="text/javascript">
    function ViewUser(bizId) {
        var url = "<%=WebAppPath %>/sys/OrgUsers/UserEditor.aspx?actionType=1" + "&bizId=" + bizId;
        showDivDialog(url, "", "1000", "500", null);
        return false;
    }
    function changeReq(obj) {
        var row = $(obj).parent().parent();
        setReq(row);
    }
    //更具所在行的状态设置项目类型与专业是否必填
    function setReq(row) {
        var tbProType = row.find("input[id$='tbProjType']");
        var tbSpeType = row.find("input[id$='tbSpeType']");
        var isChecked = row.find("input[type='checkbox']").is(':checked');
        if (isChecked) {
            var isCtrlProType = row.find("input[type='radio']:checked").eq(0).val();
            var isCtrlSpeType = row.find("input[type='radio']:checked").eq(1).val();
            tbProType.attr("req", isCtrlProType);
            tbSpeType.attr("req", isCtrlSpeType);
        }
        else {
            tbProType.attr("req", "0");
            tbSpeType.attr("req", "0");
        }
    }
    $tbId = "";//文本框
    $hiName = "";//文本隐藏域
    $hiId = "";//id隐藏域
    $hiXmlId = ""; //xml
    //选择项目类型
    function setProjType(userId, qualificationID, tbId, hidId,hixml) {
        if (userId == "") { alert("请先选择用户！"); return false; }
        if (qualificationID == "") { alert("请先选择资质名称！"); return false; }
        $tbId = tbId;
        $hiId = hidId;
        $hiXmlId = hixml;
        var xml = $("#" + hixml).val();
        var url = buildQueryUrl("EPMS/List/OBS/QuaProjTypeEditor.aspx", { "userId": userId, "qualificationID": qualificationID });
        showDivDialog(encodeURI(url), xml, 1000, 700, afterParamFilter);
        return false;
    }
    function afterParamFilter(re) { 
        var arr = re.split('|');
        $("#" + $hiXmlId).val(arr[0]);
        $("#" + $hiName).val(arr[1]);
        $("#" + $tbId).val(arr[1]);
        $("#" + $hiId).val(arr[2]);
        return false;
    }
    //配置专业
    function setSpeType(tbId,hiSpeName,hidId, hixml,hiTitle) {
        $tbId = tbId;
        $hiName = hiSpeName;
        $hiId = hidId;
        $hiXmlId = hixml;
        var xml = $("#" + hixml).val();
        xml = xml + "|" + $("#" + hiTitle).val();
        var url = buildQueryUrl("EPMS/Obsolete/SpeTypeSelector.aspx", null);
        showDivDialog(encodeURI(url), xml, 890, 350, afterParamFilter);
        return false;
    }
</script>
