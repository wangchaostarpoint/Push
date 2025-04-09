var $$davObj = null;
function createFileDav(url) {
    initDavObj();
    $$davObj.EditDocument(combineDavPath(url),null);
}
function createAsTempl(templUrl, fileUrl) {
    initDavObj();
    $$davObj.EditDocument(combineDavPath(templUrl), null);
}
function combineDavPath(url) {
    var t = $appCtx.portalUrl + url;
    if (!('ActiveXObject' in window)) {
        t = t + '\0';
    }
    return t;
}
function initDavObj() {
    if ($$davObj != null)
        return $$davObj;
    else {
        var progids = ["SharePoint.OpenDocuments.5", "SharePoint.OpenDocuments.3", "SharePoint.OpenDocuments.2", "SharePoint.OpenDocuments.1"];
        for (var i = 0; i < progids.length; ++i) {
            try {
                $$davObj = new ActiveXObject(progids[i]);
                return;          
            }
            catch (e) { }
        }
        $$davObj = document.getElementById("winFirefoxPlugin"); //for chrome,firefox    
    }
}
function createG() {
    return (((1 + Math.random()) * 0x10000) | 0).toString(16).substring(1)
}
function getGuid() {
    return (createG() + createG() + "-" + createG() + "-" + createG() + "-" + createG() + "-" + createG() + createG() + createG()).toUpperCase();
}
var $skipRefreshOnFocus = 0;
function refreshOnFocus() {

    var url = window.location.href;
    var iPosition = url.indexOf("#")
    if (iPosition == -1)
        window.location.href = url;
    else
        window.location.href = url.substring(0, iPosition);

}