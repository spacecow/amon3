class Message < ActiveRecord::Base
  attr_accessible :name, :email, :company, :phone, :subject, :body

  validates_presence_of :name, :email, :subject, :body
end
