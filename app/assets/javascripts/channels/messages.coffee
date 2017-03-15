App.messages = App.cable.subscriptions.create "MessagesChannel",
  connected: ->
    # Called when the subscription is ready for use on the server
    console.log("connected");

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    console.log("client received", data)
    $(".messages").prepend(data.message)
