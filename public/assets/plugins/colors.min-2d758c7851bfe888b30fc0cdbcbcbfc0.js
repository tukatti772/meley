!function(o){"function"==typeof define&&define.amd?define(["jquery"],o):"object"==typeof module&&module.exports?module.exports=function(e,r){return void 0===r&&(r="undefined"!=typeof window?require("jquery"):require("jquery")(e)),o(r)}:o(window.jQuery)}(function(o){o.extend(o.FE.POPUP_TEMPLATES,{"colors.picker":"[_BUTTONS_][_TEXT_COLORS_][_BACKGROUND_COLORS_][_CUSTOM_COLOR_]"}),o.extend(o.FE.DEFAULTS,{colorsText:["#61BD6D","#1ABC9C","#54ACD2","#2C82C9","#9365B8","#475577","#CCCCCC","#41A85F","#00A885","#3D8EB9","#2969B0","#553982","#28324E","#000000","#F7DA64","#FBA026","#EB6B56","#E25041","#A38F84","#EFEFEF","#FFFFFF","#FAC51C","#F37934","#D14841","#B8312F","#7C706B","#D1D5D8","REMOVE"],colorsBackground:["#61BD6D","#1ABC9C","#54ACD2","#2C82C9","#9365B8","#475577","#CCCCCC","#41A85F","#00A885","#3D8EB9","#2969B0","#553982","#28324E","#000000","#F7DA64","#FBA026","#EB6B56","#E25041","#A38F84","#EFEFEF","#FFFFFF","#FAC51C","#F37934","#D14841","#B8312F","#7C706B","#D1D5D8","REMOVE"],colorsStep:7,colorsHEXInput:!0,colorsDefaultTab:"text",colorsButtons:["colorsBack","|","-"]}),o.FE.PLUGINS.colors=function(e){function r(){var o=e.$tb.find('.fr-command[data-cmd="color"]'),r=e.popups.get("colors.picker");if(r||(r=a()),!r.hasClass("fr-active"))if(e.popups.setContainer("colors.picker",e.$tb),n(r.find(".fr-selected-tab").attr("data-param1")),o.is(":visible")){var t=o.offset().left+o.outerWidth()/2,s=o.offset().top+(e.opts.toolbarBottom?10:o.outerHeight()-10);e.popups.show("colors.picker",t,s,o.outerHeight())}else e.position.forSelection(r),e.popups.show("colors.picker")}function t(){e.popups.hide("colors.picker")}function a(){var o='<div class="fr-buttons fr-colors-buttons">';e.opts.toolbarInline&&e.opts.colorsButtons.length>0&&(o+=e.button.buildList(e.opts.colorsButtons)),o+=s()+"</div>";var r="";e.opts.colorsHEXInput&&(r='<div class="fr-color-hex-layer fr-active fr-layer" id="fr-color-hex-layer-'+e.id+'"><div class="fr-input-line"><input maxlength="7" id="fr-color-hex-layer-text-'+e.id+'" type="text" placeholder="'+e.language.translate("HEX Color")+'" tabIndex="1" aria-required="true"></div><div class="fr-action-buttons"><button type="button" class="fr-command fr-submit" data-cmd="customColor" tabIndex="2" role="button">'+e.language.translate("OK")+"</button></div></div>");var t={buttons:o,text_colors:l("text"),background_colors:l("background"),custom_color:r},a=e.popups.create("colors.picker",t);return c(a),a}function s(){var o='<div class="fr-colors-tabs fr-group">';return o+='<span class="fr-colors-tab '+("background"==e.opts.colorsDefaultTab?"":"fr-selected-tab ")+'fr-command" tabIndex="-1" role="button" aria-pressed="'+("background"!=e.opts.colorsDefaultTab)+'" data-param1="text" data-cmd="colorChangeSet" title="'+e.language.translate("Text")+'">'+e.language.translate("Text")+"</span>",(o+='<span class="fr-colors-tab '+("background"==e.opts.colorsDefaultTab?"fr-selected-tab ":"")+'fr-command" tabIndex="-1" role="button" aria-pressed="'+("background"==e.opts.colorsDefaultTab)+'" data-param1="background" data-cmd="colorChangeSet" title="'+e.language.translate("Background")+'">'+e.language.translate("Background")+"</span>")+"</div>"}function l(o){for(var r="text"==o?e.opts.colorsText:e.opts.colorsBackground,t='<div class="fr-color-set fr-'+o+"-color"+(e.opts.colorsDefaultTab==o||"text"!=e.opts.colorsDefaultTab&&"background"!=e.opts.colorsDefaultTab&&"text"==o?" fr-selected-set":"")+'">',a=0;a<r.length;a++)0!==a&&a%e.opts.colorsStep==0&&(t+="<br>"),"REMOVE"!=r[a]?t+='<span class="fr-command fr-select-color" style="background: '+r[a]+';" tabIndex="-1" aria-selected="false" role="button" data-cmd="'+o+'Color" data-param1="'+r[a]+'"><span class="fr-sr-only">'+e.language.translate("Color")+" "+r[a]+"&nbsp;&nbsp;&nbsp;</span></span>":t+='<span class="fr-command fr-select-color" data-cmd="'+o+'Color" tabIndex="-1" role="button" data-param1="REMOVE" title="'+e.language.translate("Clear Formatting")+'">'+e.icon.create("remove")+'<span class="fr-sr-only">'+e.language.translate("Clear Formatting")+"</span></span>";return t+"</div>"}function c(r){e.events.on("popup.tab",function(t){var a=o(t.currentTarget);if(!e.popups.isVisible("colors.picker")||!a.is("span"))return!0;var s=t.which,l=!0;if(o.FE.KEYCODE.TAB==s){var c=r.find(".fr-buttons");l=!e.accessibility.focusToolbar(c,!!t.shiftKey)}else if(o.FE.KEYCODE.ARROW_UP==s||o.FE.KEYCODE.ARROW_DOWN==s||o.FE.KEYCODE.ARROW_LEFT==s||o.FE.KEYCODE.ARROW_RIGHT==s){if(a.is("span.fr-select-color")){var n=a.parent().find("span.fr-select-color"),i=n.index(a),p=e.opts.colorsStep,u=Math.floor(n.length/p),d=i%p,f=Math.floor(i/p),b=f*p+d,E=u*p;o.FE.KEYCODE.ARROW_UP==s?b=((b-p)%E+E)%E:o.FE.KEYCODE.ARROW_DOWN==s?b=(b+p)%E:o.FE.KEYCODE.ARROW_LEFT==s?b=((b-1)%E+E)%E:o.FE.KEYCODE.ARROW_RIGHT==s&&(b=(b+1)%E);var C=o(n.get(b));e.events.disableBlur(),C.focus(),l=!1}}else o.FE.KEYCODE.ENTER==s&&(e.button.exec(a),l=!1);return!1===l&&(t.preventDefault(),t.stopPropagation()),l},!0)}function n(r){var t,a=e.popups.get("colors.picker"),s=o(e.selection.element());t="background"==r?"background-color":"color";var l=a.find(".fr-"+r+"-color .fr-select-color");for(l.find(".fr-selected-color").remove(),l.removeClass("fr-active-item"),l.not('[data-param1="REMOVE"]').attr("aria-selected",!1);s.get(0)!=e.el;){if("transparent"!=s.css(t)&&"rgba(0, 0, 0, 0)"!=s.css(t)){var c=a.find(".fr-"+r+'-color .fr-select-color[data-param1="'+e.helpers.RGBToHex(s.css(t))+'"]');c.append('<span class="fr-selected-color" aria-hidden="true">\uf00c</span>'),c.addClass("fr-active-item").attr("aria-selected",!0);break}s=s.parent()}var n=a.find(".fr-color-hex-layer input");n.length&&n.val(e.helpers.RGBToHex(s.css(t))).trigger("change")}function i(o,r){o.hasClass("fr-selected-tab")||(o.siblings().removeClass("fr-selected-tab").attr("aria-pressed",!1),o.addClass("fr-selected-tab").attr("aria-pressed",!0),o.parents(".fr-popup").find(".fr-color-set").removeClass("fr-selected-set"),o.parents(".fr-popup").find(".fr-color-set.fr-"+r+"-color").addClass("fr-selected-set"),n(r)),e.accessibility.focusPopup(o.parents(".fr-popup"))}function p(o){"REMOVE"!=o?e.format.applyStyle("background-color",e.helpers.HEXtoRGB(o)):e.format.removeStyle("background-color"),t()}function u(o){"REMOVE"!=o?e.format.applyStyle("color",e.helpers.HEXtoRGB(o)):e.format.removeStyle("color"),t()}function d(){e.popups.hide("colors.picker"),e.toolbar.showInline()}function f(){var o=e.popups.get("colors.picker"),r=o.find(".fr-color-hex-layer input");if(r.length){var t=r.val();"background"==o.find(".fr-selected-tab").attr("data-param1")?p(t):u(t)}}return{showColorsPopup:r,hideColorsPopup:t,changeSet:i,background:p,customColor:f,text:u,back:d}},o.FE.DefineIcon("colors",{NAME:"tint"}),o.FE.RegisterCommand("color",{title:"Colors",undo:!1,focus:!0,refreshOnCallback:!1,popup:!0,callback:function(){this.popups.isVisible("colors.picker")?(this.$el.find(".fr-marker").length&&(this.events.disableBlur(),this.selection.restore()),this.popups.hide("colors.picker")):this.colors.showColorsPopup()},plugin:"colors"}),o.FE.RegisterCommand("textColor",{undo:!0,callback:function(o,e){this.colors.text(e)}}),o.FE.RegisterCommand("backgroundColor",{undo:!0,callback:function(o,e){this.colors.background(e)}}),o.FE.RegisterCommand("colorChangeSet",{undo:!1,focus:!1,callback:function(o,e){var r=this.popups.get("colors.picker").find('.fr-command[data-cmd="'+o+'"][data-param1="'+e+'"]');this.colors.changeSet(r,e)}}),o.FE.DefineIcon("colorsBack",{NAME:"arrow-left"}),o.FE.RegisterCommand("colorsBack",{title:"Back",undo:!1,focus:!1,back:!0,refreshAfterCallback:!1,callback:function(){this.colors.back()}}),o.FE.RegisterCommand("customColor",{title:"OK",undo:!0,callback:function(){this.colors.customColor()}}),o.FE.DefineIcon("remove",{NAME:"eraser"})});