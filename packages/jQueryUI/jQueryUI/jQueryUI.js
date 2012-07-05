##extern-type Dom.private.element

##register mk_sortable: Dom.private.element -> void
##args(dom)
{
    dom.sortable();
    return js_void;
}

##register disable_selection: Dom.private.element -> void
##args(dom)
{
    dom.disableSelection();
    return js_void;
}

##register sortable_on_update : Dom.private.element, ( -> void) -> void
##args(dom, on_update)
{
return dom.bind( "sortupdate", function(event, ui) { on_update(); } );
}

##register mk_draggable: Dom.private.element -> void
##args(dom)
{
    dom.draggable();
    return js_void;
}
