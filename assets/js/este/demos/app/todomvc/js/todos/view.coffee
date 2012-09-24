###*
  @fileoverview este.demos.app.todomvc.todos.View.
###
goog.provide 'este.demos.app.todomvc.todos.View'

goog.require 'este.app.View'
goog.require 'este.demos.app.todomvc.todos.Collection'
goog.require 'este.demos.app.todomvc.todos.templates'

class este.demos.app.todomvc.todos.View extends este.app.View

  ###*
    @param {este.demos.app.todomvc.todos.Collection=} todos
    @constructor
    @extends {este.app.View}
  ###
  constructor: (todos) ->
    super()
    @todos = todos ? new este.demos.app.todomvc.todos.Collection

  ###*
    @inheritDoc
  ###
  url: ''

  ###*
    @type {este.demos.app.todomvc.todos.Collection}
    @protected
  ###
  todos: null

  ###*
    @inheritDoc
  ###
  load: (params) ->
    @localStorage.query @todos

  ###*
    @inheritDoc
  ###
  render: ->
    # json = @todos.toJson()
    # JSON.stringify json
    # JSON.stringify json
    @getElement().innerHTML = este.demos.app.todomvc.todos.templates.items()
    # console.log 'rendered'
    # # console.log products
    # links = []
    # for product in products
    #   # no url hardcoding, urls are always generated
    #   url = @getUrl este.demos.app.simple.product.View, id: product['clientId']
    #   links.push "<li><a e-href='#{url}'>#{url}</a>"

    # @getElement().innerHTML = """
    #   <p>products</p>
    #   <ul>
    #     #{links.join ''}
    #   </ul>
    # """
    return

  ###*
    @inheritDoc
  ###
  enterDocument: ->
    super()
    @on @todos, 'change', @onTodosChange

  ###*
    @param {goog.events.Event} e
    @protected
  ###
  onTodosChange: (e) ->
    # todo: persist and render