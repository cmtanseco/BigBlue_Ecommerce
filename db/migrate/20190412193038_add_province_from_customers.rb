class AddProvinceFromCustomers < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :province, :string
  end
end
