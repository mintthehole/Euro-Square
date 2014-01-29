class CreateEmailerMiddles < ActiveRecord::Migration
  def change
    create_table :emailer_middles do |t|
      t.string :left
      t.string :right
      t.references :emailer

      t.timestamps
    end
    add_index :emailer_middles, :emailer_id
  end
end
