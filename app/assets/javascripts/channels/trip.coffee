App.trip = App.cable.subscriptions.create "TripChannel",
  connected: ->

  disconnected: ->
  
  received: (data) ->
    # $(".testing-our-append").append data.name