App.trip = App.cable.subscriptions.create "TripChannel",
  connected: ->

  disconnected: ->
  
  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    # $(".itinerary-item-append").append data['itinerary_items']
    # alert data.itinerary_item
    $(".testing-our-append").append data.name