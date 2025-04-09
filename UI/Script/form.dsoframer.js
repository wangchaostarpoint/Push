var dso = document.all.dsoFrame;
var $dso = $("#dsoFrame");
function openWord(docUrl) {
    dso.Open(docUrl, false, "Word.Document");
    dso.SetCurrUserName($currUserName);
}
function openExcel(docUrl) {
    dso.Open(docUrl, false, "xls");
    dso.SetCurrUserName($currUserName);
}
function uploadDoc(fileName, fileRelPath, fileId, formId) {
    dso.HttpInit();
    dso.HttpAddPostCurrFile("File", "");
    dso.HttpAddPostString("fileName", fileName);
    //dso.HttpAddPostString("fileRelPath", fileRelPath);
    dso.HttpAddPostString("folder", fileRelPath);
    dso.HttpAddPostString("fileId", fileId);
    dso.HttpAddPostString("userId", $currUserId);
    dso.HttpAddPostString("userName", escape($currUserName));
    dso.HttpAddPostString("fileSourceId", $currBizId);
    dso.HttpAddPostString("fileSourceFlag", "Form");
    dso.HttpAddPostString("param", formId + "|" + "True|" + fileId);
     
    dso.HttpPost($docUploadHandler);
}
function getActiveDocument() {
    return dso.ActiveDocument;
}
//打印
function printDocument() {
    dso.PrintOut(true);
}
//打印预览
function printPreview() {
    dso.PrintPreview();
}
function saveDocAs() {
    dso.ActiveDocument.Application.Dialogs(84).Show();
}
function DsoParam() {
    this.templateFlag = "";
    this.fileId = "";
    this.filePath = "";
    this.fileName = "";
    this.bizId = "";
    this.fillDoc = null;
    this.canSave = false;
    this.canRevision = false;
    this.actName = "";
    this.formId = "0";
    this.actionType = "0";
}
function DsoResult() {
    this.fileId = "";
    this.filePath = "";
}
function createWord() {
    dso.CreateNew("Word.Document");
}