class <%= router_namespace %>Router extends Backbone.Router
  initialize: (options) ->
    @<%= singular_model_name %> = new <%= collection_namespace %>Collection()
    @<%= singular_model_name %>.reset options.<%= singular_model_name %>

  routes:
    "new"      : "new<%= class_name %>"
    "index"    : "index"
    ":id/edit" : "edit"
    ":id"      : "show"
    ".*"        : "index"

  new<%= class_name %>: ->
    @view = new <%= "#{view_namespace}.NewView(collection: @#{singular_name})" %>
    $("#<%= singular_name %>").html(@view.render().el)

  index: ->
    @view = new <%= "#{view_namespace}.IndexView(#{singular_name}: @#{singular_name})" %>
    $("#<%= singular_name %>").html(@view.render().el)

  show: (id) ->
    <%= singular_name %> = @<%= singular_name %>.get(id)

    @view = new <%= "#{view_namespace}.ShowView(model: #{singular_name})" %>
    $("#<%= singular_name %>").html(@view.render().el)

  edit: (id) ->
    <%= singular_name %> = @<%= singular_name %>.get(id)

    @view = new <%= "#{view_namespace}.EditView(model: #{singular_name})" %>
    $("#<%= singular_name %>").html(@view.render().el)
