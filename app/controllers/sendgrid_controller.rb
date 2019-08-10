class SendgridController < ApplicationController
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
    end
    
    render plain: 'Sendgrid'
  end
  
end
