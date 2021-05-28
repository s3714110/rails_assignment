class CreateCarts < ActiveRecord::Migration[5.2]
  def change
    create_table :carts do |t|
      t.string :unit
      t.integer :user_id

      t.timestamps
    end
  end
end
