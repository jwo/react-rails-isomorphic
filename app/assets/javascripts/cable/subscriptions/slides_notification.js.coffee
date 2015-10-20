App.slidesNotification = App.cable.subscriptions.create "SlidesChannel",
  connected: ->
    # Called once the subscription has been successfully completed

  advanceSlide: (data)->
    # tell action-cable rails to execute something
    @perform 'slides', data

  received: (data) ->
    # ok, set all slides to it
    Reveal.slide( data.indexh, data.indexv, data.indexf);
