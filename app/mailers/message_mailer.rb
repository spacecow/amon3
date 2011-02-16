class MessageMailer < ActionMailer::Base
  #default :from => "someone@out.there"

  def message_confirmation(message)
    @namn = message.name
    @email = message.email
    @company = message.company
    @phone = message.phone
    @message = message.body
    mail(:to => "Johan Sveholm <jsveholm@gmail.com>", :cc => "Johan Sveholm <rymdtjuren@hotmail.com>", :subject => message.subject, :from => "#{message.name} <#{message.email}>")
  end
end
