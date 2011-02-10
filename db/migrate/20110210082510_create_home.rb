class CreateHome < ActiveRecord::Migration
  def self.up
    Page.create!( :menu=>"Start", :title=>"Welcome", :subtitle=>"This site will soon be filled with lots of cool functions.", :position=>0 )
  end

  def self.down
    Page.find_by_title('Welcome').destroy
  end
end
