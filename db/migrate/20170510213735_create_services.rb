class CreateServices < ActiveRecord::Migration
  def change
    create_table :services do |t|
      t.string :name
      t.string :details
      t.string :image
      t.string :support_required
      t.string :minimum_feature_detail
      t.string :price
      t.string :file_upload

      t.timestamps null: false
    end
  end
end
