// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery.turbolinks
//= require jquery_ujs
//= require bootstrap-sprockets
//= require pagedown_bootstrap
//= require pagedown_init
//= require moment
//= require fullcalendar
//= require zh-tw
//= require daterangepicker
//= require turbolinks
//= require_tree .
// Create a clone of the menu, right next to original.
var initialize_pagedown;
initialize_pagedown = function() {
    $(function() {
        return $('textarea.wmd-input').each(function(i, input) {
            var attr, converter, editor, help;
            attr = $(input).attr('id').split('wmd-input')[1];
            converter = new Markdown.Converter();
            Markdown.Extra.init(converter);
            help = {
                handler: function() {
                    window.open('http://daringfireball.net/projects/markdown/syntax');
                    return false;
                },
                title: "<%= I18n.t('components.markdown_editor.help', default: 'Markdown Editing Help') %>"
            };
            editor = new Markdown.Editor(converter, attr, help);
            return editor.run();
        });
    });
};
$(document).on('turbolinks:load', initialize_pagedown);
