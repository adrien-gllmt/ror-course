class CreateShops < ActiveRecord::Migration[7.0]
  def change
    create_table :shops do |t|
      t.string :shop_code
      t.string :shop_name
      t.float :shop_lat
      t.float :shop_long
      t.integer :shop_cp

      t.timestamps
    end
  end
end
