class SetOldCustomersToNominationFalse < ActiveRecord::Migration
  def up
  	 Customer.update_all(:nomination => false)
  end

  def down
  end
end
