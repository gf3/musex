namespace 'Musex.Views', (exports) ->

  class exports.FindMatches extends Backbone.View

    el: 'section.find'

    initialize: ->
      _.bindAll @
      @render

    render: ->
      console.log @el
      @
