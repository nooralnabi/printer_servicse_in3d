class AddColumnToServices < ActiveRecord::Migration
  def change
    add_column :services, :address_map, :string
  end
end
