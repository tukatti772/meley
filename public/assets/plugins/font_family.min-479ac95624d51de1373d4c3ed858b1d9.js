!function(e){"function"==typeof define&&define.amd?define(["jquery"],e):"object"==typeof module&&module.exports?module.exports=function(t,n){return void 0===n&&(n="undefined"!=typeof window?require("jquery"):require("jquery")(t)),e(n)}:e(window.jQuery)}(function(e){e.extend(e.FE.DEFAULTS,{fontFamily:{"Arial,Helvetica,sans-serif":"Arial","Georgia,serif":"Georgia","Impact,Charcoal,sans-serif":"Impact","Tahoma,Geneva,sans-serif":"Tahoma","Times New Roman,Times,serif,-webkit-standard":"Times New Roman","Verdana,Geneva,sans-serif":"Verdana"},fontFamilySelection:!1,fontFamilyDefaultSelection:"Font Family"}),e.FE.PLUGINS.fontFamily=function(t){function n(e){t.format.applyStyle("font-family",e)}function a(e,t){t.find(".fr-command.fr-active").removeClass("fr-active").attr("aria-selected",!1),t.find('.fr-command[data-param1="'+r()+'"]').addClass("fr-active").attr("aria-selected",!0);var n=t.find(".fr-dropdown-list"),a=t.find(".fr-active").parent();a.length?n.parent().scrollTop(a.offset().top-n.offset().top-(n.parent().outerHeight()/2-a.outerHeight()/2)):n.parent().scrollTop(0)}function o(t){var n=t.replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'| /g,"").split(",");return e.grep(n,function(e){return e.length>0})}function i(e,t){for(var n=0;n<e.length;n++)for(var a=0;a<t.length;a++)if(e[n].toLowerCase()==t[a].toLowerCase())return[n,a];return null}function r(){var n=e(t.selection.element()).css("font-family"),a=o(n),r=[];for(var f in t.opts.fontFamily)if(t.opts.fontFamily.hasOwnProperty(f)){var l=o(f),s=i(a,l);s&&r.push([f,s])}return 0===r.length?null:(r.sort(function(e,t){var n=e[1][0]-t[1][0];return 0===n?e[1][1]-t[1][1]:n}),r[0][0])}function f(n){if(t.opts.fontFamilySelection){var a=e(t.selection.element()).css("font-family").replace(/(sans-serif|serif|monospace|cursive|fantasy)/gi,"").replace(/"|'|/g,"").split(",");n.find("> span").text(t.opts.fontFamily[r()]||a[0]||t.language.translate(t.opts.fontFamilyDefaultSelection))}}return{apply:n,refreshOnShow:a,refresh:f}},e.FE.RegisterCommand("fontFamily",{type:"dropdown",displaySelection:function(e){return e.opts.fontFamilySelection},defaultSelection:function(e){return e.opts.fontFamilyDefaultSelection},displaySelectionWidth:120,html:function(){var e='<ul class="fr-dropdown-list" role="presentation">',t=this.opts.fontFamily;for(var n in t)t.hasOwnProperty(n)&&(e+='<li role="presentation"><a class="fr-command" tabIndex="-1" role="option" data-cmd="fontFamily" data-param1="'+n+'" style="font-family: '+n+'" title="'+t[n]+'">'+t[n]+"</a></li>");return e+="</ul>"},title:"Font Family",callback:function(e,t){this.fontFamily.apply(t)},refresh:function(e){this.fontFamily.refresh(e)},refreshOnShow:function(e,t){this.fontFamily.refreshOnShow(e,t)},plugin:"fontFamily"}),e.FE.DefineIcon("fontFamily",{NAME:"font"})});