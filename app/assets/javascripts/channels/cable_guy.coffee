$ ->
  $("[data-channel]").each (idx, element) ->
    {id, channel, action, url, event} = $(element).data()
    App.cable.subscriptions.create {
      channel: channel
      id: id
      },
      append: (element, item) ->
        element.appendChild(item)

      received: (data) ->
        obj_id = data[event]
        return unless obj_id
        $.ajax(url.replace("$%7B%7D",obj_id)).done (data) =>
          div = document.createElement("div")
          div.innerHTML = data
          @[action](element, div.firstChild)
