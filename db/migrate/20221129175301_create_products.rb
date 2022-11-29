class CreateProducts < ActiveRecord::Migration[7.0]
  def change
    create_table :products do |t|
      t.string :product_ref
      t.string :product_size
      t.string :product_color_code
      t.string :product_color_descr
      t.string :product_gender
      t.string :product_style
      t.string :product_type
      t.string :product_material
      t.belongs_to :brand

      t.timestamps
    end
  end
end
