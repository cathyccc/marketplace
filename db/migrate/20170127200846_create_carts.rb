class CreateCarts < ActiveRecord::Migration[5.0]
  def change
    create_table :carts do |t|
      t.references :cart_owner, references: :users, index: true

      t.timestamps
    end
  end
end
