class CreateStocks < ActiveRecord::Migration[7.0]
  def change
    create_table :stocks do |t|
      t.belongs_to :product
      t.belongs_to :shop
      t.integer :available
      t.integer :booked
      t.timestamps
    end
  end
end
