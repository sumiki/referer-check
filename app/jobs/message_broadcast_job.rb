class MessageBroadcastJob < ApplicationJob
  queue_as :default

  def perform(email_history)
    # Do something later
    ActionCable.server.broadcast 'room_channel', render_email_history(email_history)
  end
  
  private
  
  def render_email_history(email_history)
    ApplicationController.renderer.render(partial: 'email_histories/email_history', locals: { email_history: email_history })
  end
  
end
