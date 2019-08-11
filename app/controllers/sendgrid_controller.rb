class SendgridController < ApplicationController
  
  skip_before_action :verify_authenticity_token, :only => [:callback]
  before_action :authenticate, :except => [:callback]


  def index
    @email_histories = EmailHistory.order('id desc').all
  end
  
  def create
    SendgridMailer.send_test(params[:email]).deliver_now if params[:email].present?
    email_history = EmailHistory.new
    email_history.email = params[:email]
    email_history.event = 'sent'
    email_history.save
    redirect_to '/sendgrid'
  end
  
  def callback
    email_histories = []
    update_status = ["deferred", "bounce", "dropped"]
    params["_json"].each do |item|
      email_history = EmailHistory.new
      email_history.email = item['email']
      email_history.reason = item.permit!.to_h
      email_history.event = item["event"]
      email_history.save
      email_histories << email_history
    end if params["_json"]
    render plain: 'Sendgrid'
  end
  
  private

  def authenticate
    return if Rails.env == "test"
    authenticate_or_request_with_http_basic do |username, password|
      (username == "ene" && password == "pass")
    end
  end
  
end
