# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

# $(document).on('turbolinks:load DOMContentLoaded', function() {
#   item_appender = function(content) {
#     $(".itinerary-item-append").append('hello world');
#   }
# });

$ ->
  $("div[data-trip-id]").each (idx, item) ->
    console.log(idx, item)
    App.cable.subscriptions.create {
          channel: "TripChannel"
          id: $(item).data('trip-id')
        }
