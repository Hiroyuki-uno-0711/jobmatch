class RoomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    # 接続された時
    stream_from 'room_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    # 切断された時
  end

  def speak(message)
    message = Message.new(content: message['content'][0], user_id: message['content'][1].to_i, room_id: message['content'][2].to_i)
    message.save
    ActionCable.server.broadcast 'room_channel', content: ApplicationController.renderer.render(partial: 'rooms/message', locals: {messages: [message]})
   end

end
