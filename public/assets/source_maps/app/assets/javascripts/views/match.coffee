namespace 'Musex.Views', (exports) ->

  class exports.Match extends Musex.View

    tagName: 'div'
    className: 'match'

    initialize: ->
      _.bindAll @, 'render'
      @render()

    render: ->
      $el = $(@el)

      $el.html Musex.Templates['match']
        textName: Musex.Greetings.matchTextName("Jenna")
        textArtist: Musex.Greetings.matchTextArtist("Coldplay", "f")
        textRecent: Musex.Greetings.matchTextRecent("Older", "Band of Horses", "f")
        matchPercentage: "40"

      $el.find('.knob').knob
        width: 205
        height: 205
        thickness: 1
        displayInput: false
        fgColor: "#ff2b99"

      @
