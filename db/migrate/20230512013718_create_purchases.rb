class CreatePurchases < ActiveRecord::Migration[7.0]
  def change
    create_table :purchases do |t|
      t.references :product, null: false, foreign_key: true
      t.references :client, null: false, foreign_key: true
      t.references :admin, null: false, foreign_key: true
      t.integer :quantity
      t.date :purchase_date

      t.timestamps
    end
  end
end
