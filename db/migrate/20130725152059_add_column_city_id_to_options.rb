class AddColumnCityIdToOptions < ActiveRecord::Migration
  def change
    add_column :options, :city_id, :integer
  end
end
