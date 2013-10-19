class AddMagicColumns < ActiveRecord::Migration
  def up
  	b = BookingOrder.create(:email => 'test@123.com')
  	b.magic_columns.create(:name => "email_id", :pretty_name => 'Email Id', :is_required => true)
  	b.magic_columns.create(:name => "customer_name", :pretty_name => 'Customer Name', :is_required => true)
  end

  def down
  end
end
