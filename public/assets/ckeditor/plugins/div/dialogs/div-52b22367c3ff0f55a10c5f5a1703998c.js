!function(){function e(e,t,i){t.is&&t.getCustomData("block_processed")||(t.is&&CKEDITOR.dom.element.setMarker(i,t,"block_processed",!0),e.push(t))}function t(t,i){function n(){this.foreach(function(e){/^(?!vbox|hbox)/.test(e.type)&&(e.setup||(e.setup=function(t){e.setValue(t.getAttribute(e.id)||"",1)}),!e.commit)&&(e.commit=function(t){var i=this.getValue();"dir"==e.id&&t.getComputedStyle("direction")==i||(i?t.setAttribute(e.id,i):t.removeAttribute(e.id))})})}var a=function(){var e=CKEDITOR.tools.extend({},CKEDITOR.dtd.$blockLimit);return t.config.div_wrapTable&&(delete e.td,delete e.th),e}(),o=CKEDITOR.dtd.div,r={},s=[];return{title:t.lang.div.title,minWidth:400,minHeight:165,contents:[{id:"info",label:t.lang.common.generalTab,title:t.lang.common.generalTab,elements:[{type:"hbox",widths:["50%","50%"],children:[{id:"elementStyle",type:"select",style:"width: 100%;",label:t.lang.div.styleSelectLabel,"default":"",items:[[t.lang.common.notSet,""]],onChange:function(){var e=["info:elementStyle","info:class","advanced:dir","advanced:style"],i=this.getDialog(),n=i._element&&i._element.clone()||new CKEDITOR.dom.element("div",t.document);this.commit(n,!0);for(var a,e=[].concat(e),o=e.length,r=0;o>r;r++)(a=i.getContentElement.apply(i,e[r].split(":")))&&a.setup&&a.setup(n,!0)},setup:function(e){for(var t in r)r[t].checkElementRemovable(e,!0)&&this.setValue(t,1)},commit:function(e){var t;(t=this.getValue())?r[t].applyToObject(e):e.removeAttribute("style")}},{id:"class",type:"text",requiredContent:"div(cke-xyz)",label:t.lang.common.cssClass,"default":""}]}]},{id:"advanced",label:t.lang.common.advancedTab,title:t.lang.common.advancedTab,elements:[{type:"vbox",padding:1,children:[{type:"hbox",widths:["50%","50%"],children:[{type:"text",id:"id",requiredContent:"div[id]",label:t.lang.common.id,"default":""},{type:"text",id:"lang",requiredContent:"div[lang]",label:t.lang.common.langCode,"default":""}]},{type:"hbox",children:[{type:"text",id:"style",requiredContent:"div{cke-xyz}",style:"width: 100%;",label:t.lang.common.cssStyle,"default":"",commit:function(e){e.setAttribute("style",this.getValue())}}]},{type:"hbox",children:[{type:"text",id:"title",requiredContent:"div[title]",style:"width: 100%;",label:t.lang.common.advisoryTitle,"default":""}]},{type:"select",id:"dir",requiredContent:"div[dir]",style:"width: 100%;",label:t.lang.common.langDir,"default":"",items:[[t.lang.common.notSet,""],[t.lang.common.langDirLtr,"ltr"],[t.lang.common.langDirRtl,"rtl"]]}]}]}],onLoad:function(){n.call(this);var e=this,i=this.getContentElement("info","elementStyle");t.getStylesSet(function(n){var a,o;if(n)for(var s=0;s<n.length;s++)o=n[s],o.element&&"div"==o.element&&(a=o.name,r[a]=o=new CKEDITOR.style(o),t.filter.check(o)&&(i.items.push([a,a]),i.add(a,a)));i[1<i.items.length?"enable":"disable"](),setTimeout(function(){e._element&&i.setup(e._element)},0)})},onShow:function(){"editdiv"==i&&this.setupContent(this._element=CKEDITOR.plugins.div.getSurroundDiv(t))},onOk:function(){if("editdiv"==i)s=[this._element];else{var n,r,l,d=[],c={},u=[],h=t.getSelection(),p=h.getRanges(),m=h.createBookmarks();for(r=0;r<p.length;r++)for(l=p[r].createIterator();n=l.getNextParagraph();)if(n.getName()in a){var g=n.getChildren();for(n=0;n<g.count();n++)e(u,g.getItem(n),c)}else{for(;!o[n.getName()]&&!n.equals(p[r].root);)n=n.getParent();e(u,n,c)}for(CKEDITOR.dom.element.clearAllMarkers(c),p=[],r=null,l=0;l<u.length;l++)n=u[l],g=t.elementPath(n).blockLimit,t.config.div_wrapTable&&g.is(["td","th"])&&(g=t.elementPath(g.getParent()).blockLimit),g.equals(r)||(r=g,p.push([])),p[p.length-1].push(n);for(r=0;r<p.length;r++){for(g=p[r][0],u=g.getParent(),n=1;n<p[r].length;n++)u=u.getCommonAncestor(p[r][n]);for(l=new CKEDITOR.dom.element("div",t.document),n=0;n<p[r].length;n++){for(g=p[r][n];!g.getParent().equals(u);)g=g.getParent();p[r][n]=g}for(n=0;n<p[r].length;n++)g=p[r][n],g.getCustomData&&g.getCustomData("block_processed")||(g.is&&CKEDITOR.dom.element.setMarker(c,g,"block_processed",!0),n||l.insertBefore(g),l.append(g));CKEDITOR.dom.element.clearAllMarkers(c),d.push(l)}h.selectBookmarks(m),s=d}for(d=s.length,c=0;d>c;c++)this.commitContent(s[c]),!s[c].getAttribute("style")&&s[c].removeAttribute("style");this.hide()},onHide:function(){"editdiv"==i&&this._element.removeCustomData("elementStyle"),delete this._element}}}CKEDITOR.dialog.add("creatediv",function(e){return t(e,"creatediv")}),CKEDITOR.dialog.add("editdiv",function(e){return t(e,"editdiv")})}();