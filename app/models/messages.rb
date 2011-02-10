class Messages < ActiveRecord::Base
    attr_accessible :name, :email, :company, :phone, :subject, :body
end
