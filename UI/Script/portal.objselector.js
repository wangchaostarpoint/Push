//获取更多用户
function InputParamObject() {
    this.mode = null;
    this.xmlObj = null;
    this.root = null;
    this.exparam = null;
}
function InputParamObject(mode) {
    this.mode = mode; //s or m
    this.xmlObj = new KPMSXml();
    this.xmlObj.loadXML("<root mode='" + mode + "'></root>");
    this.root = this.xmlObj.selectSingleNode("root");
    this.exparam = null;
}
InputParamObject.prototype.loadParam = function (paramXml) {
    this.xmlObj = new KPMSXml();
    this.xmlObj.loadXML(paramXml);
    this.root = this.xmlObj.selectSingleNode("root");
    if (this.root != null) {
        this.mode = this.root.getAttribute("mode");
    }
}
InputParamObject.prototype.insertParam = function (xmlStr) {
    var tempXml = new KPMSXml();
    tempXml.loadXML(xmlStr);
    var nodes = tempXml.getElementsByTagName("o");
    for (var i = 0; i < nodes.length; i++) {
        this.root.appendChild(nodes[i].cloneNode(true));
    }
}
function OutputParamObject() {
    this.xmlObj = new KPMSXml();
    this.xmlObj.loadXML("<root></root>");
    this.root = this.xmlObj.selectSingleNode("root");
}
OutputParamObject.prototype.addParam = function (id, name, obj) {
    var aEle = this.xmlObj.createElement("o");
    var attId = this.xmlObj.createAttribute("id");
    attId.value = id;
    aEle.setAttributeNode(attId);
    var attName = this.xmlObj.createAttribute("name");
    attName.value = name;
    aEle.setAttributeNode(attName);
    if (obj != null && obj.length > 0) {
        for (var i = 2; i < obj.length; i++) {
            var attEx = this.xmlObj.createAttribute("att" + i);
            if (obj[i] == null) attEx.value = "";
            else attEx.value = obj[i];
            aEle.setAttributeNode(attEx);
        }
    }
    this.root.appendChild(aEle);
}
OutputParamObject.prototype.addJsonParam = function (j) {
    var aEle = this.xmlObj.createElement("o");
    var n = 0;
    for (var i in j) {
        if (n == 0) {//确保id和name的标准
            var attId = this.xmlObj.createAttribute("id");
            attId.value = j[i];
            aEle.setAttributeNode(attId);
        } else if (n == 1) {
            var attName = this.xmlObj.createAttribute("name");
            attName.value = j[i];
            aEle.setAttributeNode(attName);
        } else {
            var att = this.xmlObj.createAttribute(i);
            if (j[i] == null) att.value = "";
            else att.value = j[i];
            aEle.setAttributeNode(att);
        }
        n++;
    }
    this.root.appendChild(aEle);
}
OutputParamObject.prototype.removeParam = function (id) {
    this.xmlObj.removeChildNode(id, "o");
}
OutputParamObject.prototype.removeAllParam = function () {
    this.xmlObj.removeAll("o");
}
OutputParamObject.prototype.loadParam = function (paramXml) {
    this.xmlObj.loadXML(paramXml);
    this.root = this.xmlObj.selectSingleNode("root");
}

//build selector's UI
function buildSelector(reid, param, filter, url, width, height) {
    if (filter != null) {
        if (typeof (filter) == "string") {
            if (url.indexOf("?") >= 0) {
                url += "&f=" + filter;
            }
            else {
                url += "?f=" + filter;
            }
        }
        else {
            url = buildQueryUrl(url, filter);
        }
    }
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var opo = window.showModal(encodeURI(url), param, width, height);
    if (opo != undefined) {
        $("#" + reid).val(opo);
        var xmlObj = new KPMSXml();
        xmlObj.loadXML(opo);
        return xmlObj;
    }
    return null;
}

function buildDivSelector(reid, param, json, url, width, height, callback) {
    json = $.extend({}, { "dialog_mode": "Dialog" }, json);
    url = buildQueryUrl(url, json);
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param.xmlObj.xml());
    url = buildQueryUrl(url, { param_hi_id: $dialogDiv.children("input").attr("id") });
    $dialogDiv.dialog({
        height: height,
        width: width,
        modal: true,
        open: function () { $dialogDiv.children("iframe").attr("src", encodeURI(url)); },
        close: function () {
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //  $dialogDiv.remove(); IE9在此删除会报脚本错误。
        },
        buttons: {
            "确定": function () {
                if (reid == undefined || reid == '') {
                    //调用页面的doFinish方法，执行数据操作
                    $dialogDiv.children("iframe")[0].contentWindow.doFinish();
                }
                var resultxml = new KPMSXml();
                var xml = $dialogDiv.children("iframe")[0].contentWindow.getOutPutParam();
                $dialogDiv.dialog("close");
                $("#" + reid).val(xml);
                resultxml.loadXML(xml);
                if (typeof (callback) == "function") {
                    callback(resultxml);
                }
            },
            "取消": function () {
                $dialogDiv.dialog("close");
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}

//传阅专用 由上方通用方法简化而来 通用方法不显示传阅结果的弹框提示 create by duxk on 2019-4-26
function buildDivSelectorNoAutoClose(reid, param, json, url, width, height) {
    json = $.extend({}, { "dialog_mode": "Dialog" }, json);
    url = buildQueryUrl(url, json);
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param.xmlObj.xml());
    url = buildQueryUrl(url, { param_hi_id: $dialogDiv.children("input").attr("id") });
    $dialogDiv.dialog({
        height: height,
        width: width,
        modal: true,
        open: function () { $dialogDiv.children("iframe").attr("src", encodeURI(url)); },
        close: function () {
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //  $dialogDiv.remove(); IE9在此删除会报脚本错误。
        },
        buttons: {
            "确定": function () {
                $dialogDiv.children("iframe")[0].contentWindow.doFinish();
            },
            "取消": function () {
                $dialogDiv.dialog("close");
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}

//重写流程中关联方法 因为json生成不对 重写了一下 create by duxk on 2019-4-26
function buildDivSelectorRelationNew(reid, param, json, url, width, height, callback) {
    //json = $.extend({}, { "dialog_mode": "Dialog" }, json)
    if (json != null) {
        if (typeof (json) == "string") {
            if (url.indexOf("?") >= 0) {
                url += "&dialog_mode=Dialog&f=" + json;
            }
            else {
                url += "?dialog_mode=Dialog&f=" + json;
            }
        }
        else {
            url = buildQueryUrl(url, filter);
        }
    }
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param.xmlObj.xml());
    url = buildQueryUrl(url, { param_hi_id: $dialogDiv.children("input").attr("id") });
    $dialogDiv.dialog({
        height: height,
        width: width,
        modal: true,
        open: function () { $dialogDiv.children("iframe").attr("src", encodeURI(url)); },
        close: function () {
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //  $dialogDiv.remove(); IE9在此删除会报脚本错误。
        },
        buttons: {
            "确定": function () {
                if (reid == undefined || reid == '') {
                    //调用页面的doFinish方法，执行数据操作
                    $dialogDiv.children("iframe")[0].contentWindow.doFinish();
                }
                var resultxml = new KPMSXml();
                var xml = $dialogDiv.children("iframe")[0].contentWindow.getOutPutParam();
                $dialogDiv.dialog("close");
                $("#" + reid).val(xml);
                resultxml.loadXML(xml);
                if (typeof (callback) == "function") {
                    callback(resultxml);
                }
            },
            "取消": function () {
                $dialogDiv.dialog("close");
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}


function getUsers(reid, param, filter) {
    //把选择页面统一调用UserSelectorJson页面
    //"/Sys/OrgUsers/UserSelector.aspx"
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/UserSelectorJson.aspx";
    return buildSelector(reid, param, filter, url, 800, 600);
}
//按照新人资整合Json形式
function getUsersNew(reid, param, filter) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/UserSelectorJson.aspx";
    return buildSelector(reid, param, filter, url, 800, 700);
}
//人员选择页面弹出Div
function getDivUsersNew(reid, param, filter, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/UserSelectorJson.aspx";
    return buildDivSelector(reid, param, filter, url, 800, 700, callback);
}
function getOrgs(reid, param, filter) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/OrgSelector.aspx";
    return buildSelector(reid, param, filter, url, 700, 660);
}

//add by yangyj 20181109
function getTreeOrgs(reid, param, filter, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/OrgSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 700, 660, callback);
}
//按照新人资整合Json形式
function getOrgsNew(reid, param, filter) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/OrgSelectorJson.aspx";
    return buildSelector(reid, param, filter, url, 600, 500);
}

//按照新人资整合Json形式
function getDivOrgsNew(reid, param, filter, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/OrgSelectorJson.aspx";
    return buildDivSelector(reid, param, filter, url, 750, 660, callback);
}


//tree类型部门选择
function getOrgTree(reid, param, filter, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/OrgTreeSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 500, 560, callback);
}


//市场相关部门
function getMarketRelateOrgs(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/MarketRelateDeptSelector.aspx";
    return buildSelector(reid, param, filter, url, 600, 500);
}

function getRoles(reid, param, filter) {
    var url = $appCtx.portalUrl + "/Sys/RoleSelector.aspx";
    return buildSelector(reid, param, filter, url, 600, 600);
}
function getDeptRoles(reid, param, filter) {
    var url = $appCtx.portalUrl + "/Sys/RoleUser/RoleSelector.aspx";
    return buildSelector(reid, param, filter, url, 600, 600);
}
function getProjects(reid, param, filter) {
    var url = $appCtx.appPath + "/EPMS/Obsolete/ProjectSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

function getTechProjects(reid, param, filter) {
    var url = $appCtx.portalUrl + "/FM/List/TechProjectSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

function getGSProjects(reid, param, filter) {
    var url = $appCtx.portalUrl + "/EPMS/List/ProjectInfo/GSProjectSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}
//选择合同（财务用）
function getContracts(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/ContractSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}
//选择合同
function getMarketContracts(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/List/MarketContractSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}
//选择阶段
function getPhases(reid, param, filter) {
    var url = $appCtx.portalUrl + "/EPMS/List/ProjectInfo/PhaseSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}
//选择工程
function getProjectEntity(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/ProjectEntitySelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}

//选择客户
function getCustomer(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/CustomerSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}
//选择客户联系人
function getCustomerContacter(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/CustomerContacterSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 620);
}

function getSupplierAndCuntomer(reid, param, filter) {
    var url = $appCtx.appPath + "/CRM/List/SupCusSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

function getSupplyEntity(reid, param, filter) {
    var url = $appCtx.portalUrl + "/MM/List/SupplyEntitySelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

function getDivPurchaseProj(reid, param, filter, callBack) {
    var url = $appCtx.portalUrl + "/MM/Obsolete/PurchaseProjectSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 700, 600, callBack);
}

//开票选择开票信息
function getContractChargeBilling(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/List/ContractChargeBillingSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

function getExpenseItem(reid, param, filter) {
    var url = $appCtx.portalUrl + "/FM/List/ExpenseItemSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

function getLoans(reid, param, filter) {
    var url = $appCtx.portalUrl + "/FM/List/LoanApplySelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//#region 人资模块

//选择岗位
function getPosition(reid, param, filter) {
    var url = $appCtx.portalUrl + "/EHR/Obsolete/PositionSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择岗位Div
function getDivPosition(reid, param, filter, callback) { 
    return buildDivSelector(reid, param, filter, buildQueryUrl("EHR/Obsolete/PositionSelector.aspx", null), 700, 600, callback);
}

//选择流程人员跟踪办理事项
function getTraceItem(reid, param, filter) {
    var url = $appCtx.portalUrl + "/EHR/Obsolete/ParamTraceItemSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}
//选择流程人员跟踪办理事项DIV
function getDivTraceItem(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EHR/Obsolete/ParamTraceItemSelector.aspx", null), 850, 550, callback);
}

//选择劳动合同
function getLaborContract(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("/EHR/List/LaborContractManagement/ExpireLaborContractSelector.aspx", null), 850, 750);
}

//选择劳动合同
function getDivLaborContract(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EHR/List/LaborContractManagement/ExpireLaborContractSelector.aspx", null), 850, 600, callback);
}

//选择培训项目
function getTrainProject(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("/EHR/List/TrainManagement/TrainProjectSelector.aspx", null), 850, 750);
}

function getPassport(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("/EHR/List/ExternalAffaris/BusinessPassportSelector.aspx", null), 850, 750);
}

//#endregion 人资模块

//#region 车辆模块

//选择驾驶员
function getDriver(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/DriverSelector.aspx", null), 650, 600);
}

//选择车辆
function getCar(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/CarSelector.aspx", null), 750, 600);
}
//选择驾驶员DIV
function getDivDriver(reid, param, filter, callback) { 
    return buildDivSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/DriverSelector.aspx", null), 700, 600, callback);
}
//选择车辆DIV
function getDivCar(reid, param, filter, callback) { 
    return buildDivSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/CarSelector.aspx", null), 800, 600, callback);
}
//获取维修厂信息
function getFactory(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/RepairFactorySelector.aspx", null), 550, 600);
}

//#endregion 

//#region 公用模块

//获取生产项目信息(弹出层方式)
function getDivProject(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectEntitySelector.aspx", null), 850, 550, callback);
}

//获取生产项目信息（最新，弹出层方式）add by likun 20150701
function getDivProjectNew(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectEntitySelector.aspx", null), 850, 600, callback);
}

//获取生产项目信息
function getProject(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectEntitySelector.aspx", null), 850, 600);
}

//获取总包项目信息
function getGCProject(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("EM/Obsolete/GeneralCProjectSelector.aspx", null), 850, 600);
}

//获取总包项目信息
function getDivGCProject(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EM/Obsolete/GeneralCProjectSelector.aspx", null), 850, 600, callBack);
}

//获取科研项目信息
function getTechProject(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("EM/Obsolete/TechProjectSelector.aspx", null), 850, 600);
}

//获取科研项目信息
function getDivTechProject(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EM/Obsolete/TechProjectSelector.aspx", null), 850, 550, callBack);
}


//#endregion 公用模块

//获取收文号
function getReceiveFile(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("KOA/List/ReceiveFileSelector.aspx", null), 730, 600);
}

function getTaskEntity(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MBO/List/TaskSelector.aspx", null), 800, 600);
}

function setWorkflowMapping(reid, param, filter, callback) {
    //return buildSelector(reid, param, filter, buildQueryUrl("Sys/Relation/RelationSelector.aspx", null), 730, 650);
    return buildDivSelectorRelationNew(reid, param, filter, buildQueryUrl("Sys/Relation/RelationSelector.aspx", null), 730, 650, callback);
}
function forwordForm(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Sys/Workflow/FormForward.aspx", null), 730, 620);
}
//选择页面
function getPage(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Sys/Menu/PageSelector.aspx", null), 650, 600);
}

//选择表单
function getForm(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Sys/Workflow/WfFormSelector.aspx", null), 650, 600);
}

//选择表单（Div弹出层方式）
function getDivForm(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("Sys/Workflow/WfFormSelector.aspx", null), 650, 600, callback);
}

//选择UserForm
function getUserForm(reid, param, filter, callback) {
    var url = $appCtx.appPath + "/Sys/UserComFunction/UserFormSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 700, 630, callback);
}

//选择业务数据字典数据表
function getDict(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("BDM/List/DictSelector.aspx", null), 650, 600);
}

//选择业务数据字典数据表（Div弹出层方式）
function getDivDict(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("BDM/List/DictSelector.aspx", null), 850, 600, callback);
}

//选择自定义列表
function getXList(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Custom/List/ListSelector.aspx", null), 650, 600);
}

//选择自定义页面
function getXPage(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Custom/List/XPageSelector.aspx", null), 650, 600);
}
//选择自定义编辑页面
function getXEditor(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Custom/List/XEditorSelector.aspx"), 650, 600);
}

//选择系统参数
function getSysParam(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("Sys/Param/ParamSelector.aspx", null), 650, 600);
}

function getDivUsers(reid, param, json, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/UserSelector.aspx";
    return buildDivSelector(reid, param, json, url, 500, 500, callback);
}

//选择航空机票供应商
function getTicketsProvider(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/TicketsProviderSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择烟酒供应商
function getGoodsProvider(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/GoodsProviderSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择烟酒
function getGoods(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/GoodsSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择会议室
function getMeetingRoom(reid, param, filter, startTime, endTime) {
    var url = $appCtx.portalUrl + "/GM/List/GCM/MeetingRoomSelector.aspx?startTime=" + startTime + "&endTime=" + endTime;
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择乘机人信息
function getPassenger(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/TicketsBookingSelector.aspx";
    return buildSelector(reid, param, filter, url, 1000, 600);
}

//选择需要报销的汽车租赁记录
function getNeedAccount(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/CarRentDetailSelector.aspx";
    return buildSelector(reid, param, filter, url, 800, 600);
}

//选择需要报销的车辆维修记录
function getCarAccount(reid, param, filter) {
    var url = $appCtx.portalUrl + "/GM/Obsolete/CarMaintainDetailSelector.aspx";
    return buildSelector(reid, param, filter, url, 730, 600);
}

//选择物品信息
function getGoods(reid, param, filter) {
    var url = $appCtx.appPath + "/GM/Obsolete/GoodsSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

//选择内审、外审、管理评审计划审批
function getStandardValidationPlan(reid, param, filter) { 
    var url = $appCtx.portalUrl + "/QSM/Obsolete/StandardValidationPlanSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

//#region 财务模块

function getLoanCharge(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/LoanChargeSelector.aspx", null), 750, 550, callBack);
}

function getBidLoanCharge(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/BidSecurityLoanSelector.aspx", null), 650, 600);
}

function getInvoice(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/InvoiceSelector.aspx", null), 850, 600);
}

function getUsedInvoice(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/InvoiceUsedSelector.aspx", null), 850, 600);
}

function getDivUsedInvoice(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/InvoiceUsedSelector.aspx", null), 850, 600, callBack);
}

function getDivInvoice(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/InvoiceSelector.aspx", null), 850, 600, callBack);
}

//获取已收费未开票项目信息
function getNotInvoiceProj(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("EM/Obsolete/NotInvoiceProjSelector.aspx", null), 650, 600);
}

//选择部门预算信息
function getBudgetProjInfo(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("BM/Obsolete/BudgetSelector.aspx", null), 650, 600);
}

//#endregion 财务模块

//#region 市场营销管理模块
//选择合同
function getContract(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/Obsolete/ContractSelector.aspx";
    return buildSelector(reid, param, filter, url, 1000, 1000);
}

//选择合同
function getDivContract(reid, param, filter, callBack) {
    var url = $appCtx.appPath + "/MM/Obsolete/ContractSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 800, 600, callBack);
}

//选择合同
function getDivContractNew(reid, param, filter, callBack) {
    var url = $appCtx.appPath + "/MM/Obsolete/ContractSelectorNew.aspx";
    return buildDivSelector(reid, param, filter, url, 800, 600, callBack);
}

//选择委托书
function getTask(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/Obsolete/TaskSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

//选择工程立项审批
function getProjectTask(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/Obsolete/ProjectTaskSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

//选择生产任务下达
function getProjectTaskIssued(reid, param, filter) {
    var url = $appCtx.appPath + "/MM/Obsolete/ProjectIssuedTaskSelector.aspx";
    return buildSelector(reid, param, filter, url, 900, 620);
}

//选择任务下达阶段（弹出层方式）add by xiedx 20150429
function getPhaseTask(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/ProjectPhaseTaskSelector.aspx", null), 850, 550, callback);
}

//选择市场项目
function getMarketProjects(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/MarketProjectSelector.aspx", null), 850, 600);
}

//选择市场项目
function getMarketDivProjects(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/MarketProjectSelector.aspx", null), 850, 600, callback);
}

//选择投标项目
function getTenderProjects(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/TenderEntitySelector.aspx", null), 650, 600);
}

//选择科标业项目
function getEPSProject(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("TSM/Obsolete/EnterPriseStandardSelector.aspx", null), 650, 600);
}
//选择科标业项目弹出DIv
function getDivEPSProject(reid, param, filter, callback) {
    var url = $appCtx.portalUrl + "/TSM/Obsolete/EnterPriseStandardSelector.aspx";
    return buildDivSelector(reid, param, filter, url, 800, 680, callback);
}

//获取客户信息
function getCustomer(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/CustomerSelector.aspx", null), 650, 600);
}

//获取客户信息
function getDivCustomer(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/CustomerSelector.aspx", null), 650, 600, callBack);
}

//获取客户联系人信息
function getCustomerContact(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/CustomerContactSelector.aspx", null), 650, 600);
}

//获取客户联系人信息
function getDivCustomerContact(reid, param, filter, callBack) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/CustomerContactSelector.aspx", null), 650, 600, callBack);
}

//#endregion

//#region 党工团模块选择页面信息

//选择党员信息
function getPartyUser(reid, param, filter) {
    var url = $appCtx.portalUrl + "/PUM/Obsolete/PUMUnionOrPartyUserSelector.aspx";
    return buildSelector(reid, param, filter, url, 500, 600);
}

//选择预算科目信息
function getBudget(reid, param, filter) {
    var url = $appCtx.portalUrl + "/PUM/Obsolete/UnionBudgetSelector.aspx";
    return buildSelector(reid, param, filter, url, 500, 600);
}

//选择测评试题信息
function getQuestion(reid, param, filter) {
    var url = $appCtx.portalUrl + "/PUM/Obsolete/EvaluationQuestionsSelector.aspx";
    return buildSelector(reid, param, filter, url, 500, 600);
}

function getEvaluationDeptForParty(reid, param, filter, deptId) {
    var url = $appCtx.portalUrl + "/PUM/Obsolete/EvaluationSelDeptForPartySelector.aspx?deptId=" + deptId;
    return buildSelector(reid, param, filter, url, 730, 620);
}

function getEvaluationUserForParty(reid, param, filter, deptId) {
    var url = $appCtx.portalUrl + "/PUM/Obsolete/EvaluationSelMemForPartySelector.aspx?deptId=" + deptId;
    return buildSelector(reid, param, filter, url, 730, 620);
}
//endregion

// 选择风险点(企业风险库模块)
function getRiskPoints(reid, param, filter) {
    var url = buildQueryUrl("/ERL/List/RiskPointSelector.aspx", null);
    return buildSelector(reid, param, filter, url, 750, 660);
}

//region 出版管理
//选择出版消耗品类型
function getPulishGoodsType(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/PulishGoodsTypeSelector.aspx", null), 900, 620);
}

//选择出版消耗品供应商
function getPulishSupplier(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/PulishSupplierSelector.aspx", null), 900, 620);
}
//选择出版消耗品
function getPulishGoods(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/PulishGoodsSelector.aspx", null), 900, 620);
}

//选择出库存的消耗品
function getPulishGoodsInStore(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/PulishStoreGoodsSelector.aspx", null), 900, 620);
}

//endregion

//选择资格zhangchao
function getQualificationName(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("SM/Obsolete/QualificationCapacitySelector.aspx", null), 900, 620);
}

function getQualificationNameInfo(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("SM/Obsolete/QualificationCapacitySelector.aspx", null), 750, 600, callback);

}

//选择合格的资质人员
function getCapacityPerson(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("SM/Obsolete/QualifiedPersonSelector.aspx", null), 900, 620);
}

//选择采购申请的信息-招标采购
function getApplyInfo(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/PurchaseApplySelector.aspx", null), 900, 620);
}

//选择采购申请的项目信息-招标采购
function getProjInfo(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/ApplyProjectSelector.aspx", null), 900, 620);
}

//文件签名流程-选择文件页面
function getToBeSignedFile(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("FM/Obsolete/ToBeSignedFileSelector.aspx", null), 900, 620);
}

function getDivUsers(reid, param, json, callback) {
    var url = $appCtx.portalUrl + "/Sys/OrgUsers/UserSelector.aspx";
    return buildDivSelector(reid, param, json, url, 500, 500, callback);
}

//选择卷册 
function getRollInfo(reid, param, filter) {
    return buildSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/WBSSelector.aspx", null), 900, 620);
}

//#region 生产模块脚本

//选择专业（弹出层方式）add by tianhl 20150106
function getSpecialty(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/SpecialtySelector.aspx", null), 650, 550, callback);
}

function getDivSpecialty(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/SpeSelector.aspx", null), 850, 630, callback);
}

//选择专业类型（弹出层方式）add by xiedx 20150109
function getSpeType(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/SpecialtyTypeSelector.aspx", null), 650, 550, callback);
}

//选择强条模板（弹出层方式）add by tianhl 20150108
function getMandatoryTemplate(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/MandatoryTemplateSelector.aspx", null), 650, 550, callback);
}

//选择WBS任务模板（弹出层方式）add by tianhl 20150108
function getWBSTemplate(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/WBSTemplateSelector.aspx", null), 850, 550, callback);
}

//选择审通号（弹出层方式）add by xuning 20150116
function getAduitNumber(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("GM/Obsolete/AuditNumSelector.aspx", null), 850, 550, callback);
}

//生产模块选择人员 add by tianhl 20150203
function getEPMSUser(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/EPMSUserSelector.aspx", null), 850, 600, callback);
}

//选择任务 add by tianhl 20150203
function getWBS(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/WBSSelector.aspx", null), 850, 550, callback);
}

//选择资料 add by yangyj 20151017
function getFile(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/FileItemSelector.aspx", null), 850, 550, callback);
}

//选择会签人员页面 add by zhaoxm 20150513
function getSigner(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/SignSpecSelector.aspx", null), 850, 550, callback);
}

//选择项目专业 add by wangllj 20150914
function getProjSpe(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjSpeSelector.aspx", null), 850, 550, callback);
}

//选择互提资料 add by wangllj 20150914
function getFileItem(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/FileItemSelector.aspx", null), 850, 550, callback);
}
//选择质量信息
function getQualityInfo(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/QualityInfoSelector.aspx", null), 850, 550, callback);
}
//选择项目模板文件
function getProjectTemplateFile(reid, param, filter, callback) {
    return buildSpeDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectTemplateFileSelector.aspx", null), 850, 550, callback);
}

//修改确定按钮的名称
function buildSpeDivSelector(reid, param, json, url, width, height, callback) {
    json = $.extend({}, { "dialog_mode": "Dialog" }, json)
    url = buildQueryUrl(url, json);
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var $dialogDiv = buildIframeDialogDiv();
    $dialogDiv.children("input").val(param.xmlObj.xml());
    url = buildQueryUrl(url, { param_hi_id: $dialogDiv.children("input").attr("id") });
    $dialogDiv.dialog({
        height: height,
        width: width,
        modal: true,
        open: function () { $dialogDiv.children("iframe").attr("src", encodeURI(url)); },
        close: function () {
            $dialogDiv.children("iframe").removeAttr("src");
            $dialogDiv.dialog("destroy");
            //  $dialogDiv.remove(); IE9在此删除会报脚本错误。
        },
        buttons: {
            "确定生成xx工程设计计划文件": function () {
                var resultxml = new KPMSXml();
                var xml = $dialogDiv.children("iframe")[0].contentWindow.getOutPutParam();
                $dialogDiv.dialog("close");
                $("#" + reid).val(xml);
                resultxml.loadXML(xml);
                if (typeof (callback) == "function") {
                    callback(resultxml);
                }
            },
            "取消": function () {
                $dialogDiv.dialog("close");
            }
        }
    });
    setDivDialogZIndex($dialogDiv);
    return false;
}


//选择历史项目策划书
function getHistoryProjectBookFile(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectPlanBookSelector.aspx", null), 850, 550, callback);
}

//选择项目部门定额产值
function getProjectDeptValue(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/ProjectDeptValueSelector.aspx", null), 850, 600, callback);
}
//选择任务书
function getWBSBook(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/OldWBSBookSelector.aspx", null), 850, 550, callback);
}
//选择任务书模板
function getWBSBookTemplete(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/TaskBookTemplateSelector.aspx", null), 850, 550, callback);
}
//选择成品
function getDivProduct(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/ProductEntitySelector.aspx", null), 850, 550, callback);
}

//选择勘测记录
function getSurveyRecord(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/SurveyRecordContentSelector.aspx", null), 850, 550, callback);
}

//选择勘测内部管理（提出任务）
function getSurveyInnerTask(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/SurveyInnerTaskSelector.aspx", null), 850, 550, callback);
}
//选择法律法规、规程规范、通用图集、应急预案
function getRegulationItem(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/RegulationItemSelector.aspx", null), 950, 550, callback);
}

//选择危险源辨识及环境因素识别
function getIdentiyItem(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("/EPMS/Obsolete/IdentiyItemSelector.aspx", null), 950, 550, callback);
}
//#endregion 生产模块脚本

//#region 资产模块脚本

//选择人员分组
function getUserGroup(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("EPMS/Obsolete/UserGroupSelector.aspx", null), 850, 600, callback);
}


//购置资产计划选择页面
function getDivPurchaseAssetPlan(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/PurchaseAssetPlanSelector.aspx", null), 850, 550, callback);
}

//选择资产采购记录 add by likun 20150512
function getAssetPurchaseList(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/AssetPurchaseListSelector.aspx", null), 850, 550, callback);
}

//资产选择页面
function getDivAssets(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/AssetEntitySelector.aspx", null), 850, 550, callback);
}

//资产分类选择页面
function getDivAssetsClass(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/AssetClassSelector.aspx", null), 850, 550, callback);
}

//选择供应商
function getDivSupplier(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("MM/Obsolete/SupplierSelector.aspx", null), 850, 650, callback);
}

//选择低值易耗品
function getDivLowValueGoods(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/LowValueGoodsSelector.aspx", null), 850, 550, callback);
}

//选择申请and出库物品
function getDivOfficeGoods(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/OfficeGoodsSelector.aspx", null), 850, 550, callback);
}

//选择办公用品 
function getOfficeMaterial(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/NewOfficeSelector.aspx", null), 850, 550, callback);

}

//选择耗材信息
function getConsumableInfo(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/Obsolete/ConsumableInfoSelector.aspx", null), 850, 550, callback);

}

//选择办公耗材采购申请单
function getKOAPurchaseApply(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AMS/List/PurchaseApplyFormSelector.aspx", null), 850, 550, callback);

}

//选择申请证书
function getCertificateInfo(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("SM/Obsolete/CapacityCertificateSelector.aspx", null), 750, 600, callback);

}

//软件鉴定选择 add by 20170609
function getDivSoft(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("AM/Obsolete/SoftWareViewSelector.aspx", null), 850, 550, callback);
}
//#endregion

//#BMIS 全面预算选择页面

function getBudgetProject(reid, param, filter) {
    var url = $appCtx.portalUrl + "/BMIS/Obsolete/SelectBudgetProject.aspx";
    return buildSelector(reid, param, filter, url, 750, 660);
}

//#endregion

//#region NC 选择页面

//选择辅助核算
function getDivAAuxiliary(reid, param, filter, callback) {
    return buildDivSelector(reid, param, filter, buildQueryUrl("API/Obsolete/AccountAuxiliarySelector.aspx", null), 450, 550, callback);
}


//#endregion 选择页面