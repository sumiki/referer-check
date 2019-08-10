class SendgridController < ApplicationController
  
  skip_before_action :verify_authenticity_token, :only => [:callback]
  before_action :authenticate, :except => [:callback]


  def index
  end
  
  def create
    SendgridMailer.send_test('sumikio@gmail.com').deliver_now
    
    redirect_to '/sendgrid'
  end
  
  def callback
    
    params["_json"].each do |item|
      #p item['event']
      logger.debug item.permit!.to_h
      pp item.permit!.to_h
      if update_status.include?(item['event'])
        #p item.permit!.to_h.to_s.length
      end
    end if params["_json"]
    
    render plain: 'Sendgrid'
  end
  
  private

  def authenticate
    return if Rails.env == "test"
    authenticate_or_request_with_http_basic do |username, password|
      (username == "sumiki" && password == "hmb")
    end
  end
  
end
