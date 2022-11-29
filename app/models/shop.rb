class Shop < ApplicationRecord
  has_many :stocks
  has_many :employees
  has_many :products, through: :stocks

  scope :get_shop_id, -> (shop_code) { where('shop_code LIKE ?', shop_code).ids[0] }
end
