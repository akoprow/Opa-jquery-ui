import jQueryUI

module Sortable {

  function xhtml() {
    function mk_entry(i) {
      <li>Item #{i}</>
    }
    function mk_sortable(_) {
      jQueryUI.Sortable.mk_sortable(#sortable)
      jQueryUI.Sortable.disable_selection(#sortable)
    }
    <ul id=sortable onready={mk_sortable}>
      {List.init(mk_entry, 7)}
    </ul>
  }

}

demos = [(Sortable, "Sortable")]

function mk_demo((demo, name)) {
  function show(_) {
    #demo = demo.xhtml()
  }
  <li><a onclick={show}>{name}</></>
}

function page() {
  <div class=container>
    <div class=row>
      <div class=span2>
        <ul class="nav nav-tabs nav-stacked">
          {List.map(mk_demo, demos)}
        </>
      </>
      <div class=span10 id=demo />
    </>
  </>
}

Server.start(Server.http,
  [ {resources: @static_resource_directory("resources")}
  , {register: ["resources/bootstrap.css"]}
  , {title: "JQuery-UI in Opa", ~page}
  ]
)
