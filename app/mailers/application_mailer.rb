class ApplicationMailer < ActionMailer::Base
  default from: 'from@example.com'
  layout 'mailer'

 def send_token(email, token)
    @token = token
    mail(to: email)
 end

end
