class MessageMailer < ActionMailer::Base
  #default :from => "someone@out.there"

  def message_confirmation(message)
    @namn = message.name
    @email = message.email
    @company = message.company
    @phone = message.phone
    @message = message.body
    mail(:to => "Mona Sveholm <mona@amonrevision.se>", :bcc => "Johan Sveholm <jsveholm@gmail.com>", :subject => message.subject, :from => "#{message.name} <#{message.email}>")
  end
end
