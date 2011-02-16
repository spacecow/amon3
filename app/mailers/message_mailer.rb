class MessageMailer < ActionMailer::Base
  #default :from => "someone@out.there"

  def message_confirmation(message)
    @namn = message.name
    @email = message.email
    @company = message.company
    @phone = message.phone
    @message = message.body
    mail(:to => "jsveholm@gmail.com", :subject => message.subject, :from => message.email)
  end
end
