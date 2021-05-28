class CreateSizeProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :size_products do |t|
      t.integer :size_id
      t.integer :product_id

      t.timestamps
    end
  end
end
