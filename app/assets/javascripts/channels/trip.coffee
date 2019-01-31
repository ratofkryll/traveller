App.trip = App.cable.subscriptions.create "TripChannel",

  received: (itinerary_items) ->
    # Called when there's incoming data on the websocket for this channel
    $(".itinerary-item-append").append data['itinerary_items']

  # itinerary: (data) ->
  #   @perform 'itinerary', itinerary_item: data

  # $(document).on 'submit', '[data-behavior~=submit_itinerary_item]', (event) ->
  #   App.trip.itinerary event.target.value

