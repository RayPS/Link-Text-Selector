if (window.top === window){

var settings = {}

safari.self.tab.dispatchMessage("request");

safari.self.addEventListener("message",function (Event) {
  settings = Event.message
}, false);

jQuery.fn.extend({
  renameAttr: function( name, newName, removeData ) {
    var val;
    return this.each(function() {
      val = jQuery.attr( this, name );
      jQuery.attr( this, newName, val );
      jQuery.removeAttr( this, name );
      // remove original data
      if (removeData){
        jQuery.removeData( this, name.replace('data-','') );
      }
    });
  }
});


$("<style>")
    .prop("type", "text/css")
    .html("\
    .lts-highlighted {\
        transition: all 0.2s ease-out;\
        color: black;\
        background-color: #e1f4ff;\
        box-shadow: 0 0 0 3px #65C0FD;\
        border-radius: 3px;\
        padding: 2px;\
        cursor: text;\
    }")
    .appendTo("head");


function Triggerkey (event){
  switch(settings.key){
  case "shiftKey":
    return event.shiftKey;
    break;
  case "ctrlKey":
    return event.ctrlKey;
    break;
  case "altKey":
    return event.altKey;
    break;
  case "metaKey":
    return event.metaKey;
    break;
  default:
    return event.shiftKey;
    break;
  }
}


$(document).keydown(function (event) {
    if (Triggerkey(event)) {
        var target = $("a:hover")

        window.setTimeout(trigger,0)
        window.setTimeout(reset,settings.delay)

        function trigger() {
            target.renameAttr("href", "href-origin")
            target.addClass('lts-highlighted')
        }

        function reset() {
            target.renameAttr("href-origin", "href")
            target.removeClass('lts-highlighted')
        }
    }
})












}