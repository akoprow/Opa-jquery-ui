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
