class CreateEmployees < ActiveRecord::Migration[7.0]
  def change
    create_table :employees do |t|
      t.string :empl_code
      t.string :empl_name
      t.string :empl_surname
      t.string :empl_email
      t.string :empl_password
      t.belongs_to :shop

      t.timestamps
    end
  end
end
