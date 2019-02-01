$ ->
  $("[data-channel]").each (idx, item) ->
    console.log $(item).data()
    {id, channel, action, url} = $(item).data()
    App.cable.subscriptions.create {
      channel: channel
      id: id
      },
      received: (data) ->
         $.ajax(url)
