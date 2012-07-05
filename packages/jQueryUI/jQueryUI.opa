package jQueryUI

module jQueryUI {

  module Sortable {

    function void mk_sortable(dom) {
      elt = Dom.of_selection(dom)
      %%JQueryUI.mk_sortable%%(elt)
    }

    function void disable_selection(dom) {
      elt = Dom.of_selection(dom)
      %%JQueryUI.disable_selection%%(elt)
    }

    function void on_update(dom, f) {
      elt = Dom.of_selection(dom)
      %%JQueryUI.sortable_on_update%%(elt,f)
    }

  }
  module Draggable {
    function void mk_draggable(dom) {
      elt = Dom.of_selection(dom)
      %%JQueryUI.mk_draggable%%(elt)

    }
  }
}
