class CreateAgencies < ActiveRecord::Migration
  def change
    create_table :agencies do |t|
      t.string :email
      t.string :name

      t.timestamps
    end
  end
end
