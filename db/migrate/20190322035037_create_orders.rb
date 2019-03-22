class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.datetime :orderdate
      t.integer :quantity
      t.string :status
      t.decimal :total
      t.references :customer, foreign_key: true
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
