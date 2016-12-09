//= require jquery
//= require jquery_ujs
//= require bootstrap-sprockets
//= require pagedown_bootstrap
//= require pagedown_init
//= require moment-with-locales
//= require fullcalendar
//= require zh-tw
//= require daterangepicker
$(function() {
  return $('.wmd-output').each(function(i) {
    var content, converter;
    converter = new Markdown.Converter;
    content = $(this).html();
    return $(this).html(converter.makeHtml(content));
  });
});
