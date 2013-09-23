class CreateEmailerHorizontals < ActiveRecord::Migration
  def change
    create_table :emailer_horizontals do |t|
      t.references :emailer
      t.string :top
      t.string :bottom

      t.timestamps
    end
    add_index :emailer_horizontals, :emailer_id
  end
end
