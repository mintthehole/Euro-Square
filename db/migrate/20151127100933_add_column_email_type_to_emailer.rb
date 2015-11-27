class AddColumnEmailTypeToEmailer < ActiveRecord::Migration
  def change
    add_column :emailers, :email_type, :string
    Emailer.all.each do |emailer|
    	emailer.email_type  = Emailer::BOTH
    	emailer.save
    end
  end
end
