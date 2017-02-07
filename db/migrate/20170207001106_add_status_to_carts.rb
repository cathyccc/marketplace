class AddStatusToCarts < ActiveRecord::Migration[5.0]
  def change
    add_reference :carts, :status, foreign_key: true
  end
end
