class CreateSuppliers < ActiveRecord::Migration[7.0]
  def change
    create_table :suppliers do |t|
      t.string :supp_name
      t.float :supp_coeff
    end
  end
end
