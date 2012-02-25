import jQueryUI

//type demo_page = { string name, ( -> xhtml) show }
//type demo = { string name, list(demo_page) pages }

module Sortable {

  demo =
    { name: "Sortable"
    , pages:
        [ {name: "Default functionality", show: default_functionality }
        ]
    }

  client function default_functionality() {
    function mk_entry(i) {
      <li><div class="alert alert-info">Item #{i}</></>
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

demos = [Sortable.demo]

function mk_demo(demo) {
  function show_demo(gen)(_event) {
    #demo = gen()
  }
  function mk_page(page) {
    <li><a onclick={show_demo(page.show)} data-toggle=tab>{page.name}</></>
  }
  function show(_) {
    #submenu =
      <ul class="nav nav-tabs nav-stacked">
        {List.map(mk_page, demo.pages)}
      </>
  }
  <li><a onclick={show} data-toggle=tab>{demo.name}</></>
}

function page() {
  <div class=container>
    <div class=row>
      <div class=span2>
        <ul id=menu class="nav nav-tabs nav-stacked">
          {List.map(mk_demo, demos)}
        </>
      </>
      <div class=span2 id=submenu />
      <div class=span8 id=demo />
    </>
  </>
}

Server.start(Server.http,
  [ {resources: @static_resource_directory("resources")}
  , {register: ["resources/bootstrap.css", "resources/style.css", "resources/bootstrap.js"]}
  , {title: "JQuery-UI in Opa", ~page}
  ]
)
