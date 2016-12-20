class CreatePurchases < ActiveRecord::Migration[5.0]
  def change
    create_table :purchases do |t|
      t.belongs_to :purchased_product, index: true, foreign_key: true
      t.belongs_to :buyer, index: true, foreign_key: true
      t.boolean :transaction

      t.timestamps
    end
  end
end
