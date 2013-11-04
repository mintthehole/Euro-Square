class CreateCustomers < ActiveRecord::Migration
  def change
    create_table :customers do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.string :zip_code
      t.string :contact_person
      t.string :email
      t.string :phone

      t.timestamps
    end
  end
end
