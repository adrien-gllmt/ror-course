class Supplier < ApplicationRecord
  has_many :brands

  scope :get_supplier_id, -> (supplier) { where('supp_name LIKE ?', supplier).ids[0] }
end
