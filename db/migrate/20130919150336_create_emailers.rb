class CreateEmailers < ActiveRecord::Migration
  def change
    create_table :emailers do |t|
      t.string :name
      t.integer :stage
      t.text :subject
      t.string :cc
      t.string :bcc
      t.text :header
      t.text :body
      t.text :footer

      t.timestamps
    end
  end
end
