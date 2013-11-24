/**
 * Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
!function(){CKEDITOR.on("instanceReady",function(e){var t=e.editor,i=CKEDITOR.document.$.getElementsByName("ckeditor-sample-required-plugins"),n=i.length?CKEDITOR.dom.element.get(i[0]).getAttribute("content").split(","):[],a=[];if(n.length){for(var o=0;o<n.length;o++)t.plugins[n[o]]||a.push("<code>"+n[o]+"</code>");if(a.length){var r=CKEDITOR.dom.element.createFromHtml('<div class="warning"><span>To fully experience this demo, the '+a.join(", ")+" plugin"+(a.length>1?"s are":" is")+" required.</span>"+"</div>");r.insertBefore(t.container)}}})}();