class Stock < ApplicationRecord
  belongs_to :shop
  belongs_to :product

  # Je vais voir pour récupérer le produit direct
  scope :out_of_stock, -> { where('available = 0').pluck(:product_id) }
end
