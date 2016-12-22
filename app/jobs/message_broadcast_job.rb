class MessageBroadcastJob < ApplicationJob
  queue_as :default

  # 渡されてくる引数(message)を指定する
  def perform(message)
    # Do something later
    p "job起動"
    p message
    ActionCable.server.broadcast 'room_channel', message: render_message(message)
  end

  private
    def render_message(message)
      p message
      ApplicationController.renderer.render(partial: 'messages/message', locals: { message: message })
    end
end
