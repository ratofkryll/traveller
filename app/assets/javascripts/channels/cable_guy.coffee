$ ->
  $("[data-channel]").each (idx, element) ->
    {id, channel, action, url, event} = $(element).data()
    App.cable.subscriptions.create {
      channel: channel
      id: id
      },
      append: (element, item) ->
        console.log(element, item)
        element.appendChild(item)

      appendSorted: (element, item) ->
        # - Search through the list of elements
        # - Compare sort parameter (start_date (trip), date (itinerary) or start_time (itinerary_item)) to each element
        # - Insert element when its sort parameter is greater than the element's

      update: (element, item) ->
        # replace the element with item

      destroy: (element) ->
        # remove element from the DOM
        # Destroy is a subcase of update, exploit 404s to your advantage :)

      received: (data) ->
        obj_id = data[event]
        console.log(data[id])
        return unless obj_id
        $.ajax(url.replace("$%7B%7D",obj_id)).done (data) =>
          div = document.createElement("div")
          div.innerHTML = data
          # action is append, appendSorted, update, destroy
          @[action](element, div.firstChild)
