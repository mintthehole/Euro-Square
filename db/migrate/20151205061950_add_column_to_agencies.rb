class AddColumnToAgencies < ActiveRecord::Migration
  def change
    add_column :agencies, :country, :string
    add_column :agencies, :city, :string
    add_column :agencies, :sector, :string
    add_column :agencies, :network, :string
    add_column :agencies, :pics, :string
    add_column :agencies, :phone_nos, :string
    add_column :agencies, :website, :string
    add_column :agencies, :coordinator, :string
    add_column :agencies, :coordinator_email, :string
    add_column :agencies, :notes, :string
    add_column :agencies, :approved, :boolean,:default => false
  end
end
