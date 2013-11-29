namespace 'Musex.Views', (exports) ->

  class exports.Matches extends Musex.View

    el: 'section.find'

    initialize: ->
      _.bindAll @, 'render', 'appendMatch'
      @render()

    render: ->
      $el = $(@el)

      myJSON = [
        {
          "score": "0.005",
          "user": {
            "id": "1",
            "name": "Jesse Lupini",
            "profile": {
              "artistCount": "171",
              "icon250": "http://rdio-b.cdn3.rdio.com/user/c/8/7/000000000011d78c/2/square-250.jpg",
              "gender": "m",
            }
          }
        },
        {
          "score": "0.01",
          "user": {
            "id": "2",
            "name": "Hingle McCringleberry",
            "profile": {
              "artistCount": "271",
              "icon250": "http://rdio-b.cdn3.rdio.com/user/c/8/7/000000000011d78c/2/square-250.jpg",
              "gender": "f",
            }
          }
        }
      ]

      $el.html Musex.Templates['matches']
        greeting: Musex.Greetings.matchesHeadline("Jesse")

      @userList = new Musex.Collections.UserList
      @userList.bind 'add', @appendMatch

      @userList.add userObj for userObj, i in myJSON


      @

    appendMatch: (object) ->
      thisMatch = new exports.Match
        model: object
      $(@el).find('.matches-bin').append(thisMatch.el)
      @





