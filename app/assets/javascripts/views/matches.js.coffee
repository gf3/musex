namespace 'Musex.Views', (exports) ->

  class exports.Matches extends Musex.View

    el: 'section.find'

    initialize: ->
      _.bindAll @, 'render'
      @render()

    render: ->
      $el = $(@el)

      $el.html Musex.Templates['matches']
        greeting: Musex.Greetings.matchesHeadline("Jesse")

      match1 = new exports.Match
      match2 = new exports.Match

      $el.find('.matches-bin').append(match1.el).append(match2.el)


      @
