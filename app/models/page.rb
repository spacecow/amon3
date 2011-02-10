class Page < ActiveRecord::Base
  attr_accessible :title, :content, :menu, :subtitle, :position

  validates :title, :presence => true
  validates :menu, :presence => true
  validates :position, :presence => true
end
