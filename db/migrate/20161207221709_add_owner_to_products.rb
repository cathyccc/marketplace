class AddOwnerToProducts < ActiveRecord::Migration[5.0]
  def change
    add_reference :products, :owner, references: :users, index: true
  end
end
