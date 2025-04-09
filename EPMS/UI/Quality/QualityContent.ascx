<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="QualityContent.ascx.cs"
    Inherits="Zhongsoft.Portal.EPMS.UI.Quality.QualityContent" %>
<%@ Register Src="../../../Sys/FileDocument/AttachmentView.ascx" TagName="AttachmentView"
    TagPrefix="uc1" %>

    <table class="tz-table">
            <tr runat="server" id="trAddJudgeContent">
            <td colspan="4" class="flexible">
                <span content="JudgeContent">评审内容</span>
            </td>
            <td align="right" colspan="2" style="border-right: 1px solid #cbccce;">
                <asp:Button ID="btnAddJudgeContent" runat="server" Text="新增评审内容" activestatus="(3.*)"
                    displaystatus="(3.*)" OnClientClick="return EditContent('2','')" OnClick="btnAddJudgeContent_Click"
                    content="AddJudgeContent" />
                <asp:Button ID="btnDownLoad" runat="server" Text="批量下载附件" OnClientClick="return downloadFile();"
                    Visible="false" />
            </td>
        </tr>
        <tr>
            <td colspan="6" style="border-right: 1px solid #cbccce;">
                <zhongsoft:LightPowerGridView ID="gridView" runat="server" PageSize="100" Width="100%"
                    AutoGenerateColumns="False" UseDefaultDataSource="true" AllowSorting="true" OnRowDataBound="gridView_RowDataBound"
                    DataKeyField="QualityActivityContentID" ItemShowLength="20" BindGridViewMethod="UserControl.BindGrid">
                    <Columns>
                        <asp:TemplateField HeaderText="序号" ItemStyle-Width="5%" ItemStyle-HorizontalAlign="Center"
                            ItemStyle-Wrap="false">
                            <ItemTemplate>
                                <span onclick="ShowHidden('<%#Eval("QualityActivityContentID") %>',event)">
                                    <img src="<%=WebAppPath%>/themes/Images/TreeImages/minus.gif" alt="合并" /></span>
                                <%# Container.DataItemIndex+1 %>
                                <input type="hidden" runat="server" id="hiKeyId" value='<%#Eval("QualityActivityContentID") %>' />
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Wrap="False" Width="5%"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="专业名称" ItemStyle-Width="60px">
                            <ItemTemplate>
                                <%#Eval("SpecialtyName")%>
                            </ItemTemplate>
                            <ItemStyle Width="40%"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="评审主题">
                            <ItemTemplate>
                                    <asp:Label ID="lbTheme" ToolTip='<%#Eval("Theme") %>' Text='<%#Convert.ToString(Eval("Theme")).Length > 15 ? Eval("Theme").ToString().Substring(0, 15) + "..." : Eval("Theme") %>' runat="server" Style="color: #0000FF;
                                        text-decoration: underline; cursor: pointer">
                                    </asp:Label>
                                <%--  <a onclick="return EditContent('1','<%#Eval("QualityActivityContentID") %>')" title='<%# Eval("Theme")%>'
                                    style="color: #0000FF; text-decoration: underline">
                                    <%#Eval("Theme").ToString().Length > 20 ? Eval("Theme").ToString().Substring(0, 20) + "..." : Eval("Theme")%>
                                </a>--%>
                            </ItemTemplate>
                            <ItemStyle Width="40%"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="评审内容">
                            <ItemTemplate>
                                    <asp:Label ID="lbContent" ToolTip='<%#Eval("Content") %>' Text='<%#Convert.ToString(Eval("Content")).Length > 15 ? Eval("Content").ToString().Substring(0, 15) + "..." : Eval("Content") %>' runat="server">
                                    </asp:Label>
                            </ItemTemplate>
                            <ItemStyle Width="30%"></ItemStyle>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField HeaderText="附件" ItemStyle-Width="30%">
                            <ItemTemplate>
                                <uc1:AttachmentView ID="AttaListFile" runat="server" />
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <zhongsoft:LightTemplateField HeaderText="上传附件">
                            <ItemTemplate>
                                <zhongsoft:LightFileUploader runat="server" ID="fu" CssClass="subtoolbarlink" EnableTheming="false"
                                    FileSourceFlag="Module" FileSourceId='<%#Eval("QualityActivityContentID") %>'
                                    CommandName="uploader" OnClick="fu_Click">
                            <span>
                                <img id="imgFile" src="<%=WebAppPath%>/Themes/Images/ico_fujian.gif" alt="上传文件" width="16"
                                    height="16" />上传文件</span>
                                </zhongsoft:LightFileUploader>
                            </ItemTemplate>
                        </zhongsoft:LightTemplateField>
                        <asp:TemplateField HeaderText="评审结论<span class='req-star'>*</span>" ItemStyle-Width="30%">
                            <ItemTemplate>
                                <asp:Label ID="lbResult" runat="server" Text='<%#Eval("Measure") %>'></asp:Label>
                                <zhongsoft:LightDropDownList ID="ddlResult" runat="server" Width="120px" content="ddlResult">
                                </zhongsoft:LightDropDownList>
                            </ItemTemplate>
                            <ItemStyle Width="30%"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="添加<br>评审意见" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEditOpinion" runat="server" EnableTheming="false" OnClientClick="return false">
                                            <img alt="img" src="<%=WebAppPath%>/Themes/Images/TreeImages/plus.gif" 
                                            onclick="return EditOpinion('2','','<%# Eval("QualityActivityContentID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="编辑" ItemStyle-Width="40px" ItemStyle-HorizontalAlign="Center">
                            <ItemTemplate>
                                <asp:LinkButton ID="lbtnEditContent" runat="server" EnableTheming="false" OnClientClick="return false">
                                            <img alt="img" src="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" 
                                            onclick="EditContent('3','<%# Eval("QualityActivityContentID") %>');"/>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <ItemStyle HorizontalAlign="Center" Width="40px"></ItemStyle>
                        </asp:TemplateField>
                        <asp:TemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%"
                            HeaderStyle-Wrap="false">
                            <ItemTemplate>
                                <asp:LinkButton ID="ibtnDelReview" runat="server" OnCommand="ibtnDelReview_Click"
                                    EnableTheming="false" CommandArgument='<%#Eval("QualityActivityContentID") %>'>
                                    <img alt="删除" src="<%=WebAppPath%>/Themes/Images/btn_dg_delete.gif" onclick='return BeforeDelete("<%#Eval("QualityActivityContentID") %>");'/>
                                </asp:LinkButton>
                            </ItemTemplate>
                            <HeaderStyle Wrap="False"></HeaderStyle>
                            <ItemStyle HorizontalAlign="Center" Width="5%"></ItemStyle>
                        </asp:TemplateField>
                        <zhongsoft:LightTemplateField ItemStyle-Width="0px" HeaderStyle-Width="0px" ShowHeader="false">
                            <ItemTemplate>
                                <tr id="tr<%#Eval("QualityActivityContentID") %>">
                                    <td>
                                    </td>
                                    <td colspan="8">
                                        <asp:UpdatePanel runat="server" ID="UpdatePanel2" UpdateMode="Conditional">
                                            <ContentTemplate>
                                                <zhongsoft:LightPowerGridView ID="pdgOptionList" runat="server" AutoGenerateColumns="False"
                                                    ShowHeader="false" PageSize="100" OnRowDataBound="pdgOptionList_ItemDataBound"
                                                    OnRowCommand="pdgOptionList_ItemCommand" UseDefaultDataSource="true" BindGridViewMethod="UserControl.BindGrid"
                                                    Width="100%" DataKeyField="QualityDealOpinionID" ItemShowLength="40" EnableTheming="false"
                                                    HeaderStyle-BorderColor="#d5d4d9" HeaderStyle-BorderWidth="1" HeaderStyle-HorizontalAlign="Center">
                                                    <Columns>
                                                        <asp:TemplateField HeaderText="评审意见" ItemStyle-Width="35%">
                                                            <ItemTemplate>
                                                                <a onclick="return EditOpinion(1,'<%#Eval("QualityDealOpinionID") %>','')" title='<%# Eval("JudgeOpinion")%>'
                                                                    style="color: #0000FF; text-decoration: underline">
                                                                    <%#Convert.ToString(Eval("JudgeOpinion")).Length > 15 ? Eval("JudgeOpinion").ToString().Substring(0, 15) + "..." : Eval("JudgeOpinion")%>
                                                                </a>
                                                                <input type="hidden" id="hiQualityDealOpinionID" runat="server" value='<%#Eval("QualityDealOpinionID") %>'
                                                                    apptype='<%#Eval("QualityDealOpinionID") %>' />
                                                                <input type="hidden" id="hiContentID" runat="server" value='<%#Eval("QualityActivityContentID") %>'
                                                                    apptype='<%#Eval("QualityActivityContentID") %>' />
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <asp:TemplateField HeaderText="相关专业" ItemStyle-Width="25%">
                                                            <ItemTemplate>
                                                                <asp:Label ID="lbReleSpe" runat="server"></asp:Label>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <zhongsoft:LightTemplateField HeaderText="附件" ItemStyle-Width="30%">
                                                            <ItemTemplate>
                                                                <uc1:AttachmentView ID="OptionAttaListFile" runat="server" />
                                                            </ItemTemplate>
                                                            <%--  <ItemStyle Width="30%"></ItemStyle>--%>
                                                        </zhongsoft:LightTemplateField>
                                                        <zhongsoft:LightTemplateField HeaderText="上传附件">
                                                            <ItemTemplate>
                                                                <zhongsoft:LightFileUploader runat="server" ID="Optionfu" CssClass="subtoolbarlink"
                                                                    EnableTheming="false" FileSourceFlag="Module" FileSourceId='<%#Eval("QualityDealOpinionID") %>'
                                                                    CommandName="uploader">
                                                                    <span>
                                                                    <img id="imgFile" src="<%=WebAppPath%>/Themes/Images/ico_fujian.gif" alt="上传文件" width="16" height="16" />
                                                                    上传附件</span>
                                                                </zhongsoft:LightFileUploader>
                                                            </ItemTemplate>
                                                            <ItemStyle Width="30%"></ItemStyle>
                                                        </zhongsoft:LightTemplateField>
                                                        <asp:TemplateField HeaderText="编辑" ItemStyle-HorizontalAlign="Center" ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnEdit" runat="server" OnClick="lbtnEdit_Click">
                                                            <img alt="" src="<%=WebAppPath%>/Themes/Images/btn_dg_edit.gif" border='0' 
                                                            onclick="return EditOpinion('3','<%# Eval("QualityDealOpinionID") %>');" />
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                        </asp:TemplateField>
                                                        <zhongsoft:LightTemplateField HeaderText="删除" ItemStyle-HorizontalAlign="Center"
                                                            ItemStyle-Width="5%">
                                                            <ItemTemplate>
                                                                <asp:LinkButton ID="lbtnDelete" runat="server" CommandName="DelDate" CommandArgument='<%#Eval("QualityDealOpinionID") %>'>
                                                        <img alt="" border="0" onclick="return confirm('确认要删除吗？');" 
                                                            src="<%=WebAppPath%>/Themes/Images/btn_dg_delete.gif" />
                                                                </asp:LinkButton>
                                                            </ItemTemplate>
                                                        </zhongsoft:LightTemplateField>
                                                    </Columns>
                                                </zhongsoft:LightPowerGridView>
                                            </ContentTemplate>
                                        </asp:UpdatePanel>
                                    </td>
                                </tr>
                            </ItemTemplate>
                            <ItemStyle Width="0px"></ItemStyle>
                        </zhongsoft:LightTemplateField>
                    </Columns>
                    <PagerStyle HorizontalAlign="Right"></PagerStyle>
                </zhongsoft:LightPowerGridView>
            </td>
        </tr>
    </table>

<input runat="server" id="hiProjectId" type="hidden" />
<input runat="server" id="hiXml" type="hidden" />
<script type="text/javascript" language="javascript">
    
    //添加、编辑、查看：评审内容
    function EditContent(actionType, bizId) {
        if ("Create" == '<%=ActionType %>') {
            alert("-请先保存数据。");
            return false;
        }
        var xml = $("#<%=hiXml.ClientID %>").val();
        var json = { FormId: "<%=BusinessId %>", actionType: actionType, bizId: bizId, FormCode: "<%=FormCode %>" };
        if (actionType == "2") {
            json = { FormId: "<%=BusinessId %>", actionType: actionType, FormCode: "<%=FormCode %>" };
        }
        if (currAct == "汇总各专业意见"||currAct=="汇总") {
            json = { FormId: "<%=BusinessId %>", actionType: actionType, bizId: bizId, editType: "result", FormCode: "<%=FormCode %>" };
        }
        if ("<%=FormCode %>" == "EPMS36") {//ShowSpecialyt
            json = { FormId: "<%=BusinessId %>", actionType: actionType, bizId: bizId, ShowSpecialty: "1", FormCode: "<%=FormCode %>" ,CurrAct:currAct};
        }
        var url = buildQueryUrl("EPMS/List/Quality/QualityContentEditor.aspx", json);
        showDivDialog(encodeURI(url), xml, 550, 400, afterAddSpecialty);
        return true;
    }

    //添加、编辑、查看：评审意见
    function EditOpinion(actionType, bizId, pId) {
        var xml = $("#<%=hiXml.ClientID %>").val();
        var json = { pId: pId, actionType: actionType, bizId: bizId, FormCode: "<%=FormCode %>" };
        var isCanEdit;
        if (actionType == "2") {
            json = { pId: pId, actionType: actionType, opentype: "0" };
            if ("<%=FormCode %>" == "EPMS08") {
                isCanEdit="true";
                json = { pId: pId, actionType: actionType, opentype: "0" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
            }
        } else {
            if ("<%=FormCode %>" == "EPMS07") {
                //综合评审
                if (currAct=="填写设计评审单"||currAct == "填写评审记录表" || currAct.indexOf("修改")>-1) {
                    if(actionType=="1"){
                        isCanEdit="false";
                    }
                    else{
                        isCanEdit="true";
                    }
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "0" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                } 
//                else if (parseBool("<%=IsMainSet %>" )) {
//                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "2" ,IsCanEdit:"false"};
//                } 
//                else if (parseBool("<%=IsDirector %>")) {
//                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "3" ,IsCanEdit:"false"};
//                } 
                else if (currAct=="执行评审意见") {
                    isCanEdit="false";
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "2" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                } else if (currAct=="审核") {
                    isCanEdit="false";
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "3" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                }

            } else if ("<%=FormCode %>" == "EPMS08") {
                //专业设计评审
                if (currAct == "编制专业文件"||currAct=="填写设计评审单" || currAct.indexOf("修改")>-1) {        
                    if(actionType=="1"){
                        isCanEdit="false";
                    }
                    else{
                        isCanEdit="true";
                    }        
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "0" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                } 
//                else if (parseBool("<%=IsMainSet %>")){
//                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "2" ,IsCanEdit:"false"};
//                } 
//                else if (parseBool("<%=IsDirector %>")) {
//                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "3" ,IsCanEdit:"false"};
//                } 
                else if (currAct=="执行评审意见") {
                    isCanEdit="true";
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "2" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                } else if (currAct=="审核") {
                    isCanEdit="false";
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "3" ,IsCanEdit:isCanEdit, FormCode: "<%=FormCode %>"};
                }
            } else if ("<%=FormCode %>" == "EPMS36") {
                //确定设计原则
                if (currAct == "汇总设计原则") {
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "0" , FormCode: "<%=FormCode %>"};
                } else if (currAct == "设计原则分发存档")
                    json = { pId: pId, actionType: actionType, bizId: bizId, opentype: "2" , FormCode: "<%=FormCode %>"};
            }
        }
        //opentype 
        //0 为新建性质步骤操作是否执行、是否有质量问题可用，删除列显示
        //1为审批性质的步骤操作是否执行、是否有质量问题禁用，删除列隐藏，
        //2为主设人操作步骤，是否执行可用，是否用质量问题禁用，删除列隐藏
        //3为主任工操作步骤，是否执行禁用，是否有质量问题可用，删除列隐藏

        var url = buildQueryUrl("EPMS/List/Quality/QualityOptionEditor.aspx", json);
        showDivDialog(encodeURI(url), xml, 750, 550, afterAddSpecialty);
        return false;
    }

    function afterAddSpecialty(re) {
        $("#<%=hiXml.ClientID %>").val(re);

        clickButn();


        return false;
    }

    function clickButn() {
        <%=this.Parent.Page.ClientScript.GetPostBackEventReference(this.btnAddJudgeContent, "")%>;
        return true;
    }

    function checkBeforeDel(obj) {
        return confirm("您确定要删除吗？");
    }

    function BeforeDelete(type) {
        var opions = $("[appType=" + type + "]");
        if (opions.length > 0) {
            return confirm("该评审内容已经添加评审意见，您确定要一起删除吗？");
        }
        else {
            return confirm("您确定删除吗？");
        }
    }

    // 折叠表头
    function OnShow(divid, imgid) {
        imgid.src = document.getElementById(divid).style.display == "none" ? "<%=WebAppPath%>/Themes/Images/btn_title.gif" : "<%=WebAppPath%>/Themes/Images/btn_folder.gif";
        OpenDetail(divid);
    }

    /*隐藏嵌套的Gridview*/
    function ShowHidden(sid, ev) {
        ev = ev || window.event;
        var target = ev.target || ev.srcElement;
        var oDiv = document.getElementById("tr" + sid);
        oDiv.style.display = oDiv.style.display == "none" ? "block" : "none";
        target.src = oDiv.style.display == "none" ? "<%=WebAppPath%>/themes/Images/TreeImages/plus.gif " : "<%=WebAppPath%>/themes/Images/TreeImages/minus.gif";
    }

    ///下载附件
    function downloadFile() {
        var Ids = '<%=QualityActivityContentIDs %>';
        var urlStr = "Sys/FileDocument/BatchFileDownload.aspx?docType=product&wbsIds=" + Ids;
        showDivDialog(urlStr, null, 750, 550, afterDownloadProduct);
        return false;
    }

</script>
