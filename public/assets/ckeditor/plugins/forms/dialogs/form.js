/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("form",function(e){var t={action:1,id:1,method:1,enctype:1,target:1};return{title:e.lang.forms.form.title,minWidth:350,minHeight:200,onShow:function(){delete this.form;var e=this.getParentEditor().elementPath().contains("form",1);e&&(this.form=e,this.setupContent(e))},onOk:function(){var e,t=this.form,i=!t;i&&(e=this.getParentEditor(),t=e.document.createElement("form"),!CKEDITOR.env.ie&&t.append(e.document.createElement("br"))),i&&e.insertElement(t),this.commitContent(t)},onLoad:function(){function e(e){this.setValue(e.getAttribute(this.id)||"")}function i(e){this.getValue()?e.setAttribute(this.id,this.getValue()):e.removeAttribute(this.id)}this.foreach(function(n){t[n.id]&&(n.setup=e,n.commit=i)})},contents:[{id:"info",label:e.lang.forms.form.title,title:e.lang.forms.form.title,elements:[{id:"txtName",type:"text",label:e.lang.common.name,"default":"",accessKey:"N",setup:function(e){this.setValue(e.data("cke-saved-name")||e.getAttribute("name")||"")},commit:function(e){this.getValue()?e.data("cke-saved-name",this.getValue()):(e.data("cke-saved-name",!1),e.removeAttribute("name"))}},{id:"action",type:"text",label:e.lang.forms.form.action,"default":"",accessKey:"T"},{type:"hbox",widths:["45%","55%"],children:[{id:"id",type:"text",label:e.lang.common.id,"default":"",accessKey:"I"},{id:"enctype",type:"select",label:e.lang.forms.form.encoding,style:"width:100%",accessKey:"E","default":"",items:[[""],["text/plain"],["multipart/form-data"],["application/x-www-form-urlencoded"]]}]},{type:"hbox",widths:["45%","55%"],children:[{id:"target",type:"select",label:e.lang.common.target,style:"width:100%",accessKey:"M","default":"",items:[[e.lang.common.notSet,""],[e.lang.common.targetNew,"_blank"],[e.lang.common.targetTop,"_top"],[e.lang.common.targetSelf,"_self"],[e.lang.common.targetParent,"_parent"]]},{id:"method",type:"select",label:e.lang.forms.form.method,accessKey:"M","default":"GET",items:[["GET","get"],["POST","post"]]}]}]}]}});