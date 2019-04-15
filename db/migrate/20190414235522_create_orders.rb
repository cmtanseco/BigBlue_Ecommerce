class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.date :order_date
      t.decimal :order_total
      t.references :customer, foreign_key: true
      t.decimal :gst_amount
      t.decimal :pst_hst_amount

      t.timestamps
    end
  end
end
