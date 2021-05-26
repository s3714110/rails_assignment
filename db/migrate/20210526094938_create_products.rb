class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :name
      t.float :price
      t.text :description
      t.string :img_link
      t.integer :popularity

      t.timestamps
    end
  end
end
