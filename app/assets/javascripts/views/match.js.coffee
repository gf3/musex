namespace 'Musex.Views', (exports) ->

  class exports.Match extends Musex.View

    tagName: 'div'
    className: 'match'

    initialize: ->
      _.bindAll @, 'render'
      @render()

    render: ->
      $el = $(@el)
      @model = @options.model

      @name = (@model.get('user'))["name"]
      @artist = "Coldplay"
      @gender = (@model.get('user'))["gender"]
      @recentArtist = "Band of Horses"
      @recentSong = "Older"
      @percentage = @model.get('score') * 2000


      $el.html Musex.Templates['match']
        textName: Musex.Greetings.matchTextName(@name)
        textArtist: Musex.Greetings.matchTextArtist(@artist, @gender)
        textRecent: Musex.Greetings.matchTextRecent(@recentSong, @recentArtist, @gender)
        matchPercentage: @percentage

      $el.find('.knob').knob
        width: 205
        height: 205
        thickness: 1
        displayInput: false
        fgColor: "#ff2b99"

      @
