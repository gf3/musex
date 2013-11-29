namespace 'Musex', (exports) ->

  exports.Greetings =

    matchesHeadline: (name) ->

      line = [
        "Great taste <strong>#{name}</strong> You know who else has great taste?"
        "I like your style <strong>#{name}</strong> Look who I found for you."
        "Here we go <strong>#{name}</strong> You should #&%@ some of these people."
      ]

      index = Math.floor((Math.random()*(line.length))+1)-1

      return line[index]

    matchTextName: (name) ->

      firstPart = [
        "Maybe you should get to know"
        "You should consider"
        "Think about talking to"
      ]

      index = Math.floor((Math.random()*(firstPart.length))+1)-1

      return firstPart[index] + " <strong>#{name}</strong>"

    matchTextArtist: (artist, gender) ->

      them = if gender is 'm' then 'him' else 'her'
      their = if gender is 'm' then 'his' else 'her'

      line = [
        "You could take #{them} out to a <strong>#{artist}</strong> show and 'accidentally' spill a drink in #{their} lap"
        "Why don't you invite #{them} out for a candle-lit dinner where the house band is <strong>#{artist}</strong>. Anything could happen!"
        "You should stand below #{their} window tonight with a boombox blasting <strong>#{artist}</strong> and profess your undying love."
      ]

      index = Math.floor((Math.random()*(line.length))+1)-1

      return line[index]

    matchTextRecent: (song, artist, gender) ->

      them = if gender is 'm' then 'him' else 'her'
      they = if gender is 'm' then 'he' else 'she'

      line = [
        "#{they} just listened to <strong>#{song}</strong> by <strong>#{artist}</strong>, if you're looking for an icebreaker..."
        "#{they}'s been listening to <strong>#{song}</strong> by <strong>#{artist}</strong> lately. Go start a conversation and"
      ]

      index = Math.floor((Math.random()*(line.length))+1)-1

      return line[index] + " <a class='message'>Send #{them} a message"







