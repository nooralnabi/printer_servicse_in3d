class AddDetailsToServices < ActiveRecord::Migration
  def change
    add_column :services, :user_id, :integer
    add_column :services, :latitude, :float
    add_column :services, :longitude, :float
  end
end
