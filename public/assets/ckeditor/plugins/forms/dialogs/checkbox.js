/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
CKEDITOR.dialog.add("checkbox",function(e){return{title:e.lang.forms.checkboxAndRadio.checkboxTitle,minWidth:350,minHeight:140,onShow:function(){delete this.checkbox;var e=this.getParentEditor().getSelection().getSelectedElement();e&&"checkbox"==e.getAttribute("type")&&(this.checkbox=e,this.setupContent(e))},onOk:function(){var e,t=this.checkbox;t||(e=this.getParentEditor(),t=e.document.createElement("input"),t.setAttribute("type","checkbox"),e.insertElement(t)),this.commitContent({element:t})},contents:[{id:"info",label:e.lang.forms.checkboxAndRadio.checkboxTitle,title:e.lang.forms.checkboxAndRadio.checkboxTitle,startupFocus:"txtName",elements:[{id:"txtName",type:"text",label:e.lang.common.name,"default":"",accessKey:"N",setup:function(e){this.setValue(e.data("cke-saved-name")||e.getAttribute("name")||"")},commit:function(e){e=e.element,this.getValue()?e.data("cke-saved-name",this.getValue()):(e.data("cke-saved-name",!1),e.removeAttribute("name"))}},{id:"txtValue",type:"text",label:e.lang.forms.checkboxAndRadio.value,"default":"",accessKey:"V",setup:function(e){e=e.getAttribute("value"),this.setValue(CKEDITOR.env.ie&&"on"==e?"":e)},commit:function(t){var i=t.element,a=this.getValue();!a||CKEDITOR.env.ie&&"on"==a?CKEDITOR.env.ie?(a=new CKEDITOR.dom.element("input",i.getDocument()),i.copyAttributes(a,{value:1}),a.replace(i),e.getSelection().selectElement(a),t.element=a):i.removeAttribute("value"):i.setAttribute("value",a)}},{id:"cmbSelected",type:"checkbox",label:e.lang.forms.checkboxAndRadio.selected,"default":"",accessKey:"S",value:"checked",setup:function(e){this.setValue(e.getAttribute("checked"))},commit:function(t){var i=t.element;if(CKEDITOR.env.ie){var a=!!i.getAttribute("checked"),n=!!this.getValue();a!=n&&(a=CKEDITOR.dom.element.createFromHtml('<input type="checkbox"'+(n?' checked="checked"':"")+"/>",e.document),i.copyAttributes(a,{type:1,checked:1}),a.replace(i),e.getSelection().selectElement(a),t.element=a)}else this.getValue()?i.setAttribute("checked","checked"):i.removeAttribute("checked")}}]}]}});