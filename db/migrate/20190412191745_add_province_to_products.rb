class AddProvinceToProducts < ActiveRecord::Migration[5.2]
  def change
    add_reference :products, :province, foreign_key: true
  end
end