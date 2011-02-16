class MessageMailer < ActionMailer::Base
  #default :from => "someone@out.there"

  def message_confirmation
    mail(:to => "jsveholm@gmail.com", :subject => "WoW!", :from => "someone@out.there")
  end
end
