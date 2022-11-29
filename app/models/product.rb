class Product < ApplicationRecord
  belongs_to :brand

  scope :get_product_id, -> (ref) { where('product_ref LIKE ?', ref).ids[0] }
  scope :get_products_out_of_stock, -> { where(id: Stock.out_of_stock) }
end
