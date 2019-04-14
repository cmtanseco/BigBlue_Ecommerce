class RemoveProvinceFromProducts < ActiveRecord::Migration[5.2]
  def change
    remove_reference :products, :province, foreign_key: true
  end
end
