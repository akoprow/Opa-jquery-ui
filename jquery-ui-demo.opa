import jQueryUI

//type demo_page = { string name, ( -> xhtml) show }
//type demo = { string name, list(demo_page) pages }

module Sortable {

  demo =
    { name: "Sortable"
    , pages:
        [ {name: "Default functionality", show: default_functionality }
         ,{name: "on_update"            , show: on_update_demo }
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
    <div>
      <ul id=sortable onready={mk_sortable}>
        {List.init(mk_entry, 7)}
      </ul>
    </div>
  }

  client function on_update_demo() {
    function mk_entry(i) {
      <li id={i}><div class="alert alert-info">Item #{i}</></>
    }
    function on_update() {
      children = Dom.split(Dom.select_children(#sortable))
      l = List.map( function(d) { Dom.get_id(d) }, children)
      #sorting = "sorting is: " ^ String.concat(", ", l)
    }
    function mk_sortable(_) {
      jQueryUI.Sortable.mk_sortable(#sortable)
      jQueryUI.Sortable.disable_selection(#sortable)
      jQueryUI.Sortable.on_update(#sortable, on_update)
    }
    <div>
      <span id=sorting/>
      <ul id=sortable onready={mk_sortable}>
        {List.init(mk_entry, 7)}
      </ul>
    </div>
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
  [ { resources: @static_resource_directory("resources") }
  , { register: [
          {css: ["resources/bootstrap.css", "resources/style.css"] }
         , {js: ["resources/bootstrap.js"] }
    ]}
  , { title: "JQuery-UI in Opa", ~page }
  ]
)
