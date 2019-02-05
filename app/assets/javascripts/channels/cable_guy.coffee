$ ->
  $("[data-channel]").each (idx, element) ->
    {id, channel, action, url, event} = $(element).data()
    App.cable.subscriptions.create {
      channel: channel
      id: id
      },
      append: (element, item) ->
        element.appendChild(item)

      appendSorted: (element, item) ->
        inserted = false
        $(element).children().each (index, child) =>
          if $(item).data("sort") >= $(child).data("sort") && !inserted
            child.before(item)
            inserted = true
        if !inserted
          element.appendChild(item)
      update: (element, item) ->
        # replace the element with item

      destroy: (element) ->
        # remove element from the DOM
        # Destroy is a subcase of update, exploit 404s to your advantage :)

      received: (data) ->
        obj_id = data[event]
        return unless obj_id
        $.ajax(url.replace("$%7B%7D",obj_id)).done (data) =>
          div = document.createElement("div")
          div.innerHTML = data
          # action is append, appendSorted, update, destroy
          @[action](element, div.firstChild)
