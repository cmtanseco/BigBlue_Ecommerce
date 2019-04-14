class RemoveCountryFromCustomer < ActiveRecord::Migration[5.2]
  def change
    remove_column :customers, :country, :string
  end
end
