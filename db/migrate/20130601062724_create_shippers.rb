class CreateShippers < ActiveRecord::Migration
  def self.up
    create_table :shippers do |t|
      t.string :name
      t.string :address_1
      t.string :address_2
      t.string :city
      t.integer :zip_code
      t.string :contact_person
      t.string :email
      t.integer :phone

      t.timestamps
    end
  end

  def self.down
    drop_table :shippers
  end
end
