App.room = App.cable.subscriptions.create "RoomChannel",
  connected: ->
    # Called when the subscription is ready for use on the server

  disconnected: ->
    # Called when the subscription has been terminated by the server

  received: (data) ->
    # Called when there's incoming data on the websocket for this channel
    $('#messages').prepend("<p>"+data["content"]+"</p>"); # 投稿を追加


  speak: (message) ->
    @perform 'speak', content: message #サーバーサイドのspeakアクションにmessageパラメータを渡す

  jQuery(document).on 'keypress', '[data-behavior~=room_speaker]', (event) ->
    if event.keyCode is 13 # return キーのキーコードが13
      App.room.speak [event.target.value, $('[data-user]').attr('data-user'), $('[data-room]').attr('data-room')] # speak メソッド, event.target.valueを引数に.
      event.target.value = ''
      event.preventDefault()