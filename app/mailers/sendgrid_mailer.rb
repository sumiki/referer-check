class SendgridMailer < ApplicationMailer
  default :from => 'sumikio.service@gmail.com'
  
  # send a signup email to the user, pass in the user object that   contains the user's email address
  def send_test(email)
    mail( :to => email,
          :subject => 'Test Sendmail' )
  end
end
