class CreateEmailTables < ActiveRecord::Migration
  def change
    create_table :email_tables do |t|
      t.integer :emailer_id
      t.string :left
      t.string :right

      t.timestamps
    end
  end
end
