class CreateJbcOrders < ActiveRecord::Migration
  def change
    create_table :jbc_orders do |t|
      t.string :name
      t.string :email
      t.string :phone_number
      t.text :addres
      t.string :country
      t.string :city
      t.string :order_date
      t.string :updated_by
      t.integer :number_of_copies
      t.string :state

      t.timestamps
    end
  end
end
