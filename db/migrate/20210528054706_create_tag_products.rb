class CreateTagProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :tag_products do |t|
      t.integer :tag_id
      t.integer :product_id

      t.timestamps
    end
  end
end
