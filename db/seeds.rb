# Creating suppliers
suppliers = [
  { 'name' => 'ALTITUDE EYEWEAR', 'coeff' => 1.2 },
  { 'name' => 'NEW TIME', 'coeff' => 1.4 },
  { 'name' => 'MARCHON FRANCE', 'coeff' => 1.1 },
  { 'name' => 'QUICKSILVER ROXY EYEWEAR', 'coeff' => 1.2 },
  { 'name' => 'AMY GROUP-HENRY JULLIEN', 'coeff' => 1.3 },
  { 'name' => 'GRASSET ASSOCIÉ', 'coeff' => 1.4 },
  { 'name' => 'SOCODEIX', 'coeff' => 1.5 }
]

suppliers.each do |supplier|
  Supplier.create(
    supp_name: supplier['name'],
    supp_coeff: supplier['coeff']
  )
end

puts Supplier.get_supplier_id('ALTITUDE EYEWEAR')
puts '---'

# Creating brands
brands = [
  { 'name' => 'AÏE', 'supplier_id' => Supplier.get_supplier_id('ALTITUDE EYEWEAR') },
  { 'name' => 'AÏE EYEWEAR', 'supplier_id' => Supplier.get_supplier_id('NEW TIME') },
  { 'name' => 'ALTITUDE EYEWEAR', 'supplier_id' => Supplier.get_supplier_id('ALTITUDE EYEWEAR') },
  { 'name' => 'BILLABONG', 'supplier_id' => Supplier.get_supplier_id('QUICKSILVER ROXY EYEWEAR') },
  { 'name' => 'CALVIN KLEIN', 'supplier_id' => Supplier.get_supplier_id('MARCHON FRANCE') },
  { 'name' => 'CHEVIGNON', 'supplier_id' => Supplier.get_supplier_id('AMY GROUP-HENRY JULLIEN') },
  { 'name' => 'EDEN PARK', 'supplier_id' => Supplier.get_supplier_id('GRASSET ASSOCIÉ') },
  { 'name' => 'FACEL VEGA', 'supplier_id' => Supplier.get_supplier_id('SOCODEIX') },
  { 'name' => 'LACOSTE', 'supplier_id' => Supplier.get_supplier_id('MARCHON FRANCE') }
]

brands.each do |brand|
  Brand.create(
    brand_name: brand['name'],
    supplier_id: brand['supplier_id']
  )
end

# Creating products
products = [
  { 'ref' => 'LARL3002', 'size' => '50x18', 'color_code' => 'NO', 'color_descr' => 'NOIR', 'gender' => 'H', 'style' => 'TRADITIONNEL', 'type' => 'SOLAIRE', 'material' => 'PLASTIQUE', 'brand_id' => Brand.get_brand_id('AÏE') },
  { 'ref' => 'LARL4010', 'size' => '50x20', 'color_code' => 'RO', 'color_descr' => 'ROUGE', 'gender' => 'H', 'style' => 'TRADITIONNEL', 'type' => 'SOLAIRE', 'material' => 'PLASTIQUE', 'brand_id' => Brand.get_brand_id('AÏE') },
  { 'ref' => 'LARL6001', 'size' => '50x18', 'color_code' => 'NO', 'color_descr' => 'NOIR', 'gender' => 'F', 'style' => 'TRADITIONNEL', 'type' => 'SOLAIRE', 'material' => 'PLASTIQUE', 'brand_id' => Brand.get_brand_id('ALTITUDE EYEWEAR') },
  { 'ref' => 'PLC305', 'size' => '50x18', 'color_code' => 'BL', 'color_descr' => 'BLEU', 'gender' => 'M', 'style' => 'PERCÉE', 'type' => 'OPTIQUE', 'material' => 'MÉTAL', 'brand_id' => Brand.get_brand_id('AÏE EYEWEAR') },
  { 'ref' => 'PLC102', 'size' => '50x20', 'color_code' => 'NO', 'color_descr' => 'NOIR', 'gender' => 'H', 'style' => 'PERCÉE', 'type' => 'OPTIQUE', 'material' => 'MÉTAL', 'brand_id' => Brand.get_brand_id('AÏE EYEWEAR') },
]

products.each do |product|
  Product.create(
    product_ref: product['ref'],
    product_size: product['size'],
    product_color_code: product['color_code'],
    product_color_descr: product['color_descr'],
    product_gender: product['gender'],
    product_style: product['style'],
    product_type: product['type'],
    product_material: product['material'],
    brand_id: product['brand_id']
  )
end

# Creating shops
shops = [
  { 'code' => 'LKT00001', 'name' => 'LookAt', 'lat' => 43.552847, 'long' => 7.017369, 'cp' => 06400 }
]

shops.each do |shop|
  Shop.create(
    shop_code: shop['code'],
    shop_name: shop['name'],
    shop_lat: shop['lat'],
    shop_long: shop['long'],
    shop_cp: shop['cp']
  )
end

# Creating employees
employees = [
  { 'code' => 'LKS00001', 'name' => FFaker::NameFR.first_name, 'surname' => FFaker::NameFR.last_name, 'email' => FFaker::Internet.email, 'password' => FFaker::Internet.password, 'shop' => Shop.get_shop_id('LKT00001') },
  { 'code' => 'LKS00002', 'name' => FFaker::NameFR.first_name, 'surname' => FFaker::NameFR.last_name, 'email' => FFaker::Internet.email, 'password' => FFaker::Internet.password, 'shop' => Shop.get_shop_id('LKT00001') }
]

employees.each do |employee|
  Employee.create(
    empl_code: employee['code'],
    empl_name: employee['name'],
    empl_surname: employee['surname'],
    empl_email: employee['email'],
    empl_password: employee['password'],
    shop_id: employee['shop']
  )
end

# Creating stocks
Stock.create(
  product_id: Product.get_product_id('LARL3002'),
  shop_id: Shop.get_shop_id('LKT00001'),
  available: 1,
  booked: 0
)

Stock.create(
  product_id: Product.get_product_id('LARL4010'),
  shop_id: Shop.get_shop_id('LKT00001'),
  available: 0,
  booked: 0
)

Stock.create(
  product_id: Product.get_product_id('LARL6001'),
  shop_id: Shop.get_shop_id('LKT00001'),
  available: 0,
  booked: 1
)

Stock.create(
  product_id: Product.get_product_id('PLC305'),
  shop_id: Shop.get_shop_id('LKT00001'),
  available: 1,
  booked: 1
)

puts Stock.out_of_stock
# Equivalent IN en SQL (findAllById)