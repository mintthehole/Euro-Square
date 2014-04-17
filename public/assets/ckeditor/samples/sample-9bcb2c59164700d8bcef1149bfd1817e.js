/**
 * Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 * For licensing, see LICENSE.md or http://ckeditor.com/license
 */
!function(){CKEDITOR.on("instanceReady",function(e){var t=e.editor,a=CKEDITOR.document.$.getElementsByName("ckeditor-sample-required-plugins"),i=a.length?CKEDITOR.dom.element.get(a[0]).getAttribute("content").split(","):[],n=[];if(i.length){for(var o=0;o<i.length;o++)t.plugins[i[o]]||n.push("<code>"+i[o]+"</code>");if(n.length){var r=CKEDITOR.dom.element.createFromHtml('<div class="warning"><span>To fully experience this demo, the '+n.join(", ")+" plugin"+(n.length>1?"s are":" is")+" required.</span>"+"</div>");r.insertBefore(t.container)}}})}();