/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(e){CKEDITOR.config.jqueryOverrideVal="undefined"==typeof CKEDITOR.config.jqueryOverrideVal?!0:CKEDITOR.config.jqueryOverrideVal,"undefined"!=typeof e&&(e.extend(e.fn,{ckeditorGet:function(){var e=this.eq(0).data("ckeditorInstance");if(!e)throw"CKEditor is not initialized yet, use ckeditor() with a callback.";return e},ckeditor:function(t,i){if(!CKEDITOR.env.isCompatible)throw Error("The environment is incompatible.");if(!e.isFunction(t))var n=i,i=t,t=n;var s=[],i=i||{};this.each(function(){var n=e(this),o=n.data("ckeditorInstance"),a=n.data("_ckeditorInstanceLock"),r=this,l=new e.Deferred;s.push(l.promise()),o&&!a?(t&&t.apply(o,[this]),l.resolve()):a?o.once("instanceReady",function(){setTimeout(function(){o.element?(o.element.$==r&&t&&t.apply(o,[r]),l.resolve()):setTimeout(arguments.callee,100)},0)},null,null,9999):((i.autoUpdateElement||"undefined"==typeof i.autoUpdateElement&&CKEDITOR.config.autoUpdateElement)&&(i.autoUpdateElementJquery=!0),i.autoUpdateElement=!1,n.data("_ckeditorInstanceLock",!0),o=e(this).is("textarea")?CKEDITOR.replace(r,i):CKEDITOR.inline(r,i),n.data("ckeditorInstance",o),o.on("instanceReady",function(i){var s=i.editor;setTimeout(function(){if(s.element){if(i.removeListener(),s.on("dataReady",function(){n.trigger("dataReady.ckeditor",[s])}),s.on("setData",function(e){n.trigger("setData.ckeditor",[s,e.data])}),s.on("getData",function(e){n.trigger("getData.ckeditor",[s,e.data])},999),s.on("destroy",function(){n.trigger("destroy.ckeditor",[s])}),s.on("save",function(){return e(r.form).submit(),!1},null,null,20),s.config.autoUpdateElementJquery&&n.is("textarea")&&e(r.form).length){var o=function(){n.ckeditor(function(){s.updateElement()})};e(r.form).submit(o),e(r.form).bind("form-pre-serialize",o),n.bind("destroy.ckeditor",function(){e(r.form).unbind("submit",o),e(r.form).unbind("form-pre-serialize",o)})}s.on("destroy",function(){n.removeData("ckeditorInstance")}),n.removeData("_ckeditorInstanceLock"),n.trigger("instanceReady.ckeditor",[s]),t&&t.apply(s,[r]),l.resolve()}else setTimeout(arguments.callee,100)},0)},null,null,9999))});var o=new e.Deferred;return this.promise=o.promise(),e.when.apply(this,s).then(function(){o.resolve()}),this.editor=this.eq(0).data("ckeditorInstance"),this}}),CKEDITOR.config.jqueryOverrideVal&&(e.fn.val=CKEDITOR.tools.override(e.fn.val,function(t){return function(i){if(arguments.length){var n=this,s=[],o=this.each(function(){var n=e(this),o=n.data("ckeditorInstance");if(n.is("textarea")&&o){var a=new e.Deferred;return o.setData(i,function(){a.resolve()}),s.push(a.promise()),!0}return t.call(n,i)});if(s.length){var a=new e.Deferred;return e.when.apply(this,s).done(function(){a.resolveWith(n)}),a.promise()}return o}var o=e(this).eq(0),r=o.data("ckeditorInstance");return o.is("textarea")&&r?r.getData():t.call(o)}})))}(window.jQuery);