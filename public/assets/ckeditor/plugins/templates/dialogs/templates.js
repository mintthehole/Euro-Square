/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(){CKEDITOR.dialog.add("templates",function(e){function t(e,t){var a=CKEDITOR.dom.element.createFromHtml('<a href="javascript:void(0)" tabIndex="-1" role="option" ><div class="cke_tpl_item"></div></a>'),n='<table style="width:350px;" class="cke_tpl_preview" role="presentation"><tr>';return e.image&&t&&(n+='<td class="cke_tpl_preview_img"><img src="'+CKEDITOR.getUrl(t+e.image)+'"'+(CKEDITOR.env.ie6Compat?' onload="this.width=this.width"':"")+' alt="" title=""></td>'),n+='<td style="white-space:normal;"><span class="cke_tpl_title">'+e.title+"</span><br/>",e.description&&(n+="<span>"+e.description+"</span>"),a.getFirst().setHtml(n+"</td></tr></table>"),a.on("click",function(){i(e.html)}),a}function i(t){var i=CKEDITOR.dialog.getCurrent();i.getValueOf("selectTpl","chkInsertOpt")?(e.fire("saveSnapshot"),e.setData(t,function(){i.hide();var t=e.createRange();t.moveToElementEditStart(e.editable()),t.select(),setTimeout(function(){e.fire("saveSnapshot")},0)})):(e.insertHtml(t),i.hide())}function a(e){var t=e.data.getTarget(),i=o.equals(t);if(i||o.contains(t)){var a,n=e.data.getKeystroke(),r=o.getElementsByTag("a");if(r){if(i)a=r.getItem(0);else switch(n){case 40:a=t.getNext();break;case 38:a=t.getPrevious();break;case 13:case 32:t.fire("click")}a&&(a.focus(),e.data.preventDefault())}}}var n=CKEDITOR.plugins.get("templates");CKEDITOR.document.appendStyleSheet(CKEDITOR.getUrl(n.path+"dialogs/templates.css"));var o,n="cke_tpl_list_label_"+CKEDITOR.tools.getNextNumber(),r=e.lang.templates,s=e.config;return{title:e.lang.templates.title,minWidth:CKEDITOR.env.ie?440:400,minHeight:340,contents:[{id:"selectTpl",label:r.title,elements:[{type:"vbox",padding:5,children:[{id:"selectTplText",type:"html",html:"<span>"+r.selectPromptMsg+"</span>"},{id:"templatesList",type:"html",focus:!0,html:'<div class="cke_tpl_list" tabIndex="-1" role="listbox" aria-labelledby="'+n+'"><div class="cke_tpl_loading"><span></span></div></div><span class="cke_voice_label" id="'+n+'">'+r.options+"</span>"},{id:"chkInsertOpt",type:"checkbox",label:r.insertOption,"default":s.templates_replaceContent}]}]}],buttons:[CKEDITOR.dialog.cancelButton],onShow:function(){var e=this.getContentElement("selectTpl","templatesList");o=e.getElement(),CKEDITOR.loadTemplates(s.templates_files,function(){var i=(s.templates||"default").split(",");if(i.length){var a=o;a.setHtml("");for(var n=0,l=i.length;l>n;n++)for(var c=CKEDITOR.getTemplates(i[n]),d=c.imagesPath,c=c.templates,u=c.length,p=0;u>p;p++){var h=t(c[p],d);h.setAttribute("aria-posinset",p+1),h.setAttribute("aria-setsize",u),a.append(h)}e.focus()}else o.setHtml('<div class="cke_tpl_empty"><span>'+r.emptyListMsg+"</span></div>")}),this._.element.on("keydown",a)},onHide:function(){this._.element.removeListener("keydown",a)}}})}();