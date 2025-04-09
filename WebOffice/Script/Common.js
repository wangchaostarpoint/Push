/****************************************************
*
*					获取站点的Url根节点地址
*
/****************************************************/
function RootUrl() {
    var strRoot;
    var varpath = decodeURI(window.location.pathname);
    var varhost = window.location.host;
    if (varhost == '') {
        //本机地址
        strRoot = varpath.substring(1, varpath.lastIndexOf('/') + 1);//取得打开、保存路径
        if (strRoot == '') strRoot = varpath.substring(1, varpath.lastIndexOf('\\') + 1);

    } else {
        //网络地址
        varpro = window.location.protocol;
        strRoot = varpro + "//" + varhost + "/" + varpath.substring(1, varpath.lastIndexOf('/') + 1);
        if (strRoot == '') strRoot = varpath.substring(1, varpath.lastIndexOf('\\') + 1);
    }
    return strRoot;
}
/****************************************************
/**
 * 获取Url参数值
 * @param name 参数名
 * @returns {string}
 */
function GetQueryString(name) {
    var reg = new RegExp("(^|&)" + name + "=([^&]*)(&|$)", "i");
    var r = window.location.search.substr(1).match(reg);
    var val = "";
    if (r != null) {
        val = (r[2]);
    }

    if (val == undefined || val == null) {
        val = "";
    }
    return val;
}
/* 
* url 目标url 
* arg 需要替换的参数名称 
* arg_val 替换后的参数的值 
* return url 参数替换后的url 
*/
function changeURLArg(url, arg, arg_val) {
    var pattern = arg + '=([^&]*)';
    var replaceText = arg + '=' + arg_val;
    if (url.match(pattern)) {
        var tmp = '/(' + arg + '=)([^&]*)/gi';
        tmp = url.replace(eval(tmp), replaceText);
        return tmp;
    } else {
        if (url.match('[\?]')) {
            return url + '&' + replaceText;
        } else {
            return url + '?' + replaceText;
        }
    }
    return url + '\n' + arg + '\n' + arg_val;
}
/****************************************************/

/****************************************************
*
*					选择公文盖章印章
*
/****************************************************/
function getSignSeal(reid, param, filter) {
    var url = rooturl + "Obsolete/SelectSignatureList.aspx";
    return buildSelector(reid, param,filter, url);
}




/****************************************************
*
*					平台选择器相关方法
*
/****************************************************/
function buildSelector(reid, param,filter, url) {
    if (filter != null) {
        if (typeof (filter) == "string") {
            if (url.indexOf("?") >= 0) {
                url += "&f=" + filter;
            }
            else {
                url += "?f=" + filter;
            }
        }
    }
    var t = $("#" + reid).val();
    if (t != "") param.insertParam(t);
    var opo = showModal(encodeURI(url), param, 600, 600);
    if (opo != undefined) {
        $("#" + reid).val(opo);
        var xmlObj = new KPMSXml();
        xmlObj.loadXML(opo);
        return xmlObj;
    }
    return null;
}
function showModal(url, param, width, height) {
    return window.showModalDialog(url, param, "resizable:1;scroll:1;dialogHeight:" + height + "px; dialogWidth:" + width + "px;");
}
function InputParamObject(mode) {
    this.mode = mode; //s or m
    this.xmlObj = new KPMSXml();
    this.xmlObj.loadXML("<root mode='" + mode + "'></root>");
    this.root = this.xmlObj.selectSingleNode("root");
    this.exparam = null;
}
InputParamObject.prototype.insertParam = function (xmlStr) {
    var tempXml = new KPMSXml();
    tempXml.loadXML(xmlStr);
    var nodes = tempXml.getElementsByTagName("o");
    for (var i = 0; i < nodes.length; i++) {
        this.root.appendChild(nodes[i].cloneNode(true));
    }
}
function KPMSXml() {
    this.xmlDoc = null;
    this.parser = null;
    this.isDom = false;

    try {
        this.xmlDoc = new ActiveXObject("Microsoft.XMLDOM");
        this.xmlDoc.async = "false";
        this.isDom = false;
    }
    catch (e) {
        this.parser = new DOMParser();
        this.isDom = true;
    }
}
KPMSXml.prototype.loadXML = function (xmlstr) {
    if (!this.isDom) { this.xmlDoc.loadXML(xmlstr); }
    else this.xmlDoc = this.parser.parseFromString(xmlstr, "text/xml");
}
KPMSXml.prototype.selectSingleNode = function (xpath) {
    if (!this.isDom) {
        return this.xmlDoc.selectSingleNode(xpath);
    }
    else {
        var $r = this.xmlDoc.evaluate(xpath, this.xmlDoc, null, XPathResult.ANY_TYPE, null);
        return $r.iterateNext();
    }
}
KPMSXml.prototype.getElementsByTagName = function (tagName) {
    return this.xmlDoc.getElementsByTagName(tagName);
}
KPMSXml.prototype.buildAttrJson = function (tagName, attr) {
    var temp = [];
    var nodes = this.xmlDoc.getElementsByTagName(tagName);
    for (var i = 0; i < nodes.length; i++) {
        temp.push(nodes[i].getAttribute(attr));
    }
    return temp;
}
/****************************************************/