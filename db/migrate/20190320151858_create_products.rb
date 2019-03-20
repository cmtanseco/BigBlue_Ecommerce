class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :price
      t.integer :stock
      t.string :size
      t.string :description
      t.references :designer, foreign_key: true
      t.references :category, foreign_key: true

      t.timestamps
    end
  end
end
