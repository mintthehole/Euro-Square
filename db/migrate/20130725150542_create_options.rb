class CreateOptions < ActiveRecord::Migration
  def change
    create_table :options do |t|
      t.string :name
      t.text :address

      t.timestamps
    end
  end
end
