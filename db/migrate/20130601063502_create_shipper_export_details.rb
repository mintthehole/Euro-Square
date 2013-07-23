class CreateShipperExportDetails < ActiveRecord::Migration
  def self.up
    create_table :shipper_export_details do |t|
      t.string :sector
      t.string :country
      t.string :mode
      t.string :f_dest
      t.string :line
      t.string :c_and_f
      t.integer :shipper_id
      t.string :cargo
      t.string :cont_size
      t.string :cargo_desc
      t.float :gr_wt
      t.integer :quantity
      t.string :units

      t.timestamps
    end
  end

  def self.down
    drop_table :shipper_export_details
  end
end
