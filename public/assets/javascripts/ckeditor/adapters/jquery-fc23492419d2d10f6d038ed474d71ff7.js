/*
 Copyright (c) 2003-2013, CKSource - Frederico Knabben. All rights reserved.
 For licensing, see LICENSE.md or http://ckeditor.com/license
*/
!function(e){CKEDITOR.config.jqueryOverrideVal="undefined"==typeof CKEDITOR.config.jqueryOverrideVal?!0:CKEDITOR.config.jqueryOverrideVal,"undefined"!=typeof e&&(e.extend(e.fn,{ckeditorGet:function(){var e=this.eq(0).data("ckeditorInstance");if(!e)throw"CKEditor is not initialized yet, use ckeditor() with a callback.";return e},ckeditor:function(t,i){if(!CKEDITOR.env.isCompatible)throw Error("The environment is incompatible.");if(!e.isFunction(t))var n=i,i=t,t=n;var o=[],i=i||{};this.each(function(){var n=e(this),s=n.data("ckeditorInstance"),r=n.data("_ckeditorInstanceLock"),a=this,l=new e.Deferred;o.push(l.promise()),s&&!r?(t&&t.apply(s,[this]),l.resolve()):r?s.once("instanceReady",function(){setTimeout(function(){s.element?(s.element.$==a&&t&&t.apply(s,[a]),l.resolve()):setTimeout(arguments.callee,100)},0)},null,null,9999):((i.autoUpdateElement||"undefined"==typeof i.autoUpdateElement&&CKEDITOR.config.autoUpdateElement)&&(i.autoUpdateElementJquery=!0),i.autoUpdateElement=!1,n.data("_ckeditorInstanceLock",!0),s=e(this).is("textarea")?CKEDITOR.replace(a,i):CKEDITOR.inline(a,i),n.data("ckeditorInstance",s),s.on("instanceReady",function(i){var o=i.editor;setTimeout(function(){if(o.element){if(i.removeListener(),o.on("dataReady",function(){n.trigger("dataReady.ckeditor",[o])}),o.on("setData",function(e){n.trigger("setData.ckeditor",[o,e.data])}),o.on("getData",function(e){n.trigger("getData.ckeditor",[o,e.data])},999),o.on("destroy",function(){n.trigger("destroy.ckeditor",[o])}),o.on("save",function(){return e(a.form).submit(),!1},null,null,20),o.config.autoUpdateElementJquery&&n.is("textarea")&&e(a.form).length){var s=function(){n.ckeditor(function(){o.updateElement()})};e(a.form).submit(s),e(a.form).bind("form-pre-serialize",s),n.bind("destroy.ckeditor",function(){e(a.form).unbind("submit",s),e(a.form).unbind("form-pre-serialize",s)})}o.on("destroy",function(){n.removeData("ckeditorInstance")}),n.removeData("_ckeditorInstanceLock"),n.trigger("instanceReady.ckeditor",[o]),t&&t.apply(o,[a]),l.resolve()}else setTimeout(arguments.callee,100)},0)},null,null,9999))});var s=new e.Deferred;return this.promise=s.promise(),e.when.apply(this,o).then(function(){s.resolve()}),this.editor=this.eq(0).data("ckeditorInstance"),this}}),CKEDITOR.config.jqueryOverrideVal&&(e.fn.val=CKEDITOR.tools.override(e.fn.val,function(t){return function(i){if(arguments.length){var n=this,o=[],s=this.each(function(){var n=e(this),s=n.data("ckeditorInstance");if(n.is("textarea")&&s){var r=new e.Deferred;return s.setData(i,function(){r.resolve()}),o.push(r.promise()),!0}return t.call(n,i)});if(o.length){var r=new e.Deferred;return e.when.apply(this,o).done(function(){r.resolveWith(n)}),r.promise()}return s}var s=e(this).eq(0),a=s.data("ckeditorInstance");return s.is("textarea")&&a?a.getData():t.call(s)}})))}(window.jQuery);