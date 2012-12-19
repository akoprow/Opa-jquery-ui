/** @externType Dom.private.element */

/**
 * @register {Dom.private.element -> void}
 */
function mk_sortable(dom) {
  dom.sortable();
  return js_void;
}

/**
 * @register {Dom.private.element -> void}
 */
function disable_selection(dom) {
  dom.disableSelection();
  return js_void;
}

/**
 * @register {Dom.private.element, ( -> void) -> void}
 */
function sortable_on_update(dom, on_update) {
  return dom.bind( "sortupdate", function(event, ui) { on_update(); } );
}

